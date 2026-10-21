
(SDEFUN |SYMANA;ansatz;Jvf;1|
        ((% (|JetVectorField| JB1 (|JetBundleExpression| JB1))))
        (SPROG
         ((#1=#:G46 NIL) (#2=#:G36 NIL) (|i| NIL) (#3=#:G47 NIL)
          (|s| (|Symbol|)) (|f| (|JetBundleExpression| JB1)) (#4=#:G41 NIL)
          (|res| (|JetVectorField| JB1 (|JetBundleExpression| JB1))))
         (SEQ (LETT |res| (|spadConstant| % 35))
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 11)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |s| (SPADCALL (QREFELT % 22) |i| (QREFELT % 37)))
                        (LETT |f|
                              (SPADCALL |s| (QREFELT % 33) 0 (QREFELT % 39)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |f|
                                                   (SPADCALL
                                                    (PROG1 (LETT #2# |i|)
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT % 40))
                                                   (QREFELT % 41))
                                         (QREFELT % 42)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 13)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |s|
                          (SPADCALL (QREFELT % 22) (+ (QREFELT % 11) |i|)
                                    (QREFELT % 37)))
                    (LETT |f| (SPADCALL |s| (QREFELT % 33) 0 (QREFELT % 39)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #4# |i|)
                                                  (|check_subtype2| (> #4# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #4#))
                                                (QREFELT % 43))
                                               (QREFELT % 41))
                                     (QREFELT % 42)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SYMANA;transform;JbeJbe;2|
        ((|f| (|JetBundleExpression| JB1))
         (% (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((|LKernels| (|List| (|Kernel| (|JetBundleExpression| JB1))))
          (#1=#:G94 NIL) (#2=#:G95 NIL) (|LOps| (|List| (|BasicOperator|)))
          (|Op| NIL) (#3=#:G97 NIL) (|Ke| NIL) (#4=#:G96 NIL) (#5=#:G55 NIL)
          (|typ| (|Symbol|)) (|ind| #6=(|Integer|)) (#7=#:G61 NIL)
          (#8=#:G63 NIL) (#9=#:G68 NIL) (|fname| (|Symbol|))
          (|pos| (|Integer|)) (|num| #6#) (|i| NIL) (#10=#:G98 NIL)
          (|arg| (|List| (|JetBundleExpression| JB1)))
          (|rarg| (|List| (|JetBundleExpression| JB1)))
          (|diff| (|List| (|JetBundleExpression| JB1))) (#11=#:G78 NIL)
          (#12=#:G80 NIL) (|up| (|PositiveInteger|)) (|d| NIL) (#13=#:G99 NIL)
          (|id| #6#) (#14=#:G83 NIL) (|lower| (|List| (|PositiveInteger|)))
          (JV (|List| (|Expression| (|Integer|))))
          (|SubL| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|g| (|Expression| (|Integer|))))
         (SEQ (LETT JV NIL) (LETT |SubL| NIL)
              (LETT |LKernels| (SPADCALL |f| (QREFELT % 46)))
              (LETT |LOps|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |Ke| NIL) (LETT #2# |LKernels|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |Ke| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |Ke| (QREFELT % 49)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |Op| NIL) (LETT #3# |LOps|) (LETT |Ke| NIL)
                   (LETT #4# |LKernels|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |Ke| (CAR #4#)) NIL)
                         (ATOM #3#) (PROGN (LETT |Op| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT % 51))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #5#
                                        (SPADCALL |Op| '|%jet| (QREFELT % 53)))
                                  (QCDR #5#)
                                (|check_union2| (QEQCAR #5# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #5#)))
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Deriv|)
                           (|error|
                            "function contains illegal jet variables in transform"))
                          ('T
                           (SEQ
                            (LETT |ind|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |Ke| (QREFELT % 55))
                                             (QREFELT % 56))
                                   (QREFELT % 57)))
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #7# |ind|)
                                       (|check_subtype2| (> #7# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #7#))
                                     (QREFELT % 59))
                                    (QREFELT % 61))
                                   JV))
                            (EXIT
                             (COND
                              ((> |ind| (QREFELT % 11))
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1
                                              (LETT #8#
                                                    (- |ind| (QREFELT % 11)))
                                            (|check_subtype2| (> #8# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                          (QREFELT % 15))
                                         (QREFELT % 62))
                                        (QREFELT % 63)))
                                      |SubL|)))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #9# |ind|)
                                            (|check_subtype2| (> #9# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #9#))
                                          (QREFELT % 14))
                                         (QREFELT % 62))
                                        (QREFELT % 63)))
                                      |SubL|)))))))))))
                      ('T
                       (SEQ (LETT |fname| (SPADCALL |Op| (QREFELT % 64)))
                            (LETT |pos|
                                  (SPADCALL |fname| (QREFELT % 22)
                                            (QREFELT % 65)))
                            (EXIT
                             (COND
                              ((>= |pos| (PROGN (QREFELT % 22) 1))
                               (SEQ (LETT |arg| (SPADCALL |Ke| (QREFELT % 55)))
                                    (EXIT
                                     (COND
                                      ((> (LENGTH |arg|) 3)
                                       (SEQ (LETT |arg| (CDR |arg|))
                                            (LETT |num|
                                                  (SPADCALL (|SPADfirst| |arg|)
                                                            (QREFELT % 57)))
                                            (LETT |arg| (CDR (CDR |arg|)))
                                            (LETT |rarg| NIL)
                                            (SEQ (LETT |i| 1) (LETT #10# |num|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #10#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |rarg|
                                                        (CONS
                                                         (|SPADfirst| |arg|)
                                                         |rarg|))
                                                  (EXIT
                                                   (LETT |arg| (CDR |arg|))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (LETT |rarg| (NREVERSE |rarg|))
                                            (LETT |diff| |arg|)
                                            (EXIT
                                             (COND
                                              ((NULL |diff|)
                                               (SEQ
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #11# |pos|)
                                                           (|check_subtype2|
                                                            (> #11# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #11#))
                                                         (QREFELT % 66))
                                                        (QREFELT % 61))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT %
                                                                              68))
                                                           (QREFELT % 69))
                                                          (QREFELT % 63)))
                                                        |SubL|)))))
                                              ('T
                                               (SEQ
                                                (LETT |up|
                                                      (PROG1 (LETT #12# |pos|)
                                                        (|check_subtype2|
                                                         (> #12# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #12#)))
                                                (LETT |lower| NIL)
                                                (SEQ (LETT |d| NIL)
                                                     (LETT #13# |diff|) G190
                                                     (COND
                                                      ((OR (ATOM #13#)
                                                           (PROGN
                                                            (LETT |d|
                                                                  (CAR #13#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |id|
                                                            (SPADCALL |d|
                                                                      (QREFELT
                                                                       % 57)))
                                                      (EXIT
                                                       (LETT |lower|
                                                             (CONS
                                                              (PROG1
                                                                  (LETT #14#
                                                                        |id|)
                                                                (|check_subtype2|
                                                                 (> #14# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|Integer|)
                                                                 #14#))
                                                              |lower|))))
                                                     (LETT #13# (CDR #13#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |lower|
                                                      (NREVERSE |lower|))
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |up| |lower|
                                                                  (QREFELT %
                                                                           71))
                                                        (QREFELT % 61))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT %
                                                                              68))
                                                           (QREFELT % 69))
                                                          (QREFELT % 63)))
                                                        |SubL|))))))))))))))))))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT % 69)) |SubL| JV
                              (QREFELT % 72)))
              (EXIT (SPADCALL |g| (QREFELT % 74)))))) 

(SDEFUN |SYMANA;detSys;LL;3|
        ((|sys| (|List| (|JetBundleExpression| JB1)))
         (%
          (|List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|)))))
        (SPROG
         ((#1=#:G106 NIL) (#2=#:G107 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G108 NIL)
          (|eq| NIL) (#4=#:G109 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #2# |sys|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |eq| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |eq| (QREFELT % 76))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (SPADCALL (QREFELT % 44)) (QREFELT % 77)))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |eq| NIL) (LETT #4# |ds|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #3# (CONS (SPADCALL |eq| (QREFELT % 75)) #3#))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| (|List| (|JetBundleExpression| JB1)))
         (|vf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
         (% (|List| (|JetBundleExpression| JB1))))
        (SPROG ((#1=#:G113 NIL) (|eq| NIL) (#2=#:G114 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #2# |sys|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |eq| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |eq| (QREFELT % 76))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          |vf| (QREFELT % 77))))) 

(SDEFUN |SYMANA;detSys;LLJvfL;5|
        ((|sys| (|List| (|JetBundleExpression| JB1))) (|sjb| (|List| JB1))
         (|vf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
         (% (|List| (|JetBundleExpression| JB1))))
        (SPROG
         ((|jv| NIL) (#1=#:G177 NIL) (#2=#:G176 NIL)
          (|tmp| (|Union| (|JetBundleExpression| JB1) "failed"))
          (|solEq| (|List| (|Equation| (|JetBundleExpression| JB1))))
          (#3=#:G178 NIL) (#4=#:G179 NIL)
          (|ol| (|List| (|NonNegativeInteger|))) (|o| (|NonNegativeInteger|))
          (|pvf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (#5=#:G180 NIL) (#6=#:G181 NIL)
          (|crit| (|List| (|JetBundleExpression| JB1))) (#7=#:G182 NIL)
          (|eq| NIL) (#8=#:G183 NIL)
          (|pcrit|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB1)))
          (#9=#:G184 NIL) (|jp| NIL) (#10=#:G185 NIL)
          (|coL| (|List| (|List| (|Expression| (|Integer|)))))
          (|conds| (|List| (|Expression| (|Integer|)))) (#11=#:G186 NIL)
          (|co| NIL) (#12=#:G187 NIL))
         (SEQ (LETT |solEq| NIL)
              (SEQ (LETT |jv| NIL) (LETT #1# |sjb|) (LETT |eq| NIL)
                   (LETT #2# |sys|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |jv| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT % 82)))
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT % 32))
                                            (QCDR |tmp|) (QREFELT % 84))
                                  |solEq|))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |solEq| (NREVERSE |solEq|))
              (LETT |ol|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #4# |sys|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (SPADCALL |eq| (QREFELT % 85)) #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (LETT |o| (SPADCALL (ELT % 90) |ol| 0 (QREFELT % 93)))
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT % 94)))
              (LETT |crit|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #6# |sys|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT % 95))
                                        #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |pcrit|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #8# |crit|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |eq| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |eq| |solEq| (QREFELT % 97))
                                    (QREFELT % 99))
                                   #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |coL|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |jp| NIL) (LETT #10# |pcrit|) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |jp| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS (SPADCALL |jp| (QREFELT % 101)) #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |conds| (SPADCALL (ELT % 102) |coL| NIL (QREFELT % 105)))
              (EXIT
               (PROGN
                (LETT #11# NIL)
                (SEQ (LETT |co| NIL) (LETT #12# |conds|) G190
                     (COND
                      ((OR (ATOM #12#) (PROGN (LETT |co| (CAR #12#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #11#
                             (CONS (SPADCALL |co| (QREFELT % 106)) #11#))))
                     (LETT #12# (CDR #12#)) (GO G190) G191
                     (EXIT (NREVERSE #11#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LL;6|
        ((|sys| (|List| (|JetBundleExpression| JB1)))
         (%
          (|List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|)))))
        (SPROG
         ((#1=#:G194 NIL) (#2=#:G195 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G196 NIL)
          (|eq| NIL) (#4=#:G197 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #2# |sys|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |eq| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |eq| (QREFELT % 76))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (SPADCALL (QREFELT % 44)) (QREFELT % 107)))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |eq| NIL) (LETT #4# |ds|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #3# (CONS (SPADCALL |eq| (QREFELT % 75)) #3#))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| (|List| (|JetBundleExpression| JB1)))
         (|vf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
         (% (|List| (|JetBundleExpression| JB1))))
        (SPROG ((#1=#:G201 NIL) (|eq| NIL) (#2=#:G202 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #2# |sys|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |eq| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |eq| (QREFELT % 76))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          |vf| (QREFELT % 107))))) 

(SDEFUN |SYMANA;ncDetSys;LLJvfL;8|
        ((|sys| (|List| (|JetBundleExpression| JB1))) (|sjb| (|List| JB1))
         (|vf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
         (% (|List| (|JetBundleExpression| JB1))))
        (SPROG
         ((|dirs| (|List| JB1)) (|coeffs| (|List| (|JetBundleExpression| JB1)))
          (#1=#:G230 NIL) (#2=#:G229 NIL) (|jt| (|Symbol|))
          (|Xi| (|List| (|JetBundleExpression| JB1)))
          (|ind1| (|List| (|PositiveInteger|)))
          (|tmp| (|List| (|JetBundleExpression| JB1)))
          (|ind2| (|List| (|PositiveInteger|))) (#3=#:G232 NIL) (|co| NIL)
          (#4=#:G231 NIL) (#5=#:G233 NIL)
          (|Eta| (|List| (|JetBundleExpression| JB1))) (|j| (|Integer|))
          (#6=#:G235 NIL) (|e| NIL) (#7=#:G234 NIL) (|i| NIL) (#8=#:G237 NIL)
          (|x| NIL) (#9=#:G236 NIL) (#10=#:G220 NIL) (|jv| (JB1))
          (|cond| (|JetBundleExpression| JB1)) (|ijb| (|List| JB1))
          (|isc| (|List| (|JetBundleExpression| JB1))))
         (SEQ (LETT |dirs| (SPADCALL |vf| (QREFELT % 110)))
              (LETT |coeffs| (SPADCALL |vf| (QREFELT % 111))) (LETT |Xi| NIL)
              (LETT |tmp| NIL) (LETT |ind1| NIL) (LETT |ind2| NIL)
              (SEQ (LETT |co| NIL) (LETT #1# |coeffs|) (LETT #2# |dirs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |co| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 112)))
                        (EXIT
                         (COND
                          ((EQUAL |jt| '|Indep|)
                           (SEQ (LETT |Xi| (CONS |co| |Xi|))
                                (EXIT
                                 (LETT |ind1|
                                       (CONS (SPADCALL |jv| (QREFELT % 113))
                                             |ind1|)))))
                          ((EQUAL |jt| '|Dep|)
                           (SEQ (LETT |tmp| (CONS |co| |tmp|))
                                (EXIT
                                 (LETT |ind2|
                                       (CONS (SPADCALL |jv| (QREFELT % 113))
                                             |ind2|)))))
                          ('T
                           (|error|
                            "Only independent and dependent variables allowed")))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |j| (QREFELT % 13)) (LETT |Eta| NIL)
              (SEQ (LETT |i| NIL) (LETT #3# |ind2|) (LETT |co| NIL)
                   (LETT #4# |tmp|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |co| (CAR #4#)) NIL)
                         (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190 (COND ((NULL (> |j| |i|)) (GO G191)))
                         (SEQ (LETT |Eta| (CONS (|spadConstant| % 114) |Eta|))
                              (EXIT (LETT |j| (- |j| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |Eta| (CONS |co| |Eta|)) (EXIT (LETT |j| (- |j| 1))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((NULL (ZEROP |j|))
                (SEQ (LETT |i| 1) (LETT #5# |j|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |Eta| (CONS (|spadConstant| % 114) |Eta|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
              (LETT |isc| NIL) (LETT |ijb| NIL)
              (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 13)) (LETT |e| NIL)
                   (LETT #7# |Eta|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |e| (CAR #7#)) NIL)
                         (|greater_SI| |j| #6#))
                     (GO G191)))
                   (SEQ (LETT |cond| (SPADCALL |e| (QREFELT % 115)))
                        (LETT |jv| (|spadConstant| % 23))
                        (SEQ (LETT |i| NIL) (LETT #8# |ind1|) (LETT |x| NIL)
                             (LETT #9# |Xi|) G190
                             (COND
                              ((OR (ATOM #9#) (PROGN (LETT |x| (CAR #9#)) NIL)
                                   (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |x| (QREFELT % 116)))
                                 (SEQ
                                  (LETT |jv|
                                        (SPADCALL
                                         (PROG1 (LETT #10# |j|)
                                           (|check_subtype2| (> #10# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #10#))
                                         (LIST |i|) (QREFELT % 117)))
                                  (EXIT
                                   (LETT |cond|
                                         (SPADCALL |cond|
                                                   (SPADCALL |x|
                                                             (SPADCALL |jv|
                                                                       (QREFELT
                                                                        % 32))
                                                             (QREFELT % 118))
                                                   (QREFELT % 119)))))))))
                             (LETT #9# (PROG1 (CDR #9#) (LETT #8# (CDR #8#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |jv| (QREFELT % 120))
                           (|error|
                            "cannot solve invariant surface condition"))
                          ('T
                           (SEQ (LETT |ijb| (CONS |jv| |ijb|))
                                (EXIT (LETT |isc| (CONS |cond| |isc|))))))))
                   (LETT #7# (PROG1 (CDR #7#) (LETT |j| (|inc_SI| |j|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |isc| |sys| (QREFELT % 121))
                         (SPADCALL |ijb| |sjb| (QREFELT % 122)) |vf|
                         (QREFELT % 77)))))) 

(DECLAIM (NOTINLINE |SymmetryAnalysis;|)) 

(DEFUN |SymmetryAnalysis;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL)
    (#1=#:G238 NIL) (#2=#:G239 NIL) (#3=#:G19 NIL) (#4=#:G240 NIL)
    (#5=#:G241 NIL) (#6=#:G23 NIL) (#7=#:G242 NIL) (#8=#:G243 NIL)
    (#9=#:G244 NIL) (#10=#:G245 NIL) (#11=#:G246 NIL) (|i| NIL)
    (#12=#:G247 NIL) (#13=#:G248 NIL) (|jv| NIL) (#14=#:G249 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 |#2|)
     (LETT DV$3 |#3|)
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3))
     (LETT % (GETREFV 124))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
     (|haddProp| |$ConstructorCache| '|SymmetryAnalysis| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (QSETREFV % 8 |#3|)
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 11 (SPADCALL (QREFELT % 10)))
     (QSETREFV % 13 (SPADCALL (QREFELT % 12)))
     (QSETREFV % 18
               (SPADCALL
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 11)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #3# |i|)
                                  (|check_subtype2| (> #3# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                (QREFELT % 14))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 13)) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #6# |i|)
                                  (|check_subtype2| (> #6# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #6#))
                                (QREFELT % 15))
                               #4#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT % 17)))
     (QSETREFV % 21
               (PROGN
                (LETT #7# NIL)
                (SEQ (LETT |jv| NIL) (LETT #8# (QREFELT % 18)) G190
                     (COND
                      ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #7# (CONS (SPADCALL |jv| (QREFELT % 20)) #7#))))
                     (LETT #8# (CDR #8#)) (GO G190) G191
                     (EXIT (NREVERSE #7#)))))
     (QSETREFV % 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((> (QREFELT % 11) 1)
         (SETELT % 22
                 (PROGN
                  (LETT #9# NIL)
                  (SEQ (LETT |i| 1) (LETT #10# (QREFELT % 11)) G190
                       (COND ((|greater_SI| |i| #10#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #9#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT % 26)))
                                          (QREFELT % 28))
                                #9#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #9#))))))
        ('T (SETELT % 22 (LIST (QCDR |#2|))))))
      ('T (SETELT % 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((> (QREFELT % 13) 1)
         (SETELT % 22
                 (SPADCALL (QREFELT % 22)
                           (PROGN
                            (LETT #11# NIL)
                            (SEQ (LETT |i| 1) (LETT #12# (QREFELT % 13)) G190
                                 (COND ((|greater_SI| |i| #12#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #11#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT % 26)))
                                                    (QREFELT % 28))
                                          #11#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #11#))))
                           (QREFELT % 30))))
        ('T
         (SETELT % 22
                 (SPADCALL (QREFELT % 22) (LIST (QCDR |#3|))
                           (QREFELT % 30))))))
      ('T (SETELT % 22 (SPADCALL (QREFELT % 22) (QCDR |#3|) (QREFELT % 30)))))
     (QSETREFV % 33
               (PROGN
                (LETT #13# NIL)
                (SEQ (LETT |jv| NIL) (LETT #14# (QREFELT % 18)) G190
                     (COND
                      ((OR (ATOM #14#) (PROGN (LETT |jv| (CAR #14#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #13# (CONS (SPADCALL |jv| (QREFELT % 32)) #13#))))
                     (LETT #14# (CDR #14#)) (GO G190) G191
                     (EXIT (NREVERSE #13#)))))
     %)))) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G250)
  (SPROG NIL
         (PROG (#2=#:G251)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|SymmetryAnalysis|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetryAnalysis|)))))))))) 

(MAKEPROP '|SymmetryAnalysis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars| (29 . |1|) (|OutputForm|) (|NonNegativeInteger|)
              (33 . |coerce|) (|List| 24) (38 . |superscript|) (|List| 19)
              (44 . |append|) (|JetBundleExpression| 6) (50 . |coerce|)
              '|JVars| (|JetVectorField| 6 31) (55 . |0|) (|Integer|)
              (59 . |qelt|) (|List| %) (65 . |function|) (72 . |diffX|)
              (77 . *) (83 . +) (89 . |diffU|) |SYMANA;ansatz;Jvf;1|
              (|List| 67) (94 . |tower|) (|BasicOperator|) (|Kernel| 31)
              (99 . |operator|) (|Boolean|) (104 . |has?|)
              (|Union| (|None|) '"failed") (110 . |property|) (|List| 31)
              (116 . |argument|) (121 . |second|) (126 . |retract|)
              (|JetBundleSymAna| 6 (NRTEVAL (QREFELT % 7))
                                 (NRTEVAL (QREFELT % 8)))
              (131 . X) (|Expression| 36) (136 . |coerce|) (141 . |coerce|)
              (146 . |kernels|) (151 . |name|) (156 . |position|) (162 . U)
              (|Kernel| %) (167 . |coerce|) (172 . |coerce|) (|List| 9)
              (177 . |Pr|) (183 . |eval|) (|JetBundleExpression| 58)
              (190 . |coerce|) |SYMANA;transform;JbeJbe;2| (195 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 73) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| % '"failed") (200 . |solveFor|)
              (|Equation| 31) (206 . =) (212 . |order|) (217 . |max|)
              (223 . |max|) (|Character|) (229 . |max|) (235 . |max|)
              (|Mapping| 25 25 25) (|List| 25) (241 . |reduce|)
              (248 . |prolong|) (254 . |eval|) (|List| (|Equation| %))
              (260 . |eval|) (|SparseMultivariatePolynomial| 60 6)
              (266 . |numerJP|) (|List| 60) (271 . |coefficients|)
              (276 . |append|) (|Mapping| 100 100 100) (|List| 100)
              (282 . |reduce|) (289 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (294 . |directions|) (299 . |coefficients|) (304 . |type|)
              (309 . |index|) (314 . |0|) (318 . -) (323 . |zero?|)
              (328 . |Pr|) (334 . *) (340 . +) (346 . |one?|) (351 . |append|)
              (357 . |append|)
              (|List|
               (|JetBundleLinearFunction| 58 (|JetBundleXExpression| 58))))
           '#(|transform| 363 |ncDetSys| 368 |linearize| 386 |detSysNS| 391
              |detSys| 402 |ansatz| 420)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|ansatz|
                                 ((|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|transform|
                                 ((|JetBundleExpression|
                                   (|JetBundleSymAna| |#1| |#2| |#3|))
                                  (|JetBundleExpression| |#1|)))
                                T)
                              '((|linearize|
                                 ((|List|
                                   (|JetBundleLinearFunction|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)
                                    (|JetBundleXExpression|
                                     (|JetBundleSymAna| |#1| |#2| |#3|))))
                                  (|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))))
                                T)
                              '((|detSys|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|detSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|detSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|List| |#1|)
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|List| |#1|)
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|detSysNS|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|detSysNS|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 123
                                            '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6
                                              0 9 15 2 16 0 0 0 17 1 6 19 0 20
                                              0 6 0 23 1 25 24 0 26 2 19 0 0 27
                                              28 2 29 0 0 0 30 1 31 0 6 32 0 34
                                              0 35 2 29 19 0 36 37 3 31 0 19 38
                                              25 39 1 34 0 9 40 2 34 0 31 0 41
                                              2 34 0 0 0 42 1 34 0 9 43 1 31 45
                                              0 46 1 48 47 0 49 2 47 50 0 19 51
                                              2 47 52 0 19 53 1 48 54 0 55 1 54
                                              31 0 56 1 31 36 0 57 1 58 0 9 59
                                              1 58 60 0 61 1 6 60 0 62 1 60 45
                                              0 63 1 47 19 0 64 2 29 36 19 0 65
                                              1 58 0 9 66 1 31 0 67 68 1 31 60
                                              0 69 2 58 0 9 70 71 3 60 0 0 45
                                              38 72 1 73 0 60 74 1 31 6 0 76 2
                                              31 81 0 6 82 2 83 0 31 31 84 1 31
                                              25 0 85 2 19 0 0 0 86 2 6 0 0 0
                                              87 2 88 0 0 0 89 2 25 0 0 0 90 3
                                              92 25 91 0 25 93 2 34 0 0 25 94 2
                                              34 31 0 31 95 2 31 0 0 96 97 1 31
                                              98 0 99 1 98 100 0 101 2 100 0 0
                                              0 102 3 104 100 103 0 100 105 1
                                              31 0 60 106 1 34 16 0 110 1 34 54
                                              0 111 1 6 19 0 112 1 6 9 0 113 0
                                              31 0 114 1 31 0 0 115 1 31 50 0
                                              116 2 6 0 9 70 117 2 31 0 0 0 118
                                              2 31 0 0 0 119 1 6 50 0 120 2 54
                                              0 0 0 121 2 16 0 0 0 122 1 0 73
                                              31 75 3 0 54 54 16 34 107 1 0 78
                                              54 108 2 0 54 54 34 109 1 0 123
                                              78 1 1 0 78 54 1 2 0 54 54 34 1 3
                                              0 54 54 16 34 77 1 0 78 54 79 2 0
                                              54 54 34 80 0 0 34 44)))))
           '|lookupComplete|)) 
