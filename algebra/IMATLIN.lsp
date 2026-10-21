
(SDEFUN |IMATLIN;rowAllZeroes?| ((|x| (M)) (|i| (|Integer|)) (% (|Boolean|)))
        (SPROG ((|j| NIL) (#1=#:G24 NIL) (#2=#:G23 NIL) (#3=#:G22 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 11)))
                         (LETT #1# (SPADCALL |x| (QREFELT % 12))) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                       (|spadConstant| % 14) (QREFELT % 16))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G21)))
                              (GO #5=#:G19))))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |IMATLIN;colAllZeroes?| ((|x| (M)) (|j| (|Integer|)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G32 NIL) (#2=#:G31 NIL) (#3=#:G30 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                         (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                       (|spadConstant| % 14) (QREFELT % 16))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G29)))
                              (GO #5=#:G27))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;3|
        ((|x| (M)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|maxC| (|Integer|)) (|pp| (R)) (% (|Void|)))
        (SPROG ((|k1| NIL) (#1=#:G36 NIL))
               (SEQ (LETT |k1| |j|) (LETT #1# |maxC|) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF2O |x| |k| |k1|
                                  (SPADCALL (QAREF2O |x| |k| |k1| 1 1)
                                            (SPADCALL |pp|
                                                      (QAREF2O |x| |i| |k1| 1
                                                               1)
                                                      (QREFELT % 19))
                                            (QREFELT % 20))
                                  1 1)))
                    (LETT |k1| (+ |k1| 1)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;4|
        ((|x| (M)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|maxC| (|Integer|)) (|pp| (R)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|pp1| (|Integer|)) (|js| #1=(|SingleInteger|)) (|ms| #1#) (|k1| NIL)
          (#2=#:G41 NIL))
         (SEQ (LETT |pp1| (- |p| |pp|)) (LETT |js| |j|) (LETT |ms| |maxC|)
              (EXIT
               (SEQ (LETT |k1| |js|) (LETT #2# |ms|) G190
                    (COND ((|greater_SI| |k1| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF2O |x| |k| |k1|
                                  (QSMULADDMOD64_32 |pp1|
                                                    (QAREF2O |x| |i| |k1| 1 1)
                                                    (QAREF2O |x| |k| |k1| 1 1)
                                                    |p|)
                                  1 1)))
                    (LETT |k1| (|inc_SI| |k1|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5| ((|y| (M)) (% (M)))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (#1=#:G50 NIL)
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (|x| (M)) (|minR| #2=(|Integer|)) (|maxR| (|Integer|))
          (|minC| (|Integer|)) (|maxC| (|Integer|)) (|j| NIL) (#3=#:G80 NIL)
          (#4=#:G79 NIL) (#5=#:G81 NIL) (|n| (|Integer|)) (#6=#:G78 NIL)
          (|b| (R)) (#7=#:G82 NIL) (|k| NIL) (#8=#:G83 NIL) (|pp| (R))
          (|i| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ (LETT |cc| (SPADCALL (QREFELT % 25)))
                       (COND
                        ((SPADCALL |cc| (|spadConstant| % 26) (QREFELT % 27))
                         (COND
                          ((SPADCALL |cc| 1000000000 (QREFELT % 28))
                           (COND
                            ((|domainEqual| (QREFELT % 6)
                                            (|PrimeField|
                                             (PROG1 (LETT #1# |cc|)
                                               (|check_subtype2| (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))))
                             (EXIT
                              (CONS #'|IMATLIN;rowEchelon;2M;5!0|
                                    (VECTOR % |cc|)))))))))
                       (EXIT (ELT % 22))))
            (LETT |x| (SPADCALL |y| (QREFELT % 29)))
            (LETT |minR| (PROGN |x| 1))
            (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
            (LETT |minC| (PROGN |x| 1))
            (LETT |maxC| (SPADCALL |x| (QREFELT % 12))) (LETT |i| |minR|)
            (LETT |n| (- |minR| 1))
            (SEQ (LETT |j| |minC|) (LETT #3# |maxC|) G190
                 (COND ((> |j| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND ((> |i| |maxR|) (PROGN (LETT #4# |x|) (GO #9=#:G77)))
                         ('T
                          (SEQ (LETT |n| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| |i|) (LETT #5# |maxR|) G190
                                      (COND ((> |k| #5#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                    (|spadConstant| % 14)
                                                    (QREFELT % 16))
                                          (SEQ (LETT |n| |k|)
                                               (EXIT
                                                (PROGN
                                                 (LETT #6# 1)
                                                 (GO #10=#:G64))))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #10# (EXIT #6#))
                               (EXIT
                                (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                      ('T
                                       (SEQ
                                        (COND
                                         ((SPADCALL |i| |n| (QREFELT % 31))
                                          (SPADCALL |x| |i| |n|
                                                    (QREFELT % 32))))
                                        (LETT |b|
                                              (SPADCALL
                                               (QAREF2O |x| |i| |j| 1 1)
                                               (QREFELT % 33)))
                                        (QSETAREF2O |x| |i| |j|
                                                    (|spadConstant| % 30) 1 1)
                                        (SEQ (LETT |k| (+ |j| 1))
                                             (LETT #7# |maxC|) G190
                                             (COND ((> |k| #7#) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (QSETAREF2O |x| |i| |k|
                                                           (SPADCALL |b|
                                                                     (QAREF2O
                                                                      |x| |i|
                                                                      |k| 1 1)
                                                                     (QREFELT %
                                                                              19))
                                                           1 1)))
                                             (LETT |k| (+ |k| 1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (SEQ (LETT |k| |minR|)
                                             (LETT #8# |maxR|) G190
                                             (COND ((> |k| #8#) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |k| |i|
                                                           (QREFELT % 31))
                                                 (SEQ
                                                  (LETT |pp|
                                                        (QAREF2O |x| |k| |j| 1
                                                                 1))
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |pp|
                                                                (|spadConstant|
                                                                 % 14)
                                                                (QREFELT %
                                                                         34)))
                                                     (SEQ
                                                      (SPADCALL |x| |i|
                                                                (+ |j| 1) |k|
                                                                |maxC| |pp|
                                                                |row_op|)
                                                      (EXIT
                                                       (QSETAREF2O |x| |k| |j|
                                                                   (|spadConstant|
                                                                    % 14)
                                                                   1
                                                                   1)))))))))))
                                             (LETT |k| (+ |k| 1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT (LETT |i| (+ |i| 1))))))))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #9# (EXIT #4#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| %)
          (LETT |cc| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT % 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;6| ((|y| (M)) (% (|List| |Col|)))
        (SPROG
         ((|x| (M)) (|minR| (|Integer|)) (|maxR| #1=(|Integer|))
          (|minC| (|Integer|)) (|maxC| #2=(|Integer|))
          (|nrow| #3=(|NonNegativeInteger|)) (|ncol| (|NonNegativeInteger|))
          (#4=#:G85 NIL) (|rk| #3#) (#5=#:G86 NIL) (|row| #1#) (#6=#:G111 NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|)) (|i| NIL)
          (#7=#:G112 NIL) (|w| (|Col|)) (|ll| NIL) (#8=#:G114 NIL) (|k| NIL)
          (#9=#:G113 NIL) (|basis| (|List| |Col|)) (|j| #2#) (|l| (|Integer|)))
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT % 35)))
              (LETT |minR| (PROGN |x| 1))
              (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
              (LETT |minC| (PROGN |x| 1))
              (LETT |maxC| (SPADCALL |x| (QREFELT % 12)))
              (LETT |nrow| (ANROWS |x|)) (LETT |ncol| (ANCOLS |x|))
              (LETT |basis| NIL) (LETT |rk| |nrow|) (LETT |row| |maxR|)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((> |rk| 0) (|IMATLIN;rowAllZeroes?| |x| |row| %))
                            ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |rk|
                          (PROG1 (LETT #4# (- |rk| 1))
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#)))
                    (EXIT
                     (LETT |row|
                           (PROG1 (LETT #5# (- |row| 1))
                             (|check_subtype2| (>= #5# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((<= |ncol| |nrow|) (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
              (EXIT
               (COND
                ((EQL |rk| 0)
                 (SEQ
                  (SEQ (LETT |j| |minC|) (LETT #6# |maxC|) G190
                       (COND ((> |j| #6#) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| % 14)
                                        (QREFELT % 36)))
                        (SPADCALL |w| |j| (|spadConstant| % 30) (QREFELT % 37))
                        (EXIT (LETT |basis| (CONS |w| |basis|))))
                       (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))
                ('T
                 (SEQ
                  (LETT |v|
                        (SPADCALL |ncol| (- |minR| 1)
                                  (|compiledLookupCheck| '|new|
                                                         (LIST '%
                                                               (LIST
                                                                '|NonNegativeInteger|)
                                                               (LIST
                                                                '|Integer|))
                                                         (|IndexedOneDimensionalArray|
                                                          (|Integer|)
                                                          |minC|))))
                  (SEQ (LETT |i| |minR|) (LETT #7# (- (+ |minR| |rk|) 1)) G190
                       (COND ((> |i| #7#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| |minC|) G190
                             (COND
                              ((NULL
                                (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                          (|spadConstant| % 14)
                                          (QREFELT % 34)))
                               (GO G191)))
                             (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1)) (GO G190)
                             G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |v| |j| |i|
                                   (|compiledLookupCheck| '|qsetelt!|
                                                          (LIST
                                                           (LIST '|Integer|) '%
                                                           (LIST '|Integer|)
                                                           (LIST '|Integer|))
                                                          (|IndexedOneDimensionalArray|
                                                           (|Integer|)
                                                           |minC|)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |j| |maxC|) (LETT |l| (- (+ |minR| |ncol|) 1))
                  (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| % 14)
                                        (QREFELT % 36)))
                        (COND
                         ((EQL
                           (SPADCALL |v| |j|
                                     (|compiledLookupCheck| '|qelt|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '%
                                                             (LIST '|Integer|))
                                                            (|IndexedOneDimensionalArray|
                                                             (|Integer|)
                                                             |minC|)))
                           (- |minR| 1))
                          (COND
                           ((|IMATLIN;colAllZeroes?| |x| |j| %)
                            (SEQ
                             (SPADCALL |w| |l| (|spadConstant| % 30)
                                       (QREFELT % 37))
                             (EXIT (LETT |basis| (CONS |w| |basis|)))))
                           ('T
                            (SEQ
                             (SEQ (LETT |ll| |minR|) (LETT #8# (- |l| 1))
                                  (LETT |k| |minC|) (LETT #9# (- |j| 1)) G190
                                  (COND
                                   ((OR (> |k| #9#) (> |ll| #8#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |k|
                                                 (|compiledLookupCheck| '|qelt|
                                                                        (LIST
                                                                         (LIST
                                                                          '|Integer|)
                                                                         '%
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|IndexedOneDimensionalArray|
                                                                         (|Integer|)
                                                                         |minC|)))
                                       (- |minR| 1) (QREFELT % 31))
                                      (SPADCALL |w| |ll|
                                                (SPADCALL
                                                 (QAREF2O |x|
                                                          (SPADCALL |v| |k|
                                                                    (|compiledLookupCheck|
                                                                     '|qelt|
                                                                     (LIST
                                                                      (LIST
                                                                       '|Integer|)
                                                                      '%
                                                                      (LIST
                                                                       '|Integer|))
                                                                     (|IndexedOneDimensionalArray|
                                                                      (|Integer|)
                                                                      |minC|)))
                                                          |j| 1 1)
                                                 (QREFELT % 38))
                                                (QREFELT % 37))))))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |ll| (+ |ll| 1))))
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |w| |l| (|spadConstant| % 30)
                                       (QREFELT % 37))
                             (EXIT (LETT |basis| (CONS |w| |basis|))))))))
                        (LETT |j| (- |j| 1)) (EXIT (LETT |l| (- |l| 1))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;7| ((|y| (M)) (% (R)))
        (SPROG
         ((|ndim| (|NonNegativeInteger|)) (|x| (M)) (|minR| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|maxC| (|Integer|))
          (|j| NIL) (#1=#:G138 NIL) (|i| NIL) (#2=#:G137 NIL) (#3=#:G139 NIL)
          (|rown| (|Integer|)) (#4=#:G135 NIL) (#5=#:G136 NIL) (|ans| (R))
          (#6=#:G140 NIL) (|k| NIL) (#7=#:G141 NIL) (|b| (R)) (|l| NIL)
          (#8=#:G142 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |ndim| (ANROWS |y|)) (ANCOLS |y|) (QREFELT % 41))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| % 30))
            ((EQL |ndim| 1) (QAREF2O |y| (PROGN |y| 1) (PROGN |y| 1) 1 1))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT % 29)))
                  (LETT |minR| (PROGN |x| 1))
                  (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
                  (LETT |minC| (PROGN |x| 1))
                  (LETT |maxC| (SPADCALL |x| (QREFELT % 12)))
                  (LETT |ans| (|spadConstant| % 30))
                  (SEQ (LETT |j| |minC|) (LETT #1# (- |maxC| 1))
                       (LETT |i| |minR|) (LETT #2# (- |maxR| 1)) G190
                       (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                    (|spadConstant| % 14) (QREFELT % 34))
                          (SEQ (LETT |rown| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1)) (LETT #3# |maxR|)
                                      G190 (COND ((> |k| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                    (|spadConstant| % 14)
                                                    (QREFELT % 16))
                                          (PROGN
                                           (LETT #4#
                                                 (SEQ (LETT |rown| |k|)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #4# 1)
                                                        (GO #9=#:G119)))))
                                           (GO #9#))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #4#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #5# (|spadConstant| % 14))
                                  (GO #10=#:G134))))
                               (SPADCALL |x| |i| |rown| (QREFELT % 32))
                               (EXIT
                                (LETT |ans|
                                      (SPADCALL |ans| (QREFELT % 38)))))))
                        (LETT |ans|
                              (SPADCALL (QAREF2O |x| |i| |j| 1 1) |ans|
                                        (QREFELT % 19)))
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                         (QREFELT % 33))
                               (QREFELT % 38)))
                        (SEQ (LETT |l| (+ |j| 1)) (LETT #6# |maxC|) G190
                             (COND ((> |l| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (QSETAREF2O |x| |i| |l|
                                           (SPADCALL |b|
                                                     (QAREF2O |x| |i| |l| 1 1)
                                                     (QREFELT % 19))
                                           1 1)))
                             (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1)) (LETT #7# |maxR|) G190
                              (COND ((> |k| #7#) (GO G191)))
                              (SEQ (LETT |b| (QAREF2O |x| |k| |j| 1 1))
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL |b| (|spadConstant| % 14)
                                                 (QREFELT % 34)))
                                      (SEQ (LETT |l| (+ |j| 1))
                                           (LETT #8# |maxC|) G190
                                           (COND ((> |l| #8#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |l|
                                                         (SPADCALL
                                                          (QAREF2O |x| |k| |l|
                                                                   1 1)
                                                          (SPADCALL |b|
                                                                    (QAREF2O
                                                                     |x| |i|
                                                                     |l| 1 1)
                                                                    (QREFELT %
                                                                             19))
                                                          (QREFELT % 42))
                                                         1 1)))
                                           (LETT |l| (+ |l| 1)) (GO G190) G191
                                           (EXIT NIL))))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (QAREF2O |x| |maxR| |maxC| 1 1) |ans|
                             (QREFELT % 19)))))))
          #10# (EXIT #5#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;8|
        ((|x| (M)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|maxC| (|Integer|)) (|pp| (R)) (% (|Void|)))
        (SPROG ((|k1| NIL) (#1=#:G146 NIL))
               (SEQ (LETT |k1| |j|) (LETT #1# |maxC|) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |x| |k| |k1|
                                (SPADCALL
                                 (SPADCALL |x| |k| |k1| (QREFELT % 13))
                                 (SPADCALL |pp|
                                           (SPADCALL |x| |i| |k1|
                                                     (QREFELT % 13))
                                           (QREFELT % 19))
                                 (QREFELT % 20))
                                (QREFELT % 44))))
                    (LETT |k1| (+ |k1| 1)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;9|
        ((|x| (M)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|maxC| (|Integer|)) (|pp| (R)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|pp1| (|Integer|)) (|js| #1=(|SingleInteger|)) (|ms| #1#) (|k1| NIL)
          (#2=#:G151 NIL))
         (SEQ (LETT |pp1| (- |p| |pp|)) (LETT |js| |j|) (LETT |ms| |maxC|)
              (EXIT
               (SEQ (LETT |k1| |js|) (LETT #2# |ms|) G190
                    (COND ((|greater_SI| |k1| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |x| |k| |k1|
                                (QSMULADDMOD64_32 |pp1|
                                                  (SPADCALL |x| |i| |k1|
                                                            (QREFELT % 13))
                                                  (SPADCALL |x| |k| |k1|
                                                            (QREFELT % 13))
                                                  |p|)
                                (QREFELT % 44))))
                    (LETT |k1| (|inc_SI| |k1|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10| ((|y| (M)) (% (M)))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (#1=#:G158 NIL)
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (|x| (M)) (|minR| #2=(|Integer|)) (|maxR| (|Integer|))
          (|minC| (|Integer|)) (|maxC| (|Integer|)) (|j| NIL) (#3=#:G188 NIL)
          (#4=#:G187 NIL) (#5=#:G189 NIL) (|n| (|Integer|)) (#6=#:G186 NIL)
          (|b| (R)) (#7=#:G190 NIL) (|k| NIL) (#8=#:G191 NIL) (|pp| (R))
          (|i| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ (LETT |cc| (SPADCALL (QREFELT % 25)))
                       (COND
                        ((SPADCALL |cc| (|spadConstant| % 26) (QREFELT % 27))
                         (COND
                          ((SPADCALL |cc| 1000000000 (QREFELT % 28))
                           (COND
                            ((|domainEqual| (QREFELT % 6)
                                            (|PrimeField|
                                             (PROG1 (LETT #1# |cc|)
                                               (|check_subtype2| (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))))
                             (EXIT
                              (CONS #'|IMATLIN;rowEchelon;2M;10!0|
                                    (VECTOR % |cc|)))))))))
                       (EXIT (ELT % 22))))
            (LETT |x| (SPADCALL |y| (QREFELT % 29)))
            (LETT |minR| (SPADCALL |x| (QREFELT % 17)))
            (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
            (LETT |minC| (SPADCALL |x| (QREFELT % 11)))
            (LETT |maxC| (SPADCALL |x| (QREFELT % 12))) (LETT |i| |minR|)
            (LETT |n| (- |minR| 1))
            (SEQ (LETT |j| |minC|) (LETT #3# |maxC|) G190
                 (COND ((> |j| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND ((> |i| |maxR|) (PROGN (LETT #4# |x|) (GO #9=#:G185)))
                         ('T
                          (SEQ (LETT |n| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| |i|) (LETT #5# |maxR|) G190
                                      (COND ((> |k| #5#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT % 13))
                                           (|spadConstant| % 14)
                                           (QREFELT % 16))
                                          (SEQ (LETT |n| |k|)
                                               (EXIT
                                                (PROGN
                                                 (LETT #6# 1)
                                                 (GO #10=#:G172))))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #10# (EXIT #6#))
                               (EXIT
                                (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                      ('T
                                       (SEQ
                                        (COND
                                         ((SPADCALL |i| |n| (QREFELT % 31))
                                          (SPADCALL |x| |i| |n|
                                                    (QREFELT % 32))))
                                        (LETT |b|
                                              (SPADCALL
                                               (SPADCALL |x| |i| |j|
                                                         (QREFELT % 13))
                                               (QREFELT % 33)))
                                        (SPADCALL |x| |i| |j|
                                                  (|spadConstant| % 30)
                                                  (QREFELT % 44))
                                        (SEQ (LETT |k| (+ |j| 1))
                                             (LETT #7# |maxC|) G190
                                             (COND ((> |k| #7#) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (SPADCALL |x| |i| |k|
                                                         (SPADCALL |b|
                                                                   (SPADCALL
                                                                    |x| |i| |k|
                                                                    (QREFELT %
                                                                             13))
                                                                   (QREFELT %
                                                                            19))
                                                         (QREFELT % 44))))
                                             (LETT |k| (+ |k| 1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (SEQ (LETT |k| |minR|)
                                             (LETT #8# |maxR|) G190
                                             (COND ((> |k| #8#) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |k| |i|
                                                           (QREFELT % 31))
                                                 (SEQ
                                                  (LETT |pp|
                                                        (SPADCALL |x| |k| |j|
                                                                  (QREFELT %
                                                                           13)))
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |pp|
                                                                (|spadConstant|
                                                                 % 14)
                                                                (QREFELT %
                                                                         34)))
                                                     (SEQ
                                                      (SPADCALL |x| |i|
                                                                (+ |j| 1) |k|
                                                                |maxC| |pp|
                                                                |row_op|)
                                                      (EXIT
                                                       (SPADCALL |x| |k| |j|
                                                                 (|spadConstant|
                                                                  % 14)
                                                                 (QREFELT %
                                                                          44))))))))))))
                                             (LETT |k| (+ |k| 1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT (LETT |i| (+ |i| 1))))))))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #9# (EXIT #4#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| %)
          (LETT |cc| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT % 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;11| ((|y| (M)) (% (|List| |Col|)))
        (SPROG
         ((|x| (M)) (|minR| (|Integer|)) (|maxR| #1=(|Integer|))
          (|minC| (|Integer|)) (|maxC| #2=(|Integer|))
          (|nrow| #3=(|NonNegativeInteger|)) (|ncol| (|NonNegativeInteger|))
          (#4=#:G193 NIL) (|rk| #3#) (#5=#:G194 NIL) (|row| #1#)
          (#6=#:G219 NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|)) (|i| NIL)
          (#7=#:G220 NIL) (|w| (|Col|)) (|ll| NIL) (#8=#:G222 NIL) (|k| NIL)
          (#9=#:G221 NIL) (|basis| (|List| |Col|)) (|j| #2#) (|l| (|Integer|)))
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT % 35)))
              (LETT |minR| (SPADCALL |x| (QREFELT % 17)))
              (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
              (LETT |minC| (SPADCALL |x| (QREFELT % 11)))
              (LETT |maxC| (SPADCALL |x| (QREFELT % 12)))
              (LETT |nrow| (SPADCALL |x| (QREFELT % 45)))
              (LETT |ncol| (SPADCALL |x| (QREFELT % 46))) (LETT |basis| NIL)
              (LETT |rk| |nrow|) (LETT |row| |maxR|)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((> |rk| 0) (|IMATLIN;rowAllZeroes?| |x| |row| %))
                            ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |rk|
                          (PROG1 (LETT #4# (- |rk| 1))
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#)))
                    (EXIT
                     (LETT |row|
                           (PROG1 (LETT #5# (- |row| 1))
                             (|check_subtype2| (>= #5# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((<= |ncol| |nrow|) (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
              (EXIT
               (COND
                ((EQL |rk| 0)
                 (SEQ
                  (SEQ (LETT |j| |minC|) (LETT #6# |maxC|) G190
                       (COND ((> |j| #6#) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| % 14)
                                        (QREFELT % 36)))
                        (SPADCALL |w| |j| (|spadConstant| % 30) (QREFELT % 37))
                        (EXIT (LETT |basis| (CONS |w| |basis|))))
                       (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))
                ('T
                 (SEQ
                  (LETT |v|
                        (SPADCALL |ncol| (- |minR| 1)
                                  (|compiledLookupCheck| '|new|
                                                         (LIST '%
                                                               (LIST
                                                                '|NonNegativeInteger|)
                                                               (LIST
                                                                '|Integer|))
                                                         (|IndexedOneDimensionalArray|
                                                          (|Integer|)
                                                          |minC|))))
                  (SEQ (LETT |i| |minR|) (LETT #7# (- (+ |minR| |rk|) 1)) G190
                       (COND ((> |i| #7#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| |minC|) G190
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                          (|spadConstant| % 14)
                                          (QREFELT % 34)))
                               (GO G191)))
                             (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1)) (GO G190)
                             G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |v| |j| |i|
                                   (|compiledLookupCheck| '|qsetelt!|
                                                          (LIST
                                                           (LIST '|Integer|) '%
                                                           (LIST '|Integer|)
                                                           (LIST '|Integer|))
                                                          (|IndexedOneDimensionalArray|
                                                           (|Integer|)
                                                           |minC|)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |j| |maxC|) (LETT |l| (- (+ |minR| |ncol|) 1))
                  (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| % 14)
                                        (QREFELT % 36)))
                        (COND
                         ((EQL
                           (SPADCALL |v| |j|
                                     (|compiledLookupCheck| '|qelt|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '%
                                                             (LIST '|Integer|))
                                                            (|IndexedOneDimensionalArray|
                                                             (|Integer|)
                                                             |minC|)))
                           (- |minR| 1))
                          (COND
                           ((|IMATLIN;colAllZeroes?| |x| |j| %)
                            (SEQ
                             (SPADCALL |w| |l| (|spadConstant| % 30)
                                       (QREFELT % 37))
                             (EXIT (LETT |basis| (CONS |w| |basis|)))))
                           ('T
                            (SEQ
                             (SEQ (LETT |ll| |minR|) (LETT #8# (- |l| 1))
                                  (LETT |k| |minC|) (LETT #9# (- |j| 1)) G190
                                  (COND
                                   ((OR (> |k| #9#) (> |ll| #8#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |k|
                                                 (|compiledLookupCheck| '|qelt|
                                                                        (LIST
                                                                         (LIST
                                                                          '|Integer|)
                                                                         '%
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|IndexedOneDimensionalArray|
                                                                         (|Integer|)
                                                                         |minC|)))
                                       (- |minR| 1) (QREFELT % 31))
                                      (SPADCALL |w| |ll|
                                                (SPADCALL
                                                 (SPADCALL |x|
                                                           (SPADCALL |v| |k|
                                                                     (|compiledLookupCheck|
                                                                      '|qelt|
                                                                      (LIST
                                                                       (LIST
                                                                        '|Integer|)
                                                                       '%
                                                                       (LIST
                                                                        '|Integer|))
                                                                      (|IndexedOneDimensionalArray|
                                                                       (|Integer|)
                                                                       |minC|)))
                                                           |j| (QREFELT % 13))
                                                 (QREFELT % 38))
                                                (QREFELT % 37))))))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |ll| (+ |ll| 1))))
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |w| |l| (|spadConstant| % 30)
                                       (QREFELT % 37))
                             (EXIT (LETT |basis| (CONS |w| |basis|))))))))
                        (LETT |j| (- |j| 1)) (EXIT (LETT |l| (- |l| 1))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;12| ((|y| (M)) (% (R)))
        (SPROG
         ((|ndim| (|NonNegativeInteger|)) (|x| (M)) (|minR| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|maxC| (|Integer|))
          (|j| NIL) (#1=#:G246 NIL) (|i| NIL) (#2=#:G245 NIL) (#3=#:G247 NIL)
          (|rown| (|Integer|)) (#4=#:G243 NIL) (#5=#:G244 NIL) (|ans| (R))
          (#6=#:G248 NIL) (|k| NIL) (#7=#:G249 NIL) (|b| (R)) (|l| NIL)
          (#8=#:G250 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |ndim| (SPADCALL |y| (QREFELT % 45)))
                       (SPADCALL |y| (QREFELT % 46)) (QREFELT % 41))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| % 30))
            ((EQL |ndim| 1)
             (SPADCALL |y| (SPADCALL |y| (QREFELT % 17))
                       (SPADCALL |y| (QREFELT % 11)) (QREFELT % 13)))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT % 29)))
                  (LETT |minR| (SPADCALL |x| (QREFELT % 17)))
                  (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
                  (LETT |minC| (SPADCALL |x| (QREFELT % 11)))
                  (LETT |maxC| (SPADCALL |x| (QREFELT % 12)))
                  (LETT |ans| (|spadConstant| % 30))
                  (SEQ (LETT |j| |minC|) (LETT #1# (- |maxC| 1))
                       (LETT |i| |minR|) (LETT #2# (- |maxR| 1)) G190
                       (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                    (|spadConstant| % 14) (QREFELT % 34))
                          (SEQ (LETT |rown| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1)) (LETT #3# |maxR|)
                                      G190 (COND ((> |k| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT % 13))
                                           (|spadConstant| % 14)
                                           (QREFELT % 16))
                                          (PROGN
                                           (LETT #4#
                                                 (SEQ (LETT |rown| |k|)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #4# 1)
                                                        (GO #9=#:G227)))))
                                           (GO #9#))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #4#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #5# (|spadConstant| % 14))
                                  (GO #10=#:G242))))
                               (SPADCALL |x| |i| |rown| (QREFELT % 32))
                               (EXIT
                                (LETT |ans|
                                      (SPADCALL |ans| (QREFELT % 38)))))))
                        (LETT |ans|
                              (SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                        |ans| (QREFELT % 19)))
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 13))
                                         (QREFELT % 33))
                               (QREFELT % 38)))
                        (SEQ (LETT |l| (+ |j| 1)) (LETT #6# |maxC|) G190
                             (COND ((> |l| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |x| |i| |l|
                                         (SPADCALL |b|
                                                   (SPADCALL |x| |i| |l|
                                                             (QREFELT % 13))
                                                   (QREFELT % 19))
                                         (QREFELT % 44))))
                             (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1)) (LETT #7# |maxR|) G190
                              (COND ((> |k| #7#) (GO G191)))
                              (SEQ
                               (LETT |b| (SPADCALL |x| |k| |j| (QREFELT % 13)))
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL |b| (|spadConstant| % 14)
                                             (QREFELT % 34)))
                                  (SEQ (LETT |l| (+ |j| 1)) (LETT #8# |maxC|)
                                       G190 (COND ((> |l| #8#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |x| |k| |l|
                                                   (SPADCALL
                                                    (SPADCALL |x| |k| |l|
                                                              (QREFELT % 13))
                                                    (SPADCALL |b|
                                                              (SPADCALL |x| |i|
                                                                        |l|
                                                                        (QREFELT
                                                                         % 13))
                                                              (QREFELT % 19))
                                                    (QREFELT % 42))
                                                   (QREFELT % 44))))
                                       (LETT |l| (+ |l| 1)) (GO G190) G191
                                       (EXIT NIL))))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (SPADCALL |x| |maxR| |maxC| (QREFELT % 13)) |ans|
                             (QREFELT % 19)))))))
          #10# (EXIT #5#)))) 

(SDEFUN |IMATLIN;rank;MNni;13| ((|x| (M)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|rh| (|NonNegativeInteger|)) (|y| (M)) (|i| (|Integer|))
          (#1=#:G254 NIL) (|rk| (|NonNegativeInteger|)))
         (SEQ
          (LETT |y|
                (SEQ (LETT |rk| (SPADCALL |x| (QREFELT % 45)))
                     (LETT |rh| (SPADCALL |x| (QREFELT % 46)))
                     (EXIT
                      (COND
                       ((> |rk| |rh|)
                        (SEQ (LETT |rk| |rh|)
                             (EXIT (SPADCALL |x| (QREFELT % 47)))))
                       ('T (SPADCALL |x| (QREFELT % 29)))))))
          (LETT |y| (SPADCALL |y| (QREFELT % 35)))
          (LETT |i| (SPADCALL |y| (QREFELT % 18)))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((> |rk| 0) (|IMATLIN;rowAllZeroes?| |y| |i| %))
                        ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |i| (- |i| 1))
                    (EXIT
                     (LETT |rk|
                           (PROG1 (LETT #1# (- |rk| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rk|)))) 

(SDEFUN |IMATLIN;nullity;MNni;14| ((|x| (M)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G259 NIL))
               (PROG1
                   (LETT #1#
                         (- (SPADCALL |x| (QREFELT % 46))
                            (SPADCALL |x| (QREFELT % 48))))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15| ((|x| (M)) (% (M)))
        (SPROG
         ((SUP
           (|Join| (|UnivariatePolynomialCategory| R)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm| ((|OutputForm|) % (|OutputForm|)))
                    (IF (|has| R (|Canonical|))
                        (ATTRIBUTE (|Canonical|))
                        |noBranch|))))
          (FSUP
           (|Join| (|QuotientFieldCategory| SUP)
                   (CATEGORY |domain|
                    (IF (|has| SUP (|IntegerNumberSystem|))
                        (IF (|has| SUP (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| SUP (|Canonical|))
                        (IF (|has| SUP (|GcdDomain|))
                            (IF (|has| SUP (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| SUP (|UniqueFactorizationDomain|))
                        (SIGNATURE |factorFraction|
                         ((|Fraction| (|Factored| SUP)) %))
                        |noBranch|)
                    (IF (|has| SUP (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|))))
          (VFSUP
           (|Join| (|VectorCategory| FSUP)
                   (CATEGORY |domain| (SIGNATURE |vector| (% (|List| FSUP))))))
          (MATCAT2
           (CATEGORY |package|
            (SIGNATURE |map| (#1=(|Matrix| FSUP) (|Mapping| FSUP R) M))
            (SIGNATURE |map|
             ((|Union| #1# . #2=("failed"))
              (|Mapping| (|Union| FSUP . #3=("failed")) R) M))
            (SIGNATURE |reduce| (FSUP (|Mapping| FSUP R FSUP) M FSUP))))
          (MATCAT22
           (CATEGORY |package|
            (SIGNATURE |map| (M (|Mapping| R FSUP) #4=(|Matrix| FSUP)))
            (SIGNATURE |map|
             ((|Union| M . #2#) (|Mapping| (|Union| R . #3#) FSUP) #4#))
            (SIGNATURE |reduce| (R (|Mapping| R FSUP R) #4# R))))
          (|y| (|Matrix| FSUP)) (|ty| (|Matrix| FSUP)) (|var| (|Fraction| SUP))
          (#5=#:G263 NIL) (|yy| (|Matrix| FSUP)))
         (SEQ (LETT SUP (|SparseUnivariatePolynomial| (QREFELT % 6)))
              (LETT FSUP (|Fraction| SUP)) (LETT VFSUP (|Vector| FSUP))
              (LETT MATCAT2
                    (|MatrixCategoryFunctions2| (QREFELT % 6) (QREFELT % 7)
                                                (QREFELT % 8) (QREFELT % 9)
                                                FSUP VFSUP VFSUP
                                                (|Matrix| FSUP)))
              (LETT MATCAT22
                    (|MatrixCategoryFunctions2| FSUP VFSUP VFSUP
                                                (|Matrix| FSUP) (QREFELT % 6)
                                                (QREFELT % 7) (QREFELT % 8)
                                                (QREFELT % 9)))
              (LETT |y|
                    (SPADCALL
                     (CONS #'|IMATLIN;generalizedInverse;2M;15!0|
                           (VECTOR FSUP SUP %))
                     |x|
                     (|compiledLookupCheck| '|map|
                                            (LIST
                                             (LIST '|Matrix|
                                                   (|devaluate| FSUP))
                                             (LIST '|Mapping|
                                                   (|devaluate| FSUP)
                                                   (|devaluate| (ELT % 6)))
                                             (|devaluate| (ELT % 9)))
                                            MATCAT2)))
              (LETT |ty|
                    (SPADCALL |y|
                              (|compiledLookupCheck| '|transpose| (LIST '% '%)
                                                     (|Matrix| FSUP))))
              (LETT |yy|
                    (SPADCALL |ty| |y|
                              (|compiledLookupCheck| '* (LIST '% '% '%)
                                                     (|Matrix| FSUP))))
              (LETT |var|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 30) 1
                               (|compiledLookupCheck| '|monomial|
                                                      (LIST '%
                                                            (|devaluate|
                                                             (ELT % 6))
                                                            (LIST
                                                             '|NonNegativeInteger|))
                                                      SUP))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '% (|devaluate| SUP))
                                            (|Fraction| SUP))))
              (LETT |yy|
                    (SPADCALL
                     (PROG2
                         (LETT #5#
                               (SPADCALL
                                (SPADCALL |yy|
                                          (SPADCALL (ANCOLS |yy|) |var|
                                                    (|compiledLookupCheck|
                                                     '|scalarMatrix|
                                                     (LIST '%
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (|devaluate| FSUP))
                                                     (|Matrix| FSUP)))
                                          (|compiledLookupCheck| '+
                                                                 (LIST '% '%
                                                                       '%)
                                                                 (|Matrix|
                                                                  FSUP)))
                                (|compiledLookupCheck| '|inverse|
                                                       (LIST
                                                        (LIST '|Union| '%
                                                              '#6="failed")
                                                        '%)
                                                       (|Matrix| FSUP))))
                         (QCDR #5#)
                       (|check_union2| (QEQCAR #5# 0) (|Matrix| FSUP)
                                       (|Union| (|Matrix| FSUP) #6#) #5#))
                     |ty|
                     (|compiledLookupCheck| '* (LIST '% '% '%)
                                            (|Matrix| FSUP))))
              (EXIT
               (SPADCALL
                (CONS #'|IMATLIN;generalizedInverse;2M;15!1| (VECTOR SUP %))
                |yy|
                (|compiledLookupCheck| '|map|
                                       (LIST (|devaluate| (ELT % 9))
                                             (LIST '|Mapping|
                                                   (|devaluate| (ELT % 6))
                                                   (|devaluate| FSUP))
                                             (LIST '|Matrix|
                                                   (|devaluate| FSUP)))
                                       MATCAT22)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!1| ((|z1| NIL) ($$ NIL))
        (PROG (% SUP)
          (LETT % (QREFELT $$ 1))
          (LETT SUP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1| (|spadConstant| % 14)
                      (|compiledLookupCheck| '|elt|
                                             (LIST (|devaluate| (ELT % 6))
                                                   (LIST '|Fraction| '%)
                                                   (|devaluate| (ELT % 6)))
                                             SUP)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!0| ((|r1| NIL) ($$ NIL))
        (PROG (% SUP FSUP)
          (LETT % (QREFELT $$ 2))
          (LETT SUP (QREFELT $$ 1))
          (LETT FSUP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |r1|
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '% (|devaluate| (ELT % 6)))
                                              SUP))
             (|compiledLookupCheck| '|coerce| (LIST '% (|devaluate| SUP))
                                    FSUP)))))) 

(SDEFUN |IMATLIN;inv_gen| ((|x| (M)) (% (|Union| M "failed")))
        (SPROG
         ((|ndim| (|NonNegativeInteger|)) (|minR| #1=(|Integer|))
          (|maxR| (|Integer|)) (|minC| #2=(|Integer|)) (|maxC| (|Integer|))
          (|kmin| #1#) (|kmax| #3=(|Integer|)) (|lmin| #2#) (|lmax| #3#)
          (|k| NIL) (#4=#:G280 NIL) (|i| NIL) (#5=#:G279 NIL) (|l| NIL)
          (#6=#:G282 NIL) (|j| NIL) (#7=#:G281 NIL) (AB (M)))
         (SEQ
          (COND
           ((SPADCALL (LETT |ndim| (SPADCALL |x| (QREFELT % 45)))
                      (SPADCALL |x| (QREFELT % 46)) (QREFELT % 41))
            (|error| "inverse: matrix must be square"))
           ((EQL |ndim| 0) (CONS 0 |x|))
           (#8='T
            (SEQ (LETT AB (SPADCALL |ndim| (+ |ndim| |ndim|) (QREFELT % 51)))
                 (LETT |minR| (SPADCALL |x| (QREFELT % 17)))
                 (LETT |maxR| (SPADCALL |x| (QREFELT % 18)))
                 (LETT |minC| (SPADCALL |x| (QREFELT % 11)))
                 (LETT |maxC| (SPADCALL |x| (QREFELT % 12)))
                 (LETT |kmin| (SPADCALL AB (QREFELT % 17)))
                 (LETT |kmax| (- (+ |kmin| |ndim|) 1))
                 (LETT |lmin| (SPADCALL AB (QREFELT % 11)))
                 (LETT |lmax| (- (+ |lmin| |ndim|) 1))
                 (SEQ (LETT |k| |kmin|) (LETT #4# |kmax|) (LETT |i| |minR|)
                      (LETT #5# |maxR|) G190
                      (COND ((OR (> |i| #5#) (> |k| #4#)) (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lmin|) (LETT #6# |lmax|)
                            (LETT |j| |minC|) (LETT #7# |maxC|) G190
                            (COND ((OR (> |j| #7#) (> |l| #6#)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL AB |k| |l|
                                        (SPADCALL |x| |i| |j| (QREFELT % 13))
                                        (QREFELT % 44))))
                            (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL AB |k| (- (+ (+ |lmin| |ndim|) |k|) |kmin|)
                                  (|spadConstant| % 30) (QREFELT % 44))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                      (GO G190) G191 (EXIT NIL))
                 (LETT AB (SPADCALL AB (QREFELT % 35)))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL AB |kmax| |lmax| (QREFELT % 52))
                              (|spadConstant| % 14) (QREFELT % 34))
                    (CONS 1 "failed"))
                   (#8#
                    (CONS 0
                          (SPADCALL AB |kmin| |kmax| (+ |lmin| |ndim|)
                                    (+ |lmax| |ndim|) (QREFELT % 53)))))))))))) 

(SDEFUN |IMATLIN;inverse;MU;17| ((|x| (M)) (% (|Union| M "failed")))
        (SPROG ((|ans2| (M)) (|det| (R)) (|detinv| (R)))
               (SEQ
                (COND
                 ((EQL (ANROWS |x|) 2)
                  (COND
                   ((EQL (ANCOLS |x|) 2)
                    (EXIT
                     (SEQ (LETT |ans2| (SPADCALL 2 2 (QREFELT % 51)))
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |det|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |x| 1 1 (QREFELT % 52))
                                      (SPADCALL |x| 2 2 (QREFELT % 52))
                                      (QREFELT % 19))
                                     (SPADCALL
                                      (SPADCALL |x| 1 2 (QREFELT % 52))
                                      (SPADCALL |x| 2 1 (QREFELT % 52))
                                      (QREFELT % 19))
                                     (QREFELT % 20)))
                              (QREFELT % 54))
                             (CONS 1 "failed"))
                            ('T
                             (SEQ
                              (LETT |detinv| (SPADCALL |det| (QREFELT % 33)))
                              (SPADCALL |ans2| 1 1
                                        (SPADCALL
                                         (SPADCALL |x| 2 2 (QREFELT % 52))
                                         |detinv| (QREFELT % 19))
                                        (QREFELT % 55))
                              (SPADCALL |ans2| 1 2
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |x| 1 2 (QREFELT % 52))
                                          |detinv| (QREFELT % 19))
                                         (QREFELT % 38))
                                        (QREFELT % 55))
                              (SPADCALL |ans2| 2 1
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |x| 2 1 (QREFELT % 52))
                                          |detinv| (QREFELT % 19))
                                         (QREFELT % 38))
                                        (QREFELT % 55))
                              (SPADCALL |ans2| 2 2
                                        (SPADCALL
                                         (SPADCALL |x| 1 1 (QREFELT % 52))
                                         |detinv| (QREFELT % 19))
                                        (QREFELT % 55))
                              (EXIT (CONS 0 |ans2|))))))))))))
                (EXIT (|IMATLIN;inv_gen| |x| %))))) 

(SDEFUN |IMATLIN;inverse;MU;18| ((|x| (M)) (% (|Union| M "failed")))
        (|IMATLIN;inv_gen| |x| %)) 

(SDEFUN |IMATLIN;inverse;MU;19| ((|x| (M)) (% (|Union| M "failed")))
        (|IMATLIN;inv_gen| |x| %)) 

(DECLAIM (NOTINLINE |InnerMatrixLinearAlgebraFunctions;|)) 

(DEFUN |InnerMatrixLinearAlgebraFunctions;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$|
          (LIST '|InnerMatrixLinearAlgebraFunctions| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 58))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#3|
                                                            '(|shallowlyMutable|))))))
    (|haddProp| |$ConstructorCache| '|InnerMatrixLinearAlgebraFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|domainEqual| |#4| (|Matrix| |#1|))
      (PROGN
       (QSETREFV % 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;3|) %))
       (QSETREFV % 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;4|)
                  %))
       (QSETREFV % 35 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;5|) %))
       (COND
        ((|testBitVector| |pv$| 2)
         (QSETREFV % 40
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;6|) %))))
       (QSETREFV % 43
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;7|) %))))
     ('T
      (PROGN
       (QSETREFV % 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;8|) %))
       (QSETREFV % 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;9|)
                  %))
       (QSETREFV % 35 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;10|) %))
       (COND
        ((|testBitVector| |pv$| 2)
         (QSETREFV % 40
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;11|) %))))
       (QSETREFV % 43
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;12|) %)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 50
                (CONS (|dispatchFunction| |IMATLIN;generalizedInverse;2M;15|)
                      %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (COND
       ((|domainEqual| |#4| (|Matrix| |#1|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |IMATLIN;inverse;MU;17|) %)))
       ('T
        (QSETREFV % 57
                  (CONS (|dispatchFunction| |IMATLIN;inverse;MU;18|) %)))))
     ('T
      (QSETREFV % 57 (CONS (|dispatchFunction| |IMATLIN;inverse;MU;19|) %))))
    %))) 

(DEFUN |InnerMatrixLinearAlgebraFunctions| (&REST #1=#:G294)
  (SPROG NIL
         (PROG (#2=#:G295)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMatrixLinearAlgebraFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerMatrixLinearAlgebraFunctions;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerMatrixLinearAlgebraFunctions|)))))))))) 

(MAKEPROP '|InnerMatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |0|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (37 . *)
              (43 . -) (|Void|) (49 . |row_operation_base|)
              (59 . |row_operation_modular|) (|NonNegativeInteger|)
              (70 . |characteristic|) (74 . |0|) (78 . >) (84 . <)
              (90 . |copy|) (95 . |1|) (99 . ~=) (105 . |swapRows!|)
              (112 . |inv|) (117 . =) (123 . |rowEchelon|) (128 . |new|)
              (134 . |qsetelt!|) (141 . -) (|List| 8) (146 . |nullSpace|)
              (151 . ~=) (157 . +) (163 . |determinant|) (168 . |qsetelt!|)
              (176 . |nrows|) (181 . |ncols|) (186 . |transpose|)
              |IMATLIN;rank;MNni;13| |IMATLIN;nullity;MNni;14|
              (191 . |generalizedInverse|) (196 . |zero|) (202 . |elt|)
              (209 . |subMatrix|) (218 . |zero?|) (223 . |setelt!|)
              (|Union| 9 '#1="failed") (231 . |inverse|))
           '#(|row_operation_modular| 236 |row_operation_base| 247 |rowEchelon|
              257 |rank| 262 |nullity| 267 |nullSpace| 272 |inverse| 277
              |generalizedInverse| 282 |determinant| 287)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|rowEchelon| (|#4| |#4|)) T)
                                   '((|rank| ((|NonNegativeInteger|) |#4|)) T)
                                   '((|nullity| ((|NonNegativeInteger|) |#4|))
                                     T)
                                   '((|nullSpace| ((|List| |#3|) |#4|))
                                     (|has| 8 (|shallowlyMutable|)))
                                   '((|determinant| (|#1| |#4|))
                                     (|has| 6 (|Field|)))
                                   '((|generalizedInverse| (|#4| |#4|))
                                     (|has| 6 (|Field|)))
                                   '((|inverse| ((|Union| |#4| #1#) |#4|)) T)
                                   '((|row_operation_base|
                                      ((|Void|) |#4| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|) |#1|))
                                     T)
                                   '((|row_operation_modular|
                                      ((|Void|) |#4| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|) |#1|
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 57
                                            '(1 9 10 0 11 1 9 10 0 12 3 9 6 0
                                              10 10 13 0 6 0 14 2 6 15 0 0 16 1
                                              9 10 0 17 1 9 10 0 18 2 6 0 0 0
                                              19 2 6 0 0 0 20 6 0 21 9 10 10 10
                                              10 6 22 7 0 21 9 10 10 10 10 6 10
                                              23 0 6 24 25 0 24 0 26 2 24 15 0
                                              0 27 2 24 15 0 0 28 1 9 0 0 29 0
                                              6 0 30 2 10 15 0 0 31 3 9 0 0 10
                                              10 32 1 6 0 0 33 2 6 15 0 0 34 1
                                              0 9 9 35 2 8 0 24 6 36 3 8 6 0 10
                                              6 37 1 6 0 0 38 1 0 39 9 40 2 24
                                              15 0 0 41 2 6 0 0 0 42 1 0 6 9 43
                                              4 9 6 0 10 10 6 44 1 9 24 0 45 1
                                              9 24 0 46 1 9 0 0 47 1 0 9 9 50 2
                                              9 0 24 24 51 3 9 6 0 10 10 52 5 9
                                              0 0 10 10 10 10 53 1 6 15 0 54 4
                                              9 6 0 10 10 6 55 1 0 56 9 57 7 0
                                              21 9 10 10 10 10 6 10 23 6 0 21 9
                                              10 10 10 10 6 22 1 0 9 9 35 1 0
                                              24 9 48 1 0 24 9 49 1 2 39 9 40 1
                                              0 56 9 57 1 1 9 9 50 1 1 6 9
                                              43)))))
           '|lookupComplete|)) 
