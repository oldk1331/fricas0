
(SDEFUN |FDALG;characteristic;Nni;1| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 10))) 

(SDEFUN |FDALG;qeltA|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (F)))
        (SPADCALL |p| (+ 1 |i|) (+ 1 |j|) |l| (QREFELT % 13))) 

(SDEFUN |FDALG;qeltv|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|)) (% (F)))
        (SPADCALL |p| (+ 1 |i|) 1 |l| (QREFELT % 13))) 

(SDEFUN |FDALG;qeltu|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|j| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|)) (% (F)))
        (SPADCALL |p| 1 (+ 1 |j|) |l| (QREFELT % 13))) 

(SDEFUN |FDALG;qlstA|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|List| F)))
        (SPADCALL |p| (+ 1 |i|) (+ 1 |j|) (QREFELT % 17))) 

(SDEFUN |FDALG;qsetu!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|alpha| (F)) (% (F)))
        (SPADCALL |p| 1 (+ 1 |i|) |l| |alpha| (QREFELT % 18))) 

(SDEFUN |FDALG;qsetA!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|alpha| (F)) (% (F)))
        (SPADCALL |p| (+ 1 |i|) (+ 1 |j|) |l| |alpha| (QREFELT % 18))) 

(SDEFUN |FDALG;qsetv!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|alpha| (F)) (% (F)))
        (SPADCALL |p| (+ 1 |i|) 1 |l| |alpha| (QREFELT % 18))) 

(SDEFUN |FDALG;qmtxu|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|j1| (|NonNegativeInteger|)) (|j2| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|Matrix| F)))
        (SPADCALL |p| 1 1 (+ 1 |j1|) (+ 1 |j2|) |l| (QREFELT % 20))) 

(SDEFUN |FDALG;qmtxA|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (|j1| (|NonNegativeInteger|)) (|j2| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|Matrix| F)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) (+ 1 |j1|) (+ 1 |j2|) |l|
                  (QREFELT % 20))) 

(SDEFUN |FDALG;qmtxv|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|Matrix| F)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) 1 1 |l| (QREFELT % 20))) 

(SDEFUN |FDALG;qscalev!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|alpha| (F))
         (% (|LinearMultivariateMatrixPencil| F)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) 1 1 |l| |alpha| (QREFELT % 21))) 

(SDEFUN |FDALG;qscale!| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SEQ
         (SPADCALL (QVELT |f| 2) (+ 1 1) (+ 1 (QVELT |f| 0)) 1 1 1 |alpha|
                   (QREFELT % 21))
         (EXIT |f|))) 

(SDEFUN |FDALG;qsetmtxu!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|j| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|a| (|Matrix| F)) (% (|Matrix| F)))
        (SPADCALL |p| 1 (+ 1 |j|) |l| |a| (QREFELT % 22))) 

(SDEFUN |FDALG;qsetmtxA!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|a| (|Matrix| F)) (% (|Matrix| F)))
        (SPADCALL |p| (+ 1 |i|) (+ 1 |j|) |l| |a| (QREFELT % 22))) 

(SDEFUN |FDALG;qsetmtxv!|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|a| (|Matrix| F)) (% (|Matrix| F)))
        (SPADCALL |p| (+ 1 |i|) 1 |l| |a| (QREFELT % 22))) 

(SDEFUN |FDALG;qzeroA?|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPADCALL |p| (+ 1 |i|) (+ 1 |j|) (QREFELT % 24))) 

(SDEFUN |FDALG;qzeromtxA?|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (|j1| (|NonNegativeInteger|)) (|j2| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) (+ 1 |j1|) (+ 1 |j2|)
                  (QREFELT % 25))) 

(SDEFUN |FDALG;qsemizeroA?|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (|j1| (|NonNegativeInteger|)) (|j2| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) (+ 1 |j1|) (+ 1 |j2|) |l|
                  (QREFELT % 26))) 

(SDEFUN |FDALG;qzerov?|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPADCALL |p| (+ 1 |i1|) (+ 1 |i2|) 1 1 (QREFELT % 25))) 

(SDEFUN |FDALG;interval;2NniL;21|
        ((|i_min| (|NonNegativeInteger|)) (|i_max| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|k| NIL) (#1=#:G268 NIL)
          (|lst_wrk| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |lst_wrk| NIL)
              (SEQ (LETT |k| |i_max|) (LETT #1# |i_min|) G190
                   (COND ((< |k| #1#) (GO G191)))
                   (SEQ (EXIT (LETT |lst_wrk| (CONS |k| |lst_wrk|))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |lst_wrk|)))) 

(SDEFUN |FDALG;qnew;Nni%;22| ((|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|lst_new| (|List| (|FreeMonoid| VAR)))
          (|lp| (|LinearMultivariateMatrixPencil| F))
          (|flg_min| #1=(|Boolean|)) (|flg_ref| #1#))
         (SEQ (LETT |lst_new| (LIST (|spadConstant| % 30)))
              (LETT |lp|
                    (SPADCALL (+ |n| 1) (+ |n| 1) (LENGTH |lst_new|)
                              (QREFELT % 31)))
              (SPADCALL |lp| 1 2 1 (|spadConstant| % 15) (QREFELT % 18))
              (LETT |flg_min| NIL) (LETT |flg_ref| NIL)
              (EXIT (VECTOR |n| |lst_new| |lp| |flg_min| |flg_ref| 'T 'T 'T))))) 

(SDEFUN |FDALG;qnew;NniL%;23|
        ((|n| (|NonNegativeInteger|)) (|lst| (|List| (|FreeMonoid| VAR)))
         (% (%)))
        (SPROG
         ((|lst_new| (|List| (|FreeMonoid| VAR)))
          (|lp| (|LinearMultivariateMatrixPencil| F))
          (|flg_min| #1=(|Boolean|)) (|flg_ref| #1#))
         (SEQ
          (LETT |lst_new|
                (CONS (|spadConstant| % 30)
                      (SPADCALL (|spadConstant| % 30) |lst| (QREFELT % 34))))
          (LETT |lp|
                (SPADCALL (+ |n| 1) (+ |n| 1) (LENGTH |lst_new|)
                          (QREFELT % 31)))
          (SPADCALL |lp| 1 2 1 (|spadConstant| % 15) (QREFELT % 18))
          (LETT |flg_min| NIL) (LETT |flg_ref| NIL)
          (EXIT (VECTOR |n| |lst_new| |lp| |flg_min| |flg_ref| 'T 'T 'T))))) 

(SDEFUN |FDALG;new;LmmpL%;24|
        ((|lp| (|LinearMultivariateMatrixPencil| F))
         (|lst| (|List| (|FreeMonoid| VAR))) (% (%)))
        (SPROG
         ((|mon| NIL) (#1=#:G283 NIL) (#2=#:G282 NIL) (#3=#:G277 NIL)
          (|n| (|NonNegativeInteger|)) (|flg_min| #4=(|Boolean|))
          (|flg_ref| #4#))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |mon| NIL) (LETT #1# |lst|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |mon| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((> (SPADCALL |mon| (QREFELT % 36)) 1)
                     (PROGN
                      (LETT #2#
                            (|error|
                             "FDALG: new(lp, lst) - monomials not linear."))
                      (GO #5=#:G275))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #2#))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lp| (QREFELT % 37))
                       (SPADCALL |lp| (QREFELT % 38)) (QREFELT % 39))
             (|error| "FDALG: new(lp,lst) - Linear Pencil is not square."))
            ((SPADCALL (LENGTH |lst|) (SPADCALL |lp| (QREFELT % 40))
                       (QREFELT % 39))
             (|error| "FDALG: new(lp,lst) - lengths do not agree."))
            ('T
             (SEQ
              (LETT |n|
                    (PROG1 (LETT #3# (- (SPADCALL |lp| (QREFELT % 37)) 1))
                      (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #3#)))
              (LETT |flg_min| NIL) (LETT |flg_ref| NIL)
              (EXIT (VECTOR |n| |lst| |lp| |flg_min| |flg_ref| 'T 'T 'T))))))))) 

(SDEFUN |FDALG;getSupport|
        ((|var| (|List| VAR)) (% (|List| (|FreeMonoid| VAR))))
        (SPROG
         ((|lst_mon| (|List| (|FreeMonoid| VAR))) (|k| NIL) (#1=#:G289 NIL))
         (SEQ
          (LETT |lst_mon|
                (SPADCALL (+ 1 (LENGTH |var|)) (|spadConstant| % 30)
                          (QREFELT % 42)))
          (SEQ (LETT |k| 1) (LETT #1# (LENGTH |var|)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |lst_mon| (+ |k| 1)
                           (SPADCALL (SPADCALL |var| |k| (QREFELT % 45))
                                     (QREFELT % 46))
                           (QREFELT % 47))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_mon|)))) 

(SDEFUN |FDALG;new;F%;26| ((|c| (F)) (% (%)))
        (SPROG ((#1=#:G293 NIL) (|als| (%)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |c| (QREFELT % 48))
                    (PROGN
                     (LETT #1# (SPADCALL (|spadConstant| % 49) (QREFELT % 51)))
                     (GO #2=#:G292))))
                  (LETT |als| (SPADCALL 1 (QREFELT % 32)))
                  (|FDALG;qsetA!| (QVELT |als| 2) 1 1 1 (|spadConstant| % 15)
                   %)
                  (|FDALG;qsetv!| (QVELT |als| 2) 1 1 |c| %)
                  (QSETVELT |als| 3 'T) (QSETVELT |als| 4 'T) (EXIT |als|)))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;new;FmF%;27| ((|m| (|FreeMonoid| VAR)) (|c| (F)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|als| (%)) (|fct| NIL) (#1=#:G314 NIL)
          (#2=#:G302 NIL) (|pos| (|NonNegativeInteger|)) (|i| NIL)
          (#3=#:G315 NIL) (|l| (|NonNegativeInteger|)) (|k| NIL)
          (#4=#:G316 NIL))
         (SEQ
          (COND
           ((SPADCALL |c| (QREFELT % 48))
            (SEQ (LETT |als| (SPADCALL 1 (QREFELT % 32)))
                 (EXIT
                  (|FDALG;qsetA!| (QVELT |als| 2) 1 1 1 (|spadConstant| % 15)
                   %))))
           ('T
            (SEQ (LETT |n| (+ (SPADCALL |m| (QREFELT % 36)) 1))
                 (LETT |als|
                       (SPADCALL |n|
                                 (|FDALG;getSupport|
                                  (SPADCALL |m| (QREFELT % 53)) %)
                                 (QREFELT % 35)))
                 (LETT |l| 0)
                 (SEQ (LETT |fct| NIL) (LETT #1# (SPADCALL |m| (QREFELT % 56)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |fct| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |pos|
                             (PROG1
                                 (LETT #2#
                                       (SPADCALL
                                        (SPADCALL (QCAR |fct|) (QREFELT % 46))
                                        (QVELT |als| 1) (QREFELT % 57)))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#)))
                       (EXIT
                        (SEQ (LETT |i| 1) (LETT #3# (QCDR |fct|)) G190
                             (COND ((|greater_SI| |i| #3#) (GO G191)))
                             (SEQ
                              (|FDALG;qsetA!| (QVELT |als| 2) (+ 1 |l|)
                               (+ (+ 1 |l|) 1) |pos|
                               (SPADCALL (|spadConstant| % 15) (QREFELT % 58))
                               %)
                              (EXIT (LETT |l| (+ |l| 1))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                      (COND ((|greater_SI| |k| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (|FDALG;qsetA!| (QVELT |als| 2) |k| |k| 1
                         (|spadConstant| % 15) %)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (EXIT (|FDALG;qsetv!| (QVELT |als| 2) |n| 1 |c| %)))))
          (QSETVELT |als| 3 'T) (QSETVELT |als| 4 'T) (EXIT |als|)))) 

(SDEFUN |FDALG;0;%;28| ((% (%)))
        (SPROG ((|als| (%)))
               (SEQ (LETT |als| (SPADCALL 1 (QREFELT % 32)))
                    (|FDALG;qsetA!| (QVELT |als| 2) 1 1 1 (|spadConstant| % 15)
                     %)
                    (QSETVELT |als| 3 'T) (QSETVELT |als| 4 'T)
                    (QSETVELT |als| 5 NIL) (QSETVELT |als| 6 NIL)
                    (QSETVELT |als| 7 NIL) (EXIT |als|)))) 

(SDEFUN |FDALG;1;%;29| ((% (%)))
        (SPROG ((|als| (%)))
               (SEQ (LETT |als| (SPADCALL 1 (QREFELT % 32)))
                    (|FDALG;qsetA!| (QVELT |als| 2) 1 1 1 (|spadConstant| % 15)
                     %)
                    (|FDALG;qsetv!| (QVELT |als| 2) 1 1 (|spadConstant| % 15)
                     %)
                    (QSETVELT |als| 3 'T) (QSETVELT |als| 4 'T)
                    (QSETVELT |als| 5 NIL) (QSETVELT |als| 6 NIL)
                    (QSETVELT |als| 7 NIL) (EXIT |als|)))) 

(SDEFUN |FDALG;copy;2%;30| ((|f| (%)) (% (%)))
        (SPROG
         ((|lmmp_new| (|LinearMultivariateMatrixPencil| F))
          (|supp_new| (|List| (|FreeMonoid| VAR))))
         (SEQ (LETT |lmmp_new| (SPADCALL (QVELT |f| 2) (QREFELT % 60)))
              (LETT |supp_new| (SPADCALL (QVELT |f| 1) (QREFELT % 61)))
              (EXIT
               (VECTOR (QVELT |f| 0) |supp_new| |lmmp_new| (QVELT |f| 3)
                       (QVELT |f| 4) 'T (QVELT |f| 6) (QVELT |f| 7)))))) 

(SDEFUN |FDALG;copy;%F%;31| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SPROG
         ((#1=#:G328 NIL) (|lmmp_new| (|LinearMultivariateMatrixPencil| F))
          (|supp_new| (|List| (|FreeMonoid| VAR))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |alpha| (QREFELT % 48))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| % 49) (QREFELT % 51)))
               (GO #2=#:G327))))
            (LETT |lmmp_new| (SPADCALL (QVELT |f| 2) (QREFELT % 60)))
            (LETT |supp_new| (SPADCALL (QVELT |f| 1) (QREFELT % 61)))
            (|FDALG;qscalev!| |lmmp_new| 1 (QVELT |f| 0) 1 |alpha| %)
            (EXIT
             (VECTOR (QVELT |f| 0) |supp_new| |lmmp_new| (QVELT |f| 3)
                     (QVELT |f| 4) 'T (QVELT |f| 6) (QVELT |f| 7)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FDALG;coerce;Fm%;32| ((|m| (|FreeMonoid| VAR)) (% (%)))
        (SPADCALL |m| (|spadConstant| % 15) (QREFELT % 59))) 

(SDEFUN |FDALG;coerce;F%;33| ((|c| (F)) (% (%)))
        (SPADCALL (|spadConstant| % 14) |c| (QREFELT % 62))) 

(SDEFUN |FDALG;enableDebugOutput;2%;34| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 6 'T) (EXIT |f|))) 

(SDEFUN |FDALG;disableDebugOutput;2%;35| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 6 NIL) (EXIT |f|))) 

(SDEFUN |FDALG;toggleDebugOutput;2%;36| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 6 (NULL (QVELT |f| 6))) (EXIT |f|))) 

(SDEFUN |FDALG;enableAlternativeOutput;2%;37| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 7 'T) (EXIT |f|))) 

(SDEFUN |FDALG;disableAlternativeOutput;2%;38| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 7 NIL) (EXIT |f|))) 

(SDEFUN |FDALG;toggleAlternativeOutput;2%;39| ((|f| (%)) (% (%)))
        (SEQ (QSETVELT |f| 7 (NULL (QVELT |f| 7))) (EXIT |f|))) 

(MAKEPROP '|FDALG;minimal?;%B;40| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 3))) 

(SDEFUN |FDALG;minimal?;%B;40| ((|f| (%)) (% (|Boolean|))) (QVELT |f| 3)) 

(MAKEPROP '|FDALG;mutable?;%B;41| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 5))) 

(SDEFUN |FDALG;mutable?;%B;41| ((|f| (%)) (% (|Boolean|))) (QVELT |f| 5)) 

(SDEFUN |FDALG;qregular?;%2NniB;42|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((|lst_ele| (|List| F)) (|i| NIL) (#1=#:G355 NIL) (#2=#:G354 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL
               (SPADCALL (QVELT |f| 2) (+ 1 |i_min|) (+ 1 |i_max|) 1
                         (QREFELT % 73)))
              (PROGN (LETT #2# NIL) (GO #3=#:G353))))
            (LETT |lst_ele|
                  (SPADCALL (QVELT |f| 2) (+ 1 |i_min|) (+ 1 |i_max|) 1
                            (QREFELT % 74)))
            (SEQ (LETT |i| 1) (LETT #1# (LENGTH |lst_ele|)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |lst_ele| |i| (QREFELT % 75))
                                (|spadConstant| % 15) (QREFELT % 76)))
                     (PROGN (LETT #2# NIL) (GO #3#))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #3# (EXIT #2#)))) 

(SDEFUN |FDALG;scalar?;%2NniB;43|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|a_lst| (|List| F)) (|k| NIL) (#1=#:G364 NIL)
          (|flg_wrk| (|Boolean|)) (#2=#:G363 NIL))
         (SEQ (LETT |a_lst| (|FDALG;qlstA| (QVELT |f| 2) |i| |j| %))
              (LETT |flg_wrk| 'T)
              (SEQ
               (EXIT
                (SEQ (LETT |k| 2) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |a_lst| |k| (QREFELT % 75))
                                    (QREFELT % 48)))
                         (SEQ (LETT |flg_wrk| NIL)
                              (EXIT
                               (PROGN
                                (LETT #2# |$NoValue|)
                                (GO #3=#:G360))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #2#))
              (EXIT |flg_wrk|)))) 

(SDEFUN |FDALG;zero?;%2NniB;44|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG ((|flg_wrk| (|Boolean|)))
               (SEQ
                (LETT |flg_wrk|
                      (COND
                       ((SPADCALL |f| |i| |j| (QREFELT % 78))
                        (SPADCALL (|FDALG;qeltA| (QVELT |f| 2) |i| |j| 1 %)
                                  (QREFELT % 48)))
                       ('T NIL)))
                (EXIT |flg_wrk|)))) 

(SDEFUN |FDALG;scalar?;%B;45| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|k| NIL) (#1=#:G377 NIL) (#2=#:G376 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> (QVELT |f| 0) 1) (PROGN (LETT #2# NIL) (GO #3=#:G375))))
                  (COND
                   ((NULL (SPADCALL |f| 1 (QVELT |f| 0) (QREFELT % 77)))
                    (PROGN (LETT #2# NIL) (GO #3#))))
                  (SEQ (LETT |k| 2) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                       (COND ((|greater_SI| |k| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QVELT |f| 2) (+ 1 1) (+ 1 (QVELT |f| 0))
                                      |k| (QREFELT % 80)))
                           (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #2#)))) 

(SDEFUN |FDALG;regular?;%B;46| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (|flg_wrk| (|Boolean|)))
               (SEQ (LETT |n| (QVELT |f| 0)) (LETT |flg_wrk| NIL)
                    (COND
                     ((EQL
                       (SPADCALL (|FDALG;qmtxA| (QVELT |f| 2) 1 |n| 1 |n| 1 %)
                                 (QREFELT % 82))
                       |n|)
                      (LETT |flg_wrk| 'T)))
                    (EXIT |flg_wrk|)))) 

(SDEFUN |FDALG;polynomialForm?| ((|f| (%)) (% (|Boolean|)))
        (SPROG
         ((|k| NIL) (#1=#:G393 NIL) (|lst_ele| (|List| F)) (|i| NIL)
          (#2=#:G394 NIL) (#3=#:G392 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL
               (SPADCALL (QVELT |f| 2) (+ 1 1) (+ 1 (QVELT |f| 0)) 1
                         (QREFELT % 84)))
              (PROGN (LETT #3# NIL) (GO #4=#:G391))))
            (SEQ (LETT |k| 2) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                 (COND ((|greater_SI| |k| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL
                      (SPADCALL (QVELT |f| 2) (+ 1 1) (+ 1 (QVELT |f| 0)) |k|
                                (QREFELT % 80)))
                     (PROGN (LETT #3# NIL) (GO #4#))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (LETT |lst_ele|
                  (SPADCALL (QVELT |f| 2) (+ 1 1) (+ 1 (QVELT |f| 0)) 1
                            (QREFELT % 74)))
            (SEQ (LETT |i| 1) (LETT #2# (LENGTH |lst_ele|)) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |lst_ele| |i| (QREFELT % 75))
                                (|spadConstant| % 15) (QREFELT % 76)))
                     (PROGN (LETT #3# NIL) (GO #4#))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |FDALG;polynomial?;%B;48| ((|f| (%)) (% (|Boolean|)))
        (|FDALG;polynomialForm?| |f| %)) 

(MAKEPROP '|FDALG;dimension;%Nni;49| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |FDALG;dimension;%Nni;49| ((|f| (%)) (% (|NonNegativeInteger|)))
        (QVELT |f| 0)) 

(SDEFUN |FDALG;variables;%L;50| ((|f| (%)) (% (|List| (|FreeMonoid| VAR))))
        (SPADCALL (QVELT |f| 1) (QREFELT % 61))) 

(SDEFUN |FDALG;elt;%NniF;51| ((|f| (%)) (|i| (|NonNegativeInteger|)) (% (F)))
        (COND
         ((OR (< |i| 1) (> |i| (QVELT |f| 0)))
          (|error| "FDALG: elt(%,i) - index out of range."))
         ('T (|FDALG;qeltv| (QVELT |f| 2) |i| 1 %)))) 

(SDEFUN |FDALG;qelt;%2NniXdp;52|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|XDistributedPolynomial| VAR F)))
        (SPROG
         ((|k| NIL) (#1=#:G406 NIL) (|a_tmp| (|XDistributedPolynomial| VAR F)))
         (SEQ (LETT |a_tmp| (|spadConstant| % 90))
              (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |a_tmp|
                           (SPADCALL |a_tmp|
                                     (SPADCALL
                                      (|FDALG;qeltA| (QVELT |f| 2) |i| |j| |k|
                                       %)
                                      (SPADCALL
                                       (SPADCALL (QVELT |f| 1) |k|
                                                 (QREFELT % 91))
                                       (QREFELT % 92))
                                      (QREFELT % 93))
                                     (QREFELT % 94)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |a_tmp|)))) 

(SDEFUN |FDALG;elt;%2NniXdp;53|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|XDistributedPolynomial| VAR F)))
        (COND
         ((OR (< |i| 1)
              (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
          (|error| "FDALG: elt(%,i,j) - index out of range."))
         ('T (SPADCALL |f| |i| |j| (QREFELT % 95))))) 

(SDEFUN |FDALG;setelt!;%Nni2F;54|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (F)) (% (F)))
        (SPROG ((|v_old| (F)))
               (SEQ
                (COND
                 ((NULL (QVELT |f| 5))
                  (|error|
                   "FDALG: setelt!(%,i,alpha) - element is not mutable."))
                 ((OR (< |i| 1) (> |i| (QVELT |f| 0)))
                  (|error| "FDALG: setelt!(%,i,alpha) - index out of range."))
                 ('T
                  (SEQ (LETT |v_old| (|FDALG;qeltv| (QVELT |f| 2) |i| 1 %))
                       (COND
                        ((NULL (SPADCALL |v_old| |alpha| (QREFELT % 76)))
                         (SEQ (|FDALG;qsetv!| (QVELT |f| 2) |i| 1 |alpha| %)
                              (QSETVELT |f| 3 NIL)
                              (EXIT (QSETVELT |f| 4 NIL)))))
                       (EXIT |alpha|))))))) 

(SDEFUN |FDALG;setelt!;%2Nni2Xdp;55|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|p| (|XDistributedPolynomial| VAR F))
         (% (|XDistributedPolynomial| VAR F)))
        (SPROG
         ((|p_old| #1=(|List| F)) (|k| NIL) (#2=#:G431 NIL) (|mon| NIL)
          (#3=#:G432 NIL) (#4=#:G425 NIL) (|pos| (|NonNegativeInteger|))
          (|p_new| #1#))
         (SEQ
          (COND
           ((NULL (QVELT |f| 5))
            (|error| "FDALG: setelt!(%,i,j,p) - element is not mutable."))
           ((NULL (|FDALG;polynomialForm?| |f| %))
            (|error|
             "FDALG: setelt!(%,i,j,p) - system not in polynomial form."))
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1))
                    (> |j| (QVELT |f| 0))))
            (|error| "FDALG: setelt!(%,i,j,p) - index out of range."))
           ('T
            (COND
             ((> |i| |j|)
              (|error| "FDALG: setelt!(%,i,j,p) - entry not above diagonal."))
             ('T
              (SEQ
               (COND
                ((NULL (SPADCALL |p| (QREFELT % 98)))
                 (COND
                  ((> (SPADCALL |p| (QREFELT % 99)) 1)
                   (EXIT
                    (|error|
                     "FDALG: setelt!(%,i,j,p) - degree higher than one."))))))
               (LETT |p_old| (|FDALG;qlstA| (QVELT |f| 2) |i| |j| %))
               (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |f| 1))) G190
                    (COND ((|greater_SI| |k| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (|FDALG;qsetA!| (QVELT |f| 2) |i| |j| |k|
                       (|spadConstant| % 50) %)))
                    (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
               (SEQ (LETT |mon| NIL)
                    (LETT #3#
                          (|FDALG;getSupport| (SPADCALL |p| (QREFELT % 100))
                           %))
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |mon| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |pos|
                           (PROG1
                               (LETT #4#
                                     (SPADCALL |mon| (QVELT |f| 1)
                                               (QREFELT % 57)))
                             (|check_subtype2| (>= #4# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #4#)))
                     (EXIT
                      (COND
                       ((EQL |pos| 0)
                        (|error|
                         "FDALG: setelt!(%,i,j,p) - monomial not available."))
                       ('T
                        (|FDALG;qsetA!| (QVELT |f| 2) |i| |j| |pos|
                         (SPADCALL |p| |mon| (QREFELT % 101)) %)))))
                    (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
               (LETT |p_new| (|FDALG;qlstA| (QVELT |f| 2) |i| |j| %))
               (COND
                ((NULL (SPADCALL |p_old| |p_new| (QREFELT % 102)))
                 (QSETVELT |f| 3 NIL)))
               (EXIT |p|))))))))) 

(SDEFUN |FDALG;vector;%M;56| ((|f| (%)) (% (|Matrix| F)))
        (|FDALG;qmtxv| (QVELT |f| 2) 1 (QVELT |f| 0) 1 %)) 

(SDEFUN |FDALG;vector;%M;57|
        ((|f| (%)) (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|v_tmp| (|Matrix| F))
          (|v_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|i| NIL)
          (#1=#:G439 NIL))
         (SEQ (LETT |v_tmp| (|FDALG;qmtxv| (QVELT |f| 2) 1 (QVELT |f| 0) 1 %))
              (LETT |v_wrk|
                    (MAKE_MATRIX1 (ANROWS |v_tmp|) 1 (|spadConstant| % 90)))
              (SEQ (LETT |i| 1) (LETT #1# (ANROWS |v_tmp|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |v_wrk| |i| 1
                                 (SPADCALL (QAREF2O |v_tmp| |i| 1 1 1)
                                           (QREFELT % 105))
                                 1 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |v_wrk|)))) 

(SDEFUN |FDALG;matrix;%FmM;58|
        ((|f| (%)) (|m| (|FreeMonoid| VAR)) (% (|Matrix| F)))
        (SPROG ((#1=#:G440 NIL) (|pos| (|NonNegativeInteger|)))
               (SEQ
                (LETT |pos|
                      (PROG1
                          (LETT #1#
                                (SPADCALL |m| (QVELT |f| 1) (QREFELT % 57)))
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                (EXIT
                 (COND
                  ((EQL |pos| 0)
                   (|error| "FDALG: matrix(%,m) - monoid not available."))
                  ('T
                   (|FDALG;qmtxA| (QVELT |f| 2) 1 (QVELT |f| 0) 1 (QVELT |f| 0)
                    |pos| %))))))) 

(SDEFUN |FDALG;matrix;%M;59|
        ((|f| (%)) (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|A_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|k| NIL)
          (#1=#:G453 NIL) (|A_tmp| (|Matrix| F)) (|i| NIL) (#2=#:G454 NIL)
          (|j| NIL) (#3=#:G455 NIL))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |A_wrk| (MAKE_MATRIX1 |n| |n| (|spadConstant| % 90)))
              (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (LETT |A_tmp|
                          (|FDALG;qmtxA| (QVELT |f| 2) 1 (QVELT |f| 0) 1
                           (QVELT |f| 0) |k| %))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                                 (COND ((|greater_SI| |j| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_wrk| |i| |j|
                                               (SPADCALL
                                                (QAREF2O |A_wrk| |i| |j| 1 1)
                                                (SPADCALL
                                                 (QAREF2O |A_tmp| |i| |j| 1 1)
                                                 (SPADCALL
                                                  (SPADCALL (QVELT |f| 1) |k|
                                                            (QREFELT % 91))
                                                  (QREFELT % 92))
                                                 (QREFELT % 93))
                                                (QREFELT % 94))
                                               1 1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |A_wrk|)))) 

(SDEFUN |FDALG;appendSupport!;%L%;60|
        ((|f| (%)) (|lst| (|List| (|FreeMonoid| VAR))) (% (%)))
        (SPROG
         ((|mon| NIL) (#1=#:G463 NIL) (#2=#:G457 NIL)
          (|pos| (|NonNegativeInteger|))
          (|lst_new| (|List| (|FreeMonoid| VAR))))
         (SEQ (LETT |lst_new| NIL)
              (SEQ (LETT |mon| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mon| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pos|
                          (PROG1
                              (LETT #2#
                                    (SPADCALL |mon| (QVELT |f| 1)
                                              (QREFELT % 57)))
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#)))
                    (EXIT
                     (COND
                      ((ZEROP |pos|)
                       (LETT |lst_new| (CONS |mon| |lst_new|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((> (LENGTH |lst_new|) 0)
                (SPADCALL (QVELT |f| 2) (LENGTH |lst_new|) (QREFELT % 110))))
              (QSETVELT |f| 1
                        (SPADCALL (QVELT |f| 1) |lst_new| (QREFELT % 111)))
              (EXIT |f|)))) 

(MAKEPROP '|FDALG;pencil;%Lmmp;61| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |FDALG;pencil;%Lmmp;61|
        ((|f| (%)) (% (|LinearMultivariateMatrixPencil| F))) (QVELT |f| 2)) 

(SDEFUN |FDALG;qswapRows!;%2Nni%;62|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((NULL (EQL |i| |j|))
           (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) (QREFELT % 114))))
         (EXIT |f|))) 

(SDEFUN |FDALG;swapRows!;%2Nni%;63|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error| "FDALG: swapRows!(%,i,j) - index/indices out of range."))
          ('T
           (SEQ
            (COND
             ((NULL (EQL |i| |j|))
              (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) (QREFELT % 114))))
            (QSETVELT |f| 4 NIL) (EXIT |f|)))))) 

(SDEFUN |FDALG;qaddRows!;%2NniF%;64|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((NULL (EQL |i| |j|))
           (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                     (QREFELT % 117))))
         (EXIT |f|))) 

(SDEFUN |FDALG;addRowsColumns!;%2NniF%;65|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "FDALG: addRowsColumns!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: addRowsColumns!(%,i,j,alpha) - index/indices out of range."))
          ('T
           (COND
            ((EQL |j| 1)
             (|error|
              "FDALG: addRowsColumns!(%,i,j,alpha) - first column must not be used."))
            ('T
             (SEQ
              (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                        (QREFELT % 117))
              (SPADCALL (QVELT |f| 2) (+ 1 |j|) (+ 1 |i|)
                        (SPADCALL |alpha| (QREFELT % 58)) (QREFELT % 119))
              (COND ((< |i| |j|) (QSETVELT |f| 4 NIL))) (EXIT |f|)))))))) 

(SDEFUN |FDALG;addColumnsRows!;%2NniF%;66|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "FDALG: addColumnsRows!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: addColumnsRows!(%,i,j,alpha) - index/indices out of range."))
          ('T
           (COND
            ((EQL |i| 1)
             (|error|
              "FDALG: addColumnsRows!(%,i,j,alpha) - first column must not be used."))
            ('T
             (SEQ
              (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                        (QREFELT % 119))
              (SPADCALL (QVELT |f| 2) (+ 1 |j|) (+ 1 |i|)
                        (SPADCALL |alpha| (QREFELT % 58)) (QREFELT % 117))
              (EXIT |f|)))))))) 

(SDEFUN |FDALG;addRows!;%2NniF%;67|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "FDALG: addRows!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: addRows!(%,i,j,alpha) - index/indices out of range."))
          ('T
           (SEQ
            (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                      (QREFELT % 122))
            (COND ((< |i| |j|) (QSETVELT |f| 4 NIL))) (EXIT |f|)))))) 

(SDEFUN |FDALG;qmultiplyRow!|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (F)) (% (%)))
        (SEQ (SPADCALL (QVELT |f| 2) (+ 1 |i|) |alpha| (QREFELT % 124))
             (EXIT |f|))) 

(SDEFUN |FDALG;multiplyRow!;%NniF%;69|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (F)) (% (%)))
        (SPROG ((#1=#:G502 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |alpha| (|spadConstant| % 15) (QREFELT % 76))
                    (PROGN (LETT #1# |f|) (GO #2=#:G501))))
                  (COND
                   ((OR (< |i| 1) (> |i| (QVELT |f| 0)))
                    (EXIT
                     (|error|
                      "FDALG: multiplyRow!(%,i,alpha) - index out of range."))))
                  (EXIT
                   (COND
                    ((SPADCALL |alpha| (QREFELT % 48))
                     (|error| "FDALG: multiplyRow!(%,i,alpha) - zero factor."))
                    ('T
                     (SEQ
                      (SPADCALL (QVELT |f| 2) (+ 1 |i|) |alpha|
                                (QREFELT % 124))
                      (EXIT |f|)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;qmultiplyColumn!|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (F)) (% (%)))
        (SEQ (SPADCALL (QVELT |f| 2) (+ 1 |i|) |alpha| (QREFELT % 126))
             (EXIT |f|))) 

(SDEFUN |FDALG;multiplyColumn!;%NniF%;71|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (F)) (% (%)))
        (SPROG ((#1=#:G512 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |alpha| (|spadConstant| % 15) (QREFELT % 76))
                    (PROGN (LETT #1# |f|) (GO #2=#:G511))))
                  (COND
                   ((OR (< |i| 1) (> |i| (QVELT |f| 0)))
                    (EXIT
                     (|error|
                      "FDALG: multiplyColumn!(%,i,alpha) - index out of range."))))
                  (EXIT
                   (COND
                    ((SPADCALL |alpha| (QREFELT % 48))
                     (|error|
                      "FDALG: multiplyColumn!(%,i,alpha) - zero factor."))
                    ('T
                     (SEQ
                      (SPADCALL (QVELT |f| 2) (+ 1 |i|) |alpha|
                                (QREFELT % 126))
                      (EXIT |f|)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;qswapColumns!;%2Nni%;72|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((NULL (EQL |i| |j|))
           (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) (QREFELT % 128))))
         (EXIT |f|))) 

(SDEFUN |FDALG;swapColumns!;%2Nni%;73|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: swapColumns!(%,i,j) - index/indices out of range."))
          ((OR (EQL |i| 1) (EQL |j| 1))
           (|error|
            "FDALG: swapColumns!(%,i,j) - first column must not be changed."))
          ('T
           (SEQ
            (COND
             ((NULL (EQL |i| |j|))
              (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) (QREFELT % 128))))
            (QSETVELT |f| 4 NIL) (EXIT |f|)))))) 

(SDEFUN |FDALG;swapRowsColumns!;%2Nni%;74|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: swapRowsColumns!(%,i,j) - index/indices out of range."))
          ((OR (EQL |i| 1) (EQL |j| 1))
           (|error|
            "FDALG: swapRowsColumns!(%,i,j) - first column must not be changed."))
          ('T
           (SEQ
            (COND
             ((NULL (EQL |i| |j|))
              (SEQ (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) (QREFELT % 114))
                   (EXIT
                    (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|)
                              (QREFELT % 128))))))
            (QSETVELT |f| 4 NIL) (EXIT |f|)))))) 

(SDEFUN |FDALG;addColumns!;%2NniF%;75|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "FDALG: addColumns!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |f| 0)) (< |j| 1)) (> |j| (QVELT |f| 0))))
           (|error|
            "FDALG: addColumns!(%,i,j,alpha) - index/indices out of range."))
          ('T
           (COND
            ((EQL |i| 1)
             (|error|
              "FDALG: addColumns!(%,i,j,alpha) - first column must not be used."))
            ('T
             (SEQ
              (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                        (QREFELT % 132))
              (COND ((> |i| |j|) (QSETVELT |f| 4 NIL))) (EXIT |f|)))))))) 

(SDEFUN |FDALG;qaddColumns!;%2NniF%;76|
        ((|f| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (F)) (% (%)))
        (SEQ
         (COND
          ((NULL (EQL |i| |j|))
           (SPADCALL (QVELT |f| 2) (+ 1 |i|) (+ 1 |j|) |alpha|
                     (QREFELT % 132))))
         (EXIT |f|))) 

(SDEFUN |FDALG;removeRowsColumns;%2L%;77|
        ((|f| (%)) (|lst_row| (|List| (|NonNegativeInteger|)))
         (|lst_col| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|lst_r| #1=(|List| (|NonNegativeInteger|))) (|lst_c| #1#)
          (|f_new| (%)))
         (SEQ
          (LETT |lst_r|
                (SPADCALL (CONS #'|FDALG;removeRowsColumns;%2L%;77!0| %)
                          (SPADCALL |lst_row| (QREFELT % 137))
                          (QREFELT % 139)))
          (LETT |lst_c|
                (SPADCALL (CONS #'|FDALG;removeRowsColumns;%2L%;77!1| %)
                          (SPADCALL |lst_col| (QREFELT % 137))
                          (QREFELT % 139)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lst_r| (QREFELT % 140))
                       (SPADCALL |lst_c| (QREFELT % 140)) (QREFELT % 39))
             (|error|
              "FDALG: removeRowsColumns(%,rows,cols) - number of rows and columns differ."))
            ('T
             (SEQ
              (LETT |f_new|
                    (SPADCALL
                     (SPADCALL (QVELT |f| 2) |lst_r| |lst_c| (QREFELT % 141))
                     (QVELT |f| 1) (QREFELT % 41)))
              (EXIT |f_new|)))))))) 

(SDEFUN |FDALG;removeRowsColumns;%2L%;77!1| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;removeRowsColumns;%2L%;77!0| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;insertRowsColumns;%2L%;78|
        ((|f| (%)) (|lst_row| (|List| (|NonNegativeInteger|)))
         (|lst_col| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|lst_r| #1=(|List| (|NonNegativeInteger|))) (|lst_c| #1#)
          (|f_new| (%)) (|k| NIL) (#2=#:G551 NIL))
         (SEQ
          (LETT |lst_r|
                (SPADCALL (CONS #'|FDALG;insertRowsColumns;%2L%;78!0| %)
                          |lst_row| (QREFELT % 139)))
          (LETT |lst_c|
                (SPADCALL (CONS #'|FDALG;insertRowsColumns;%2L%;78!1| %)
                          |lst_col| (QREFELT % 139)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lst_r| (QREFELT % 140))
                       (SPADCALL |lst_c| (QREFELT % 140)) (QREFELT % 39))
             (|error|
              "FDALG: insertRowsColumns(%,rows,cols) - number of rows and columns differ."))
            ('T
             (SEQ
              (LETT |f_new|
                    (SPADCALL
                     (SPADCALL (QVELT |f| 2) |lst_r| |lst_c| (QREFELT % 143))
                     (QVELT |f| 1) (QREFELT % 41)))
              (SEQ (LETT |k| 1) (LETT #2# (SPADCALL |lst_r| (QREFELT % 140)))
                   G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (|FDALG;qsetA!| (QVELT |f_new| 2)
                      (+ |k| (SPADCALL |lst_row| |k| (QREFELT % 144)))
                      (+ |k| (SPADCALL |lst_col| |k| (QREFELT % 144))) 1
                      (|spadConstant| % 15) %)))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f_new|)))))))) 

(SDEFUN |FDALG;insertRowsColumns;%2L%;78!1| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;insertRowsColumns;%2L%;78!0| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;qzero?;%4NniB;79|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPADCALL (QVELT |f| 2) (+ 1 |i_min|) (+ 1 |i_max|) (+ 1 |j_min|)
                  (+ 1 |j_max|) (QREFELT % 25))) 

(SDEFUN |FDALG;qzero?;%5NniB;80|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPADCALL (QVELT |f| 2) (+ 1 |i_min|) (+ 1 |i_max|) (+ 1 |j_min|)
                  (+ 1 |j_max|) |l| (QREFELT % 147))) 

(SDEFUN |FDALG;qzero?;%4NniFmB;81|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (|m| (|FreeMonoid| VAR))
         (% (|Boolean|)))
        (SPROG ((#1=#:G556 NIL) (|l| (|NonNegativeInteger|)))
               (SEQ
                (LETT |l|
                      (PROG1
                          (LETT #1#
                                (SPADCALL |m| (QVELT |f| 1) (QREFELT % 57)))
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                (EXIT
                 (SPADCALL (QVELT |f| 2) (+ 1 |i_min|) (+ 1 |i_max|)
                           (+ 1 |j_min|) (+ 1 |j_max|) |l| (QREFELT % 147)))))) 

(SDEFUN |FDALG;blockStructure;%M;82|
        ((|f| (%)) (% (|Matrix| (|NonNegativeInteger|))))
        (SPROG
         ((|j_wrk| #1=(|NonNegativeInteger|)) (#2=#:G564 NIL) (#3=#:G565 NIL)
          (|cnt_l| (|List| (|NonNegativeInteger|))) (|i| NIL) (#4=#:G589 NIL)
          (#5=#:G569 NIL) (#6=#:G590 NIL) (|flg_tmp| (|Boolean|))
          (|m| (|NonNegativeInteger|))
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|))) (|idx_l| (|List| #1#))
          (#7=#:G591 NIL) (#8=#:G580 NIL) (#9=#:G592 NIL) (#10=#:G581 NIL)
          (|k| NIL) (#11=#:G593 NIL) (#12=#:G584 NIL)
          (|sze_tmp| (|NonNegativeInteger|)))
         (SEQ (LETT |cnt_l| NIL)
              (SEQ (LETT |i| (QVELT |f| 0)) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ (LETT |j_wrk| 1)
                        (SEQ G190
                             (COND
                              ((NULL
                                (|FDALG;qzeroA?| (QVELT |f| 2) |i| |j_wrk| %))
                               (GO G191)))
                             (SEQ (EXIT (LETT |j_wrk| (+ |j_wrk| 1)))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |cnt_l|
                               (CONS
                                (MIN
                                 (PROG1 (LETT #2# (- |i| 1))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (PROG1 (LETT #3# (- |j_wrk| 1))
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#)))
                                |cnt_l|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |idx_l| (LIST 1))
              (SEQ (LETT |i| 2) (LETT #4# (QVELT |f| 0)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |cnt_l| |i| (QREFELT % 144))
                            (PROG1 (LETT #5# (- |i| 1))
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#)))
                       (SEQ (LETT |flg_tmp| 'T)
                            (SEQ (LETT |k| (+ |i| 1)) (LETT #6# (QVELT |f| 0))
                                 G190 (COND ((> |k| #6#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((< (SPADCALL |cnt_l| |k| (QREFELT % 144))
                                        (SPADCALL |cnt_l| |i| (QREFELT % 144)))
                                     (LETT |flg_tmp| NIL)))))
                                 (LETT |k| (+ |k| 1)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              (|flg_tmp|
                               (LETT |idx_l| (CONS |i| |idx_l|))))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |m| (SPADCALL |idx_l| (QREFELT % 140)))
              (LETT |blo_mtx| (SPADCALL |m| 4 0 (QREFELT % 151)))
              (LETT |idx_l| (SPADCALL |idx_l| (QREFELT % 152)))
              (QSETAREF2O |blo_mtx| |m| 2 (QVELT |f| 0) 1 1)
              (SEQ (LETT |k| 1) (LETT #7# |m|) G190
                   (COND ((|greater_SI| |k| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |blo_mtx| |k| 1
                                 (SPADCALL |idx_l| |k| (QREFELT % 144)) 1 1)))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1)
                   (LETT #9#
                         (PROG1 (LETT #8# (- |m| 1))
                           (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #8#)))
                   G190 (COND ((|greater_SI| |k| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |blo_mtx| |k| 2
                                 (PROG1
                                     (LETT #10#
                                           (-
                                            (SPADCALL |idx_l| (+ |k| 1)
                                                      (QREFELT % 144))
                                            1))
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                 1 1)))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #11# |m|) G190
                   (COND ((|greater_SI| |k| #11#) (GO G191)))
                   (SEQ
                    (LETT |sze_tmp|
                          (PROG1
                              (LETT #12#
                                    (- (+ (QAREF2O |blo_mtx| |k| 2 1 1) 1)
                                       (QAREF2O |blo_mtx| |k| 1 1 1)))
                            (|check_subtype2| (>= #12# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #12#)))
                    (QSETAREF2O |blo_mtx| |k| 3 |sze_tmp| 1 1)
                    (EXIT
                     (COND
                      ((EQL |sze_tmp| 1) (QSETAREF2O |blo_mtx| |k| 4 1 1 1)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |blo_mtx|)))) 

(SDEFUN |FDALG;refined?;%B;83| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|blo_mtx| (|Matrix| (|NonNegativeInteger|))) (#1=#:G598 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
                      (COND
                       ((EQL (SPADCALL |blo_mtx| (QREFELT % 154))
                             (QVELT |f| 0))
                        (PROGN (LETT #1# 'T) (GO #2=#:G597))))
                      (EXIT (QVELT |f| 4))))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;qblockElimination|
        ((|f| (%)) (|rsrc| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|))) (|flg_u| (|Boolean|))
         (|csrc| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|))) (|flg_v| (|Boolean|))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|row_src| #1=(|List| (|NonNegativeInteger|))) (|row_dst| #1#)
          (|row_ext| (|List| (|NonNegativeInteger|))) (|col_src| #1#)
          (|col_dst| #1#) (|col_ext| (|List| (|NonNegativeInteger|)))
          (|lst_trn| (|List| (|Matrix| F))))
         (SEQ
          (LETT |row_src|
                (SPADCALL (CONS #'|FDALG;qblockElimination!0| %) |rsrc|
                          (QREFELT % 139)))
          (LETT |row_dst|
                (SPADCALL (CONS #'|FDALG;qblockElimination!1| %) |rdst|
                          (QREFELT % 139)))
          (LETT |row_ext| NIL)
          (COND (|flg_u| (LETT |row_ext| (CONS 1 |row_ext|))))
          (LETT |col_src|
                (SPADCALL (CONS #'|FDALG;qblockElimination!2| %) |csrc|
                          (QREFELT % 139)))
          (LETT |col_dst|
                (SPADCALL (CONS #'|FDALG;qblockElimination!3| %) |cdst|
                          (QREFELT % 139)))
          (LETT |col_ext| NIL)
          (COND (|flg_v| (LETT |col_ext| (CONS 1 |col_ext|))))
          (LETT |lst_trn|
                (SPADCALL (QVELT |f| 2) |row_src| |row_dst| |row_ext| |col_src|
                          |col_dst| |col_ext| (QREFELT % 157)))
          (EXIT |lst_trn|)))) 

(SDEFUN |FDALG;qblockElimination!3| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;qblockElimination!2| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;qblockElimination!1| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;qblockElimination!0| ((|a| NIL) (% NIL))
        (SPADCALL |a| (|spadConstant| % 135) (QREFELT % 136))) 

(SDEFUN |FDALG;blockElimination;%2LB2LBL;85|
        ((|f| (%)) (|rsrc| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|))) (|flg_u| (|Boolean|))
         (|csrc| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|))) (|flg_v| (|Boolean|))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|flg_row| #1=(|Boolean|))
          (|flg_col| #1#) (|lst_trn| (|List| (|Matrix| F))) (|k| NIL)
          (#2=#:G643 NIL))
         (SEQ (LETT |n| (QVELT |f| 0)) (LETT |flg_row| 'T)
              (COND
               ((> (SPADCALL |rsrc| (QREFELT % 140)) 0)
                (COND
                 ((OR (< (SPADCALL (ELT % 158) |rsrc| (QREFELT % 160)) 1)
                      (> (SPADCALL (ELT % 161) |rsrc| (QREFELT % 160)) |n|))
                  (LETT |flg_row| NIL)))))
              (COND
               ((> (SPADCALL |rdst| (QREFELT % 140)) 0)
                (COND
                 ((OR (< (SPADCALL (ELT % 158) |rdst| (QREFELT % 160)) 1)
                      (> (SPADCALL (ELT % 161) |rdst| (QREFELT % 160)) |n|))
                  (LETT |flg_row| NIL)))))
              (EXIT
               (COND
                (|flg_row|
                 (SEQ (LETT |flg_col| 'T)
                      (COND
                       ((> (SPADCALL |csrc| (QREFELT % 140)) 0)
                        (COND
                         ((OR
                           (< (SPADCALL (ELT % 158) |csrc| (QREFELT % 160)) 1)
                           (> (SPADCALL (ELT % 161) |csrc| (QREFELT % 160))
                              |n|))
                          (LETT |flg_col| NIL)))))
                      (COND
                       ((> (SPADCALL |cdst| (QREFELT % 140)) 0)
                        (COND
                         ((OR
                           (< (SPADCALL (ELT % 158) |cdst| (QREFELT % 160)) 1)
                           (> (SPADCALL (ELT % 161) |cdst| (QREFELT % 160))
                              |n|))
                          (LETT |flg_col| NIL)))))
                      (EXIT
                       (COND
                        (|flg_col|
                         (SEQ
                          (LETT |lst_trn|
                                (|FDALG;qblockElimination| |f| |rsrc| |rdst|
                                 |flg_u| |csrc| |cdst| |flg_v| %))
                          (COND
                           ((> (LENGTH |lst_trn|) 0)
                            (SEQ (LETT |k| 1) (LETT #2# (LENGTH |lst_trn|))
                                 G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |lst_trn| |k|
                                             (SPADCALL
                                              (SPADCALL |lst_trn| |k|
                                                        (QREFELT % 162))
                                              2 (+ (QVELT |f| 0) 1) 2
                                              (+ (QVELT |f| 0) 1)
                                              (QREFELT % 163))
                                             (QREFELT % 164))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (EXIT |lst_trn|)))
                        (#3='T
                         (|error|
                          "FDALG: blockElimination(f, ...) - column index index out of range."))))))
                (#3#
                 (|error|
                  "FDALG: blockElimination(f, ...) - row index out of range."))))))) 

(SDEFUN |FDALG;blockElimination;%4LL;86|
        ((|f| (%)) (|rsrc| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|csrc| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|))) (% (|List| (|Matrix| F))))
        (SPADCALL |f| |rsrc| |rdst| 'T |csrc| |cdst| 'T (QREFELT % 165))) 

(SDEFUN |FDALG;toMatrix|
        ((|p| (|LinearMultivariateMatrixPencil| F))
         (|lst| (|List| (|FreeMonoid| VAR))) (|r_min| (|NonNegativeInteger|))
         (|r_max| (|NonNegativeInteger|)) (|c_min| (|NonNegativeInteger|))
         (|c_max| (|NonNegativeInteger|))
         (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((#1=#:G646 NIL) (|m| (|NonNegativeInteger|)) (#2=#:G647 NIL)
          (|n| (|NonNegativeInteger|))
          (|A_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|k| NIL)
          (#3=#:G658 NIL) (|A_tmp| (|Matrix| F)) (|i| NIL) (#4=#:G659 NIL)
          (|j| NIL) (#5=#:G660 NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT % 40)) (LENGTH |lst|)
                      (QREFELT % 39))
            (|error|
             "FDALG: toMatrix(p,lst) - number of elements do not agree."))
           ('T
            (SEQ
             (LETT |m|
                   (PROG1 (LETT #1# (- (+ |r_max| 1) |r_min|))
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#)))
             (LETT |n|
                   (PROG1 (LETT #2# (- (+ |c_max| 1) |c_min|))
                     (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #2#)))
             (LETT |A_wrk| (MAKE_MATRIX1 |m| |n| (|spadConstant| % 90)))
             (SEQ (LETT |k| 1) (LETT #3# (LENGTH |lst|)) G190
                  (COND ((|greater_SI| |k| #3#) (GO G191)))
                  (SEQ
                   (LETT |A_tmp|
                         (SPADCALL |p| |r_min| |r_max| |c_min| |c_max| |k|
                                   (QREFELT % 20)))
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #4# |m|) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_wrk| |i| |j| 1 1)
                                               (SPADCALL
                                                (QAREF2O |A_tmp| |i| |j| 1 1)
                                                (SPADCALL
                                                 (SPADCALL |lst| |k|
                                                           (QREFELT % 91))
                                                 (QREFELT % 92))
                                                (QREFELT % 93))
                                               (QREFELT % 94))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT |A_wrk|))))))) 

(SDEFUN |FDALG;display;%LOf;88|
        ((|f| (%)) (|sym| (|List| (|Symbol|))) (% (|OutputForm|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|sym_wrk| (|Symbol|))
          (|lst| (|List| (|List| (|OutputForm|)))) (|k| NIL) (#1=#:G668 NIL))
         (SEQ (LETT |n| (QVELT |f| 0)) (LETT |sym_wrk| '|s|)
              (COND
               ((> (LENGTH |sym|) 0) (LETT |sym_wrk| (|SPADfirst| |sym|))))
              (LETT |lst| (SPADCALL |n| NIL (QREFELT % 169)))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |lst| |k|
                               (LIST
                                (SPADCALL (SPADCALL |sym_wrk| (QREFELT % 172))
                                          (SPADCALL |k| (QREFELT % 173))
                                          (QREFELT % 174)))
                               (QREFELT % 175))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |f| (SPADCALL |lst| (QREFELT % 177))
                         (QREFELT % 178)))))) 

(SDEFUN |FDALG;display;%2Of;89|
        ((|f| (%)) (|sol| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|mtx_A| #1=(|Matrix| (|XDistributedPolynomial| VAR F)))
          (|mtx_v| #1#) (|als_of| (|OutputForm|)))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |mtx_A|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) (+ 1 1) (+ 1 |n|) %))
              (LETT |mtx_v|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) 1 1 %))
              (LETT |als_of|
                    (SPADCALL
                     (SPADCALL (SPADCALL |mtx_A| (QREFELT % 181)) |sol|
                               (QREFELT % 182))
                     (SPADCALL |mtx_v| (QREFELT % 181)) (QREFELT % 183)))
              (EXIT |als_of|)))) 

(SDEFUN |FDALG;admissibleLinearSystem;%Of;90| ((|f| (%)) (% (|OutputForm|)))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|mtx_A| #1=(|Matrix| (|XDistributedPolynomial| VAR F)))
          (|mtx_v| #1#) (|sym_wrk| (|Symbol|))
          (|lst_A| (|List| (|List| (|OutputForm|))))
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|))) (|k| NIL)
          (#2=#:G682 NIL) (|i| NIL) (#3=#:G683 NIL)
          (|row_a| (|List| (|OutputForm|))) (|j| NIL) (#4=#:G684 NIL)
          (|als_of| (|OutputForm|)))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |mtx_A|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) (+ 1 1) (+ 1 |n|) %))
              (LETT |mtx_v|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) 1 1 %))
              (LETT |sym_wrk| '|s|)
              (LETT |lst_A| (SPADCALL (ANROWS |mtx_A|) NIL (QREFELT % 169)))
              (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
              (SEQ (LETT |k| 1) (LETT #2# (SPADCALL |blo_mtx| (QREFELT % 154)))
                   G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| (SPADCALL |blo_mtx| |k| 1 (QREFELT % 184)))
                          (LETT #3# (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184)))
                          G190 (COND ((> |i| #3#) (GO G191)))
                          (SEQ
                           (LETT |row_a|
                                 (SPADCALL (ANCOLS |mtx_A|)
                                           (SPADCALL 1 (QREFELT % 185))
                                           (QREFELT % 186)))
                           (SEQ
                            (LETT |j|
                                  (SPADCALL |blo_mtx| |k| 1 (QREFELT % 184)))
                            (LETT #4# |n|) G190 (COND ((> |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |row_a| |j|
                                        (SPADCALL (QAREF2O |mtx_A| |i| |j| 1 1)
                                                  (QREFELT % 187))
                                        (QREFELT % 188))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL |lst_A| |i| |row_a| (QREFELT % 175))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |als_of|
                    (SPADCALL
                     (SPADCALL (SPADCALL |lst_A| (QREFELT % 177))
                               (SPADCALL |sym_wrk| (QREFELT % 172))
                               (QREFELT % 182))
                     (SPADCALL |mtx_v| (QREFELT % 181)) (QREFELT % 183)))
              (EXIT |als_of|)))) 

(SDEFUN |FDALG;linearization;%M;91|
        ((|f| (%)) (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|L_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|k| NIL)
          (#1=#:G690 NIL))
         (SEQ
          (LETT |L_wrk|
                (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) 1
                 (+ 1 (QVELT |f| 0)) 1 (+ 1 (QVELT |f| 0)) %))
          (SEQ (LETT |k| 2) (LETT #1# (ANROWS |L_wrk|)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF2O |L_wrk| |k| 1
                             (SPADCALL (QAREF2O |L_wrk| |k| 1 1 1)
                                       (QREFELT % 190))
                             1 1)))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT |L_wrk|)))) 

(SDEFUN |FDALG;linearization;%M;92| ((|f| (%)) (% (|Matrix| %)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|L_wrk| (|Matrix| %)) (|i| NIL)
          (#1=#:G702 NIL) (|j| NIL) (#2=#:G703 NIL) (|a_wrk| (F)) (|als| (%))
          (|lp_new| (|LinearMultivariateMatrixPencil| F)) (|l| NIL)
          (#3=#:G704 NIL))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |L_wrk|
                    (SPADCALL (+ |n| 1) (+ |n| 1) (|spadConstant| % 49)
                              (QREFELT % 193)))
              (SEQ (LETT |i| 1) (LETT #1# (+ |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# (+ |n| 1)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (QVELT |f| 2) |i| |i| |j| |j| 1
                                        (QREFELT % 26))
                              (SEQ
                               (LETT |a_wrk|
                                     (SPADCALL (QVELT |f| 2) |i| |j| 1
                                               (QREFELT % 13)))
                               (COND
                                ((EQL |j| 1)
                                 (LETT |a_wrk|
                                       (SPADCALL |a_wrk| (QREFELT % 58)))))
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |a_wrk| (QREFELT % 48)))
                                  (SPADCALL |L_wrk| |i| |j|
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 14)
                                                       |a_wrk| (QREFELT % 62))
                                             (QREFELT % 66))
                                            (QREFELT % 194)))))))
                             ('T
                              (SEQ
                               (LETT |als|
                                     (SPADCALL 2 (QVELT |f| 1) (QREFELT % 35)))
                               (LETT |lp_new| (QVELT |als| 2))
                               (|FDALG;qsetu!| |lp_new| 1 1
                                (|spadConstant| % 15) %)
                               (|FDALG;qsetv!| |lp_new| 2 1
                                (|spadConstant| % 15) %)
                               (|FDALG;qsetA!| |lp_new| 1 1 1
                                (|spadConstant| % 15) %)
                               (|FDALG;qsetA!| |lp_new| 2 2 1
                                (|spadConstant| % 15) %)
                               (SEQ (LETT |l| 1)
                                    (LETT #3# (LENGTH (QVELT |f| 1))) G190
                                    (COND ((|greater_SI| |l| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (|FDALG;qsetA!| |lp_new| 1 2 |l|
                                       (SPADCALL
                                        (SPADCALL (QVELT |f| 2) |i| |j| |l|
                                                  (QREFELT % 13))
                                        (QREFELT % 58))
                                       %)))
                                    (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                    (EXIT NIL))
                               (QSETVELT |als| 3 'T) (QSETVELT |als| 4 'T)
                               (QSETVELT |als| 6 NIL)
                               (EXIT
                                (SPADCALL |L_wrk| |i| |j|
                                          (SPADCALL |als| (QREFELT % 66))
                                          (QREFELT % 194))))))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |L_wrk|)))) 

(SDEFUN |FDALG;representation;%L;93|
        ((|f| (%)) (% (|List| (|Matrix| (|XDistributedPolynomial| VAR F)))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|mtx_u| #1=(|Matrix| (|XDistributedPolynomial| VAR F)))
          (|mtx_A| #1#) (|mtx_v| #1#))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |mtx_u|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) 1 1 (+ 1 1)
                     (+ 1 |n|) %))
              (LETT |mtx_A|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) (+ 1 1) (+ 1 |n|) %))
              (LETT |mtx_v|
                    (|FDALG;toMatrix| (QVELT |f| 2) (QVELT |f| 1) (+ 1 1)
                     (+ 1 |n|) 1 1 %))
              (EXIT (LIST |mtx_u| |mtx_A| |mtx_v|))))) 

(SDEFUN |FDALG;*;%M%;94| ((|f| (%)) (U (|Matrix| F)) (% (%)))
        (SPROG ((|f_new| (%)))
               (SEQ (LETT |f_new| (SPADCALL |f| (QREFELT % 51)))
                    (EXIT (SPADCALL |f_new| U (QREFELT % 199)))))) 

(SDEFUN |FDALG;*;M2%;95| ((T$ (|Matrix| F)) (|f| (%)) (% (%)))
        (SPROG ((|f_new| (%)))
               (SEQ (LETT |f_new| (SPADCALL |f| (QREFELT % 51)))
                    (EXIT (SPADCALL |f_new| T$ (QREFELT % 201)))))) 

(SDEFUN |FDALG;transformationMatrix;%M;96| ((|f| (%)) (% (|Matrix| F)))
        (SPROG ((|trf_mtx| (|Matrix| F)) (|k| NIL) (#1=#:G715 NIL))
               (SEQ
                (LETT |trf_mtx|
                      (MAKE_MATRIX1 (QVELT |f| 0) (QVELT |f| 0)
                                    (|spadConstant| % 50)))
                (SEQ (LETT |k| 1) (LETT #1# (QVELT |f| 0)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O |trf_mtx| |k| |k| (|spadConstant| % 15) 1
                                   1)))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |trf_mtx|)))) 

(SDEFUN |FDALG;transformRows!;%M%;97| ((|f| (%)) (T$ (|Matrix| F)) (% (%)))
        (SPROG ((|trf_mtx| (|Matrix| F)))
               (SEQ
                (COND
                 ((EQL (ANROWS T$) (ANCOLS T$))
                  (COND
                   ((NULL (EQL (ANROWS T$) (QVELT |f| 0)))
                    (EXIT
                     (|error|
                      #1="FDALG: transformRows!(%,T) - wrong matrix size.")))))
                 (#2='T (EXIT (|error| #1#))))
                (EXIT
                 (COND
                  ((< (SPADCALL T$ (QREFELT % 82)) (QVELT |f| 0))
                   (|error|
                    "FDALG: transformRows!(%,T) - matrix not invertible."))
                  (#2#
                   (SEQ
                    (LETT |trf_mtx| (SPADCALL (QVELT |f| 2) (QREFELT % 204)))
                    (SPADCALL |trf_mtx| 2 2 T$ (QREFELT % 205))
                    (SPADCALL (QVELT |f| 2) |trf_mtx| (QREFELT % 206))
                    (QSETVELT |f| 4 NIL) (EXIT |f|)))))))) 

(SDEFUN |FDALG;transformColumns!;%M%;98| ((|f| (%)) (U (|Matrix| F)) (% (%)))
        (SPROG
         ((|j| NIL) (#1=#:G734 NIL) (|flg_wrk| (|Boolean|)) (#2=#:G733 NIL)
          (|trf_mtx| (|Matrix| F)))
         (SEQ
          (COND
           ((EQL (ANROWS U) (ANCOLS U))
            (COND
             ((NULL (EQL (ANROWS U) (QVELT |f| 0)))
              (EXIT
               (|error|
                #3="FDALG: transformColumns!(%,U) - wrong matrix size.")))))
           (#4='T (EXIT (|error| #3#))))
          (LETT |flg_wrk| 'T)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 2) (LETT #1# (QVELT |f| 0)) G190
                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (SPADCALL (QAREF2O U 1 |j| 1 1) (QREFELT % 48)))
                     (SEQ (LETT |flg_wrk| NIL)
                          (EXIT
                           (PROGN (LETT #2# |$NoValue|) (GO #5=#:G728))))))))
                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #2#))
          (COND
           ((SPADCALL (QAREF2O U 1 1 1 1) (|spadConstant| % 15) (QREFELT % 76))
            (COND
             ((NULL |flg_wrk|)
              (EXIT
               (|error|
                #6="FDALG: transformColumns!(%,U) - first column must not be changed.")))))
           (#4# (EXIT (|error| #6#))))
          (EXIT
           (COND
            ((< (SPADCALL U (QREFELT % 82)) (QVELT |f| 0))
             (|error|
              "FDALG: transformColumns!(%,U) - matrix not invertible."))
            (#4#
             (SEQ (LETT |trf_mtx| (SPADCALL (QVELT |f| 2) (QREFELT % 207)))
                  (SPADCALL |trf_mtx| 2 2 U (QREFELT % 205))
                  (SPADCALL (QVELT |f| 2) |trf_mtx| (QREFELT % 208))
                  (QSETVELT |f| 4 NIL) (EXIT |f|)))))))) 

(SDEFUN |FDALG;normalizeRHS!;2%;99| ((|f| (%)) (% (%)))
        (SPROG
         ((|i| NIL) (|v_wrk| (F)) (|v_ref| (F))
          (|i_ref| (|NonNegativeInteger|)))
         (SEQ (LETT |i_ref| 0) (LETT |v_ref| (|spadConstant| % 50))
              (SEQ (LETT |i| (QVELT |f| 0)) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ (LETT |v_wrk| (|FDALG;qeltv| (QVELT |f| 2) |i| 1 %))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |v_wrk| (QREFELT % 48)))
                           (COND
                            ((> |i_ref| 0)
                             (SPADCALL |f| |i_ref| |i|
                                       (SPADCALL
                                        (SPADCALL |v_wrk| |v_ref|
                                                  (QREFELT % 209))
                                        (QREFELT % 58))
                                       (QREFELT % 118)))
                            ('T
                             (SEQ (LETT |v_ref| |v_wrk|)
                                  (EXIT (LETT |i_ref| |i|)))))))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |FDALG;normalizePLS!;2%;100| ((|f| (%)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|j_wrk| NIL) (#1=#:G757 NIL)
          (#2=#:G758 NIL) (|i_ref| (|NonNegativeInteger|)) (#3=#:G756 NIL)
          (|i_wrk| NIL) (#4=#:G759 NIL) (|a_wrk| (F)))
         (SEQ (LETT |n| (QVELT |f| 0))
              (SEQ (LETT |j_wrk| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |j_wrk| #1#) (GO G191)))
                   (SEQ (LETT |i_ref| 0)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |i_wrk| |j_wrk|) (LETT #2# |n|) G190
                               (COND ((> |i_wrk| #2#) (GO G191)))
                               (SEQ
                                (LETT |a_wrk|
                                      (|FDALG;qeltA| (QVELT |f| 2) |i_wrk|
                                       |j_wrk| 1 %))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |a_wrk| (QREFELT % 48)))
                                   (COND
                                    ((ZEROP |i_ref|)
                                     (SEQ (LETT |i_ref| |i_wrk|)
                                          (|FDALG;qmultiplyRow!| |f| |i_ref|
                                           (SPADCALL (|spadConstant| % 15)
                                                     |a_wrk| (QREFELT % 209))
                                           %)
                                          (COND
                                           ((SPADCALL |i_ref| |j_wrk|
                                                      (QREFELT % 39))
                                            (SPADCALL |f| |i_ref| |j_wrk|
                                                      (QREFELT % 115))))
                                          (EXIT
                                           (PROGN
                                            (LETT #3# 1)
                                            (GO #5=#:G747))))))))))
                               (LETT |i_wrk| (+ |i_wrk| 1)) (GO G190) G191
                               (EXIT NIL)))
                         #5# (EXIT #3#))
                        (EXIT
                         (COND
                          ((NULL (ZEROP |i_ref|))
                           (SEQ (LETT |i_wrk| 1) (LETT #4# |n|) G190
                                (COND ((|greater_SI| |i_wrk| #4#) (GO G191)))
                                (SEQ
                                 (LETT |a_wrk|
                                       (|FDALG;qeltA| (QVELT |f| 2) |i_wrk|
                                        |i_ref| 1 %))
                                 (EXIT
                                  (COND
                                   ((NULL (SPADCALL |a_wrk| (QREFELT % 48)))
                                    (COND
                                     ((SPADCALL |i_wrk| |i_ref| (QREFELT % 39))
                                      (SPADCALL |f| |i_ref| |i_wrk|
                                                (SPADCALL |a_wrk|
                                                          (QREFELT % 58))
                                                (QREFELT % 118))))))))
                                (LETT |i_wrk| (|inc_SI| |i_wrk|)) (GO G190)
                                G191 (EXIT NIL))))))
                   (LETT |j_wrk| (|inc_SI| |j_wrk|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |FDALG;normalizeDIAG!;2%;101| ((|f| (%)) (% (%)))
        (SPROG
         ((|i| NIL) (#1=#:G771 NIL) (|a_lst| (|List| F)) (|l| NIL)
          (#2=#:G772 NIL) (#3=#:G770 NIL))
         (SEQ
          (SEQ (LETT |i| 1) (LETT #1# (QVELT |f| 0)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |a_lst| (|FDALG;qlstA| (QVELT |f| 2) |i| |i| %))
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| 1) (LETT #2# (LENGTH |a_lst|)) G190
                            (COND ((|greater_SI| |l| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL |a_lst| |l| (QREFELT % 75))
                                  (QREFELT % 48)))
                                (SEQ
                                 (|FDALG;qmultiplyRow!| |f| |i|
                                  (SPADCALL (|spadConstant| % 15)
                                            (SPADCALL |a_lst| |l|
                                                      (QREFELT % 75))
                                            (QREFELT % 209))
                                  %)
                                 (EXIT
                                  (PROGN
                                   (LETT #3# |$NoValue|)
                                   (GO #4=#:G765))))))))
                            (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                            (EXIT NIL)))
                      #4# (EXIT #3#))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |f|)))) 

(SDEFUN |FDALG;normalize!;2%;102| ((|f| (%)) (% (%)))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|i_ref| (|NonNegativeInteger|)) (|k| NIL) (#1=#:G786 NIL)
          (|i_max| (|NonNegativeInteger|)) (#2=#:G785 NIL))
         (SEQ (SPADCALL |f| (QREFELT % 210)) (SPADCALL |f| (QREFELT % 212))
              (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153))) (LETT |i_ref| 1)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((<= |i_ref| (QVELT |f| 0))
                        (SPADCALL (|FDALG;qeltv| (QVELT |f| 2) |i_ref| 1 %)
                                  (QREFELT % 48)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ (EXIT (LETT |i_ref| (+ |i_ref| 1)))) NIL (GO G190) G191
                   (EXIT NIL))
              (COND
               ((< |i_ref| (QVELT |f| 0))
                (SEQ (LETT |i_max| 0)
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1)
                            (LETT #1# (SPADCALL |blo_mtx| (QREFELT % 154)))
                            G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((>= (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184))
                                    |i_ref|)
                                (SEQ
                                 (LETT |i_max|
                                       (SPADCALL |blo_mtx| |k| 2
                                                 (QREFELT % 184)))
                                 (EXIT
                                  (PROGN (LETT #2# 1) (GO #3=#:G780))))))))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL)))
                      #3# (EXIT #2#))
                     (EXIT
                      (COND
                       ((< |i_ref| |i_max|)
                        (SPADCALL |f| |i_ref| |i_max| (QREFELT % 115))))))))
              (EXIT |f|)))) 

(SDEFUN |FDALG;regularMatrix|
        ((|f| (%)) (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|Q_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|i| NIL)
          (#1=#:G793 NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |f| 1 (QVELT |f| 0) (QREFELT % 77)))
            (|error| "FDALG: regularMatrix(f) - f is not regular."))
           ('T
            (SEQ (LETT |n| (QVELT |f| 0))
                 (LETT |Q_wrk|
                       (SPADCALL (SPADCALL |f| (QREFELT % 109))
                                 (QREFELT % 214)))
                 (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |Q_wrk| |i| |i|
                                    (SPADCALL (QAREF2O |Q_wrk| |i| |i| 1 1)
                                              (|spadConstant| % 215)
                                              (QREFELT % 94))
                                    1 1)))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |Q_wrk|))))))) 

(SDEFUN |FDALG;polynomial;%Xdp;104|
        ((|f| (%)) (% (|XDistributedPolynomial| VAR F)))
        (SPROG
         ((|s_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|p_wrk| (|XDistributedPolynomial| VAR F)))
         (SEQ (LETT |s_wrk| (SPADCALL |f| (QREFELT % 216)))
              (EXIT (LETT |p_wrk| (QAREF2O |s_wrk| 1 1 1 1)))))) 

(SDEFUN |FDALG;solutionVector;%M;105|
        ((|f| (%)) (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|s_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))) (|i| NIL)
          (|j| NIL) (#1=#:G805 NIL) (|p_wrk| (|XDistributedPolynomial| VAR F)))
         (SEQ
          (COND
           ((NULL (|FDALG;polynomialForm?| |f| %))
            (|error| "FDALG: solutionVector(f) - f is not polynomial."))
           ('T
            (SEQ (LETT |n| (QVELT |f| 0))
                 (LETT |s_wrk| (MAKE_MATRIX1 |n| 1 (|spadConstant| % 90)))
                 (SEQ (LETT |i| |n|) G190 (COND ((< |i| 1) (GO G191)))
                      (SEQ
                       (LETT |p_wrk|
                             (SPADCALL (SPADCALL |f| |i| (QREFELT % 88))
                                       (QREFELT % 105)))
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #1# |n|) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |p_wrk|
                                    (SPADCALL |p_wrk|
                                              (SPADCALL
                                               (SPADCALL |f| |i| |j|
                                                         (QREFELT % 96))
                                               (QAREF2O |s_wrk| |j| 1 1 1)
                                               (QREFELT % 218))
                                              (QREFELT % 219)))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                       (EXIT (QSETAREF2O |s_wrk| |i| 1 |p_wrk| 1 1)))
                      (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                 (EXIT |s_wrk|))))))) 

(SDEFUN |FDALG;solutionVector;%NniM;106|
        ((|f| (%)) (|k| (|NonNegativeInteger|))
         (% (|Matrix| (|XDistributedPolynomial| VAR F))))
        (SPROG
         ((|als| (%)) (|Q_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|i| NIL) (#1=#:G811 NIL)
          (|v_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|s_wrk| (|Matrix| (|XDistributedPolynomial| VAR F))))
         (SEQ (LETT |als| (SPADCALL |f| (QREFELT % 51)))
              (SPADCALL |als| (QREFELT % 211))
              (LETT |Q_wrk| (|FDALG;regularMatrix| |als| %))
              (LETT |v_wrk| (SPADCALL |als| (QREFELT % 107)))
              (LETT |s_wrk| (SPADCALL |v_wrk| (QREFELT % 220)))
              (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |v_wrk| (SPADCALL |Q_wrk| |v_wrk| (QREFELT % 221)))
                    (EXIT
                     (LETT |s_wrk|
                           (SPADCALL |s_wrk| |v_wrk| (QREFELT % 222)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s_wrk|)))) 

(SDEFUN |FDALG;columnSpan;%S;107|
        ((|f| (%)) (% (|Stream| (|Matrix| (|XDistributedPolynomial| VAR F)))))
        (SPROG
         ((|als| (%)) (|Q_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|v_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|fnc|
           (|Mapping| (|Matrix| (|XDistributedPolynomial| VAR F))
                      (|Matrix| (|XDistributedPolynomial| VAR F)))))
         (SEQ (LETT |als| (SPADCALL |f| (QREFELT % 51)))
              (SPADCALL |als| (QREFELT % 211))
              (LETT |Q_wrk| (|FDALG;regularMatrix| |als| %))
              (LETT |v_wrk| (SPADCALL |als| (QREFELT % 107)))
              (LETT |fnc|
                    (CONS #'|FDALG;columnSpan;%S;107!0| (VECTOR % |Q_wrk|)))
              (EXIT (SPADCALL |fnc| |v_wrk| (QREFELT % 226)))))) 

(SDEFUN |FDALG;columnSpan;%S;107!0| ((|v| NIL) ($$ NIL))
        (PROG (|Q_wrk| %)
          (LETT |Q_wrk| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |Q_wrk| |v| (QREFELT % 221)))))) 

(SDEFUN |FDALG;rowSpan;%S;108|
        ((|f| (%)) (% (|Stream| (|Matrix| (|XDistributedPolynomial| VAR F)))))
        (SPROG
         ((|als| (%)) (|Q_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|u_wrk| (|Matrix| (|XDistributedPolynomial| VAR F)))
          (|fnc|
           (|Mapping| (|Matrix| (|XDistributedPolynomial| VAR F))
                      (|Matrix| (|XDistributedPolynomial| VAR F)))))
         (SEQ (LETT |als| (SPADCALL |f| (QREFELT % 51)))
              (SPADCALL |als| (QREFELT % 211))
              (LETT |Q_wrk| (|FDALG;regularMatrix| |als| %))
              (LETT |u_wrk|
                    (MAKE_MATRIX1 1 (QVELT |als| 0) (|spadConstant| % 90)))
              (SPADCALL |u_wrk| 1 1 (|spadConstant| % 215) (QREFELT % 228))
              (LETT |fnc| (CONS #'|FDALG;rowSpan;%S;108!0| (VECTOR % |Q_wrk|)))
              (EXIT (SPADCALL |fnc| |u_wrk| (QREFELT % 226)))))) 

(SDEFUN |FDALG;rowSpan;%S;108!0| ((|u| NIL) ($$ NIL))
        (PROG (|Q_wrk| %)
          (LETT |Q_wrk| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |u| |Q_wrk| (QREFELT % 221)))))) 

(SDEFUN |FDALG;scaleALS;%F%;109| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SPROG ((#1=#:G824 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |alpha| (QREFELT % 48))
                    (PROGN
                     (LETT #1# (SPADCALL (|spadConstant| % 49) (QREFELT % 51)))
                     (GO #2=#:G823))))
                  (EXIT (SPADCALL |f| |alpha| (QREFELT % 62)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;addALS;3%;110| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG
         ((#1=#:G841 NIL) (|lst| (|List| (|FreeMonoid| VAR))) (|als| (%))
          (|lp_f| #2=(|LinearMultivariateMatrixPencil| F)) (|lp_g| #2#)
          (|lp_new| #2#) (#3=#:G842 NIL) (#4=#:G831 NIL) (|k| NIL)
          (#5=#:G843 NIL) (|mon| (|FreeMonoid| VAR)) (#6=#:G835 NIL)
          (|pos| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT % 81))
              (COND
               ((SPADCALL (|FDALG;qeltv| (QVELT |f| 2) 1 1 %) (QREFELT % 48))
                (PROGN
                 (LETT #1# (SPADCALL |g| (QREFELT % 51)))
                 (GO #7=#:G840))))))
            (COND
             ((SPADCALL |g| (QREFELT % 81))
              (COND
               ((SPADCALL (|FDALG;qeltv| (QVELT |g| 2) 1 1 %) (QREFELT % 48))
                (PROGN (LETT #1# (SPADCALL |f| (QREFELT % 51))) (GO #7#))))))
            (LETT |lst|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (QVELT |f| 1) (QVELT |g| 1) (QREFELT % 231))
                    (QREFELT % 232))
                   (QREFELT % 233)))
            (LETT |als|
                  (SPADCALL (+ (QVELT |f| 0) (QVELT |g| 0)) |lst|
                            (QREFELT % 35)))
            (LETT |lp_f| (QVELT |f| 2)) (LETT |lp_g| (QVELT |g| 2))
            (LETT |lp_new| (QVELT |als| 2))
            (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |f| 1))) G190
                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                 (SEQ (LETT |mon| (SPADCALL (QVELT |f| 1) |k| (QREFELT % 91)))
                      (LETT |pos|
                            (PROG1
                                (LETT #4#
                                      (SPADCALL |mon| |lst| (QREFELT % 57)))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#)))
                      (|FDALG;qsetmtxu!| |lp_new| 1 |pos|
                       (|FDALG;qmtxu| |lp_f| 1 (QVELT |f| 0) |k| %) %)
                      (|FDALG;qsetmtxA!| |lp_new| 1 1 |pos|
                       (|FDALG;qmtxA| |lp_f| 1 (QVELT |f| 0) 1 (QVELT |f| 0)
                        |k| %)
                       %)
                      (EXIT
                       (|FDALG;qsetmtxv!| |lp_new| 1 |pos|
                        (|FDALG;qmtxv| |lp_f| 1 (QVELT |f| 0) |k| %) %)))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #5# (LENGTH (QVELT |g| 1))) G190
                 (COND ((|greater_SI| |k| #5#) (GO G191)))
                 (SEQ (LETT |mon| (SPADCALL (QVELT |g| 1) |k| (QREFELT % 91)))
                      (LETT |pos|
                            (PROG1
                                (LETT #6#
                                      (SPADCALL |mon| |lst| (QREFELT % 57)))
                              (|check_subtype2| (>= #6# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #6#)))
                      (|FDALG;qsetmtxu!| |lp_new| (+ (QVELT |f| 0) 1) |pos|
                       (|FDALG;qmtxu| |lp_g| 1 (QVELT |g| 0) |k| %) %)
                      (|FDALG;qsetmtxA!| |lp_new| (+ (QVELT |f| 0) 1)
                       (+ (QVELT |f| 0) 1) |pos|
                       (|FDALG;qmtxA| |lp_g| 1 (QVELT |g| 0) 1 (QVELT |g| 0)
                        |k| %)
                       %)
                      (EXIT
                       (|FDALG;qsetmtxv!| |lp_new| (+ (QVELT |f| 0) 1) |pos|
                        (|FDALG;qmtxv| |lp_g| 1 (QVELT |g| 0) |k| %) %)))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL |als| 1 (+ (QVELT |f| 0) 1)
                      (SPADCALL (|spadConstant| % 15) (QREFELT % 58))
                      (QREFELT % 134))
            (QSETVELT |als| 4 (COND ((QVELT |f| 4) (QVELT |g| 4)) ('T NIL)))
            (EXIT |als|)))
          #7# (EXIT #1#)))) 

(SDEFUN |FDALG;multiplyALS;3%;111| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG
         ((#1=#:G858 NIL) (|lst| (|List| (|FreeMonoid| VAR))) (|als| (%))
          (|lp_f| #2=(|LinearMultivariateMatrixPencil| F)) (|lp_g| #2#)
          (|lp_new| #2#) (#3=#:G859 NIL) (#4=#:G848 NIL) (|k| NIL)
          (#5=#:G860 NIL) (|mon| (|FreeMonoid| VAR)) (#6=#:G852 NIL)
          (|pos| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT % 81))
              (PROGN
               (LETT #1#
                     (SPADCALL |g| (|FDALG;qeltv| (QVELT |f| 2) 1 1 %)
                               (QREFELT % 62)))
               (GO #7=#:G857))))
            (COND
             ((SPADCALL |g| (QREFELT % 81))
              (PROGN
               (LETT #1#
                     (SPADCALL |f| (|FDALG;qeltv| (QVELT |g| 2) 1 1 %)
                               (QREFELT % 62)))
               (GO #7#))))
            (LETT |lst|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (QVELT |f| 1) (QVELT |g| 1) (QREFELT % 231))
                    (QREFELT % 232))
                   (QREFELT % 233)))
            (LETT |als|
                  (SPADCALL (+ (QVELT |f| 0) (QVELT |g| 0)) |lst|
                            (QREFELT % 35)))
            (LETT |lp_f| (QVELT |f| 2)) (LETT |lp_g| (QVELT |g| 2))
            (LETT |lp_new| (QVELT |als| 2))
            (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |f| 1))) G190
                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                 (SEQ (LETT |mon| (SPADCALL (QVELT |f| 1) |k| (QREFELT % 91)))
                      (LETT |pos|
                            (PROG1
                                (LETT #4#
                                      (SPADCALL |mon| |lst| (QREFELT % 57)))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#)))
                      (|FDALG;qsetmtxA!| |lp_new| 1 (+ (QVELT |f| 0) 1) |pos|
                       (SPADCALL (|FDALG;qmtxv| |lp_f| 1 (QVELT |f| 0) |k| %)
                                 (QREFELT % 235))
                       %)
                      (EXIT
                       (|FDALG;qsetmtxA!| |lp_new| 1 1 |pos|
                        (|FDALG;qmtxA| |lp_f| 1 (QVELT |f| 0) 1 (QVELT |f| 0)
                         |k| %)
                        %)))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #5# (LENGTH (QVELT |g| 1))) G190
                 (COND ((|greater_SI| |k| #5#) (GO G191)))
                 (SEQ (LETT |mon| (SPADCALL (QVELT |g| 1) |k| (QREFELT % 91)))
                      (LETT |pos|
                            (PROG1
                                (LETT #6#
                                      (SPADCALL |mon| |lst| (QREFELT % 57)))
                              (|check_subtype2| (>= #6# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #6#)))
                      (|FDALG;qsetmtxv!| |lp_new| (+ (QVELT |f| 0) 1) |pos|
                       (|FDALG;qmtxv| |lp_g| 1 (QVELT |g| 0) |k| %) %)
                      (EXIT
                       (|FDALG;qsetmtxA!| |lp_new| (+ (QVELT |f| 0) 1)
                        (+ (QVELT |f| 0) 1) |pos|
                        (|FDALG;qmtxA| |lp_g| 1 (QVELT |g| 0) 1 (QVELT |g| 0)
                         |k| %)
                        %)))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (QSETVELT |als| 4 (COND ((QVELT |f| 4) (QVELT |g| 4)) ('T NIL)))
            (EXIT |als|)))
          #7# (EXIT #1#)))) 

(SDEFUN |FDALG;invertALS;2%;112| ((|f| (%)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|f_inv| (%)) (|k| NIL) (#1=#:G865 NIL))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |f_inv| (SPADCALL (+ |n| 1) (QVELT |f| 1) (QREFELT % 35)))
              (|FDALG;qsetv!| (QVELT |f_inv| 2) (+ |n| 1) 1
               (|spadConstant| % 15) %)
              (SPADCALL (QVELT |f_inv| 2) (+ |n| 2) 3 1
                        (SPADCALL (QVELT |f| 2) 1 1 2 (+ |n| 1) 1
                                  (QREFELT % 20))
                        (QREFELT % 22))
              (SPADCALL (QVELT |f_inv| 2) 2 2 1
                        (SPADCALL
                         (SPADCALL (QVELT |f| 2) 2 (+ |n| 1) 1 1 1
                                   (QREFELT % 20))
                         (QREFELT % 235))
                        (QREFELT % 22))
              (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |f_inv| 1))) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (QVELT |f_inv| 2) 2 3 |k|
                               (SPADCALL (QVELT |f| 2) 2 (+ |n| 1) 2 (+ |n| 1)
                                         |k| (QREFELT % 20))
                               (QREFELT % 22))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |f_inv| 4 NIL) (QSETVELT |f_inv| 3 NIL)
              (EXIT |f_inv|)))) 

(SDEFUN |FDALG;invertSTD;2%;113| ((|f| (%)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|f_inv| (%)) (#1=#:G877 NIL)
          (|T_wrk| #2=(|Matrix| F)) (|U_wrk| #2#) (|k| NIL) (#3=#:G878 NIL)
          (#4=#:G870 NIL) (#5=#:G871 NIL)
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|))))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |f_inv| (SPADCALL (+ |n| 1) (QVELT |f| 1) (QREFELT % 35)))
              (|FDALG;qsetv!| (QVELT |f_inv| 2) (+ |n| 1) 1
               (|spadConstant| % 15) %)
              (SPADCALL (QVELT |f_inv| 2) (+ |n| 2) 3 1
                        (SPADCALL (QVELT |f| 2) 1 1 2 (+ |n| 1) 1
                                  (QREFELT % 20))
                        (QREFELT % 22))
              (SPADCALL (QVELT |f_inv| 2) 2 2 1
                        (SPADCALL
                         (SPADCALL (QVELT |f| 2) 2 (+ |n| 1) 1 1 1
                                   (QREFELT % 20))
                         (QREFELT % 235))
                        (QREFELT % 22))
              (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |f_inv| 1))) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (QVELT |f_inv| 2) 2 3 |k|
                               (SPADCALL (QVELT |f| 2) 2 (+ |n| 1) 2 (+ |n| 1)
                                         |k| (QREFELT % 20))
                               (QREFELT % 22))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |T_wrk|
                    (MAKE_MATRIX1 (+ |n| 2) (+ |n| 2) (|spadConstant| % 50)))
              (LETT |U_wrk|
                    (MAKE_MATRIX1 (+ |n| 2) (+ |n| 2) (|spadConstant| % 50)))
              (QSETAREF2O |T_wrk| 1 1 (|spadConstant| % 15) 1 1)
              (QSETAREF2O |T_wrk| (+ |n| 2) (+ |n| 2) (|spadConstant| % 15) 1
                          1)
              (QSETAREF2O |U_wrk| 1 1 (|spadConstant| % 15) 1 1)
              (QSETAREF2O |U_wrk| 2 2 (|spadConstant| % 15) 1 1)
              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (QSETAREF2O |T_wrk| (+ |k| 1)
                                (PROG1 (LETT #4# (- (+ |n| 2) |k|))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (SPADCALL (|spadConstant| % 15) (QREFELT % 58))
                                1 1)
                    (EXIT
                     (QSETAREF2O |U_wrk| (+ |k| 2)
                                 (PROG1 (LETT #5# (- (+ |n| 3) |k|))
                                   (|check_subtype2| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                 (|spadConstant| % 15) 1 1)))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (QVELT |f_inv| 2) |T_wrk| (QREFELT % 206))
              (SPADCALL (QVELT |f_inv| 2) |U_wrk| (QREFELT % 208))
              (LETT |blo_mtx| (SPADCALL |f_inv| (QREFELT % 153)))
              (QSETVELT |f_inv| 3 NIL) (QSETVELT |f_inv| 4 NIL)
              (COND
               ((EQL (SPADCALL |blo_mtx| (QREFELT % 154)) (QVELT |f_inv| 0))
                (QSETVELT |f_inv| 4 'T)))
              (EXIT |f_inv|)))) 

(SDEFUN |FDALG;factors;%L;114| ((|f| (%)) (% (|List| %)))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)) (#1=#:G910 NIL) (#2=#:G883 NIL)
          (|k| NIL) (|n_1| (|NonNegativeInteger|)) (#3=#:G885 NIL)
          (|n_2| (|NonNegativeInteger|)) (|flg_ur| #4=(|Boolean|))
          (|flg_uc| (|Boolean|)) (|flg_uv| (|Boolean|)) (|flg_00| #4#)
          (|flg_10| #4#) (#5=#:G888 NIL) (|flg_01| #4#) (#6=#:G911 NIL)
          (#7=#:G912 NIL) (|f_1| (%)) (|f_2| (%)) (|l| NIL) (#8=#:G913 NIL)
          (|als| (%)) (|n| (|NonNegativeInteger|)) (|lst_fct| (|List| %)))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_fct| NIL) (LETT |als| (SPADCALL |f| (QREFELT % 51)))
                (LETT |blo_mtx| (SPADCALL |als| (QREFELT % 153)))
                (LETT |m| (SPADCALL |blo_mtx| (QREFELT % 154)))
                (COND
                 ((EQL |m| 1)
                  (SEQ
                   (LETT |lst_fct| (SPADCALL |als| |lst_fct| (QREFELT % 240)))
                   (EXIT (PROGN (LETT #1# |lst_fct|) (GO #9=#:G909))))))
                (LETT |n| (QVELT |als| 0))
                (SEQ
                 (LETT |k|
                       (PROG1 (LETT #2# (- |m| 1))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#)))
                 G190 (COND ((< |k| 1) (GO G191)))
                 (SEQ (LETT |n_1| (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184)))
                      (LETT |n_2|
                            (PROG1 (LETT #3# (- |n| |n_1|))
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#)))
                      (LETT |flg_ur| 'T)
                      (COND
                       ((< (+ |n_1| 1) |n|)
                        (LETT |flg_ur|
                              (SPADCALL |als| 1 |n_1| (+ |n_1| 2) |n|
                                        (QREFELT % 146)))))
                      (LETT |flg_uc|
                            (|FDALG;qsemizeroA?| (QVELT |als| 2) 1 |n_1|
                             (+ |n_1| 1) (+ |n_1| 1) 1 %))
                      (LETT |flg_uv|
                            (|FDALG;qzerov?| (QVELT |als| 2) 1 |n_1| %))
                      (LETT |flg_00| NIL) (LETT |flg_10| NIL)
                      (LETT |flg_01| NIL)
                      (COND
                       (|flg_ur|
                        (COND
                         (|flg_uv|
                          (SEQ (COND (|flg_uc| (LETT |flg_00| 'T)))
                               (COND
                                ((NULL |flg_00|)
                                 (COND
                                  ((NULL
                                    (|FDALG;qsemizeroA?| (QVELT |als| 2)
                                     (+ |n_1| 1) |n| (+ |n_1| 1) |n| 1 %))
                                   (LETT |flg_10| 'T)))))
                               (EXIT
                                (COND
                                 ((NULL |flg_00|)
                                  (COND
                                   ((NULL |flg_10|)
                                    (COND
                                     ((> |n_1| 1)
                                      (COND
                                       ((SPADCALL |als| 1
                                                  (PROG1 (LETT #5# (- |n_1| 1))
                                                    (|check_subtype2|
                                                     (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                                  (+ |n_1| 1) (+ |n_1| 1)
                                                  (QREFELT % 146))
                                        (LETT |flg_01| 'T)))))))))))))))
                      (COND
                       (|flg_00|
                        (SEQ
                         (LETT |f_1|
                               (SPADCALL |n_1| (QVELT |als| 1) (QREFELT % 35)))
                         (LETT |f_2|
                               (SPADCALL |n_2| (QVELT |als| 1) (QREFELT % 35)))
                         (SEQ (LETT |l| 1) (LETT #6# (LENGTH (QVELT |als| 1)))
                              G190 (COND ((|greater_SI| |l| #6#) (GO G191)))
                              (SEQ
                               (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                                (|FDALG;qmtxA| (QVELT |als| 2) 1 |n_1| 1 |n_1|
                                 |l| %)
                                %)
                               (EXIT
                                (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 1 |l|
                                 (|FDALG;qmtxA| (QVELT |als| 2) (+ |n_1| 1) |n|
                                  (+ |n_1| 1) |n| |l| %)
                                 %)))
                              (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                              (EXIT NIL))
                         (|FDALG;qsetmtxv!| (QVELT |f_1| 2) 1 1
                          (SPADCALL
                           (|FDALG;qmtxA| (QVELT |als| 2) 1 |n_1| (+ |n_1| 1)
                            (+ |n_1| 1) 1 %)
                           (QREFELT % 235))
                          %)
                         (EXIT
                          (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
                           (|FDALG;qmtxv| (QVELT |als| 2) (+ |n_1| 1) |n| 1 %)
                           %)))))
                      (COND
                       (|flg_01|
                        (SEQ
                         (LETT |f_1|
                               (SPADCALL |n_1| (QVELT |als| 1) (QREFELT % 35)))
                         (LETT |f_2|
                               (SPADCALL (+ |n_2| 1) (QVELT |als| 1)
                                         (QREFELT % 35)))
                         (SEQ (LETT |l| 1) (LETT #7# (LENGTH (QVELT |als| 1)))
                              G190 (COND ((|greater_SI| |l| #7#) (GO G191)))
                              (SEQ
                               (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                                (|FDALG;qmtxA| (QVELT |als| 2) 1 |n_1| 1 |n_1|
                                 |l| %)
                                %)
                               (EXIT
                                (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 2 |l|
                                 (|FDALG;qmtxA| (QVELT |als| 2) |n_1| |n|
                                  (+ |n_1| 1) |n| |l| %)
                                 %)))
                              (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                              (EXIT NIL))
                         (|FDALG;qsetA!| (QVELT |f_2| 2) 1 1 1
                          (|spadConstant| % 15) %)
                         (|FDALG;qsetv!| (QVELT |f_1| 2) |n_1| 1
                          (|spadConstant| % 15) %)
                         (EXIT
                          (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
                           (|FDALG;qmtxv| (QVELT |als| 2) |n_1| |n| 1 %) %)))))
                      (COND
                       (|flg_10|
                        (SEQ
                         (LETT |f_1|
                               (SPADCALL (+ |n_1| 1) (QVELT |als| 1)
                                         (QREFELT % 35)))
                         (LETT |f_2|
                               (SPADCALL |n_2| (QVELT |als| 1) (QREFELT % 35)))
                         (SEQ (LETT |l| 1) (LETT #8# (LENGTH (QVELT |als| 1)))
                              G190 (COND ((|greater_SI| |l| #8#) (GO G191)))
                              (SEQ
                               (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                                (|FDALG;qmtxA| (QVELT |als| 2) 1 |n_1| 1
                                 (+ |n_1| 1) |l| %)
                                %)
                               (EXIT
                                (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 1 |l|
                                 (|FDALG;qmtxA| (QVELT |als| 2) (+ |n_1| 1) |n|
                                  (+ |n_1| 1) |n| |l| %)
                                 %)))
                              (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                              (EXIT NIL))
                         (|FDALG;qsetA!| (QVELT |f_1| 2) (+ |n_1| 1)
                          (+ |n_1| 1) 1 (|spadConstant| % 15) %)
                         (|FDALG;qsetv!| (QVELT |f_1| 2) (+ |n_1| 1) 1
                          (|spadConstant| % 15) %)
                         (EXIT
                          (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
                           (|FDALG;qmtxv| (QVELT |als| 2) (+ |n_1| 1) |n| 1 %)
                           %)))))
                      (EXIT
                       (COND
                        ((OR (OR |flg_00| |flg_01|) |flg_10|)
                         (SEQ (QSETVELT |f_2| 4 (QVELT |f| 4))
                              (QSETVELT |f_2| 3 (QVELT |f| 3))
                              (LETT |lst_fct|
                                    (SPADCALL |f_2| |lst_fct| (QREFELT % 240)))
                              (LETT |als| |f_1|)
                              (EXIT (LETT |n| (QVELT |als| 0))))))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                (QSETVELT |als| 4 (QVELT |f| 4))
                (QSETVELT |als| 3 (QVELT |f| 3))
                (LETT |lst_fct| (SPADCALL |als| |lst_fct| (QREFELT % 240)))
                (EXIT |lst_fct|)))
          #9# (EXIT #1#)))) 

(SDEFUN |FDALG;summands;%L;115| ((|f| (%)) (% (|List| %)))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)) (#1=#:G944 NIL) (#2=#:G918 NIL)
          (|k| NIL) (|n_1| (|NonNegativeInteger|)) (#3=#:G920 NIL)
          (|n_2| (|NonNegativeInteger|))
          (|lst_1| #4=(|List| (|NonNegativeInteger|))) (|lst_2| #4#)
          (|lst_3| #4#) (|lst_4| #4#) (|trn_wrk| (|List| (|Matrix| F)))
          (|f_1| (%)) (|l| NIL) (#5=#:G945 NIL) (#6=#:G946 NIL) (|u_wrk| (F))
          (|idx_u| (|NonNegativeInteger|)) (#7=#:G943 NIL) (|f_2| (%))
          (|j| NIL) (#8=#:G947 NIL) (|u_tmp| (F)) (|als| (%))
          (|n| (|NonNegativeInteger|)) (|lst_sum| (|List| %)))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_sum| NIL) (LETT |als| (SPADCALL |f| (QREFELT % 51)))
                (LETT |blo_mtx| (SPADCALL |als| (QREFELT % 153)))
                (LETT |m| (SPADCALL |blo_mtx| (QREFELT % 154)))
                (COND
                 ((EQL |m| 1)
                  (SEQ
                   (LETT |lst_sum| (SPADCALL |als| |lst_sum| (QREFELT % 240)))
                   (EXIT (PROGN (LETT #1# |lst_sum|) (GO #9=#:G942))))))
                (LETT |n| (QVELT |als| 0))
                (SEQ
                 (LETT |k|
                       (PROG1 (LETT #2# (- |m| 1))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#)))
                 G190 (COND ((< |k| 1) (GO G191)))
                 (SEQ (LETT |n_1| (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184)))
                      (LETT |n_2|
                            (PROG1 (LETT #3# (- |n| |n_1|))
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#)))
                      (LETT |lst_1| (SPADCALL (+ |n_1| 1) |n| (QREFELT % 28)))
                      (LETT |lst_2| (SPADCALL 1 |n_1| (QREFELT % 28)))
                      (LETT |lst_3| (SPADCALL 1 |n_1| (QREFELT % 28)))
                      (LETT |lst_4| (SPADCALL (+ |n_1| 1) |n| (QREFELT % 28)))
                      (LETT |trn_wrk|
                            (|FDALG;qblockElimination| |als| |lst_1| |lst_2|
                             NIL |lst_3| |lst_4| NIL %))
                      (EXIT
                       (COND
                        ((> (LENGTH |trn_wrk|) 0)
                         (SEQ
                          (SPADCALL (QVELT |als| 2)
                                    (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                                    (QREFELT % 206))
                          (SPADCALL (QVELT |als| 2)
                                    (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                                    (QREFELT % 208))
                          (LETT |f_1|
                                (SPADCALL |n_1| (QVELT |als| 1)
                                          (QREFELT % 35)))
                          (LETT |f_2|
                                (SPADCALL |n_2| (QVELT |als| 1)
                                          (QREFELT % 35)))
                          (SEQ (LETT |l| 1) (LETT #5# (LENGTH (QVELT |als| 1)))
                               G190 (COND ((|greater_SI| |l| #5#) (GO G191)))
                               (SEQ
                                (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                                 (|FDALG;qmtxA| (QVELT |als| 2) 1 |n_1| 1 |n_1|
                                  |l| %)
                                 %)
                                (EXIT
                                 (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 1 |l|
                                  (|FDALG;qmtxA| (QVELT |als| 2) (+ |n_1| 1)
                                   |n| (+ |n_1| 1) |n| |l| %)
                                  %)))
                               (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                               (EXIT NIL))
                          (|FDALG;qsetmtxv!| (QVELT |f_1| 2) 1 1
                           (|FDALG;qmtxv| (QVELT |als| 2) 1 |n_1| 1 %) %)
                          (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
                           (|FDALG;qmtxv| (QVELT |als| 2) (+ |n_1| 1) |n| 1 %)
                           %)
                          (|FDALG;qsetmtxu!| (QVELT |f_2| 2) 1 1
                           (|FDALG;qmtxu| (QVELT |als| 2) (+ |n_1| 1) |n| 1 %)
                           %)
                          (LETT |idx_u| 0) (LETT |u_wrk| (|spadConstant| % 50))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #6# (QVELT |f_2| 0)) G190
                                 (COND ((|greater_SI| |j| #6#) (GO G191)))
                                 (SEQ
                                  (LETT |u_wrk|
                                        (|FDALG;qeltu| (QVELT |f_2| 2) |j| 1
                                         %))
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |u_wrk| (QREFELT % 48)))
                                     (SEQ (LETT |idx_u| |j|)
                                          (EXIT
                                           (PROGN
                                            (LETT #7# 1)
                                            (GO #10=#:G927))))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL)))
                           #10# (EXIT #7#))
                          (COND
                           ((SPADCALL |u_wrk| (QREFELT % 48))
                            (LETT |f_2|
                                  (SPADCALL (|spadConstant| % 49)
                                            (QREFELT % 51))))
                           ('T
                            (SEQ
                             (COND
                              ((SPADCALL |idx_u| 1 (QREFELT % 39))
                               (SPADCALL (QVELT |f_2| 2) (+ 1 1) (+ 1 |idx_u|)
                                         (QREFELT % 128))))
                             (COND
                              ((NULL
                                (SPADCALL |u_wrk| (|spadConstant| % 15)
                                          (QREFELT % 76)))
                               (SEQ
                                (SPADCALL (QVELT |f_2| 2) (+ 1 1)
                                          (SPADCALL (|spadConstant| % 15)
                                                    |u_wrk| (QREFELT % 209))
                                          (QREFELT % 126))
                                (EXIT
                                 (SEQ (LETT |j| 2) (LETT #8# |n_2|) G190
                                      (COND ((|greater_SI| |j| #8#) (GO G191)))
                                      (SEQ
                                       (LETT |u_tmp|
                                             (|FDALG;qeltu| (QVELT |f_2| 2) |j|
                                              1 %))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL |u_tmp| (QREFELT % 48)))
                                          (SPADCALL (QVELT |f_2| 2) (+ 1 1)
                                                    (+ |j| 1)
                                                    (SPADCALL |u_tmp|
                                                              (QREFELT % 58))
                                                    (QREFELT % 119))))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))))))
                             (SPADCALL |f_2| (QREFELT % 213))
                             (QSETVELT |f_2| 4 (QVELT |f| 4))
                             (EXIT (QSETVELT |f_2| 3 (QVELT |f| 3))))))
                          (LETT |lst_sum|
                                (SPADCALL |f_2| |lst_sum| (QREFELT % 240)))
                          (LETT |als| |f_1|)
                          (EXIT (LETT |n| (QVELT |als| 0))))))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((> (SPADCALL |lst_sum| (QREFELT % 243)) 0)
                  (SEQ (SPADCALL |f_1| (QREFELT % 213))
                       (QSETVELT |f_1| 4 (QVELT |f| 4))
                       (QSETVELT |f_1| 3 (QVELT |f| 3))
                       (EXIT
                        (LETT |lst_sum|
                              (SPADCALL |f_1| |lst_sum| (QREFELT % 240))))))
                 ('T
                  (LETT |lst_sum|
                        (SPADCALL (SPADCALL |f| (QREFELT % 51)) |lst_sum|
                                  (QREFELT % 240)))))
                (EXIT |lst_sum|)))
          #9# (EXIT #1#)))) 

(SDEFUN |FDALG;ratexprPolynomial|
        ((|p| (|XDistributedPolynomial| VAR F)) (% (|OutputForm|)))
        (SPROG
         ((|sup_wrk| (|List| (|FreeMonoid| VAR))) (|out_wrk| (|OutputForm|)))
         (SEQ (LETT |sup_wrk| (SPADCALL |p| (QREFELT % 245)))
              (LETT |out_wrk| (SPADCALL |p| (QREFELT % 187)))
              (COND
               ((OR (> (LENGTH |sup_wrk|) 1)
                    (OR (> (SPADCALL (|SPADfirst| |sup_wrk|) (QREFELT % 36)) 1)
                        (SPADCALL (SPADCALL |p| (QREFELT % 247))
                                  (|spadConstant| % 15) (QREFELT % 248))))
                (LETT |out_wrk| (SPADCALL |out_wrk| (QREFELT % 246)))))
              (EXIT |out_wrk|)))) 

(SDEFUN |FDALG;leftFamily;%L;117| ((|f| (%)) (% (|List| (|OutputForm|))))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|))
          (|a_idx| (|List| (|List| (|NonNegativeInteger|))))
          (|p_wrk| (|List| (|XDistributedPolynomial| VAR F))) (#1=#:G977 NIL)
          (#2=#:G978 NIL) (|s_lst| (|List| (|OutputForm|))) (|i| NIL)
          (|j| (|NonNegativeInteger|)) (|flg_wrk| (|Boolean|)) (#3=#:G979 NIL))
         (SEQ (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
              (LETT |n| (QVELT |f| 0))
              (EXIT
               (COND
                ((< (SPADCALL |blo_mtx| (QREFELT % 154)) |n|)
                 (|error| "FDALG: leftFamily(%) - not upper triangular."))
                ('T
                 (SEQ (LETT |a_idx| (SPADCALL |n| NIL (QREFELT % 250)))
                      (LETT |p_wrk|
                            (SPADCALL |n| (|spadConstant| % 90)
                                      (QREFELT % 252)))
                      (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (SPADCALL |p_wrk| |i|
                                      (SPADCALL |f| |i| |i| (QREFELT % 96))
                                      (QREFELT % 253))
                            (SPADCALL |p_wrk| |i|
                                      (SPADCALL |p_wrk| |i| (QREFELT % 254))
                                      (QREFELT % 253))
                            (EXIT
                             (SEQ (LETT |j| (+ |i| 1)) (LETT #2# |n|) G190
                                  (COND ((> |j| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (|FDALG;qzeroA?| (QVELT |f| 2) |i| |j|
                                        %))
                                      (SPADCALL |a_idx| |i|
                                                (CONS |j|
                                                      (SPADCALL |a_idx| |i|
                                                                (QREFELT %
                                                                         255)))
                                                (QREFELT % 256))))))
                                  (LETT |j| (+ |j| 1)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (LETT |s_lst|
                            (SPADCALL |n| (SPADCALL 0 (QREFELT % 257))
                                      (QREFELT % 186)))
                      (SEQ (LETT |i| |n|) G190 (COND ((< |i| 1) (GO G191)))
                           (SEQ (LETT |flg_wrk| NIL)
                                (SPADCALL |s_lst| |i|
                                          (SPADCALL
                                           (|FDALG;qeltv| (QVELT |f| 2) |i| 1
                                            %)
                                           (QREFELT % 258))
                                          (QREFELT % 259))
                                (COND
                                 ((< |i| |n|)
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (|FDALG;qeltv| (QVELT |f| 2) |i| 1 %)
                                      (QREFELT % 48)))
                                    (LETT |flg_wrk| 'T)))))
                                (COND
                                 ((>
                                   (SPADCALL
                                    (SPADCALL |a_idx| |i| (QREFELT % 255))
                                    (QREFELT % 140))
                                   0)
                                  (SEQ
                                   (LETT |j|
                                         (|SPADfirst|
                                          (SPADCALL |a_idx| |i|
                                                    (QREFELT % 255))))
                                   (COND
                                    ((EQL |j| |n|)
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |p_wrk| |j| (QREFELT % 254))
                                        (|spadConstant| % 215) (QREFELT % 260))
                                       (COND
                                        (|flg_wrk|
                                         (SPADCALL |s_lst| |i|
                                                   (SPADCALL
                                                    (SPADCALL |s_lst| |i|
                                                              (QREFELT % 261))
                                                    (|FDALG;ratexprPolynomial|
                                                     (SPADCALL
                                                      (SPADCALL |f| |i| |j|
                                                                (QREFELT % 96))
                                                      (QREFELT % 190))
                                                     %)
                                                    (QREFELT % 262))
                                                   (QREFELT % 259)))
                                        ('T
                                         (SEQ
                                          (SPADCALL |s_lst| |i|
                                                    (|FDALG;ratexprPolynomial|
                                                     (SPADCALL
                                                      (SPADCALL |f| |i| |j|
                                                                (QREFELT % 96))
                                                      (QREFELT % 190))
                                                     %)
                                                    (QREFELT % 259))
                                          (EXIT (LETT |flg_wrk| 'T))))))
                                      (|flg_wrk|
                                       (SPADCALL |s_lst| |i|
                                                 (SPADCALL
                                                  (SPADCALL |s_lst| |i|
                                                            (QREFELT % 261))
                                                  (SPADCALL
                                                   (|FDALG;ratexprPolynomial|
                                                    (SPADCALL
                                                     (SPADCALL |f| |i| |j|
                                                               (QREFELT % 96))
                                                     (QREFELT % 190))
                                                    %)
                                                   (SPADCALL |s_lst| |j|
                                                             (QREFELT % 261))
                                                   (QREFELT % 182))
                                                  (QREFELT % 262))
                                                 (QREFELT % 259)))
                                      ('T
                                       (SEQ
                                        (SPADCALL |s_lst| |i|
                                                  (SPADCALL
                                                   (|FDALG;ratexprPolynomial|
                                                    (SPADCALL
                                                     (SPADCALL |f| |i| |j|
                                                               (QREFELT % 96))
                                                     (QREFELT % 190))
                                                    %)
                                                   (SPADCALL |s_lst| |j|
                                                             (QREFELT % 261))
                                                   (QREFELT % 182))
                                                  (QREFELT % 259))
                                        (EXIT (LETT |flg_wrk| 'T))))))
                                    (|flg_wrk|
                                     (SPADCALL |s_lst| |i|
                                               (SPADCALL
                                                (SPADCALL |s_lst| |i|
                                                          (QREFELT % 261))
                                                (SPADCALL
                                                 (|FDALG;ratexprPolynomial|
                                                  (SPADCALL
                                                   (SPADCALL |f| |i| |j|
                                                             (QREFELT % 96))
                                                   (QREFELT % 190))
                                                  %)
                                                 (SPADCALL |s_lst| |j|
                                                           (QREFELT % 261))
                                                 (QREFELT % 182))
                                                (QREFELT % 262))
                                               (QREFELT % 259)))
                                    ('T
                                     (SEQ
                                      (SPADCALL |s_lst| |i|
                                                (SPADCALL
                                                 (|FDALG;ratexprPolynomial|
                                                  (SPADCALL
                                                   (SPADCALL |f| |i| |j|
                                                             (QREFELT % 96))
                                                   (QREFELT % 190))
                                                  %)
                                                 (SPADCALL |s_lst| |j|
                                                           (QREFELT % 261))
                                                 (QREFELT % 182))
                                                (QREFELT % 259))
                                      (EXIT (LETT |flg_wrk| 'T)))))
                                   (EXIT
                                    (SEQ
                                     (LETT #3#
                                           (CDR
                                            (SPADCALL |a_idx| |i|
                                                      (QREFELT % 255))))
                                     G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN (LETT |j| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SPADCALL |s_lst| |i|
                                                 (SPADCALL
                                                  (SPADCALL |s_lst| |i|
                                                            (QREFELT % 261))
                                                  (SPADCALL
                                                   (|FDALG;ratexprPolynomial|
                                                    (SPADCALL
                                                     (SPADCALL |f| |i| |j|
                                                               (QREFELT % 96))
                                                     (QREFELT % 190))
                                                    %)
                                                   (SPADCALL |s_lst| |j|
                                                             (QREFELT % 261))
                                                   (QREFELT % 182))
                                                  (QREFELT % 262))
                                                 (QREFELT % 259))))
                                     (LETT #3# (CDR #3#)) (GO G190) G191
                                     (EXIT NIL))))))
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL |p_wrk| |i| (QREFELT % 254))
                                    (|spadConstant| % 215) (QREFELT % 260)))
                                  (SPADCALL |s_lst| |i|
                                            (SPADCALL
                                             (SPADCALL
                                              (|FDALG;ratexprPolynomial|
                                               (SPADCALL |p_wrk| |i|
                                                         (QREFELT % 254))
                                               %)
                                              (SPADCALL -1 (QREFELT % 257))
                                              (QREFELT % 263))
                                             (SPADCALL |s_lst| |i|
                                                       (QREFELT % 261))
                                             (QREFELT % 182))
                                            (QREFELT % 259))))
                                (EXIT
                                 (COND
                                  ((> |i| 1)
                                   (COND
                                    ((< |i| |n|)
                                     (SPADCALL |s_lst| |i|
                                               (SPADCALL
                                                (SPADCALL |s_lst| |i|
                                                          (QREFELT % 261))
                                                (QREFELT % 246))
                                               (QREFELT % 259))))))))
                           (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                      (EXIT |s_lst|)))))))) 

(SDEFUN |FDALG;ratexprInverse;%BOf;118|
        ((|f| (%)) (|flg| (|Boolean|)) (% (|OutputForm|)))
        (SPROG
         ((|f_wrk| (%)) (|p_wrk| (|XDistributedPolynomial| VAR F))
          (|s_wrk| (|List| (|FreeMonoid| VAR))) (|sum_f| (|List| %))
          (|sym_d| (|OutputForm|)) (|sym_r| (|OutputForm|)) (#1=#:G1000 NIL)
          (|g| NIL) (#2=#:G1001 NIL) (|o_wrk| (|OutputForm|)))
         (SEQ
          (EXIT
           (SEQ (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
                (SPADCALL |f_wrk| (QREFELT % 211))
                (SPADCALL |f_wrk| (QREFELT % 210))
                (COND
                 ((|FDALG;polynomialForm?| |f_wrk| %)
                  (SEQ (LETT |p_wrk| (SPADCALL |f_wrk| (QREFELT % 217)))
                       (LETT |s_wrk| (SPADCALL |p_wrk| (QREFELT % 245)))
                       (COND
                        ((EQL (LENGTH |s_wrk|) 1)
                         (COND
                          ((<= (SPADCALL (|SPADfirst| |s_wrk|) (QREFELT % 36))
                               1)
                           (COND
                            ((SPADCALL (SPADCALL |p_wrk| (QREFELT % 247))
                                       (|spadConstant| % 15) (QREFELT % 76))
                             (PROGN
                              (LETT #1# (SPADCALL |p_wrk| (QREFELT % 187)))
                              (GO #3=#:G999))))))))
                       (COND
                        (|flg|
                         (PROGN
                          (LETT #1#
                                (SPADCALL (SPADCALL |p_wrk| (QREFELT % 187))
                                          (QREFELT % 246)))
                          (GO #3#))))
                       (EXIT
                        (PROGN
                         (LETT #1# (SPADCALL |p_wrk| (QREFELT % 187)))
                         (GO #3#))))))
                (LETT |f_wrk| (SPADCALL |f| (QREFELT % 265)))
                (SPADCALL |f_wrk| (QREFELT % 211))
                (SPADCALL |f_wrk| (QREFELT % 210))
                (COND
                 ((|FDALG;polynomialForm?| |f_wrk| %)
                  (SEQ (LETT |p_wrk| (SPADCALL |f_wrk| (QREFELT % 217)))
                       (LETT |s_wrk| (SPADCALL |p_wrk| (QREFELT % 245)))
                       (COND
                        ((EQL (LENGTH (SPADCALL |p_wrk| (QREFELT % 245))) 1)
                         (COND
                          ((<= (SPADCALL (|SPADfirst| |s_wrk|) (QREFELT % 36))
                               1)
                           (COND
                            ((SPADCALL (SPADCALL |p_wrk| (QREFELT % 247))
                                       (|spadConstant| % 15) (QREFELT % 76))
                             (PROGN
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL |p_wrk| (QREFELT % 187))
                                     (SPADCALL -1 (QREFELT % 257))
                                     (QREFELT % 263)))
                              (GO #3#))))))))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p_wrk| (QREFELT % 187))
                                          (QREFELT % 246))
                                (SPADCALL -1 (QREFELT % 257)) (QREFELT % 263)))
                         (GO #3#))))))
                (LETT |sum_f| NIL)
                (LETT |sum_f| (SPADCALL |f| |sum_f| (QREFELT % 240)))
                (LETT |sum_f| (SPADCALL |f| (QREFELT % 244)))
                (COND
                 ((EQL (SPADCALL |sum_f| (QREFELT % 243)) 1)
                  (SEQ
                   (COND
                    ((EQL
                      (SPADCALL (SPADCALL |f| (QREFELT % 153)) (QREFELT % 154))
                      (QVELT |f| 0))
                     (SEQ
                      (LETT |o_wrk|
                            (|SPADfirst| (SPADCALL |f| (QREFELT % 264))))
                      (COND
                       (|flg|
                        (LETT |o_wrk| (SPADCALL |o_wrk| (QREFELT % 246)))))
                      (EXIT (PROGN (LETT #1# |o_wrk|) (GO #3#))))))
                   (LETT |sym_d| (SPADCALL '|d| (QREFELT % 172)))
                   (LETT |sym_r| (SPADCALL '|r| (QREFELT % 172)))
                   (LETT |o_wrk|
                         (COND ((SPADCALL |f| (QREFELT % 71)) |sym_r|)
                               ('T |sym_d|)))
                   (LETT |o_wrk|
                         (SPADCALL
                          (SPADCALL |o_wrk|
                                    (SPADCALL (QVELT |f| 0) (QREFELT % 173))
                                    (QREFELT % 266))
                          (QREFELT % 246)))
                   (EXIT (PROGN (LETT #1# |o_wrk|) (GO #3#))))))
                (LETT |o_wrk|
                      (SPADCALL (SPADCALL |sum_f| (QREFELT % 267)) NIL
                                (QREFELT % 268)))
                (SEQ (LETT |g| NIL)
                     (LETT #2# (SPADCALL |sum_f| (QREFELT % 269))) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |o_wrk|
                             (SPADCALL |o_wrk|
                                       (SPADCALL |g| NIL (QREFELT % 268))
                                       (QREFELT % 262)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 (|flg| (LETT |o_wrk| (SPADCALL |o_wrk| (QREFELT % 246)))))
                (EXIT |o_wrk|)))
          #3# (EXIT #1#)))) 

(SDEFUN |FDALG;ratexpr;%Of;119| ((|f| (%)) (% (|OutputForm|)))
        (SPROG
         ((|fct_f| (|List| %)) (|sum_f| (|List| %)) (|fct| NIL)
          (#1=#:G1013 NIL) (|sum| NIL) (#2=#:G1014 NIL) (#3=#:G1012 NIL)
          (|out_of| (|OutputForm|)))
         (SEQ
          (EXIT
           (SEQ (LETT |fct_f| (SPADCALL |f| (QREFELT % 242)))
                (LETT |sum_f| (SPADCALL |f| (QREFELT % 244)))
                (COND
                 ((> (SPADCALL |fct_f| (QREFELT % 243)) 1)
                  (SEQ
                   (LETT |out_of|
                         (SPADCALL (SPADCALL |fct_f| (QREFELT % 267)) 'T
                                   (QREFELT % 268)))
                   (SEQ (LETT |fct| NIL)
                        (LETT #1# (SPADCALL |fct_f| (QREFELT % 269))) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |fct| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |out_of|
                                (SPADCALL |out_of|
                                          (SPADCALL |fct| 'T (QREFELT % 268))
                                          (QREFELT % 182)))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #3# |out_of|) (GO #4=#:G1011))))))
                (COND
                 ((> (SPADCALL |sum_f| (QREFELT % 243)) 1)
                  (SEQ
                   (LETT |out_of|
                         (SPADCALL (SPADCALL |sum_f| (QREFELT % 267)) 'T
                                   (QREFELT % 268)))
                   (SEQ (LETT |sum| NIL)
                        (LETT #2# (SPADCALL |sum_f| (QREFELT % 269))) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |sum| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |out_of|
                                (SPADCALL |out_of|
                                          (SPADCALL |sum| NIL (QREFELT % 268))
                                          (QREFELT % 262)))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #3# |out_of|) (GO #4#))))))
                (LETT |out_of|
                      (SPADCALL (SPADCALL |fct_f| (QREFELT % 267)) NIL
                                (QREFELT % 268)))
                (EXIT |out_of|)))
          #4# (EXIT #3#)))) 

(SDEFUN |FDALG;coerce;%Of;120| ((|f| (%)) (% (|OutputForm|)))
        (SPROG
         ((|sym| (|OutputForm|)) (|sym_M| (|OutputForm|))
          (|sym_R| (|OutputForm|)) (|flg_of| (|OutputForm|))
          (|rex_of| (|OutputForm|)) (|lst_of| (|List| (|OutputForm|))))
         (SEQ (LETT |lst_of| NIL)
              (COND
               ((QVELT |f| 7)
                (SEQ (LETT |rex_of| (SPADCALL |f| (QREFELT % 270)))
                     (COND
                      ((QVELT |f| 6)
                       (LETT |rex_of|
                             (LETT |rex_of|
                                   (SPADCALL (SPADCALL 1 (QREFELT % 185))
                                             |rex_of| (QREFELT % 266))))))
                     (EXIT (LETT |lst_of| (CONS |rex_of| |lst_of|))))))
              (COND
               ((QVELT |f| 6)
                (SEQ (LETT |sym| (SPADCALL '? (QREFELT % 172)))
                     (LETT |sym_M| (SPADCALL 'M (QREFELT % 172)))
                     (LETT |sym_R| (SPADCALL 'R (QREFELT % 172)))
                     (LETT |flg_of| (SPADCALL 1 (QREFELT % 185)))
                     (LETT |flg_of|
                           (SPADCALL |flg_of|
                                     (COND
                                      ((SPADCALL |f| (QREFELT % 71)) |sym_M|)
                                      (#1='T |sym|))
                                     (QREFELT % 266)))
                     (LETT |flg_of|
                           (SPADCALL |flg_of|
                                     (COND
                                      ((SPADCALL |f| (QREFELT % 155)) |sym_R|)
                                      (#1# |sym|))
                                     (QREFELT % 266)))
                     (LETT |lst_of| (CONS |flg_of| |lst_of|))
                     (EXIT
                      (LETT |lst_of|
                            (CONS (SPADCALL |f| (QREFELT % 189)) |lst_of|))))))
              (COND
               ((NULL (QVELT |f| 7))
                (COND
                 ((NULL (QVELT |f| 6))
                  (SEQ (LETT |rex_of| (SPADCALL |f| (QREFELT % 270)))
                       (EXIT (LETT |lst_of| (CONS |rex_of| |lst_of|))))))))
              (EXIT (SPADCALL |lst_of| (QREFELT % 271)))))) 

(SDEFUN |FDALG;leftFactor;%Nni%;121|
        ((|f| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1033 NIL)
          (|i_max| (|NonNegativeInteger|))
          (|lst_2| #2=(|List| (|NonNegativeInteger|))) (|lst_4| #2#)
          (|lst_1| #2#) (|lst_3| #2#) (|trn_wrk| (|List| (|Matrix| F)))
          (#3=#:G1041 NIL) (|f_wrk| (%)) (|f_1| (%)) (|l| NIL)
          (#4=#:G1042 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP |k|) (> |k| (QVELT |f| 0)))
             (|error| "FDALG: leftFactor(f, k) - invalid rank."))
            ((NULL (|FDALG;polynomialForm?| |f| %))
             (|error|
              "FDALG: leftFactor(f, k) - ALS is not in polynomial form."))
            ((NULL (SPADCALL |f| (QREFELT % 71)))
             (|error| "FDALG: leftFactor(f, k) - ALS is not minimal."))
            ('T
             (SEQ
              (COND
               ((EQL |k| 1)
                (PROGN
                 (LETT #3# (SPADCALL (|spadConstant| % 14) (QREFELT % 51)))
                 (GO #5=#:G1040))))
              (COND
               ((EQL |k| (QVELT |f| 0))
                (PROGN (LETT #3# (SPADCALL |f| (QREFELT % 51))) (GO #5#))))
              (LETT |n| (QVELT |f| 0))
              (LETT |i_max|
                    (PROG1 (LETT #1# (- |k| 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |lst_1| (SPADCALL |k| |n| (QREFELT % 28)))
              (LETT |lst_2| (SPADCALL 1 |i_max| (QREFELT % 28)))
              (LETT |lst_3| (SPADCALL 1 |i_max| (QREFELT % 28)))
              (LETT |lst_4| (SPADCALL (+ |k| 1) |n| (QREFELT % 28)))
              (LETT |trn_wrk|
                    (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T |lst_3|
                     |lst_4| 'T %))
              (COND
               ((ZEROP (LENGTH |trn_wrk|))
                (SEQ (LETT |lst_1| (SPADCALL (+ |k| 1) |n| (QREFELT % 28)))
                     (LETT |lst_3| (SPADCALL 1 |k| (QREFELT % 28)))
                     (EXIT
                      (LETT |trn_wrk|
                            (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T
                             |lst_3| |lst_4| 'T %))))))
              (COND
               ((ZEROP (LENGTH |trn_wrk|))
                (PROGN
                 (LETT #3# (SPADCALL (|spadConstant| % 14) (QREFELT % 51)))
                 (GO #5#))))
              (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
              (SPADCALL (QVELT |f_wrk| 2)
                        (SPADCALL |trn_wrk| 1 (QREFELT % 162)) (QREFELT % 206))
              (SPADCALL (QVELT |f_wrk| 2)
                        (SPADCALL |trn_wrk| 2 (QREFELT % 162)) (QREFELT % 208))
              (LETT |f_1| (SPADCALL |k| (QVELT |f_wrk| 1) (QREFELT % 35)))
              (SEQ (LETT |l| 1) (LETT #4# (LENGTH (QVELT |f_wrk| 1))) G190
                   (COND ((|greater_SI| |l| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                      (|FDALG;qmtxA| (QVELT |f_wrk| 2) 1 |k| 1 |k| |l| %) %)))
                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
              (|FDALG;qsetv!| (QVELT |f_1| 2) |k| 1 (|spadConstant| % 15) %)
              (QSETVELT |f_1| 4 (QVELT |f| 4)) (QSETVELT |f_1| 3 (QVELT |f| 3))
              (EXIT |f_1|)))))
          #5# (EXIT #3#)))) 

(SDEFUN |FDALG;rightFactor;%Nni%;122|
        ((|f| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1049 NIL)
          (|i_max| (|NonNegativeInteger|))
          (|lst_2| #2=(|List| (|NonNegativeInteger|))) (|lst_4| #2#)
          (|lst_1| #2#) (|lst_3| #2#) (|trn_wrk| (|List| (|Matrix| F)))
          (#3=#:G1058 NIL) (|f_wrk| (%)) (|f_2| (%)) (#4=#:G1053 NIL)
          (|m| (|NonNegativeInteger|)) (|l| NIL) (#5=#:G1059 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP |k|) (> |k| (QVELT |f| 0)))
             (|error| "FDALG: rightFactor(f, k) - invalid rank."))
            ((NULL (|FDALG;polynomialForm?| |f| %))
             (|error|
              "FDALG: rightFactor(f, k) - ALS is not in polynomial form."))
            ((NULL (SPADCALL |f| (QREFELT % 71)))
             (|error| "FDALG: rightFactor(f, k) - ALS is not minimal."))
            ('T
             (SEQ
              (COND
               ((EQL |k| 1)
                (PROGN
                 (LETT #3# (SPADCALL (|spadConstant| % 14) (QREFELT % 51)))
                 (GO #6=#:G1057))))
              (COND
               ((EQL |k| (QVELT |f| 0))
                (PROGN (LETT #3# (SPADCALL |f| (QREFELT % 51))) (GO #6#))))
              (LETT |n| (QVELT |f| 0))
              (LETT |i_max|
                    (PROG1 (LETT #1# (- |n| |k|))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |lst_1| (SPADCALL (+ |i_max| 1) |n| (QREFELT % 28)))
              (LETT |lst_2| (SPADCALL 1 |i_max| (QREFELT % 28)))
              (LETT |lst_3| (SPADCALL 1 |i_max| (QREFELT % 28)))
              (LETT |lst_4| (SPADCALL (+ |i_max| 2) |n| (QREFELT % 28)))
              (LETT |trn_wrk|
                    (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T |lst_3|
                     |lst_4| 'T %))
              (COND
               ((ZEROP (LENGTH |trn_wrk|))
                (SEQ (LETT |lst_1| (SPADCALL (+ |i_max| 2) |n| (QREFELT % 28)))
                     (LETT |lst_3| (SPADCALL 1 (+ |i_max| 1) (QREFELT % 28)))
                     (EXIT
                      (LETT |trn_wrk|
                            (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T
                             |lst_3| |lst_4| 'T %))))))
              (COND
               ((ZEROP (LENGTH |trn_wrk|))
                (PROGN
                 (LETT #3# (SPADCALL (|spadConstant| % 14) (QREFELT % 51)))
                 (GO #6#))))
              (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
              (SPADCALL (QVELT |f_wrk| 2)
                        (SPADCALL |trn_wrk| 1 (QREFELT % 162)) (QREFELT % 206))
              (SPADCALL (QVELT |f_wrk| 2)
                        (SPADCALL |trn_wrk| 2 (QREFELT % 162)) (QREFELT % 208))
              (LETT |f_2| (SPADCALL |k| (QVELT |f_wrk| 1) (QREFELT % 35)))
              (LETT |m|
                    (PROG1 (LETT #4# (- |n| |k|))
                      (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #4#)))
              (SEQ (LETT |l| 1) (LETT #5# (LENGTH (QVELT |f_wrk| 1))) G190
                   (COND ((|greater_SI| |l| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 1 |l|
                      (|FDALG;qmtxA| (QVELT |f_wrk| 2) (+ |m| 1) |n| (+ |m| 1)
                       |n| |l| %)
                      %)))
                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
              (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
               (|FDALG;qmtxv| (QVELT |f_wrk| 2) (+ |m| 1) |n| 1 %) %)
              (QSETVELT |f_2| 4 (QVELT |f| 4)) (QSETVELT |f_2| 3 (QVELT |f| 3))
              (EXIT |f_2|)))))
          #6# (EXIT #3#)))) 

(SDEFUN |FDALG;qfactorizationTransformations|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|))
         (|k_cols| (|NonNegativeInteger|))
         (|sol| (|List| (|Equation| (|Polynomial| F))))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1061 NIL)
          (|j_min| (|NonNegativeInteger|))
          (|row_P| #2=(|List| (|NonNegativeInteger|))) (#3=#:G1062 NIL)
          (#4=#:G1063 NIL) (|col_P| #2#) (|row_Q| #2#) (|col_Q| #2#))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |j_min|
                    (PROG1 (LETT #1# (+ (- |n| |k_cols|) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |row_P| (SPADCALL (+ 1 1) (+ 1 |k_rows|) (QREFELT % 28)))
              (LETT |col_P|
                    (SPADCALL
                     (+ 1
                        (PROG1 (LETT #3# (- |j_min| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                     (+ 1
                        (PROG1 (LETT #4# (- |n| 1))
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#)))
                     (QREFELT % 28)))
              (LETT |row_Q|
                    (SPADCALL (+ 1 2) (+ (+ 1 |k_rows|) 1) (QREFELT % 28)))
              (LETT |col_Q| (SPADCALL (+ 1 |j_min|) (+ 1 |n|) (QREFELT % 28)))
              (EXIT
               (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q| |sol|
                         (QREFELT % 276)))))) 

(SDEFUN |FDALG;factorize;%NniL;124|
        ((|f| (%)) (|k| (|NonNegativeInteger|)) (% (|List| %)))
        (SPROG
         ((|f_wrk| (%)) (|lst_fct| (|List| %)) (|n| (|NonNegativeInteger|))
          (#1=#:G1072 NIL) (|i_max| (|NonNegativeInteger|))
          (|lst_2| #2=(|List| (|NonNegativeInteger|))) (|lst_4| #2#)
          (|lst_1| #2#) (|lst_3| #2#) (#3=#:G1075 NIL) (#4=#:G1076 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| F)))))
          (#5=#:G1088 NIL) (#6=#:G1078 NIL) (#7=#:G1079 NIL)
          (|trn_wrk| (|List| (|Matrix| F))) (|n_1| (|NonNegativeInteger|))
          (#8=#:G1082 NIL) (|n_2| (|NonNegativeInteger|)) (|f_1| (%))
          (|f_2| (%)) (|l| NIL) (#9=#:G1089 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP |k|) (> |k| (QVELT |f| 0)))
             (|error| "FDALG: factorize(f, k) - invalid rank."))
            ((NULL (|FDALG;polynomialForm?| |f| %))
             (|error|
              "FDALG: factorize(f, k) - ALS is not in polynomial form."))
            ((NULL (SPADCALL |f| (QREFELT % 71)))
             (|error| "FDALG: factorize(f, k) - ALS is not minimal."))
            ('T
             (SEQ (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
                  (LETT |lst_fct| (LIST |f_wrk|))
                  (COND
                   ((OR (EQL |k| 1) (EQL |k| (QVELT |f| 0)))
                    (PROGN (LETT #5# |lst_fct|) (GO #10=#:G1087))))
                  (LETT |n| (QVELT |f| 0))
                  (LETT |i_max|
                        (PROG1 (LETT #1# (- |k| 1))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#)))
                  (LETT |lst_1| (SPADCALL |k| |n| (QREFELT % 28)))
                  (LETT |lst_2| (SPADCALL 1 |i_max| (QREFELT % 28)))
                  (LETT |lst_3| (SPADCALL 1 |i_max| (QREFELT % 28)))
                  (LETT |lst_4| (SPADCALL (+ |k| 1) |n| (QREFELT % 28)))
                  (LETT |trn_wrk|
                        (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T
                         |lst_3| |lst_4| 'T %))
                  (COND
                   ((ZEROP (LENGTH |trn_wrk|))
                    (SEQ (LETT |lst_1| (SPADCALL (+ |k| 1) |n| (QREFELT % 28)))
                         (LETT |lst_3| (SPADCALL 1 |k| (QREFELT % 28)))
                         (EXIT
                          (LETT |trn_wrk|
                                (|FDALG;qblockElimination| |f| |lst_1| |lst_2|
                                 'T |lst_3| |lst_4| 'T %))))))
                  (COND
                   ((ZEROP (LENGTH |trn_wrk|))
                    (SEQ
                     (LETT |lst_sol|
                           (SPADCALL |f|
                                     (PROG1 (LETT #3# (- |k| 1))
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (PROG1 (LETT #4# (- |n| |k|))
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT % 278)))
                     (COND
                      ((ZEROP (LENGTH |lst_sol|))
                       (PROGN (LETT #5# |lst_fct|) (GO #10#))))
                     (EXIT
                      (LETT |trn_wrk|
                            (|FDALG;qfactorizationTransformations| |f|
                             (PROG1 (LETT #6# (- |k| 1))
                               (|check_subtype2| (>= #6# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #6#))
                             (PROG1 (LETT #7# (- |n| |k|))
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#))
                             (|SPADfirst| |lst_sol|) %))))))
                  (SPADCALL (QVELT |f_wrk| 2)
                            (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                            (QREFELT % 206))
                  (SPADCALL (QVELT |f_wrk| 2)
                            (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                            (QREFELT % 208))
                  (LETT |n_1| |k|)
                  (LETT |n_2|
                        (PROG1 (LETT #8# (+ (- |n| |k|) 1))
                          (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #8#)))
                  (LETT |f_1|
                        (SPADCALL |n_1| (QVELT |f_wrk| 1) (QREFELT % 35)))
                  (LETT |f_2|
                        (SPADCALL |n_2| (QVELT |f_wrk| 1) (QREFELT % 35)))
                  (SEQ (LETT |l| 1) (LETT #9# (LENGTH (QVELT |f_wrk| 1))) G190
                       (COND ((|greater_SI| |l| #9#) (GO G191)))
                       (SEQ
                        (|FDALG;qsetmtxA!| (QVELT |f_1| 2) 1 1 |l|
                         (|FDALG;qmtxA| (QVELT |f_wrk| 2) 1 |k| 1 |k| |l| %) %)
                        (EXIT
                         (|FDALG;qsetmtxA!| (QVELT |f_2| 2) 1 1 |l|
                          (|FDALG;qmtxA| (QVELT |f_wrk| 2) |k| |n| |k| |n| |l|
                           %)
                          %)))
                       (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                  (|FDALG;qsetv!| (QVELT |f_1| 2) |k| 1 (|spadConstant| % 15)
                   %)
                  (|FDALG;qsetmtxv!| (QVELT |f_2| 2) 1 1
                   (|FDALG;qmtxv| (QVELT |f_wrk| 2) |k| |n| 1 %) %)
                  (QSETVELT |f_1| 4 (QVELT |f| 4))
                  (QSETVELT |f_1| 3 (QVELT |f| 3))
                  (QSETVELT |f_2| 4 (QVELT |f| 4))
                  (QSETVELT |f_2| 3 (QVELT |f| 3))
                  (EXIT (LIST |f_1| |f_2|))))))
          #10# (EXIT #5#)))) 

(SDEFUN |FDALG;factor;%L;125| ((|f| (%)) (% (|List| %)))
        (SPROG
         ((|f_wrk| (%)) (|lst_wrk| (|List| %)) (|elt| NIL) (#1=#:G1109 NIL)
          (|k| NIL) (#2=#:G1097 NIL) (#3=#:G1110 NIL) (|lst_tmp| (|List| %))
          (|flg_irr| (|Boolean|)) (|elt_tmp| (%)) (#4=#:G1107 NIL)
          (#5=#:G1108 NIL) (|lst_fct| (|List| %)))
         (SEQ
          (COND
           ((NULL (|FDALG;polynomialForm?| |f| %))
            (|error| "FDALG: factor(f) - ALS is not in polynomial form."))
           ((NULL (SPADCALL |f| (QREFELT % 71)))
            (|error| "FDALG: factor(f) - ALS is not minimal."))
           ('T
            (SEQ (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
                 (SPADCALL |f_wrk| (QREFELT % 280))
                 (LETT |lst_wrk| (SPADCALL |f_wrk| (QREFELT % 242)))
                 (LETT |lst_fct| NIL)
                 (SEQ (LETT |elt| NIL) (LETT #1# |lst_wrk|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |elt| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |elt_tmp| |elt|)
                           (SEQ
                            (EXIT
                             (SEQ G190
                                  (COND
                                   ((NULL (> (QVELT |elt_tmp| 0) 2))
                                    (GO G191)))
                                  (SEQ (LETT |flg_irr| 'T)
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |k| 2)
                                              (LETT #3#
                                                    (PROG1
                                                        (LETT #2#
                                                              (-
                                                               (QVELT |elt_tmp|
                                                                      0)
                                                               1))
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                                              G190
                                              (COND
                                               ((|greater_SI| |k| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |lst_tmp|
                                                     (SPADCALL |elt_tmp| |k|
                                                               (QREFELT %
                                                                        279)))
                                               (EXIT
                                                (COND
                                                 ((EQL
                                                   (SPADCALL |lst_tmp|
                                                             (QREFELT % 243))
                                                   2)
                                                  (SEQ (LETT |flg_irr| NIL)
                                                       (LETT |lst_fct|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |lst_tmp| 1
                                                               (QREFELT % 281))
                                                              |lst_fct|
                                                              (QREFELT % 240)))
                                                       (LETT |elt_tmp|
                                                             (SPADCALL
                                                              |lst_tmp| 2
                                                              (QREFELT % 281)))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4# 1)
                                                         (GO #6=#:G1100))))))))
                                              (LETT |k| (|inc_SI| |k|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #6# (EXIT #4#))
                                       (EXIT
                                        (COND
                                         (|flg_irr|
                                          (PROGN
                                           (LETT #5# |$NoValue|)
                                           (GO #7=#:G1102))))))
                                  NIL (GO G190) G191 (EXIT NIL)))
                            #7# (EXIT #5#))
                           (EXIT
                            (LETT |lst_fct|
                                  (SPADCALL |elt_tmp| |lst_fct|
                                            (QREFELT % 240)))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |lst_fct| (QREFELT % 282))))))))) 

(SDEFUN |FDALG;factorizationTransformations;%2NniLL;126|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|))
         (|k_cols| (|NonNegativeInteger|))
         (|sol| (|List| (|Equation| (|Polynomial| F))))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1112 NIL)
          (|j_min| (|NonNegativeInteger|))
          (|row_P| #2=(|List| (|NonNegativeInteger|))) (#3=#:G1113 NIL)
          (#4=#:G1114 NIL) (|col_P| #2#) (|row_Q| #2#) (|col_Q| #2#)
          (|lst_trn| (|List| (|Matrix| F))))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |j_min|
                    (PROG1 (LETT #1# (+ (- |n| |k_cols|) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |row_P| (SPADCALL (+ 1 1) (+ 1 |k_rows|) (QREFELT % 28)))
              (LETT |col_P|
                    (SPADCALL
                     (+ 1
                        (PROG1 (LETT #3# (- |j_min| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                     (+ 1
                        (PROG1 (LETT #4# (- |n| 1))
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#)))
                     (QREFELT % 28)))
              (LETT |row_Q|
                    (SPADCALL (+ 1 2) (+ (+ 1 |k_rows|) 1) (QREFELT % 28)))
              (LETT |col_Q| (SPADCALL (+ 1 |j_min|) (+ 1 |n|) (QREFELT % 28)))
              (LETT |lst_trn|
                    (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q|
                              |sol| (QREFELT % 276)))
              (EXIT
               (LIST
                (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 162)) (+ 1 1)
                          (+ 1 |n|) (+ 1 1) (+ 1 |n|) (QREFELT % 163))
                (SPADCALL (SPADCALL |lst_trn| 2 (QREFELT % 162)) (+ 1 1)
                          (+ 1 |n|) (+ 1 1) (+ 1 |n|) (QREFELT % 163))))))) 

(SDEFUN |FDALG;factorizationEquations;%2NniL;127|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|))
         (|k_cols| (|NonNegativeInteger|)) (% (|List| (|Polynomial| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1118 NIL)
          (|j_min| (|NonNegativeInteger|))
          (|row_P| #2=(|List| (|NonNegativeInteger|))) (#3=#:G1119 NIL)
          (#4=#:G1120 NIL) (|col_P| #2#) (|row_Q| #2#) (|col_Q| #2#)
          (|rdst| #2#) (|cdst| #2#) (|rex1| (|List| #5=(|NonNegativeInteger|)))
          (|cex1| (|List| #5#)) (|rex2| (|List| (|NonNegativeInteger|)))
          (|cex2| (|List| (|NonNegativeInteger|)))
          (|lst_eqn| (|List| (|Polynomial| F))))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |j_min|
                    (PROG1 (LETT #1# (+ (- |n| |k_cols|) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |row_P| (SPADCALL (+ 1 1) (+ 1 |k_rows|) (QREFELT % 28)))
              (LETT |col_P|
                    (SPADCALL
                     (+ 1
                        (PROG1 (LETT #3# (- |j_min| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                     (+ 1
                        (PROG1 (LETT #4# (- |n| 1))
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#)))
                     (QREFELT % 28)))
              (LETT |row_Q|
                    (SPADCALL (+ 1 2) (+ (+ 1 |k_rows|) 1) (QREFELT % 28)))
              (LETT |col_Q| (SPADCALL (+ 1 |j_min|) (+ 1 |n|) (QREFELT % 28)))
              (LETT |rdst| (SPADCALL (+ 1 1) (+ 1 |k_rows|) (QREFELT % 28)))
              (LETT |cdst| (SPADCALL (+ 1 |j_min|) (+ 1 |n|) (QREFELT % 28)))
              (LETT |rex1| (LIST 1)) (LETT |cex1| (LIST 1)) (LETT |rex2| NIL)
              (LETT |cex2| NIL)
              (LETT |lst_eqn|
                    (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q|
                              |rdst| |cdst| |rex1| |cex1| |rex2| |cex2|
                              (QREFELT % 286)))
              (EXIT |lst_eqn|)))) 

(SDEFUN |FDALG;factorizationGroebner;%2NniL;128|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|))
         (|k_cols| (|NonNegativeInteger|)) (% (|List| (|Polynomial| F))))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| F)))
          (|tmp_var| (|List| (|List| (|Symbol|))))
          (|lst_var| (|List| (|Symbol|)))
          (|tDMP|
           (|Join|
            (|PolynomialCategory| F
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
          (#2=#:G1131 NIL) (#3=#:G1132 NIL) (|eqn_wrk| (|List| |tDMP|))
          (|bas_gro| (|List| |tDMP|)) (#4=#:G1133 NIL) (|eqn| NIL)
          (#5=#:G1134 NIL) (|lst_gro| (|List| (|Polynomial| F))))
         (SEQ (LETT |lst_eqn| (SPADCALL |f| |k_rows| |k_cols| (QREFELT % 287)))
              (LETT |tmp_var| (SPADCALL (ELT % 289) |lst_eqn| (QREFELT % 293)))
              (LETT |lst_var|
                    (SPADCALL (SPADCALL |tmp_var| (QREFELT % 294))
                              (QREFELT % 295)))
              (LETT |tDMP|
                    (|DistributedMultivariatePolynomial| |lst_var|
                                                         (QREFELT % 7)))
              (LETT |tPRD|
                    (|DirectProduct| (LENGTH |lst_var|)
                                     (|NonNegativeInteger|)))
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
                                                                       (ELT %
                                                                            7)))
                                                                     (LIST
                                                                      '|Polynomial|
                                                                      (|devaluate|
                                                                       (ELT %
                                                                            7))))
                                                                    (|PolToPol|
                                                                     |lst_var|
                                                                     (ELT %
                                                                          7))))
                                   #2#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |bas_gro|
                    (SPADCALL |eqn_wrk|
                              (|compiledLookupCheck| '|groebner|
                                                     (LIST
                                                      (LIST '|List|
                                                            (|devaluate|
                                                             |tDMP|))
                                                      (LIST '|List|
                                                            (|devaluate|
                                                             |tDMP|)))
                                                     (|GroebnerPackage|
                                                      (ELT % 7) |tPRD|
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
                                                                       (ELT %
                                                                            7)))
                                                                     (LIST
                                                                      '|DistributedMultivariatePolynomial|
                                                                      |lst_var|
                                                                      (|devaluate|
                                                                       (ELT %
                                                                            7))))
                                                                    (|PolToPol|
                                                                     |lst_var|
                                                                     (ELT %
                                                                          7))))
                                   #4#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (EXIT |lst_gro|)))) 

(SDEFUN |FDALG;factorizationSolve;%2NniL;129|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|))
         (|k_cols| (|NonNegativeInteger|))
         (% (|List| (|List| (|Equation| (|Polynomial| F))))))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| F))) (|lst_val| (|List| F))
          (|k| NIL) (|lst_wrk| (|List| (|Polynomial| F)))
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| F)))))
          (#1=#:G1142 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| F))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lst_eqn| (SPADCALL |f| |k_rows| |k_cols| (QREFELT % 296)))
            (LETT |lst_val| (LIST (|spadConstant| % 50))) (LETT |lst_wrk| NIL)
            (LETT |lst_sol| NIL)
            (SEQ (LETT |k| (LENGTH |lst_eqn|)) G190
                 (COND ((< |k| 1) (GO G191)))
                 (SEQ
                  (LETT |lst_wrk|
                        (CONS (SPADCALL |lst_eqn| |k| (QREFELT % 297))
                              |lst_wrk|))
                  (LETT |sol_wrk|
                        (SPADCALL |lst_wrk| |lst_val| |lst_sol|
                                  (QREFELT % 298)))
                  (COND
                   ((ZEROP (LENGTH |sol_wrk|))
                    (PROGN (LETT #1# NIL) (GO #2=#:G1141))))
                  (EXIT (LETT |lst_sol| (SPADCALL |sol_wrk| (QREFELT % 299)))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
            (EXIT |lst_sol|)))
          #2# (EXIT #1#)))) 

(SDEFUN |FDALG;refineUR!;%Nni%;130|
        ((|f| (%)) (|k_rows| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (#2=#:G1158 NIL)
          (|lst_2| #3=(|List| (|NonNegativeInteger|))) (|lst_4| #3#)
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|j_ref| (|NonNegativeInteger|)) (|k| NIL) (#4=#:G1159 NIL)
          (#5=#:G1145 NIL) (|cmaxa| #6=(|NonNegativeInteger|)) (|cmaxb| #6#)
          (|rmina| #1#) (|rminb| #1#) (#7=#:G1157 NIL) (|lst_1| #3#)
          (|lst_3| #3#) (|trn_wrk| (|List| (|Matrix| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (COND ((<= |n| 2) (PROGN (LETT #2# |f|) (GO #8=#:G1156))))
                (LETT |lst_2| (SPADCALL 1 |k_rows| (QREFELT % 28)))
                (LETT |lst_4| (SPADCALL (+ |k_rows| 2) |n| (QREFELT % 28)))
                (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
                (LETT |cmaxa| 1) (LETT |cmaxb| 1) (LETT |rmina| |n|)
                (LETT |rminb| |n|) (LETT |j_ref| (+ |k_rows| 2))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| 1)
                       (LETT #4# (SPADCALL |blo_mtx| (QREFELT % 154))) G190
                       (COND ((|greater_SI| |k| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((<= (SPADCALL |blo_mtx| |k| 1 (QREFELT % 184))
                               |j_ref|)
                           (COND
                            ((>= (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184))
                                 |j_ref|)
                             (SEQ
                              (COND
                               ((> |k| 1)
                                (LETT |cmaxa|
                                      (SPADCALL |blo_mtx|
                                                (PROG1 (LETT #5# (- |k| 1))
                                                  (|check_subtype2| (>= #5# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #5#))
                                                2 (QREFELT % 184)))))
                              (LETT |cmaxb|
                                    (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184)))
                              (LETT |rmina|
                                    (SPADCALL |blo_mtx| |k| 1 (QREFELT % 184)))
                              (COND
                               ((< |k| (SPADCALL |blo_mtx| (QREFELT % 154)))
                                (LETT |rminb|
                                      (SPADCALL |blo_mtx| (+ |k| 1) 1
                                                (QREFELT % 184)))))
                              (EXIT
                               (PROGN (LETT #7# 1) (GO #9=#:G1150))))))))))
                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
                 #9# (EXIT #7#))
                (LETT |lst_1|
                      (SPADCALL (MAX |rmina| (+ |k_rows| 1)) |n|
                                (QREFELT % 28)))
                (LETT |lst_3| (SPADCALL 1 |cmaxa| (QREFELT % 28)))
                (LETT |trn_wrk|
                      (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T |lst_3|
                       |lst_4| 'T %))
                (COND
                 ((> (LENGTH |trn_wrk|) 0)
                  (SEQ
                   (SPADCALL (QVELT |f| 2)
                             (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                             (QREFELT % 206))
                   (EXIT
                    (SPADCALL (QVELT |f| 2)
                              (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                              (QREFELT % 208)))))
                 ('T
                  (SEQ (LETT |lst_1| (SPADCALL |rminb| |n| (QREFELT % 28)))
                       (LETT |lst_3|
                             (SPADCALL 1 (MIN |cmaxb| (+ |k_rows| 1))
                                       (QREFELT % 28)))
                       (LETT |trn_wrk|
                             (|FDALG;qblockElimination| |f| |lst_1| |lst_2| 'T
                              |lst_3| |lst_4| 'T %))
                       (EXIT
                        (COND
                         ((> (LENGTH |trn_wrk|) 0)
                          (SEQ
                           (SPADCALL (QVELT |f| 2)
                                     (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                                     (QREFELT % 206))
                           (EXIT
                            (SPADCALL (QVELT |f| 2)
                                      (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                                      (QREFELT % 208))))))))))
                (EXIT |f|)))
          #8# (EXIT #2#)))) 

(SDEFUN |FDALG;refineUR!;2%;131| ((|f| (%)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1167 NIL) (|k| NIL)
          (#2=#:G1163 NIL) (#3=#:G1168 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (COND ((<= |n| 2) (PROGN (LETT #1# |f|) (GO #4=#:G1166))))
                (SEQ (LETT |k| 1)
                     (LETT #3#
                           (PROG1 (LETT #2# (- |n| 2))
                             (|check_subtype2| (>= #2# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #2#)))
                     G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                     (SEQ (EXIT (SPADCALL |f| |k| (QREFELT % 300))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |f|)))
          #4# (EXIT #1#)))) 

(SDEFUN |FDALG;extendedALS;2%;132| ((|f| (%)) (% (%)))
        (SPROG ((|f_new| (%)))
               (SEQ
                (LETT |f_new|
                      (SPADCALL
                       (SPADCALL (QVELT |f| 2) (LIST 1) (LIST 1)
                                 (QREFELT % 143))
                       (QVELT |f| 1) (QREFELT % 41)))
                (|FDALG;qsetA!| (QVELT |f_new| 2) 1 1 1 (|spadConstant| % 15)
                 %)
                (|FDALG;qsetA!| (QVELT |f_new| 2) 1 2 1
                 (SPADCALL (|spadConstant| % 15) (QREFELT % 58)) %)
                (|FDALG;qsetu!| (QVELT |f_new| 2) 1 1 (|spadConstant| % 15) %)
                (|FDALG;qsetu!| (QVELT |f_new| 2) 2 1 (|spadConstant| % 50) %)
                (QSETVELT |f_new| 4 (QVELT |f| 4)) (EXIT |f_new|)))) 

(SDEFUN |FDALG;normalALS;2%;133| ((|f| (%)) (% (%)))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|))) (|a_flg| (|Boolean|))
          (#1=#:G1191 NIL) (|i_min| (|NonNegativeInteger|)) (#2=#:G1192 NIL)
          (#3=#:G1190 NIL) (|i_max| (|NonNegativeInteger|)) (#4=#:G1193 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|)) (#5=#:G1185 NIL)
          (|i_ref| (|NonNegativeInteger|)) (|a_ref| (F)) (|k| NIL)
          (#6=#:G1194 NIL) (|als| (%)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
                (LETT |a_flg|
                      (|FDALG;qsemizeroA?| (QVELT |f| 2) 1 1 1 |n| 1 %))
                (COND
                 ((SPADCALL (|FDALG;qeltA| (QVELT |f| 2) 1 1 1 %)
                            (|spadConstant| % 15) (QREFELT % 76))
                  (COND
                   (|a_flg|
                    (COND
                     ((OR (EQL (SPADCALL |blo_mtx| (QREFELT % 154)) 1)
                          (> (SPADCALL |blo_mtx| 1 3 (QREFELT % 184)) 1))
                      (EXIT
                       (|error|
                        #7="FDALG: normalALS(f) - not in extended form.")))))
                   (#8='T (EXIT (|error| #7#)))))
                 (#8# (EXIT (|error| #7#))))
                (LETT |i_ref| 2)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (|FDALG;qeltA| (QVELT |f| 2) 1 |i_ref| 1 %)
                                  (QREFELT % 48)))
                       (GO G191)))
                     (SEQ (LETT |i_ref| (+ |i_ref| 1))
                          (EXIT
                           (COND
                            ((> |i_ref| |n|)
                             (PROGN
                              (LETT #1#
                                    (SPADCALL (|spadConstant| % 14)
                                              (|FDALG;qeltv| (QVELT |f| 2) 1 1
                                               %)
                                              (QREFELT % 62)))
                              (GO #9=#:G1189))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |i_min| 2) (LETT |i_max| 0)
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| 2)
                       (LETT #2# (SPADCALL |blo_mtx| (QREFELT % 154))) G190
                       (COND ((|greater_SI| |k| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((>= (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184))
                              |i_ref|)
                          (PROGN (LETT #3# 1) (GO #10=#:G1181))))
                        (EXIT
                         (LETT |i_max|
                               (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184)))))
                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
                 #10# (EXIT #3#))
                (LETT |lst_tmp| NIL)
                (SEQ (LETT |k| |i_max|) (LETT #4# |i_min|) G190
                     (COND ((< |k| #4#) (GO G191)))
                     (SEQ (EXIT (LETT |lst_tmp| (CONS |k| |lst_tmp|))))
                     (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                (LETT |als| (SPADCALL |f| (QREFELT % 51)))
                (COND
                 ((> (SPADCALL |lst_tmp| (QREFELT % 140)) 0)
                  (LETT |als|
                        (SPADCALL |f| |lst_tmp| |lst_tmp| (QREFELT % 142)))))
                (LETT |n| (QVELT |als| 0))
                (LETT |i_ref|
                      (PROG1
                          (LETT #5#
                                (- |i_ref|
                                   (SPADCALL |lst_tmp| (QREFELT % 140))))
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#)))
                (LETT |a_ref| (|FDALG;qeltA| (QVELT |als| 2) 1 |i_ref| 1 %))
                (COND
                 ((NULL (EQL |i_ref| 2))
                  (SPADCALL |als| 2 |i_ref| (QREFELT % 130))))
                (SPADCALL |als| 2
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 15) |a_ref|
                                     (QREFELT % 209))
                           (QREFELT % 58))
                          (QREFELT % 127))
                (SEQ (LETT |k| 3) (LETT #6# |n|) G190
                     (COND ((> |k| #6#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |als| 2 |k|
                                 (|FDALG;qeltA| (QVELT |als| 2) 1 |k| 1 %)
                                 (QREFELT % 133))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (LETT |als| (SPADCALL |als| (LIST 1) (LIST 1) (QREFELT % 142)))
                (|FDALG;qsetu!| (QVELT |als| 2) 1 1 (|spadConstant| % 15) %)
                (QSETVELT |als| 4 (QVELT |f| 4)) (EXIT |als|)))
          #9# (EXIT #1#)))) 

(SDEFUN |FDALG;leftMinimization;%2Nni%;134|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G1205 NIL) (|lst_1| (|List| (|NonNegativeInteger|))) (|i| NIL)
          (#2=#:G1206 NIL) (|lst_2| (|List| (|NonNegativeInteger|)))
          (|trn_wrk| (|List| (|Matrix| F))) (|g| (%)) (#3=#:G1204 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (OR (> |i_min| |i_max|) (< |i_min| 1))
                 (>= |i_max| (QVELT |f| 0)))
             (|error|
              "FDALG: leftMinimization(f, i_min, i_max) - indices invalid."))
            ('T
             (SEQ (LETT |lst_1| NIL)
                  (SEQ (LETT |i| |i_max|) (LETT #1# |i_min|) G190
                       (COND ((< |i| #1#) (GO G191)))
                       (SEQ (EXIT (LETT |lst_1| (CONS |i| |lst_1|))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                  (LETT |lst_2| NIL)
                  (SEQ (LETT |i| (QVELT |f| 0)) (LETT #2# (+ |i_max| 1)) G190
                       (COND ((< |i| #2#) (GO G191)))
                       (SEQ (EXIT (LETT |lst_2| (CONS |i| |lst_2|))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                  (LETT |trn_wrk|
                        (SPADCALL |f| |lst_2| |lst_1| 'T |lst_1| |lst_2| 'T
                                  (QREFELT % 165)))
                  (LETT |g| (SPADCALL |f| (QREFELT % 51)))
                  (COND
                   ((> (LENGTH |trn_wrk|) 0)
                    (SEQ
                     (COND
                      ((EQL |i_min| 1)
                       (PROGN
                        (LETT #3# (|spadConstant| % 49))
                        (GO #4=#:G1203))))
                     (SPADCALL |g| (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                               (QREFELT % 201))
                     (SPADCALL |g| (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                               (QREFELT % 199))
                     (LETT |g| (SPADCALL |g| |lst_1| |lst_1| (QREFELT % 142)))
                     (QSETVELT |g| 4 (QVELT |f| 4))
                     (EXIT (PROGN (LETT #3# |g|) (GO #4#))))))
                  (EXIT |g|)))))
          #4# (EXIT #3#)))) 

(SDEFUN |FDALG;rightMinimization;%2Nni%;135|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G1221 NIL) (|lst_1| (|List| (|NonNegativeInteger|)))
          (#2=#:G1213 NIL) (|i| NIL) (|lst_2| (|List| (|NonNegativeInteger|)))
          (|trn_wrk| (|List| (|Matrix| F))) (|g| (%)) (#3=#:G1220 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (OR (> |i_min| |i_max|) (<= |i_min| 1))
                 (> |i_max| (QVELT |f| 0)))
             (|error|
              "FDALG: rightMinimization(f, i_min, i_max) - indices invalid."))
            ('T
             (SEQ (LETT |lst_1| NIL)
                  (SEQ (LETT |i| |i_max|) (LETT #1# |i_min|) G190
                       (COND ((< |i| #1#) (GO G191)))
                       (SEQ (EXIT (LETT |lst_1| (CONS |i| |lst_1|))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                  (LETT |lst_2| NIL)
                  (SEQ
                   (LETT |i|
                         (PROG1 (LETT #2# (- |i_min| 1))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#)))
                   G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ (EXIT (LETT |lst_2| (CONS |i| |lst_2|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                  (LETT |trn_wrk|
                        (SPADCALL |f| |lst_1| |lst_2| 'T |lst_2| |lst_1| NIL
                                  (QREFELT % 165)))
                  (LETT |g| (SPADCALL |f| (QREFELT % 51)))
                  (COND
                   ((> (LENGTH |trn_wrk|) 0)
                    (SEQ
                     (SPADCALL |g| (SPADCALL |trn_wrk| 1 (QREFELT % 162))
                               (QREFELT % 201))
                     (SPADCALL |g| (SPADCALL |trn_wrk| 2 (QREFELT % 162))
                               (QREFELT % 199))
                     (LETT |g| (SPADCALL |g| |lst_1| |lst_1| (QREFELT % 142)))
                     (SPADCALL |g| (QREFELT % 210))
                     (QSETVELT |g| 4 (QVELT |f| 4))
                     (EXIT (PROGN (LETT #3# |g|) (GO #4=#:G1219))))))
                  (EXIT |g|)))))
          #4# (EXIT #3#)))) 

(SDEFUN |FDALG;minimize;2%;136| ((|f| (%)) (% (%)))
        (SPROG
         ((#1=#:G1224 NIL) (|k_l| (|NonNegativeInteger|)) (#2=#:G1225 NIL)
          (#3=#:G1229 NIL) (|als| (%)) (#4=#:G1234 NIL) (|flg_wrk| (|Boolean|))
          (|k| (|NonNegativeInteger|))
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |als| (SPADCALL |f| (QREFELT % 51)))
              (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153))) (LETT |k| 2)
              (LETT |n| (QVELT |als| 0))
              (LETT |m| (SPADCALL |blo_mtx| (QREFELT % 154)))
              (SEQ G190 (COND ((NULL (<= |k| |m|)) (GO G191)))
                   (SEQ
                    (LETT |k_l|
                          (PROG1 (LETT #1# (- (+ |m| 1) |k|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (LETT |flg_wrk| 'T)
                    (LETT |als|
                          (SPADCALL |als|
                                    (SPADCALL |blo_mtx| |k_l| 1
                                              (QREFELT % 184))
                                    (SPADCALL |blo_mtx| |k_l| 2
                                              (QREFELT % 184))
                                    (QREFELT % 303)))
                    (COND
                     ((< (QVELT |als| 0) |n|)
                      (SEQ
                       (COND
                        ((> |k| 2)
                         (COND
                          ((> (* 2 |k|) (+ |m| 1))
                           (LETT |k|
                                 (PROG1 (LETT #2# (- |k| 1))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))))))
                       (EXIT (LETT |flg_wrk| NIL)))))
                    (COND
                     (|flg_wrk|
                      (COND
                       ((EQL |k_l| 1)
                        (SEQ (LETT |als| (SPADCALL |als| (QREFELT % 301)))
                             (LETT |als|
                                   (SPADCALL |als|
                                             (+
                                              (SPADCALL |blo_mtx| |k_l| 1
                                                        (QREFELT % 184))
                                              1)
                                             (+
                                              (SPADCALL |blo_mtx| |k_l| 2
                                                        (QREFELT % 184))
                                              1)
                                             (QREFELT % 303)))
                             (LETT |als| (SPADCALL |als| (QREFELT % 302)))
                             (EXIT
                              (COND
                               ((< (QVELT |als| 0) |n|)
                                (SEQ
                                 (COND
                                  ((> |k| 2)
                                   (COND
                                    ((> (* 2 |k|) (+ |m| 1))
                                     (LETT |k|
                                           (PROG1 (LETT #3# (- |k| 1))
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#)))))))
                                 (EXIT (LETT |flg_wrk| NIL)))))))))))
                    (COND
                     (|flg_wrk|
                      (SEQ
                       (LETT |als|
                             (SPADCALL |als|
                                       (SPADCALL |blo_mtx| |k| 1
                                                 (QREFELT % 184))
                                       (SPADCALL |blo_mtx| |k| 2
                                                 (QREFELT % 184))
                                       (QREFELT % 304)))
                       (EXIT
                        (COND
                         ((< (QVELT |als| 0) |n|)
                          (SEQ
                           (COND
                            ((> |k| 2)
                             (COND
                              ((> (* 2 |k|) (+ |m| 1))
                               (LETT |k|
                                     (PROG1 (LETT #4# (- |k| 1))
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|)
                                                         #4#)))))))
                           (EXIT (LETT |flg_wrk| NIL)))))))))
                    (EXIT
                     (COND (|flg_wrk| (LETT |k| (+ |k| 1)))
                           ('T
                            (SEQ
                             (LETT |blo_mtx| (SPADCALL |als| (QREFELT % 153)))
                             (LETT |m| (SPADCALL |blo_mtx| (QREFELT % 154)))
                             (EXIT (LETT |n| (QVELT |als| 0))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |f| (QREFELT % 155))
                (SEQ (QSETVELT |als| 3 'T) (EXIT (QSETVELT |als| 4 'T)))))
              (EXIT |als|)))) 

(SDEFUN |FDALG;addMIN;3%;137| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG ((|als| (%)))
               (SEQ
                (LETT |als|
                      (SPADCALL (SPADCALL |f| |g| (QREFELT % 234))
                                (QREFELT % 305)))
                (SPADCALL |als| (QREFELT % 213)) (EXIT |als|)))) 

(SDEFUN |FDALG;multiplyMIN;3%;138| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG ((|als| (%)))
               (SEQ
                (LETT |als|
                      (SPADCALL (SPADCALL |f| |g| (QREFELT % 236))
                                (QREFELT % 305)))
                (SPADCALL |als| (QREFELT % 213)) (EXIT |als|)))) 

(SDEFUN |FDALG;*;I2%;139| ((|gamma| (|Integer|)) (|f| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL |gamma| (QREFELT % 308)) (QREFELT % 230))) 

(SDEFUN |FDALG;*;F2%;140| ((|alpha| (F)) (|f| (%)) (% (%)))
        (SPADCALL |f| |alpha| (QREFELT % 230))) 

(SDEFUN |FDALG;*;%F%;141| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SPADCALL |f| |alpha| (QREFELT % 230))) 

(SDEFUN |FDALG;*;3%;142| ((|f| (%)) (|g| (%)) (% (%)))
        (SPADCALL |f| |g| (QREFELT % 307))) 

(SDEFUN |FDALG;-;%F%;143| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SPADCALL |f|
                  (SPADCALL (SPADCALL |alpha| (QREFELT % 64)) (QREFELT % 313))
                  (QREFELT % 306))) 

(SDEFUN |FDALG;+;%F%;144| ((|f| (%)) (|alpha| (F)) (% (%)))
        (SPADCALL |f| (SPADCALL |alpha| (QREFELT % 64)) (QREFELT % 306))) 

(SDEFUN |FDALG;-;F2%;145| ((|alpha| (F)) (|f| (%)) (% (%)))
        (SPADCALL (SPADCALL |alpha| (QREFELT % 64))
                  (SPADCALL |f| (QREFELT % 313)) (QREFELT % 306))) 

(SDEFUN |FDALG;+;F2%;146| ((|alpha| (F)) (|f| (%)) (% (%)))
        (SPADCALL (SPADCALL |alpha| (QREFELT % 64)) |f| (QREFELT % 306))) 

(SDEFUN |FDALG;-;3%;147| ((|f| (%)) (|g| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL |g| (QREFELT % 313)) (QREFELT % 306))) 

(SDEFUN |FDALG;+;3%;148| ((|f| (%)) (|g| (%)) (% (%)))
        (SPADCALL |f| |g| (QREFELT % 306))) 

(SDEFUN |FDALG;-;2%;149| ((|f| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL (|spadConstant| % 15) (QREFELT % 58))
                  (QREFELT % 62))) 

(SDEFUN |FDALG;/;%F%;150| ((|f| (%)) (|alpha| (F)) (% (%)))
        (COND
         ((SPADCALL |alpha| (QREFELT % 48))
          (|error| "FDALG: f / alpha - division by zero."))
         ('T
          (SPADCALL |f|
                    (SPADCALL (|spadConstant| % 15) |alpha| (QREFELT % 209))
                    (QREFELT % 62))))) 

(SDEFUN |FDALG;^;%Pi%;151| ((|f| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (SPROG ((|k| NIL) (#1=#:G1270 NIL) (|f_wrk| (%)))
               (SEQ (LETT |f_wrk| |f|)
                    (SEQ (LETT |k| 2) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |f_wrk|
                                 (SPADCALL |f_wrk| |f| (QREFELT % 307)))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |f_wrk|)))) 

(SDEFUN |FDALG;standardVector?| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G1272 NIL))
               (|FDALG;qzerov?| (QVELT |f| 2) 1
                (PROG1 (LETT #1# (- (QVELT |f| 0) 1))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                %))) 

(SDEFUN |FDALG;standardFirstColumn?| ((|f| (%)) (% (|Boolean|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|a_ref| (|List| F)) (|l| NIL)
          (#1=#:G1283 NIL) (#2=#:G1282 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (LETT |a_ref| (|FDALG;qlstA| (QVELT |f| 2) 1 1 %))
                (SEQ (LETT |l| 2) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                     (COND ((|greater_SI| |l| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |a_ref| |l| (QREFELT % 75))
                                    (QREFELT % 48)))
                         (PROGN (LETT #2# NIL) (GO #3=#:G1281))))))
                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (SPADCALL |a_ref| 1 (QREFELT % 75))
                            (|spadConstant| % 15) (QREFELT % 76))
                  (COND
                   ((NULL (|FDALG;qsemizeroA?| (QVELT |f| 2) 2 |n| 1 1 1 %))
                    (PROGN (LETT #2# NIL) (GO #3#)))))
                 ('T (PROGN (LETT #2# NIL) (GO #3#))))
                (EXIT 'T)))
          #3# (EXIT #2#)))) 

(SDEFUN |FDALG;standardLastRow?| ((|f| (%)) (% (|Boolean|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|a_ref| (|List| F)) (|l| NIL)
          (#1=#:G1294 NIL) (#2=#:G1288 NIL) (#3=#:G1293 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (LETT |a_ref| (|FDALG;qlstA| (QVELT |f| 2) |n| |n| %))
                (SEQ (LETT |l| 2) (LETT #1# (LENGTH (QVELT |f| 1))) G190
                     (COND ((|greater_SI| |l| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |a_ref| |l| (QREFELT % 75))
                                    (QREFELT % 48)))
                         (PROGN (LETT #3# NIL) (GO #4=#:G1292))))))
                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (SPADCALL |a_ref| 1 (QREFELT % 75))
                            (|spadConstant| % 15) (QREFELT % 76))
                  (COND
                   ((NULL
                     (|FDALG;qsemizeroA?| (QVELT |f| 2) |n| |n| 1
                      (PROG1 (LETT #2# (- |n| 1))
                        (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #2#))
                      1 %))
                    (PROGN (LETT #3# NIL) (GO #4#)))))
                 ('T (PROGN (LETT #3# NIL) (GO #4#))))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |FDALG;invertMIN;2%;155| ((|f| (%)) (% (%)))
        (SPROG
         ((|f_wrk| (%)) (|n| #1=(|NonNegativeInteger|)) (|flg_vec| (|Boolean|))
          (|flg_col| (|Boolean|)) (|flg_row| (|Boolean|)) (#2=#:G1298 NIL)
          (|m| #1#) (#3=#:G1329 NIL) (#4=#:G1330 NIL) (#5=#:G1302 NIL)
          (#6=#:G1303 NIL) (#7=#:G1331 NIL) (#8=#:G1332 NIL) (#9=#:G1310 NIL)
          (#10=#:G1333 NIL) (#11=#:G1313 NIL) (#12=#:G1334 NIL)
          (|T_wrk| #13=(|Matrix| F)) (|U_wrk| #13#) (#14=#:G1335 NIL)
          (#15=#:G1319 NIL) (|k| NIL) (#16=#:G1336 NIL) (#17=#:G1322 NIL)
          (#18=#:G1328 NIL) (|f_inv| (%)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT % 81))
              (COND
               ((SPADCALL (|FDALG;qeltv| (QVELT |f| 2) 1 1 %) (QREFELT % 48))
                (|error|
                 "FDALG: invertMIN(f) - zero element is not invertible."))
               ('T
                (PROGN
                 (LETT #18#
                       (SPADCALL (|spadConstant| % 14)
                                 (SPADCALL (|spadConstant| % 15)
                                           (|FDALG;qeltv| (QVELT |f| 2) 1 1 %)
                                           (QREFELT % 209))
                                 (QREFELT % 62)))
                 (GO #19=#:G1327))))))
            (LETT |f_wrk| (SPADCALL |f| (QREFELT % 51)))
            (SPADCALL |f_wrk| (QREFELT % 280)) (LETT |n| (QVELT |f_wrk| 0))
            (LETT |m| (QVELT |f_wrk| 0))
            (LETT |flg_vec| (|FDALG;standardVector?| |f_wrk| %))
            (LETT |flg_col| (|FDALG;standardFirstColumn?| |f_wrk| %))
            (LETT |flg_row| (|FDALG;standardLastRow?| |f_wrk| %))
            (COND
             (|flg_vec|
              (COND
               (|flg_col|
                (COND
                 (|flg_row|
                  (SEQ
                   (LETT |m|
                         (PROG1 (LETT #2# (- (QVELT |f_wrk| 0) 1))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#)))
                   (LETT |f_inv|
                         (SPADCALL |m| (QVELT |f_wrk| 1) (QREFELT % 35)))
                   (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |f_inv| 1))) G190
                        (COND ((|greater_SI| |k| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL (QVELT |f_inv| 2) 2 2 |k|
                                    (SPADCALL (QVELT |f_wrk| 2) 2 |n| 3
                                              (+ |n| 1) |k| (QREFELT % 20))
                                    (QREFELT % 22))))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                   (LETT |T_wrk|
                         (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                       (|spadConstant| % 50)))
                   (LETT |U_wrk|
                         (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                       (|spadConstant| % 50)))
                   (QSETAREF2O |T_wrk| 1 1 (|spadConstant| % 15) 1 1)
                   (QSETAREF2O |U_wrk| 1 1 (|spadConstant| % 15) 1 1)
                   (SEQ (LETT |k| 1) (LETT #4# |m|) G190
                        (COND ((|greater_SI| |k| #4#) (GO G191)))
                        (SEQ
                         (QSETAREF2O |T_wrk| (+ |k| 1)
                                     (PROG1 (LETT #5# (- (+ |m| 2) |k|))
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (SPADCALL (|spadConstant| % 15)
                                               (QREFELT % 58))
                                     1 1)
                         (EXIT
                          (QSETAREF2O |U_wrk| (+ |k| 1)
                                      (PROG1 (LETT #6# (- (+ |m| 2) |k|))
                                        (|check_subtype2| (>= #6# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #6#))
                                      (|spadConstant| % 15) 1 1)))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                   (QSETAREF2O |U_wrk| (+ |m| 1) 2
                               (|FDALG;qeltv| (QVELT |f_wrk| 2) |n| 1 %) 1 1)
                   (SPADCALL (QVELT |f_inv| 2) |T_wrk| (QREFELT % 206))
                   (SPADCALL (QVELT |f_inv| 2) |U_wrk| (QREFELT % 208))
                   (|FDALG;qsetu!| (QVELT |f_inv| 2) |m| 1
                    (|spadConstant| % 50) %)
                   (|FDALG;qsetu!| (QVELT |f_inv| 2) 1 1 (|spadConstant| % 15)
                    %)
                   (|FDALG;qsetv!| (QVELT |f_inv| 2) |m| 1
                    (|spadConstant| % 15) %)
                   (QSETVELT |f_inv| 4 NIL)
                   (QSETVELT |f_inv| 3 (QVELT |f_wrk| 3))
                   (SPADCALL |f_inv| NIL (QREFELT % 323))
                   (SPADCALL |f_inv| (QREFELT % 213))
                   (EXIT (PROGN (LETT #18# |f_inv|) (GO #19#))))))))))
            (COND
             (|flg_vec|
              (COND
               (|flg_col|
                (SEQ
                 (LETT |f_inv| (SPADCALL |m| (QVELT |f_wrk| 1) (QREFELT % 35)))
                 (SEQ (LETT |k| 1) (LETT #7# (LENGTH (QVELT |f_inv| 1))) G190
                      (COND ((|greater_SI| |k| #7#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |f_inv| 2) 2 3 |k|
                                  (SPADCALL (QVELT |f_wrk| 2) 2 (+ |n| 1) 3
                                            (+ |n| 1) |k| (QREFELT % 20))
                                  (QREFELT % 22))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |T_wrk|
                       (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                     (|spadConstant| % 50)))
                 (LETT |U_wrk|
                       (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                     (|spadConstant| % 50)))
                 (QSETAREF2O |T_wrk| 1 1 (|spadConstant| % 15) 1 1)
                 (QSETAREF2O |U_wrk| 1 1 (|spadConstant| % 15) 1 1)
                 (QSETAREF2O |U_wrk| 2 2 (|spadConstant| % 15) 1 1)
                 (SEQ (LETT |k| 1) (LETT #8# |m|) G190
                      (COND ((|greater_SI| |k| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |T_wrk| (+ |k| 1)
                                    (PROG1 (LETT #9# (- (+ |m| 2) |k|))
                                      (|check_subtype2| (>= #9# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #9#))
                                    (SPADCALL (|spadConstant| % 15)
                                              (QREFELT % 58))
                                    1 1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 2) (LETT #10# |m|) G190
                      (COND ((|greater_SI| |k| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |U_wrk| (+ |k| 1)
                                    (PROG1 (LETT #11# (- (+ |m| 3) |k|))
                                      (|check_subtype2| (>= #11# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #11#))
                                    (|spadConstant| % 15) 1 1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (QSETAREF2O |T_wrk| 2 (+ |m| 1)
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15)
                                        (|FDALG;qeltv| (QVELT |f_wrk| 2) |n| 1
                                         %)
                                        (QREFELT % 209))
                              (QREFELT % 58))
                             1 1)
                 (SPADCALL (QVELT |f_inv| 2) |T_wrk| (QREFELT % 206))
                 (SPADCALL (QVELT |f_inv| 2) |U_wrk| (QREFELT % 208))
                 (|FDALG;qsetu!| (QVELT |f_inv| 2) 1 1 (|spadConstant| % 15) %)
                 (|FDALG;qsetv!| (QVELT |f_inv| 2) |m| 1 (|spadConstant| % 15)
                  %)
                 (|FDALG;qsetA!| (QVELT |f_inv| 2) 1 1 1 (|spadConstant| % 15)
                  %)
                 (LETT |f_inv| (SPADCALL |f_inv| (QREFELT % 305)))
                 (QSETVELT |f_inv| 4 NIL)
                 (QSETVELT |f_inv| 3 (QVELT |f_wrk| 3))
                 (SPADCALL |f_inv| NIL (QREFELT % 323))
                 (SPADCALL |f_inv| (QREFELT % 213))
                 (EXIT (PROGN (LETT #18# |f_inv|) (GO #19#))))))))
            (COND
             (|flg_vec|
              (COND
               (|flg_row|
                (SEQ
                 (LETT |f_inv| (SPADCALL |m| (QVELT |f_wrk| 1) (QREFELT % 35)))
                 (SEQ (LETT |k| 1) (LETT #12# (LENGTH (QVELT |f_inv| 1))) G190
                      (COND ((|greater_SI| |k| #12#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |f_inv| 2) 2 2 |k|
                                  (SPADCALL (QVELT |f_wrk| 2) 2 |n| 2 (+ |n| 1)
                                            |k| (QREFELT % 20))
                                  (QREFELT % 22))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |T_wrk|
                       (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                     (|spadConstant| % 50)))
                 (LETT |U_wrk|
                       (MAKE_MATRIX1 (+ |m| 1) (+ |m| 1)
                                     (|spadConstant| % 50)))
                 (QSETAREF2O |T_wrk| 1 1 (|spadConstant| % 15) 1 1)
                 (QSETAREF2O |T_wrk| (+ |m| 1) (+ |m| 1) (|spadConstant| % 15)
                             1 1)
                 (QSETAREF2O |U_wrk| 1 1 (|spadConstant| % 15) 1 1)
                 (SEQ (LETT |k| 2) (LETT #14# |m|) G190
                      (COND ((|greater_SI| |k| #14#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |T_wrk| |k|
                                    (PROG1 (LETT #15# (- (+ |m| 2) |k|))
                                      (|check_subtype2| (>= #15# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #15#))
                                    (SPADCALL (|spadConstant| % 15)
                                              (QREFELT % 58))
                                    1 1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1) (LETT #16# |m|) G190
                      (COND ((|greater_SI| |k| #16#) (GO G191)))
                      (SEQ
                       (QSETAREF2O |U_wrk| (+ |k| 1)
                                   (PROG1 (LETT #17# (- (+ |m| 2) |k|))
                                     (|check_subtype2| (>= #17# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #17#))
                                   (|spadConstant| % 15) 1 1)
                       (EXIT
                        (QSETAREF2O |U_wrk| (+ |m| 1) 2
                                    (|FDALG;qeltv| (QVELT |f_wrk| 2) |n| 1 %) 1
                                    1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (SPADCALL (QVELT |f_inv| 2) |T_wrk| (QREFELT % 206))
                 (SPADCALL (QVELT |f_inv| 2) |U_wrk| (QREFELT % 208))
                 (|FDALG;qsetu!| (QVELT |f_inv| 2) |m| 1 (|spadConstant| % 50)
                  %)
                 (|FDALG;qsetu!| (QVELT |f_inv| 2) 1 1 (|spadConstant| % 15) %)
                 (|FDALG;qsetv!| (QVELT |f_inv| 2) |m| 1 (|spadConstant| % 15)
                  %)
                 (|FDALG;qsetA!| (QVELT |f_inv| 2) |m| |m| 1
                  (|spadConstant| % 15) %)
                 (LETT |f_inv| (SPADCALL |f_inv| (QREFELT % 305)))
                 (QSETVELT |f_inv| 4 NIL)
                 (QSETVELT |f_inv| 3 (QVELT |f_wrk| 3))
                 (SPADCALL |f_inv| NIL (QREFELT % 323))
                 (SPADCALL |f_inv| (QREFELT % 213))
                 (EXIT (PROGN (LETT #18# |f_inv|) (GO #19#))))))))
            (LETT |f_inv|
                  (SPADCALL (SPADCALL |f_wrk| (QREFELT % 238))
                            (QREFELT % 305)))
            (QSETVELT |f_inv| 4 NIL) (QSETVELT |f_inv| 3 (QVELT |f_wrk| 3))
            (SPADCALL |f_inv| NIL (QREFELT % 323))
            (SPADCALL |f_inv| (QREFELT % 213)) (EXIT |f_inv|)))
          #19# (EXIT #18#)))) 

(SDEFUN |FDALG;inverse;2%;156| ((|f| (%)) (% (%)))
        (SEQ
         (COND
          ((NULL (QVELT |f| 3))
           (|error| "FDALG: inverse(f) - system is not minimal."))
          ('T
           (SEQ (SPADCALL |f| NIL (QREFELT % 323))
                (EXIT
                 (SPADCALL (SPADCALL |f| (QREFELT % 265)) 4
                           (QREFELT % 324)))))))) 

(SDEFUN |FDALG;inv;2%;157| ((|f| (%)) (% (%)))
        (COND
         ((NULL (QVELT |f| 3))
          (|error| "FDALG: inv(f) - system is not minimal."))
         ('T (SPADCALL (SPADCALL |f| (QREFELT % 265)) (QREFELT % 326))))) 

(SDEFUN |FDALG;/;F2%;158| ((|alpha| (F)) (|f| (%)) (% (%)))
        (SPROG ((#1=#:G1346 NIL) (|f_inv| (%)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |alpha| (QREFELT % 48))
                    (PROGN
                     (LETT #1# (SPADCALL (|spadConstant| % 49) (QREFELT % 51)))
                     (GO #2=#:G1345))))
                  (LETT |f_inv|
                        (SPADCALL (SPADCALL |f| (QREFELT % 265))
                                  (QREFELT % 326)))
                  (|FDALG;qscalev!| (QVELT |f_inv| 2) 1 (QVELT |f_inv| 0) 1
                   |alpha| %)
                  (EXIT |f_inv|)))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;/;3%;159| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG ((|f_inv| (%)))
               (SEQ
                (COND
                 ((QVELT |g| 4)
                  (COND
                   ((NULL (QVELT |g| 3))
                    (EXIT
                     (|error|
                      #1="FDALG: f / g - g not in minimal refined form.")))))
                 ('T (EXIT (|error| #1#))))
                (LETT |f_inv|
                      (SPADCALL (SPADCALL |g| (QREFELT % 265))
                                (QREFELT % 326)))
                (EXIT (SPADCALL |f| |f_inv| (QREFELT % 307)))))) 

(SDEFUN |FDALG;^;%I%;160| ((|f| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|g| (%)) (#1=#:G1352 NIL) (#2=#:G1356 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((ZEROP |n|)
                    (PROGN (LETT #2# (|spadConstant| % 14)) (GO #3=#:G1355))))
                  (COND
                   ((< |n| 0)
                    (SEQ (LETT |g| (SPADCALL |f| (QREFELT % 327)))
                         (EXIT
                          (PROGN
                           (LETT #2#
                                 (SPADCALL |g|
                                           (PROG1 (LETT #1# (- |n|))
                                             (|check_subtype2| (> #1# 0)
                                                               '(|PositiveInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT % 322)))
                           (GO #3#))))))
                  (EXIT (SPADCALL |f| |n| (QREFELT % 330)))))
                #3# (EXIT #2#)))) 

(SDEFUN |FDALG;qrefinementTransformations|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|))
         (|sol| (|List| (|Equation| (|Polynomial| F))))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|row_P| #1=(|List| (|NonNegativeInteger|))) (#2=#:G1358 NIL)
          (|col_P| #1#) (|row_Q| #1#) (|col_Q| #1#))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |row_P|
                    (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
              (LETT |col_P|
                    (SPADCALL (+ 1 |i_min|)
                              (+ 1
                                 (MIN |i_max|
                                      (PROG1 (LETT #2# (- |n| 1))
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))))
                              (QREFELT % 28)))
              (LETT |row_Q|
                    (SPADCALL (+ 1 (MAX |i_min| 2)) (+ 1 |i_max|)
                              (QREFELT % 28)))
              (LETT |col_Q|
                    (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
              (EXIT
               (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q| |sol|
                         (QREFELT % 276)))))) 

(SDEFUN |FDALG;refinementTransformations;%2NniLL;162|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|))
         (|sol| (|List| (|Equation| (|Polynomial| F))))
         (% (|List| (|Matrix| F))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|row_P| #1=(|List| (|NonNegativeInteger|))) (#2=#:G1362 NIL)
          (|col_P| #1#) (|row_Q| #1#) (|col_Q| #1#)
          (|lst_trn| (|List| (|Matrix| F))))
         (SEQ (LETT |n| (QVELT |f| 0))
              (LETT |row_P|
                    (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
              (LETT |col_P|
                    (SPADCALL (+ 1 |i_min|)
                              (+ 1
                                 (MIN |i_max|
                                      (PROG1 (LETT #2# (- |n| 1))
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))))
                              (QREFELT % 28)))
              (LETT |row_Q|
                    (SPADCALL (+ 1 (MAX |i_min| 2)) (+ 1 |i_max|)
                              (QREFELT % 28)))
              (LETT |col_Q|
                    (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
              (LETT |lst_trn|
                    (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q|
                              |sol| (QREFELT % 276)))
              (EXIT
               (LIST
                (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 162)) (+ 1 1)
                          (+ 1 |n|) (+ 1 1) (+ 1 |n|) (QREFELT % 163))
                (SPADCALL (SPADCALL |lst_trn| 2 (QREFELT % 162)) (+ 1 1)
                          (+ 1 |n|) (+ 1 1) (+ 1 |n|) (QREFELT % 163))))))) 

(SDEFUN |FDALG;refinementEquations;%3Nni2BL;163|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|k_rows| (|NonNegativeInteger|))
         (|flg_u| (|Boolean|)) (|flg_r| (|Boolean|))
         (% (|List| (|Polynomial| F))))
        (SPROG
         ((|row_P| #1=(|List| (|NonNegativeInteger|))) (#2=#:G1366 NIL)
          (|col_P| #1#) (|row_Q| #1#) (|col_Q| #1#)
          (|j_min| (|NonNegativeInteger|)) (#3=#:G1367 NIL)
          (|j_max| (|NonNegativeInteger|)) (#4=#:G1368 NIL) (|rdst| #1#)
          (|cdst| #1#) (#5=#:G1369 NIL)
          (|rex1| (|List| (|NonNegativeInteger|)))
          (|cex1| (|List| (|NonNegativeInteger|))) (#6=#:G1371 NIL)
          (|rex2| (|List| (|NonNegativeInteger|)))
          (|cex2| (|List| (|NonNegativeInteger|)))
          (|lst_eqn| (|List| (|Polynomial| F))))
         (SEQ
          (LETT |row_P| (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
          (LETT |col_P|
                (SPADCALL (+ 1 |i_min|)
                          (+ 1
                             (MIN |i_max|
                                  (PROG1 (LETT #2# (- (QVELT |f| 0) 1))
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))))
                          (QREFELT % 28)))
          (LETT |row_Q|
                (SPADCALL (+ 1 (MAX |i_min| 2)) (+ 1 |i_max|) (QREFELT % 28)))
          (LETT |col_Q| (SPADCALL (+ 1 |i_min|) (+ 1 |i_max|) (QREFELT % 28)))
          (LETT |j_min| |i_min|)
          (LETT |j_max|
                (PROG1 (LETT #3# (- |i_max| |k_rows|))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |rdst|
                (SPADCALL
                 (+ 1
                    (PROG1 (LETT #4# (+ (- |i_max| |k_rows|) 1))
                      (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #4#)))
                 (+ 1 |i_max|) (QREFELT % 28)))
          (LETT |cdst| (SPADCALL (+ 1 |j_min|) (+ 1 |j_max|) (QREFELT % 28)))
          (LETT |rex1| NIL) (LETT |cex1| NIL)
          (COND
           (|flg_u|
            (SEQ
             (LETT |rex1|
                   (SPADCALL (+ 1 1)
                             (+ 1
                                (PROG1 (LETT #5# (- |i_min| 1))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#)))
                             (QREFELT % 28)))
             (EXIT
              (LETT |cex1|
                    (SPADCALL (+ (+ 1 |i_min|) 1) (+ 1 |i_max|)
                              (QREFELT % 28)))))))
          (LETT |rex2| NIL) (LETT |cex2| NIL)
          (COND
           (|flg_r|
            (SEQ
             (LETT |rex2|
                   (SPADCALL (+ 1 |i_min|)
                             (+ 1
                                (PROG1 (LETT #6# (- |i_max| 1))
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#)))
                             (QREFELT % 28)))
             (EXIT
              (LETT |cex2|
                    (SPADCALL (+ (+ 1 |i_max|) 1) (+ 1 (QVELT |f| 0))
                              (QREFELT % 28)))))))
          (LETT |lst_eqn|
                (SPADCALL (QVELT |f| 2) |row_P| |col_P| |row_Q| |col_Q| |rdst|
                          |cdst| |rex1| |cex1| |rex2| |cex2| (QREFELT % 286)))
          (EXIT |lst_eqn|)))) 

(SDEFUN |FDALG;refinementGroebner;%3Nni2BL;164|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|k_rows| (|NonNegativeInteger|))
         (|flg_1| (|Boolean|)) (|flg_2| (|Boolean|))
         (% (|List| (|Polynomial| F))))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| F)))
          (|tmp_var| (|List| (|List| (|Symbol|))))
          (|lst_var| (|List| (|Symbol|)))
          (|tDMP|
           (|Join|
            (|PolynomialCategory| F
                                  (|DirectProduct| (|#| |lst_var|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lst_var|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| (% % (|List| (|Integer|)))))))
          (|tPRD|
           (|Join|
            (|DirectProductCategory| (|#| |lst_var|) #1=(|NonNegativeInteger|))
            (CATEGORY |package|
             (IF (|has| #1# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (#2=#:G1382 NIL) (#3=#:G1383 NIL) (|eqn_wrk| (|List| |tDMP|))
          (|bas_gro| (|List| |tDMP|)) (#4=#:G1384 NIL) (|eqn| NIL)
          (#5=#:G1385 NIL) (|lst_gro| (|List| (|Polynomial| F))))
         (SEQ
          (LETT |lst_eqn|
                (SPADCALL |f| |i_min| |i_max| |k_rows| |flg_1| |flg_2|
                          (QREFELT % 332)))
          (LETT |tmp_var| (SPADCALL (ELT % 289) |lst_eqn| (QREFELT % 293)))
          (LETT |lst_var|
                (SPADCALL (SPADCALL |tmp_var| (QREFELT % 294))
                          (QREFELT % 295)))
          (LETT |tDMP|
                (|DistributedMultivariatePolynomial| |lst_var| (QREFELT % 7)))
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
                                                                   (ELT % 7)))
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT % 7))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT % 7))))
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
                                                 (|GroebnerPackage| (ELT % 7)
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
                                                                   (ELT % 7)))
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lst_var|
                                                                  (|devaluate|
                                                                   (ELT % 7))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT % 7))))
                               #4#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT |lst_gro|)))) 

(SDEFUN |FDALG;refinementSolve;%3Nni2BL;165|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|k_rows| (|NonNegativeInteger|))
         (|flg_u| (|Boolean|)) (|flg_r| (|Boolean|))
         (% (|List| (|List| (|Equation| (|Polynomial| F))))))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| F))) (|lst_val| (|List| F))
          (|k| NIL) (|lst_wrk| (|List| (|Polynomial| F)))
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| F)))))
          (#1=#:G1393 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| F))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lst_eqn|
                  (SPADCALL |f| |i_min| |i_max| |k_rows| |flg_u| |flg_r|
                            (QREFELT % 333)))
            (LETT |lst_val| (LIST (|spadConstant| % 50))) (LETT |lst_wrk| NIL)
            (LETT |lst_sol| NIL)
            (SEQ (LETT |k| (LENGTH |lst_eqn|)) G190
                 (COND ((< |k| 1) (GO G191)))
                 (SEQ
                  (LETT |lst_wrk|
                        (CONS (SPADCALL |lst_eqn| |k| (QREFELT % 297))
                              |lst_wrk|))
                  (LETT |sol_wrk|
                        (SPADCALL |lst_wrk| |lst_val| |lst_sol|
                                  (QREFELT % 298)))
                  (COND
                   ((ZEROP (LENGTH |sol_wrk|))
                    (PROGN (LETT #1# NIL) (GO #2=#:G1392))))
                  (EXIT (LETT |lst_sol| (SPADCALL |sol_wrk| (QREFELT % 299)))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
            (EXIT |lst_sol|)))
          #2# (EXIT #1#)))) 

(SDEFUN |FDALG;qrefinedGroebner?|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|i| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG ((|groe| (|List| (|Polynomial| F))) (#1=#:G1399 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |groe|
                        (SPADCALL |f| |i_min| |i_max| |i| NIL NIL
                                  (QREFELT % 333)))
                  (COND
                   ((> (LENGTH |groe|) 1)
                    (PROGN (LETT #1# NIL) (GO #2=#:G1398))))
                  (COND
                   ((SPADCALL (|SPADfirst| |groe|) (|spadConstant| % 335)
                              (QREFELT % 336))
                    (PROGN (LETT #1# NIL) (GO #2#))))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;qrefined?|
        ((|f| (%)) (|max_sze| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((|blo_mtx| (|Matrix| (|NonNegativeInteger|))) (|k| NIL)
          (#1=#:G1412 NIL) (|m| (|NonNegativeInteger|)) (|i| NIL)
          (#2=#:G1404 NIL) (#3=#:G1413 NIL) (#4=#:G1411 NIL)
          (|flg_ref| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
                (LETT |flg_ref| 'T)
                (SEQ (LETT |k| 1)
                     (LETT #1# (SPADCALL |blo_mtx| (QREFELT % 154))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |blo_mtx| |k| 3 (QREFELT % 184)))
                          (EXIT
                           (COND
                            ((<= |m| |max_sze|)
                             (SEQ (LETT |i| 1)
                                  (LETT #3#
                                        (PROG1 (LETT #2# (- |m| 1))
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#)))
                                  G190
                                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (|FDALG;qrefinedGroebner?| |f|
                                        (SPADCALL |blo_mtx| |k| 1
                                                  (QREFELT % 184))
                                        (SPADCALL |blo_mtx| |k| 2
                                                  (QREFELT % 184))
                                        |i| %))
                                      (PROGN
                                       (LETT #4# NIL)
                                       (GO #5=#:G1410))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL)))
                            ('T (LETT |flg_ref| NIL)))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |flg_ref|)))
          #5# (EXIT #4#)))) 

(SDEFUN |FDALG;setRefined!;%Nni%;168|
        ((|f| (%)) (|max_sze| (|NonNegativeInteger|)) (% (%)))
        (SEQ (COND ((|FDALG;qrefined?| |f| |max_sze| %) (QSETVELT |f| 4 'T)))
             (EXIT |f|))) 

(SDEFUN |FDALG;refinePERM!|
        ((|f| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G1419 NIL)
          (#2=#:G1432 NIL) (#3=#:G1420 NIL) (#4=#:G1431 NIL) (|j| NIL)
          (#5=#:G1433 NIL) (|flg_tmp| (|Boolean|)) (#6=#:G1430 NIL))
         (SEQ (LETT |n| (QVELT |f| 0)) (LETT |flg_tmp| NIL)
              (COND
               ((< |i_max| |n|)
                (COND
                 ((NULL |flg_tmp|)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| |i_min|)
                         (LETT #2#
                               (PROG1 (LETT #1# (- |i_max| 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         G190 (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|FDALG;qzeromtxA?| (QVELT |f| 2) |i| |i| |i_min|
                              (PROG1 (LETT #3# (- |i_max| 1))
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              %)
                             (SEQ (SPADCALL |f| |i| |i_max| (QREFELT % 115))
                                  (LETT |flg_tmp| 'T)
                                  (EXIT
                                   (PROGN (LETT #4# 1) (GO #7=#:G1423))))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #7# (EXIT #4#))))))
              (COND
               ((> |i_min| 1)
                (COND
                 ((NULL |flg_tmp|)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (+ |i_min| 1)) (LETT #5# |i_max|) G190
                         (COND ((> |j| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|FDALG;qzeromtxA?| (QVELT |f| 2) (+ |i_min| 1)
                              |i_max| |j| |j| %)
                             (SEQ (SPADCALL |f| |j| |i_min| (QREFELT % 129))
                                  (LETT |flg_tmp| 'T)
                                  (EXIT
                                   (PROGN (LETT #6# 1) (GO #8=#:G1427))))))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                   #8# (EXIT #6#))))))
              (EXIT |f|)))) 

(SDEFUN |FDALG;refine!;%B%;170| ((|f| (%)) (|flg| (|Boolean|)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1438 NIL) (#2=#:G1467 NIL)
          (#3=#:G1466 NIL) (#4=#:G1447 NIL) (|num_blo| (|NonNegativeInteger|))
          (|k| NIL) (#5=#:G1468 NIL) (|m| #6=(|NonNegativeInteger|))
          (|i_min| #6#) (|i_max| #6#) (|i| NIL) (#7=#:G1452 NIL)
          (#8=#:G1469 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| F)))))
          (|lst_trn| (|List| (|Matrix| F))) (#9=#:G1465 NIL)
          (|blo_mtx| (|Matrix| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVELT |f| 0))
                (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))
                (COND
                 ((OR (EQL |n| 1)
                      (EQL (SPADCALL |blo_mtx| (QREFELT % 154)) |n|))
                  (SEQ (QSETVELT |f| 4 'T)
                       (EXIT (PROGN (LETT #3# |f|) (GO #10=#:G1464))))))
                (LETT |num_blo|
                      (PROG1
                          (LETT #1# (- (SPADCALL |blo_mtx| (QREFELT % 154)) 1))
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                (SEQ G190
                     (COND
                      ((NULL
                        (< |num_blo| (SPADCALL |blo_mtx| (QREFELT % 154))))
                       (GO G191)))
                     (SEQ (LETT |num_blo| (SPADCALL |blo_mtx| (QREFELT % 154)))
                          (SEQ (LETT |k| 1)
                               (LETT #2# (SPADCALL |blo_mtx| (QREFELT % 154)))
                               G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                               (SEQ
                                (LETT |m|
                                      (SPADCALL |blo_mtx| |k| 3
                                                (QREFELT % 184)))
                                (EXIT
                                 (COND
                                  ((>= |m| 2)
                                   (|FDALG;refinePERM!| |f|
                                    (SPADCALL |blo_mtx| |k| 1 (QREFELT % 184))
                                    (SPADCALL |blo_mtx| |k| 2 (QREFELT % 184))
                                    %)))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL |flg|)
                  (SEQ
                   (COND
                    ((EQL (SPADCALL |blo_mtx| (QREFELT % 154)) (QVELT |f| 0))
                     (QSETVELT |f| 4 'T)))
                   (EXIT (PROGN (LETT #3# |f|) (GO #10#))))))
                (LETT |num_blo|
                      (PROG1
                          (LETT #4# (- (SPADCALL |blo_mtx| (QREFELT % 154)) 1))
                        (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #4#)))
                (SEQ G190
                     (COND
                      ((NULL
                        (< |num_blo| (SPADCALL |blo_mtx| (QREFELT % 154))))
                       (GO G191)))
                     (SEQ (LETT |num_blo| (SPADCALL |blo_mtx| (QREFELT % 154)))
                          (SEQ (LETT |k| 1)
                               (LETT #5# (SPADCALL |blo_mtx| (QREFELT % 154)))
                               G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (LETT |m|
                                      (SPADCALL |blo_mtx| |k| 3
                                                (QREFELT % 184)))
                                (LETT |i_min|
                                      (SPADCALL |blo_mtx| |k| 1
                                                (QREFELT % 184)))
                                (LETT |i_max|
                                      (SPADCALL |blo_mtx| |k| 2
                                                (QREFELT % 184)))
                                (EXIT
                                 (COND
                                  ((>= |m| 2)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1)
                                          (LETT #8#
                                                (PROG1 (LETT #7# (- |m| 1))
                                                  (|check_subtype2| (>= #7# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #7#)))
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #8#) (GO G191)))
                                          (SEQ
                                           (LETT |lst_sol|
                                                 (SPADCALL |f| |i_min| |i_max|
                                                           |i| 'T 'T
                                                           (QREFELT % 334)))
                                           (COND
                                            ((ZEROP (LENGTH |lst_sol|))
                                             (LETT |lst_sol|
                                                   (SPADCALL |f| |i_min|
                                                             |i_max| |i| 'T NIL
                                                             (QREFELT %
                                                                      334)))))
                                           (COND
                                            ((ZEROP (LENGTH |lst_sol|))
                                             (LETT |lst_sol|
                                                   (SPADCALL |f| |i_min|
                                                             |i_max| |i| NIL 'T
                                                             (QREFELT %
                                                                      334)))))
                                           (COND
                                            ((ZEROP (LENGTH |lst_sol|))
                                             (LETT |lst_sol|
                                                   (SPADCALL |f| |i_min|
                                                             |i_max| |i| NIL
                                                             NIL
                                                             (QREFELT %
                                                                      334)))))
                                           (EXIT
                                            (COND
                                             ((> (LENGTH |lst_sol|) 0)
                                              (SEQ
                                               (LETT |lst_trn|
                                                     (|FDALG;qrefinementTransformations|
                                                      |f| |i_min| |i_max|
                                                      (|SPADfirst| |lst_sol|)
                                                      %))
                                               (SPADCALL (QVELT |f| 2)
                                                         (SPADCALL |lst_trn| 1
                                                                   (QREFELT %
                                                                            162))
                                                         (QREFELT % 206))
                                               (SPADCALL (QVELT |f| 2)
                                                         (SPADCALL |lst_trn| 2
                                                                   (QREFELT %
                                                                            162))
                                                         (QREFELT % 208))
                                               (EXIT
                                                (PROGN
                                                 (LETT #9# 1)
                                                 (GO #11=#:G1458))))))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL)))
                                    #11# (EXIT #9#))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (LETT |blo_mtx| (SPADCALL |f| (QREFELT % 153)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |f| (QREFELT % 213)) (QSETVELT |f| 4 'T) (EXIT |f|)))
          #10# (EXIT #3#)))) 

(SDEFUN |FDALG;refine!;2%;171| ((|f| (%)) (% (%)))
        (SPADCALL |f| 'T (QREFELT % 323))) 

(SDEFUN |FDALG;rank;%Nni;172| ((|f| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((|als| (%)) (#1=#:G1480 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |f| (QREFELT % 71))
                    (SEQ
                     (COND
                      ((EQL (QVELT |f| 0) 1)
                       (COND
                        ((SPADCALL (|FDALG;qeltv| (QVELT |f| 2) 1 1 %)
                                   (QREFELT % 48))
                         (PROGN (LETT #1# 0) (GO #2=#:G1479))))))
                     (EXIT (PROGN (LETT #1# (QVELT |f| 0)) (GO #2#))))))
                  (LETT |als| (SPADCALL |f| (QREFELT % 305)))
                  (SPADCALL |als| (QREFELT % 326))
                  (LETT |als| (SPADCALL |als| (QREFELT % 305)))
                  (COND
                   ((EQL (QVELT |als| 0) 1)
                    (COND
                     ((SPADCALL (|FDALG;qeltv| (QVELT |als| 2) 1 1 %)
                                (QREFELT % 48))
                      (PROGN (LETT #1# 0) (GO #2#))))))
                  (EXIT (QVELT |als| 0))))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;zero?;%B;173| ((|f| (%)) (% (|Boolean|)))
        (SPROG ((|als| (%)) (#1=#:G1488 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((|FDALG;qzerov?| (QVELT |f| 2) 1 (QVELT |f| 0) %)
                    (PROGN (LETT #1# 'T) (GO #2=#:G1487))))
                  (COND
                   ((NULL (SPADCALL |f| (QREFELT % 71)))
                    (SEQ (LETT |als| (SPADCALL |f| (QREFELT % 305)))
                         (COND
                          ((|FDALG;qzerov?| (QVELT |als| 2) 1 (QVELT |als| 0)
                            %)
                           (PROGN (LETT #1# 'T) (GO #2#))))
                         (EXIT
                          (COND
                           ((SPADCALL |als| (QREFELT % 71))
                            (PROGN (LETT #1# NIL) (GO #2#)))
                           ('T
                            (SEQ (SPADCALL |als| (QREFELT % 326))
                                 (LETT |als| (SPADCALL |als| (QREFELT % 305)))
                                 (EXIT
                                  (COND
                                   ((|FDALG;qzerov?| (QVELT |als| 2) 1
                                     (QVELT |als| 0) %)
                                    (PROGN (LETT #1# 'T) (GO #2#))))))))))))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |FDALG;=;2%B;174| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPROG
         ((|als| (%)) (|lst_1| #1=(|List| (|NonNegativeInteger|)))
          (|lst_2| #1#) (|trn_wrk| (|List| (|Matrix| F))) (#2=#:G1503 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT % 81))
              (COND
               ((SPADCALL (|FDALG;qeltv| (QVELT |f| 2) 1 1 %) (QREFELT % 48))
                (EXIT (SPADCALL |g| (QREFELT % 338)))))))
            (COND
             ((SPADCALL |g| (QREFELT % 81))
              (COND
               ((SPADCALL (|FDALG;qeltv| (QVELT |g| 2) 1 1 %) (QREFELT % 48))
                (EXIT (SPADCALL |f| (QREFELT % 338)))))))
            (COND
             ((QVELT |f| 3)
              (COND ((< (QVELT |g| 0) (QVELT |f| 0)) (EXIT NIL)))))
            (COND
             ((QVELT |g| 3)
              (COND ((< (QVELT |f| 0) (QVELT |g| 0)) (EXIT NIL)))))
            (LETT |als|
                  (SPADCALL |f| (SPADCALL |g| (QREFELT % 313))
                            (QREFELT % 234)))
            (LETT |lst_1| (SPADCALL 1 (QVELT |f| 0) (QREFELT % 28)))
            (LETT |lst_2|
                  (SPADCALL (+ (QVELT |f| 0) 1) (+ (QVELT |f| 0) (QVELT |g| 0))
                            (QREFELT % 28)))
            (LETT |trn_wrk|
                  (SPADCALL |als| |lst_2| |lst_1| |lst_1| |lst_2|
                            (QREFELT % 166)))
            (COND
             ((> (LENGTH |trn_wrk|) 0) (PROGN (LETT #2# 'T) (GO #3=#:G1502))))
            (COND ((QVELT |f| 3) (COND ((QVELT |g| 3) (EXIT NIL)))))
            (EXIT (SPADCALL |als| (QREFELT % 338)))))
          #3# (EXIT #2#)))) 

(SDEFUN |FDALG;coerce;%Xdp;175|
        ((|f| (%)) (% (|XDistributedPolynomial| VAR F)))
        (SPADCALL |f| (QREFELT % 217))) 

(SDEFUN |FDALG;coerce;Xdp%;176|
        ((|p| (|XDistributedPolynomial| VAR F)) (% (%)))
        (SPROG ((|trm| NIL) (#1=#:G1512 NIL) (|f_wrk| (%)))
               (SEQ (LETT |f_wrk| (|spadConstant| % 49))
                    (SEQ (LETT |trm| NIL)
                         (LETT #1# (SPADCALL |p| (QREFELT % 343))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |trm| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |f_wrk|
                                 (SPADCALL |f_wrk|
                                           (SPADCALL (QCAR |trm|) (QCDR |trm|)
                                                     (QREFELT % 59))
                                           (QREFELT % 306)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |f_wrk|)))) 

(DECLAIM (NOTINLINE |FreeDivisionAlgebra;|)) 

(DEFUN |FreeDivisionAlgebra;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FreeDivisionAlgebra| DV$1 DV$2))
          (LETT % (GETREFV 349))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))))))
          (|haddProp| |$ConstructorCache| '|FreeDivisionAlgebra|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |size| (|NonNegativeInteger|))
                              (|:| |supp| (|List| (|FreeMonoid| |#1|)))
                              (|:| |lmmp|
                                   (|LinearMultivariateMatrixPencil| |#2|))
                              (|:| |flg_minimal| (|Boolean|))
                              (|:| |flg_refined| (|Boolean|))
                              (|:| |flg_mutable| (|Boolean|))
                              (|:| |flg_debug| (|Boolean|))
                              (|:| |flg_output| (|Boolean|))))
          %))) 

(DEFUN |FreeDivisionAlgebra| (&REST #1=#:G1517)
  (SPROG NIL
         (PROG (#2=#:G1518)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeDivisionAlgebra|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FreeDivisionAlgebra;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FreeDivisionAlgebra|)))))))))) 

(MAKEPROP '|FreeDivisionAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (0 . |characteristic|)
              |FDALG;characteristic;Nni;1| (|LinearMultivariateMatrixPencil| 7)
              (4 . |qelt|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FDALG;1;%;29|) %))
              (12 . |1|) (|List| 7) (16 . |qelt|) (23 . |qsetelt!|)
              (|Matrix| 7) (32 . |subMatrix|) (42 . |qscaleBlock!|)
              (53 . |setsubMatrix!|) (|Boolean|) (62 . |qzero?|)
              (69 . |qzero?|) (78 . |qsemizero?|) (|List| 9)
              |FDALG;interval;2NniL;21| (|FreeMonoid| 6) (88 . |1|)
              (92 . |qnew|) |FDALG;qnew;Nni%;22| (|List| 29) (99 . |remove|)
              |FDALG;qnew;NniL%;23| (105 . |length|) (110 . |nrows|)
              (115 . |ncols|) (120 . ~=) (126 . |nelem|) |FDALG;new;LmmpL%;24|
              (131 . |new|) (|Integer|) (|List| 6) (137 . |elt|)
              (143 . |coerce|) (148 . |setelt!|) (155 . |zero?|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FDALG;0;%;28|) %))
              (160 . |0|) |FDALG;copy;2%;30| |FDALG;new;F%;26|
              (164 . |varList|) (|Record| (|:| |gen| 6) (|:| |exp| 9))
              (|List| 54) (169 . |factors|) (174 . |position|) (180 . -)
              |FDALG;new;FmF%;27| (185 . |copy|) (190 . |copy|)
              |FDALG;copy;%F%;31| |FDALG;coerce;Fm%;32| |FDALG;coerce;F%;33|
              |FDALG;enableDebugOutput;2%;34| |FDALG;disableDebugOutput;2%;35|
              |FDALG;toggleDebugOutput;2%;36|
              |FDALG;enableAlternativeOutput;2%;37|
              |FDALG;disableAlternativeOutput;2%;38|
              |FDALG;toggleAlternativeOutput;2%;39| |FDALG;minimal?;%B;40|
              |FDALG;mutable?;%B;41| (195 . |qdiagonal?|) (203 . |qdiagonal|)
              (211 . |elt|) (217 . =) |FDALG;qregular?;%2NniB;42|
              |FDALG;scalar?;%2NniB;43| |FDALG;zero?;%2NniB;44|
              (223 . |qnilpotent?|) |FDALG;scalar?;%B;45| (231 . |rank|)
              |FDALG;regular?;%B;46| (236 . |quppertriangular?|)
              |FDALG;polynomial?;%B;48| |FDALG;dimension;%Nni;49|
              |FDALG;variables;%L;50| |FDALG;elt;%NniF;51|
              (|XDistributedPolynomial| 6 7) (244 . |0|) (248 . |elt|)
              (254 . |coerce|) (259 . *) (265 . +) |FDALG;qelt;%2NniXdp;52|
              |FDALG;elt;%2NniXdp;53| |FDALG;setelt!;%Nni2F;54| (271 . |zero?|)
              (276 . |degree|) (281 . |varList|) (286 . |coefficient|)
              (292 . =) |FDALG;setelt!;%2Nni2Xdp;55| |FDALG;vector;%M;56|
              (298 . |coerce|) (|Matrix| 89) |FDALG;vector;%M;57|
              |FDALG;matrix;%FmM;58| |FDALG;matrix;%M;59| (303 . |append!|)
              (309 . |append|) |FDALG;appendSupport!;%L%;60|
              |FDALG;pencil;%Lmmp;61| (315 . |qswapRows!|)
              |FDALG;qswapRows!;%2Nni%;62| |FDALG;swapRows!;%2Nni%;63|
              (322 . |qaddRows!|) |FDALG;qaddRows!;%2NniF%;64|
              (330 . |qaddColumns!|) |FDALG;addRowsColumns!;%2NniF%;65|
              |FDALG;addColumnsRows!;%2NniF%;66| (338 . |addRows!|)
              |FDALG;addRows!;%2NniF%;67| (346 . |qmultiplyRow!|)
              |FDALG;multiplyRow!;%NniF%;69| (353 . |qmultiplyColumn!|)
              |FDALG;multiplyColumn!;%NniF%;71| (360 . |qswapColumns!|)
              |FDALG;qswapColumns!;%2Nni%;72| |FDALG;swapColumns!;%2Nni%;73|
              |FDALG;swapRowsColumns!;%2Nni%;74| (367 . |addColumns!|)
              |FDALG;addColumns!;%2NniF%;75| |FDALG;qaddColumns!;%2NniF%;76|
              (375 . |1|) (379 . +) (385 . |removeDuplicates|) (|Mapping| 9 9)
              (390 . |map|) (396 . |#|) (401 . |removeRowsColumns|)
              |FDALG;removeRowsColumns;%2L%;77| (408 . |insertRowsColumns|)
              (415 . |elt|) |FDALG;insertRowsColumns;%2L%;78|
              |FDALG;qzero?;%4NniB;79| (421 . |qzero?|)
              |FDALG;qzero?;%5NniB;80| |FDALG;qzero?;%4NniFmB;81| (|Matrix| 9)
              (431 . |new|) (438 . |sort|) |FDALG;blockStructure;%M;82|
              (443 . |nrows|) |FDALG;refined?;%B;83| (|List| 19)
              (448 . |blockElimination|) (459 . |min|) (|Mapping| 9 9 9)
              (465 . |reduce|) (471 . |max|) (477 . |elt|) (483 . |subMatrix|)
              (492 . |setelt!|) |FDALG;blockElimination;%2LB2LBL;85|
              |FDALG;blockElimination;%4LL;86| (|List| 170) (|List| 167)
              (499 . |new|) (|OutputForm|) (|Symbol|) (505 . |coerce|)
              (510 . |coerce|) (515 . |sub|) (521 . |setelt!|) (|List| 241)
              (528 . |matrix|) |FDALG;display;%2Of;89| (|List| 171)
              |FDALG;display;%LOf;88| (533 . |coerce|) (538 . *) (544 . =)
              (550 . |elt|) (557 . |hspace|) (562 . |new|) (568 . |coerce|)
              (573 . |qsetelt!|) |FDALG;admissibleLinearSystem;%Of;90|
              (580 . -) |FDALG;linearization;%M;91| (|Matrix| $$) (585 . |new|)
              (592 . |qsetelt!|) (|Matrix| %) |FDALG;linearization;%M;92|
              (|List| 106) |FDALG;representation;%L;93|
              |FDALG;transformColumns!;%M%;98| |FDALG;*;%M%;94|
              |FDALG;transformRows!;%M%;97| |FDALG;*;M2%;95|
              |FDALG;transformationMatrix;%M;96| (600 . |leftIdentity|)
              (605 . |setsubMatrix!|) (613 . |transformRows!|)
              (619 . |rightIdentity|) (624 . |transformColumns!|) (630 . /)
              |FDALG;normalizeRHS!;2%;99| |FDALG;normalizePLS!;2%;100|
              |FDALG;normalizeDIAG!;2%;101| |FDALG;normalize!;2%;102| (636 . -)
              (641 . |1|) |FDALG;solutionVector;%M;105|
              |FDALG;polynomial;%Xdp;104| (645 . *) (651 . -) (657 . |copy|)
              (662 . *) (668 . +) |FDALG;solutionVector;%NniM;106|
              (|Mapping| 106 106) (|Stream| 106) (674 . |stream|)
              |FDALG;columnSpan;%S;107| (680 . |setelt!|)
              |FDALG;rowSpan;%S;108| |FDALG;scaleALS;%F%;109| (688 . |merge|)
              (694 . |removeDuplicates|) (699 . |sort|) |FDALG;addALS;3%;110|
              (704 . -) |FDALG;multiplyALS;3%;111| |FDALG;invertALS;2%;112|
              |FDALG;invertSTD;2%;113| (|List| $$) (709 . |cons|) (|List| %)
              |FDALG;factors;%L;114| (715 . |#|) |FDALG;summands;%L;115|
              (720 . |support|) (725 . |paren|) (730 . |leadingCoefficient|)
              (735 . ~=) (|List| 27) (741 . |new|) (|List| 89) (747 . |new|)
              (753 . |setelt!|) (760 . |elt|) (766 . |elt|) (772 . |setelt!|)
              (779 . |coerce|) (784 . |coerce|) (789 . |setelt!|) (796 . =)
              (802 . |elt|) (808 . +) (814 . |super|) |FDALG;leftFamily;%L;117|
              |FDALG;invertMIN;2%;155| (820 . |hconcat|) (826 . |first|)
              |FDALG;ratexprInverse;%BOf;118| (831 . |rest|)
              |FDALG;ratexpr;%Of;119| (836 . |semicolonSeparate|)
              |FDALG;coerce;%Of;120| |FDALG;leftFactor;%Nni%;121|
              |FDALG;rightFactor;%Nni%;122| (|List| (|Equation| 288))
              (841 . |eliminationTransformations|) (|List| 275)
              |FDALG;factorizationSolve;%2NniL;129| |FDALG;factorize;%NniL;124|
              |FDALG;refineUR!;2%;131| (851 . |elt|) (857 . |reverse|)
              |FDALG;factor;%L;125|
              |FDALG;factorizationTransformations;%2NniLL;126| (|List| 288)
              (862 . |eliminationEquations|)
              |FDALG;factorizationEquations;%2NniL;127| (|Polynomial| 7)
              (877 . |variables|) (|List| 179) (|Mapping| 179 288)
              (|ListFunctions2| 288 179) (882 . |map|) (888 . |concat|)
              (893 . |removeDuplicates|)
              |FDALG;factorizationGroebner;%2NniL;128| (898 . |elt|)
              (904 . |eliminationSolve|) (911 . |copy|)
              |FDALG;refineUR!;%Nni%;130| |FDALG;extendedALS;2%;132|
              |FDALG;normalALS;2%;133| |FDALG;leftMinimization;%2Nni%;134|
              |FDALG;rightMinimization;%2Nni%;135| |FDALG;minimize;2%;136|
              |FDALG;addMIN;3%;137| |FDALG;multiplyMIN;3%;138| (916 . |coerce|)
              |FDALG;*;I2%;139| |FDALG;*;F2%;140| |FDALG;*;%F%;141|
              |FDALG;*;3%;142| |FDALG;-;2%;149| |FDALG;-;%F%;143|
              |FDALG;+;%F%;144| |FDALG;-;F2%;145| |FDALG;+;F2%;146|
              |FDALG;-;3%;147| |FDALG;+;3%;148| |FDALG;/;%F%;150|
              (|PositiveInteger|) |FDALG;^;%Pi%;151| |FDALG;refine!;%B%;170|
              |FDALG;setRefined!;%Nni%;168| |FDALG;inverse;2%;156|
              |FDALG;refine!;2%;171| |FDALG;inv;2%;157| |FDALG;/;F2%;158|
              |FDALG;/;3%;159| |FDALG;^;%I%;160|
              |FDALG;refinementTransformations;%2NniLL;162|
              |FDALG;refinementEquations;%3Nni2BL;163|
              |FDALG;refinementGroebner;%3Nni2BL;164|
              |FDALG;refinementSolve;%3Nni2BL;165| (921 . |1|) (925 . ~=)
              |FDALG;rank;%Nni;172| |FDALG;zero?;%B;173| |FDALG;=;2%B;174|
              |FDALG;coerce;%Xdp;175| (|Record| (|:| |k| 29) (|:| |c| 7))
              (|List| 341) (931 . |listOfTerms|) |FDALG;coerce;Xdp%;176|
              (|String|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 43))
           '#(~= 936 |zero?| 942 |vector| 954 |variables| 964 |unitNormal| 969
              |unitCanonical| 974 |unit?| 979 |transformationMatrix| 984
              |transformRows!| 989 |transformColumns!| 995 |toggleDebugOutput|
              1001 |toggleAlternativeOutput| 1006 |swapRowsColumns!| 1011
              |swapRows!| 1018 |swapColumns!| 1025 |summands| 1032
              |subtractIfCan| 1037 |solutionVector| 1043 |setelt!| 1054
              |setRefined!| 1069 |scaleALS| 1075 |scalar?| 1081 |sample| 1093
              |rowSpan| 1097 |rightRecip| 1102 |rightPower| 1107
              |rightMinimization| 1119 |rightFamily| 1126 |rightFactor| 1131
              |representation| 1137 |removeRowsColumns| 1142 |regular?| 1149
              |refinementTransformations| 1154 |refinementSolve| 1162
              |refinementGroebner| 1172 |refinementEquations| 1182 |refined?|
              1192 |refineUR!| 1197 |refine!| 1208 |recip| 1219
              |ratexprInverse| 1224 |ratexpr| 1230 |rank| 1235 |qzero?| 1240
              |qswapRows!| 1269 |qswapColumns!| 1276 |qregular?| 1283 |qnew|
              1290 |qelt| 1301 |qaddRows!| 1308 |qaddColumns!| 1316
              |polynomial?| 1324 |polynomial| 1329 |plenaryPower| 1334 |pencil|
              1340 |opposite?| 1345 |one?| 1351 |normalizeRHS!| 1356
              |normalizePLS!| 1361 |normalizeDIAG!| 1366 |normalize!| 1371
              |normalALS| 1376 |new| 1381 |mutable?| 1398 |multiplyRow!| 1403
              |multiplyMIN| 1410 |multiplyColumn!| 1416 |multiplyALS| 1423
              |minimize| 1429 |minimal?| 1434 |matrix| 1439 |linearization|
              1450 |leftRecip| 1460 |leftPower| 1465 |leftMinimization| 1477
              |leftFamily| 1484 |leftFactor| 1489 |latex| 1495 |invertSTD| 1500
              |invertMIN| 1505 |invertALS| 1510 |inverse| 1515 |inv| 1520
              |interval| 1525 |insertRowsColumns| 1531 |factors| 1538
              |factorize| 1543 |factorizationTransformations| 1549
              |factorizationSolve| 1557 |factorizationGroebner| 1564
              |factorizationEquations| 1571 |factor| 1578 |extendedALS| 1583
              |exquo| 1588 |enableDebugOutput| 1594 |enableAlternativeOutput|
              1599 |elt| 1604 |display| 1617 |disableDebugOutput| 1629
              |disableAlternativeOutput| 1634 |dimension| 1639 |copy| 1644
              |commutator| 1655 |columnSpan| 1661 |coerce| 1666
              |characteristic| 1701 |blockStructure| 1705 |blockElimination|
              1710 |associator| 1730 |associates?| 1737 |appendSupport!| 1743
              |antiCommutator| 1749 |annihilate?| 1755 |admissibleLinearSystem|
              1761 |addRowsColumns!| 1766 |addRows!| 1774 |addMIN| 1782
              |addColumnsRows!| 1788 |addColumns!| 1796 |addALS| 1804 ^ 1810 =
              1828 |1| 1834 |0| 1838 / 1842 - 1860 + 1883 * 1901)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 1 0 0 0 1 0 0 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0))
            (CONS
             '#(|DivisionRing&| |Algebra&| |Algebra&| |EntireRing&| NIL
                |NonAssociativeAlgebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL
                NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |AbelianSemiGroup&| |SetWithZero&|
                |Magma&| |SetCategory&| NIL NIL |BasicType&| NIL NIL NIL)
             (CONS
              '#((|DivisionRing|) (|Algebra| 348) (|Algebra| 7) (|EntireRing|)
                 (|Ring|) (|NonAssociativeAlgebra| 348) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 7) (|Module| 348) (|SemiRng|)
                 (|Module| 7) (|BiModule| 348 348) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 7 7) (|RightModule| 348)
                 (|LeftModule| 348) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 7) (|RightModule| 7)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|SetCategory|)
                 (|CharacteristicZero|) (|CoercibleTo| 170) (|BasicType|)
                 (|unitsKnown|) (|noZeroDivisors|) (|TwoSidedRecip|))
              (|makeByteWordVec2| 348
                                  '(0 7 9 10 4 12 7 0 9 9 9 13 0 7 0 15 3 12 16
                                    0 9 9 17 5 12 7 0 9 9 9 7 18 6 12 19 0 9 9
                                    9 9 9 20 7 12 0 0 9 9 9 9 9 7 21 5 12 19 0
                                    9 9 9 19 22 3 12 23 0 9 9 24 5 12 23 0 9 9
                                    9 9 25 6 12 23 0 9 9 9 9 9 26 0 29 0 30 3
                                    12 0 9 9 9 31 2 33 0 29 0 34 1 29 9 0 36 1
                                    12 9 0 37 1 12 9 0 38 2 9 23 0 0 39 1 12 9
                                    0 40 2 33 0 9 29 42 2 44 6 0 43 45 1 29 0 6
                                    46 3 33 29 0 43 29 47 1 7 23 0 48 0 7 0 50
                                    1 29 44 0 53 1 29 55 0 56 2 33 43 29 0 57 1
                                    7 0 0 58 1 12 0 0 60 1 33 0 0 61 4 12 23 0
                                    9 9 9 73 4 12 16 0 9 9 9 74 2 16 7 0 43 75
                                    2 7 23 0 0 76 4 12 23 0 9 9 9 80 1 19 9 0
                                    82 4 12 23 0 9 9 9 84 0 89 0 90 2 33 29 0
                                    43 91 1 89 0 29 92 2 89 0 7 0 93 2 89 0 0 0
                                    94 1 89 23 0 98 1 89 9 0 99 1 89 44 0 100 2
                                    89 7 0 29 101 2 16 23 0 0 102 1 89 0 7 105
                                    2 12 0 0 9 110 2 33 0 0 0 111 3 12 0 0 9 9
                                    114 4 12 0 0 9 9 7 117 4 12 0 0 9 9 7 119 4
                                    12 0 0 9 9 7 122 3 12 0 0 9 7 124 3 12 0 0
                                    9 7 126 3 12 0 0 9 9 128 4 12 0 0 9 9 7 132
                                    0 9 0 135 2 9 0 0 0 136 1 27 0 0 137 2 27 0
                                    138 0 139 1 27 9 0 140 3 12 0 0 27 27 141 3
                                    12 0 0 27 27 143 2 27 9 0 43 144 6 12 23 0
                                    9 9 9 9 9 147 3 150 0 9 9 9 151 1 27 0 0
                                    152 1 150 9 0 154 7 12 156 0 27 27 27 27 27
                                    27 157 2 9 0 0 0 158 2 27 9 159 0 160 2 9 0
                                    0 0 161 2 156 19 0 43 162 5 19 0 0 43 43 43
                                    43 163 3 156 19 0 43 19 164 2 168 0 9 167
                                    169 1 171 170 0 172 1 9 170 0 173 2 170 0 0
                                    0 174 3 168 167 0 43 167 175 1 170 0 176
                                    177 1 106 170 0 181 2 170 0 0 0 182 2 170 0
                                    0 0 183 3 150 9 0 43 43 184 1 170 0 43 185
                                    2 167 0 9 170 186 1 89 170 0 187 3 167 170
                                    0 43 170 188 1 89 0 0 190 3 192 0 9 9 2 193
                                    4 192 2 0 43 43 2 194 1 12 19 0 204 4 19 0
                                    0 43 43 0 205 2 12 0 0 19 206 1 12 19 0 207
                                    2 12 0 0 19 208 2 7 0 0 0 209 1 106 0 0 214
                                    0 89 0 215 2 89 0 0 0 218 2 89 0 0 0 219 1
                                    106 0 0 220 2 106 0 0 0 221 2 106 0 0 0 222
                                    2 225 0 224 106 226 4 106 89 0 43 43 89 228
                                    2 33 0 0 0 231 1 33 0 0 232 1 33 0 0 233 1
                                    19 0 0 235 2 239 0 2 0 240 1 239 9 0 243 1
                                    89 33 0 245 1 170 0 0 246 1 89 7 0 247 2 7
                                    23 0 0 248 2 249 0 9 27 250 2 251 0 9 89
                                    252 3 251 89 0 43 89 253 2 251 89 0 43 254
                                    2 249 27 0 43 255 3 249 27 0 43 27 256 1 43
                                    170 0 257 1 7 170 0 258 3 167 170 0 43 170
                                    259 2 89 23 0 0 260 2 167 170 0 43 261 2
                                    170 0 0 0 262 2 170 0 0 0 263 2 170 0 0 0
                                    266 1 239 2 0 267 1 239 0 0 269 1 170 0 241
                                    271 6 12 156 0 27 27 27 27 275 276 2 239 2
                                    0 43 281 1 239 0 0 282 11 12 285 0 27 27 27
                                    27 27 27 27 27 27 27 286 1 288 179 0 289 2
                                    292 290 291 285 293 1 179 0 241 294 1 179 0
                                    0 295 2 285 288 0 43 297 3 12 277 285 16
                                    277 298 1 277 0 0 299 1 7 0 43 308 0 288 0
                                    335 2 288 23 0 0 336 1 89 342 0 343 2 0 23
                                    0 0 1 1 0 23 0 338 3 0 23 0 9 9 79 1 0 19 0
                                    104 1 0 106 0 107 1 0 33 0 87 1 0 347 0 1 1
                                    0 0 0 1 1 0 23 0 1 1 0 19 0 203 2 0 0 0 19
                                    201 2 0 0 0 19 199 1 0 0 0 67 1 0 0 0 70 3
                                    0 0 0 9 9 131 3 0 0 0 9 9 116 3 0 0 0 9 9
                                    130 1 0 241 0 244 2 0 346 0 0 1 1 0 106 0
                                    216 2 0 106 0 9 223 3 0 7 0 9 7 97 4 0 89 0
                                    9 9 89 103 2 0 0 0 9 324 2 0 0 0 7 230 3 0
                                    23 0 9 9 78 1 0 23 0 81 0 0 0 1 1 0 225 0
                                    229 1 0 346 0 1 2 0 0 0 321 1 2 0 0 0 9 1 3
                                    0 0 0 9 9 304 1 0 167 0 1 2 0 0 0 9 274 1 0
                                    197 0 198 3 0 0 0 27 27 142 1 0 23 0 83 4 0
                                    156 0 9 9 275 331 6 0 277 0 9 9 9 23 23 334
                                    6 0 285 0 9 9 9 23 23 333 6 0 285 0 9 9 9
                                    23 23 332 1 0 23 0 155 2 0 0 0 9 300 1 0 0
                                    0 280 2 0 0 0 23 323 1 0 0 0 326 1 0 346 0
                                    1 2 0 170 0 23 268 1 0 170 0 270 1 0 9 0
                                    337 5 0 23 0 9 9 9 9 146 6 0 23 0 9 9 9 9 9
                                    148 6 0 23 0 9 9 9 9 29 149 3 0 0 0 9 9 115
                                    3 0 0 0 9 9 129 3 0 23 0 9 9 77 1 0 0 9 32
                                    2 0 0 9 33 35 3 0 89 0 9 9 95 4 0 0 0 9 9 7
                                    118 4 0 0 0 9 9 7 134 1 0 23 0 85 1 0 89 0
                                    217 2 0 0 0 321 1 1 0 12 0 113 2 0 23 0 0 1
                                    1 0 23 0 1 1 0 0 0 210 1 0 0 0 211 1 0 0 0
                                    212 1 0 0 0 213 1 0 0 0 302 2 0 0 12 33 41
                                    1 0 0 7 52 2 0 0 29 7 59 1 0 23 0 72 3 0 0
                                    0 9 7 125 2 0 0 0 0 307 3 0 0 0 9 7 127 2 0
                                    0 0 0 236 1 0 0 0 305 1 0 23 0 71 1 0 106 0
                                    109 2 0 19 0 29 108 1 0 195 0 196 1 0 106 0
                                    191 1 0 346 0 1 2 0 0 0 321 1 2 0 0 0 9 1 3
                                    0 0 0 9 9 303 1 0 167 0 264 2 0 0 0 9 273 1
                                    0 345 0 1 1 0 0 0 238 1 0 0 0 265 1 0 0 0
                                    237 1 0 0 0 325 1 0 0 0 327 2 0 27 9 9 28 3
                                    0 0 0 27 27 145 1 0 241 0 242 2 0 241 0 9
                                    279 4 0 156 0 9 9 275 284 3 0 277 0 9 9 278
                                    3 0 285 0 9 9 296 3 0 285 0 9 9 287 1 0 241
                                    0 283 1 0 0 0 301 2 0 346 0 0 1 1 0 0 0 65
                                    1 0 0 0 68 2 0 7 0 9 88 3 0 89 0 9 9 96 2 0
                                    170 0 170 178 2 0 170 0 179 180 1 0 0 0 66
                                    1 0 0 0 69 1 0 9 0 86 1 0 0 0 51 2 0 0 0 7
                                    62 2 0 0 0 0 1 1 0 225 0 227 1 0 170 0 272
                                    1 0 0 43 1 1 0 0 7 64 1 0 0 29 63 1 0 0 89
                                    344 1 0 89 0 340 1 2 0 348 1 0 0 9 11 1 0
                                    150 0 153 5 0 156 0 27 27 27 27 166 7 0 156
                                    0 27 27 23 27 27 23 165 3 0 0 0 0 0 1 2 0
                                    23 0 0 1 2 0 0 0 33 112 2 0 0 0 0 1 2 0 23
                                    0 0 1 1 0 170 0 189 4 0 0 0 9 9 7 120 4 0 0
                                    0 9 9 7 123 2 0 0 0 0 306 4 0 0 0 9 9 7 121
                                    4 0 0 0 9 9 7 133 2 0 0 0 0 234 2 0 0 0 321
                                    322 2 0 0 0 9 1 2 0 0 0 43 330 2 0 23 0 0
                                    339 0 0 0 14 0 0 0 49 2 0 0 0 7 320 2 0 0 0
                                    0 329 2 0 0 7 0 328 2 0 0 0 0 318 1 0 0 0
                                    313 2 0 0 0 7 314 2 0 0 7 0 316 2 0 0 0 0
                                    319 2 0 0 0 7 315 2 0 0 7 0 317 2 0 0 321 0
                                    1 2 0 0 0 0 312 2 0 0 43 0 309 2 0 0 9 0 1
                                    2 0 0 0 7 311 2 0 0 7 0 310 2 0 0 19 0 202
                                    2 0 0 0 19 200 2 2 0 348 0 1 2 2 0 0 348
                                    1)))))
           '|lookupComplete|)) 
