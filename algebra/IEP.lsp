
(SDEFUN |IEP;eigenvalues;ML;1|
        ((|m| (|Matrix| F))
         (% (|List| (|Union| F (|SparseUnivariatePolynomial| F)))))
        (SPADCALL |m| (ELT % 9) (QREFELT % 14))) 

(SDEFUN |IEP;eigenvectors;ML;2|
        ((|m| (|Matrix| F))
         (%
          (|List|
           (|Record|
            (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
            (|:| |eigmult| (|NonNegativeInteger|))
            (|:| |eigvec|
                 (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))))
        (SPADCALL |m| (ELT % 9) (QREFELT % 18))) 

(SDEFUN |IEP;generalizedEigenvectors;ML;3|
        ((|m| (|Matrix| F))
         (%
          (|List|
           (|Record|
            (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
            (|:| |geneigvec|
                 (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))))
        (SPADCALL |m| (ELT % 9) (QREFELT % 22))) 

(SDEFUN |IEP;reduction|
        ((|u| (|SparseUnivariatePolynomial| F))
         (|p| (|SparseUnivariatePolynomial| F))
         (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL |u| |p| (QREFELT % 25))) 

(SDEFUN |IEP;merge|
        ((|p| (|SparseUnivariatePolynomial| F))
         (|q| (|SparseUnivariatePolynomial| F))
         (% (|Union| (|SparseUnivariatePolynomial| F) "failed")))
        (COND ((SPADCALL |p| |q| (QREFELT % 27)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| % 29) (QREFELT % 27))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| % 29) (QREFELT % 27))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |IEP;exactquo|
        ((|u| (|SparseUnivariatePolynomial| F))
         (|v| (|SparseUnivariatePolynomial| F))
         (|p| (|SparseUnivariatePolynomial| F))
         (% (|Union| (|SparseUnivariatePolynomial| F) "failed")))
        (SPROG
         ((|val|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed")))
         (SEQ (LETT |val| (SPADCALL |v| |p| |u| (QREFELT % 32)))
              (EXIT
               (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (QCAR (QCDR |val|))))))))) 

(SDEFUN |IEP;genEigForm|
        ((|eigen|
          (|Record|
           (|:| |eigval| #1=(|Union| F (|SparseUnivariatePolynomial| F)))
           (|:| |eigmult| #2=(|NonNegativeInteger|))
           (|:| |eigvec|
                (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))
         (A (|Matrix| F))
         (%
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |geneigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F)))))))
        (SPROG ((|alpha| #1#) (|k| #2#) (|g| (|NonNegativeInteger|)))
               (SEQ (LETT |alpha| (QVELT |eigen| 0))
                    (LETT |k| (QVELT |eigen| 1))
                    (LETT |g| (LENGTH (QVELT |eigen| 2)))
                    (EXIT
                     (COND ((EQL |k| |g|) (CONS |alpha| (QVELT |eigen| 2)))
                           ('T
                            (CONS |alpha|
                                  (SPADCALL |alpha| A |k| |g|
                                            (QREFELT % 35))))))))) 

(SDEFUN |IEP;characteristicPolynomial;MSup;8|
        ((A (|Matrix| F)) (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL A (QREFELT % 37))) 

(SDEFUN |IEP;characteristicPolynomial;MSup;9|
        ((A (|Matrix| F)) (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL A (QREFELT % 40))) 

(SDEFUN |IEP;eigenvalues;MML;10|
        ((A (|Matrix| F))
         (|fac|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
                     (|SparseUnivariatePolynomial| F)))
         (% (|List| (|Union| F (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|pol| (|SparseUnivariatePolynomial| F))
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F))) (|fr| NIL)
          (#1=#:G69 NIL) (|f1| (|SparseUnivariatePolynomial| F)) (|rv| (F))
          (|lrat| (|List| F))
          (|lsym| (|List| (|SparseUnivariatePolynomial| F))) (#2=#:G70 NIL)
          (|lr| NIL) (#3=#:G71 NIL) (#4=#:G72 NIL) (|ls| NIL) (#5=#:G73 NIL))
         (SEQ (LETT |pol| (SPADCALL A (QREFELT % 38))) (LETT |lrat| NIL)
              (LETT |lsym| NIL) (LETT |fp| (SPADCALL |pol| |fac|))
              (SEQ (LETT |fr| NIL) (LETT #1# (SPADCALL |fp| (QREFELT % 45)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |fr| 1))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |f1| (QREFELT % 46)) 1)
                           (SEQ
                            (LETT |rv|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |f1| 0 (QREFELT % 48))
                                             (SPADCALL |f1| (QREFELT % 49))
                                             (QREFELT % 50))
                                   (QREFELT % 51)))
                            (EXIT (LETT |lrat| (CONS |rv| |lrat|)))))
                          ('T (LETT |lsym| (CONS |f1| |lsym|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |lr| NIL) (LETT #3# |lrat|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |lr| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (CONS 0 |lr|) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |ls| NIL) (LETT #5# |lsym|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |ls| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS (CONS 1 |ls|) #4#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT % 52)))))) 

(SDEFUN |IEP;eigenvector;UML;11|
        ((|alpha| (|Union| F (|SparseUnivariatePolynomial| F)))
         (A (|Matrix| F))
         (% (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
        (COND ((QEQCAR |alpha| 0) (|IEP;intRatEig| (QCDR |alpha|) A 1 %))
              ('T (|IEP;intAlgEig| (QCDR |alpha|) A 1 %)))) 

(SDEFUN |IEP;intRatEig|
        ((|alpha| (F)) (A (|Matrix| F)) (|m| (|NonNegativeInteger|))
         (% (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (B (|Matrix| F)) (#1=#:G90 NIL)
          (|j| NIL) (#2=#:G91 NIL) (|v| NIL) (#3=#:G92 NIL)
          (|w| (|Vector| (|SparseUnivariatePolynomial| F))) (|i| NIL)
          (#4=#:G93 NIL)
          (|sol| (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |n| (ANROWS A)) (LETT B (SPADCALL |n| |n| (QREFELT % 54)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                         (COND ((|greater_SI| |j| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL A |i| |j| (QREFELT % 56))
                                     (QREFELT % 57))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT % 56))
                                         |alpha| (QREFELT % 58))
                               (QREFELT % 57))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |sol| NIL)
              (SEQ (LETT |v| NIL)
                   (LETT #3#
                         (SPADCALL (SPADCALL B |m| (QREFELT % 59))
                                   (QREFELT % 61)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| % 29)))
                        (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                             (COND ((|greater_SI| |i| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |w| |i|
                                         (SPADCALL
                                          (SPADCALL |v| |i| (QREFELT % 63))
                                          (QREFELT % 64))
                                         (QREFELT % 66))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |sol| (CONS |w| |sol|))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |sol|)))) 

(SDEFUN |IEP;intAlgEig|
        ((|alpha| (|SparseUnivariatePolynomial| F)) (A (|Matrix| F))
         (|m| (|NonNegativeInteger|))
         (% (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (MM
           (|Join| (|Field|)
                   (CATEGORY |domain|
                    (SIGNATURE |modulus|
                     (#1=(|SparseUnivariatePolynomial| F) %))
                    (SIGNATURE |coerce|
                     (#2=(|SparseUnivariatePolynomial| F) %))
                    (SIGNATURE |reduce| (% #2# #1#))
                    (SIGNATURE |exQuo| ((|Union| % "failed") % %)))))
          (AM
           (|Join| (|MatrixCategory| MM (|Vector| MM) (|Vector| MM))
                   (CATEGORY |domain|
                    (SIGNATURE |diagonalMatrix| (% (|Vector| MM)))
                    (IF (|has| MM (|ConvertibleTo| (|InputForm|)))
                        (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                        |noBranch|)
                    (IF (|has| MM (|IntegralDomain|))
                        (SIGNATURE |invertIfCan| ((|Union| % "failed") %))
                        |noBranch|))))
          (|pol| (|SparseUnivariatePolynomial| F)) (|alg| (MM)) (B (AM))
          (#3=#:G120 NIL) (|j| NIL) (#4=#:G121 NIL) (|vec| NIL) (#5=#:G122 NIL)
          (|w| (|Vector| (|SparseUnivariatePolynomial| F))) (|i| NIL)
          (#6=#:G123 NIL)
          (|sol| (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |n| (ANROWS A))
              (LETT MM
                    (|ModularField|
                     (|SparseUnivariatePolynomial| (QREFELT % 6))
                     (|SparseUnivariatePolynomial| (QREFELT % 6))
                     (CONS (|function| |IEP;reduction|) %)
                     (CONS (|function| |IEP;merge|) %)
                     (CONS (|function| |IEP;exactquo|) %)))
              (LETT AM (|Matrix| MM))
              (LETT |pol| (SPADCALL |alpha| (QREFELT % 67)))
              (LETT |alg|
                    (SPADCALL (SPADCALL (|spadConstant| % 47) 1 (QREFELT % 69))
                              |pol|
                              (|compiledLookupCheck| '|reduce|
                                                     (LIST '%
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT % 6)))
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT % 6))))
                                                     MM)))
              (LETT B
                    (SPADCALL |n| |n|
                              (|compiledLookupCheck| '|zero|
                                                     (LIST '%
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     AM)))
              (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                         (COND ((|greater_SI| |j| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL A |i| |j| (QREFELT % 56))
                                       (QREFELT % 64))
                                      |pol|
                                      (|compiledLookupCheck| '|reduce|
                                                             (LIST '%
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6)))
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6))))
                                                             MM))
                                     (|compiledLookupCheck| '|setelt!|
                                                            (LIST
                                                             (|devaluate| MM)
                                                             '%
                                                             (LIST '|Integer|)
                                                             (LIST '|Integer|)
                                                             (|devaluate| MM))
                                                            AM))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL
                                (SPADCALL B |i| |i|
                                          (|compiledLookupCheck| '|elt|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   MM)
                                                                  '%
                                                                  (LIST
                                                                   '|Integer|)
                                                                  (LIST
                                                                   '|Integer|))
                                                                 AM))
                                |alg|
                                (|compiledLookupCheck| '- (LIST '% '% '%) MM))
                               (|compiledLookupCheck| '|setelt!|
                                                      (LIST (|devaluate| MM) '%
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|)
                                                            (|devaluate| MM))
                                                      AM))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |sol| NIL)
              (SEQ (LETT |vec| NIL)
                   (LETT #5#
                         (SPADCALL
                          (SPADCALL B |m|
                                    (|compiledLookupCheck| '^
                                                           (LIST '% '%
                                                                 (LIST
                                                                  '|NonNegativeInteger|))
                                                           AM))
                          (|compiledLookupCheck| '|nullSpace|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               MM)))
                                                  '%)
                                                 AM)))
                   G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |vec| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| % 29)))
                        (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                             (COND ((|greater_SI| |i| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |w| |i|
                                         (SPADCALL
                                          (SPADCALL |vec| |i|
                                                    (|compiledLookupCheck|
                                                     '|elt|
                                                     (LIST (|devaluate| MM) '%
                                                           (LIST '|Integer|))
                                                     (|Vector| MM)))
                                          (|compiledLookupCheck| '|coerce|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT % 6)))
                                                                  '%)
                                                                 MM))
                                         (QREFELT % 66))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |sol| (CONS |w| |sol|))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |sol|)))) 

(SDEFUN |IEP;generalizedEigenvector;UM2NniL;14|
        ((|alpha| (|Union| F (|SparseUnivariatePolynomial| F)))
         (A (|Matrix| F)) (|k| (|NonNegativeInteger|))
         (|g| (|NonNegativeInteger|))
         (% (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
        (SPROG ((#1=#:G127 NIL) (#2=#:G128 NIL))
               (COND
                ((QEQCAR |alpha| 0)
                 (|IEP;intRatEig| (QCDR |alpha|) A
                  (PROG1 (LETT #1# (- (+ 1 |k|) |g|))
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#))
                  %))
                ('T
                 (|IEP;intAlgEig| (QCDR |alpha|) A
                  (PROG1 (LETT #2# (- (+ 1 |k|) |g|))
                    (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #2#))
                  %))))) 

(SDEFUN |IEP;generalizedEigenvector;RML;15|
        ((|ei|
          (|Record| (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                    (|:| |eigmult| (|NonNegativeInteger|))
                    (|:| |eigvec|
                         (|List|
                          (|Vector| (|SparseUnivariatePolynomial| F))))))
         (A (|Matrix| F))
         (% (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))
        (SPADCALL (QVELT |ei| 0) A (QVELT |ei| 1) (LENGTH (QVELT |ei| 2))
                  (QREFELT % 35))) 

(SDEFUN |IEP;generalizedEigenvectors;MML;16|
        ((A (|Matrix| F))
         (|fac|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|List|
           (|Record|
            (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
            (|:| |geneigvec|
                 (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))))
        (SPROG
         ((|leig|
           (|List|
            (|Record|
             (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))))
          (#1=#:G141 NIL) (|leg| NIL) (#2=#:G142 NIL))
         (SEQ (LETT |leig| (SPADCALL A |fac| (QREFELT % 18)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |leg| NIL) (LETT #2# |leig|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |leg| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #1# (CONS (|IEP;genEigForm| |leg| A %) #1#))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |IEP;eigenvectors;MML;17|
        ((A (|Matrix| F))
         (|fac|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|List|
           (|Record|
            (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
            (|:| |eigmult| (|NonNegativeInteger|))
            (|:| |eigvec|
                 (|List| (|Vector| (|SparseUnivariatePolynomial| F))))))))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| F))
          (|lff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fact| NIL) (#2=#:G155 NIL) (|pol| #1#) (|vec| (F))
          (|ratSol|
           #3=(|List|
               (|Record|
                (|:| |eigval| (|Union| F (|SparseUnivariatePolynomial| F)))
                (|:| |eigmult| (|NonNegativeInteger|))
                (|:| |eigvec|
                     (|List| (|Vector| (|SparseUnivariatePolynomial| F)))))))
          (|alpha| #1#) (|algSol| #3#))
         (SEQ (LETT |p| (SPADCALL A (QREFELT % 38))) (LETT |ratSol| NIL)
              (LETT |algSol| NIL)
              (LETT |lff| (SPADCALL (SPADCALL |p| |fac|) (QREFELT % 45)))
              (SEQ (LETT |fact| NIL) (LETT #2# |lff|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fact| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pol| (QVELT |fact| 1))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |pol| (QREFELT % 46)) 1)
                           (SEQ
                            (LETT |vec|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |pol| 0 (QREFELT % 48))
                                             (SPADCALL |pol| (QREFELT % 49))
                                             (QREFELT % 50))
                                   (QREFELT % 51)))
                            (EXIT
                             (LETT |ratSol|
                                   (CONS
                                    (VECTOR (CONS 0 |vec|) (QVELT |fact| 2)
                                            (|IEP;intRatEig| |vec| A 1 %))
                                    |ratSol|)))))
                          ('T
                           (SEQ (LETT |alpha| |pol|)
                                (EXIT
                                 (LETT |algSol|
                                       (CONS
                                        (VECTOR (CONS 1 |alpha|)
                                                (QVELT |fact| 2)
                                                (|IEP;intAlgEig| |alpha| A 1
                                                 %))
                                        |algSol|))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |ratSol| |algSol| (QREFELT % 71)))))) 

(DECLAIM (NOTINLINE |InnerEigenPackage;|)) 

(DEFUN |InnerEigenPackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|InnerEigenPackage| DV$1))
          (LETT % (GETREFV 72))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))))))
          (|haddProp| |$ConstructorCache| '|InnerEigenPackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 15
                       (CONS (|dispatchFunction| |IEP;eigenvalues;ML;1|) %))
             (QSETREFV % 19
                       (CONS (|dispatchFunction| |IEP;eigenvectors;ML;2|) %))
             (QSETREFV % 23
                       (CONS
                        (|dispatchFunction| |IEP;generalizedEigenvectors;ML;3|)
                        %)))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV % 38
                      (CONS
                       (|dispatchFunction|
                        |IEP;characteristicPolynomial;MSup;8|)
                       %)))
           ('T
            (QSETREFV % 38
                      (CONS
                       (|dispatchFunction|
                        |IEP;characteristicPolynomial;MSup;9|)
                       %))))
          %))) 

(DEFUN |InnerEigenPackage| (#1=#:G156)
  (SPROG NIL
         (PROG (#2=#:G157)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|InnerEigenPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|InnerEigenPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerEigenPackage|)))))))))) 

(MAKEPROP '|InnerEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| 8)
              (|SparseUnivariatePolynomial| %) (0 . |factorPolynomial|)
              (|Union| 6 24) (|List| 10) (|Matrix| 6) (|Mapping| 44 24)
              |IEP;eigenvalues;MML;10| (5 . |eigenvalues|)
              (|Record| (|:| |eigval| 10) (|:| |eigmult| 34) (|:| |eigvec| 33))
              (|List| 16) |IEP;eigenvectors;MML;17| (10 . |eigenvectors|)
              (|Record| (|:| |eigval| 10) (|:| |geneigvec| 33)) (|List| 20)
              |IEP;generalizedEigenvectors;MML;16|
              (15 . |generalizedEigenvectors|) (|SparseUnivariatePolynomial| 6)
              (20 . |rem|) (|Boolean|) (26 . =) (32 . |0|) (36 . |0|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 30 '"failed")
              (40 . |extendedEuclidean|) (|List| 65) (|NonNegativeInteger|)
              |IEP;generalizedEigenvector;UM2NniL;14|
              (|CharacteristicPolynomial2| 6) (47 . |char_pol|)
              (52 . |characteristicPolynomial|) (|CharacteristicPolynomial4| 6)
              (57 . |char_pol_via_berkovitz|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 41) (|:| |factor| 24) (|:| |exponent| 34))
              (|List| 42) (|Factored| 24) (62 . |factorList|) (67 . |degree|)
              (72 . |1|) (76 . |coefficient|) (82 . |leadingCoefficient|)
              (87 . /) (93 . -) (98 . |append|) |IEP;eigenvector;UML;11|
              (104 . |zero|) (|Integer|) (110 . |elt|) (117 . |setelt!|)
              (125 . -) (131 . ^) (|List| 62) (137 . |nullSpace|) (|Vector| 6)
              (142 . |elt|) (148 . |coerce|) (|Vector| 24) (153 . |setelt!|)
              (160 . |unitCanonical|) (165 . |1|) (169 . |monomial|)
              |IEP;generalizedEigenvector;RML;15| (175 . |append|))
           '#(|generalizedEigenvectors| 181 |generalizedEigenvector| 192
              |eigenvectors| 206 |eigenvector| 217 |eigenvalues| 223
              |characteristicPolynomial| 234)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|characteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|eigenvalues|
                                 ((|List|
                                   (|Union| |#1|
                                            (|SparseUnivariatePolynomial|
                                             |#1|)))
                                  (|Matrix| |#1|)
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial| |#1|))
                                   (|SparseUnivariatePolynomial| |#1|))))
                                T)
                              '((|eigenvector|
                                 ((|List|
                                   (|Vector|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|Union| |#1|
                                           (|SparseUnivariatePolynomial| |#1|))
                                  (|Matrix| |#1|)))
                                T)
                              '((|generalizedEigenvector|
                                 ((|List|
                                   (|Vector|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|Union| |#1|
                                           (|SparseUnivariatePolynomial| |#1|))
                                  (|Matrix| |#1|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|generalizedEigenvector|
                                 ((|List|
                                   (|Vector|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|Record|
                                   (|:| |eigval|
                                        (|Union| |#1|
                                                 (|SparseUnivariatePolynomial|
                                                  |#1|)))
                                   (|:| |eigmult| (|NonNegativeInteger|))
                                   (|:| |eigvec|
                                        (|List|
                                         (|Vector|
                                          (|SparseUnivariatePolynomial|
                                           |#1|)))))
                                  (|Matrix| |#1|)))
                                T)
                              '((|generalizedEigenvectors|
                                 ((|List|
                                   (|Record|
                                    (|:| |eigval|
                                         (|Union| |#1|
                                                  (|SparseUnivariatePolynomial|
                                                   |#1|)))
                                    (|:| |geneigvec|
                                         (|List|
                                          (|Vector|
                                           (|SparseUnivariatePolynomial|
                                            |#1|))))))
                                  (|Matrix| |#1|)
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial| |#1|))
                                   (|SparseUnivariatePolynomial| |#1|))))
                                T)
                              '((|eigenvectors|
                                 ((|List|
                                   (|Record|
                                    (|:| |eigval|
                                         (|Union| |#1|
                                                  (|SparseUnivariatePolynomial|
                                                   |#1|)))
                                    (|:| |eigmult| (|NonNegativeInteger|))
                                    (|:| |eigvec|
                                         (|List|
                                          (|Vector|
                                           (|SparseUnivariatePolynomial|
                                            |#1|))))))
                                  (|Matrix| |#1|)
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial| |#1|))
                                   (|SparseUnivariatePolynomial| |#1|))))
                                T)
                              '((|eigenvalues|
                                 ((|List|
                                   (|Union| |#1|
                                            (|SparseUnivariatePolynomial|
                                             |#1|)))
                                  (|Matrix| |#1|)))
                                (|has| 6 (|PolynomialFactorizationExplicit|)))
                              '((|eigenvectors|
                                 ((|List|
                                   (|Record|
                                    (|:| |eigval|
                                         (|Union| |#1|
                                                  (|SparseUnivariatePolynomial|
                                                   |#1|)))
                                    (|:| |eigmult| (|NonNegativeInteger|))
                                    (|:| |eigvec|
                                         (|List|
                                          (|Vector|
                                           (|SparseUnivariatePolynomial|
                                            |#1|))))))
                                  (|Matrix| |#1|)))
                                (|has| 6 (|PolynomialFactorizationExplicit|)))
                              '((|generalizedEigenvectors|
                                 ((|List|
                                   (|Record|
                                    (|:| |eigval|
                                         (|Union| |#1|
                                                  (|SparseUnivariatePolynomial|
                                                   |#1|)))
                                    (|:| |geneigvec|
                                         (|List|
                                          (|Vector|
                                           (|SparseUnivariatePolynomial|
                                            |#1|))))))
                                  (|Matrix| |#1|)))
                                (|has| 6 (|PolynomialFactorizationExplicit|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 71
                                            '(1 6 7 8 9 1 0 11 12 15 1 0 17 12
                                              19 1 0 21 12 23 2 24 0 0 0 25 2
                                              24 26 0 0 27 0 6 0 28 0 24 0 29 3
                                              24 31 0 0 0 32 1 36 24 12 37 1 0
                                              24 12 38 1 39 24 12 40 1 44 43 0
                                              45 1 24 34 0 46 0 6 0 47 2 24 6 0
                                              34 48 1 24 6 0 49 2 6 0 0 0 50 1
                                              6 0 0 51 2 11 0 0 0 52 2 12 0 34
                                              34 54 3 12 6 0 55 55 56 4 12 6 0
                                              55 55 6 57 2 6 0 0 0 58 2 12 0 0
                                              34 59 1 12 60 0 61 2 62 6 0 55 63
                                              1 24 0 6 64 3 65 24 0 55 24 66 1
                                              24 0 0 67 0 24 0 68 2 24 0 6 34
                                              69 2 17 0 0 0 71 2 0 21 12 13 22
                                              1 1 21 12 23 4 0 33 10 12 34 34
                                              35 2 0 33 16 12 70 2 0 17 12 13
                                              18 1 1 17 12 19 2 0 33 10 12 53 2
                                              0 11 12 13 14 1 1 11 12 15 1 0 24
                                              12 38)))))
           '|lookupComplete|)) 
