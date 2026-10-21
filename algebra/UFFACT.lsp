
(SDEFUN |UFFACT;get_deg_GF| ((% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G10 NIL) (|ss| (|NonNegativeInteger|))
          (|n| (|PositiveInteger|)) (#2=#:G15 NIL))
         (SEQ
          (COND
           ((EQL (QREFELT % 12) 0)
            (SEQ (LETT |n| 1) (LETT |ss| (SPADCALL (QREFELT % 15)))
                 (SEQ G190 (COND ((NULL (> |ss| (QREFELT % 10))) (GO G191)))
                      (SEQ
                       (LETT |ss|
                             (PROG2
                                 (LETT #1# (|exquo_INT| |ss| (QREFELT % 10)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #1#)))
                       (EXIT (LETT |n| (+ |n| 1))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (SETELT % 12 |n|)))))
          (EXIT
           (PROG1 (LETT #2# (QREFELT % 12))
             (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                               '(|NonNegativeInteger|) #2#)))))) 

(SDEFUN |UFFACT;sufactor2|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|pa| (|PrimitiveArray| F)) (|lfp| (|List| (|PrimitiveArray| F)))
          (|f1| NIL) (#1=#:G25 NIL) (|mf1| (|SparseUnivariatePolynomial| F))
          (|res| (|List| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |pa| (SPADCALL |m| (QREFELT % 21)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 18) (QREFELT % 25)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |mf1| (SPADCALL |f1| (QREFELT % 26)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;irreducible2?|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (SPROG ((|pa| (|PrimitiveArray| F)))
               (SEQ (LETT |pa| (SPADCALL |m| (QREFELT % 21)))
                    (EXIT (SPADCALL |pa| (QREFELT % 18) (QREFELT % 28)))))) 

(SDEFUN |UFFACT;sufact_gen|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|lc| (F))
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #2=(|NonNegativeInteger|)))))
          (|sf| NIL) (#3=#:G47 NIL) (|lc1| (F)) (|m1| #1#)
          (|lf1| (|List| (|SparseUnivariatePolynomial| F))) (|e1| #2#)
          (|f1| NIL) (#4=#:G48 NIL)
          (|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 29)))
                      (|spadConstant| % 16) (QREFELT % 30))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 31)) |m|
                            (QREFELT % 32)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 34)) (QREFELT % 39)))
          (SEQ (LETT |sf| NIL) (LETT #3# |lsf|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |sf| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 29)))
                                (|spadConstant| % 16) (QREFELT % 30))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 31)) |m1|
                                      (QREFELT % 32)))))
                    (LETT |lf1| (|UFFACT;sufactor2| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #4# |lf1|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |f1| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor1|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|mi| (|SparseUnivariatePolynomial| (|Integer|)))
          (|pa| (|U32Vector|)) (|lfp| (|List| (|U32Vector|))) (|f1| NIL)
          (#1=#:G56 NIL) (|if1| (|SparseUnivariatePolynomial| (|Integer|)))
          (|mf1| (|SparseUnivariatePolynomial| F))
          (|res| (|List| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |mi| (SPADCALL (ELT % 41) |m| (QREFELT % 45)))
              (LETT |pa| (SPADCALL |mi| (QREFELT % 10) (QREFELT % 48)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 10) (QREFELT % 51)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |if1| (SPADCALL |f1| (QREFELT % 52)))
                        (LETT |mf1| (SPADCALL (ELT % 53) |if1| (QREFELT % 56)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;irreducible1?|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (SPROG
         ((|mi| (|SparseUnivariatePolynomial| (|Integer|)))
          (|pa| (|U32Vector|)))
         (SEQ (LETT |mi| (SPADCALL (ELT % 41) |m| (QREFELT % 45)))
              (LETT |pa| (SPADCALL |mi| (QREFELT % 10) (QREFELT % 48)))
              (EXIT (SPADCALL |pa| (QREFELT % 10) (QREFELT % 57)))))) 

(SDEFUN |UFFACT;sufact_small|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|lc| (F))
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #2=(|NonNegativeInteger|)))))
          (|sf| NIL) (#3=#:G70 NIL) (|lc1| (F)) (|m1| #1#)
          (|lf1| (|List| (|SparseUnivariatePolynomial| F))) (|e1| #2#)
          (|f1| NIL) (#4=#:G71 NIL)
          (|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 29)))
                      (|spadConstant| % 16) (QREFELT % 30))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 31)) |m|
                            (QREFELT % 32)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 34)) (QREFELT % 39)))
          (SEQ (LETT |sf| NIL) (LETT #3# |lsf|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |sf| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 29)))
                                (|spadConstant| % 16) (QREFELT % 30))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 31)) |m1|
                                      (QREFELT % 32)))))
                    (LETT |lf1| (|UFFACT;sufactor1| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #4# |lf1|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |f1| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor;SupR;8|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 58)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufact_small| |m| %))
         ('T (|UFFACT;sufact_gen| |m| %)))) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;9|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 58)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufactor1| |m| %))
         ('T (|UFFACT;sufactor2| |m| %)))) 

(SDEFUN |UFFACT;su_irreducible?;SupB;10|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 58)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;irreducible1?| |m| %))
         ('T (|UFFACT;irreducible2?| |m| %)))) 

(SDEFUN |UFFACT;sufactor;SupR;11|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;12|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;su_irreducible?;SupB;13|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (|UFFACT;irreducible2?| |m| %)) 

(SDEFUN |UFFACT;sufactor;SupR;14|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;15|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;su_irreducible?;SupB;16|
        ((|m| (|SparseUnivariatePolynomial| F)) (% (|Boolean|)))
        (|UFFACT;irreducible2?| |m| %)) 

(SDEFUN |UFFACT;factor;UPF;17| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|upol| (|SparseUnivariatePolynomial| F))
          (|ru|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| F))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (|f1| NIL) (#1=#:G99 NIL)
          (|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 65))
            (|spadConstant| % 67))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 68)))
                 (LETT |ru| (SPADCALL |upol| (QREFELT % 61))) (LETT |rl| NIL)
                 (SEQ (LETT |f1| NIL) (LETT #1# (QCDR |ru|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |rl|
                              (CONS
                               (VECTOR (CONS 3 "prime")
                                       (SPADCALL (QCAR |f1|) (QREFELT % 69))
                                       (QCDR |f1|))
                               |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL (QCAR |ru|) (QREFELT % 70)) |rl|
                            (QREFELT % 73))))))))) 

(SDEFUN |UFFACT;factorSquareFree;UPF;18| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|lc| (F)) (|upol| (|SparseUnivariatePolynomial| F))
          (|rlu| (|List| (|SparseUnivariatePolynomial| F))) (#1=#:G111 NIL)
          (|lc1| (F)) (|f1| (|SparseUnivariatePolynomial| F))
          (|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 65))
            (|spadConstant| % 67))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 68)))
                 (LETT |lc| (SPADCALL |upol| (QREFELT % 29)))
                 (LETT |upol|
                       (SPADCALL (SPADCALL |lc| (QREFELT % 31)) |upol|
                                 (QREFELT % 32)))
                 (LETT |rlu| (SPADCALL |upol| (QREFELT % 63))) (LETT |rl| NIL)
                 (SEQ (LETT #1# |rlu|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |lc1| (SPADCALL |f1| (QREFELT % 29)))
                           (LETT |f1|
                                 (SPADCALL (SPADCALL |lc1| (QREFELT % 31)) |f1|
                                           (QREFELT % 32)))
                           (EXIT
                            (LETT |rl|
                                  (CONS
                                   (VECTOR (CONS 1 "sqfr")
                                           (SPADCALL |f1| (QREFELT % 69)) 1)
                                   |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL |lc| (QREFELT % 70)) |rl|
                            (QREFELT % 73))))))))) 

(SDEFUN |UFFACT;irreducible?;UPB;19| ((|pol| (UP)) (% (|Boolean|)))
        (SPROG ((|lc| (F)) (|upol| (|SparseUnivariatePolynomial| F)))
               (SEQ
                (COND
                 ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 65)) NIL)
                 (#1='T
                  (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 68)))
                       (EXIT
                        (COND
                         ((>
                           (SPADCALL
                            (SPADCALL |upol| (SPADCALL |upol| (QREFELT % 76))
                                      (QREFELT % 77))
                            (QREFELT % 58))
                           0)
                          NIL)
                         (#1#
                          (SEQ (LETT |lc| (SPADCALL |upol| (QREFELT % 29)))
                               (LETT |upol|
                                     (SPADCALL (SPADCALL |lc| (QREFELT % 31))
                                               |upol| (QREFELT % 32)))
                               (EXIT (SPADCALL |upol| (QREFELT % 64))))))))))))) 

(DECLAIM (NOTINLINE |UnivariateFiniteFieldFactorize;|)) 

(DEFUN |UnivariateFiniteFieldFactorize;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|UnivariateFiniteFieldFactorize| DV$1 DV$2))
          (LETT % (GETREFV 79))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnivariateFiniteFieldFactorize|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 11 (|VectorPolynomialOperationsF| |#1|))
          (QSETREFV % 12 0)
          (QSETREFV % 18 (CONS (QREFELT % 10) (|UFFACT;get_deg_GF| %)))
          (COND
           ((|domainEqual| |#1| (|PrimeField| (QREFELT % 10)))
            (COND
             ((|HasSignature| |#1|
                              (LIST '|convert|
                                    (LIST '(|Integer|) (|devaluate| |#1|))))
              (PROGN
               (QSETREFV % 61
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;8|)
                               %))
               (QSETREFV % 63
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;9|)
                          %))
               (QSETREFV % 64
                         (CONS
                          (|dispatchFunction| |UFFACT;su_irreducible?;SupB;10|)
                          %))))
             ('T
              (PROGN
               (QSETREFV % 61
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;11|)
                               %))
               (QSETREFV % 63
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;12|)
                          %))
               (QSETREFV % 64
                         (CONS
                          (|dispatchFunction| |UFFACT;su_irreducible?;SupB;13|)
                          %))))))
           ('T
            (PROGN
             (QSETREFV % 61
                       (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;14|) %))
             (QSETREFV % 63
                       (CONS
                        (|dispatchFunction|
                         |UFFACT;sufactor_square_free;SupL;15|)
                        %))
             (QSETREFV % 64
                       (CONS
                        (|dispatchFunction| |UFFACT;su_irreducible?;SupB;16|)
                        %)))))
          %))) 

(DEFUN |UnivariateFiniteFieldFactorize| (&REST #1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFiniteFieldFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariateFiniteFieldFactorize;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFiniteFieldFactorize|)))))))))) 

(MAKEPROP '|UnivariateFiniteFieldFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |characteristic|) '|ch_prime| '|pV|
              '|deg_GF| (4 . |0|) (8 . |0|) (12 . |size|) (16 . |1|) (20 . |1|)
              '|mD| (|PrimitiveArray| 6) (|SparseUnivariatePolynomial| 6)
              (24 . |to_mod_pa|) (|List| 19)
              (|Record| (|:| |i_mod| 40) (|:| |deg| 40))
              (|ModularFactorizationK| 6) (29 . |mfactor|) (35 . |pa_to_sup|)
              (|Boolean|) (40 . |irreducible?|) (46 . |leadingCoefficient|)
              (51 . ~=) (57 . |inv|) (62 . *) (|Factored| %)
              (68 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 20) (|:| |exponent| 8))
              (|List| 36) (|Factored| 20) (73 . |factorList|) (|Integer|)
              (78 . |convert|) (|SparseUnivariatePolynomial| 40)
              (|Mapping| 40 6) (|SparseUnivariatePolynomialFunctions2| 6 40)
              (83 . |map|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (89 . |to_mod_pa|) (|List| 46) (|ModularFactorization|)
              (95 . |mfactor|) (101 . |pa_to_sup|) (106 . |coerce|)
              (|Mapping| 6 40) (|SparseUnivariatePolynomialFunctions2| 40 6)
              (111 . |map|) (117 . |irreducible?|) (123 . |degree|)
              (|Record| (|:| |factor| 20) (|:| |exponent| 8))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 59)))
              (128 . |sufactor|) (|List| 20) (133 . |sufactor_square_free|)
              (138 . |su_irreducible?|) (143 . =) (|Factored| 7) (149 . |0|)
              (153 . |makeSUP|) (158 . |unmakeSUP|) (163 . |coerce|)
              (|Record| (|:| |flag| 35) (|:| |factor| 7) (|:| |exponent| 8))
              (|List| 71) (168 . |makeFR|) |UFFACT;factor;UPF;17|
              |UFFACT;factorSquareFree;UPF;18| (174 . |differentiate|)
              (179 . |gcd|) |UFFACT;irreducible?;UPB;19|)
           '#(|sufactor_square_free| 185 |sufactor| 190 |su_irreducible?| 195
              |irreducible?| 200 |factorSquareFree| 205 |factor| 210)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#2|) |#2|)) T)
                                   '((|factorSquareFree|
                                      ((|Factored| |#2|) |#2|))
                                     T)
                                   '((|sufactor|
                                      ((|Record| (|:| |cont| |#1|)
                                                 (|:| |factors|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#1|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|sufactor_square_free|
                                      ((|List|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|su_irreducible?|
                                      ((|Boolean|)
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|irreducible?| ((|Boolean|) |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 78
                                            '(0 6 8 9 0 6 0 13 0 7 0 14 0 6 8
                                              15 0 6 0 16 0 7 0 17 1 11 19 20
                                              21 2 24 22 19 23 25 1 11 20 19 26
                                              2 24 27 19 23 28 1 20 6 0 29 2 6
                                              27 0 0 30 1 6 0 0 31 2 20 0 6 0
                                              32 1 20 33 0 34 1 38 37 0 39 1 6
                                              40 0 41 2 44 42 43 20 45 2 47 46
                                              42 40 48 2 50 49 46 40 51 1 47 42
                                              46 52 1 6 0 40 53 2 55 20 54 42
                                              56 2 50 27 46 40 57 1 20 8 0 58 1
                                              0 60 20 61 1 0 62 20 63 1 0 27 20
                                              64 2 7 27 0 0 65 0 66 0 67 1 7 20
                                              0 68 1 7 0 20 69 1 7 0 6 70 2 66
                                              0 7 72 73 1 20 0 0 76 2 20 0 0 0
                                              77 1 0 62 20 63 1 0 60 20 61 1 0
                                              27 20 64 1 0 27 7 78 1 0 66 7 75
                                              1 0 66 7 74)))))
           '|lookupComplete|)) 
