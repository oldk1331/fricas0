
(SDEFUN |IBACHIN;applyFrobToMatrix|
        ((|mat| (|Matrix| R)) (|q| (|NonNegativeInteger|)) (% (|Matrix| R)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (|ans| (|Matrix| R)) (|i| NIL) (#1=#:G11 NIL) (|j| NIL)
          (#2=#:G12 NIL))
         (SEQ (LETT |m| (ANROWS |mat|)) (LETT |n| (ANCOLS |mat|))
              (LETT |ans| (MAKE_MATRIX1 |m| |n| (|spadConstant| % 10)))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |ans| |i| |j|
                                        (SPADCALL
                                         (CONS #'|IBACHIN;applyFrobToMatrix!0|
                                               (VECTOR % |q|))
                                         (QAREF2O |mat| |i| |j| 1 1)
                                         (QREFELT % 14))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |IBACHIN;applyFrobToMatrix!0| ((|k1| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT % 12)))))) 

(SDEFUN |IBACHIN;listConjugateBases;R2NniL;2|
        ((|bas|
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R))))
         (|q| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (%
          (|List|
           #1=(|Record| (|:| |basis| #2=(|Matrix| R)) (|:| |basisDen| R)
                        (|:| |basisInv| #3=(|Matrix| R))))))
        (SPROG
         ((|i| NIL) (#4=#:G24 NIL) (|b| #2#) (|bInv| #3#) (|bDen| (R))
          (|newBasis| #1#)
          (|outList|
           (|List|
            (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                      (|:| |basisInv| (|Matrix| R))))))
         (SEQ (LETT |outList| (SPADCALL |bas| (QREFELT % 17)))
              (LETT |b| (QVELT |bas| 0)) (LETT |bInv| (QVELT |bas| 2))
              (LETT |bDen| (QVELT |bas| 1))
              (SEQ (LETT |i| 1) (LETT #4# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |b| (|IBACHIN;applyFrobToMatrix| |b| |q| %))
                        (LETT |bInv|
                              (|IBACHIN;applyFrobToMatrix| |bInv| |q| %))
                        (LETT |bDen|
                              (SPADCALL
                               (CONS #'|IBACHIN;listConjugateBases;R2NniL;2!0|
                                     (VECTOR % |q|))
                               |bDen| (QREFELT % 14)))
                        (LETT |newBasis| (VECTOR |b| |bDen| |bInv|))
                        (EXIT (LETT |outList| (CONS |newBasis| |outList|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;listConjugateBases;R2NniL;2!0| ((|k1| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT % 12)))))) 

(SDEFUN |IBACHIN;factorList;K3NniL;3|
        ((|a| (K)) (|q| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (|k| (|NonNegativeInteger|))
         (% (|List| (|SparseUnivariatePolynomial| K))))
        (SPROG
         ((|xx| #1=(|SparseUnivariatePolynomial| K)) (|i| NIL) (#2=#:G30 NIL)
          (|coef| #1#) (|outList| (|List| (|SparseUnivariatePolynomial| K))))
         (SEQ (LETT |coef| (SPADCALL |a| 0 (QREFELT % 22)))
              (LETT |xx| (SPADCALL (|spadConstant| % 18) 1 (QREFELT % 22)))
              (LETT |outList|
                    (SPADCALL
                     (SPADCALL (SPADCALL |xx| |coef| (QREFELT % 23)) |k|
                               (QREFELT % 24))
                     (QREFELT % 26)))
              (SEQ (LETT |i| 1) (LETT #2# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |coef| (SPADCALL |coef| |q| (QREFELT % 24)))
                        (EXIT
                         (LETT |outList|
                               (CONS
                                (SPADCALL (SPADCALL |xx| |coef| (QREFELT % 23))
                                          |k| (QREFELT % 24))
                                |outList|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;basisInfoToPolys|
        ((|mat| (|Matrix| R)) (|lcm| (R)) (|den| (R)) (% (|List| UP)))
        (SPROG
         ((|n| (|Integer|)) (|n1| (|Integer|)) (|i| NIL) (#1=#:G38 NIL)
          (|j| NIL) (#2=#:G39 NIL) (|pp| (UP)) (|outList| (|List| UP)))
         (SEQ (LETT |n| (ANROWS |mat|)) (LETT |n1| (- |n| 1))
              (LETT |outList| NIL)
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |pp| (|spadConstant| % 28))
                        (SEQ (LETT |j| 0) (LETT #2# |n1|) G190
                             (COND ((|greater_SI| |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |pp|
                                     (SPADCALL |pp|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |lcm| |den|
                                                           (QREFELT % 29))
                                                 (QAREF2O |mat| |i| (+ |j| 1) 1
                                                          1)
                                                 (QREFELT % 30))
                                                |j| (QREFELT % 31))
                                               (QREFELT % 32)))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |outList| (CONS |pp| |outList|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;basesToPolyLists|
        ((|basisList|
          (|List|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)))))
         (|lcm| (R)) (% (|List| (|List| UP))))
        (SPROG ((#1=#:G44 NIL) (|b| NIL) (#2=#:G45 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |b| NIL) (LETT #2# |basisList|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (|IBACHIN;basisInfoToPolys| (QVELT |b| 0) |lcm|
                                (QVELT |b| 1) %)
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean|
        ((|f| (UP)) (|g| (UP)) (|p| (R)) (|n| (|NonNegativeInteger|))
         (% (|Record| (|:| |coef1| UP) (|:| |coef2| UP))))
        (SPROG
         ((|sae|
           (|Join| (|MonogenicAlgebra| K R)
                   (CATEGORY |package|
                    (IF (|has| K (|Field|))
                        (IF (|has| K (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|))))
          (|fSUP| #1=(|SparseUnivariatePolynomial| R)) (|gSUP| #1#)
          (|fBar| #2=(|SparseUnivariatePolynomial| |sae|)) (|gBar| #2#)
          (|ee|
           (|Record| (|:| |coef1| #3=(|SparseUnivariatePolynomial| |sae|))
                     (|:| |coef2| #4=(|SparseUnivariatePolynomial| |sae|))
                     (|:| |generator| (|SparseUnivariatePolynomial| |sae|))))
          (|ss1| #3#) (|tt1| #4#) (|s1| #5=(|SparseUnivariatePolynomial| R))
          (|t1| #5#) (|i| NIL) (#6=#:G77 NIL)
          (|num| (|SparseUnivariatePolynomial| R)) (#7=#:G54 NIL)
          (|rhs| (|SparseUnivariatePolynomial| R))
          (|sigma| #8=(|SparseUnivariatePolynomial| R)) (|tau| #8#)
          (|quorem|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| R))
                     (|:| |remainder| (|SparseUnivariatePolynomial| R))))
          (|pPower| (R)) (|s| #5#) (|t| #5#))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT % 6) (QREFELT % 7) |p|))
          (LETT |fSUP| (SPADCALL |f| (QREFELT % 34)))
          (LETT |gSUP| (SPADCALL |g| (QREFELT % 34)))
          (LETT |fBar|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST '% (|devaluate| (ELT % 7)))
                                        |sae|)
                 |fSUP|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT % 7)))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT % 7))))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         (ELT % 7) |sae|))))
          (LETT |gBar|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST '% (|devaluate| (ELT % 7)))
                                        |sae|)
                 |gSUP|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT % 7)))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT % 7))))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         (ELT % 7) |sae|))))
          (LETT |ee|
                (SPADCALL |fBar| |gBar|
                          (|compiledLookupCheck| '|extendedEuclidean|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:| '|coef1| '%)
                                                        (LIST '|:| '|coef2| '%)
                                                        (LIST '|:| '|generator|
                                                              '%))
                                                  '% '%)
                                                 (|SparseUnivariatePolynomial|
                                                  |sae|))))
          (COND
           ((NULL
             (SPADCALL (QVELT |ee| 2)
                       (SPADCALL
                        (|compiledLookupCheck| '|1| (LIST '%)
                                               (|SparseUnivariatePolynomial|
                                                |sae|)))
                       (|compiledLookupCheck| '= (LIST (LIST '|Boolean|) '% '%)
                                              (|SparseUnivariatePolynomial|
                                               |sae|))))
            (EXIT (|error| "polynomials aren't relatively prime"))))
          (LETT |ss1| (QVELT |ee| 0)) (LETT |tt1| (QVELT |ee| 1))
          (LETT |s1|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST (|devaluate| (ELT % 7)) '%)
                                        |sae|)
                 |ss1|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT % 7)))
                                         (LIST '|Mapping|
                                               (|devaluate| (ELT % 7))
                                               (|devaluate| |sae|))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|)))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         |sae| (ELT % 7)))))
          (LETT |s| |s1|)
          (LETT |t1|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST (|devaluate| (ELT % 7)) '%)
                                        |sae|)
                 |tt1|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT % 7)))
                                         (LIST '|Mapping|
                                               (|devaluate| (ELT % 7))
                                               (|devaluate| |sae|))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|)))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         |sae| (ELT % 7)))))
          (LETT |t| |t1|) (LETT |pPower| |p|)
          (SEQ (LETT |i| 2) (LETT #6# |n|) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |num|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 39)
                                 (SPADCALL |s| |fSUP| (QREFELT % 35))
                                 (QREFELT % 40))
                       (SPADCALL |t| |gSUP| (QREFELT % 35)) (QREFELT % 40)))
                (LETT |rhs|
                      (PROG2
                          (LETT #7# (SPADCALL |num| |pPower| (QREFELT % 42)))
                          (QCDR #7#)
                        (|check_union2| (QEQCAR #7# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT % 7))
                                        (|Union|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT % 7))
                                         "failed")
                                        #7#)))
                (LETT |sigma|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!0|
                             (VECTOR % |p|))
                       (SPADCALL |s1| |rhs| (QREFELT % 35)) (QREFELT % 45)))
                (LETT |tau|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!1|
                             (VECTOR % |p|))
                       (SPADCALL |t1| |rhs| (QREFELT % 35)) (QREFELT % 45)))
                (LETT |s|
                      (SPADCALL |s| (SPADCALL |pPower| |sigma| (QREFELT % 46))
                                (QREFELT % 47)))
                (LETT |t|
                      (SPADCALL |t| (SPADCALL |pPower| |tau| (QREFELT % 46))
                                (QREFELT % 47)))
                (LETT |quorem| (SPADCALL |s| |gSUP| (QREFELT % 49)))
                (LETT |pPower| (SPADCALL |pPower| |p| (QREFELT % 30)))
                (LETT |s|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!2|
                             (VECTOR % |pPower|))
                       (QCDR |quorem|) (QREFELT % 45)))
                (EXIT
                 (LETT |t|
                       (SPADCALL
                        (CONS #'|IBACHIN;approximateExtendedEuclidean!3|
                              (VECTOR % |pPower|))
                        (SPADCALL |t|
                                  (SPADCALL |fSUP| (QCAR |quorem|)
                                            (QREFELT % 35))
                                  (QREFELT % 47))
                        (QREFELT % 45)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS (SPADCALL |s| (QREFELT % 50))
                 (SPADCALL |t| (QREFELT % 50))))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!3| ((|r1| NIL) ($$ NIL))
        (PROG (|pPower| %)
          (LETT |pPower| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT % 43)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!2| ((|r1| NIL) ($$ NIL))
        (PROG (|pPower| %)
          (LETT |pPower| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT % 43)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!1| ((|r1| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT % 43)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT % 43)))))) 

(SDEFUN |IBACHIN;mapChineseToList|
        ((|list| (|List| UP)) (|polyList| (|List| UP)) (|i| (|Integer|))
         (|den| (R)) (% (|List| UP)))
        (SPROG
         ((#1=#:G99 NIL) (|p| (UP)) (|j| NIL) (|q| (UP))
          (|factoredDen|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| #2=(|NonNegativeInteger|)))))
          (|prime| (R)) (|n| #2#) (|invPoly| (UP)) (#3=#:G100 NIL) (|pp| NIL)
          (#4=#:G101 NIL))
         (SEQ (LETT |q| (|spadConstant| % 36))
              (SEQ (LETT |j| 1) (LETT #1# (- |i| 1)) G190
                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                   (SEQ
                    (LETT |q|
                          (SPADCALL |q| (|SPADfirst| |polyList|)
                                    (QREFELT % 51)))
                    (EXIT (LETT |polyList| (CDR |polyList|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |p| (|SPADfirst| |polyList|))
              (LETT |polyList| (CDR |polyList|))
              (SEQ (LETT |j| (+ |i| 1)) G190
                   (COND ((NULL (NULL (NULL |polyList|))) (GO G191)))
                   (SEQ
                    (LETT |q|
                          (SPADCALL |q| (|SPADfirst| |polyList|)
                                    (QREFELT % 51)))
                    (EXIT (LETT |polyList| (CDR |polyList|))))
                   (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |factoredDen|
                    (SPADCALL (SPADCALL |den| (QREFELT % 53)) (QREFELT % 57)))
              (LETT |prime| (QVELT (|SPADfirst| |factoredDen|) 1))
              (LETT |n| (QVELT (|SPADfirst| |factoredDen|) 2))
              (LETT |invPoly|
                    (QCAR
                     (|IBACHIN;approximateExtendedEuclidean| |q| |p| |prime|
                      |n| %)))
              (EXIT
               (PROGN
                (LETT #3# NIL)
                (SEQ (LETT |pp| NIL) (LETT #4# |list|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |pp| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS
                              (QCDR
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |pp| |invPoly| (QREFELT % 51)) |q|
                                 (QREFELT % 51))
                                (SPADCALL |p| |q| (QREFELT % 51))
                                (QREFELT % 58)))
                              #3#))))
                     (LETT #4# (CDR #4#)) (GO G190) G191
                     (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |IBACHIN;polyListToMatrix|
        ((|polyList| (|List| UP)) (|n| (|NonNegativeInteger|))
         (% (|Matrix| R)))
        (SPROG
         ((|mat| (|Matrix| R)) (#1=#:G111 NIL) (|i| NIL) (#2=#:G110 NIL)
          (|poly| (UP)))
         (SEQ (LETT |mat| (MAKE_MATRIX1 |n| |n| (|spadConstant| % 10)))
              (SEQ (LETT #1# |polyList|) (LETT |i| 1) (LETT #2# |n|) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                         (PROGN (LETT |poly| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ G190
                          (COND
                           ((NULL (NULL (SPADCALL |poly| (QREFELT % 60))))
                            (GO G191)))
                          (SEQ
                           (SPADCALL |mat| |i|
                                     (+ (SPADCALL |poly| (QREFELT % 61)) 1)
                                     (SPADCALL |poly| (QREFELT % 62))
                                     (QREFELT % 65))
                           (EXIT
                            (LETT |poly| (SPADCALL |poly| (QREFELT % 66)))))
                          NIL (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |mat|)))) 

(SDEFUN |IBACHIN;chineseRemainder;LLNniR;9|
        ((|factors| (|List| UP))
         (|factorBases|
          (|List|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)))))
         (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)))))
        (SPROG
         ((#1=#:G124 NIL) (|base| NIL) (#2=#:G125 NIL) (|denLCM| (R))
          (|factorBasisPolyLists| (|List| (|List| UP))) (|pList| NIL)
          (#3=#:G126 NIL) (|i| NIL) (|polyList| (|List| UP))
          (|basisPolyLists| (|List| (|List| UP))) (|basisPolys| (|List| UP))
          (|mat| (|Matrix| R)) (|matInv| (|Matrix| R)))
         (SEQ
          (LETT |denLCM|
                (SPADCALL (ELT % 67)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |base| NIL) (LETT #2# |factorBases|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |base| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #1# (CONS (QVELT |base| 1) #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 70)))
          (EXIT
           (COND
            ((SPADCALL |denLCM| (|spadConstant| % 19) (QREFELT % 71))
             (VECTOR (SPADCALL |n| (|spadConstant| % 19) (QREFELT % 72))
                     (|spadConstant| % 19)
                     (SPADCALL |n| (|spadConstant| % 19) (QREFELT % 72))))
            ('T
             (SEQ
              (LETT |factorBasisPolyLists|
                    (|IBACHIN;basesToPolyLists| |factorBases| |denLCM| %))
              (LETT |basisPolyLists| NIL)
              (SEQ (LETT |pList| NIL) (LETT #3# |factorBasisPolyLists|)
                   (LETT |i| 1) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |pList| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |polyList|
                          (|IBACHIN;mapChineseToList| |pList| |factors| |i|
                           |denLCM| %))
                    (EXIT
                     (LETT |basisPolyLists|
                           (CONS |polyList| |basisPolyLists|))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |basisPolys|
                    (SPADCALL (NREVERSE |basisPolyLists|) (QREFELT % 75)))
              (LETT |mat|
                    (SPADCALL
                     (SPADCALL (|IBACHIN;polyListToMatrix| |basisPolys| |n| %)
                               |denLCM| (QREFELT % 77))
                     (QREFELT % 78)))
              (LETT |matInv| (SPADCALL |mat| |denLCM| (QREFELT % 80)))
              (EXIT (VECTOR |mat| |denLCM| |matInv|))))))))) 

(DECLAIM (NOTINLINE |ChineseRemainderToolsForIntegralBases;|)) 

(DEFUN |ChineseRemainderToolsForIntegralBases;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$|
                (LIST '|ChineseRemainderToolsForIntegralBases| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 82))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|ChineseRemainderToolsForIntegralBases|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ChineseRemainderToolsForIntegralBases| (&REST #1=#:G127)
  (SPROG NIL
         (PROG (#2=#:G128)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ChineseRemainderToolsForIntegralBases|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ChineseRemainderToolsForIntegralBases;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ChineseRemainderToolsForIntegralBases|)))))))))) 

(MAKEPROP '|ChineseRemainderToolsForIntegralBases| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |0|) (4 . |0|) (|NonNegativeInteger|) (8 . ^)
              (|Mapping| 6 6) (14 . |map|)
              (|Record| (|:| |basis| 64) (|:| |basisDen| 7)
                        (|:| |basisInv| 64))
              (|List| 15) (20 . |list|) (25 . |1|) (29 . |1|)
              |IBACHIN;listConjugateBases;R2NniL;2|
              (|SparseUnivariatePolynomial| 6) (33 . |monomial|) (39 . -)
              (45 . ^) (|List| 21) (51 . |list|) |IBACHIN;factorList;K3NniL;3|
              (56 . |0|) (60 . |quo|) (66 . *) (72 . |monomial|) (78 . +)
              (|SparseUnivariatePolynomial| 7) (84 . |makeSUP|) (89 . *)
              (95 . |1|) (|Factored| 7) (99 . |1|) (103 . |1|) (107 . -)
              (|Union| % '"failed") (113 . |exquo|) (119 . |rem|)
              (|Mapping| 7 7) (125 . |map|) (131 . *) (137 . +)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (143 . |monicDivide|) (149 . |unmakeSUP|) (154 . *)
              (|UnivariateFiniteFieldFactorize| 6 7) (160 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 54) (|:| |factor| 7) (|:| |exponent| 11))
              (|List| 55) (165 . |factorList|) (170 . |monicDivide|)
              (|Boolean|) (176 . |zero?|) (181 . |degree|)
              (186 . |leadingCoefficient|) (|Integer|) (|Matrix| 7)
              (191 . |setelt!|) (199 . |reductum|) (204 . |lcm|)
              (|Mapping| 7 7 7) (|List| 7) (210 . |reduce|) (216 . =)
              (222 . |scalarMatrix|) (|List| %) (|List| 8) (228 . |concat|)
              (|ModularHermitianRowReduction| 7) (233 . |rowEchelon|)
              (239 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 64)
              (244 . |UpTriBddDenomInv|) |IBACHIN;chineseRemainder;LLNniR;9|)
           '#(|listConjugateBases| 250 |factorList| 257 |chineseRemainder| 265)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factorList|
                                 ((|List| (|SparseUnivariatePolynomial| |#1|))
                                  |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|listConjugateBases|
                                 ((|List|
                                   (|Record| (|:| |basis| (|Matrix| |#2|))
                                             (|:| |basisDen| |#2|)
                                             (|:| |basisInv| (|Matrix| |#2|))))
                                  (|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|chineseRemainder|
                                 ((|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))
                                  (|List| |#3|)
                                  (|List|
                                   (|Record| (|:| |basis| (|Matrix| |#2|))
                                             (|:| |basisDen| |#2|)
                                             (|:| |basisInv| (|Matrix| |#2|))))
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 81
                                            '(0 6 0 9 0 7 0 10 2 6 0 0 11 12 2
                                              7 0 13 0 14 1 16 0 15 17 0 6 0 18
                                              0 7 0 19 2 21 0 6 11 22 2 21 0 0
                                              0 23 2 21 0 0 11 24 1 25 0 21 26
                                              0 8 0 28 2 7 0 0 0 29 2 7 0 0 0
                                              30 2 8 0 7 11 31 2 8 0 0 0 32 1 8
                                              33 0 34 2 33 0 0 0 35 0 8 0 36 0
                                              37 0 38 0 33 0 39 2 33 0 0 0 40 2
                                              33 41 0 7 42 2 7 0 0 0 43 2 33 0
                                              44 0 45 2 33 0 7 0 46 2 33 0 0 0
                                              47 2 33 48 0 0 49 1 8 0 33 50 2 8
                                              0 0 0 51 1 52 37 7 53 1 37 56 0
                                              57 2 8 48 0 0 58 1 8 59 0 60 1 8
                                              11 0 61 1 8 7 0 62 4 64 7 0 63 63
                                              7 65 1 8 0 0 66 2 7 0 0 0 67 2 69
                                              7 68 0 70 2 7 59 0 0 71 2 64 0 11
                                              7 72 1 74 0 73 75 2 76 64 64 7 77
                                              1 64 0 0 78 2 79 64 64 7 80 3 0
                                              16 15 11 11 20 4 0 25 6 11 11 11
                                              27 3 0 15 74 16 11 81)))))
           '|lookupComplete|)) 
