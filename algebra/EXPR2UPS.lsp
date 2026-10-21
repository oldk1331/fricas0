
(SDEFUN |EXPR2UPS;performSubstitution|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (% (FE)))
        (SPROG ((|xFE| (FE)))
               (SEQ
                (COND ((SPADCALL |a| (QREFELT % 9)) |fcn|)
                      ('T
                       (SEQ (LETT |xFE| (SPADCALL |x| (QREFELT % 11)))
                            (EXIT
                             (SPADCALL |fcn|
                                       (SPADCALL |xFE|
                                                 (SPADCALL |xFE| |a|
                                                           (QREFELT % 12))
                                                 (QREFELT % 14))
                                       (QREFELT % 16))))))))) 

(SDEFUN |EXPR2UPS;iTaylor|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (% (|Any|)))
        (SPROG
         ((|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #1="complex" #2="real: two sides" #3="real: left side"
                       #4="real: right side" #5="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|ans|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (#6=#:G36 NIL) (|uls| (|Uls|))
          (|uts| (|Union| (|UnivariateTaylorSeries| FE |x| |a|) #7="failed"))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #8=(|UnivariateTaylorSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #8# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#8# (|Any|))))))
         (SEQ (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|))
              (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|))
              (LETT |pack|
                    (|FunctionSpaceToUnivariatePowerSeries| (QREFELT % 6)
                                                            (QREFELT % 7)
                                                            (|Integer|) |Uls|
                                                            (|ElementaryFunctionsUnivariateLaurentSeries|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls|)
                                                            |Uts|
                                                            (|TaylorSeriesExpansionLaurent|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls|)
                                                            |x|))
              (LETT |ans|
                    (SPADCALL |fcn| NIL (CONS 4 "just do it")
                              (|compiledLookupCheck| '|exprToUPS|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|:|
                                                                  '|%series|
                                                                  (|devaluate|
                                                                   |Uls|))
                                                            (LIST '|:|
                                                                  '|%problem|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                   (LIST '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                      (|devaluate| (ELT % 7))
                                                      (LIST '|Boolean|)
                                                      (LIST '|Union| '"complex"
                                                            '"real: two sides"
                                                            '"real: left side"
                                                            '"real: right side"
                                                            '"just do it"))
                                                     |pack|)))
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (COND
                  ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
                   (|error| "No Taylor expansion: essential singularity"))
                  ((EQUAL (QCAR (CDR |ans|)) "log")
                   (|error| "No Taylor expansion: logarithmic singularity"))
                  ((EQUAL (QCAR (CDR |ans|)) "nth root")
                   (|error|
                    "No Taylor expansion: fractional powers in expansion"))
                  (#9='T (|error| "No Taylor expansion"))))
                (#9#
                 (SEQ
                  (LETT |uls|
                        (PROG2 (LETT #6# |ans|)
                            (QCDR #6#)
                          (|check_union2| (QEQCAR #6# 0) |Uls|
                                          (|Union| (|:| |%series| |Uls|)
                                                   (|:| |%problem|
                                                        (|Record|
                                                         (|:| |func|
                                                              (|String|))
                                                         (|:| |prob|
                                                              (|String|)))))
                                          #6#)))
                  (LETT |uts|
                        (SPADCALL |uls|
                                  (|compiledLookupCheck| '|taylorIfCan|
                                                         (LIST
                                                          (LIST '|Union|
                                                                (LIST
                                                                 '|UnivariateTaylorSeries|
                                                                 (|devaluate|
                                                                  (ELT % 7))
                                                                 |x| |a|)
                                                                '#7#)
                                                          '%)
                                                         |Uls|)))
                  (EXIT
                   (COND
                    ((QEQCAR |uts| 1) (|error| "No Taylor expansion: pole"))
                    (#9#
                     (SEQ
                      (LETT |any1|
                            (|AnyFunctions1|
                             (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|)))
                      (EXIT
                       (SPADCALL (QCDR |uts|)
                                 (|compiledLookupCheck| '|coerce|
                                                        (LIST (LIST '|Any|)
                                                              (LIST
                                                               '|UnivariateTaylorSeries|
                                                               (|devaluate|
                                                                (ELT % 7))
                                                               |x| |a|))
                                                        |any1|)))))))))))))) 

(SDEFUN |EXPR2UPS;taylor;SA;3| ((|x| (|Symbol|)) (% (|Any|)))
        (SPROG
         ((|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uts|))
            (SIGNATURE |retractIfCan| ((|Union| |uts| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uts| (|Any|))))))
         (SEQ
          (LETT |uts|
                (|UnivariateTaylorSeries| (QREFELT % 7) |x|
                                          (|spadConstant| % 17)))
          (LETT |any1| (|AnyFunctions1| |uts|))
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| % 19) 1
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '% (|devaluate| (ELT % 7))
                                                   (LIST
                                                    '|NonNegativeInteger|))
                                             |uts|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |uts|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;taylor;FEA;4| ((|fcn| (FE)) (% (|Any|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
                 (|error| "taylor: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "taylor: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT % 11))
                            (|spadConstant| % 17) (QREFELT % 14))
                           (QREFELT % 24)))))) 

(SDEFUN |EXPR2UPS;taylor;FENniA;5|
        ((|fcn| (FE)) (|n| (|NonNegativeInteger|)) (% (|Any|)))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (|x| (|Symbol|))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uts|))
            (SIGNATURE |retractIfCan| ((|Union| |uts| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uts| (|Any|)))))
          (|series| (|uts|)))
         (SEQ
          (COND
           ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
            (|error| "taylor: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "taylor: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|))
                 (LETT |uts|
                       (|UnivariateTaylorSeries| (QREFELT % 7) |x|
                                                 (|spadConstant| % 17)))
                 (LETT |any1| (|AnyFunctions1| |uts|))
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                            (|spadConstant| % 17)
                                            (QREFELT % 14))
                                  (QREFELT % 24))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |uts|)
                                                     (LIST '|Any|))
                                               |any1|)))
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '% '%
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                    |uts|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |uts|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;taylor;FEEA;6|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (EXIT
                   (|EXPR2UPS;iTaylor|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x| |a|
                    %))))))))) 

(SDEFUN |EXPR2UPS;taylor;FEENniA;7|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|n| (|NonNegativeInteger|))
         (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariateTaylorSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|series| (|UnivariateTaylorSeries| FE |x| |a|)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|)))
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iTaylor|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x|
                          |a| %)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '% '%
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT % 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iLaurent|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (% (|Any|)))
        (SPROG
         ((|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #1="complex" #2="real: two sides" #3="real: left side"
                       #4="real: right side" #5="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|ans|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #6=(|UnivariateLaurentSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #6# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#6# (|Any|)))))
          (#7=#:G81 NIL))
         (SEQ (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|))
              (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|))
              (LETT |pack|
                    (|FunctionSpaceToUnivariatePowerSeries| (QREFELT % 6)
                                                            (QREFELT % 7)
                                                            (|Integer|) |Uls|
                                                            (|ElementaryFunctionsUnivariateLaurentSeries|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls|)
                                                            |Uts|
                                                            (|TaylorSeriesExpansionLaurent|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls|)
                                                            |x|))
              (LETT |ans|
                    (SPADCALL |fcn| NIL (CONS 4 "just do it")
                              (|compiledLookupCheck| '|exprToUPS|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|:|
                                                                  '|%series|
                                                                  (|devaluate|
                                                                   |Uls|))
                                                            (LIST '|:|
                                                                  '|%problem|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                   (LIST '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                      (|devaluate| (ELT % 7))
                                                      (LIST '|Boolean|)
                                                      (LIST '|Union| '"complex"
                                                            '"real: two sides"
                                                            '"real: left side"
                                                            '"real: right side"
                                                            '"just do it"))
                                                     |pack|)))
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (COND
                  ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
                   (|error| "No Laurent expansion: essential singularity"))
                  ((EQUAL (QCAR (CDR |ans|)) "log")
                   (|error| "No Laurent expansion: logarithmic singularity"))
                  ((EQUAL (QCAR (CDR |ans|)) "nth root")
                   (|error|
                    "No Laurent expansion: fractional powers in expansion"))
                  (#8='T (|error| "No Laurent expansion"))))
                (#8#
                 (SEQ
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|)))
                  (EXIT
                   (SPADCALL
                    (PROG2 (LETT #7# |ans|)
                        (QCDR #7#)
                      (|check_union2| (QEQCAR #7# 0) |Uls|
                                      (|Union| (|:| |%series| |Uls|)
                                               (|:| |%problem|
                                                    (|Record|
                                                     (|:| |func| (|String|))
                                                     (|:| |prob| (|String|)))))
                                      #7#))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateLaurentSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;laurent;SA;9| ((|x| (|Symbol|)) (% (|Any|)))
        (SPROG
         ((|uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x|
                                                           (|Sel| FE (|0|))))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uls|))
            (SIGNATURE |retractIfCan| ((|Union| |uls| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uls| (|Any|))))))
         (SEQ
          (LETT |uls|
                (|UnivariateLaurentSeries| (QREFELT % 7) |x|
                                           (|spadConstant| % 17)))
          (LETT |any1| (|AnyFunctions1| |uls|))
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| % 19) 1
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '% (|devaluate| (ELT % 7))
                                                   (LIST '|Integer|))
                                             |uls|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |uls|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;laurent;FEA;10| ((|fcn| (FE)) (% (|Any|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
                 (|error| "laurent: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "laurent: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT % 11))
                            (|spadConstant| % 17) (QREFELT % 14))
                           (QREFELT % 35)))))) 

(SDEFUN |EXPR2UPS;laurent;FEIA;11| ((|fcn| (FE)) (|n| (|Integer|)) (% (|Any|)))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (|x| (|Symbol|))
          (|uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x|
                                                           (|Sel| FE (|0|))))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |uls|))
            (SIGNATURE |retractIfCan| ((|Union| |uls| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|uls| (|Any|)))))
          (|series| (|uls|)))
         (SEQ
          (COND
           ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
            (|error| "laurent: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "laurent: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|))
                 (LETT |uls|
                       (|UnivariateLaurentSeries| (QREFELT % 7) |x|
                                                  (|spadConstant| % 17)))
                 (LETT |any1| (|AnyFunctions1| |uls|))
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                            (|spadConstant| % 17)
                                            (QREFELT % 14))
                                  (QREFELT % 35))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |uls|)
                                                     (LIST '|Any|))
                                               |any1|)))
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '% '%
                                                          (LIST '|Integer|))
                                                    |uls|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |uls|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;laurent;FEEA;12|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (EXIT
                   (|EXPR2UPS;iLaurent|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x| |a|
                    %))))))))) 

(SDEFUN |EXPR2UPS;laurent;FEEIA;13|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|n| (|Integer|)) (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariateLaurentSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|series| (|UnivariateLaurentSeries| FE |x| |a|)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|)))
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iLaurent|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x|
                          |a| %)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariateLaurentSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '% '%
                                                           (LIST '|Integer|))
                                                     (|UnivariateLaurentSeries|
                                                      (ELT % 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateLaurentSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iPuiseux|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (% (|Any|)))
        (SPROG
         ((|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Ups|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |a|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #1="complex" #2="real: two sides" #3="real: left side"
                       #4="real: right side" #5="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Ups|)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #1# #2# #3# #4# #5#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|ans|
           (|Union| (|:| |%series| |Ups|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #6=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #6# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#6# (|Any|)))))
          (#7=#:G118 NIL))
         (SEQ (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|))
              (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|))
              (LETT |Ups| (|UnivariatePuiseuxSeries| (QREFELT % 7) |x| |a|))
              (LETT |pack|
                    (|FunctionSpaceToUnivariatePowerSeries| (QREFELT % 6)
                                                            (QREFELT % 7)
                                                            (|Fraction|
                                                             (|Integer|))
                                                            |Ups|
                                                            (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                             (QREFELT % 7)
                                                             |Uls| |Ups|
                                                             (|ElementaryFunctionsUnivariateLaurentSeries|
                                                              (QREFELT % 7)
                                                              |Uts| |Uls|))
                                                            |Uts|
                                                            (|TaylorSeriesExpansionPuiseux|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls| |Ups|)
                                                            |x|))
              (LETT |ans|
                    (SPADCALL |fcn| NIL (CONS 4 "just do it")
                              (|compiledLookupCheck| '|exprToUPS|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|:|
                                                                  '|%series|
                                                                  (|devaluate|
                                                                   |Ups|))
                                                            (LIST '|:|
                                                                  '|%problem|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                   (LIST '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                      (|devaluate| (ELT % 7))
                                                      (LIST '|Boolean|)
                                                      (LIST '|Union| '"complex"
                                                            '"real: two sides"
                                                            '"real: left side"
                                                            '"real: right side"
                                                            '"just do it"))
                                                     |pack|)))
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (COND
                  ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
                   (|error| "No Puiseux expansion: essential singularity"))
                  ((EQUAL (QCAR (CDR |ans|)) "log")
                   (|error| "No Puiseux expansion: logarithmic singularity"))
                  (#8='T (|error| "No Puiseux expansion"))))
                (#8#
                 (SEQ
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT % 7) |x| |a|)))
                  (EXIT
                   (SPADCALL
                    (PROG2 (LETT #7# |ans|)
                        (QCDR #7#)
                      (|check_union2| (QEQCAR #7# 0) |Ups|
                                      (|Union| (|:| |%series| |Ups|)
                                               (|:| |%problem|
                                                    (|Record|
                                                     (|:| |func| (|String|))
                                                     (|:| |prob| (|String|)))))
                                      #7#))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;puiseux;SA;15| ((|x| (|Symbol|)) (% (|Any|)))
        (SPROG
         ((|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|0|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|))))))
         (SEQ
          (LETT |upxs|
                (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                           (|spadConstant| % 17)))
          (LETT |any1| (|AnyFunctions1| |upxs|))
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| % 19) (|spadConstant| % 41)
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '% (|devaluate| (ELT % 7))
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|)))
                                             |upxs|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |upxs|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;puiseux;FEA;16| ((|fcn| (FE)) (% (|Any|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
                 (|error| "puiseux: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "puiseux: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT % 11))
                            (|spadConstant| % 17) (QREFELT % 14))
                           (QREFELT % 43)))))) 

(SDEFUN |EXPR2UPS;puiseux;FEFA;17|
        ((|fcn| (FE)) (|n| (|Fraction| (|Integer|))) (% (|Any|)))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (|x| (|Symbol|))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|0|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|series| (|upxs|)))
         (SEQ
          (COND
           ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
            (|error| "puiseux: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "puiseux: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|))
                 (LETT |upxs|
                       (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                                  (|spadConstant| % 17)))
                 (LETT |any1| (|AnyFunctions1| |upxs|))
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                            (|spadConstant| % 17)
                                            (QREFELT % 14))
                                  (QREFELT % 43))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |upxs|)
                                                     (LIST '|Any|))
                                               |any1|)))
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '% '%
                                                          (LIST '|Fraction|
                                                                (LIST
                                                                 '|Integer|)))
                                                    |upxs|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |upxs|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;puiseux;FEEA;18|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (EXIT
                   (|EXPR2UPS;iPuiseux|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x| |a|
                    %))))))))) 

(SDEFUN |EXPR2UPS;puiseux;FEEFA;19|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|n| (|Fraction| (|Integer|)))
         (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|series| (|UnivariatePuiseuxSeries| FE |x| |a|)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT % 7) |x| |a|)))
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iPuiseux|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x|
                          |a| %)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '% '%
                                                           (LIST '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                     (|UnivariatePuiseuxSeries|
                                                      (ELT % 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(SDEFUN |EXPR2UPS;iSeries|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (% (|Any|)))
        (SPROG
         ((|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) %
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |x|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |x|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |x|)))
                        |noBranch|))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |a|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|pack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union|
               (|:| |%series| #1=(|UnivariatePuiseuxSeries| FE |x| |a|))
               (|:| |%problem|
                    (|Record| (|:| |func| (|String|))
                              (|:| |prob| (|String|)))))
              FE (|Boolean|)
              (|Union| #2="complex" #3="real: two sides" #4="real: left side"
                       #5="real: right side" #6="just do it")))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| #1#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #2# #3# #4# #5# #6#)))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| #1#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #2# #3# #4# #5# #6#) (|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| #1#)
                       (|:| |%problem|
                            (|Record| (|:| |func| (|String|))
                                      (|:| |prob| (|String|)))))
              FE (|Boolean|) (|Union| #2# #3# #4# #5# #6#) (|Boolean|) FE
              (|Mapping| (|Boolean|) FE) (|Mapping| (|Boolean|) FE)
              (|Mapping| (|Boolean|) FE)))))
          (|ans|
           (|Union| (|:| |%series| (|UnivariatePuiseuxSeries| FE |x| |a|))
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ansG|
           (|Union| (|:| |%series| (|UnivariatePuiseuxSeries| FE |x| |a|))
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|anyone|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             (#7=(|Any|) #8=(|GeneralUnivariatePowerSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan|
             ((|Union| #8# . #9=("failed")) . #10=((|Any|))))
            #11=(SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#8# . #12=((|Any|))))))
          (#13=#:G154 NIL)
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             (#7# #14=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #14# . #9#) . #10#)) #11#
            (SIGNATURE |retract| (#14# . #12#)))))
         (SEQ (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT % 7) |x| |a|))
              (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT % 7) |x| |a|))
              (LETT |pack|
                    (|FunctionSpaceToUnivariatePowerSeries| (QREFELT % 6)
                                                            (QREFELT % 7)
                                                            (|Fraction|
                                                             (|Integer|))
                                                            (|UnivariatePuiseuxSeries|
                                                             (QREFELT % 7) |x|
                                                             |a|)
                                                            (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                             (QREFELT % 7)
                                                             |Uls|
                                                             (|UnivariatePuiseuxSeries|
                                                              (QREFELT % 7) |x|
                                                              |a|)
                                                             (|ElementaryFunctionsUnivariateLaurentSeries|
                                                              (QREFELT % 7)
                                                              |Uts| |Uls|))
                                                            |Uts|
                                                            (|TaylorSeriesExpansionPuiseux|
                                                             (QREFELT % 7)
                                                             |Uts| |Uls|
                                                             (|UnivariatePuiseuxSeries|
                                                              (QREFELT % 7) |x|
                                                              |a|))
                                                            |x|))
              (LETT |ans|
                    (SPADCALL |fcn| NIL (CONS 4 "just do it")
                              (|compiledLookupCheck| '|exprToUPS|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|:|
                                                                  '|%series|
                                                                  (LIST
                                                                   '|UnivariatePuiseuxSeries|
                                                                   (|devaluate|
                                                                    (ELT % 7))
                                                                   |x| |a|))
                                                            (LIST '|:|
                                                                  '|%problem|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                   (LIST '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                      (|devaluate| (ELT % 7))
                                                      (LIST '|Boolean|)
                                                      (LIST '|Union|
                                                            '#15="complex"
                                                            '#16="real: two sides"
                                                            '#17="real: left side"
                                                            '#18="real: right side"
                                                            '#19="just do it"))
                                                     |pack|)))
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (SEQ
                  (LETT |ansG|
                        (SPADCALL |fcn| NIL (CONS 4 "just do it")
                                  (|compiledLookupCheck| '|exprToGenUPS|
                                                         (LIST
                                                          (LIST '|Union|
                                                                (LIST '|:|
                                                                      '|%series|
                                                                      (LIST
                                                                       '|UnivariatePuiseuxSeries|
                                                                       (|devaluate|
                                                                        (ELT %
                                                                             7))
                                                                       |x|
                                                                       |a|))
                                                                (LIST '|:|
                                                                      '|%problem|
                                                                      (LIST
                                                                       '|Record|
                                                                       (LIST
                                                                        '|:|
                                                                        '|func|
                                                                        (LIST
                                                                         '|String|))
                                                                       (LIST
                                                                        '|:|
                                                                        '|prob|
                                                                        (LIST
                                                                         '|String|)))))
                                                          (|devaluate|
                                                           (ELT % 7))
                                                          (LIST '|Boolean|)
                                                          (LIST '|Union| '#15#
                                                                '#16# '#17#
                                                                '#18# '#19#))
                                                         |pack|)))
                  (EXIT
                   (COND
                    ((QEQCAR |ansG| 1)
                     (COND
                      ((EQUAL (QCDR (CDR |ansG|)) "essential singularity")
                       (|error| "No series expansion: essential singularity"))
                      (#20='T (|error| "No series expansion"))))
                    (#20#
                     (SEQ
                      (LETT |anyone|
                            (|AnyFunctions1|
                             (|GeneralUnivariatePowerSeries| (QREFELT % 7) |x|
                                                             |a|)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (PROG2 (LETT #13# |ansG|)
                             (QCDR #13#)
                           (|check_union2| (QEQCAR #13# 0)
                                           (|UnivariatePuiseuxSeries|
                                            (QREFELT % 7) |x| |a|)
                                           (|Union|
                                            (|:| |%series|
                                                 (|UnivariatePuiseuxSeries|
                                                  (QREFELT % 7) |x| |a|))
                                            (|:| |%problem|
                                                 (|Record|
                                                  (|:| |func| (|String|))
                                                  (|:| |prob| (|String|)))))
                                           #13#))
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '%
                                                      (LIST
                                                       '|UnivariatePuiseuxSeries|
                                                       (|devaluate| (ELT % 7))
                                                       |x| |a|))
                                                (|GeneralUnivariatePowerSeries|
                                                 (ELT % 7) |x| |a|)))
                        (|compiledLookupCheck| '|coerce|
                                               (LIST (LIST '|Any|)
                                                     (LIST
                                                      '|GeneralUnivariatePowerSeries|
                                                      (|devaluate| (ELT % 7))
                                                      |x| |a|))
                                               |anyone|)))))))))
                (#20#
                 (SEQ
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT % 7) |x| |a|)))
                  (EXIT
                   (SPADCALL (CDR |ans|)
                             (|compiledLookupCheck| '|coerce|
                                                    (LIST (LIST '|Any|)
                                                          (LIST
                                                           '|UnivariatePuiseuxSeries|
                                                           (|devaluate|
                                                            (ELT % 7))
                                                           |x| |a|))
                                                    |any1|)))))))))) 

(SDEFUN |EXPR2UPS;series;SA;21| ((|x| (|Symbol|)) (% (|Any|)))
        (SPROG
         ((|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|0|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|))))))
         (SEQ
          (LETT |upxs|
                (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                           (|spadConstant| % 17)))
          (LETT |any1| (|AnyFunctions1| |upxs|))
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| % 19) (|spadConstant| % 41)
                      (|compiledLookupCheck| '|monomial|
                                             (LIST '% (|devaluate| (ELT % 7))
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|)))
                                             |upxs|))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|) (|devaluate| |upxs|))
                                   |any1|)))))) 

(SDEFUN |EXPR2UPS;series;FEA;22| ((|fcn| (FE)) (% (|Any|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
                 (|error| "series: expression has no variables"))
                ((NULL (NULL (CDR |vars|)))
                 (|error| "series: expression has more than one variable"))
                ('T
                 (SPADCALL |fcn|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |vars|) (QREFELT % 11))
                            (|spadConstant| % 17) (QREFELT % 14))
                           (QREFELT % 48)))))) 

(SDEFUN |EXPR2UPS;series;FEFA;23|
        ((|fcn| (FE)) (|n| (|Fraction| (|Integer|))) (% (|Any|)))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (|x| (|Symbol|))
          (|upxs|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x|
                                                           #1=(|Sel| FE
                                                               (|0|))))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| #1#))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|any1|
           (CATEGORY |package| (SIGNATURE |coerce| ((|Any|) |upxs|))
            (SIGNATURE |retractIfCan| ((|Union| |upxs| "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (|upxs| (|Any|)))))
          (|series| (|upxs|)))
         (SEQ
          (COND
           ((NULL (LETT |vars| (SPADCALL |fcn| (QREFELT % 23))))
            (|error| "series: expression has no variables"))
           ((NULL (NULL (CDR |vars|)))
            (|error| "series: expression has more than one variable"))
           ('T
            (SEQ (LETT |x| (|SPADfirst| |vars|))
                 (LETT |upxs|
                       (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                                  (|spadConstant| % 17)))
                 (LETT |any1| (|AnyFunctions1| |upxs|))
                 (LETT |series|
                       (SPADCALL
                        (SPADCALL |fcn|
                                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                                            (|spadConstant| % 17)
                                            (QREFELT % 14))
                                  (QREFELT % 48))
                        (|compiledLookupCheck| '|retract|
                                               (LIST (|devaluate| |upxs|)
                                                     (LIST '|Any|))
                                               |any1|)))
                 (EXIT
                  (SPADCALL
                   (SPADCALL |series| |n|
                             (|compiledLookupCheck| '|extend|
                                                    (LIST '% '%
                                                          (LIST '|Fraction|
                                                                (LIST
                                                                 '|Integer|)))
                                                    |upxs|))
                   (|compiledLookupCheck| '|coerce|
                                          (LIST (LIST '|Any|)
                                                (|devaluate| |upxs|))
                                          |any1|))))))))) 

(SDEFUN |EXPR2UPS;series;FEEA;24|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (EXIT
                   (|EXPR2UPS;iSeries|
                    (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x| |a|
                    %))))))))) 

(SDEFUN |EXPR2UPS;series;FEEFA;25|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|n| (|Fraction| (|Integer|)))
         (% (|Any|)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE))
          (|any1|
           (CATEGORY |package|
            (SIGNATURE |coerce|
             ((|Any|) #1=(|UnivariatePuiseuxSeries| FE |x| |a|)))
            (SIGNATURE |retractIfCan| ((|Union| #1# "failed") (|Any|)))
            (SIGNATURE |retractable?| ((|Boolean|) (|Any|)))
            (SIGNATURE |retract| (#1# (|Any|)))))
          (|series| (|UnivariatePuiseuxSeries| FE |x| |a|)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 29)) (QREFELT % 31)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 32)))
                  (LETT |any1|
                        (|AnyFunctions1|
                         (|UnivariatePuiseuxSeries| (QREFELT % 7) |x| |a|)))
                  (LETT |series|
                        (SPADCALL
                         (|EXPR2UPS;iSeries|
                          (|EXPR2UPS;performSubstitution| |fcn| |x| |a| %) |x|
                          |a| %)
                         (|compiledLookupCheck| '|retract|
                                                (LIST
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|)
                                                 (LIST '|Any|))
                                                |any1|)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |series| |n|
                              (|compiledLookupCheck| '|extend|
                                                     (LIST '% '%
                                                           (LIST '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                     (|UnivariatePuiseuxSeries|
                                                      (ELT % 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeries|
                                                  (|devaluate| (ELT % 7)) |x|
                                                  |a|))
                                           |any1|)))))))))) 

(DECLAIM (NOTINLINE |ExpressionToUnivariatePowerSeries;|)) 

(DEFUN |ExpressionToUnivariatePowerSeries;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ExpressionToUnivariatePowerSeries| DV$1 DV$2))
          (LETT % (GETREFV 52))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ExpressionToUnivariatePowerSeries|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ExpressionToUnivariatePowerSeries| (&REST #1=#:G184)
  (SPROG NIL
         (PROG (#2=#:G185)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionToUnivariatePowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ExpressionToUnivariatePowerSeries;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionToUnivariatePowerSeries|)))))))))) 

(MAKEPROP '|ExpressionToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|Symbol|) (5 . |coerce|) (10 . +) (|Equation| 7)
              (16 . =) (|Equation| %) (22 . |eval|) (28 . |0|) (32 . |1|)
              (36 . |1|) (|Any|) |EXPR2UPS;taylor;SA;3| (|List| 10)
              (40 . |variables|) |EXPR2UPS;taylor;FEEA;6|
              |EXPR2UPS;taylor;FEA;4| (45 . |0|) (|NonNegativeInteger|)
              |EXPR2UPS;taylor;FENniA;5| (49 . |lhs|) (|Union| 10 '"failed")
              (54 . |retractIfCan|) (59 . |rhs|) |EXPR2UPS;taylor;FEENniA;7|
              |EXPR2UPS;laurent;SA;9| |EXPR2UPS;laurent;FEEA;12|
              |EXPR2UPS;laurent;FEA;10| (|Integer|) |EXPR2UPS;laurent;FEIA;11|
              |EXPR2UPS;laurent;FEEIA;13| (|Fraction| 37) (64 . |1|)
              |EXPR2UPS;puiseux;SA;15| |EXPR2UPS;puiseux;FEEA;18|
              |EXPR2UPS;puiseux;FEA;16| |EXPR2UPS;puiseux;FEFA;17|
              |EXPR2UPS;puiseux;FEEFA;19| |EXPR2UPS;series;SA;21|
              |EXPR2UPS;series;FEEA;24| |EXPR2UPS;series;FEA;22|
              |EXPR2UPS;series;FEFA;23| |EXPR2UPS;series;FEEFA;25|)
           '#(|taylor| 68 |series| 97 |puiseux| 126 |laurent| 155) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|taylor| ((|Any|) (|Symbol|))) T)
                                   '((|taylor| ((|Any|) |#2|)) T)
                                   '((|taylor|
                                      ((|Any|) |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|taylor|
                                      ((|Any|) |#2| (|Equation| |#2|)))
                                     T)
                                   '((|taylor|
                                      ((|Any|) |#2| (|Equation| |#2|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|laurent| ((|Any|) (|Symbol|))) T)
                                   '((|laurent| ((|Any|) |#2|)) T)
                                   '((|laurent| ((|Any|) |#2| (|Integer|))) T)
                                   '((|laurent|
                                      ((|Any|) |#2| (|Equation| |#2|)))
                                     T)
                                   '((|laurent|
                                      ((|Any|) |#2| (|Equation| |#2|)
                                       (|Integer|)))
                                     T)
                                   '((|puiseux| ((|Any|) (|Symbol|))) T)
                                   '((|puiseux| ((|Any|) |#2|)) T)
                                   '((|puiseux|
                                      ((|Any|) |#2| (|Fraction| (|Integer|))))
                                     T)
                                   '((|puiseux|
                                      ((|Any|) |#2| (|Equation| |#2|)))
                                     T)
                                   '((|puiseux|
                                      ((|Any|) |#2| (|Equation| |#2|)
                                       (|Fraction| (|Integer|))))
                                     T)
                                   '((|series| ((|Any|) (|Symbol|))) T)
                                   '((|series| ((|Any|) |#2|)) T)
                                   '((|series|
                                      ((|Any|) |#2| (|Fraction| (|Integer|))))
                                     T)
                                   '((|series|
                                      ((|Any|) |#2| (|Equation| |#2|)))
                                     T)
                                   '((|series|
                                      ((|Any|) |#2| (|Equation| |#2|)
                                       (|Fraction| (|Integer|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 51
                                            '(1 7 8 0 9 1 7 0 10 11 2 7 0 0 0
                                              12 2 13 0 7 7 14 2 7 0 0 15 16 0
                                              7 0 17 0 6 0 18 0 7 0 19 1 7 22 0
                                              23 0 6 0 26 1 13 7 0 29 1 7 30 0
                                              31 1 13 7 0 32 0 40 0 41 2 0 20 7
                                              13 24 3 0 20 7 13 27 33 2 0 20 7
                                              27 28 1 0 20 10 21 1 0 20 7 25 2
                                              0 20 7 13 48 3 0 20 7 13 40 51 2
                                              0 20 7 40 50 1 0 20 10 47 1 0 20
                                              7 49 2 0 20 7 13 43 3 0 20 7 13
                                              40 46 2 0 20 7 40 45 1 0 20 10 42
                                              1 0 20 7 44 2 0 20 7 13 35 3 0 20
                                              7 13 37 39 2 0 20 7 37 38 1 0 20
                                              10 34 1 0 20 7 36)))))
           '|lookupComplete|)) 
