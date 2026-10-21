
(SDEFUN |RECOP;getINFOREC|
        ((|infoOp| (|BasicOperator|))
         (%
          (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                    (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                    (|:| |val| (|Stream| F))
                    (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                    (|:| |gen|
                         (|Union| (|Mapping| (|List| F) (|List| F))
                                  "failed")))))
        (SPROG ((#1=#:G41 NIL))
               (PROG2 (LETT #1# (SPADCALL |infoOp| '%INFOREC (QREFELT % 17)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|None|)
                                 (|Union| (|None|) "failed") #1#)))) 

(SDEFUN |RECOP;setINFOREC|
        ((|infoOp| (|BasicOperator|))
         (|rec|
          (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                    (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                    (|:| |val| (|Stream| F))
                    (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                    (|:| |gen|
                         (|Union| (|Mapping| (|List| F) (|List| F))
                                  "failed"))))
         (% (|Void|)))
        (SPADCALL |infoOp| '%INFOREC |rec| (QREFELT % 15))) 

(SDEFUN |RECOP;getINFOSER|
        ((|infoOp| (|BasicOperator|))
         (%
          (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                    (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                    (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                    (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                    (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
                    (|:| |ex?| (|Boolean|)))))
        (SPROG ((#1=#:G47 NIL))
               (PROG2 (LETT #1# (SPADCALL |infoOp| '%INFOSER (QREFELT % 17)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|None|)
                                 (|Union| (|None|) "failed") #1#)))) 

(SDEFUN |RECOP;setINFOSER|
        ((|infoOp| (|BasicOperator|))
         (|ser|
          (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                    (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                    (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                    (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                    (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
                    (|:| |ex?| (|Boolean|))))
         (% (|Void|)))
        (SPADCALL |infoOp| '%INFOSER |ser| (QREFELT % 15))) 

(SDEFUN |RECOP;getShiftRec|
        ((|op| (|BasicOperator|)) (|f| (|Kernel| F)) (|n| (|Symbol|))
         (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|a| (|List| F)) (|p| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|num| (|SparseUnivariatePolynomial| F)) (#1=#:G67 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (SPADCALL |f| (QREFELT % 20)))
                (COND
                 ((SPADCALL (CONS #'|RECOP;getShiftRec!0| (VECTOR % |n|)) |a|
                            (QREFELT % 25))
                  (PROGN (LETT #1# (CONS 0 0)) (GO #2=#:G66))))
                (COND
                 ((SPADCALL (LENGTH |a|) 1 (QREFELT % 27))
                  (|error| "RECOP: operator should have only one argument")))
                (LETT |p|
                      (SPADCALL (SPADCALL |a| 1 (QREFELT % 29))
                                (SPADCALL (SPADCALL |n| (QREFELT % 21))
                                          (QREFELT % 31))
                                (QREFELT % 33)))
                (COND
                 ((SPADCALL (SPADCALL |p| (QREFELT % 35)) (|spadConstant| % 36)
                            (QREFELT % 37))
                  (PROGN (LETT #1# (CONS 1 "failed")) (GO #2#))))
                (LETT |num| (SPADCALL |p| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |num| (QREFELT % 41)) 1)
                   (COND
                    ((SPADCALL (SPADCALL |num| 1 (QREFELT % 42))
                               (|spadConstant| % 28) (QREFELT % 43))
                     (COND
                      ((SPADCALL (CONS #'|RECOP;getShiftRec!1| (VECTOR % |n|))
                                 (SPADCALL |num| (QREFELT % 44))
                                 (QREFELT % 25))
                       (PROGN
                        (LETT #1#
                              (SPADCALL (SPADCALL |num| 0 (QREFELT % 42))
                                        (QREFELT % 48)))
                        (GO #2#)))
                      (#3='T
                       (PROGN (LETT #1# (CONS 1 #4="failed")) (GO #2#)))))
                    (#3# (PROGN (LETT #1# (CONS 1 #4#)) (GO #2#)))))
                  (#3# (PROGN (LETT #1# (CONS 1 #4#)) (GO #2#)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |RECOP;getShiftRec!1| ((|z| NIL) ($$ NIL))
        (PROG (|n| %)
          (LETT |n| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |n| (QREFELT % 21)) (QREFELT % 23)))))) 

(SDEFUN |RECOP;getShiftRec!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| %)
          (LETT |n| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |n| (QREFELT % 21)) (QREFELT % 23)))))) 

(SDEFUN |RECOP;shiftInfoRec|
        ((|op| (|BasicOperator|)) (|argsym| (|Symbol|)) (|eq| (F))
         (%
          (|Union|
           (|Record| (|:| |ord| (|NonNegativeInteger|)) (|:| |max| (|Integer|))
                     (|:| |ker| (|Kernel| F)))
           "failed")))
        (SPROG
         ((|f| NIL) (#1=#:G84 NIL) (|shift| (|Union| (|Integer|) "failed"))
          (|error?| (|Boolean|)) (|maxShift| (|Integer|))
          (|nextKernel| (|Kernel| F)) (|minShift| (|Integer|)) (#2=#:G83 NIL)
          (#3=#:G80 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |error?| 'T)
                (SEQ (LETT |f| NIL) (LETT #1# (SPADCALL |eq| (QREFELT % 50)))
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |f| |op| (QREFELT % 51))
                         (SEQ
                          (LETT |shift|
                                (|RECOP;getShiftRec| |op| |f| |argsym| %))
                          (EXIT
                           (COND
                            (|error?|
                             (SEQ (LETT |error?| NIL) (LETT |nextKernel| |f|)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |shift| 0)
                                     (SEQ (LETT |maxShift| (QCDR |shift|))
                                          (EXIT
                                           (LETT |minShift| (QCDR |shift|)))))
                                    ('T
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #4=#:G82)))))))
                            ((QEQCAR |shift| 0)
                             (SEQ
                              (COND
                               ((< |maxShift| (QCDR |shift|))
                                (SEQ (LETT |maxShift| (QCDR |shift|))
                                     (EXIT (LETT |nextKernel| |f|)))))
                              (EXIT
                               (COND
                                ((> |minShift| (QCDR |shift|))
                                 (LETT |minShift| (QCDR |shift|)))))))
                            ('T
                             (PROGN
                              (LETT #2# (CONS 1 "failed"))
                              (GO #4#))))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND
                 (|error?|
                  (|error| "evalRec: equation does not contain operator")))
                (EXIT
                 (CONS 0
                       (VECTOR
                        (PROG1 (LETT #3# (- |maxShift| |minShift|))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#))
                        |maxShift| |nextKernel|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7|
        ((|op| (|BasicOperator|)) (|argsym| (|Symbol|)) (|eq| (F))
         (|params| (|List| F)) (|values| (|Stream| F)) (% (F)))
        (SPROG
         ((|shiftInfo|
           (|Union|
            (|Record| (|:| |ord| (|NonNegativeInteger|))
                      (|:| |max| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|p| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|num| (|SparseUnivariatePolynomial| F)) (|argsymKer| (|Kernel| F))
          (|c0| (F)) (|c1| (F)) (|uc0| #1#) (|uc1| #1#) (#2=#:G136 NIL)
          (#3=#:G137 NIL) (|next| (F)) (|max1| (|Integer|))
          (|ord1| (|Integer|)) (#4=#:G138 NIL) (|i| NIL) (#5=#:G139 NIL)
          (|fl| (|List| F)) (|fn| (|Mapping| (|List| F) (|List| F)))
          (|info| (|BasicOperator|)) (#6=#:G135 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |shiftInfo| (|RECOP;shiftInfoRec| |op| |argsym| |eq| %))
                (EXIT
                 (COND
                  ((QEQCAR |shiftInfo| 1)
                   (SEQ
                    (LETT |info|
                          (SPADCALL (SPADCALL '|inforec| (QREFELT % 52)) 0
                                    (QREFELT % 53)))
                    (|RECOP;setINFOREC| |info|
                     (VECTOR |eq| |argsym| |op| |params| |values|
                             (CONS 1 "failed") (CONS 1 "failed"))
                     %)
                    (EXIT
                     (PROGN
                      (LETT #6#
                            (SPADCALL (QREFELT % 11)
                                      (SPADCALL
                                       (LIST (SPADCALL |argsym| (QREFELT % 21))
                                             (SPADCALL |info| NIL
                                                       (QREFELT % 55)))
                                       |params| (QREFELT % 56))
                                      (QREFELT % 55)))
                      (GO #7=#:G134)))))
                  (#8='T
                   (SEQ
                    (LETT |p|
                          (SPADCALL |eq| (QVELT (QCDR |shiftInfo|) 2)
                                    (QREFELT % 33)))
                    (LETT |num| (SPADCALL |p| (QREFELT % 39)))
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |p| (QREFELT % 57)) (QREFELT % 58)))
                      (|error|
                       "makeRec assumes that the equation has no denominator")))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |num| (QREFELT % 41)) 1)
                       (SEQ
                        (LETT |argsymKer|
                              (SPADCALL (SPADCALL |argsym| (QREFELT % 21))
                                        (QREFELT % 31)))
                        (LETT |c0| (SPADCALL |num| 0 (QREFELT % 42)))
                        (LETT |c1| (SPADCALL |num| 1 (QREFELT % 42)))
                        (EXIT
                         (COND
                          ((ZEROP (QVELT (QCDR |shiftInfo|) 0))
                           (COND
                            ((OR (SPADCALL |c1| |argsym| (QREFELT % 59))
                                 (NULL
                                  (OR
                                   (OR (SPADCALL |c0| (QREFELT % 65))
                                       (NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (LETT |uc0|
                                                 (SPADCALL |c0| |argsymKer|
                                                           (QREFELT % 33)))
                                           (QREFELT % 39))
                                          (SPADCALL
                                           (LETT |uc1|
                                                 (SPADCALL |c1| |argsymKer|
                                                           (QREFELT % 33)))
                                           (QREFELT % 39))
                                          (QREFELT % 73))
                                         (QREFELT % 58))))
                                   (NULL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |uc0| (QREFELT % 57))
                                               (SPADCALL |uc1| (QREFELT % 57))
                                               (QREFELT % 73))
                                     (QREFELT % 58))))))
                             (PROGN
                              (LETT #6#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |c0| |c1| (QREFELT % 60))
                                      (QREFELT % 61))
                                     (SPADCALL |argsym| (QREFELT % 21))
                                     (SPADCALL
                                      (SPADCALL |argsym| (QREFELT % 21))
                                      (SPADCALL (QVELT (QCDR |shiftInfo|) 1)
                                                (QREFELT % 62))
                                      (QREFELT % 63))
                                     (QREFELT % 64)))
                              (GO #7#)))
                            ('T
                             (SEQ
                              (LETT |next|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |num| 0 (QREFELT % 42))
                                      (SPADCALL |num| 1 (QREFELT % 42))
                                      (QREFELT % 60))
                                     (QREFELT % 61)))
                              (LETT |max1| (QVELT (QCDR |shiftInfo|) 1))
                              (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1))
                              (LETT |fl|
                                    (CONS (SPADCALL |argsym| (QREFELT % 21))
                                          (PROGN
                                           (LETT #2# NIL)
                                           (SEQ (LETT |i| 1)
                                                (LETT #3# (+ |ord1| 1)) G190
                                                (COND
                                                 ((|greater_SI| |i| #3#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |op|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |argsym|
                                                                     (QREFELT %
                                                                              21))
                                                                    (SPADCALL
                                                                     (- |max1|
                                                                        |i|)
                                                                     (QREFELT %
                                                                              62))
                                                                    (QREFELT %
                                                                             66))
                                                                   (QREFELT %
                                                                            67))
                                                         #2#))))
                                                (LETT |i| (|inc_SI| |i|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))))
                              (COND
                               ((>= |ord1| 0)
                                (LETT |fn|
                                      (CONS #'|RECOP;makeRec;BoSFLSF;7!0|
                                            (VECTOR |ord1| |fl| |next| %))))
                               (#8#
                                (LETT |fn|
                                      (CONS #'|RECOP;makeRec;BoSFLSF;7!1|
                                            (VECTOR |fl| |next| %)))))
                              (LETT |info|
                                    (SPADCALL
                                     (SPADCALL '|inforec| (QREFELT % 52)) 0
                                     (QREFELT % 53)))
                              (|RECOP;setINFOREC| |info|
                               (VECTOR |eq| |argsym| |op| |params| |values|
                                       (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                                       (CONS 0 |fn|))
                               %)
                              (EXIT
                               (PROGN
                                (LETT #6#
                                      (SPADCALL (QREFELT % 11)
                                                (SPADCALL
                                                 (LIST
                                                  (SPADCALL |argsym|
                                                            (QREFELT % 21))
                                                  (SPADCALL |info| NIL
                                                            (QREFELT % 55)))
                                                 |params| (QREFELT % 56))
                                                (QREFELT % 55)))
                                (GO #7#)))))))
                          (#8#
                           (SEQ
                            (LETT |next|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |num| 0 (QREFELT % 42))
                                             (SPADCALL |num| 1 (QREFELT % 42))
                                             (QREFELT % 60))
                                   (QREFELT % 61)))
                            (LETT |max1| (QVELT (QCDR |shiftInfo|) 1))
                            (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1))
                            (LETT |fl|
                                  (CONS (SPADCALL |argsym| (QREFELT % 21))
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |i| 1)
                                              (LETT #5# (+ |ord1| 1)) G190
                                              (COND
                                               ((|greater_SI| |i| #5#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (SPADCALL |op|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |argsym|
                                                                   (QREFELT %
                                                                            21))
                                                                  (SPADCALL
                                                                   (- |max1|
                                                                      |i|)
                                                                   (QREFELT %
                                                                            62))
                                                                  (QREFELT %
                                                                           66))
                                                                 (QREFELT %
                                                                          67))
                                                       #4#))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#))))))
                            (COND
                             ((>= |ord1| 0)
                              (LETT |fn|
                                    (CONS #'|RECOP;makeRec;BoSFLSF;7!2|
                                          (VECTOR |ord1| |fl| |next| %))))
                             (#8#
                              (LETT |fn|
                                    (CONS #'|RECOP;makeRec;BoSFLSF;7!3|
                                          (VECTOR |fl| |next| %)))))
                            (LETT |info|
                                  (SPADCALL
                                   (SPADCALL '|inforec| (QREFELT % 52)) 0
                                   (QREFELT % 53)))
                            (|RECOP;setINFOREC| |info|
                             (VECTOR |eq| |argsym| |op| |params| |values|
                                     (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                                     (CONS 0 |fn|))
                             %)
                            (EXIT
                             (PROGN
                              (LETT #6#
                                    (SPADCALL (QREFELT % 11)
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL |argsym|
                                                          (QREFELT % 21))
                                                (SPADCALL |info| NIL
                                                          (QREFELT % 55)))
                                               |params| (QREFELT % 56))
                                              (QREFELT % 55)))
                              (GO #7#)))))))))
                      (#8#
                       (SEQ
                        (LETT |info|
                              (SPADCALL (SPADCALL '|inforec| (QREFELT % 52)) 0
                                        (QREFELT % 53)))
                        (|RECOP;setINFOREC| |info|
                         (VECTOR |eq| |argsym| |op| |params| |values|
                                 (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                                 (CONS 1 "failed"))
                         %)
                        (EXIT
                         (PROGN
                          (LETT #6#
                                (SPADCALL (QREFELT % 11)
                                          (SPADCALL
                                           (LIST
                                            (SPADCALL |argsym| (QREFELT % 21))
                                            (SPADCALL |info| NIL
                                                      (QREFELT % 55)))
                                           |params| (QREFELT % 56))
                                          (QREFELT % 55)))
                          (GO #7#)))))))))))))
          #7# (EXIT #6#)))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!3| ((|l| NIL) ($$ NIL))
        (PROG (% |next| |fl|)
          (LETT % (QREFELT $$ 2))
          (LETT |next| (QREFELT $$ 1))
          (LETT |fl| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (LIST
             (SPADCALL (SPADCALL |l| (QREFELT % 68)) (|spadConstant| % 28)
                       (QREFELT % 66))
             (SPADCALL |next| |fl| |l| (QREFELT % 69))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!2| ((|l| NIL) ($$ NIL))
        (PROG (% |next| |fl| |ord1|)
          (LETT % (QREFELT $$ 3))
          (LETT |next| (QREFELT $$ 2))
          (LETT |fl| (QREFELT $$ 1))
          (LETT |ord1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G126 NIL))
                   (SPADCALL
                    (LIST
                     (SPADCALL (SPADCALL |l| (QREFELT % 68))
                               (|spadConstant| % 28) (QREFELT % 66))
                     (SPADCALL |next| |fl| |l| (QREFELT % 69)))
                    (SPADCALL (SPADCALL |l| (QREFELT % 70))
                              (PROG1 (LETT #1# |ord1|)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT % 71))
                    (QREFELT % 56))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!1| ((|l| NIL) ($$ NIL))
        (PROG (% |next| |fl|)
          (LETT % (QREFELT $$ 2))
          (LETT |next| (QREFELT $$ 1))
          (LETT |fl| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (LIST
             (SPADCALL (SPADCALL |l| (QREFELT % 68)) (|spadConstant| % 28)
                       (QREFELT % 66))
             (SPADCALL |next| |fl| |l| (QREFELT % 69))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!0| ((|l| NIL) ($$ NIL))
        (PROG (% |next| |fl| |ord1|)
          (LETT % (QREFELT $$ 3))
          (LETT |next| (QREFELT $$ 2))
          (LETT |fl| (QREFELT $$ 1))
          (LETT |ord1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G98 NIL))
                   (SPADCALL
                    (LIST
                     (SPADCALL (SPADCALL |l| (QREFELT % 68))
                               (|spadConstant| % 28) (QREFELT % 66))
                     (SPADCALL |next| |fl| |l| (QREFELT % 69)))
                    (SPADCALL (SPADCALL |l| (QREFELT % 70))
                              (PROG1 (LETT #1# |ord1|)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT % 71))
                    (QREFELT % 56))))))) 

(SDEFUN |RECOP;irecur| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|arg| (F)) (|n| (|Union| (|Integer|) "failed"))
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                     (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #1="failed"))
                     (|:| |gen|
                          (|Union| (|Mapping| (|List| F) (|List| F))
                                   #2="failed"))))
          (#3=#:G145 NIL) (N (|NonNegativeInteger|)) (#4=#:G147 NIL)
          (|g| (|Mapping| (|List| F) (|List| F))) (#5=#:G151 NIL)
          (|o| (|NonNegativeInteger|)) (#6=#:G166 NIL) (|i| NIL)
          (#7=#:G167 NIL) (|ll| (|List| F)) (|s| (|Stream| F)) (#8=#:G165 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arg| (|SPADfirst| |l|))
                (LETT |n| (SPADCALL |arg| (QREFELT % 48)))
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SEQ
                      (LETT |info|
                            (|RECOP;getINFOREC|
                             (SPADCALL
                              (SPADCALL (SPADCALL |l| (QREFELT % 76))
                                        (QREFELT % 31))
                              (QREFELT % 77))
                             %))
                      (COND
                       ((SPADCALL (QVELT |info| 4)
                                  (+
                                   (PROG1 (LETT #3# (QCDR |n|))
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   1)
                                  (QREFELT % 78))
                        (COND
                         ((QEQCAR (QVELT |info| 6) 1)
                          (PROGN
                           (LETT #8#
                                 (SPADCALL (QREFELT % 11) |l| (QREFELT % 55)))
                           (GO #9=#:G164)))
                         (#10='T
                          (SEQ
                           (LETT N (SPADCALL (QVELT |info| 4) (QREFELT % 79)))
                           (LETT |g|
                                 (PROG2 (LETT #4# (QVELT |info| 6))
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0)
                                                   (|Mapping|
                                                    (|List| (QREFELT % 7))
                                                    (|List| (QREFELT % 7)))
                                                   (|Union|
                                                    (|Mapping|
                                                     (|List| (QREFELT % 7))
                                                     (|List| (QREFELT % 7)))
                                                    #2#)
                                                   #4#)))
                           (LETT |o|
                                 (PROG2 (LETT #5# (QVELT |info| 5))
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|NonNegativeInteger|)
                                                   (|Union|
                                                    (|NonNegativeInteger|) #1#)
                                                   #5#)))
                           (LETT |ll|
                                 (CONS
                                  (SPADCALL (SPADCALL N (QREFELT % 62))
                                            (SPADCALL |o| (QREFELT % 62))
                                            (QREFELT % 63))
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |i| 0) (LETT #7# (- |o| 1)) G190
                                        (COND
                                         ((|greater_SI| |i| #7#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL (QVELT |info| 4)
                                                           (- N |i|)
                                                           (QREFELT % 80))
                                                 #6#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))))
                           (LETT |s|
                                 (SPADCALL (ELT % 76)
                                           (SPADCALL
                                            (SPADCALL |g| |ll| (QREFELT % 83))
                                            (QREFELT % 84))
                                           (QREFELT % 87)))
                           (EXIT
                            (QSETVELT |info| 4
                                      (SPADCALL (QVELT |info| 4) |s|
                                                (QREFELT % 88)))))))))
                      (EXIT
                       (PROGN
                        (LETT #8#
                              (SPADCALL
                               (SPADCALL (QVELT |info| 4) (+ (QCDR |n|) 1)
                                         (QREFELT % 80))
                               (QVELT |info| 3) (SPADCALL |l| 2 (QREFELT % 89))
                               (QREFELT % 69)))
                        (GO #9#)))))
                    (#10#
                     (PROGN
                      (LETT #8# (SPADCALL (QREFELT % 11) |l| (QREFELT % 55)))
                      (GO #9#)))))
                  (#10#
                   (PROGN
                    (LETT #8# (SPADCALL (QREFELT % 11) |l| (QREFELT % 55)))
                    (GO #9#)))))))
          #9# (EXIT #8#)))) 

(SDEFUN |RECOP;ddrec| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPROG
         ((|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                     (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #1="failed"))
                     (|:| |gen|
                          (|Union| (|Mapping| (|List| F) (|List| F))
                                   "failed"))))
          (|n| (F)) (|n0| (F)) (|f| (|BasicOperator|)) (|lp| #2=(|List| F))
          (|lv| #2#) (|e| (F)) (#3=#:G170 NIL) (|v| (|NonNegativeInteger|))
          (|RecCoeff| #4=(|OutputForm|)) (|RecEq| #4#) (#5=#:G177 NIL)
          (|i| NIL) (#6=#:G178 NIL) (|RecList| (|List| (|OutputForm|))))
         (SEQ
          (LETT |info|
                (|RECOP;getINFOREC|
                 (SPADCALL
                  (SPADCALL (SPADCALL |l| (QREFELT % 76)) (QREFELT % 31))
                  (QREFELT % 77))
                 %))
          (LETT |n| (|SPADfirst| |l|))
          (LETT |n0| (SPADCALL (QVELT |info| 1) (QREFELT % 21)))
          (LETT |f| (QVELT |info| 2)) (LETT |lp| (CONS |n0| (QVELT |info| 3)))
          (LETT |lv| (CONS |n| (SPADCALL |l| 2 (QREFELT % 89))))
          (LETT |e| (SPADCALL (QVELT |info| 0) |lp| |lv| (QREFELT % 69)))
          (LETT |v| (SPADCALL (QREFELT % 92)))
          (COND
           ((QEQCAR (QVELT |info| 5) 0)
            (LETT |v|
                  (MIN |v|
                       (PROG2 (LETT #3# (QVELT |info| 5))
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                         (|Union| (|NonNegativeInteger|) #1#)
                                         #3#))))))
          (LETT |RecCoeff|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| |n| (QREFELT % 67)) (QREFELT % 94))
                 (SPADCALL ": " (QREFELT % 96)) (QREFELT % 97)))
          (LETT |RecEq|
                (SPADCALL |RecCoeff|
                          (SPADCALL (SPADCALL |e| (QREFELT % 94))
                                    (SPADCALL (|spadConstant| % 45)
                                              (QREFELT % 98))
                                    (QREFELT % 99))
                          (QREFELT % 97)))
          (LETT |RecList|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |i| 0) (LETT #6# (- |v| 1)) G190
                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |f| (SPADCALL |i| (QREFELT % 62))
                                           (QREFELT % 67))
                                 (QREFELT % 94))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QVELT |info| 4) (+ |i| 1)
                                            (QREFELT % 80))
                                  |lp| |lv| (QREFELT % 69))
                                 (QREFELT % 94))
                                (QREFELT % 99))
                               #5#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (EXIT (SPADCALL (CONS |RecEq| |RecList|) (QREFELT % 100)))))) 

(SDEFUN |RECOP;diffRec| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|dummyF| (F)) (|xF| (F)))
               (SEQ
                (LETT |dummyF|
                      (SPADCALL (SPADCALL (QREFELT % 105)) (QREFELT % 21)))
                (LETT |xF| (SPADCALL |x| (QREFELT % 21)))
                (EXIT
                 (SPADCALL (QREFELT % 104)
                           (LIST
                            (SPADCALL
                             (SPADCALL (QREFELT % 11) |l| (QREFELT % 55)) |xF|
                             |dummyF| (QREFELT % 64))
                            |dummyF| |xF|)
                           (QREFELT % 55)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11|
        ((|op| (|BasicOperator|)) (|v| (|Symbol|)) (|argsym| (|Symbol|))
         (|eq| (F)) (|params| (|List| F)) (|values| (|Stream| F)) (% (F)))
        (SPROG
         ((|p| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|num| (|SparseUnivariatePolynomial| F))
          (|den| (|SparseUnivariatePolynomial| F)) (|info| (|BasicOperator|))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| F)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| (% (|UnivariatePolynomial| |v| F)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |v| F) % (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| (% (|Variable| |v|)))
                    (SIGNATURE |differentiate| (% % (|Variable| |v|)))
                    (SIGNATURE |lagrange| (% %)) (SIGNATURE |lambert| (% %))
                    (SIGNATURE |oddlambert| (% %))
                    (SIGNATURE |evenlambert| (% %))
                    (SIGNATURE |generalLambert| (% % (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| (% %))
                    (SIGNATURE |multisect| (% (|Integer|) (|Integer|) %))
                    (SIGNATURE |invmultisect| (% (|Integer|) (|Integer|) %))
                    (IF (|has| F (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| (% % (|Variable| |v|)))
                        |noBranch|))))
          (|a| (|Any|)) (|s| (|uts|)) (|explicit?| (|Boolean|))
          (|fn| (|Mapping| (|Stream| F))) (#1=#:G223 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |eq| |argsym| (QREFELT % 59)))
              (|error|
               "RECOP: The argument should not be used in the equation of the ADE")))
            (LETT |p|
                  (SPADCALL |eq|
                            (SPADCALL
                             (SPADCALL |op| (SPADCALL |v| (QREFELT % 21))
                                       (QREFELT % 67))
                             (QREFELT % 31))
                            (QREFELT % 33)))
            (LETT |num| (SPADCALL |p| (QREFELT % 39)))
            (LETT |den| (SPADCALL |p| (QREFELT % 57)))
            (LETT |info|
                  (SPADCALL (SPADCALL '|infoser| (QREFELT % 52)) 0
                            (QREFELT % 53)))
            (COND
             ((|HasCategory| (QREFELT % 6) '(|GcdDomain|))
              (COND
               ((|HasCategory| (QREFELT % 6)
                               (LIST '|RetractableTo| '(|Integer|)))
                (COND
                 ((|HasCategory| (QREFELT % 6)
                                 (LIST '|LinearlyExplicitOver| '(|Integer|)))
                  (COND
                   ((|HasCategory| (QREFELT % 7) '(|AlgebraicallyClosedField|))
                    (COND
                     ((|HasCategory| (QREFELT % 7)
                                     '(|TranscendentalFunctionCategory|))
                      (COND
                       ((ZEROP (SPADCALL |den| (QREFELT % 41)))
                        (COND
                         ((EQL (SPADCALL |num| (QREFELT % 41)) 1)
                          (COND
                           ((SPADCALL (SPADCALL |den| 0 (QREFELT % 42))
                                      (SPADCALL |op| (QREFELT % 106))
                                      (QREFELT % 59))
                            (COND
                             ((SPADCALL (SPADCALL |num| 0 (QREFELT % 42))
                                        (SPADCALL |op| (QREFELT % 106))
                                        (QREFELT % 59))
                              (COND
                               ((SPADCALL (SPADCALL |num| 1 (QREFELT % 42))
                                          (SPADCALL |op| (QREFELT % 106))
                                          (QREFELT % 59))
                                (SEQ (LETT |explicit?| 'T)
                                     (LETT |eq|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |num| 0 (QREFELT % 42))
                                              (SPADCALL |num| 1 (QREFELT % 42))
                                              (QREFELT % 60))
                                             (SPADCALL |den| 0 (QREFELT % 42))
                                             (QREFELT % 60))
                                            (QREFELT % 61)))
                                     (LETT |uts|
                                           (|UnivariateTaylorSeries|
                                            (QREFELT % 7) |v|
                                            (|spadConstant| % 46)))
                                     (LETT |a|
                                           (SPADCALL |eq|
                                                     (SPADCALL
                                                      (SPADCALL |v|
                                                                (QREFELT % 21))
                                                      (|spadConstant| % 46)
                                                      (QREFELT % 108))
                                                     (QREFELT % 111)))
                                     (LETT |s|
                                           (SPADCALL |a|
                                                     (|compiledLookupCheck|
                                                      '|retract|
                                                      (LIST (|devaluate| |uts|)
                                                            (LIST '|Any|))
                                                      (|AnyFunctions1|
                                                       |uts|))))
                                     (EXIT
                                      (LETT |fn|
                                            (CONS
                                             #'|RECOP;makeFEq;Bo2SFLSF;11!0|
                                             (VECTOR |uts| % |s|))))))
                               (#2='T
                                (SEQ (LETT |explicit?| NIL)
                                     (EXIT
                                      (LETT |fn|
                                            (CONS
                                             #'|RECOP;makeFEq;Bo2SFLSF;11!1|
                                             (VECTOR % |values| |v| |op|
                                                     |eq|))))))))
                             (#2#
                              (SEQ (LETT |explicit?| NIL)
                                   (EXIT
                                    (LETT |fn|
                                          (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!2|
                                                (VECTOR % |values| |v| |op|
                                                        |eq|))))))))
                           (#2#
                            (SEQ (LETT |explicit?| NIL)
                                 (EXIT
                                  (LETT |fn|
                                        (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!3|
                                              (VECTOR % |values| |v| |op|
                                                      |eq|))))))))
                         (#2#
                          (SEQ (LETT |explicit?| NIL)
                               (EXIT
                                (LETT |fn|
                                      (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!4|
                                            (VECTOR % |values| |v| |op|
                                                    |eq|))))))))
                       (#2#
                        (SEQ (LETT |explicit?| NIL)
                             (EXIT
                              (LETT |fn|
                                    (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!5|
                                          (VECTOR % |values| |v| |op|
                                                  |eq|))))))))
                     (#2#
                      (SEQ (LETT |explicit?| NIL)
                           (EXIT
                            (LETT |fn|
                                  (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!6|
                                        (VECTOR % |values| |v| |op|
                                                |eq|))))))))
                   (#2#
                    (SEQ (LETT |explicit?| NIL)
                         (EXIT
                          (LETT |fn|
                                (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!7|
                                      (VECTOR % |values| |v| |op| |eq|))))))))
                 (#2#
                  (SEQ (LETT |explicit?| NIL)
                       (EXIT
                        (LETT |fn|
                              (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!8|
                                    (VECTOR % |values| |v| |op| |eq|))))))))
               (#2#
                (SEQ (LETT |explicit?| NIL)
                     (EXIT
                      (LETT |fn|
                            (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!9|
                                  (VECTOR % |values| |v| |op| |eq|))))))))
             (#2#
              (SEQ (LETT |explicit?| NIL)
                   (EXIT
                    (LETT |fn|
                          (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!10|
                                (VECTOR % |values| |v| |op| |eq|)))))))
            (|RECOP;setINFOSER| |info|
             (VECTOR |eq| |argsym| |op| |v| |params| |values| (CONS 1 "failed")
                     (CONS 0 |fn|) |explicit?|)
             %)
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL (QREFELT % 12)
                              (SPADCALL
                               (LIST (SPADCALL |argsym| (QREFELT % 21))
                                     (SPADCALL |info| NIL (QREFELT % 55)))
                               |params| (QREFELT % 56))
                              (QREFELT % 55)))
              (GO #3=#:G222)))))
          #3# (EXIT #1#)))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!10| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!9| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!8| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!7| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!6| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!5| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!4| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!3| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!2| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!1| (($$ NIL))
        (PROG (|eq| |op| |v| |values| %)
          (LETT |eq| (QREFELT $$ 4))
          (LETT |op| (QREFELT $$ 3))
          (LETT |v| (QREFELT $$ 2))
          (LETT |values| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT % 112))
                                 (QREFELT % 113))
                       (QREFELT % 116))
             (QREFELT % 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!0| (($$ NIL))
        (PROG (|s| % |uts|)
          (LETT |s| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |uts| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |s|
                      (|compiledLookupCheck| '|coefficients|
                                             (LIST
                                              (LIST '|Stream|
                                                    (|devaluate| (ELT % 7)))
                                              '%)
                                             |uts|)))))) 

(SDEFUN |RECOP;iADE| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|arg| (F)) (|n| (|Union| (|Integer|) "failed"))
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                     (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                     (|:| |gen| (|Union| (|Mapping| (|Stream| F)) #1="failed"))
                     (|:| |ex?| (|Boolean|))))
          (#2=#:G229 NIL) (#3=#:G231 NIL) (|g| (|Mapping| (|Stream| F)))
          (#4=#:G239 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arg| (|SPADfirst| |l|))
                (LETT |n| (SPADCALL |arg| (QREFELT % 48)))
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SEQ
                      (LETT |info|
                            (|RECOP;getINFOSER|
                             (SPADCALL
                              (SPADCALL (SPADCALL |l| (QREFELT % 76))
                                        (QREFELT % 31))
                              (QREFELT % 77))
                             %))
                      (COND
                       ((SPADCALL (QVELT |info| 5)
                                  (+
                                   (PROG1 (LETT #2# (QCDR |n|))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   1)
                                  (QREFELT % 78))
                        (COND
                         ((QEQCAR (QVELT |info| 7) 1)
                          (PROGN
                           (LETT #4#
                                 (SPADCALL (QREFELT % 12) |l| (QREFELT % 55)))
                           (GO #5=#:G238)))
                         (#6='T
                          (SEQ
                           (LETT |g|
                                 (PROG2 (LETT #3# (QVELT |info| 7))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|Mapping|
                                                    (|Stream| (QREFELT % 7)))
                                                   (|Union|
                                                    (|Mapping|
                                                     (|Stream| (QREFELT % 7)))
                                                    #1#)
                                                   #3#)))
                           (EXIT (QSETVELT |info| 5 (SPADCALL |g|))))))))
                      (EXIT
                       (PROGN
                        (LETT #4#
                              (SPADCALL
                               (SPADCALL (QVELT |info| 5) (+ (QCDR |n|) 1)
                                         (QREFELT % 80))
                               (QVELT |info| 4) (SPADCALL |l| 2 (QREFELT % 89))
                               (QREFELT % 69)))
                        (GO #5#)))))
                    (#6#
                     (PROGN
                      (LETT #4# (SPADCALL (QREFELT % 12) |l| (QREFELT % 55)))
                      (GO #5#)))))
                  (#6#
                   (PROGN
                    (LETT #4# (SPADCALL (QREFELT % 12) |l| (QREFELT % 55)))
                    (GO #5#)))))))
          #5# (EXIT #4#)))) 

(SDEFUN |RECOP;getEq;2F;13| ((|f| (F)) (% (F)))
        (SPROG
         ((|kl| (|List| (|Kernel| F))) (|op| #1=(|BasicOperator|))
          (|arg| (|List| F)) (|info| #1#) (#2=#:G248 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |kl| (SPADCALL |f| (QREFELT % 50)))
                (COND
                 ((EQL (LENGTH |kl|) 1)
                  (SEQ (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT % 77)))
                       (LETT |arg|
                             (SPADCALL (|SPADfirst| |kl|) (QREFELT % 20)))
                       (COND
                        ((SPADCALL |op| '|FEseries| (QREFELT % 119))
                         (SEQ
                          (LETT |info|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |arg| (QREFELT % 76))
                                           (QREFELT % 31))
                                 (QREFELT % 77)))
                          (EXIT
                           (PROGN
                            (LETT #2# (QVELT (|RECOP;getINFOSER| |info| %) 0))
                            (GO #3=#:G247))))))
                       (EXIT
                        (COND
                         ((SPADCALL |op| '|rootOfRec| (QREFELT % 119))
                          (SEQ
                           (LETT |info|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |arg| (QREFELT % 76))
                                            (QREFELT % 31))
                                  (QREFELT % 77)))
                           (EXIT
                            (PROGN
                             (LETT #2# (QVELT (|RECOP;getINFOREC| |info| %) 0))
                             (GO #3#))))))))))
                (EXIT
                 (|error|
                  (SPADCALL "getEq: argument should be a single FEseries "
                            "or rootOfRec object" (QREFELT % 120))))))
          #3# (EXIT #2#)))) 

(SDEFUN |RECOP;eltable?;FB;14| ((|f| (F)) (% (|Boolean|)))
        (SPROG
         ((|kl| (|List| (|Kernel| F))) (|op| #1=(|BasicOperator|))
          (|arg| (|List| F)) (|info| #1#) (#2=#:G264 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |kl| (SPADCALL |f| (QREFELT % 50)))
                (COND
                 ((EQL (LENGTH |kl|) 1)
                  (SEQ (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT % 77)))
                       (LETT |arg|
                             (SPADCALL (|SPADfirst| |kl|) (QREFELT % 20)))
                       (COND
                        ((SPADCALL |op| '|FEseries| (QREFELT % 119))
                         (SEQ
                          (LETT |info|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |arg| (QREFELT % 76))
                                           (QREFELT % 31))
                                 (QREFELT % 77)))
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (NULL
                                   (QEQCAR
                                    (QVELT (|RECOP;getINFOSER| |info| %) 7)
                                    1)))
                            (GO #3=#:G263))))))
                       (EXIT
                        (COND
                         ((SPADCALL |op| '|rootOfRec| (QREFELT % 119))
                          (SEQ
                           (LETT |info|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |arg| (QREFELT % 76))
                                            (QREFELT % 31))
                                  (QREFELT % 77)))
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (NULL
                                    (QEQCAR
                                     (QVELT (|RECOP;getINFOREC| |info| %) 6)
                                     1)))
                             (GO #3#))))))))))
                (EXIT
                 (|error|
                  (SPADCALL "eltable?: argument should be a single FEseries "
                            "or rootOfRec object" (QREFELT % 120))))))
          #3# (EXIT #2#)))) 

(SDEFUN |RECOP;values;Nni;15| ((% (|NonNegativeInteger|))) (QREFELT % 123)) 

(SDEFUN |RECOP;values;2Nni;16|
        ((|n| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((|v| (|NonNegativeInteger|)))
               (SEQ (LETT |v| (SPADCALL (QREFELT % 92))) (SETELT % 123 |n|)
                    (EXIT |v|)))) 

(SDEFUN |RECOP;ddADE| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPROG
         ((|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                     (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #1="failed"))
                     (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
                     (|:| |ex?| (|Boolean|))))
          (|x| (F)) (|n| (F)) (|f| (|BasicOperator|)) (|e| (F))
          (|TaylorCoeff| (|OutputForm|)) (|DiffEq| (|OutputForm|))
          (#2=#:G269 NIL) (|v| (|NonNegativeInteger|)) (#3=#:G281 NIL)
          (|i| NIL) (#4=#:G282 NIL) (|TaylorList| (|List| (|OutputForm|)))
          (|TaylorO| (|OutputForm|)) (|TaylorPoly| (|OutputForm|)))
         (SEQ
          (LETT |info|
                (|RECOP;getINFOSER|
                 (SPADCALL
                  (SPADCALL (SPADCALL |l| (QREFELT % 76)) (QREFELT % 31))
                  (QREFELT % 77))
                 %))
          (LETT |x| (SPADCALL (QVELT |info| 3) (QREFELT % 21)))
          (LETT |n| (|SPADfirst| |l|)) (LETT |f| (QVELT |info| 2))
          (LETT |e| (QVELT |info| 0))
          (LETT |TaylorCoeff|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT % 94))
                           (SPADCALL |n| (QREFELT % 94)) (QREFELT % 125))
                 (QREFELT % 126)))
          (EXIT
           (COND
            ((QVELT |info| 8)
             (SPADCALL
              (SPADCALL |TaylorCoeff| (SPADCALL |e| (QREFELT % 94))
                        (QREFELT % 97))
              (QREFELT % 126)))
            ('T
             (SEQ
              (LETT |DiffEq|
                    (SPADCALL
                     (LIST |TaylorCoeff|
                           (SPADCALL (SPADCALL |f| |x| (QREFELT % 67))
                                     (QREFELT % 94))
                           (SPADCALL ": " (QREFELT % 96))
                           (SPADCALL (SPADCALL |e| (QREFELT % 94))
                                     (SPADCALL (|spadConstant| % 45)
                                               (QREFELT % 98))
                                     (QREFELT % 99)))
                     (QREFELT % 127)))
              (LETT |v| (SPADCALL (QREFELT % 92)))
              (COND
               ((QEQCAR (QVELT |info| 6) 0)
                (LETT |v|
                      (MIN |v|
                           (PROG2 (LETT #2# (QVELT |info| 6))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #1#)
                                             #2#))))))
              (LETT |TaylorList|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |v|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |info| 5) |i| (QREFELT % 80))
                                (QREFELT % 65)))
                              (LETT #3#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |info| 5) |i|
                                                 (QREFELT % 80))
                                       (SPADCALL |x| (- |i| 1) (QREFELT % 128))
                                       (QREFELT % 129))
                                      (QREFELT % 94))
                                     #3#))))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (LETT |TaylorO|
                    (SPADCALL (SPADCALL 'O (QREFELT % 130))
                              (LIST
                               (SPADCALL (SPADCALL |x| |v| (QREFELT % 131))
                                         (QREFELT % 94)))
                              (QREFELT % 132)))
              (LETT |TaylorPoly|
                    (SPADCALL
                     (SPADCALL (SPADCALL |f| |x| (QREFELT % 67))
                               (QREFELT % 94))
                     (SPADCALL (ELT % 133)
                               (SPADCALL |TaylorList| |TaylorO|
                                         (QREFELT % 135))
                               (QREFELT % 137))
                     (QREFELT % 99)))
              (EXIT
               (SPADCALL (LIST |DiffEq| |TaylorPoly|) (QREFELT % 100)))))))))) 

(SDEFUN |RECOP;diffADE| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|dummyF| (F)) (|xF| (F)))
               (SEQ
                (LETT |dummyF|
                      (SPADCALL (SPADCALL (QREFELT % 105)) (QREFELT % 21)))
                (LETT |xF| (SPADCALL |x| (QREFELT % 21)))
                (EXIT
                 (SPADCALL (QREFELT % 104)
                           (LIST
                            (SPADCALL
                             (SPADCALL (QREFELT % 12) |l| (QREFELT % 55)) |xF|
                             |dummyF| (QREFELT % 64))
                            |dummyF| |xF|)
                           (QREFELT % 55)))))) 

(DECLAIM (NOTINLINE |RecurrenceOperator;|)) 

(DEFUN |RecurrenceOperator;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RecurrenceOperator| DV$1 DV$2))
          (LETT % (GETREFV 138))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RecurrenceOperator|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL '|rootOfRec| (QREFELT % 10)))
          (QSETREFV % 12 (SPADCALL '|FEseries| (QREFELT % 10)))
          (SPADCALL (QREFELT % 11) '|%dummyVar| (|spadConstant| % 13)
                    (QREFELT % 15))
          (SPADCALL (QREFELT % 12) '|%dummyVar| (|spadConstant| % 13)
                    (QREFELT % 15))
          (SPADCALL (QREFELT % 11) (CONS (|function| |RECOP;irecur|) %)
                    (QREFELT % 91))
          (SPADCALL (QREFELT % 11) '|%specialDisp|
                    (CONS (|function| |RECOP;ddrec|) %) (QREFELT % 15))
          (QSETREFV % 104
                    (SPADCALL (SPADCALL '|%diff| (QREFELT % 102))
                              (QREFELT % 103)))
          (SPADCALL (QREFELT % 11) '|%specialDiff|
                    (CONS (|function| |RECOP;diffRec|) %) (QREFELT % 15))
          (SPADCALL (QREFELT % 12) (CONS (|function| |RECOP;iADE|) %)
                    (QREFELT % 91))
          (QSETREFV % 123 4)
          (SPADCALL (QREFELT % 12) '|%specialDisp|
                    (CONS (|function| |RECOP;ddADE|) %) (QREFELT % 15))
          (SPADCALL (QREFELT % 12) '|%specialDiff|
                    (CONS (|function| |RECOP;diffADE|) %) (QREFELT % 15))
          %))) 

(DEFUN |RecurrenceOperator| (&REST #1=#:G291)
  (SPROG NIL
         (PROG (#2=#:G292)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RecurrenceOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RecurrenceOperator;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RecurrenceOperator|)))))))))) 

(MAKEPROP '|RecurrenceOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (|BasicOperator|) (0 . |operator|) '|oprecur| '|opADE| (5 . |1|)
              (|None|) (9 . |setProperty|) (|Union| 14 '"failed")
              (16 . |property|) (|List| 7) (|Kernel| 7) (22 . |argument|)
              (27 . |coerce|) (|Boolean|) (32 . |freeOf?|) (|Mapping| 22 7)
              (38 . |every?|) (|Integer|) (44 . ~=) (50 . |1|) (54 . |elt|)
              (|Kernel| %) (60 . |retract|) (|Fraction| 72) (65 . |univariate|)
              (|Fraction| 38) (71 . |denominator|) (76 . |1|) (80 . ~=)
              (|SparseUnivariatePolynomial| 7) (86 . |numer|)
              (|NonNegativeInteger|) (91 . |degree|) (96 . |coefficient|)
              (102 . =) (108 . |coefficients|) (113 . |0|) (117 . |0|)
              (|Union| 26 '"failed") (121 . |retractIfCan|) (|List| 30)
              (126 . |kernels|) (131 . |is?|) (137 . |new|) (142 . |operator|)
              (|List| %) (148 . |kernel|) (154 . |concat|) (160 . |denom|)
              (165 . |one?|) (170 . |freeOf?|) (176 . /) (182 . -)
              (187 . |coerce|) (192 . -) (198 . |eval|) (205 . |zero?|)
              (210 . +) (216 . |elt|) (222 . |first|) (227 . |eval|)
              (234 . |rest|) (239 . |first|) (|SparseUnivariatePolynomial| %)
              (245 . |gcdPolynomial|) (|Stream| 7) |RECOP;makeRec;BoSFLSF;7|
              (251 . |second|) (256 . |operator|) (261 . |less?|)
              (267 . |numberOfComputedEntries|) (272 . |elt|) (|Mapping| 18 18)
              (|Stream| 18) (278 . |stream|) (284 . |rest|) (|Mapping| 7 18)
              (|StreamFunctions2| 18 7) (289 . |map|) (295 . |concat|)
              (301 . |rest|) (|BasicOperatorFunctions1| 7) (307 . |evaluate|)
              |RECOP;values;Nni;15| (|OutputForm|) (313 . |coerce|) (|String|)
              (318 . |message|) (323 . |hconcat|) (329 . |coerce|) (334 . =)
              (340 . |bracket|) (|CommonOperators|) (345 . |operator|)
              (350 . |operator|) '|opdiff| (355 . |new|) (359 . |name|)
              (|Equation| 7) (364 . |equation|) (|Any|)
              (|ExpressionToUnivariatePowerSeries| 6 7) (370 . |taylor|)
              (376 . |complete|) (381 . |entries|)
              (|UnivariateFormalPowerSeries| 7)
              (|ExpressionSolve| 6 7 114
                                 (|UnivariateFormalPowerSeries|
                                  (|SparseMultivariatePolynomialExpressions|
                                   7)))
              (386 . |seriesSolve|) (394 . |coefficients|)
              |RECOP;makeFEq;Bo2SFLSF;11| (399 . |is?|) (405 . |elt|)
              |RECOP;getEq;2F;13| |RECOP;eltable?;FB;14| '|vals|
              |RECOP;values;2Nni;16| (411 . ^) (417 . |bracket|)
              (422 . |hconcat|) (427 . ^) (433 . *) (439 . |coerce|) (444 . ^)
              (450 . |prefix|) (456 . +) (|List| 93) (462 . |concat|)
              (|Mapping| 93 93 93) (468 . |reduce|))
           '#(|values| 474 |makeRec| 483 |makeFEq| 492 |getEq| 502 |eltable?|
              507)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|makeRec|
                                 (|#2| (|BasicOperator|) (|Symbol|) |#2|
                                  (|List| |#2|) (|Stream| |#2|)))
                                T)
                              '((|makeFEq|
                                 (|#2| (|BasicOperator|) (|Symbol|) (|Symbol|)
                                  |#2| (|List| |#2|) (|Stream| |#2|)))
                                T)
                              '((|getEq| (|#2| |#2|)) T)
                              '((|values| ((|NonNegativeInteger|))) T)
                              '((|values|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|eltable?| ((|Boolean|) |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 137
                                            '(1 9 0 8 10 0 6 0 13 3 9 0 0 8 14
                                              15 2 9 16 0 8 17 1 19 18 0 20 1 7
                                              0 8 21 2 7 22 0 0 23 2 18 22 24 0
                                              25 2 26 22 0 0 27 0 7 0 28 2 18 7
                                              0 26 29 1 7 30 0 31 2 7 32 0 30
                                              33 1 34 0 0 35 0 34 0 36 2 34 22
                                              0 0 37 1 34 38 0 39 1 38 40 0 41
                                              2 38 7 0 40 42 2 7 22 0 0 43 1 38
                                              18 0 44 0 6 0 45 0 7 0 46 1 7 47
                                              0 48 1 7 49 0 50 2 19 22 0 9 51 1
                                              8 0 0 52 2 9 0 8 40 53 2 7 0 9 54
                                              55 2 18 0 0 0 56 1 34 38 0 57 1
                                              38 22 0 58 2 7 22 0 8 59 2 7 0 0
                                              0 60 1 7 0 0 61 1 7 0 26 62 2 7 0
                                              0 0 63 3 7 0 0 0 0 64 1 7 22 0 65
                                              2 7 0 0 0 66 2 7 0 9 0 67 1 18 7
                                              0 68 3 7 0 0 54 54 69 1 18 0 0 70
                                              2 18 0 0 40 71 2 7 72 72 72 73 1
                                              18 7 0 76 1 19 9 0 77 2 74 22 0
                                              40 78 1 74 40 0 79 2 74 7 0 26 80
                                              2 82 0 81 18 83 1 82 0 0 84 2 86
                                              74 85 82 87 2 74 0 0 0 88 2 18 0
                                              0 40 89 2 90 9 9 85 91 1 7 93 0
                                              94 1 93 0 95 96 2 93 0 0 0 97 1 6
                                              93 0 98 2 93 0 0 0 99 1 93 0 54
                                              100 1 101 9 8 102 1 7 9 9 103 0 8
                                              0 105 1 9 8 0 106 2 107 0 7 7 108
                                              2 110 109 7 107 111 1 74 0 0 112
                                              1 74 18 0 113 4 115 114 7 9 8 18
                                              116 1 114 74 0 117 2 9 22 0 8 119
                                              2 95 0 0 0 120 2 93 0 0 0 125 1
                                              93 0 0 126 1 93 0 54 127 2 7 0 0
                                              26 128 2 7 0 0 0 129 1 8 93 0 130
                                              2 7 0 0 40 131 2 93 0 0 54 132 2
                                              93 0 0 0 133 2 134 0 0 93 135 2
                                              134 93 136 0 137 1 0 40 40 124 0
                                              0 40 92 5 0 7 9 8 7 18 74 75 6 0
                                              7 9 8 8 7 18 74 118 1 0 7 7 121 1
                                              0 22 7 122)))))
           '|lookupComplete|)) 
