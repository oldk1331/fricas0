
(SDEFUN |SYSSOLP;makeR2F| ((|r| (R)) (% (|Fraction| (|Polynomial| R))))
        (SPADCALL (SPADCALL |r| (QREFELT % 8)) (QREFELT % 10))) 

(SDEFUN |SYSSOLP;makeP2F|
        ((|p| (|Polynomial| (|Fraction| (|Polynomial| R))))
         (% (|Fraction| (|Polynomial| R))))
        (SPROG ((|lv| (|List| (|Symbol|))) (|v| NIL) (#1=#:G22 NIL))
               (SEQ (LETT |lv| (SPADCALL |p| (QREFELT % 13)))
                    (EXIT
                     (COND
                      ((SPADCALL |lv| NIL (QREFELT % 15))
                       (SPADCALL |p| (QREFELT % 16)))
                      ('T
                       (SEQ
                        (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |p| (SPADCALL |p| |v| (QREFELT % 19)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |p| (QREFELT % 16)))))))))) 

(SDEFUN |SYSSOLP;makeEq|
        ((|p| (|Polynomial| (|Fraction| (|Polynomial| R))))
         (|lv| (|List| (|Symbol|)))
         (% (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((|np| (|Polynomial| R)) (|lx| (|List| (|Symbol|))) (|x| NIL)
          (#1=#:G29 NIL) (#2=#:G28 NIL)
          (|up| (|SparseUnivariatePolynomial| (|Polynomial| R))))
         (SEQ (LETT |np| (SPADCALL (|SYSSOLP;makeP2F| |p| %) (QREFELT % 20)))
              (LETT |lx| (SPADCALL |np| (QREFELT % 21)))
              (SEQ
               (EXIT
                (SEQ (LETT |x| NIL) (LETT #1# |lv|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |lx| (QREFELT % 22))
                         (PROGN (LETT #2# 1) (GO #3=#:G25))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #2#))
              (LETT |up| (SPADCALL |np| |x| (QREFELT % 24)))
              (EXIT
               (COND
                ((EQL (SPADCALL |up| (QREFELT % 27)) 1)
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT % 29)) (QREFELT % 10))
                  (SPADCALL
                   (SPADCALL (SPADCALL |up| 0 (QREFELT % 32))
                             (SPADCALL |up| (QREFELT % 33)) (QREFELT % 34))
                   (QREFELT % 35))
                  (QREFELT % 37)))
                ('T
                 (SPADCALL (SPADCALL |np| (QREFELT % 10)) (|spadConstant| % 31)
                           (QREFELT % 37)))))))) 

(SDEFUN |SYSSOLP;varInF| ((|v| (|Symbol|)) (% (|Fraction| (|Polynomial| R))))
        (SPADCALL (SPADCALL |v| (QREFELT % 29)) (QREFELT % 10))) 

(SDEFUN |SYSSOLP;newInF| ((|n| (|Integer|)) (% (|Fraction| (|Polynomial| R))))
        (|SYSSOLP;varInF| (SPADCALL (QREFELT % 38)) %)) 

(SDEFUN |SYSSOLP;testDegree|
        ((|f| (|Polynomial| R)) (|lv| (|List| (|Symbol|))) (% (|Boolean|)))
        (SPROG
         ((|vv| NIL) (#1=#:G37 NIL) (#2=#:G35 #3=(|Boolean|)) (#4=#:G33 #3#)
          (#5=#:G34 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |vv| NIL) (LETT #1# |lv|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |vv| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2# (> (SPADCALL |f| |vv| (QREFELT % 39)) 0))
                   (COND (#5# (LETT #4# (COND (#4# 'T) ('T #2#))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T NIL)))))) 

(SDEFUN |SYSSOLP;triangularSystems;LLL;7|
        ((|lf| (|List| (|Fraction| (|Polynomial| R))))
         (|lv| (|List| (|Symbol|))) (% (|List| (|List| (|Polynomial| R)))))
        (SPROG
         ((|p| (|Polynomial| R)) (|fp| (|Factored| (|Polynomial| R)))
          (#1=#:G74 NIL) (|ff| NIL) (#2=#:G75 NIL)
          (|dmp|
           (|Join|
            (|PolynomialCategory| (|Polynomial| R)
                                  (|DirectProduct| (|#| |lv|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lv|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| (% % (|List| (|Integer|)))))))
          (OV
           (|Join| (|OrderedSet|) (|Finite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|))) (|Hashable|)
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| % "failed") (|Symbol|))))))
          (DP
           (|Join|
            (|DirectProductCategory| (|call| LENGTH |lv|)
                                     #3=(|NonNegativeInteger|))
            (CATEGORY |package|
             (IF (|has| #3# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (|push|
           (CATEGORY |package| (SIGNATURE |pushdown| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |pushup| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |map|
             (|dmp| (|Mapping| |dmp| (|Polynomial| R)) |dmp|))))
          (#4=#:G76 NIL) (|vv| NIL) (#5=#:G77 NIL) (#6=#:G51 NIL)
          (|lvv| (|List| OV)) (#7=#:G78 NIL) (#8=#:G79 NIL)
          (|df| (|Polynomial| R)) (|lq| (|List| |dmp|)) (#9=#:G80 NIL)
          (|f| NIL) (#10=#:G81 NIL) (|lp| (|List| |dmp|))
          (|gb|
           (CATEGORY |package|
            (SIGNATURE |credPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |redPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |gbasis|
             ((|List| |dmp|) (|List| |dmp|) (|Integer|) (|Integer|)))
            (SIGNATURE |gbasisExtend|
             ((|List| |dmp|) (|List| |dmp|) (|List| |dmp|) (|Integer|)
              (|Integer|)))
            (SIGNATURE |critT|
             ((|Boolean|)
              (|Record|
               (|:| |lcmfij|
                    #11=(|DirectProduct| (|call| LENGTH |lv|)
                                         (|NonNegativeInteger|)))
               (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |dmp|)
               (|:| |polj| |dmp|))))
            (SIGNATURE |critM| ((|Boolean|) #11# #11#))
            (SIGNATURE |critB| ((|Boolean|) #11# #11# #11# #11#))
            (SIGNATURE |critBonD|
             ((|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              |dmp|
              (|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMTonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              #11#
              (|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |redPo|
             ((|Record| (|:| |poly| |dmp|) (|:| |mult| (|Polynomial| R))) |dmp|
              (|List| |dmp|)))
            (SIGNATURE |hMonic| (|dmp| |dmp|))
            (SIGNATURE |updatF|
             ((|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))
              |dmp| (|NonNegativeInteger|)
              (|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))))
            (SIGNATURE |sPol|
             (|dmp|
              (|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |updatD|
             ((|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #11#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |minGbasis| ((|List| |dmp|) (|List| |dmp|)))
            (SIGNATURE |lepol| ((|Integer|) |dmp|))
            (SIGNATURE |prinshINFO| ((|Void|) |dmp|))
            (SIGNATURE |prindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |fprindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |prinpolINFO| ((|Void|) (|List| |dmp|)))
            (SIGNATURE |prinb| ((|Void|) (|Integer|)))
            (SIGNATURE |critpOrder|
             ((|Boolean|)
              (|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |makeCrit|
             ((|Record| (|:| |lcmfij| #11#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |pol| |dmp|))
              |dmp| (|NonNegativeInteger|)))
            (SIGNATURE |virtualDegree| ((|NonNegativeInteger|) |dmp|))))
          (#12=#:G82 NIL) (#13=#:G83 NIL) (|fq| NIL) (#14=#:G84 NIL)
          (#15=#:G61 #16=(|Boolean|)) (#17=#:G59 #16#) (#18=#:G60 NIL)
          (|parRes|
           (|List|
            (|List|
             (|DistributedMultivariatePolynomial| |lv| (|Polynomial| R)))))
          (#19=#:G85 NIL) (|pr| NIL) (#20=#:G86 NIL) (#21=#:G87 NIL) (|pf| NIL)
          (#22=#:G88 NIL))
         (SEQ
          (COND ((OR (NULL |lv|) (NULL |lf|)) NIL)
                ((EQL (LENGTH |lf|) 1)
                 (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lf|) (QREFELT % 20)))
                      (LETT |fp| (SPADCALL |p| (QREFELT % 42)))
                      (EXIT
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |ff| NIL)
                             (LETT #2# (SPADCALL |fp| (QREFELT % 46))) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ff| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|SYSSOLP;testDegree| (QVELT |ff| 1) |lv| %)
                                 (LETT #1#
                                       (CONS (LIST (QVELT |ff| 1)) #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))))
                (#23='T
                 (SEQ
                  (LETT |dmp|
                        (|DistributedMultivariatePolynomial| |lv|
                                                             (|Polynomial|
                                                              (QREFELT % 6))))
                  (LETT OV (|OrderedVariableList| |lv|))
                  (LETT DP
                        (|DirectProduct| (LENGTH |lv|) (|NonNegativeInteger|)))
                  (LETT |push| (|PushVariables| (QREFELT % 6) DP OV |dmp|))
                  (LETT |lvv|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |vv| NIL) (LETT #5# |lv|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |vv| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL |vv|
                                                           (|compiledLookupCheck|
                                                            '|variable|
                                                            (LIST
                                                             (LIST '|Union| '%
                                                                   '#24="failed")
                                                             (LIST '|Symbol|))
                                                            OV)))
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0) OV
                                                         (|Union| OV #24#)
                                                         #6#))
                                       #4#))))
                              (LETT #5# (CDR #5#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (LETT |lq|
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |f| NIL) (LETT #8# |lf|) G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |f| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |df| (SPADCALL |f| (QREFELT % 47)))
                                   (|spadConstant| % 48) (QREFELT % 49))
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |df|
                                                    (|compiledLookupCheck|
                                                     '|coerce|
                                                     (LIST '%
                                                           (LIST '|Polynomial|
                                                                 (|devaluate|
                                                                  (ELT % 6))))
                                                     |dmp|))
                                          |lvv|
                                          (|compiledLookupCheck| '|pushup|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         OV)))
                                                                 |push|))
                                         #7#))))))
                              (LETT #8# (CDR #8#)) (GO G190) G191
                              (EXIT (NREVERSE #7#)))))
                  (LETT |lp|
                        (PROGN
                         (LETT #9# NIL)
                         (SEQ (LETT |f| NIL) (LETT #10# |lf|) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |f| (CAR #10#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #9#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |f| (QREFELT % 20))
                                                  (|compiledLookupCheck|
                                                   '|coerce|
                                                   (LIST '%
                                                         (LIST '|Polynomial|
                                                               (|devaluate|
                                                                (ELT % 6))))
                                                   |dmp|))
                                        |lvv|
                                        (|compiledLookupCheck| '|pushup|
                                                               (LIST
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (LIST '|List|
                                                                      (|devaluate|
                                                                       OV)))
                                                               |push|))
                                       #9#))))
                              (LETT #10# (CDR #10#)) (GO G190) G191
                              (EXIT (NREVERSE #9#)))))
                  (LETT |parRes|
                        (SPADCALL |lp| |lvv|
                                  (|compiledLookupCheck| '|groebSolve|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|List|
                                                                      (LIST
                                                                       '|DistributedMultivariatePolynomial|
                                                                       |lv|
                                                                       (LIST
                                                                        '|Polynomial|
                                                                        (|devaluate|
                                                                         (ELT %
                                                                              6))))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT %
                                                                        6)))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|OrderedVariableList|
                                                                 |lv|)))
                                                         (|GroebnerSolve| |lv|
                                                                          (|Polynomial|
                                                                           (ELT
                                                                            %
                                                                            6))
                                                                          (ELT
                                                                           %
                                                                           6)))))
                  (COND
                   ((SPADCALL |lq| NIL
                              (|compiledLookupCheck| '~=
                                                     (LIST (LIST '|Boolean|) '%
                                                           '%)
                                                     (|List| |dmp|)))
                    (SEQ
                     (LETT |gb|
                           (|GroebnerInternalPackage|
                            (|Polynomial| (QREFELT % 6))
                            (|DirectProduct| (LENGTH |lv|)
                                             (|NonNegativeInteger|))
                            |dmp|))
                     (EXIT
                      (LETT |parRes|
                            (PROGN
                             (LETT #12# NIL)
                             (SEQ (LETT |pr| NIL) (LETT #13# |parRes|) G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN (LETT |pr| (CAR #13#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((PROGN
                                       (LETT #18# NIL)
                                       (SEQ (LETT |fq| NIL) (LETT #14# |lq|)
                                            G190
                                            (COND
                                             ((OR (ATOM #14#)
                                                  (PROGN
                                                   (LETT |fq| (CAR #14#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #15#
                                                     (SPADCALL
                                                      (SPADCALL |fq| |pr|
                                                                (|compiledLookupCheck|
                                                                 '|redPol|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |dmp|)))
                                                                 |gb|))
                                                      (SPADCALL
                                                       (|compiledLookupCheck|
                                                        '|0| (LIST '%) |dmp|))
                                                      (|compiledLookupCheck|
                                                       '~=
                                                       (LIST (LIST '|Boolean|)
                                                             '% '%)
                                                       |dmp|)))
                                               (COND
                                                (#18#
                                                 (LETT #17#
                                                       (COND (#17# #15#)
                                                             ('T NIL))))
                                                ('T
                                                 (PROGN
                                                  (LETT #17# #15#)
                                                  (LETT #18# 'T)))))))
                                            (LETT #14# (CDR #14#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (COND (#18# #17#) (#23# 'T)))
                                      (LETT #12# (CONS |pr| #12#))))))
                                  (LETT #13# (CDR #13#)) (GO G190) G191
                                  (EXIT (NREVERSE #12#)))))))))
                  (EXIT
                   (PROGN
                    (LETT #19# NIL)
                    (SEQ (LETT |pr| NIL) (LETT #20# |parRes|) G190
                         (COND
                          ((OR (ATOM #20#) (PROGN (LETT |pr| (CAR #20#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #19#
                                 (CONS
                                  (PROGN
                                   (LETT #21# NIL)
                                   (SEQ (LETT |pf| NIL) (LETT #22# |pr|) G190
                                        (COND
                                         ((OR (ATOM #22#)
                                              (PROGN
                                               (LETT |pf| (CAR #22#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #21#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |pf| |lvv|
                                                            (|compiledLookupCheck|
                                                             '|pushdown|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     OV)))
                                                             |push|))
                                                  (|compiledLookupCheck|
                                                   '|retract|
                                                   (LIST
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT % 6)))
                                                    '%)
                                                   |dmp|))
                                                 #21#))))
                                        (LETT #22# (CDR #22#)) (GO G190) G191
                                        (EXIT (NREVERSE #21#))))
                                  #19#))))
                         (LETT #20# (CDR #20#)) (GO G190) G191
                         (EXIT (NREVERSE #19#))))))))))) 

(SDEFUN |SYSSOLP;solve;FL;8|
        ((|pol| (|Fraction| (|Polynomial| R)))
         (% (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |pol| (QREFELT % 53))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pol| (QREFELT % 20))
                                     (QREFELT % 21))
                           (SPADCALL (SPADCALL |pol| (QREFELT % 47))
                                     (QREFELT % 21))
                           (QREFELT % 54))
                          (QREFELT % 55)))
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((> (LENGTH |lv|) 1) (|error| "too many variables"))
                          (#1#
                           (SPADCALL |pol| (|SPADfirst| |lv|)
                                     (QREFELT % 57))))))))))) 

(SDEFUN |SYSSOLP;solve;EL;9|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| R))))
         (% (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|pol| (|Fraction| (|Polynomial| R))) (|lv| (|List| (|Symbol|))))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL |eq| (QREFELT % 59))
                          (SPADCALL |eq| (QREFELT % 60)) (QREFELT % 61)))
          (EXIT
           (COND
            ((SPADCALL |pol| (QREFELT % 53))
             (|error| "equation is always satisfied"))
            (#1='T
             (SEQ
              (LETT |lv|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |pol| (QREFELT % 20)) (QREFELT % 21))
                      (SPADCALL (SPADCALL |pol| (QREFELT % 47)) (QREFELT % 21))
                      (QREFELT % 54))
                     (QREFELT % 55)))
              (EXIT
               (COND ((NULL |lv|) (|error| "inconsistent equation"))
                     ((> (LENGTH |lv|) 1) (|error| "too many variables"))
                     (#1#
                      (SPADCALL |pol| (|SPADfirst| |lv|)
                                (QREFELT % 57)))))))))))) 

(SDEFUN |SYSSOLP;solve;ESL;10|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| R)))) (|var| (|Symbol|))
         (% (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 59))
                   (SPADCALL |eq| (QREFELT % 60)) (QREFELT % 61))
         |var| (QREFELT % 57))) 

(SDEFUN |SYSSOLP;solve;FSL;11|
        ((|pol| (|Fraction| (|Polynomial| R))) (|var| (|Symbol|))
         (% (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|p| (|Polynomial| R)) (|fp| (|Factored| (|Polynomial| R)))
          (#1=#:G105 NIL) (|ff| NIL) (#2=#:G106 NIL))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT % 6) '(|GcdDomain|))
            (SEQ
             (LETT |p|
                   (SPADCALL (SPADCALL |pol| (QREFELT % 20)) |var|
                             (QREFELT % 64)))
             (LETT |fp| (SPADCALL |p| (QREFELT % 42)))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |ff| NIL) (LETT #2# (SPADCALL |fp| (QREFELT % 46)))
                    G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1#
                            (CONS
                             (|SYSSOLP;makeEq|
                              (SPADCALL (CONS (|function| |SYSSOLP;makeR2F|) %)
                                        (QVELT |ff| 1) (QREFELT % 67))
                              (LIST |var|) %)
                             #1#))))
                    (LETT #2# (CDR #2#)) (GO G190) G191
                    (EXIT (NREVERSE #1#)))))))
           ('T NIL))))) 

(SDEFUN |SYSSOLP;makePolys|
        ((|l| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         (% (|List| (|Fraction| (|Polynomial| R)))))
        (SPROG ((#1=#:G110 NIL) (|e| NIL) (#2=#:G111 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |e| NIL) (LETT #2# |l|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |e| (QREFELT % 59))
                                         (SPADCALL |e| (QREFELT % 60))
                                         (QREFELT % 61))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SYSSOLP;linSolve|
        ((|lp| (|List| (|Fraction| (|Polynomial| R))))
         (|lv| (|List| (|Symbol|)))
         (%
          (|Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
                   "failed")))
        (SPROG
         ((#1=#:G135 NIL) (|f| NIL) (#2=#:G136 NIL)
          (|lr| (|List| (|Polynomial| R)))
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Polynomial| R))) "failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
          (#3=#:G123 NIL) (|rhs| (|Vector| (|Fraction| (|Polynomial| R))))
          (|zeron| (|Vector| (|Fraction| (|Polynomial| R)))) (|p| NIL)
          (#4=#:G137 NIL) (|sym| (|Fraction| (|Polynomial| R))) (#5=#:G138 NIL)
          (|i| NIL) (#6=#:G139 NIL)
          (|eqs| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
         (SEQ
          (LETT |lr|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |f| (QREFELT % 20)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |rec| (SPADCALL |lr| |lv| (QREFELT % 72)))
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |rhs|
                         (PROG2 (LETT #3# (QCAR |rec|))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0)
                                           (|Vector|
                                            (|Fraction|
                                             (|Polynomial| (QREFELT % 6))))
                                           (|Union|
                                            (|Vector|
                                             (|Fraction|
                                              (|Polynomial| (QREFELT % 6))))
                                            "failed")
                                           #3#)))
                   (LETT |zeron| (SPADCALL (LENGTH |lv|) (QREFELT % 74)))
                   (SEQ (LETT |p| NIL) (LETT #4# (QCDR |rec|)) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |p| |zeron| (QREFELT % 75))
                            (SEQ (LETT |sym| (|SYSSOLP;newInF| 1 %))
                                 (EXIT
                                  (SEQ (LETT |i| 1) (LETT #5# (LENGTH |lv|))
                                       G190
                                       (COND
                                        ((|greater_SI| |i| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rhs| |i|
                                                   (SPADCALL
                                                    (SPADCALL |rhs| |i|
                                                              (QREFELT % 77))
                                                    (SPADCALL |sym|
                                                              (SPADCALL |p| |i|
                                                                        (QREFELT
                                                                         % 77))
                                                              (QREFELT % 78))
                                                    (QREFELT % 79))
                                                   (QREFELT % 80))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))))))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (LETT |eqs| NIL)
                   (SEQ (LETT |i| 1) (LETT #6# (LENGTH |lv|)) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |eqs|
                                (SPADCALL |eqs|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |lv| |i|
                                                        (QREFELT % 81))
                                              (QREFELT % 29))
                                             (QREFELT % 10))
                                            (SPADCALL |rhs| |i| (QREFELT % 77))
                                            (QREFELT % 82)))
                                          (QREFELT % 83)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |eqs|))))))))) 

(SDEFUN |SYSSOLP;solve;LL;14|
        ((|lr| (|List| (|Fraction| (|Polynomial| R))))
         (% (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
        (SPROG
         ((|p| NIL) (#1=#:G145 NIL) (#2=#:G142 #3=(|List| (|Symbol|)))
          (#4=#:G140 #3#) (#5=#:G141 NIL) (|lv| #3#))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |p| NIL) (LETT #1# |lr|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT % 20))
                                          (QREFELT % 21))
                                (SPADCALL (SPADCALL |p| (QREFELT % 47))
                                          (QREFELT % 21))
                                (QREFELT % 84)))
                         (COND
                          (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 84))))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |lr| |lv| (QREFELT % 86)))))) 

(SDEFUN |SYSSOLP;solve;LL;15|
        ((|le| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         (% (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
        (SPROG
         ((|lr| (|List| (|Fraction| (|Polynomial| R)))) (|p| NIL)
          (#1=#:G151 NIL) (#2=#:G148 #3=(|List| (|Symbol|))) (#4=#:G146 #3#)
          (#5=#:G147 NIL) (|lv| #3#))
         (SEQ (LETT |lr| (|SYSSOLP;makePolys| |le| %))
              (LETT |lv|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |p| NIL) (LETT #1# |lr|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p| (QREFELT % 20))
                                              (QREFELT % 21))
                                    (SPADCALL (SPADCALL |p| (QREFELT % 47))
                                              (QREFELT % 21))
                                    (QREFELT % 84)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 84))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T (|IdentityError| '|setUnion|)))))
              (EXIT (SPADCALL |lr| |lv| (QREFELT % 86)))))) 

(SDEFUN |SYSSOLP;solve;LLL;16|
        ((|le| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
         (|lv| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
        (SPADCALL (|SYSSOLP;makePolys| |le| %) |lv| (QREFELT % 86))) 

(SDEFUN |SYSSOLP;checkLinear|
        ((|lr| (|List| (|Fraction| (|Polynomial| R))))
         (|vl| (|List| (|Symbol|))) (% (|Boolean|)))
        (SPROG
         ((#1=#:G167 NIL) (#2=#:G168 NIL) (|ld| (|List| (|Polynomial| R)))
          (|f| NIL) (#3=#:G169 NIL) (|x| NIL) (#4=#:G170 NIL)
          (#5=#:G158 #6=(|Boolean|)) (#7=#:G156 #6#) (#8=#:G157 NIL)
          (#9=#:G166 NIL) (|pol| NIL) (#10=#:G171 NIL)
          (#11=#:G163 #12=(|Boolean|)) (#13=#:G161 #12#) (#14=#:G162 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ld|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |pol| NIL) (LETT #2# |lr|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS (SPADCALL |pol| (QREFELT % 47)) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (SEQ (LETT |f| NIL) (LETT #3# |ld|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((PROGN
                      (LETT #8# NIL)
                      (SEQ (LETT |x| NIL)
                           (LETT #4# (SPADCALL |f| (QREFELT % 21))) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #5# (SPADCALL |x| |vl| (QREFELT % 22)))
                              (COND (#8# (LETT #7# (COND (#7# 'T) ('T #5#))))
                                    ('T
                                     (PROGN (LETT #7# #5#) (LETT #8# 'T)))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (COND (#8# #7#) ('T NIL)))
                     (PROGN (LETT #9# NIL) (GO #15=#:G165))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #14# NIL)
              (SEQ (LETT |pol| NIL) (LETT #10# |lr|) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |pol| (CAR #10#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #11#
                            (<
                             (SPADCALL (SPADCALL |pol| (QREFELT % 20)) |vl|
                                       (QREFELT % 90))
                             2))
                      (COND (#14# (LETT #13# (COND (#13# #11#) ('T NIL))))
                            ('T (PROGN (LETT #13# #11#) (LETT #14# 'T)))))))
                   (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
              (COND (#14# #13#) ('T 'T))))))
          #15# (EXIT #9#)))) 

(SDEFUN |SYSSOLP;solve;LLL;18|
        ((|lr| (|List| (|Fraction| (|Polynomial| R))))
         (|vl| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
        (SPROG
         ((|soln|
           (|Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
                    "failed"))
          (|i| NIL) (#1=#:G186 NIL) (|lhs| (|Fraction| (|Polynomial| R)))
          (|rhs| (|Fraction| (|Polynomial| R)))
          (|eqns| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (|parRes| (|List| (|List| (|Polynomial| R)))) (#2=#:G187 NIL)
          (|pr| NIL) (#3=#:G188 NIL) (#4=#:G189 NIL) (|f| NIL) (#5=#:G190 NIL))
         (SEQ
          (COND ((NULL |vl|) NIL)
                ((|SYSSOLP;checkLinear| |lr| |vl| %)
                 (SEQ (LETT |soln| (|SYSSOLP;linSolve| |lr| |vl| %))
                      (EXIT
                       (COND ((QEQCAR |soln| 1) NIL)
                             (#6='T
                              (SEQ (LETT |eqns| NIL)
                                   (SEQ (LETT |i| 1) (LETT #1# (LENGTH |vl|))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (LETT |lhs|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |vl| |i|
                                                           (QREFELT % 81))
                                                 (QREFELT % 29))
                                                (QREFELT % 10)))
                                         (LETT |rhs|
                                               (SPADCALL
                                                (SPADCALL (QCDR |soln|) |i|
                                                          (QREFELT % 91))
                                                (QREFELT % 60)))
                                         (EXIT
                                          (LETT |eqns|
                                                (SPADCALL |eqns|
                                                          (LIST
                                                           (SPADCALL |lhs|
                                                                     |rhs|
                                                                     (QREFELT %
                                                                              82)))
                                                          (QREFELT % 83)))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (LIST |eqns|))))))))
                ((|HasCategory| (QREFELT % 6) '(|GcdDomain|))
                 (SEQ (LETT |parRes| (SPADCALL |lr| |vl| (QREFELT % 52)))
                      (EXIT
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |pr| NIL) (LETT #3# |parRes|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |pr| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |f| NIL) (LETT #5# |pr|) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |f| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (|SYSSOLP;makeEq|
                                                      (SPADCALL
                                                       (CONS
                                                        (|function|
                                                         |SYSSOLP;makeR2F|)
                                                        %)
                                                       |f| (QREFELT % 67))
                                                      |vl| %)
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      #2#))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))
                (#6# (LIST NIL)))))) 

(DECLAIM (NOTINLINE |SystemSolvePackage;|)) 

(DEFUN |SystemSolvePackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SystemSolvePackage| DV$1))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SystemSolvePackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |SystemSolvePackage| (#1=#:G191)
  (SPROG NIL
         (PROG (#2=#:G192)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SystemSolvePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SystemSolvePackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemSolvePackage|)))))))))) 

(MAKEPROP '|SystemSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (0 . |coerce|) (|Fraction| 7) (5 . |coerce|) (|List| 17)
              (|Polynomial| 9) (10 . |variables|) (|Boolean|) (15 . =)
              (21 . |retract|) (|Symbol|)
              (|MPolyCatRationalFunctionFactorizer| (|IndexedExponents| 17) 17
                                                    6 12)
              (26 . |pushdown|) (32 . |numer|) (37 . |variables|)
              (42 . |member?|) (|SparseUnivariatePolynomial| %)
              (48 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (54 . |degree|) (59 . |1|)
              (63 . |coerce|) (68 . |0|) (72 . |0|) (76 . |coefficient|)
              (82 . |leadingCoefficient|) (87 . /) (93 . -) (|Equation| 9)
              (98 . |equation|) (104 . |new|) (108 . |degree|) (|Factored| 7)
              (|GeneralizedMultivariateFactorize| 17 (|IndexedExponents| 17) 6
                                                  6 7)
              (114 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 43) (|:| |factor| 7) (|:| |exponent| 25))
              (|List| 44) (119 . |factorList|) (124 . |denom|) (129 . |1|)
              (133 . ~=) (|List| 70) (|List| 9)
              |SYSSOLP;triangularSystems;LLL;7| (139 . |zero?|)
              (144 . |concat|) (150 . |removeDuplicates|) (|List| 36)
              |SYSSOLP;solve;FSL;11| |SYSSOLP;solve;FL;8| (155 . |lhs|)
              (160 . |rhs|) (165 . -) |SYSSOLP;solve;EL;9|
              |SYSSOLP;solve;ESL;10| (171 . |primitivePart|) (|Mapping| 9 6)
              (|PolynomialFunctions2| 6 9) (177 . |map|) (|Union| 73 '"failed")
              (|Record| (|:| |particular| 68) (|:| |basis| (|List| 73)))
              (|List| 7)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 17) 17 7)
              (183 . |linSolve|) (|Vector| 9) (189 . |zero|) (194 . ~=)
              (|Integer|) (200 . |elt|) (206 . *) (212 . +) (218 . |setelt!|)
              (225 . |elt|) (231 . =) (237 . |append|) (243 . |setUnion|)
              (|List| 56) |SYSSOLP;solve;LLL;18| |SYSSOLP;solve;LL;14|
              |SYSSOLP;solve;LL;15| |SYSSOLP;solve;LLL;16|
              (249 . |totalDegree|) (255 . |elt|))
           '#(|triangularSystems| 261 |solve| 267) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Fraction| (|Polynomial| |#1|)) (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Equation| (|Fraction| (|Polynomial| |#1|)))
                                  (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Fraction| (|Polynomial| |#1|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Equation|
                                   (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|triangularSystems|
                                 ((|List| (|List| (|Polynomial| |#1|)))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 91
                                            '(1 7 0 6 8 1 9 0 7 10 1 12 11 0 13
                                              2 11 14 0 0 15 1 12 9 0 16 2 18
                                              12 12 17 19 1 9 7 0 20 1 7 11 0
                                              21 2 11 14 17 0 22 2 7 23 0 17 24
                                              1 26 25 0 27 0 6 0 28 1 7 0 17 29
                                              0 6 0 30 0 9 0 31 2 26 7 0 25 32
                                              1 26 7 0 33 2 9 0 7 7 34 1 9 0 0
                                              35 2 36 0 9 9 37 0 17 0 38 2 7 25
                                              0 17 39 1 41 40 7 42 1 40 45 0 46
                                              1 9 7 0 47 0 7 0 48 2 7 14 0 0 49
                                              1 9 14 0 53 2 11 0 0 0 54 1 11 0
                                              0 55 1 36 9 0 59 1 36 9 0 60 2 9
                                              0 0 0 61 2 7 0 0 17 64 2 66 12 65
                                              7 67 2 71 69 70 11 72 1 73 0 25
                                              74 2 73 14 0 0 75 2 73 9 0 76 77
                                              2 9 0 0 0 78 2 9 0 0 0 79 3 73 9
                                              0 76 9 80 2 11 17 0 76 81 2 36 0
                                              9 9 82 2 56 0 0 0 83 2 11 0 0 0
                                              84 2 7 25 0 11 90 2 56 36 0 76 91
                                              2 0 50 51 11 52 1 0 56 36 62 1 0
                                              56 9 58 2 0 56 9 17 57 2 0 56 36
                                              17 63 1 0 85 51 87 1 0 85 56 88 2
                                              0 85 51 11 86 2 0 85 56 11
                                              89)))))
           '|lookupComplete|)) 
