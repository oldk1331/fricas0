
(MAKEPROP '|GSERIES;coerce;Ups%;1| '|SPADreplace| '(XLAM (|upxs|) |upxs|)) 

(SDEFUN |GSERIES;coerce;Ups%;1|
        ((|upxs| (|UnivariatePuiseuxSeries| |Coef| |var| |cen|)) (% (%)))
        |upxs|) 

(MAKEPROP '|GSERIES;puiseux| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |GSERIES;puiseux|
        ((|f| (%)) (% (|UnivariatePuiseuxSeries| |Coef| |var| |cen|))) |f|) 

(SDEFUN |GSERIES;differentiate;2%;3| ((|f| (%)) (% (%)))
        (SPROG ((|str1| (|String|)) (|str2| (|String|)))
               (SEQ
                (LETT |str1| "'differentiate' unavailable on this domain;  ")
                (LETT |str2| "use 'approximate' first")
                (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;differentiate;%V%;4|
        ((|f| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |f| (QREFELT % 10))) 

(SDEFUN |GSERIES;differentiate;%S%;5| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG
         ((|str1| (|String|)) (|str2| (|String|)) (|dcds| (|Coef|))
          (|deriv| (%)))
         (SEQ
          (COND
           ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
            (SEQ (LETT |str1| "'differentiate' unavailable on this domain;  ")
                 (LETT |str2| "use 'approximate' first")
                 (EXIT (|error| (STRCONC |str1| |str2|)))))
           ('T
            (SEQ
             (LETT |dcds|
                   (SPADCALL (SPADCALL |f| (QREFELT % 15)) |s| (QREFELT % 16)))
             (LETT |deriv|
                   (SPADCALL
                    (SPADCALL (|GSERIES;puiseux| |f| %) (QREFELT % 17))
                    (QREFELT % 9)))
             (EXIT
              (SPADCALL
               (SPADCALL
                (CONS #'|GSERIES;differentiate;%S%;5!0| (VECTOR % |s|)) |f|
                (QREFELT % 19))
               (SPADCALL |dcds| |deriv| (QREFELT % 20)) (QREFELT % 21))))))))) 

(SDEFUN |GSERIES;differentiate;%S%;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT % 16)))))) 

(SDEFUN |GSERIES;integrate;2%;6| ((|f| (%)) (% (%)))
        (SPROG ((|str1| (|String|)) (|str2| (|String|)))
               (SEQ (LETT |str1| "'integrate' unavailable on this domain;  ")
                    (LETT |str2| "use 'approximate' first")
                    (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;integrate;%V%;7| ((|f| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |f| (QREFELT % 23))) 

(SDEFUN |GSERIES;integrate;%S%;8| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG ((|str1| (|String|)) (|str2| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT % 15))
                                       (QREFELT % 26))
                             (QREFELT % 28)))
                  (SPADCALL (CONS #'|GSERIES;integrate;%S%;8!0| (VECTOR % |s|))
                            |f| (QREFELT % 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;%S%;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT % 29)))))) 

(SDEFUN |GSERIES;integrateWithOneAnswer|
        ((|f| (|Coef|)) (|s| (|Symbol|)) (% (|Coef|)))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ (LETT |res| (SPADCALL |f| |s| (QREFELT % 33)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |GSERIES;integrate;%S%;10| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG ((|str1| (|String|)) (|str2| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT % 15))
                                       (QREFELT % 34))
                             (QREFELT % 28)))
                  (SPADCALL
                   (CONS #'|GSERIES;integrate;%S%;10!0| (VECTOR % |s|)) |f|
                   (QREFELT % 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;%S%;10!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GSERIES;integrateWithOneAnswer| |x| |s| %))))) 

(DECLAIM (NOTINLINE |GeneralUnivariatePowerSeries;|)) 

(DEFUN |GeneralUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G66 NIL)
    (#2=#:G65 NIL) (#3=#:G63 NIL) (#4=#:G62 NIL) (#5=#:G61 NIL) (#6=#:G60 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 58))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|Comparable|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (AND #1#
                                             (|HasSignature| |#1|
                                                             (LIST '|integrate|
                                                                   (LIST
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    '(|Symbol|))))
                                             (|HasSignature| |#1|
                                                             (LIST '|variables|
                                                                   (LIST
                                                                    '(|List|
                                                                      (|Symbol|))
                                                                    (|devaluate|
                                                                     |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #2# (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #1# #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #5#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #1# #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #2#
                                            (|HasCategory| |#1| '(|Field|)) #3#
                                            #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR #1# #6#
                                            (|HasCategory| |#1|
                                                           '(|AbelianMonoid|))
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianMonoid|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #6#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #6#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|CharacteristicNonZero|)))
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|CharacteristicZero|)))
                                            (AND #6# #2#)
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|Field|)))
                                            (AND #6# #3#) (AND #6# #5#)
                                            (AND #6# #4#)
                                            (AND #6#
                                                 (|HasCategory|
                                                  (|Fraction| (|Integer|))
                                                  '(|SemiGroup|)))
                                            (|HasCategory| |#1|
                                                           '(|AbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianMonoid|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|GeneralUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR #1#
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR #1# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR #6# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 274877906944))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (QSETREFV % 10
                 (CONS (|dispatchFunction| |GSERIES;differentiate;2%;3|) %))
       (QSETREFV % 12
                 (CONS (|dispatchFunction| |GSERIES;differentiate;%V%;4|) %))
       (COND
        ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
         (QSETREFV % 22
                   (CONS (|dispatchFunction| |GSERIES;differentiate;%S%;5|)
                         %))))
       (QSETREFV % 23 (CONS (|dispatchFunction| |GSERIES;integrate;2%;6|) %))
       (QSETREFV % 24 (CONS (|dispatchFunction| |GSERIES;integrate;%V%;7|) %))
       (COND
        ((|HasSignature| |#1|
                         (LIST '|integrate|
                               (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                     '(|Symbol|))))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|variables|
                                 (LIST '(|List| (|Symbol|))
                                       (|devaluate| |#1|))))
           (QSETREFV % 30
                     (CONS (|dispatchFunction| |GSERIES;integrate;%S%;8|)
                           %))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV % 30
                        (CONS (|dispatchFunction| |GSERIES;integrate;%S%;10|)
                              %))))))))))))
    %))) 

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G68)
  (SPROG NIL
         (PROG (#2=#:G69)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|GeneralUnivariatePowerSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralUnivariatePowerSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralUnivariatePowerSeries|)))))))))) 

(MAKEPROP '|GeneralUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT % 7))
                                         (NRTEVAL (QREFELT % 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              |GSERIES;coerce;Ups%;1| (0 . |differentiate|)
              (|Variable| (NRTEVAL (QREFELT % 7))) (5 . |differentiate|)
              (|Symbol|) (11 . |variable|) (16 . |center|)
              (21 . |differentiate|) (27 . |differentiate|) (|Mapping| 6 6)
              (32 . |map|) (38 . *) (44 . -) (50 . |differentiate|)
              (56 . |integrate|) (61 . |integrate|) (|List| 13)
              (67 . |variables|) (|Boolean|) (72 . |entry?|) (78 . |integrate|)
              (84 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 44 6) (90 . |integrate|)
              (96 . |variables|) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 40) (|:| |c| 6)) (|List| 38) (|Fraction| 44)
              (|Stream| 38) (|NonNegativeInteger|) (|List| 42) (|Integer|)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Factored| %) (|Union| 49 '#1="failed") (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 51 '#1#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 49) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Stream| 6))
           '#(~= 101 |zero?| 107 |variable| 112 |unitNormal| 117
              |unitCanonical| 122 |unit?| 127 |truncate| 132 |terms| 145 |tanh|
              150 |tan| 155 |subtractIfCan| 160 |squareFreePart| 166
              |squareFree| 171 |sqrt| 176 |sizeLess?| 181 |sinh| 187 |sin| 192
              |series| 197 |sech| 203 |sec| 208 |sample| 213 |rightRecip| 217
              |rightPower| 222 |rem| 234 |reductum| 240 |recip| 245 |quo| 250
              |principalIdeal| 256 |prime?| 261 |pole?| 266 |plenaryPower| 271
              |pi| 277 |order| 281 |opposite?| 292 |one?| 298 |nthRoot| 303
              |multiplyExponents| 309 |multiEuclidean| 321 |monomial?| 327
              |monomial| 332 |map| 338 |log| 344 |leftRecip| 349 |leftPower|
              354 |leadingTerm| 366 |leadingSupport| 371 |leadingMonomial| 376
              |leadingCoefficient| 381 |lcmCoef| 386 |lcm| 392 |latex| 403
              |inv| 408 |integrate| 413 |gcdPolynomial| 430 |gcd| 436 |factor|
              447 |extendedEuclidean| 452 |extend| 465 |exquo| 471
              |expressIdealMember| 477 |exp| 483 |eval| 488 |euclideanSize| 494
              |elt| 499 |divide| 511 |differentiate| 517 |degree| 560 |csch|
              565 |csc| 570 |coth| 575 |cot| 580 |cosh| 585 |cos| 590
              |constructOrdered| 595 |construct| 600 |complete| 605
              |commutator| 610 |coerce| 616 |coefficient| 651 |characteristic|
              657 |center| 661 |atanh| 666 |atan| 671 |associator| 676
              |associates?| 683 |asinh| 689 |asin| 694 |asech| 699 |asec| 704
              |approximate| 709 |antiCommutator| 715 |annihilate?| 721 |acsch|
              727 |acsc| 732 |acoth| 737 |acot| 742 |acosh| 747 |acos| 752 ^
              757 D 787 = 824 |1| 830 |0| 834 / 838 - 850 + 861 * 867)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 7 0 7 0 7 7 0 7 0 17 7 16 7 8 17 16 2 3 11
                                  22 8 22 16 19 11 8 16 11 0 8 21 0 0 0 8 8 22
                                  0 0 0 0 0 28 19 19 27 19 26 0 0 29 0 0 16 5 0
                                  7 7 17 16 21 5 5 5 5 5 5 4 1 6 0 0 0))
            (CONS
             '#(NIL |Field&| NIL |EuclideanDomain&|
                |UnivariatePowerSeriesCategory&| |UniqueFactorizationDomain&|
                NIL |PowerSeriesCategory&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DivisionRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Module&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                |SetWithZero&| |AbelianSemiGroup&| |Magma&| NIL
                |TranscendentalFunctionCategory&| |SetCategory&| NIL NIL NIL
                NIL NIL |RadicalCategory&| |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 40)
                 (|EuclideanDomain|) (|UnivariatePowerSeriesCategory| 6 40)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 40 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 40) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 40) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|PartialDifferentialRing| 13)
                 (|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 40) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Module| 40) (|Module| $$)
                 (|Module| 6) (|SemiRng|) (|BiModule| 40 40)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 40) (|RightModule| 40)
                 (|LeftModule| 40) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|SetWithZero|) (|AbelianSemiGroup|)
                 (|Magma|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 35) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 57
                                  '(1 0 0 0 10 2 0 0 0 11 12 1 0 13 0 14 1 0 6
                                    0 15 2 6 0 0 13 16 1 5 0 0 17 2 0 0 18 0 19
                                    2 0 0 6 0 20 2 0 0 0 0 21 2 0 0 0 13 22 1 0
                                    0 0 23 2 0 0 0 11 24 1 6 25 0 26 2 25 27 13
                                    0 28 2 6 0 0 13 29 2 0 0 0 13 30 2 32 31 6
                                    13 33 1 6 25 0 34 2 0 27 0 0 1 1 37 27 0 1
                                    1 0 13 0 14 1 32 46 0 1 1 32 0 0 1 1 32 27
                                    0 1 2 0 0 0 40 1 3 0 0 0 40 40 1 1 0 41 0 1
                                    1 5 0 0 1 1 5 0 0 1 2 38 45 0 0 1 1 7 0 0 1
                                    1 7 47 0 1 1 5 0 0 1 2 7 27 0 0 1 1 5 0 0 1
                                    1 5 0 0 1 2 0 0 42 41 1 1 5 0 0 1 1 5 0 0 1
                                    0 37 0 1 1 35 45 0 1 2 0 0 0 37 1 2 35 0 0
                                    42 1 2 7 0 0 0 1 1 9 0 0 1 1 35 45 0 1 2 7
                                    0 0 0 1 1 7 54 49 1 1 7 27 0 1 1 0 27 0 1 2
                                    33 0 0 37 1 0 5 0 1 1 0 40 0 1 2 0 40 0 40
                                    1 2 37 27 0 0 1 1 35 27 0 1 2 5 0 0 44 1 2
                                    0 0 0 37 1 2 0 0 0 40 1 2 7 48 49 0 1 1 0
                                    27 0 1 2 0 0 6 40 1 2 0 0 18 0 19 1 5 0 0 1
                                    1 35 45 0 1 2 0 0 0 37 1 2 35 0 0 42 1 1 9
                                    38 0 1 1 9 40 0 1 1 0 0 0 1 1 0 6 0 1 2 7
                                    56 0 0 1 1 7 0 49 1 2 7 0 0 0 1 1 0 36 0 1
                                    1 7 0 0 1 2 14 0 0 13 30 1 5 0 0 23 2 5 0 0
                                    11 24 2 7 55 55 55 1 1 7 0 49 1 2 7 0 0 0 1
                                    1 7 47 0 1 2 7 50 0 0 1 3 7 52 0 0 0 1 2 0
                                    0 0 40 1 2 32 45 0 0 1 2 7 48 49 0 1 1 5 0
                                    0 1 2 12 57 0 6 1 1 7 42 0 1 2 0 6 0 40 1 2
                                    4 0 0 0 1 2 7 53 0 0 1 2 0 0 0 11 12 3 3 0
                                    0 13 42 1 3 3 0 0 25 43 1 2 3 0 0 13 22 2 3
                                    0 0 25 1 2 2 0 0 42 1 1 2 0 0 10 1 0 40 0 1
                                    1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5
                                    0 0 1 1 5 0 0 1 1 9 0 39 1 1 0 0 39 1 1 0 0
                                    0 1 2 36 0 0 0 1 1 0 35 0 1 1 0 0 5 9 1 0 0
                                    11 1 1 30 0 6 1 1 31 0 40 1 1 34 0 0 1 1 36
                                    0 44 1 2 0 6 0 40 1 0 36 42 1 1 0 6 0 15 1
                                    5 0 0 1 1 5 0 0 1 3 36 0 0 0 0 1 2 32 27 0
                                    0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1
                                    2 13 6 0 40 1 2 0 0 0 0 1 2 36 27 0 0 1 1 5
                                    0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0
                                    1 1 5 0 0 1 2 0 0 0 37 1 2 35 0 0 42 1 2 5
                                    0 0 0 1 2 5 0 0 40 1 2 7 0 0 44 1 3 3 0 0
                                    25 43 1 2 3 0 0 25 1 3 3 0 0 13 42 1 2 3 0
                                    0 13 1 2 2 0 0 42 1 1 2 0 0 1 2 0 27 0 0 1
                                    0 35 0 1 0 37 0 1 2 7 0 0 6 1 2 7 0 0 0 1 1
                                    39 0 0 1 2 39 0 0 0 21 2 0 0 0 0 1 2 0 0 37
                                    0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 6 0 20 2
                                    31 0 40 0 1 2 31 0 0 40 1 2 39 0 44 0 1 2
                                    37 0 42 0 1)))))
           '|lookupComplete|)) 
