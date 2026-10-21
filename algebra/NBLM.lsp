
(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1|
        ((|vp| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
         (|vn| (|Vector| (|Integer|))) (|sigma| (|NonNegativeInteger|))
         (|prime| (|Integer|)) (% (|List| (|Any|))))
        (SPADCALL |vp| |vn| |sigma| |prime|
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!0| %)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!1| %)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!2| %)
                  (QREFELT % 14))) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!2|
        ((|x| NIL) (|pt| NIL) (|p| NIL) (% NIL)) (|NBLM;vector_shift| |x| %)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) (% NIL)) (|NBLM;vector_shift| |x| %)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!0| ((|x| NIL) (% NIL))
        (|spadConstant| % 7)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2|
        ((|vp| (|Vector| (|U32Vector|))) (|vn| (|Vector| (|Integer|)))
         (|sigma| (|NonNegativeInteger|)) (|prime| (|Integer|))
         (% (|List| (|Any|))))
        (SPADCALL |vp| |vn| |sigma| |prime|
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!0| %)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!1| %)
                  (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!2| %)
                  (QREFELT % 17))) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!2|
        ((|x| NIL) (|pt| NIL) (|p| NIL) (% NIL)) (|NBLM;vector_shift| |x| %)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) (% NIL)) (|NBLM;vector_shift| |x| %)) 

(SDEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!0| ((|x| NIL) (% NIL))
        (|spadConstant| % 7)) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
        ((|vp| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
         (|vn| (|Vector| (|Integer|))) (|pts| (|U32Vector|))
         (|prime| (|Integer|)) (% (|List| (|Any|))))
        (SPROG NIL
               (COND
                ((> (QV_LEN_U32 |pts|) |prime|)
                 (|error|
                  "naiveBeckermannLabahnMultipoint: number of points > prime"))
                ('T
                 (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0|
                            (VECTOR % |pts| |prime|))
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1|
                            (VECTOR % |pts|))
                           (ELT % 23) (QREFELT % 14)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($$ NIL))
        (PROG (|pts| %)
          (LETT |pts| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| %))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0| ((|x| NIL) ($$ NIL))
        (PROG (|prime| |pts| %)
          (LETT |prime| (QREFELT $$ 2))
          (LETT |pts| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT % 20))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|
        ((|vp| (|Vector| (|U32Vector|))) (|vn| (|Vector| (|Integer|)))
         (|pts| (|U32Vector|)) (|prime| (|Integer|)) (% (|List| (|Any|))))
        (SPROG NIL
               (COND
                ((> (QV_LEN_U32 |pts|) |prime|)
                 (|error|
                  "naiveBeckermannLabahnMultipoint: number of points > prime"))
                ('T
                 (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0|
                            (VECTOR % |pts| |prime|))
                           (CONS
                            #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1|
                            (VECTOR % |pts|))
                           (ELT % 23) (QREFELT % 17)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1|
        ((|x| NIL) (|pt| NIL) (|p| NIL) ($$ NIL))
        (PROG (|pts| %)
          (LETT |pts| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| %))))) 

(SDEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0| ((|x| NIL) ($$ NIL))
        (PROG (|prime| |pts| %)
          (LETT |prime| (QREFELT $$ 2))
          (LETT |pts| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT % 20))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
        ((|vp| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
         (|vn| (|Vector| (|Integer|))) (|sigma| (|NonNegativeInteger|))
         (|prime| (|Integer|)) (|pts| (|Mapping| (|Integer|) (|Integer|)))
         (|up_residual|
          (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (|up_poly| (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (% (|List| (|Any|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G59 NIL) (#2=#:G60 NIL)
          (|vpa| (|Vector| (|U32Vector|))) (|k| NIL) (#3=#:G61 NIL)
          (|vk| (|U32Vector|)) (|l| (|NonNegativeInteger|))
          (|p| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (LETT |m| (QVSIZE |vp|)) (QVSIZE |vn|) (QREFELT % 27))
            (|error|
             "Number of polynomials and number of degrees do not agree"))
           ('T
            (SEQ
             (LETT |vpa|
                   (SPADCALL
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |k| 1) (LETT #2# |m|) G190
                          (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (GETREFV_U32 |sigma| 0) #1#))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT % 29)))
             (SEQ (LETT |k| 1) (LETT #3# |m|) G190
                  (COND ((|greater_SI| |k| #3#) (GO G191)))
                  (SEQ (LETT |p| (SPADCALL |vp| |k| (QREFELT % 31)))
                       (LETT |vk| (SPADCALL |vpa| |k| (QREFELT % 32)))
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL (NULL (SPADCALL |p| (QREFELT % 33))))
                               (GO G191)))
                             (SEQ (LETT |l| (SPADCALL |p| (QREFELT % 34)))
                                  (COND
                                   ((< |l| |sigma|)
                                    (SETELT_U32 |vk| |l|
                                                (SPADCALL |p|
                                                          (QREFELT % 35)))))
                                  (EXIT
                                   (LETT |p| (SPADCALL |p| (QREFELT % 36)))))
                             NIL (GO G190) G191 (EXIT NIL))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |vpa| |vn| |sigma| |prime| |pts| |up_residual|
                        |up_poly| (QREFELT % 17))))))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
        ((|vpa| (|Vector| (|U32Vector|))) (|vn| (|Vector| (|Integer|)))
         (|sigma| (|NonNegativeInteger|)) (|prime| (|Integer|))
         (|pts| (|Mapping| (|Integer|) (|Integer|)))
         (|up_residual|
          (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (|up_poly| (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (% (|List| (|Any|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G79 NIL) (|m1| (|Integer|))
          (|mp| (|Vector| (|U32Vector|))) (#2=#:G80 NIL) (|vk| (|U32Vector|))
          (|m2| (|Integer|)) (#3=#:G81 NIL) (|k| NIL) (#4=#:G82 NIL)
          (|vd| (|Vector| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (LETT |m| (QVSIZE |vpa|)) (QVSIZE |vn|) (QREFELT % 27))
            (|error|
             "Number of polynomials and number of degrees do not agree"))
           ('T
            (SEQ (LETT |m1| 0)
                 (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                      (COND ((|greater_SI| |k| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |m1|
                              (+ (+ |m1| (SPADCALL |vn| |k| (QREFELT % 37)))
                                 1))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |mp| (MAKEARR1 |m| (GETREFV_U32 0 0))) (LETT |m2| 0)
                 (SEQ (LETT |k| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |k| #2#) (GO G191)))
                      (SEQ
                       (SPADCALL |mp| |k| (GETREFV_U32 |m1| 0) (QREFELT % 38))
                       (LETT |vk| (SPADCALL |mp| |k| (QREFELT % 32)))
                       (SETELT_U32 |vk| |m2| 1)
                       (EXIT
                        (LETT |m2|
                              (+ (+ |m2| (SPADCALL |vn| |k| (QREFELT % 37)))
                                 1))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |vd|
                       (SPADCALL
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |k| 1) (LETT #4# |m|) G190
                              (COND ((|greater_SI| |k| #4#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS (SPADCALL |vn| |k| (QREFELT % 37))
                                            #3#))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        (QREFELT % 40)))
                 (SPADCALL |mp| |vpa| |vd| |sigma| |prime| |pts| |up_residual|
                           |up_poly| (QREFELT % 41))
                 (EXIT
                  (LIST (SPADCALL |mp| (QREFELT % 44))
                        (SPADCALL |vpa| (QREFELT % 44))
                        (SPADCALL |vd| (QREFELT % 46)))))))))) 

(SDEFUN |NBLM;vector_shift| ((|v| (|U32Vector|)) (% (|Void|)))
        (SPROG ((|n| (|SingleInteger|)) (|i| (|SingleInteger|)))
               (SEQ (LETT |n| (QV_LEN_U32 |v|)) (LETT |i| (|sub_SI| |n| 1))
                    (SEQ G190 (COND ((NULL (|less_SI| 0 |i|)) (GO G191)))
                         (SEQ
                          (SETELT_U32 |v| |i| (ELT_U32 |v| (|sub_SI| |i| 1)))
                          (EXIT (LETT |i| (|sub_SI| |i| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SETELT_U32 |v| 0 0))))) 

(SDEFUN |NBLM;mul_by_binomial_pointwise|
        ((|v| (|U32Vector|)) (|pt| (|Integer|)) (|pts| (|U32Vector|))
         (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|n| (|SingleInteger|)) (|i| NIL) (#1=#:G93 NIL) (|pp| (|Integer|)))
         (SEQ (LETT |n| (QV_LEN_U32 |v|))
              (EXIT
               (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| |n| 1)) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (LETT |pp| (|addmod_SI| (ELT_U32 |pts| |i|) |pt| |p|))
                         (EXIT
                          (SETELT_U32 |v| |i|
                                      (QSMULMOD32 (ELT_U32 |v| |i|) |pp|
                                                  |p|))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|
        ((|mp| (|Vector| (|U32Vector|))) (|vp| (|Vector| (|U32Vector|)))
         (|vd| (|Vector| (|Integer|))) (|sigma| (|NonNegativeInteger|))
         (|p| (|Integer|)) (|pts| (|Mapping| (|Integer|) (|Integer|)))
         (|up_residual|
          (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (|up_poly| (|Mapping| (|Void|) (|U32Vector|) (|Integer|) (|Integer|)))
         (% (|Void|)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|vc| (|Vector| (|Integer|)))
          (|m1| #1=(|Integer|)) (|s1| #1#) (|l| NIL) (#2=#:G113 NIL)
          (|pt| (|Integer|)) (#3=#:G114 NIL) (|pi| (|Integer|))
          (|maxd| (|Integer|)) (#4=#:G112 NIL) (|vcinv| (|Integer|)) (|k| NIL)
          (#5=#:G115 NIL) (|vckinv| (|Integer|)))
         (SEQ (LETT |m| (QVSIZE |vd|)) (LETT |vc| (MAKEARR1 |m| 0))
              (LETT |m1| (- (QV_LEN_U32 (SPADCALL |mp| 1 (QREFELT % 32))) 1))
              (LETT |s1| (- |sigma| 1))
              (EXIT
               (SEQ (LETT |l| 0) (LETT #2# |s1|) G190
                    (COND ((|greater_SI| |l| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |pt| (SPADCALL |l| |pts|)) (LETT |maxd| -1)
                           (LETT |pi| 0)
                           (SEQ (LETT |k| 1) (LETT #3# |m|) G190
                                (COND ((|greater_SI| |k| #3#) (GO G191)))
                                (SEQ
                                 (SPADCALL |vc| |k|
                                           (ELT_U32
                                            (SPADCALL |vp| |k| (QREFELT % 32))
                                            |l|)
                                           (QREFELT % 47))
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |vc| |k| (QREFELT % 37)) 0
                                     (QREFELT % 48))
                                    (COND
                                     ((< |maxd|
                                         (SPADCALL |vd| |k| (QREFELT % 37)))
                                      (SEQ (LETT |pi| |k|)
                                           (EXIT
                                            (LETT |maxd|
                                                  (SPADCALL |vd| |k|
                                                            (QREFELT %
                                                                     37)))))))))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             ((EQL |pi| 0)
                              (PROGN (LETT #4# |$NoValue|) (GO #6=#:G94)))
                             ('T
                              (SEQ
                               (LETT |vcinv|
                                     (QSMULMOD32 (- |p| 1)
                                                 (SPADCALL
                                                  (SPADCALL |vc| |pi|
                                                            (QREFELT % 37))
                                                  |p| (QREFELT % 49))
                                                 |p|))
                               (SEQ (LETT |k| 1) (LETT #5# |m|) G190
                                    (COND ((|greater_SI| |k| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |vc| |k| (QREFELT % 37)) 0
                                         (QREFELT % 48))
                                        (COND
                                         ((>=
                                           (SPADCALL |vd| |k| (QREFELT % 37))
                                           0)
                                          (COND
                                           ((SPADCALL |k| |pi| (QREFELT % 48))
                                            (SEQ
                                             (LETT |vckinv|
                                                   (QSMULMOD32 |vcinv|
                                                               (SPADCALL |vc|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          37))
                                                               |p|))
                                             (SPADCALL
                                              (SPADCALL |vp| |k|
                                                        (QREFELT % 32))
                                              (SPADCALL |vp| |pi|
                                                        (QREFELT % 32))
                                              |l| |s1| |vckinv| |p|
                                              (QREFELT % 50))
                                             (EXIT
                                              (SPADCALL (QAREF1O |mp| |k| 1)
                                                        (QAREF1O |mp| |pi| 1) 0
                                                        |m1| |vckinv| |p|
                                                        (QREFELT %
                                                                 50))))))))))))
                                    (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                    (EXIT NIL))
                               (SPADCALL |vd| |pi|
                                         (- (SPADCALL |vd| |pi| (QREFELT % 37))
                                            1)
                                         (QREFELT % 47))
                               (EXIT
                                (COND
                                 ((>= (SPADCALL |vd| |pi| (QREFELT % 37)) 0)
                                  (SEQ
                                   (SPADCALL
                                    (SPADCALL |vp| |pi| (QREFELT % 32)) |pt|
                                    |p| |up_residual|)
                                   (EXIT
                                    (SPADCALL (QAREF1O |mp| |pi| 1) |pt| |p|
                                              |up_poly|))))))))))))
                     #6# (EXIT #4#))
                    (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;critical_index|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|i| (|Integer|))
         (|d| (|Integer|)) (|vn| (|Vector| (|Integer|))) (% (|Integer|)))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|j| NIL) (#1=#:G125 NIL)
          (|nj| (|Integer|)) (#2=#:G123 NIL) (|pa| (|U32Vector|))
          (#3=#:G124 NIL) (#4=#:G122 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (QVSIZE |vn|))
                (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |nj| (- (SPADCALL |vn| |j| (QREFELT % 37)) |d|))
                        (EXIT
                         (COND
                          ((< |nj| 0)
                           (PROGN (LETT #2# |$NoValue|) (GO #5=#:G116)))
                          ('T
                           (SEQ
                            (EXIT
                             (SEQ (LETT |pa| (QAREF2O |m| |i| |j| 1 1))
                                  (EXIT
                                   (COND
                                    ((SPADCALL (ELT_U32 |pa| |nj|) 0
                                               (QREFELT % 48))
                                     (PROGN
                                      (LETT #4#
                                            (PROGN
                                             (LETT #3# |j|)
                                             (GO #6=#:G121)))
                                      (GO #7=#:G117)))))))
                            #7# (EXIT #4#)))))))
                      #5# (EXIT #2#))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "Incorrect defect"))))
          #6# (EXIT #3#)))) 

(SDEFUN |NBLM;swap_rows|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|i| (|Integer|))
         (|j| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|kmax| (|NonNegativeInteger|)) (|k| NIL) (#1=#:G131 NIL)
          (|t1| #2=(|U32Vector|)) (|t2| #2#))
         (SEQ
          (COND ((EQL |i| |j|) "nothing")
                ('T
                 (SEQ (LETT |kmax| (ANCOLS |m|))
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #1# |kmax|) G190
                            (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ (LETT |t1| (QAREF2O |m| |i| |k| 1 1))
                                 (LETT |t2| (QAREF2O |m| |j| |k| 1 1))
                                 (QSETAREF2O |m| |i| |k| |t2| 1 1)
                                 (EXIT (QSETAREF2O |m| |j| |k| |t1| 1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))))))) 

(SDEFUN |NBLM;mult_vector|
        ((|v| (|U32Vector|)) (|c| (|Integer|)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G136 NIL))
               (SEQ (LETT |n| (QV_LEN_U32 |v|))
                    (EXIT
                     (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v| |i|
                                        (QSMULMOD32 |c| (ELT_U32 |v| |i|)
                                                    |p|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;mult_row|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|i| (|Integer|))
         (|c| (|Integer|)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG ((|jmax| (|NonNegativeInteger|)) (|j| NIL) (#1=#:G141 NIL))
               (SEQ (LETT |jmax| (ANCOLS |m|))
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |jmax|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (|NBLM;mult_vector| (QAREF2O |m| |i| |j| 1 1) |c|
                             |p| %)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;add_vector|
        ((|v1| (|U32Vector|)) (|v2| (|U32Vector|)) (|c| (|Integer|))
         (|k| (|Integer|)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G146 NIL))
               (SEQ (LETT |n| (QV_LEN_U32 |v1|))
                    (EXIT
                     (SEQ (LETT |i| |k|) (LETT #1# (- |n| 1)) G190
                          (COND ((> |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v1| |i|
                                        (QSMULADDMOD64_32 |c|
                                                          (ELT_U32 |v2|
                                                                   (- |i| |k|))
                                                          (ELT_U32 |v1| |i|)
                                                          |p|))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;add_row|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|j1| (|Integer|))
         (|j2| (|Integer|)) (|c| (|Integer|)) (|k| (|Integer|))
         (|p| (|Integer|)) (% (|Void|)))
        (SPROG ((|imax| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G151 NIL))
               (SEQ (LETT |imax| (ANCOLS |m|))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #1# |imax|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (|NBLM;add_vector| (QAREF2O |m| |j1| |i| 1 1)
                             (QAREF2O |m| |j2| |i| 1 1) |c| |k| |p| %)))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |NBLM;reduce_row_by_row1|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|j| (|Integer|))
         (|i| (|Integer|)) (|ci| (|Integer|)) (|cdeg| (|Integer|))
         (|vdiff| (|Integer|)) (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|rj0| (|U32Vector|)) (|k| (|Integer|)) (|c| (|Integer|))
          (#1=#:G155 NIL))
         (SEQ (LETT |rj0| (QAREF2O |m| |j| |ci| 1 1))
              (EXIT
               (COND
                ((< |vdiff| 0)
                 (|error| "Internal error : vdiff < 0 in reduce_row_by_row1"))
                ('T
                 (SEQ
                  (EXIT
                   (SEQ (LETT |k| (+ |vdiff| |cdeg|))
                        (LETT |c| (ELT_U32 |rj0| |k|))
                        (EXIT
                         (COND
                          ((SPADCALL |c| 0 (QREFELT % 48))
                           (PROGN
                            (LETT #1#
                                  (|NBLM;add_row| |m| |j| |i| (- |p| |c|)
                                   |vdiff| |p| %))
                            (GO #2=#:G152)))))))
                  #2# (EXIT #1#)))))))) 

(SDEFUN |NBLM;top_reduce_by_row|
        ((|m| (|TwoDimensionalArray| (|U32Vector|))) (|i| (|Integer|))
         (|ci| (|Integer|)) (|vn| (|Vector| (|Integer|)))
         (|vd| (|Vector| (|Integer|))) (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|mdeg| (|Integer|))
          (|cdeg| (|Integer|)) (|mcoeff| (|Integer|)) (|minv| (|Integer|))
          (|j| NIL) (#1=#:G160 NIL))
         (SEQ (LETT |nr| (QVSIZE |vd|))
              (LETT |mdeg| (SPADCALL |vn| |ci| (QREFELT % 37)))
              (LETT |cdeg| (- |mdeg| (SPADCALL |vd| |i| (QREFELT % 37))))
              (LETT |mcoeff| (ELT_U32 (QAREF2O |m| |i| |ci| 1 1) |cdeg|))
              (LETT |minv| (SPADCALL |mcoeff| |p| (QREFELT % 49)))
              (|NBLM;mult_row| |m| |i| |minv| |p| %)
              (EXIT
               (SEQ (LETT |j| (+ |i| 1)) (LETT #1# |nr|) G190
                    (COND ((> |j| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (|NBLM;reduce_row_by_row1| |m| |j| |i| |ci| |cdeg|
                       (- (SPADCALL |vd| |i| (QREFELT % 37))
                          (SPADCALL |vd| |j| (QREFELT % 37)))
                       |p| %)))
                    (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;final_reduce|
        ((|m| (|TwoDimensionalArray| (|U32Vector|)))
         (|civ| (|Vector| (|Integer|))) (|vn| (|Vector| (|Integer|)))
         (|vd| (|Vector| (|Integer|))) (|p| (|Integer|)) (% (|Void|)))
        (SPROG
         ((|ns| (|NonNegativeInteger|)) (|mvd| #1=(|Integer|)) (|j| NIL)
          (#2=#:G174 NIL) (|vdj| #1#) (|d| NIL) (#3=#:G175 NIL) (|i| NIL)
          (#4=#:G176 NIL) (#5=#:G172 NIL) (|vdi| #1#) (#6=#:G173 NIL)
          (|ci| #1#))
         (SEQ (LETT |ns| (QVSIZE |vd|))
              (LETT |mvd| (SPADCALL |vd| 1 (QREFELT % 37)))
              (EXIT
               (SEQ (LETT |j| 1) (LETT #2# |ns|) G190
                    (COND ((|greater_SI| |j| #2#) (GO G191)))
                    (SEQ (LETT |vdj| (SPADCALL |vd| |j| (QREFELT % 37)))
                         (EXIT
                          (SEQ (LETT |d| 0) (LETT #3# (- |mvd| |vdj|)) G190
                               (COND ((|greater_SI| |d| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |i| 1) (LETT #4# |ns|) G190
                                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((EQL |i| |j|)
                                          (PROGN
                                           (LETT #5# |$NoValue|)
                                           (GO #7=#:G163)))
                                         ('T
                                          (SEQ
                                           (LETT |vdi|
                                                 (SPADCALL |vd| |i|
                                                           (QREFELT % 37)))
                                           (EXIT
                                            (COND
                                             ((< |vdi| (+ |vdj| |d|))
                                              (PROGN
                                               (LETT #6# 1)
                                               (GO #8=#:G166)))
                                             ('T
                                              (SEQ
                                               (LETT |ci|
                                                     (SPADCALL |civ| |i|
                                                               (QREFELT % 37)))
                                               (EXIT
                                                (|NBLM;reduce_row_by_row1| |m|
                                                 |j| |i| |ci|
                                                 (-
                                                  (SPADCALL |vn| |ci|
                                                            (QREFELT % 37))
                                                  |vdi|)
                                                 |d| |p| %))))))))))
                                       #7# (EXIT #5#))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL)))
                                #8# (EXIT #6#))
                               (LETT |d| (|inc_SI| |d|)) (GO G190) G191
                               (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NBLM;reduceBasis0;Tda2VIR;19|
        ((|m| (|TwoDimensionalArray| (|U32Vector|)))
         (|vn| (|Vector| (|Integer|))) (|vd| (|Vector| (|Integer|)))
         (|p| (|Integer|))
         (%
          (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                    (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|))))))
        (SPROG
         ((|ns| (|NonNegativeInteger|)) (|civ| (|Vector| (|Integer|)))
          (|i| NIL) (#1=#:G190 NIL) (|j| NIL) (#2=#:G191 NIL)
          (|cd| #3=(|Integer|)) (|maxd| (|Integer|)) (|nci| #4=(|Integer|))
          (|ci| #4#) (|maxj| (|Integer|)) (|tmp| #3#))
         (SEQ (LETT |ns| (QVSIZE |vd|)) (LETT |civ| (MAKEARR1 |ns| 0))
              (SEQ (LETT |i| 1) (LETT #1# |ns|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |maxd| -1)
                        (SEQ (LETT |j| |i|) (LETT #2# |ns|) G190
                             (COND ((> |j| #2#) (GO G191)))
                             (SEQ
                              (LETT |cd| (SPADCALL |vd| |j| (QREFELT % 37)))
                              (EXIT
                               (COND
                                ((> |cd| |maxd|)
                                 (SEQ (LETT |maxd| |cd|)
                                      (LETT |ci|
                                            (|NBLM;critical_index| |m| |j|
                                             |maxd| |vn| %))
                                      (EXIT (LETT |maxj| |j|))))
                                ((EQL |cd| |maxd|)
                                 (SEQ
                                  (LETT |nci|
                                        (|NBLM;critical_index| |m| |j| |maxd|
                                         |vn| %))
                                  (EXIT
                                   (COND
                                    ((< |nci| |ci|)
                                     (SEQ (LETT |ci| |nci|)
                                          (EXIT (LETT |maxj| |j|)))))))))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                        (|NBLM;swap_rows| |m| |i| |maxj| %)
                        (LETT |tmp| (SPADCALL |vd| |i| (QREFELT % 37)))
                        (SPADCALL |vd| |i|
                                  (SPADCALL |vd| |maxj| (QREFELT % 37))
                                  (QREFELT % 47))
                        (SPADCALL |vd| |maxj| |tmp| (QREFELT % 47))
                        (SPADCALL |civ| |i| |ci| (QREFELT % 47))
                        (EXIT
                         (|NBLM;top_reduce_by_row| |m| |i| |ci| |vn| |vd| |p|
                          %)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (|NBLM;final_reduce| |m| |civ| |vn| |vd| |p| %)
              (EXIT (VECTOR |m| |vd| |civ|))))) 

(SDEFUN |NBLM;reduceBasis;V2VIR;20|
        ((|m| (|Vector| (|U32Vector|))) (|vn| (|Vector| (|Integer|)))
         (|vd| (|Vector| (|Integer|))) (|p| (|Integer|))
         (%
          (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                    (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|))))))
        (SPROG
         ((|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (#2=#:G207 NIL)
          (|ns| (|NonNegativeInteger|))
          (|res| (|TwoDimensionalArray| (|U32Vector|)))
          (|nvd| (|Vector| (|Integer|))) (|i| NIL) (#3=#:G208 NIL)
          (|mi| (|U32Vector|)) (|k| NIL) (#4=#:G209 NIL)
          (|vnk1| (|SingleInteger|)) (|resjk| (|U32Vector|)) (|i1| NIL)
          (#5=#:G210 NIL) (|m2| (|SingleInteger|))
          (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (QVSIZE |vd|)) (LETT |nc| (QVSIZE |vn|)) (LETT |ns| 0)
              (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((>= (SPADCALL |vd| |i| (QREFELT % 37)) 0)
                       (LETT |ns| (+ |ns| 1))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (MAKE_MATRIX1 |ns| |nc| (GETREFV_U32 0 0)))
              (LETT |nvd| (MAKEARR1 |ns| 0)) (LETT |j| 1)
              (SEQ (LETT |i| 1) (LETT #3# |nr|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |mi| (SPADCALL |m| |i| (QREFELT % 32)))
                        (LETT |m2| 0)
                        (EXIT
                         (COND
                          ((>= (SPADCALL |vd| |i| (QREFELT % 37)) 0)
                           (SEQ
                            (SPADCALL |nvd| |j|
                                      (SPADCALL |vd| |i| (QREFELT % 37))
                                      (QREFELT % 47))
                            (SEQ (LETT |k| 1) (LETT #4# |nc|) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ
                                  (LETT |vnk1|
                                        (+ (SPADCALL |vn| |k| (QREFELT % 37))
                                           1))
                                  (LETT |resjk| (GETREFV_U32 |vnk1| 0))
                                  (SEQ (LETT |i1| 0)
                                       (LETT #5# (|sub_SI| |vnk1| 1)) G190
                                       (COND
                                        ((|greater_SI| |i1| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SETELT_U32 |resjk| |i1|
                                                     (ELT_U32 |mi|
                                                              (+ |m2| |i1|)))))
                                       (LETT |i1| (|inc_SI| |i1|)) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |m2| (|add_SI| |m2| |vnk1|))
                                  (EXIT
                                   (QSETAREF2O |res| |j| |k| |resjk| 1 1)))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |j| (+ |j| 1))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| |vn| |nvd| |p| (QREFELT % 53)))))) 

(DECLAIM (NOTINLINE |NaiveBeckermannLabahnModular;|)) 

(DEFUN |NaiveBeckermannLabahnModular;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NaiveBeckermannLabahnModular|))
          (LETT % (GETREFV 55))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NaiveBeckermannLabahnModular| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |NaiveBeckermannLabahnModular| ()
  (SPROG NIL
         (PROG (#1=#:G212)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|NaiveBeckermannLabahnModular|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|NaiveBeckermannLabahnModular|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|NaiveBeckermannLabahnModular;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|NaiveBeckermannLabahnModular|)))))))))) 

(MAKEPROP '|NaiveBeckermannLabahnModular| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (0 . |0|)
              (|List| 42) (|Vector| 30) (|Vector| 11) (|Integer|)
              (|Mapping| 11 11) (|Mapping| 21 19 11 11)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
              |NBLM;naiveBeckermannLabahn;VVNniIL;1| (|Vector| 19)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
              |NBLM;naiveBeckermannLabahn;VVNniIL;2| (|U32Vector|) (4 . |elt|)
              (|Void|) (|U32VectorPolynomialOperations|)
              (10 . |mul_by_binomial|)
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4| (|Boolean|)
              (17 . ~=) (|List| 19) (23 . |vector|)
              (|SparseUnivariatePolynomial| 11) (28 . |elt|) (34 . |elt|)
              (40 . |zero?|) (45 . |degree|) (50 . |leadingCoefficient|)
              (55 . |reductum|) (60 . |elt|) (66 . |setelt!|) (|List| 11)
              (73 . |vector|) |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|
              (|Any|) (|AnyFunctions1| 16) (78 . |coerce|) (|AnyFunctions1| 10)
              (83 . |coerce|) (88 . |setelt!|) (95 . ~=) (101 . |invmod|)
              (107 . |vector_add_mul|)
              (|Record| (|:| |basis| 52) (|:| |defects| 10) (|:| |cinds| 10))
              (|TwoDimensionalArray| 19) |NBLM;reduceBasis0;Tda2VIR;19|
              |NBLM;reduceBasis;V2VIR;20|)
           '#(|reduceBasis0| 117 |reduceBasis| 125
              |naiveBeckermannLabahnMultipoint| 133 |naiveBeckermannLabahn1|
              149 |naiveBeckermannLabahn0| 171 |naiveBeckermannLabahn| 183)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|naiveBeckermannLabahn|
                                 ((|List| (|Any|)) (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|)))
                                T)
                              '((|naiveBeckermannLabahn|
                                 ((|List| (|Any|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|)))
                                T)
                              '((|naiveBeckermannLabahnMultipoint|
                                 ((|List| (|Any|)) (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|naiveBeckermannLabahnMultipoint|
                                 ((|List| (|Any|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Vector| (|Integer|)) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|naiveBeckermannLabahn1|
                                 ((|List| (|Any|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|)
                                  (|Mapping| (|Integer|) (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))))
                                T)
                              '((|naiveBeckermannLabahn1|
                                 ((|List| (|Any|)) (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|)
                                  (|Mapping| (|Integer|) (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))))
                                T)
                              '((|naiveBeckermannLabahn0|
                                 ((|Void|) (|Vector| (|U32Vector|))
                                  (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|)
                                  (|Mapping| (|Integer|) (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Void|) (|U32Vector|) (|Integer|)
                                             (|Integer|))))
                                T)
                              '((|reduceBasis0|
                                 ((|Record|
                                   (|:| |basis|
                                        (|TwoDimensionalArray| (|U32Vector|)))
                                   (|:| |defects| (|Vector| (|Integer|)))
                                   (|:| |cinds| (|Vector| (|Integer|))))
                                  (|TwoDimensionalArray| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|Vector| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|reduceBasis|
                                 ((|Record|
                                   (|:| |basis|
                                        (|TwoDimensionalArray| (|U32Vector|)))
                                   (|:| |defects| (|Vector| (|Integer|)))
                                   (|:| |cinds| (|Vector| (|Integer|))))
                                  (|Vector| (|U32Vector|))
                                  (|Vector| (|Integer|)) (|Vector| (|Integer|))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 54
                                            '(0 6 0 7 2 19 11 0 11 20 3 22 21
                                              19 11 11 23 2 6 26 0 0 27 1 16 0
                                              28 29 2 9 30 0 11 31 2 16 19 0 11
                                              32 1 30 26 0 33 1 30 6 0 34 1 30
                                              11 0 35 1 30 0 0 36 2 10 11 0 11
                                              37 3 16 19 0 11 19 38 1 10 0 39
                                              40 1 43 42 16 44 1 45 42 10 46 3
                                              10 11 0 11 11 47 2 11 26 0 0 48 2
                                              11 0 0 0 49 6 22 21 19 19 11 11
                                              11 11 50 4 0 51 52 10 10 11 53 4
                                              0 51 16 10 10 11 54 4 0 8 16 10
                                              19 11 25 4 0 8 9 10 19 11 24 7 0
                                              8 9 10 6 11 12 13 13 14 7 0 8 16
                                              10 6 11 12 13 13 17 8 0 21 16 16
                                              10 6 11 12 13 13 41 4 0 8 16 10 6
                                              11 18 4 0 8 9 10 6 11 15)))))
           '|lookupComplete|)) 
