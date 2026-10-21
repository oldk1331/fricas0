
(SDEFUN |TWOFACT;pthRoot|
        ((|poly| (|SparseUnivariatePolynomial| F)) (|p| (|NonNegativeInteger|))
         (|PthRootPow| (|NonNegativeInteger|))
         (% (|SparseUnivariatePolynomial| F)))
        (SPROG ((|tmp| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
               (SEQ
                (LETT |tmp|
                      (SPADCALL
                       (SPADCALL
                        (CONS #'|TWOFACT;pthRoot!0| (VECTOR % |PthRootPow|))
                        |poly| (QREFELT % 11))
                       |p| (QREFELT % 13)))
                (EXIT
                 (COND
                  ((QEQCAR |tmp| 1) (|error| "consistency error in TwoFactor"))
                  ('T (QCDR |tmp|))))))) 

(SDEFUN |TWOFACT;pthRoot!0| ((|x| NIL) ($$ NIL))
        (PROG (|PthRootPow| %)
          (LETT |PthRootPow| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |PthRootPow| (QREFELT % 8)))))) 

(SDEFUN |TWOFACT;tryTwoFactor;SupF;2|
        ((|m| (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (|TWOFACT;doTwoFactor| |m| NIL %)) 

(SDEFUN |TWOFACT;generalTwoFactor;SupF;3|
        ((|m| (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (|TWOFACT;doTwoFactor| |m| 'T %)) 

(SDEFUN |TWOFACT;doTwoFactor|
        ((|m| (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|do_ext| (|Boolean|))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|l| #1=(|Factored| (|SparseUnivariatePolynomial| F))) (#2=#:G91 NIL)
          (#3=#:G92 NIL) (|cont| (|SparseUnivariatePolynomial| F))
          (|contfact| #1#) (#4=#:G93 NIL) (#5=#:G94 NIL)
          (|sqfrm|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|u| NIL) (#6=#:G95 NIL) (|expon| (|NonNegativeInteger|))
          (|fac|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|p| (|NonNegativeInteger|)) (#7=#:G64 NIL)
          (|PthRootPow| (|NonNegativeInteger|))
          (|m1|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            "failed"))
          (|res|
           #8=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#9=#:G96 NIL) (#10=#:G97 NIL) (|m2| #8#) (#11=#:G98 NIL)
          (#12=#:G99 NIL) (|w| NIL) (#13=#:G100 NIL)
          (#14=#:G77 #15=(|NonNegativeInteger|)) (#16=#:G75 #15#)
          (#17=#:G76 NIL) (|ydeg| #15#)
          (|twoF|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|nfl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#18=#:G90 NIL)
          (|unitPart|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#19=#:G101 NIL) (|v| NIL) (#20=#:G102 NIL)
          (|ll|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |m| (|spadConstant| % 20) (QREFELT % 22))
             (|spadConstant| % 23))
            ((EQL (SPADCALL |m| (QREFELT % 24)) 0)
             (SEQ
              (LETT |l|
                    (SPADCALL (SPADCALL |m| (QREFELT % 25)) (QREFELT % 28)))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |l| (QREFELT % 29)) (QREFELT % 30))
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |u| NIL) (LETT #3# (SPADCALL |l| (QREFELT % 34)))
                      G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (QVELT |u| 0)
                                       (SPADCALL (QVELT |u| 1) (QREFELT % 30))
                                       (QVELT |u| 2))
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT % 37)))))
            (#21='T
             (SEQ (LETT |ll| NIL) (LETT |cont| (SPADCALL |m| (QREFELT % 38)))
                  (COND
                   ((> (SPADCALL |cont| (QREFELT % 39)) 0)
                    (SEQ (LETT |m1| (SPADCALL |m| |cont| (QREFELT % 40)))
                         (EXIT
                          (COND
                           ((QEQCAR |m1| 1) (|error| "content doesn't divide"))
                           (#21#
                            (SEQ (LETT |m| (QCDR |m1|))
                                 (LETT |contfact|
                                       (SPADCALL |cont| (QREFELT % 28)))
                                 (LETT |unitPart|
                                       (SPADCALL
                                        (SPADCALL |contfact| (QREFELT % 29))
                                        (QREFELT % 30)))
                                 (EXIT
                                  (LETT |ll|
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |w| NIL)
                                              (LETT #5#
                                                    (SPADCALL |contfact|
                                                              (QREFELT % 34)))
                                              G190
                                              (COND
                                               ((OR (ATOM #5#)
                                                    (PROGN
                                                     (LETT |w| (CAR #5#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (VECTOR (QVELT |w| 0)
                                                               (SPADCALL
                                                                (QVELT |w| 1)
                                                                (QREFELT % 30))
                                                               (QVELT |w| 2))
                                                       #4#))))
                                              (LETT #5# (CDR #5#)) (GO G190)
                                              G191
                                              (EXIT (NREVERSE #4#))))))))))))
                   (#21# (LETT |unitPart| (SPADCALL |cont| (QREFELT % 30)))))
                  (LETT |sqfrm| (SPADCALL |m| (QREFELT % 42)))
                  (SEQ (LETT |u| NIL)
                       (LETT #6# (SPADCALL |sqfrm| (QREFELT % 43))) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |expon| (QVELT |u| 2))
                            (LETT |fac| (QVELT |u| 1))
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |fac| (QREFELT % 24)) 1)
                               (LETT |ll|
                                     (CONS
                                      (VECTOR (CONS 3 "prime") |fac| |expon|)
                                      |ll|)))
                              ((SPADCALL (SPADCALL |fac| (QREFELT % 44))
                                         (|spadConstant| % 20) (QREFELT % 22))
                               (COND
                                ((SPADCALL
                                  (SPADCALL (ELT % 46) |fac| (QREFELT % 48))
                                  (|spadConstant| % 20) (QREFELT % 22))
                                 (SEQ (LETT |p| (SPADCALL (QREFELT % 49)))
                                      (LETT |PthRootPow|
                                            (PROG2
                                                (LETT #7#
                                                      (|exquo_INT|
                                                       (SPADCALL
                                                        (QREFELT % 50))
                                                       |p|))
                                                (QCDR #7#)
                                              (|check_union2| (QEQCAR #7# 0)
                                                              (|NonNegativeInteger|)
                                                              (|Union|
                                                               (|NonNegativeInteger|)
                                                               "failed")
                                                              #7#)))
                                      (LETT |m1|
                                            (SPADCALL
                                             (SPADCALL
                                              (CONS #'|TWOFACT;doTwoFactor!0|
                                                    (VECTOR % |PthRootPow|
                                                            |p|))
                                              |fac| (QREFELT % 48))
                                             |p| (QREFELT % 51)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |m1| 1)
                                         (|error|
                                          "consistency error in TwoFactor"))
                                        ('T
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL (QCDR |m1|)
                                                          (QREFELT % 17)))
                                          (LETT |unitPart|
                                                (SPADCALL |unitPart|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (QREFELT %
                                                                              52))
                                                           (* |p| |expon|)
                                                           (QREFELT % 53))
                                                          (QREFELT % 54)))
                                          (EXIT
                                           (LETT |ll|
                                                 (SPADCALL
                                                  (PROGN
                                                   (LETT #9# NIL)
                                                   (SEQ (LETT |v| NIL)
                                                        (LETT #10#
                                                              (SPADCALL |res|
                                                                        (QREFELT
                                                                         %
                                                                         43)))
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #10#)
                                                              (PROGN
                                                               (LETT |v|
                                                                     (CAR
                                                                      #10#))
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #9#
                                                                (CONS
                                                                 (VECTOR
                                                                  (QVELT |v| 0)
                                                                  (QVELT |v| 1)
                                                                  (*
                                                                   (* |expon|
                                                                      |p|)
                                                                   (QVELT |v|
                                                                          2)))
                                                                 #9#))))
                                                        (LETT #10# (CDR #10#))
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #9#))))
                                                  |ll| (QREFELT % 55))))))))))
                                ('T
                                 (SEQ
                                  (LETT |m2|
                                        (SPADCALL
                                         (SPADCALL |fac| (QREFELT % 57))
                                         (QREFELT % 17)))
                                  (LETT |unitPart|
                                        (SPADCALL |unitPart|
                                                  (SPADCALL
                                                   (SPADCALL |m2|
                                                             (QREFELT % 52))
                                                   |expon| (QREFELT % 53))
                                                  (QREFELT % 54)))
                                  (EXIT
                                   (LETT |ll|
                                         (SPADCALL
                                          (PROGN
                                           (LETT #11# NIL)
                                           (SEQ (LETT |v| NIL)
                                                (LETT #12#
                                                      (SPADCALL |m2|
                                                                (QREFELT %
                                                                         43)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #12#)
                                                      (PROGN
                                                       (LETT |v| (CAR #12#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #11#
                                                        (CONS
                                                         (VECTOR (QVELT |v| 0)
                                                                 (SPADCALL
                                                                  (QVELT |v| 1)
                                                                  (QREFELT %
                                                                           57))
                                                                 (* |expon|
                                                                    (QVELT |v|
                                                                           2)))
                                                         #11#))))
                                                (LETT #12# (CDR #12#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #11#))))
                                          |ll| (QREFELT % 55))))))))
                              ('T
                               (SEQ
                                (LETT |ydeg|
                                      (PROGN
                                       (LETT #17# NIL)
                                       (SEQ (LETT |w| NIL)
                                            (LETT #13#
                                                  (SPADCALL |fac|
                                                            (QREFELT % 59)))
                                            G190
                                            (COND
                                             ((OR (ATOM #13#)
                                                  (PROGN
                                                   (LETT |w| (CAR #13#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #14#
                                                     (SPADCALL |w|
                                                               (QREFELT % 39)))
                                               (COND
                                                (#17#
                                                 (LETT #16# (MAX #16# #14#)))
                                                ('T
                                                 (PROGN
                                                  (LETT #16# #14#)
                                                  (LETT #17# 'T)))))))
                                            (LETT #13# (CDR #13#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (COND (#17# #16#)
                                             ('T (|IdentityError| '|max|)))))
                                (LETT |twoF|
                                      (SPADCALL |fac| |ydeg| |do_ext|
                                                (QREFELT % 61)))
                                (LETT |nfl| (SPADCALL |twoF| (QREFELT % 43)))
                                (COND
                                 ((EQL (LENGTH |nfl|) 1)
                                  (COND
                                   ((QEQCAR
                                     (QVELT (SPADCALL |nfl| 1 (QREFELT % 64))
                                            0)
                                     0)
                                    (EXIT
                                     (PROGN
                                      (LETT #18# |twoF|)
                                      (GO #22=#:G89)))))))
                                (LETT |unitPart|
                                      (SPADCALL |unitPart|
                                                (SPADCALL
                                                 (SPADCALL |twoF|
                                                           (QREFELT % 52))
                                                 |expon| (QREFELT % 53))
                                                (QREFELT % 54)))
                                (EXIT
                                 (LETT |ll|
                                       (SPADCALL
                                        (PROGN
                                         (LETT #19# NIL)
                                         (SEQ (LETT |v| NIL)
                                              (LETT #20#
                                                    (SPADCALL |twoF|
                                                              (QREFELT % 43)))
                                              G190
                                              (COND
                                               ((OR (ATOM #20#)
                                                    (PROGN
                                                     (LETT |v| (CAR #20#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #19#
                                                      (CONS
                                                       (VECTOR (QVELT |v| 0)
                                                               (QVELT |v| 1)
                                                               (* |expon|
                                                                  (QVELT |v|
                                                                         2)))
                                                       #19#))))
                                              (LETT #20# (CDR #20#)) (GO G190)
                                              G191 (EXIT (NREVERSE #19#))))
                                        |ll| (QREFELT % 55)))))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |unitPart| |ll| (QREFELT % 37)))))))
          #22# (EXIT #18#)))) 

(SDEFUN |TWOFACT;doTwoFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| |PthRootPow| %)
          (LETT |p| (QREFELT $$ 2))
          (LETT |PthRootPow| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|TWOFACT;pthRoot| |x| |p| |PthRootPow| %))))) 

(SDEFUN |TWOFACT;doExtension1|
        ((|m|
          #1=(|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|n| (|PositiveInteger|)) (|dx| (|Integer|))
         (|extField| (|FiniteAlgebraicExtensionField| F))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|SUEx|
           (|Join| (|UnivariatePolynomialCategory| |extField|)
                   (CATEGORY |domain|
                    #2=(SIGNATURE |outputForm|
                        ((|OutputForm|) % (|OutputForm|)))
                    (IF (|has| |extField| . #3=((|Canonical|)))
                        . #4=((ATTRIBUTE (|Canonical|)) |noBranch|)))))
          (TP
           (|Join| (|UnivariatePolynomialCategory| |SUEx|)
                   (CATEGORY |domain| #2#
                    (IF (|has| |SUEx| . #3#)
                        . #4#))))
          (|mm| (TP)) (|m1| #1#)
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| |extField|))))
          (|flist|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #5="nil" #6="sqfr" #7="irred" #8="prime"))
             (|:| |factor|
                  #9=(|SparseUnivariatePolynomial|
                      (|SparseUnivariatePolynomial| |extField|)))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|Normp|
           (CATEGORY |package| (SIGNATURE |normFactors| ((|List| TP) TP))
            (SIGNATURE |retractIfCan|
             ((|Union|
               (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
               "failed")
              TP))
            (SIGNATURE |Frobenius| (TP TP))))
          (#10=#:G139 NIL) (|fac| NIL) (#11=#:G140 NIL) (|c| (|extField|))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| |extField|)))
          (|ffu|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            #12="failed"))
          (#13=#:G138 NIL) (|normfacs| (|List| TP)) (#14=#:G141 NIL) (|g| NIL)
          (#15=#:G142 NIL) (|lfacth| (|List| #9#)) (#16=#:G0 NIL)
          (#17=#:G143 NIL) (#18=#:G129 (TP)) (#19=#:G127 (TP)) (#20=#:G128 NIL)
          (|ffn| (TP)) (#21=#:G121 NIL)
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ff1| NIL) (#22=#:G144 NIL)
          (#23=#:G134
           #24=(|Factored|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| F))))
          (#25=#:G132 #24#) (#26=#:G133 NIL))
         (SEQ (LETT |SUEx| (|SparseUnivariatePolynomial| |extField|))
              (LETT TP (|SparseUnivariatePolynomial| |SUEx|))
              (LETT |mm| (SPADCALL (|compiledLookupCheck| '|0| (LIST '%) TP)))
              (LETT |m1| |m|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |m1| (|spadConstant| % 20) (QREFELT % 65)))
                     (GO G191)))
                   (SEQ
                    (LETT |mm|
                          (SPADCALL |mm|
                                    (SPADCALL
                                     (SPADCALL
                                      (|compiledLookupCheck| '|coerce|
                                                             (LIST '%
                                                                   (|devaluate|
                                                                    (ELT % 6)))
                                                             |extField|)
                                      (SPADCALL |m1| (QREFELT % 25))
                                      (|compiledLookupCheck| '|map|
                                                             (LIST
                                                              (|devaluate|
                                                               |SUEx|)
                                                              (LIST '|Mapping|
                                                                    (|devaluate|
                                                                     |extField|)
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6)))
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                (ELT % 6))))
                                                             (|UnivariatePolynomialCategoryFunctions2|
                                                              (ELT % 6)
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT % 6))
                                                              |extField|
                                                              |SUEx|)))
                                     (SPADCALL |m1| (QREFELT % 24))
                                     (|compiledLookupCheck| '|monomial|
                                                            (LIST '%
                                                                  (|devaluate|
                                                                   |SUEx|)
                                                                  (LIST
                                                                   '|NonNegativeInteger|))
                                                            TP))
                                    (|compiledLookupCheck| '+ (LIST '% '% '%)
                                                           TP)))
                    (EXIT (LETT |m1| (SPADCALL |m1| (QREFELT % 66)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |res1|
                    (SPADCALL |mm| |dx| NIL
                              (|compiledLookupCheck| '|doFactor|
                                                     (LIST
                                                      (LIST '|Factored|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate|
                                                               |extField|))))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         |extField|)))
                                                      (LIST '|Integer|)
                                                      (LIST '|Boolean|))
                                                     (|TwoFactorize|
                                                      |extField|))))
              (LETT |flist|
                    (SPADCALL |res1|
                              (|compiledLookupCheck| '|factorList|
                                                     (LIST
                                                      (LIST '|List|
                                                            (LIST '|Record|
                                                                  (LIST '|:|
                                                                        '|flag|
                                                                        (LIST
                                                                         '|Union|
                                                                         '#5#
                                                                         '#6#
                                                                         '#7#
                                                                         '#8#))
                                                                  (LIST '|:|
                                                                        '|factor|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           |extField|))))
                                                                  (LIST '|:|
                                                                        '|exponent|
                                                                        (LIST
                                                                         '|NonNegativeInteger|))))
                                                      '%)
                                                     (|Factored|
                                                      (|SparseUnivariatePolynomial|
                                                       (|SparseUnivariatePolynomial|
                                                        |extField|))))))
              (EXIT
               (COND
                ((EQL (LENGTH |flist|) 1)
                 (COND
                  ((SPADCALL (QVELT (|SPADfirst| |flist|) 0) (CONS 3 "prime")
                             (QREFELT % 67))
                   (SPADCALL |m| 1 (QREFELT % 68)))
                  (#27='T (SPADCALL |m| 1 (QREFELT % 69)))))
                (#27#
                 (SEQ
                  (LETT |Normp|
                        (|NormRetractPackage| (QREFELT % 6) |extField| |SUEx|
                                              TP |n|))
                  (LETT |lfacth|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |fac| NIL) (LETT #11# |flist|) G190
                              (COND
                               ((OR (ATOM #11#)
                                    (PROGN (LETT |fac| (CAR #11#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT (LETT #10# (CONS (QVELT |fac| 1) #10#))))
                              (LETT #11# (CDR #11#)) (GO G190) G191
                              (EXIT (NREVERSE #10#)))))
                  (LETT |lfactk| NIL)
                  (SEQ G190 (COND ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |ff| (|SPADfirst| |lfacth|))
                              (LETT |lfacth| (CDR |lfacth|))
                              (COND
                               ((SPADCALL
                                 (LETT |c|
                                       (SPADCALL
                                        (SPADCALL |ff|
                                                  (|compiledLookupCheck|
                                                   '|leadingCoefficient|
                                                   (LIST
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| |extField|))
                                                    '%)
                                                   (|SparseUnivariatePolynomial|
                                                    (|SparseUnivariatePolynomial|
                                                     |extField|))))
                                        (|compiledLookupCheck|
                                         '|leadingCoefficient|
                                         (LIST (|devaluate| |extField|) '%)
                                         |SUEx|)))
                                 (SPADCALL
                                  (|compiledLookupCheck| '|1| (LIST '%)
                                                         |extField|))
                                 (|compiledLookupCheck| '~=
                                                        (LIST (LIST '|Boolean|)
                                                              '% '%)
                                                        |extField|))
                                (LETT |ff|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |c|
                                                  (|compiledLookupCheck| '|inv|
                                                                         (LIST
                                                                          '%
                                                                          '%)
                                                                         |extField|))
                                        (|compiledLookupCheck| '|coerce|
                                                               (LIST '%
                                                                     (|devaluate|
                                                                      |extField|))
                                                               |SUEx|))
                                       |ff|
                                       (|compiledLookupCheck| '*
                                                              (LIST '%
                                                                    (|devaluate|
                                                                     |SUEx|)
                                                                    '%)
                                                              TP)))))
                              (SEQ
                               (LETT |ffu|
                                     (SPADCALL |ff|
                                               (|compiledLookupCheck|
                                                '|retractIfCan|
                                                (LIST
                                                 (LIST '|Union|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT % 6))))
                                                       '#12#)
                                                 (|devaluate| TP))
                                                |Normp|)))
                               (EXIT
                                (COND
                                 ((NULL (QEQCAR |ffu| 1))
                                  (PROGN
                                   (LETT #13#
                                         (LETT |lfactk|
                                               (CONS (QCDR |ffu|) |lfactk|)))
                                   (GO #28=#:G130))))))
                              (LETT |normfacs|
                                    (SPADCALL |ff|
                                              (|compiledLookupCheck|
                                               '|normFactors|
                                               (LIST
                                                (LIST '|List| (|devaluate| TP))
                                                (|devaluate| TP))
                                               |Normp|)))
                              (LETT |lfacth|
                                    (PROGN
                                     (LETT #14# NIL)
                                     (SEQ (LETT |g| NIL) (LETT #15# |lfacth|)
                                          G190
                                          (COND
                                           ((OR (ATOM #15#)
                                                (PROGN
                                                 (LETT |g| (CAR #15#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((NULL
                                               (SPADCALL |g| |normfacs|
                                                         (|compiledLookupCheck|
                                                          '|member?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |extField|)))
                                                           '%)
                                                          (|List|
                                                           (|SparseUnivariatePolynomial|
                                                            (|SparseUnivariatePolynomial|
                                                             |extField|))))))
                                              (LETT #14# (CONS |g| #14#))))))
                                          (LETT #15# (CDR #15#)) (GO G190) G191
                                          (EXIT (NREVERSE #14#)))))
                              (LETT |ffn|
                                    (PROGN
                                     (LETT #20# NIL)
                                     (SEQ (LETT #16# NIL)
                                          (LETT #17# |normfacs|) G190
                                          (COND
                                           ((OR (ATOM #17#)
                                                (PROGN
                                                 (LETT #16# (CAR #17#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #18# #16#)
                                             (COND
                                              (#20#
                                               (LETT #19#
                                                     (SPADCALL #19# #18#
                                                               (|compiledLookupCheck|
                                                                '*
                                                                (LIST '% '% '%)
                                                                TP))))
                                              ('T
                                               (PROGN
                                                (LETT #19# #18#)
                                                (LETT #20# 'T)))))))
                                          (LETT #17# (CDR #17#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#20# #19#)
                                           ('T
                                            (SPADCALL
                                             (|compiledLookupCheck| '|1|
                                                                    (LIST '%)
                                                                    TP))))))
                              (EXIT
                               (LETT |lfactk|
                                     (CONS
                                      (PROG2
                                          (LETT #21#
                                                (SPADCALL |ffn|
                                                          (|compiledLookupCheck|
                                                           '|retractIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6))))
                                                                  '#12#)
                                                            (|devaluate| TP))
                                                           |Normp|)))
                                          (QCDR #21#)
                                        (|check_union2| (QEQCAR #21# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 6)))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 6)))
                                                         #12#)
                                                        #21#))
                                      |lfactk|)))))
                        #28# (EXIT #13#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (PROGN
                    (LETT #26# NIL)
                    (SEQ (LETT |ff1| NIL) (LETT #22# |lfactk|) G190
                         (COND
                          ((OR (ATOM #22#) (PROGN (LETT |ff1| (CAR #22#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #23# (SPADCALL |ff1| 1 (QREFELT % 68)))
                            (COND
                             (#26#
                              (LETT #25# (SPADCALL #25# #23# (QREFELT % 70))))
                             ('T (PROGN (LETT #25# #23#) (LETT #26# 'T)))))))
                         (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))
                    (COND (#26# #25#) (#27# (|spadConstant| % 71)))))))))))) 

(SDEFUN |TWOFACT;doExtension|
        ((|m| (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|dx| (|Integer|))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|ln| (|List| (|PositiveInteger|))) (|n| NIL) (#1=#:G158 NIL)
          (|nsize| (|NonNegativeInteger|))
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#2=#:G157 NIL) (#3=#:G156 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ln| (LIST 2 3 5 7 9 11 13 17 19 23 29))
                (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |nsize| (EXPT (SPADCALL (QREFELT % 50)) |n|))
                            (LETT |res1|
                                  (COND
                                   ((< |nsize| 1000)
                                    (|TWOFACT;doExtension1| |m| |n| |dx|
                                     (|FiniteFieldCyclicGroupExtension|
                                      (QREFELT % 6) |n|)
                                     %))
                                   ('T
                                    (|TWOFACT;doExtension1| |m| |n| |dx|
                                     (|FiniteFieldExtension| (QREFELT % 6) |n|)
                                     %))))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QVELT
                                 (|SPADfirst| (SPADCALL |res1| (QREFELT % 43)))
                                 0)
                                (CONS 3 "prime") (QREFELT % 67))
                               (PROGN
                                (LETT #3#
                                      (PROGN (LETT #2# |res1|) (GO #4=#:G155)))
                                (GO #5=#:G152)))))))
                      #5# (EXIT #3#))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "doExtension : Impossible"))))
          #4# (EXIT #2#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;7|
        ((|m| (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|dx| (|Integer|)) (|do_ext| (|Boolean|))
         (%
          (|Factored|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|try_max| (|Integer|)) (|lcm| (|SparseUnivariatePolynomial| F))
          (|use_random| (|Boolean|)) (|i| (|Integer|)) (|val| (F))
          (|umv| (|SparseUnivariatePolynomial| F)) (|look| (|Boolean|))
          (#1=#:G185 NIL) (|prime| (|SparseUnivariatePolynomial| F))
          (|fumv| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|lfact1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#2=#:G186 NIL) (|lf| NIL) (#3=#:G187 NIL)
          (|lfact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#4=#:G172 NIL) (|dx1| (|PositiveInteger|))
          (|lfacth|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|c| (F))
          (|ff|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ff1| NIL) (#5=#:G188 NIL)
          (#6=#:G180
           #7=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#8=#:G178 #7#) (#9=#:G179 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |look| 'T)
                (LETT |try_max| (MIN (+ |dx| 5) (SPADCALL (QREFELT % 50))))
                (LETT |i| 0) (LETT |lcm| (SPADCALL |m| (QREFELT % 25)))
                (LETT |use_random|
                      (< (* 2 |try_max|) (SPADCALL (QREFELT % 50))))
                (SEQ G190
                     (COND
                      ((NULL (COND (|look| (< |i| |try_max|)) ('T NIL)))
                       (GO G191)))
                     (SEQ (LETT |i| (+ |i| 1))
                          (COND
                           (|use_random|
                            (LETT |val| (SPADCALL (QREFELT % 72))))
                           ('T (LETT |val| (SPADCALL |i| (QREFELT % 74)))))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |lcm| |val| (QREFELT % 75))
                                       (QREFELT % 76))
                             "next value")
                            ('T
                             (SEQ
                              (LETT |umv|
                                    (SPADCALL
                                     (CONS #'|TWOFACT;doFactor;SupIBF;7!0|
                                           (VECTOR % |val|))
                                     |m| (QREFELT % 79)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |umv|
                                             (SPADCALL |umv| (QREFELT % 46))
                                             (QREFELT % 80))
                                   (QREFELT % 39))
                                  0 (QREFELT % 81))
                                 "next val")
                                ('T (LETT |look| NIL)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 (|look|
                  (COND
                   ((NULL |do_ext|)
                    (EXIT
                     (PROGN
                      (LETT #1# (SPADCALL |m| 1 (QREFELT % 69)))
                      (GO #10=#:G184)))))))
                (EXIT
                 (COND (|look| (|TWOFACT;doExtension| |m| |dx| %))
                       (#11='T
                        (SEQ
                         (LETT |prime|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 62) 1
                                          (QREFELT % 82))
                                (SPADCALL |val| 0 (QREFELT % 82))
                                (QREFELT % 83)))
                         (LETT |fumv| (SPADCALL |umv| (QREFELT % 28)))
                         (LETT |lfact1| (SPADCALL |fumv| (QREFELT % 34)))
                         (EXIT
                          (COND
                           ((EQL (LENGTH |lfact1|) 1)
                            (SPADCALL |m| 1 (QREFELT % 68)))
                           (#11#
                            (SEQ
                             (LETT |lfact|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |lf| NIL) (LETT #3# |lfact1|)
                                         G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |lf| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL (ELT % 84)
                                                            (QVELT |lf| 1)
                                                            (QREFELT % 87))
                                                  #2#))))
                                         (LETT #3# (CDR #3#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#)))))
                             (LETT |lfact|
                                   (CONS
                                    (SPADCALL (ELT % 84)
                                              (SPADCALL |fumv| (QREFELT % 29))
                                              (QREFELT % 87))
                                    |lfact|))
                             (LETT |dx1|
                                   (PROG1 (LETT #4# (+ |dx| 1))
                                     (|check_subtype2| (> #4# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #4#)))
                             (LETT |lfacth|
                                   (SPADCALL |m| |lfact| |prime| |dx1|
                                             (QREFELT % 90)))
                             (LETT |lfactk| NIL)
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                                  (SEQ (LETT |ff| (|SPADfirst| |lfacth|))
                                       (LETT |lfacth| (CDR |lfacth|))
                                       (COND
                                        ((SPADCALL
                                          (LETT |c|
                                                (SPADCALL
                                                 (SPADCALL |ff| (QREFELT % 25))
                                                 (QREFELT % 91)))
                                          (|spadConstant| % 62) (QREFELT % 92))
                                         (LETT |ff|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |c| (QREFELT % 93))
                                                 (QREFELT % 84))
                                                |ff| (QREFELT % 94)))))
                                       (EXIT
                                        (LETT |lfactk| (CONS |ff| |lfactk|))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (PROGN
                               (LETT #9# NIL)
                               (SEQ (LETT |ff1| NIL) (LETT #5# |lfactk|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |ff1| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #6#
                                             (SPADCALL |ff1| 1 (QREFELT % 68)))
                                       (COND
                                        (#9#
                                         (LETT #8#
                                               (SPADCALL #8# #6#
                                                         (QREFELT % 70))))
                                        ('T
                                         (PROGN
                                          (LETT #8# #6#)
                                          (LETT #9# 'T)))))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#9# #8#)
                                     (#11# (|spadConstant| % 71)))))))))))))))
          #10# (EXIT #1#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;7!0| ((|x| NIL) ($$ NIL))
        (PROG (|val| %)
          (LETT |val| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |val| (QREFELT % 75)))))) 

(DECLAIM (NOTINLINE |TwoFactorize;|)) 

(DEFUN |TwoFactorize;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TwoFactorize| DV$1))
          (LETT % (GETREFV 95))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TwoFactorize| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |TwoFactorize| (#1=#:G189)
  (SPROG NIL
         (PROG (#2=#:G190)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TwoFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TwoFactorize;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TwoFactorize|)))))))))) 

(MAKEPROP '|TwoFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . ^) (|Mapping| 6 6) (|SparseUnivariatePolynomial| 6)
              (6 . |map|) (|Union| % '"failed") (12 . |divideExponents|)
              (|Factored| 15) (|SparseUnivariatePolynomial| 10)
              |TWOFACT;tryTwoFactor;SupF;2| |TWOFACT;generalTwoFactor;SupF;3|
              (18 . |0|) (22 . |0|) (26 . |0|) (|Boolean|) (30 . =) (36 . |0|)
              (40 . |degree|) (45 . |leadingCoefficient|) (|Factored| 10)
              (|UnivariateFiniteFieldFactorize| 6 10) (50 . |factor|)
              (55 . |unit|) (60 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 31) (|:| |factor| 10) (|:| |exponent| 7))
              (|List| 32) (65 . |factorList|)
              (|Record| (|:| |flag| 31) (|:| |factor| 15) (|:| |exponent| 7))
              (|List| 35) (70 . |makeFR|) (76 . |content|) (81 . |degree|)
              (86 . |exquo|) (|Factored| %) (92 . |squareFree|)
              (97 . |factorList|) (102 . |differentiate|)
              (107 . |differentiate|) (112 . |differentiate|) (|Mapping| 10 10)
              (117 . |map|) (123 . |characteristic|) (127 . |size|)
              (131 . |divideExponents|) (137 . |unit|) (142 . ^) (148 . *)
              (154 . |append|) (|CommuteUnivariatePolynomialCategory| 6 10 15)
              (160 . |swap|) (|List| 10) (165 . |coefficients|) (|Integer|)
              |TWOFACT;doFactor;SupIBF;7| (170 . |1|) (174 . |1|) (178 . |elt|)
              (184 . ~=) (190 . |reductum|) (195 . =) (201 . |primeFactor|)
              (207 . |nilFactor|) (213 . *) (219 . |1|) (223 . |random|)
              (|PositiveInteger|) (227 . |index|) (232 . |elt|) (238 . |zero?|)
              (|Mapping| 6 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 15 6 10)
              (243 . |map|) (249 . |gcd|) (255 . ~=) (261 . |monomial|)
              (267 . -) (273 . |coerce|) (|Mapping| 10 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 10 10 15)
              (278 . |map|) (|List| 15) (|GeneralHenselPackage| 10 15)
              (284 . |completeHensel|) (292 . |leadingCoefficient|) (297 . ~=)
              (303 . |inv|) (308 . *))
           '#(|tryTwoFactor| 314 |generalTwoFactor| 319 |doFactor| 324) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|generalTwoFactor|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|SparseUnivariatePolynomial|
                                   (|SparseUnivariatePolynomial| |#1|))))
                                T)
                              '((|tryTwoFactor|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|SparseUnivariatePolynomial|
                                   (|SparseUnivariatePolynomial| |#1|))))
                                T)
                              '((|doFactor|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial|
                                    (|SparseUnivariatePolynomial| |#1|)))
                                  (|SparseUnivariatePolynomial|
                                   (|SparseUnivariatePolynomial| |#1|))
                                  (|Integer|) (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 94
                                            '(2 6 0 0 7 8 2 10 0 9 0 11 2 10 12
                                              0 7 13 0 6 0 18 0 10 0 19 0 15 0
                                              20 2 15 21 0 0 22 0 14 0 23 1 15
                                              7 0 24 1 15 10 0 25 1 27 26 10 28
                                              1 26 10 0 29 1 15 0 10 30 1 26 33
                                              0 34 2 14 0 15 36 37 1 15 10 0 38
                                              1 10 7 0 39 2 15 12 0 10 40 1 15
                                              41 0 42 1 14 36 0 43 1 15 0 0 44
                                              1 6 0 0 45 1 10 0 0 46 2 15 0 47
                                              0 48 0 6 7 49 0 6 7 50 2 15 12 0
                                              7 51 1 14 15 0 52 2 15 0 0 7 53 2
                                              15 0 0 0 54 2 36 0 0 0 55 1 56 15
                                              15 57 1 15 58 0 59 0 6 0 62 0 10
                                              0 63 2 36 35 0 60 64 2 15 21 0 0
                                              65 1 15 0 0 66 2 31 21 0 0 67 2
                                              14 0 15 7 68 2 14 0 15 7 69 2 14
                                              0 0 0 70 0 14 0 71 0 6 0 72 1 6 0
                                              73 74 2 10 6 0 6 75 1 6 21 0 76 2
                                              78 10 77 15 79 2 10 0 0 0 80 2 7
                                              21 0 0 81 2 10 0 6 7 82 2 10 0 0
                                              0 83 1 10 0 6 84 2 86 15 85 10 87
                                              4 89 88 15 88 10 73 90 1 10 6 0
                                              91 2 6 21 0 0 92 1 6 0 0 93 2 15
                                              0 10 0 94 1 0 14 15 16 1 0 14 15
                                              17 3 0 14 15 60 21 61)))))
           '|lookupComplete|)) 
