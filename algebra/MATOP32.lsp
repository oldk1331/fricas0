
(SDEFUN |MATOP32;q_dot|
        ((|m1| (|U32Matrix|)) (|m2| (|U32Matrix|)) (|row1| (|Integer|))
         (|row2| (|Integer|)) (|col1| (|Integer|)) (|col2| (|Integer|))
         (|cnt| (|Integer|)) (|s| (|Integer|)) (|p| (|Integer|))
         (% (|Integer|)))
        (SPROG
         ((|ss| (|U64Int|)) (#1=#:G10 NIL) (|i| NIL) (|kk2| (|Integer|))
          (|kk1| (|Integer|)) (|cns| (|SingleInteger|)))
         (SEQ (LETT |cns| |cnt|) (LETT |ss| |s|)
              (LETT |kk1| (QMAJ_INDEX_U32 |m1| |row1| |col1|))
              (LETT |kk2| (QMAJ_INDEX_U32 |m2| |row2| |col2|))
              (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| |cns| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ss|
                           (QSMULADD64_32
                            (QMAJ_AREF_U32 |m1| (|add_SI| |kk1| |i|))
                            (QMAJ_AREF_U32 |m2| (|add_SI| |kk2| |i|)) |ss|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (QSMOD64_32 |ss| |p|))))) 

(SDEFUN |MATOP32;lower_triangular_inverse;UmUvIUm;2|
        ((|m| (|U32Matrix|)) (|ipivs| (|U32Vector|)) (|p| (|Integer|))
         (% (|U32Matrix|)))
        (SPROG
         ((|s| (|Integer|)) (#1=#:G20 NIL) (|j| NIL) (#2=#:G19 NIL) (|i| NIL)
          (|im| (|U32Matrix|)) (|nc| (|NonNegativeInteger|)))
         (SEQ (LETT |nc| (ANCOLS_U32 |m|))
              (LETT |im| (MAKE_MATRIX1_U32 |nc| |nc| 0))
              (SEQ (LETT |i| 0) (LETT #2# (- |nc| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (SETAREF2_U32 |im| (+ |i| 0) (+ |i| 0)
                                  (ELT_U32 |ipivs| |i|))
                    (EXIT
                     (SEQ (LETT |j| (+ |i| 1)) (LETT #1# (- |nc| 1)) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (LETT |s|
                                 (|MATOP32;q_dot| |m| |im| (+ |j| 0) (+ |i| 0)
                                  (+ |i| 0) (+ |i| 0) (|sub_SI| |j| |i|) 0 |p|
                                  %))
                           (LETT |s| (|sub_SI| |p| |s|))
                           (EXIT
                            (SETAREF2_U32 |im| |i| |j|
                                          (QSMOD64_32
                                           (QSMULADD64_32 (ELT_U32 |ipivs| |j|)
                                                          |s| 0)
                                           |p|))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |im|)))) 

(SDEFUN |MATOP32;triangular_multiply;2UmUvIUm;3|
        ((|m1| (|U32Matrix|)) (|m2| (|U32Matrix|)) (|pa| (|U32Vector|))
         (|p| (|Integer|)) (% (|U32Matrix|)))
        (SPROG
         ((|s| (|Integer|)) (|kk| (|NonNegativeInteger|)) (#1=#:G29 NIL)
          (|j| NIL) (#2=#:G28 NIL) (|i| NIL) (|mr| (|U32Matrix|))
          (|nc1| (|Integer|)) (|nc| (|NonNegativeInteger|)))
         (SEQ (LETT |nc| (ANCOLS_U32 |m1|)) (LETT |nc1| (- |nc| 1))
              (LETT |mr| (MAKE_MATRIX1_U32 |nc| |nc| 0))
              (SEQ (LETT |i| 0) (LETT #2# |nc1|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# |nc1|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ (LETT |kk| (MAX |i| |j|)) (LETT |s| 0)
                               (LETT |s|
                                     (|MATOP32;q_dot| |m1| |m2| |i| |j| |kk|
                                      |kk| (|inc_SI| (|sub_SI| |nc1| |kk|)) 0
                                      |p| %))
                               (EXIT
                                (SETAREF2_U32 |mr| |i| (ELT_U32 |pa| |j|)
                                              |s|)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |mr|)))) 

(SDEFUN |MATOP32;mmul;2Um2IUm;4|
        ((|m1| (|U32Matrix|)) (|m2| (|U32Matrix|)) (|d2| (|Integer|))
         (|p| (|Integer|)) (% (|U32Matrix|)))
        (SPROG
         ((|s| (|Integer|)) (#1=#:G40 NIL) (|j| NIL) (#2=#:G39 NIL) (|i| NIL)
          (|res| (|U32Matrix|)) (|nr2| (|NonNegativeInteger|))
          (|nc1| (|NonNegativeInteger|)) (|nr1| (|NonNegativeInteger|)))
         (SEQ (LETT |nr1| (ANROWS_U32 |m1|)) (LETT |nc1| (ANCOLS_U32 |m1|))
              (EXIT
               (COND
                ((OR (< (ANCOLS_U32 |m2|) |nc1|) (< (ANROWS_U32 |m2|) |d2|))
                 (|error| "mmul: m2 too small"))
                ('T
                 (SEQ (LETT |nr2| |d2|)
                      (LETT |res| (MAKE_MATRIX1_U32 |nr1| |nr2| 0))
                      (SEQ (LETT |i| 0) (LETT #2# (- |nr1| 1)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 0) (LETT #1# (- |nr2| 1)) G190
                                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                                  (SEQ (LETT |s| 0)
                                       (LETT |s|
                                             (|MATOP32;q_dot| |m1| |m2| |i| |j|
                                              0 0 |nc1| |s| |p| %))
                                       (EXIT (SETAREF2_U32 |res| |i| |j| |s|)))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATOP32;mul_mv;UvUmUvIV;5|
        ((|vr| (|U32Vector|)) (|m| (|U32Matrix|)) (|v| (|U32Vector|))
         (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|kk| (|Integer|)) (|ss| (|Integer|)) (#1=#:G49 NIL) (|j| NIL)
          (#2=#:G48 NIL) (|i| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (QV_LEN_U32 |vr|)) (LETT |nc| (ANCOLS_U32 |m|))
              (LETT |kk| 0)
              (EXIT
               (SEQ (LETT |i| 0) (LETT #2# (- |nr| 1)) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ (LETT |ss| 0)
                         (SEQ (LETT |j| 0) (LETT #1# (- |nc| 1)) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |ss|
                                      (QSMULADD64_32
                                       (QMAJ_AREF_U32 |m| (|add_SI| |kk| |j|))
                                       (ELT_U32 |v| |j|) |ss|))))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))
                         (LETT |kk| (+ |kk| |nc|))
                         (EXIT (SETELT_U32 |vr| |i| (QSMOD64_32 |ss| |p|))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |MATOP32;copy_mat_part;Um2IUm;6|
        ((|m| (|U32Matrix|)) (|nr| (|Integer|)) (|nc| (|Integer|))
         (% (|U32Matrix|)))
        (SPROG
         ((#1=#:G57 NIL) (|j| NIL) (#2=#:G56 NIL) (|i| NIL)
          (|res| (|U32Matrix|)))
         (SEQ (LETT |res| (MAKE_MATRIX1_U32 |nr| |nc| 0))
              (SEQ (LETT |i| 0) (LETT #2# (- |nr| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (- |nc| 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETAREF2_U32 |res| |i| |j|
                                          (AREF2_U32 |m| |i| |j|))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MATOP32;shift_mat!;Um3IV;7|
        ((|m| (|U32Matrix|)) (|sa| (|Integer|)) (|nr| (|Integer|))
         (|nc| (|Integer|)) (% (|Void|)))
        (SPROG ((#1=#:G64 NIL) (|j| NIL) (#2=#:G63 NIL) (|i| NIL))
               (SEQ (LETT |i| 0) (LETT #2# (- |nr| 1)) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 0) (LETT #1# (- |nc| 1)) G190
                           (COND ((|greater_SI| |j| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SETAREF2_U32 |m| |i| |j|
                                           (AREF2_U32 |m| (+ |i| |sa|) |j|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |MATOP32;inverse;UmIU;8|
        ((|m| (|U32Matrix|)) (|p| (|Integer|))
         (% (|Union| (|U32Matrix|) "failed")))
        (SPROG
         ((|tlmi| #1=(|U32Matrix|)) (#2=#:G83 NIL) (|j| NIL)
          (|nc| (|NonNegativeInteger|)) (|upi| #1#) (#3=#:G80 NIL)
          (#4=#:G81 NIL) (#5=#:G82 NIL) (|pa| #6=(|U32Vector|))
          (|tup| #7=(|U32Matrix|)) (|ipivs| #8=(|U32Vector|))
          (|lm| #9=(|U32Matrix|))
          (|lud|
           (|Record| (|:| |lpart| #9#) (|:| |upart| #7#) (|:| |udinv| #8#)
                     (|:| |ppart| #6#))))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (ANCOLS_U32 |m|))
                (EXIT
                 (COND
                  ((SPADCALL |nc| (ANROWS_U32 |m|) (QREFELT % 18))
                   (|error| "inverse: matrix not square"))
                  ('T
                   (SEQ (LETT |lud| (SPADCALL |m| |p| (QREFELT % 20)))
                        (LETT |lm| (QVELT |lud| 0))
                        (LETT |ipivs| (QVELT |lud| 2))
                        (LETT |tup| (QVELT |lud| 1))
                        (LETT |pa| (QVELT |lud| 3))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 0) (LETT #5# (- |nc| 1)) G190
                               (COND ((|greater_SI| |j| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL (ELT_U32 |ipivs| |j|) 0)
                                   (PROGN
                                    (LETT #3#
                                          (PROGN
                                           (LETT #4# (CONS 1 "failed"))
                                           (GO #10=#:G79)))
                                    (GO #11=#:G71))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL)))
                         #11# (EXIT #3#))
                        (LETT |upi| (SPADCALL |tup| |ipivs| |p| (QREFELT % 9)))
                        (LETT |nc| (ANCOLS_U32 |m|))
                        (SEQ (LETT |j| 0) (LETT #2# (- |nc| 1)) G190
                             (COND ((|greater_SI| |j| #2#) (GO G191)))
                             (SEQ (EXIT (SETELT_U32 |ipivs| |j| 1)))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |tlmi| (SPADCALL |lm| |ipivs| |p| (QREFELT % 9)))
                        (EXIT
                         (CONS 0
                               (SPADCALL |upi| |tlmi| |pa| |p|
                                         (QREFELT % 10))))))))))
          #10# (EXIT #4#)))) 

(SDEFUN |MATOP32;swapRows|
        ((|m| (|U32Matrix|)) (|i| (|Integer|)) (|j| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|tmp| (|Integer|)) (#1=#:G89 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)))
         (SEQ (LETT |nc| (ANCOLS_U32 |m|))
              (EXIT
               (SEQ (LETT |k| 0) (LETT #1# (- (+ |nc| 0) 1)) G190
                    (COND ((|greater_SI| |k| #1#) (GO G191)))
                    (SEQ (LETT |tmp| (AREF2_U32 |m| |i| |k|))
                         (SETAREF2_U32 |m| |i| |k| (AREF2_U32 |m| |j| |k|))
                         (EXIT (SETAREF2_U32 |m| |j| |k| |tmp|)))
                    (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |MATOP32;lup_decomposition;UmIR;10|
        ((|m| (|U32Matrix|)) (|p| (|Integer|))
         (%
          (|Record| (|:| |lpart| (|U32Matrix|)) (|:| |upart| (|U32Matrix|))
                    (|:| |udinv| (|U32Vector|)) (|:| |ppart| (|U32Vector|)))))
        (SPROG
         ((|s| (|Integer|)) (#1=#:G114 NIL) (|j| NIL) (#2=#:G113 NIL)
          (|ipiv| (|Integer|)) (|i1| #3=(|SingleInteger|)) (|piv| (|Integer|))
          (|tmpi| (|Integer|)) (|j0| (|SingleInteger|)) (#4=#:G112 NIL)
          (#5=#:G111 NIL) (|i| NIL) (#6=#:G110 NIL) (|ipivs| #7=(|U32Vector|))
          (|pa0| #7#) (|um| #8=(|U32Matrix|)) (|lm| #8#) (|nm1| #3#)
          (|nr1| #3#) (|nc1| #3#) (|nm| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)))
         (SEQ (LETT |nc| (ANCOLS_U32 |m|)) (LETT |nr| (ANROWS_U32 |m|))
              (LETT |nm| (MIN |nc| |nr|)) (LETT |nc1| (- |nc| 1))
              (LETT |nr1| (- |nr| 1)) (LETT |nm1| (- |nm| 1))
              (LETT |lm| (MAKE_MATRIX1_U32 |nr| |nm| 0))
              (LETT |um| (MAKE_MATRIX1_U32 |nc| |nm| 0))
              (LETT |pa0| (GETREFV_U32 |nr| 0))
              (LETT |ipivs| (GETREFV_U32 |nm| 0))
              (SEQ (LETT |j| 0) (LETT #6# |nr1|) G190
                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |pa0| |j| |j|)))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 0) (LETT #5# |nm1|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ (LETT |j0| -1)
                        (SEQ (LETT |j| |i|) (LETT #4# |nr1|) G190
                             (COND ((> |j| #4#) (GO G191)))
                             (SEQ
                              (LETT |s|
                                    (|sub_SI| |p|
                                              (AREF2_U32 |m|
                                                         (ELT_U32 |pa0| |j|)
                                                         |i|)))
                              (LETT |s|
                                    (|MATOP32;q_dot| |lm| |um| |j| |i| 0 0 |i|
                                     |s| |p| %))
                              (LETT |s|
                                    (COND ((EQL |s| 0) 0)
                                          ('T (|sub_SI| |p| |s|))))
                              (SETAREF2_U32 |lm| |j| |i| |s|)
                              (EXIT
                               (COND
                                ((|less_SI| |j0| 0)
                                 (COND
                                  ((SPADCALL |s| 0 (QREFELT % 23))
                                   (LETT |j0| |j|)))))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                        (COND
                         ((SPADCALL |j0| 0 (QREFELT % 25))
                          (COND
                           ((SPADCALL |j0| |i| (QREFELT % 23))
                            (SEQ (LETT |tmpi| (ELT_U32 |pa0| |i|))
                                 (SETELT_U32 |pa0| |i| (ELT_U32 |pa0| |j0|))
                                 (SETELT_U32 |pa0| |j0| |tmpi|)
                                 (EXIT
                                  (|MATOP32;swapRows| |lm| |i| |j0| %)))))))
                        (LETT |piv| (AREF2_U32 |lm| |i| |i|))
                        (SETAREF2_U32 |lm| |i| |i| 1) (LETT |i1| (+ |i| 1))
                        (COND
                         ((SPADCALL |j0| 0 (QREFELT % 25))
                          (SEQ
                           (LETT |ipiv| (SPADCALL |piv| |p| (QREFELT % 26)))
                           (SETELT_U32 |ipivs| |i| |ipiv|)
                           (EXIT
                            (SEQ (LETT |j| |i1|) (LETT #2# |nr1|) G190
                                 (COND ((|greater_SI| |j| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SETAREF2_U32 |lm| |j| |i|
                                                 (QSMOD64_32
                                                  (QSMULADD64_32 |ipiv|
                                                                 (AREF2_U32
                                                                  |lm| |j| |i|)
                                                                 0)
                                                  |p|))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL)))))
                         ('T (SETELT_U32 |ipivs| |i| 0)))
                        (SETAREF2_U32 |um| |i| |i| |piv|)
                        (EXIT
                         (SEQ (LETT |j| |i1|) (LETT #1# |nc1|) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (LETT |s|
                                     (|sub_SI| |p|
                                               (AREF2_U32 |m|
                                                          (ELT_U32 |pa0| |i|)
                                                          |j|)))
                               (LETT |s|
                                     (|MATOP32;q_dot| |lm| |um| |i| |j| 0 0 |i|
                                      |s| |p| %))
                               (LETT |s|
                                     (COND ((EQL |s| 0) 0)
                                           ('T (|sub_SI| |p| |s|))))
                               (EXIT (SETAREF2_U32 |um| |j| |i| |s|)))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |lm| |um| |ipivs| |pa0|))))) 

(DECLAIM (NOTINLINE |ModularU32MatrixOperations;|)) 

(DEFUN |ModularU32MatrixOperations;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularU32MatrixOperations|))
          (LETT % (GETREFV 27))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularU32MatrixOperations| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ModularU32MatrixOperations| ()
  (SPROG NIL
         (PROG (#1=#:G116)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|ModularU32MatrixOperations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularU32MatrixOperations|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|ModularU32MatrixOperations;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ModularU32MatrixOperations|)))))))))) 

(MAKEPROP '|ModularU32MatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|U32Matrix|) (|U32Vector|) (|Integer|)
              |MATOP32;lower_triangular_inverse;UmUvIUm;2|
              |MATOP32;triangular_multiply;2UmUvIUm;3| |MATOP32;mmul;2Um2IUm;4|
              (|Void|) |MATOP32;mul_mv;UvUmUvIV;5|
              |MATOP32;copy_mat_part;Um2IUm;6| |MATOP32;shift_mat!;Um3IV;7|
              (|Boolean|) (|NonNegativeInteger|) (0 . ~=)
              (|Record| (|:| |lpart| 6) (|:| |upart| 6) (|:| |udinv| 7)
                        (|:| |ppart| 7))
              |MATOP32;lup_decomposition;UmIR;10| (|Union| 6 '#1="failed")
              |MATOP32;inverse;UmIU;8| (6 . ~=) (|SingleInteger|) (12 . >=)
              (18 . |invmod|))
           '#(|triangular_multiply| 24 |shift_mat!| 32 |mul_mv| 40 |mmul| 48
              |lup_decomposition| 56 |lower_triangular_inverse| 62 |inverse| 69
              |copy_mat_part| 75)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|lower_triangular_inverse|
                                 ((|U32Matrix|) (|U32Matrix|) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|triangular_multiply|
                                 ((|U32Matrix|) (|U32Matrix|) (|U32Matrix|)
                                  (|U32Vector|) (|Integer|)))
                                T)
                              '((|mmul|
                                 ((|U32Matrix|) (|U32Matrix|) (|U32Matrix|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|mul_mv|
                                 ((|Void|) (|U32Vector|) (|U32Matrix|)
                                  (|U32Vector|) (|Integer|)))
                                T)
                              '((|copy_mat_part|
                                 ((|U32Matrix|) (|U32Matrix|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|shift_mat!|
                                 ((|Void|) (|U32Matrix|) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|inverse|
                                 ((|Union| (|U32Matrix|) #1#) (|U32Matrix|)
                                  (|Integer|)))
                                T)
                              '((|lup_decomposition|
                                 ((|Record| (|:| |lpart| (|U32Matrix|))
                                            (|:| |upart| (|U32Matrix|))
                                            (|:| |udinv| (|U32Vector|))
                                            (|:| |ppart| (|U32Vector|)))
                                  (|U32Matrix|) (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(2 17 16 0 0 18 2 8 16 0 0 23 2 24
                                              16 0 0 25 2 8 0 0 0 26 4 0 6 6 6
                                              7 8 10 4 0 12 6 8 8 8 15 4 0 12 7
                                              6 7 8 13 4 0 6 6 6 8 8 11 2 0 19
                                              6 8 20 3 0 6 6 7 8 9 2 0 21 6 8
                                              22 3 0 6 6 8 8 14)))))
           '|lookupComplete|)) 
