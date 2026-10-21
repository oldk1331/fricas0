
(SDEFUN |GCNAALG;eval|
        ((|rf| (|Fraction| (|Polynomial| R))) (|a| (%))
         (% (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|coefOfa| (|List| (|Polynomial| R))) (#1=#:G21 NIL) (|s| NIL)
          (#2=#:G22 NIL) (|i| NIL) (#3=#:G23 NIL)
          (|lEq| (|List| (|Equation| (|Polynomial| R))))
          (|top| #4=(|Polynomial| R)) (|bot| #4#))
         (SEQ
          (LETT |coefOfa|
                (SPADCALL (ELT % 36)
                          (SPADCALL (SPADCALL |a| (QREFELT % 37))
                                    (QREFELT % 39))
                          (QREFELT % 43)))
          (SETELT % 8
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |s| NIL)
                        (LETT #2# (SPADCALL (QREFELT % 18) (QREFELT % 44)))
                        G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (SPADCALL (|spadConstant| % 20) (LIST |s|)
                                           (LIST 1) (QREFELT % 26))
                                 #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
          (LETT |lEq| NIL)
          (SEQ (LETT |i| 1) (LETT #3# (LENGTH (QREFELT % 8))) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lEq|
                       (CONS
                        (SPADCALL (SPADCALL (QREFELT % 8) |i| (QREFELT % 45))
                                  (SPADCALL |coefOfa| |i| (QREFELT % 45))
                                  (QREFELT % 47))
                        |lEq|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |top|
                (SPADCALL (SPADCALL |rf| (QREFELT % 36)) |lEq| (QREFELT % 49)))
          (LETT |bot|
                (SPADCALL (SPADCALL |rf| (QREFELT % 50)) |lEq| (QREFELT % 49)))
          (EXIT (SPADCALL |top| |bot| (QREFELT % 51)))))) 

(SDEFUN |GCNAALG;genericLeftTraceForm;2%F;2|
        ((|a| (%)) (|b| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPADCALL (SPADCALL |a| |b| (QREFELT % 52)) (QREFELT % 53))) 

(SDEFUN |GCNAALG;genericLeftDiscriminant;F;3|
        ((% (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|listBasis| (|List| %)) (#1=#:G31 NIL) (|b| NIL) (#2=#:G32 NIL)
          (#3=#:G33 NIL) (|a| NIL) (#4=#:G34 NIL)
          (|m| (|Matrix| (|Fraction| (|Polynomial| R)))))
         (SEQ
          (LETT |listBasis|
                (SPADCALL (SPADCALL (QREFELT % 56)) (QREFELT % 59)))
          (LETT |m|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |b| NIL) (LETT #2# |listBasis|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |a| NIL) (LETT #4# |listBasis|)
                                      G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |a| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL |a| |b|
                                                         (QREFELT % 54))
                                               #3#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#))))
                                #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 62)))
          (EXIT (SPADCALL |m| (QREFELT % 63)))))) 

(SDEFUN |GCNAALG;genericRightTraceForm;2%F;4|
        ((|a| (%)) (|b| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPADCALL (SPADCALL |a| |b| (QREFELT % 52)) (QREFELT % 65))) 

(SDEFUN |GCNAALG;genericRightDiscriminant;F;5|
        ((% (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|listBasis| (|List| %)) (#1=#:G42 NIL) (|b| NIL) (#2=#:G43 NIL)
          (#3=#:G44 NIL) (|a| NIL) (#4=#:G45 NIL)
          (|m| (|Matrix| (|Fraction| (|Polynomial| R)))))
         (SEQ
          (LETT |listBasis|
                (SPADCALL (SPADCALL (QREFELT % 56)) (QREFELT % 59)))
          (LETT |m|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |b| NIL) (LETT #2# |listBasis|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |a| NIL) (LETT #4# |listBasis|)
                                      G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |a| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL |a| |b|
                                                         (QREFELT % 66))
                                               #3#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#))))
                                #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 62)))
          (EXIT (SPADCALL |m| (QREFELT % 63)))))) 

(SDEFUN |GCNAALG;initializeLeft| ((% (|Void|)))
        (SEQ (SETELT % 71 NIL)
             (SETELT % 70 (SPADCALL (QREFELT % 35) (QREFELT % 72)))
             (EXIT (SPADCALL (QREFELT % 74))))) 

(SDEFUN |GCNAALG;initializeRight| ((% (|Void|)))
        (SEQ (SETELT % 76 NIL)
             (SETELT % 75 (SPADCALL (QREFELT % 35) (QREFELT % 77)))
             (EXIT (SPADCALL (QREFELT % 74))))) 

(SDEFUN |GCNAALG;leftRankPolynomial;Sup;8|
        ((% (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))))
        (SEQ (COND ((QREFELT % 71) (|GCNAALG;initializeLeft| %)))
             (EXIT (QREFELT % 70)))) 

(SDEFUN |GCNAALG;rightRankPolynomial;Sup;9|
        ((% (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))))
        (SEQ (COND ((QREFELT % 76) (|GCNAALG;initializeRight| %)))
             (EXIT (QREFELT % 75)))) 

(SDEFUN |GCNAALG;genericLeftMinimalPolynomial;%Sup;10|
        ((|a| (%))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))))
        (SPROG NIL
               (SEQ (COND ((QREFELT % 71) (|GCNAALG;initializeLeft| %)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GCNAALG;genericLeftMinimalPolynomial;%Sup;10!0|
                            (VECTOR % |a|))
                      (QREFELT % 70) (QREFELT % 81)))))) 

(SDEFUN |GCNAALG;genericLeftMinimalPolynomial;%Sup;10!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GCNAALG;eval| |x| |a| %))))) 

(SDEFUN |GCNAALG;genericRightMinimalPolynomial;%Sup;11|
        ((|a| (%))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))))
        (SPROG NIL
               (SEQ (COND ((QREFELT % 76) (|GCNAALG;initializeRight| %)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GCNAALG;genericRightMinimalPolynomial;%Sup;11!0|
                            (VECTOR % |a|))
                      (QREFELT % 75) (QREFELT % 81)))))) 

(SDEFUN |GCNAALG;genericRightMinimalPolynomial;%Sup;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GCNAALG;eval| |x| |a| %))))) 

(SDEFUN |GCNAALG;genericLeftTrace;%F;12|
        ((|a| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPROG
         ((#1=#:G61 NIL) (|d1| (|NonNegativeInteger|))
          (|rf| (|Fraction| (|Polynomial| R))))
         (SEQ (COND ((QREFELT % 71) (|GCNAALG;initializeLeft| %)))
              (LETT |d1|
                    (PROG1
                        (LETT #1#
                              (- (SPADCALL (QREFELT % 70) (QREFELT % 85)) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |rf| (SPADCALL (QREFELT % 70) |d1| (QREFELT % 86)))
              (LETT |rf| (|GCNAALG;eval| |rf| |a| %))
              (EXIT (SPADCALL |rf| (QREFELT % 87)))))) 

(SDEFUN |GCNAALG;genericRightTrace;%F;13|
        ((|a| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPROG
         ((#1=#:G64 NIL) (|d1| (|NonNegativeInteger|))
          (|rf| (|Fraction| (|Polynomial| R))))
         (SEQ (COND ((QREFELT % 76) (|GCNAALG;initializeRight| %)))
              (LETT |d1|
                    (PROG1
                        (LETT #1#
                              (- (SPADCALL (QREFELT % 75) (QREFELT % 85)) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |rf| (SPADCALL (QREFELT % 75) |d1| (QREFELT % 86)))
              (LETT |rf| (|GCNAALG;eval| |rf| |a| %))
              (EXIT (SPADCALL |rf| (QREFELT % 87)))))) 

(SDEFUN |GCNAALG;genericLeftNorm;%F;14|
        ((|a| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPROG ((|rf| (|Fraction| (|Polynomial| R))))
               (SEQ (COND ((QREFELT % 71) (|GCNAALG;initializeLeft| %)))
                    (LETT |rf| (SPADCALL (QREFELT % 70) 1 (QREFELT % 86)))
                    (COND
                     ((ODDP (SPADCALL (QREFELT % 70) (QREFELT % 85)))
                      (LETT |rf| (SPADCALL |rf| (QREFELT % 87)))))
                    (EXIT |rf|)))) 

(SDEFUN |GCNAALG;genericRightNorm;%F;15|
        ((|a| (%)) (% (|Fraction| (|Polynomial| R))))
        (SPROG ((|rf| (|Fraction| (|Polynomial| R))))
               (SEQ (COND ((QREFELT % 76) (|GCNAALG;initializeRight| %)))
                    (LETT |rf| (SPADCALL (QREFELT % 75) 1 (QREFELT % 86)))
                    (COND
                     ((ODDP (SPADCALL (QREFELT % 75) (QREFELT % 85)))
                      (LETT |rf| (SPADCALL |rf| (QREFELT % 87)))))
                    (EXIT |rf|)))) 

(SDEFUN |GCNAALG;conditionsForIdempotents;VL;16|
        ((|b| (|Vector| %)) (% (|List| (|Polynomial| R))))
        (SPROG ((|x| (%)))
               (SEQ (LETT |x| (SPADCALL |b| (QREFELT % 90)))
                    (EXIT
                     (SPADCALL (ELT % 36)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |x| |x| (QREFELT % 52))
                                           |x| (QREFELT % 91))
                                 |b| (QREFELT % 92))
                                (QREFELT % 39))
                               (QREFELT % 43)))))) 

(SDEFUN |GCNAALG;conditionsForIdempotents;L;17| ((% (|List| (|Polynomial| R))))
        (SPROG ((|x| (%)))
               (SEQ (LETT |x| (QREFELT % 35))
                    (EXIT
                     (SPADCALL (ELT % 36)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |x| |x| (QREFELT % 52))
                                           |x| (QREFELT % 91))
                                 (QREFELT % 37))
                                (QREFELT % 39))
                               (QREFELT % 43)))))) 

(SDEFUN |GCNAALG;generic;%;18| ((% (%))) (QREFELT % 35)) 

(SDEFUN |GCNAALG;generic;VV%;19|
        ((|vs| (|Vector| (|Symbol|))) (|ve| (|Vector| %)) (% (%)))
        (SPROG
         ((#1=#:G87 NIL) (|i| NIL) (#2=#:G88 NIL) (#3=#:G86 NIL)
          (|v| (|Vector| (|Polynomial| R))))
         (SEQ
          (COND
           ((> (QVSIZE |vs|) (SPADCALL |ve| (QREFELT % 96)))
            (|error| "generic: too few symbols"))
           ('T
            (SEQ
             (LETT |v|
                   (PROGN
                    (LETT #1# (GETREFV #4=(SPADCALL |ve| (QREFELT % 96))))
                    (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #1# #3#
                                   (SPADCALL (|spadConstant| % 20)
                                             (LIST
                                              (SPADCALL |vs| |i|
                                                        (QREFELT % 23)))
                                             (LIST 1) (QREFELT % 26)))))
                         (LETT #3#
                               (PROG1 (|inc_SI| #3#)
                                 (LETT |i| (|inc_SI| |i|))))
                         (GO G190) G191 (EXIT NIL))
                    #1#))
             (EXIT
              (SPADCALL (SPADCALL (ELT % 28) |v| (QREFELT % 33)) |ve|
                        (QREFELT % 97))))))))) 

(SDEFUN |GCNAALG;generic;SV%;20| ((|s| (|Symbol|)) (|ve| (|Vector| %)) (% (%)))
        (SPROG
         ((#1=#:G95 NIL) (|q| NIL) (#2=#:G96 NIL) (|lON| (|List| (|String|)))
          (#3=#:G98 NIL) (|i| NIL) (#4=#:G99 NIL) (#5=#:G97 NIL)
          (|sFC| (|Vector| (|Symbol|))))
         (SEQ
          (LETT |lON|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |q| 1) (LETT #2# (SPADCALL |ve| (QREFELT % 96)))
                      G190 (COND ((|greater_SI| |q| #2#) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                      (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |sFC|
                (PROGN
                 (LETT #3# (GETREFV (LENGTH |lON|)))
                 (SEQ (LETT |i| NIL) (LETT #4# |lON|) (LETT #5# 0) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #5#
                                (SPADCALL (STRCONC |s| |i|) (QREFELT % 17)))))
                      (LETT #5# (PROG1 (|inc_SI| #5#) (LETT #4# (CDR #4#))))
                      (GO G190) G191 (EXIT NIL))
                 #3#))
          (EXIT (SPADCALL |sFC| |ve| (QREFELT % 98)))))) 

(SDEFUN |GCNAALG;generic;V%;21| ((|ve| (|Vector| %)) (% (%)))
        (SPROG
         ((#1=#:G109 NIL) (|q| NIL) (#2=#:G110 NIL) (|lON| (|List| (|String|)))
          (#3=#:G112 NIL) (#4=#:G113 NIL) (#5=#:G111 NIL)
          (|sFC| (|Vector| (|Symbol|))) (#6=#:G115 NIL) (|i| NIL)
          (#7=#:G116 NIL) (#8=#:G114 NIL) (|v| (|Vector| (|Polynomial| R))))
         (SEQ
          (LETT |lON|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |q| 1) (LETT #2# (SPADCALL |ve| (QREFELT % 96)))
                      G190 (COND ((|greater_SI| |q| #2#) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                      (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |sFC|
                (PROGN
                 (LETT #3# (GETREFV (LENGTH |lON|)))
                 (SEQ (LETT |i| NIL) (LETT #4# |lON|) (LETT #5# 0) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #5#
                                (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                          (QREFELT % 17)))))
                      (LETT #5# (PROG1 (|inc_SI| #5#) (LETT #4# (CDR #4#))))
                      (GO G190) G191 (EXIT NIL))
                 #3#))
          (LETT |v|
                (PROGN
                 (LETT #6# (GETREFV #9=(SPADCALL |ve| (QREFELT % 96))))
                 (SEQ (LETT |i| 1) (LETT #7# #9#) (LETT #8# 0) G190
                      (COND ((|greater_SI| |i| #7#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #8#
                                (SPADCALL (|spadConstant| % 20)
                                          (LIST
                                           (SPADCALL |sFC| |i| (QREFELT % 23)))
                                          (LIST 1) (QREFELT % 26)))))
                      (LETT #8#
                            (PROG1 (|inc_SI| #8#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (EXIT
           (SPADCALL (SPADCALL (ELT % 28) |v| (QREFELT % 33)) |ve|
                     (QREFELT % 97)))))) 

(SDEFUN |GCNAALG;generic;V%;22| ((|vs| (|Vector| (|Symbol|))) (% (%)))
        (SPADCALL |vs| (SPADCALL (QREFELT % 56)) (QREFELT % 98))) 

(SDEFUN |GCNAALG;generic;S%;23| ((|s| (|Symbol|)) (% (%)))
        (SPADCALL |s| (SPADCALL (QREFELT % 56)) (QREFELT % 99))) 

(DECLAIM (NOTINLINE |GenericNonAssociativeAlgebra;|)) 

(DEFUN |GenericNonAssociativeAlgebra;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL)
    (#1=#:G126 NIL) (|q| NIL) (#2=#:G127 NIL) (#3=#:G129 NIL) (#4=#:G130 NIL)
    (#5=#:G128 NIL) (#6=#:G132 NIL) (|i| NIL) (#7=#:G133 NIL) (#8=#:G131 NIL)
    (|v| NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 |#2|)
     (LETT DV$3 |#3|)
     (LETT DV$4 |#4|)
     (LETT |dv$| (LIST '|GenericNonAssociativeAlgebra| DV$1 DV$2 DV$3 DV$4))
     (LETT % (GETREFV 116))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|IntegralDomain|))
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|Hashable|))
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|Finite|))
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|Field|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))))))
     (|haddProp| |$ConstructorCache| '|GenericNonAssociativeAlgebra|
                 (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (QSETREFV % 8 |#3|)
     (QSETREFV % 9 |#4|)
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 14
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |q| 1) (LETT #2# |#2|) G190
                     (COND ((|greater_SI| |q| #2#) (GO G191)))
                     (SEQ (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                     (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))
     (QSETREFV % 18
               (PROGN
                (LETT #3# (GETREFV (LENGTH #9=(QREFELT % 14))))
                (SEQ (LETT |i| NIL) (LETT #4# #9#) (LETT #5# 0) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #3# #5#
                               (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                         (QREFELT % 17)))))
                     (LETT #5# (PROG1 (|inc_SI| #5#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL))
                #3#))
     (QSETREFV % 35
               (SEQ
                (LETT |v|
                      (PROGN
                       (LETT #6# (GETREFV |#2|))
                       (SEQ (LETT |i| 1) (LETT #7# |#2|) (LETT #8# 0) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT #6# #8#
                                      (SPADCALL (|spadConstant| % 20)
                                                (LIST
                                                 (SPADCALL (QREFELT % 18) |i|
                                                           (QREFELT % 23)))
                                                (LIST 1) (QREFELT % 26)))))
                            (LETT #8#
                                  (PROG1 (|inc_SI| #8#)
                                    (LETT |i| (|inc_SI| |i|))))
                            (GO G190) G191 (EXIT NIL))
                       #6#))
                (EXIT
                 (SPADCALL (SPADCALL (ELT % 28) |v| (QREFELT % 33))
                           (QREFELT % 34)))))
     (COND
      ((|testBitVector| |pv$| 5)
       (PROGN
        (QSETREFV % 54
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericLeftTraceForm;2%F;2|)
                   %))
        (QSETREFV % 64
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericLeftDiscriminant;F;3|)
                   %))
        (QSETREFV % 66
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericRightTraceForm;2%F;4|)
                   %))
        (QSETREFV % 67
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericRightDiscriminant;F;5|)
                   %))
        (QSETREFV % 70 (|spadConstant| % 69))
        (QSETREFV % 71 'T)
        NIL
        (QSETREFV % 75 (|spadConstant| % 69))
        (QSETREFV % 76 'T)
        NIL
        (QSETREFV % 78
                  (CONS (|dispatchFunction| |GCNAALG;leftRankPolynomial;Sup;8|)
                        %))
        (QSETREFV % 79
                  (CONS
                   (|dispatchFunction| |GCNAALG;rightRankPolynomial;Sup;9|) %))
        (QSETREFV % 82
                  (CONS
                   (|dispatchFunction|
                    |GCNAALG;genericLeftMinimalPolynomial;%Sup;10|)
                   %))
        (QSETREFV % 83
                  (CONS
                   (|dispatchFunction|
                    |GCNAALG;genericRightMinimalPolynomial;%Sup;11|)
                   %))
        (QSETREFV % 53
                  (CONS (|dispatchFunction| |GCNAALG;genericLeftTrace;%F;12|)
                        %))
        (QSETREFV % 65
                  (CONS (|dispatchFunction| |GCNAALG;genericRightTrace;%F;13|)
                        %))
        (QSETREFV % 88
                  (CONS (|dispatchFunction| |GCNAALG;genericLeftNorm;%F;14|)
                        %))
        (QSETREFV % 89
                  (CONS (|dispatchFunction| |GCNAALG;genericRightNorm;%F;15|)
                        %)))))
     %)))) 

(DEFUN |GenericNonAssociativeAlgebra| (&REST #1=#:G134)
  (SPROG NIL
         (PROG (#2=#:G135)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL NIL))
                     (HGET |$ConstructorCache| '|GenericNonAssociativeAlgebra|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenericNonAssociativeAlgebra;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenericNonAssociativeAlgebra|)))))))))) 

(MAKEPROP '|GenericNonAssociativeAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|AlgebraGivenByStructuralConstants| 27 (NRTEVAL (QREFELT % 7))
                                                   (NRTEVAL (QREFELT % 8))
                                                   (NRTEVAL
                                                    (SPADCALL (QREFELT % 9)
                                                              (QREFELT % 13))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Vector| 61) (|Vector| (|Matrix| 6))
              (|CoerceVectorMatrixPackage| 6) (0 . |coerce|) '|listOfNumbers|
              (|String|) (|Symbol|) (5 . |coerce|) '|symbolsForCoef|
              (|Polynomial| 6) (10 . |1|) (|Integer|) (|Vector| 16)
              (14 . |elt|) (|List| 16) (|List| 84) (20 . |monomial|)
              (|Fraction| 19) (27 . |coerce|) (|Vector| 27) (|Mapping| 27 19)
              (|Vector| 19) (|VectorFunctions2| 19 27) (32 . |map|)
              (38 . |convert|) '|genericElement| (43 . |numer|)
              (48 . |coordinates|) (|List| 27) (53 . |entries|) (|List| 19)
              (|Mapping| 19 27) (|ListFunctions2| 27 19) (58 . |map|)
              (64 . |entries|) (69 . |elt|) (|Equation| 19) (75 . |equation|)
              (|List| (|Equation| %)) (81 . |eval|) (87 . |denom|) (92 . /)
              (98 . *) (104 . |genericLeftTrace|)
              (109 . |genericLeftTraceForm|) (|Vector| %) (115 . |basis|)
              (|List| $$) (|Vector| $$) (119 . |entries|) (|List| 38)
              (|Matrix| 27) (124 . |matrix|) (129 . |determinant|)
              (134 . |genericLeftDiscriminant|) (138 . |genericRightTrace|)
              (143 . |genericRightTraceForm|)
              (149 . |genericRightDiscriminant|)
              (|SparseUnivariatePolynomial| 27) (153 . |0|) '|leftRankPoly|
              '|initLeft?| (157 . |leftMinimalPolynomial|) (|Void|)
              (162 . |void|) '|rightRankPoly| '|initRight?|
              (166 . |rightMinimalPolynomial|) (171 . |leftRankPolynomial|)
              (175 . |rightRankPolynomial|) (|Mapping| 27 27) (179 . |map|)
              (185 . |genericLeftMinimalPolynomial|)
              (190 . |genericRightMinimalPolynomial|) (|NonNegativeInteger|)
              (195 . |degree|) (200 . |coefficient|) (206 . -)
              (211 . |genericLeftNorm|) (216 . |genericRightNorm|)
              |GCNAALG;generic;V%;21| (221 . -) (227 . |coordinates|)
              |GCNAALG;conditionsForIdempotents;VL;16|
              |GCNAALG;conditionsForIdempotents;L;17| |GCNAALG;generic;%;18|
              (233 . |maxIndex|) (238 . |represents|) |GCNAALG;generic;VV%;19|
              |GCNAALG;generic;SV%;20| |GCNAALG;generic;V%;22|
              |GCNAALG;generic;S%;23| (|Boolean|) (|OutputForm|)
              (|PositiveInteger|) (|Union| % '"failed")
              (|List| (|Polynomial| 27))
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 27)
              (|Record| (|:| |particular| %) (|:| |basis| 112))
              (|Union| 108 '"failed")
              (|SparseUnivariatePolynomial| (|Polynomial| 27)) (|InputForm|)
              (|List| %) (|SingleInteger|) (|HashState|) (|List| 29))
           '#(~= 244 |zero?| 250 |unit| 255 |subtractIfCan| 259
              |structuralConstants| 265 |someBasis| 274 |smaller?| 278 |size|
              284 |sample| 288 |rightUnits| 292 |rightUnit| 296
              |rightTraceMatrix| 300 |rightTrace| 309
              |rightRegularRepresentation| 314 |rightRecip| 325
              |rightRankPolynomial| 330 |rightPower| 338 |rightNorm| 344
              |rightMinimalPolynomial| 349 |rightDiscriminant| 354
              |rightCharacteristicPolynomial| 363 |rightAlternative?| 368
              |represents| 372 |recip| 383 |rank| 388 |random| 392
              |powerAssociative?| 396 |plenaryPower| 400 |opposite?| 406
              |noncommutativeJordanAlgebra?| 412 |lookup| 416 |lieAlgebra?| 421
              |lieAdmissible?| 425 |leftUnits| 429 |leftUnit| 433
              |leftTraceMatrix| 437 |leftTrace| 446 |leftRegularRepresentation|
              451 |leftRecip| 462 |leftRankPolynomial| 467 |leftPower| 475
              |leftNorm| 481 |leftMinimalPolynomial| 486 |leftDiscriminant| 491
              |leftCharacteristicPolynomial| 500 |leftAlternative?| 505 |latex|
              509 |jordanAlgebra?| 514 |jordanAdmissible?| 518
              |jacobiIdentity?| 522 |index| 526 |hashUpdate!| 531 |hash| 537
              |genericRightTraceForm| 542 |genericRightTrace| 548
              |genericRightNorm| 553 |genericRightMinimalPolynomial| 558
              |genericRightDiscriminant| 563 |genericLeftTraceForm| 567
              |genericLeftTrace| 573 |genericLeftNorm| 578
              |genericLeftMinimalPolynomial| 583 |genericLeftDiscriminant| 588
              |generic| 592 |flexible?| 623 |enumerate| 627 |elt| 631
              |coordinates| 637 |convert| 659 |conditionsForIdempotents| 674
              |commutator| 692 |commutative?| 698 |coerce| 702 |basis| 712
              |associatorDependence| 716 |associator| 720 |associative?| 727
              |apply| 731 |antiCommutator| 737 |antiCommutative?| 743
              |antiAssociative?| 747 |alternative?| 751 ^ 755 = 761 |0| 767 -
              771 + 782 * 788)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 3 0 3 0 0 3 0 0 0 2 0 3
                                  1 0 0))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |FramedModule&| NIL NIL NIL |NonAssociativeRng&|
                |AbelianGroup&| |Finite&| NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Magma&| |AbelianSemiGroup&|
                |SetWithZero&| |Hashable&| |SetCategory&| NIL NIL NIL
                |BasicType&|)
             (CONS
              '#((|FramedNonAssociativeAlgebra| (|Fraction| (|Polynomial| 6)))
                 (|FiniteRankNonAssociativeAlgebra|
                  (|Fraction| (|Polynomial| 6)))
                 (|NonAssociativeAlgebra| (|Fraction| (|Polynomial| 6)))
                 (|Module| (|Fraction| (|Polynomial| 6)))
                 (|BiModule| (|Fraction| (|Polynomial| 6))
                             (|Fraction| (|Polynomial| 6)))
                 (|FramedModule| (|Fraction| (|Polynomial| 6)))
                 (|LeftModule| (|Fraction| (|Polynomial| 6)))
                 (|RightModule| (|Fraction| (|Polynomial| 6)))
                 (|LeftModule|
                  (|SquareMatrix| 7 (|Fraction| (|Polynomial| 6))))
                 (|NonAssociativeRng|) (|AbelianGroup|) (|Finite|)
                 (|CancellationAbelianMonoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|ComparableRepresentation|)
                 (|Magma|) (|AbelianSemiGroup|) (|SetWithZero|) (|Hashable|)
                 (|SetCategory|) (|ConvertibleTo| 111) (|unitsKnown|)
                 (|CoercibleTo| 103) (|BasicType|))
              (|makeByteWordVec2| 115
                                  '(1 12 10 11 13 1 16 0 15 17 0 19 0 20 2 22
                                    16 0 21 23 3 19 0 0 24 25 26 1 27 0 19 28 2
                                    32 29 30 31 33 1 0 0 29 34 1 27 19 0 36 1 0
                                    29 0 37 1 29 38 0 39 2 42 40 41 38 43 1 22
                                    24 0 44 2 40 19 0 21 45 2 46 0 19 19 47 2
                                    19 0 0 48 49 1 27 19 0 50 2 27 0 19 19 51 2
                                    0 0 0 0 52 1 0 27 0 53 2 0 27 0 0 54 0 0 55
                                    56 1 58 57 0 59 1 61 0 60 62 1 61 27 0 63 0
                                    0 27 64 1 0 27 0 65 2 0 27 0 0 66 0 0 27 67
                                    0 68 0 69 1 0 68 0 72 0 73 0 74 1 0 68 0 77
                                    0 0 68 78 0 0 68 79 2 68 0 80 0 81 1 0 68 0
                                    82 1 0 68 0 83 1 68 84 0 85 2 68 27 0 84 86
                                    1 27 0 0 87 1 0 27 0 88 1 0 27 0 89 2 0 0 0
                                    0 91 2 0 29 0 55 92 1 58 21 0 96 2 0 0 29
                                    55 97 2 0 102 0 0 1 1 0 102 0 1 0 1 105 1 2
                                    0 105 0 0 1 1 0 10 55 1 0 0 10 1 0 0 55 1 2
                                    3 102 0 0 1 0 3 84 1 0 0 0 1 0 0 109 1 0 1
                                    105 1 1 0 61 55 1 0 0 61 1 1 0 27 0 1 2 0
                                    61 0 55 1 1 0 61 0 1 1 1 105 0 1 0 5 68 79
                                    0 4 110 1 2 0 0 0 104 1 1 0 27 0 1 1 1 68 0
                                    77 1 0 27 55 1 0 0 27 1 1 0 68 0 1 0 0 102
                                    1 2 0 0 29 55 97 1 0 0 29 1 1 1 105 0 1 0 0
                                    104 1 0 3 0 1 0 0 102 1 2 0 0 0 104 1 2 0
                                    102 0 0 1 0 0 102 1 1 3 104 0 1 0 0 102 1 0
                                    0 102 1 0 0 109 1 0 1 105 1 1 0 61 55 1 0 0
                                    61 1 1 0 27 0 1 2 0 61 0 55 1 1 0 61 0 1 1
                                    1 105 0 1 0 5 68 78 0 4 110 1 2 0 0 0 104 1
                                    1 0 27 0 1 1 1 68 0 72 1 0 27 55 1 0 0 27 1
                                    1 0 68 0 1 0 0 102 1 1 0 15 0 1 0 0 102 1 0
                                    0 102 1 0 0 102 1 1 3 0 104 1 2 2 114 114 0
                                    1 1 2 113 0 1 2 5 27 0 0 66 1 5 27 0 65 1 5
                                    27 0 89 1 5 68 0 83 0 5 27 67 2 5 27 0 0 54
                                    1 5 27 0 53 1 5 27 0 88 1 5 68 0 82 0 5 27
                                    64 0 0 0 95 1 0 0 22 100 1 0 0 16 101 2 0 0
                                    16 55 99 1 0 0 55 90 2 0 0 22 55 98 0 0 102
                                    1 0 3 112 1 2 0 27 0 21 1 2 0 29 0 55 92 2
                                    0 61 55 55 1 1 0 61 55 1 1 0 29 0 37 1 0 29
                                    0 1 1 0 0 29 34 1 3 111 0 1 1 0 106 55 1 0
                                    0 106 1 1 5 40 55 93 0 5 40 94 2 0 0 0 0 1
                                    0 0 102 1 1 0 103 0 1 1 0 0 29 1 0 0 55 56
                                    0 1 115 1 3 0 0 0 0 0 1 0 0 102 1 2 0 0 61
                                    0 1 2 0 0 0 0 1 0 0 102 1 0 0 102 1 0 0 102
                                    1 2 0 0 0 104 1 2 0 102 0 0 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 91 2 0 0 0 0 1 2 0 0 104 0 1
                                    2 0 0 0 0 52 2 0 0 21 0 1 2 0 0 84 0 1 2 0
                                    0 0 27 1 2 0 0 27 0 1 2 0 0 107 0 1)))))
           '|lookupComplete|)) 
