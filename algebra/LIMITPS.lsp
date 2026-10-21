
(SDEFUN |LIMITPS;is_exp_log| ((|fcn| (FE)) (|x| (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|k| NIL) (#1=#:G188 NIL) (|nm| (|Symbol|)) (#2=#:G186 NIL)
          (#3=#:G187 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |fcn| (QREFELT % 11))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |nm|
                          (SPADCALL (SPADCALL |k| (QREFELT % 14))
                                    (QREFELT % 16)))
                    (COND
                     ((OR (EQUAL |nm| |x|)
                          (OR (EQUAL |nm| '|log|)
                              (OR (EQUAL |nm| '|exp|)
                                  (OR (EQUAL |nm| '|%power|)
                                      (OR (EQUAL |nm| '|nthRoot|)
                                          (OR (EQUAL |nm| '|cosh|)
                                              (OR (EQUAL |nm| '|coth|)
                                                  (OR (EQUAL |nm| '|sinh|)
                                                      (OR (EQUAL |nm| '|tanh|)
                                                          (OR
                                                           (EQUAL |nm| '|sech|)
                                                           (OR
                                                            (EQUAL |nm|
                                                                   '|csch|)
                                                            (OR
                                                             (EQUAL |nm|
                                                                    '|acosh|)
                                                             (OR
                                                              (EQUAL |nm|
                                                                     '|acoth|)
                                                              (OR
                                                               (EQUAL |nm|
                                                                      '|asinh|)
                                                               (OR
                                                                (EQUAL |nm|
                                                                       '|atanh|)
                                                                (OR
                                                                 (EQUAL |nm|
                                                                        '|asech|)
                                                                 (OR
                                                                  (EQUAL |nm|
                                                                         '|acsch|)
                                                                  (OR
                                                                   (EQUAL |nm|
                                                                          '|Ei|)
                                                                   (OR
                                                                    (EQUAL |nm|
                                                                           '|erf|)
                                                                    (OR
                                                                     (EQUAL
                                                                      |nm|
                                                                      '|erfi|)
                                                                     (OR
                                                                      (EQUAL
                                                                       |nm|
                                                                       '|li|)
                                                                      (OR
                                                                       (EQUAL
                                                                        |nm|
                                                                        '|Gamma|)
                                                                       (OR
                                                                        (EQUAL
                                                                         |nm|
                                                                         '|digamma|)
                                                                        (EQUAL
                                                                         |nm|
                                                                         '|dilog|))))))))))))))))))))))))
                      (EXIT (PROGN (LETT #2# |$NoValue|) (GO #4=#:G157)))))
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL |k| (QREFELT % 18)) |x|
                                  (QREFELT % 19))
                        (|spadConstant| % 8) (QREFELT % 21))
                       (PROGN (LETT #2# |$NoValue|) (GO #4#)))
                      ('T (PROGN (LETT #3# NIL) (GO #5=#:G185)))))))
                  #4# (EXIT #2#))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #3#)))) 

(SDEFUN |LIMITPS;noX?| ((|fcn| (FE)) (|x| (|Symbol|)) (% (|Boolean|)))
        (NULL (SPADCALL |x| (SPADCALL |fcn| (QREFELT % 23)) (QREFELT % 24)))) 

(SDEFUN |LIMITPS;constant?| ((|fcn| (FE)) (% (|Boolean|)))
        (NULL (SPADCALL |fcn| (QREFELT % 23)))) 

(SDEFUN |LIMITPS;firstNonLogPtr|
        ((|fcn| (FE)) (|x| (|Symbol|)) (% (|List| (|Kernel| FE))))
        (SPROG
         ((|ker| (|Kernel| FE)) (#1=#:G201 NIL)
          (|list| (|List| (|Kernel| FE))))
         (SEQ
          (EXIT
           (SEQ (LETT |list| (SPADCALL |fcn| (QREFELT % 25)))
                (SEQ G190 (COND ((NULL (NULL (NULL |list|))) (GO G191)))
                     (SEQ (LETT |ker| (|SPADfirst| |list|))
                          (COND
                           ((NULL (SPADCALL |ker| '|log| (QREFELT % 26)))
                            (COND
                             ((SPADCALL |x|
                                        (SPADCALL
                                         (SPADCALL |ker| (QREFELT % 18))
                                         (QREFELT % 23))
                                        (QREFELT % 24))
                              (COND
                               ((NULL
                                 (EQUAL |x| (SPADCALL |ker| (QREFELT % 27))))
                                (EXIT
                                 (PROGN
                                  (LETT #1# |list|)
                                  (GO #2=#:G200)))))))))
                          (EXIT (LETT |list| (CDR |list|))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #2# (EXIT #1#)))) 

(SDEFUN |LIMITPS;finiteValueAtInfinity?|
        ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND
         ((OR (SPADCALL |ker| '|erf| (QREFELT % 26))
              (OR (SPADCALL |ker| '|sech| (QREFELT % 26))
                  (OR (SPADCALL |ker| '|csch| (QREFELT % 26))
                      (OR (SPADCALL |ker| '|tanh| (QREFELT % 26))
                          (OR (SPADCALL |ker| '|coth| (QREFELT % 26))
                              (OR (SPADCALL |ker| '|atan| (QREFELT % 26))
                                  (OR (SPADCALL |ker| '|acot| (QREFELT % 26))
                                      (OR
                                       (SPADCALL |ker| '|asec| (QREFELT % 26))
                                       (OR
                                        (SPADCALL |ker| '|acsc| (QREFELT % 26))
                                        (OR
                                         (SPADCALL |ker| '|acsch|
                                                   (QREFELT % 26))
                                         (OR
                                          (SPADCALL |ker| '|acoth|
                                                    (QREFELT % 26))
                                          (OR
                                           (SPADCALL |ker| '|fresnelS|
                                                     (QREFELT % 26))
                                           (OR
                                            (SPADCALL |ker| '|fresnelC|
                                                      (QREFELT % 26))
                                            (OR
                                             (SPADCALL |ker| '|Si|
                                                       (QREFELT % 26))
                                             (SPADCALL |ker| '|airyAi|
                                                       (QREFELT %
                                                                26))))))))))))))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;finiteValueAtPlusInfinity?|
        ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND
         ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| %)
              (OR (SPADCALL |ker| '|Ci| (QREFELT % 26))
                  (SPADCALL |ker| '|airyAiPrime| (QREFELT % 26))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;finiteValueAtMinusInfinity?|
        ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND
         ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| %)
              (SPADCALL |ker| '|airyBi| (QREFELT % 26)))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtInfinity?| ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND
         ((OR (SPADCALL |ker| '|exp| (QREFELT % 26))
              (OR (SPADCALL |ker| '|sinh| (QREFELT % 26))
                  (OR (SPADCALL |ker| '|cosh| (QREFELT % 26))
                      (SPADCALL |ker| '|Shi| (QREFELT % 26)))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtPlusInfinity?|
        ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND
         ((OR (|LIMITPS;knownValueAtInfinity?| |ker| %)
              (OR (SPADCALL |ker| '|airyBi| (QREFELT % 26))
                  (OR (SPADCALL |ker| '|airyBiPrime| (QREFELT % 26))
                      (SPADCALL |ker| '|Chi| (QREFELT % 26)))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtMinusInfinity?|
        ((|ker| (|Kernel| FE)) (% (|Boolean|)))
        (COND ((|LIMITPS;knownValueAtInfinity?| |ker| %) 'T) ('T NIL))) 

(SDEFUN |LIMITPS;leftOrRight|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|limVal| (FE)) (% (|SingleInteger|)))
        (SPROG
         ((|value| (|Union| (|OrderedCompletion| FE) "failed"))
          (|val| (|OrderedCompletion| FE)) (|inf| (|SingleInteger|)))
         (SEQ
          (LETT |value|
                (|LIMITPS;limitPlus|
                 (SPADCALL (SPADCALL |fcn| |limVal| (QREFELT % 28))
                           (QREFELT % 29))
                 |x| %))
          (EXIT
           (COND ((QEQCAR |value| 1) 0)
                 (#1='T
                  (SEQ
                   (LETT |inf|
                         (SPADCALL (LETT |val| (QCDR |value|)) (QREFELT % 32)))
                   (EXIT
                    (COND
                     ((|eql_SI| |inf| 0)
                      (|error| "limit package: internal error"))
                     (#1# |inf|)))))))))) 

(SDEFUN |LIMITPS;specialLimit|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
        (SPROG
         ((#2=#:G264 NIL) (#3=#:G265 NIL) (|xkers| (|List| (|Kernel| FE)))
          (|k| NIL) (#4=#:G266 NIL)
          (|fval| (|Union| (|OrderedCompletion| FE) #1#))
          (|val| (|OrderedCompletion| FE)) (|valu| (|Union| FE "failed"))
          (|finVal| (FE)) (|num| (FE)) (|den| (FE)) (#5=#:G263 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xkers|
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |k| NIL)
                        (LETT #3# (SPADCALL |fcn| (QREFELT % 25))) G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |x|
                                      (SPADCALL (SPADCALL |k| (QREFELT % 18))
                                                (QREFELT % 23))
                                      (QREFELT % 24))
                            (LETT #2# (CONS |k| #2#))))))
                        (LETT #3# (CDR #3#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
            (EXIT
             (COND
              ((EQL (LENGTH |xkers|) 1) (|LIMITPS;specialLimit1| |fcn| |x| %))
              ('T
               (SEQ (LETT |num| (SPADCALL |fcn| (QREFELT % 35)))
                    (LETT |den| (SPADCALL |fcn| (QREFELT % 36)))
                    (SEQ (LETT |k| NIL) (LETT #4# |xkers|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |fval|
                                (|LIMITPS;limitPlus|
                                 (SPADCALL |k| (QREFELT % 18)) |x| %))
                          (EXIT
                           (COND
                            ((OR (QEQCAR |fval| 1)
                                 (SPADCALL
                                  (SPADCALL (LETT |val| (QCDR |fval|))
                                            (QREFELT % 32))
                                  0 (QREFELT % 38)))
                             (PROGN
                              (LETT #5#
                                    (|LIMITPS;specialLimitNormalize| |fcn| |x|
                                     %))
                              (GO #6=#:G262)))
                            ('T
                             (SEQ (LETT |valu| (SPADCALL |val| (QREFELT % 40)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |valu| 1)
                                     (PROGN
                                      (LETT #5#
                                            (|LIMITPS;specialLimitNormalize|
                                             |fcn| |x| %))
                                      (GO #6#)))
                                    ('T
                                     (SEQ (LETT |finVal| (QCDR |valu|))
                                          (LETT |num|
                                                (SPADCALL |num| |k| |finVal|
                                                          (QREFELT % 41)))
                                          (LETT |den|
                                                (SPADCALL |den| |k| |finVal|
                                                          (QREFELT % 41)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |den|
                                                       (|spadConstant| % 8)
                                                       (QREFELT % 21))
                                             (PROGN
                                              (LETT #5#
                                                    (|LIMITPS;specialLimitNormalize|
                                                     |fcn| |x| %))
                                              (GO #6#))))))))))))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |num| |den| (QREFELT % 42))
                                     (QREFELT % 43))))))))))
          #6# (EXIT #5#)))) 

(SDEFUN |LIMITPS;specialLimitNormalize|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
        (SPROG
         ((|nfcn| (FE)) (#2=#:G289 NIL) (#3=#:G290 NIL)
          (|xkers| (|List| #4=(|Kernel| FE))) (#5=#:G291 NIL) (|k| NIL)
          (#6=#:G292 NIL) (|expKers| (|List| #4#)) (|expKer| (|Kernel| FE))
          (|fval| (|Union| (|OrderedCompletion| FE) #1#)) (|vv| (|Symbol|))
          (|eq| (|Equation| FE)) (|cc| (FE))
          (|expKerLim| (|OrderedCompletion| FE))
          (|limVal|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed"))
          (|limm| (|OrderedCompletion| FE)) (|lim| (|Union| FE "failed")))
         (SEQ (LETT |nfcn| (SPADCALL |fcn| (QREFELT % 45)))
              (EXIT
               (COND
                ((SPADCALL |fcn| |nfcn| (QREFELT % 46))
                 (|LIMITPS;limitPlus| |nfcn| |x| %))
                (#7='T
                 (SEQ
                  (LETT |xkers|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |k| NIL)
                              (LETT #3# (SPADCALL |fcn| (QREFELT % 11))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |k| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL |k| (QREFELT % 18))
                                             (QREFELT % 23))
                                            (QREFELT % 24))
                                  (LETT #2# (CONS |k| #2#))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |xkers|) 2 (QREFELT % 48))
                     (CONS 1 "failed"))
                    (#7#
                     (SEQ
                      (LETT |expKers|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |k| NIL) (LETT #6# |xkers|) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |k| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |k| '|exp| (QREFELT % 26))
                                      (LETT #5# (CONS |k| #5#))))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT (NREVERSE #5#)))))
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |expKers|) 1 (QREFELT % 48))
                         (CONS 1 "failed"))
                        (#7#
                         (SEQ (LETT |expKer| (|SPADfirst| |expKers|))
                              (LETT |fval|
                                    (|LIMITPS;limitPlus|
                                     (SPADCALL |expKer| (QREFELT % 18)) |x| %))
                              (EXIT
                               (COND ((QEQCAR |fval| 1) (CONS 1 "failed"))
                                     (#7#
                                      (SEQ
                                       (LETT |vv| (SPADCALL (QREFELT % 49)))
                                       (LETT |eq|
                                             (SPADCALL
                                              (SPADCALL |expKer|
                                                        (QREFELT % 18))
                                              (SPADCALL |vv| (QREFELT % 50))
                                              (QREFELT % 52)))
                                       (LETT |cc|
                                             (SPADCALL |fcn| |eq|
                                                       (QREFELT % 54)))
                                       (LETT |expKerLim| (QCDR |fval|))
                                       (LETT |limVal|
                                             (|LIMITPS;locallimit| |cc| |vv|
                                              |expKerLim| %))
                                       (EXIT
                                        (COND
                                         ((OR (QEQCAR |limVal| 2)
                                              (NULL (QEQCAR |limVal| 0)))
                                          (CONS 1 "failed"))
                                         ('T
                                          (SEQ (LETT |limm| (QCDR |limVal|))
                                               (LETT |lim|
                                                     (SPADCALL |limm|
                                                               (QREFELT % 40)))
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |lim| 1)
                                                  (CONS 1 "failed"))
                                                 (#7#
                                                  (|LIMITPS;limitPlus|
                                                   (QCDR |lim|) |x|
                                                   %))))))))))))))))))))))))))) 

(SDEFUN |LIMITPS;specialLimit1|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
        (SPROG
         ((#2=#:G308 NIL) (|k| NIL) (#3=#:G309 NIL)
          (|xkers| (|List| (|Kernel| FE))) (|ker| (|Kernel| FE))
          (|vv| (|Symbol|)) (|eq| (|Equation| FE)) (|cc| (FE))
          (|lim| (|Union| (|OrderedCompletion| FE) #1#))
          (|argLim| (|OrderedCompletion| FE))
          (|limVal|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed")))
         (SEQ
          (LETT |xkers|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #3# (SPADCALL |fcn| (QREFELT % 25)))
                      G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT % 18))
                                              (QREFELT % 23))
                                    (QREFELT % 24))
                          (LETT #2# (CONS |k| #2#))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |xkers|) 1 (QREFELT % 48)) (CONS 1 "failed"))
            (#4='T
             (SEQ (LETT |ker| (|SPADfirst| |xkers|))
                  (LETT |vv| (SPADCALL (QREFELT % 49)))
                  (LETT |eq|
                        (SPADCALL (SPADCALL |ker| (QREFELT % 18))
                                  (SPADCALL |vv| (QREFELT % 50))
                                  (QREFELT % 52)))
                  (LETT |cc| (SPADCALL |fcn| |eq| (QREFELT % 54)))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (SPADCALL |cc| (QREFELT % 23))
                               (QREFELT % 24))
                     (CONS 1 "failed"))
                    (#4#
                     (SEQ
                      (LETT |lim| (|LIMITPS;specialLimitKernel| |ker| |x| %))
                      (EXIT
                       (COND ((QEQCAR |lim| 1) |lim|)
                             (#4#
                              (SEQ (LETT |argLim| (QCDR |lim|))
                                   (LETT |limVal|
                                         (|LIMITPS;locallimit| |cc| |vv|
                                          |argLim| %))
                                   (EXIT
                                    (COND
                                     ((OR (QEQCAR |limVal| 2)
                                          (NULL (QEQCAR |limVal| 0)))
                                      (CONS 1 "failed"))
                                     ('T
                                      (CONS 0 (QCDR |limVal|)))))))))))))))))))) 

(SDEFUN |LIMITPS;specialLimitKernel|
        ((|ker| (|Kernel| FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
        (SPROG
         ((#2=#:G315 NIL) (|li| (FE)) (#3=#:G377 NIL)
          (|argLim| (|OrderedCompletion| FE)) (|args| (|List| FE)) (|arg| (FE))
          (|limm| (|Union| (|OrderedCompletion| FE) #1#))
          (|lim| (|OrderedCompletion| FE)) (|var| (|Symbol|)) (|f| (FE))
          (|inf| (|SingleInteger|))
          (|kerValue|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed"))
          (|val| (FE)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |ker| '|log| (QREFELT % 26))
             (SEQ (LETT |args| (SPADCALL |ker| (QREFELT % 56)))
                  (EXIT
                   (COND
                    ((OR (NULL |args|) (NULL (NULL (CDR |args|))))
                     (CONS 1 "failed"))
                    ('T
                     (SEQ (LETT |arg| (|SPADfirst| |args|))
                          (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| %))
                          (EXIT
                           (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                                 (#4='T
                                  (SEQ (LETT |lim| (QCDR |limm|))
                                       (EXIT
                                        (COND
                                         ((|eql_SI|
                                           (LETT |inf|
                                                 (SPADCALL |lim|
                                                           (QREFELT % 32)))
                                           -1)
                                          (CONS 1 "failed"))
                                         (#4#
                                          (LETT |argLim|
                                                (CONS 0
                                                      (COND
                                                       ((|eql_SI| |inf| 1)
                                                        |lim|)
                                                       (#4#
                                                        (SEQ
                                                         (LETT |li|
                                                               (PROG2
                                                                   (LETT #2#
                                                                         (SPADCALL
                                                                          |lim|
                                                                          (QREFELT
                                                                           %
                                                                           40)))
                                                                   (QCDR #2#)
                                                                 (|check_union2|
                                                                  (QEQCAR #2#
                                                                          0)
                                                                  (QREFELT % 7)
                                                                  (|Union|
                                                                   (QREFELT %
                                                                            7)
                                                                   "failed")
                                                                  #2#)))
                                                         (EXIT
                                                          (COND
                                                           ((SPADCALL |li|
                                                                      (|spadConstant|
                                                                       % 8)
                                                                      (QREFELT
                                                                       % 21))
                                                            (COND
                                                             ((|eql_SI|
                                                               (|LIMITPS;leftOrRight|
                                                                |arg| |x|
                                                                (|spadConstant|
                                                                 % 8)
                                                                %)
                                                               1)
                                                              (SPADCALL
                                                               (QREFELT % 59)))
                                                             (#4#
                                                              (PROGN
                                                               (LETT #3#
                                                                     (CONS 1
                                                                           "failed"))
                                                               (GO
                                                                #5=#:G376)))))
                                                           (#4#
                                                            (SPADCALL
                                                             (SPADCALL |li|
                                                                       (QREFELT
                                                                        % 60))
                                                             (QREFELT %
                                                                      43)))))))))))))))))))))))
            (#4#
             (SEQ (LETT |args| (SPADCALL |ker| (QREFELT % 56)))
                  (EXIT
                   (COND
                    ((OR (NULL |args|) (NULL (NULL (CDR |args|))))
                     (CONS 1 "failed"))
                    ('T
                     (SEQ (LETT |arg| (|SPADfirst| |args|))
                          (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| %))
                          (EXIT
                           (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                                 (#4#
                                  (SEQ (LETT |lim| (QCDR |limm|))
                                       (LETT |f|
                                             (SPADCALL
                                              (SPADCALL |ker| (QREFELT % 14))
                                              (SPADCALL
                                               (LETT |var|
                                                     (SPADCALL (QREFELT % 49)))
                                               (QREFELT % 50))
                                              (QREFELT % 61)))
                                       (LETT |inf|
                                             (SPADCALL |lim| (QREFELT % 32)))
                                       (EXIT
                                        (COND
                                         ((|eql_SI| |inf| 0)
                                          (COND
                                           ((SPADCALL |ker| '|erf|
                                                      (QREFELT % 26))
                                            (CONS 0
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |lim|
                                                              (QREFELT % 62))
                                                    (QREFELT % 64))
                                                   (QREFELT % 43))))
                                           (#4#
                                            (SEQ
                                             (LETT |kerValue|
                                                   (|LIMITPS;locallimit| |f|
                                                    |var| |lim| %))
                                             (EXIT
                                              (COND
                                               ((OR (QEQCAR |kerValue| 2)
                                                    (NULL
                                                     (QEQCAR |kerValue| 0)))
                                                (CONS 1 "failed"))
                                               ('T
                                                (CONS 0
                                                      (QCDR |kerValue|)))))))))
                                         ((|eql_SI| |inf| 1)
                                          (COND
                                           ((|LIMITPS;finiteValueAtPlusInfinity?|
                                             |ker| %)
                                            (SEQ
                                             (LETT |val|
                                                   (COND
                                                    ((SPADCALL |ker| '|erf|
                                                               (QREFELT % 26))
                                                     (|spadConstant| % 57))
                                                    ((OR
                                                      (SPADCALL |ker| '|sech|
                                                                (QREFELT % 26))
                                                      (OR
                                                       (SPADCALL |ker| '|csch|
                                                                 (QREFELT %
                                                                          26))
                                                       (OR
                                                        (SPADCALL |ker| '|tanh|
                                                                  (QREFELT %
                                                                           26))
                                                        (SPADCALL |ker| '|coth|
                                                                  (QREFELT %
                                                                           26)))))
                                                     (|spadConstant| % 8))
                                                    ((SPADCALL |ker| '|atan|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 65))
                                                      (SPADCALL 2
                                                                (QREFELT % 66))
                                                      (QREFELT % 42)))
                                                    ((SPADCALL |ker| '|acot|
                                                               (QREFELT % 26))
                                                     (|spadConstant| % 8))
                                                    ((SPADCALL |ker| '|asec|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 65))
                                                      (SPADCALL 2
                                                                (QREFELT % 66))
                                                      (QREFELT % 42)))
                                                    ((OR
                                                      (SPADCALL |ker| '|acsc|
                                                                (QREFELT % 26))
                                                      (OR
                                                       (SPADCALL |ker| '|acsch|
                                                                 (QREFELT %
                                                                          26))
                                                       (SPADCALL |ker| '|acoth|
                                                                 (QREFELT %
                                                                          26))))
                                                     (|spadConstant| % 8))
                                                    ((OR
                                                      (SPADCALL |ker|
                                                                '|fresnelS|
                                                                (QREFELT % 26))
                                                      (SPADCALL |ker|
                                                                '|fresnelC|
                                                                (QREFELT %
                                                                         26)))
                                                     (SPADCALL
                                                      (|spadConstant| % 57)
                                                      (SPADCALL 2
                                                                (QREFELT % 66))
                                                      (QREFELT % 42)))
                                                    ((SPADCALL |ker| '|Si|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 65))
                                                      (SPADCALL 2
                                                                (QREFELT % 66))
                                                      (QREFELT % 42)))
                                                    ((OR
                                                      (SPADCALL |ker| '|Ci|
                                                                (QREFELT % 26))
                                                      (OR
                                                       (SPADCALL |ker|
                                                                 '|airyAi|
                                                                 (QREFELT %
                                                                          26))
                                                       (SPADCALL |ker|
                                                                 '|airyAiPrime|
                                                                 (QREFELT %
                                                                          26))))
                                                     (|spadConstant| % 8))
                                                    ('T
                                                     (|error|
                                                      "Finite but unknown value at infinity"))))
                                             (EXIT
                                              (CONS 0
                                                    (SPADCALL |val|
                                                              (QREFELT %
                                                                       43))))))
                                           ((|LIMITPS;knownValueAtPlusInfinity?|
                                             |ker| %)
                                            (CONS 0 |lim|))
                                           (#4# (CONS 1 "failed"))))
                                         (#4#
                                          (COND
                                           ((|LIMITPS;finiteValueAtMinusInfinity?|
                                             |ker| %)
                                            (SEQ
                                             (LETT |val|
                                                   (COND
                                                    ((SPADCALL |ker| '|erf|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (|spadConstant| % 57)
                                                      (QREFELT % 69)))
                                                    ((OR
                                                      (SPADCALL |ker| '|sech|
                                                                (QREFELT % 26))
                                                      (OR
                                                       (SPADCALL |ker| '|csch|
                                                                 (QREFELT %
                                                                          26))
                                                       (OR
                                                        (SPADCALL |ker| '|tanh|
                                                                  (QREFELT %
                                                                           26))
                                                        (SPADCALL |ker| '|coth|
                                                                  (QREFELT %
                                                                           26)))))
                                                     (|spadConstant| % 8))
                                                    ((SPADCALL |ker| '|atan|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT % 65))
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          66))
                                                       (QREFELT % 42))
                                                      (QREFELT % 69)))
                                                    ((SPADCALL |ker| '|acot|
                                                               (QREFELT % 26))
                                                     (SPADCALL (QREFELT % 65)))
                                                    ((SPADCALL |ker| '|asec|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT % 65))
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          66))
                                                       (QREFELT % 42))
                                                      (QREFELT % 69)))
                                                    ((SPADCALL |ker| '|acsc|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 65))
                                                      (QREFELT % 69)))
                                                    ((OR
                                                      (SPADCALL |ker| '|acsch|
                                                                (QREFELT % 26))
                                                      (SPADCALL |ker| '|acoth|
                                                                (QREFELT %
                                                                         26)))
                                                     (|spadConstant| % 8))
                                                    ((OR
                                                      (SPADCALL |ker|
                                                                '|fresnelS|
                                                                (QREFELT % 26))
                                                      (SPADCALL |ker|
                                                                '|fresnelC|
                                                                (QREFELT %
                                                                         26)))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|spadConstant| % 57)
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          66))
                                                       (QREFELT % 42))
                                                      (QREFELT % 69)))
                                                    ((SPADCALL |ker| '|Si|
                                                               (QREFELT % 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT % 65))
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          66))
                                                       (QREFELT % 42))
                                                      (QREFELT % 69)))
                                                    ((OR
                                                      (SPADCALL |ker| '|airyAi|
                                                                (QREFELT % 26))
                                                      (SPADCALL |ker| '|airyBi|
                                                                (QREFELT %
                                                                         26)))
                                                     (|spadConstant| % 8))
                                                    ('T
                                                     (|error|
                                                      "Finite but unknown value at minus infinity"))))
                                             (EXIT
                                              (CONS 0
                                                    (SPADCALL |val|
                                                              (QREFELT %
                                                                       43))))))
                                           ((|LIMITPS;knownValueAtMinusInfinity?|
                                             |ker| %)
                                            (COND
                                             ((SPADCALL |ker| '|exp|
                                                        (QREFELT % 26))
                                              (CONS 0
                                                    (SPADCALL
                                                     (|spadConstant| % 8)
                                                     (QREFELT % 43))))
                                             ((SPADCALL |ker| '|sinh|
                                                        (QREFELT % 26))
                                              (CONS 0 |lim|))
                                             ((SPADCALL |ker| '|cosh|
                                                        (QREFELT % 26))
                                              (CONS 0
                                                    (SPADCALL (QREFELT % 70))))
                                             (#4#
                                              (|error|
                                               "knownValueAtMinusInfinity? true but value unknown"))))
                                           (#4#
                                            (CONS 1 "failed"))))))))))))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |LIMITPS;logOnlyLimit|
        ((|coef| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (SPROG ((|vv| (|Symbol|)) (|eq| (|Equation| FE)) (|cc| (FE)))
               (SEQ (LETT |vv| (SPADCALL (QREFELT % 49)))
                    (LETT |eq|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 50))
                                     (QREFELT % 60))
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT % 50))
                                      (QREFELT % 29))
                            (QREFELT % 69))
                           (QREFELT % 52)))
                    (EXIT
                     (COND
                      ((SPADCALL |x|
                                 (SPADCALL
                                  (LETT |cc|
                                        (SPADCALL |coef| |eq| (QREFELT % 54)))
                                  (QREFELT % 23))
                                 (QREFELT % 24))
                       (CONS 1 "failed"))
                      ('T (|LIMITPS;limitPlus| |cc| |vv| %))))))) 

(SDEFUN |LIMITPS;locallimit|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| FE))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
        (SPROG
         ((|xK| (|Kernel| FE)) (|n| (|SingleInteger|))
          (|u| (|Union| (|OrderedCompletion| FE) #1#)))
         (SEQ
          (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT % 50)) (QREFELT % 71)))
          (LETT |n| (SPADCALL |a| (QREFELT % 32)))
          (EXIT
           (COND
            ((|eql_SI| |n| 0)
             (|LIMITPS;realLimit|
              (|LIMITPS;localsubst| |fcn| |xK| 1 (SPADCALL |a| (QREFELT % 62))
               %)
              |x| %))
            (#2='T
             (SEQ
              (LETT |u|
                    (|LIMITPS;limitPlus|
                     (SPADCALL |fcn| |xK|
                               (SPADCALL |n|
                                         (SPADCALL
                                          (SPADCALL |xK| (QREFELT % 18))
                                          (QREFELT % 29))
                                         (QREFELT % 72))
                               (QREFELT % 41))
                     |x| %))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 2 "failed"))
                     (#2# (CONS 0 (QCDR |u|)))))))))))) 

(SDEFUN |LIMITPS;localsubst|
        ((|fcn| (FE)) (|k| (|Kernel| FE)) (|n| (|Integer|)) (|a| (FE))
         (% (FE)))
        (SEQ
         (COND
          ((SPADCALL |a| (|spadConstant| % 8) (QREFELT % 21))
           (COND ((EQL |n| 1) (EXIT |fcn|)))))
         (EXIT
          (SPADCALL |fcn| |k|
                    (SPADCALL
                     (SPADCALL |n| (SPADCALL |k| (QREFELT % 18))
                               (QREFELT % 72))
                     |a| (QREFELT % 73))
                    (QREFELT % 41))))) 

(SDEFUN |LIMITPS;locallimitcomplex|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (|OnePointCompletion| FE))
         (% (|Union| (|OnePointCompletion| FE) "failed")))
        (SPROG ((|xK| (|Kernel| FE)) (|g| (|Union| FE "failed")))
               (SEQ
                (LETT |xK|
                      (SPADCALL (SPADCALL |x| (QREFELT % 50)) (QREFELT % 71)))
                (LETT |g| (SPADCALL |a| (QREFELT % 75)))
                (EXIT
                 (COND
                  ((QEQCAR |g| 0)
                   (|LIMITPS;complLimit|
                    (|LIMITPS;localsubst| |fcn| |xK| 1 (QCDR |g|) %) |x| %))
                  ('T
                   (|LIMITPS;complLimit|
                    (SPADCALL |fcn| |xK|
                              (SPADCALL (SPADCALL |xK| (QREFELT % 18))
                                        (QREFELT % 29))
                              (QREFELT % 41))
                    |x| %))))))) 

(SDEFUN |LIMITPS;subst_in_result|
        ((|r| (|Union| (|OrderedCompletion| FE) #1="failed"))
         (|k| (|Kernel| FE)) (|f| (FE))
         (% (|Union| (|OrderedCompletion| FE) #1#)))
        (SPROG ((|ru| (|Union| FE "failed")))
               (SEQ
                (COND ((QEQCAR |r| 1) |r|)
                      (#2='T
                       (SEQ (LETT |ru| (SPADCALL (QCDR |r|) (QREFELT % 40)))
                            (EXIT
                             (COND ((QEQCAR |ru| 1) |r|)
                                   (#2#
                                    (CONS 0
                                          (SPADCALL
                                           (SPADCALL (QCDR |ru|) (LIST |k|)
                                                     (LIST |f|) (QREFELT % 77))
                                           (QREFELT % 43)))))))))))) 

(SDEFUN |LIMITPS;limit2|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|str| (|String|))
         (|do_lim|
          (|Mapping| (|Union| (|OrderedCompletion| FE) #1="failed") FE
                     (|Symbol|) FE (|String|)))
         (% (|Union| (|OrderedCompletion| FE) #1#)))
        (SPROG
         ((|xx| (|Union| (|Symbol|) "failed")) (|x| (|Symbol|)) (|a| (FE))
          (|knx| (|Kernel| FE)) (|a1| (FE)))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT % 78)) (QREFELT % 80)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "limit:left hand side must be a variable"))
            (#2='T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT % 81)))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (SPADCALL |a| (QREFELT % 23))
                               (QREFELT % 24))
                     (SEQ
                      (LETT |knx|
                            (SPADCALL (SPADCALL (QREFELT % 49))
                                      (QREFELT % 82)))
                      (LETT |a1|
                            (SPADCALL |a| (LIST (SPADCALL |x| (QREFELT % 82)))
                                      (LIST (SPADCALL |knx| (QREFELT % 18)))
                                      (QREFELT % 77)))
                      (EXIT
                       (|LIMITPS;subst_in_result|
                        (SPADCALL |fcn| |x| |a1| |str| |do_lim|) |knx|
                        (SPADCALL |eq| (QREFELT % 78)) %))))
                    (#2# (SPADCALL |fcn| |x| |a| |str| |do_lim|))))))))))) 

(SDEFUN |LIMITPS;limit3|
        ((|fcn| (FE)) (|x| (|Symbol|)) (|a| (FE)) (|str| (|String|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (SPROG ((|xK| (|Kernel| FE)))
               (SEQ
                (LETT |xK|
                      (SPADCALL (SPADCALL |x| (QREFELT % 50)) (QREFELT % 71)))
                (EXIT
                 (|LIMITPS;limitPlus|
                  (|LIMITPS;localsubst| |fcn| |xK|
                   (SPADCALL |str| (QREFELT % 85)) |a| %)
                  |x| %))))) 

(SDEFUN |LIMITPS;limit;FEESU;23|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|str| (|String|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS #'|LIMITPS;limit;FEESU;23!0| %) %)) 

(SDEFUN |LIMITPS;limit;FEESU;23!0|
        ((|f| NIL) (|x| NIL) (|a| NIL) (|s| NIL) (% NIL))
        (COND
         ((|LIMITPS;is_exp_log| |f| |x| %)
          (SPADCALL |f| |x| |a| |s| (QREFELT % 89)))
         ('T (|LIMITPS;limit3| |f| |x| |a| |s| %)))) 

(SDEFUN |LIMITPS;limit;FEESU;24|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|str| (|String|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS (|function| |LIMITPS;limit3|) %) %)) 

(SDEFUN |LIMITPS;limit;FEESU;25|
        ((|fcn| (FE)) (|eq| (|Equation| FE)) (|str| (|String|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS (|function| |LIMITPS;limit3|) %) %)) 

(SDEFUN |LIMITPS;anyRootsOrAtrigs?| ((|fcn| (FE)) (% (|Boolean|)))
        (SPROG ((|kernel| NIL) (#1=#:G454 NIL) (#2=#:G453 NIL) (#3=#:G452 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |kernel| NIL)
                       (LETT #1# (SPADCALL |fcn| (QREFELT % 11))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |kernel| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((OR (SPADCALL |kernel| '|nthRoot| (QREFELT % 26))
                               (OR (SPADCALL |kernel| '|asin| (QREFELT % 26))
                                   (OR
                                    (SPADCALL |kernel| '|acos| (QREFELT % 26))
                                    (SPADCALL |kernel| '|asec|
                                              (QREFELT % 26)))))
                           (PROGN (LETT #2# 'T) (GO #4=#:G451)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |kernel| '|acsc| (QREFELT % 26))
                               (PROGN
                                (LETT #3# (PROGN (LETT #2# 'T) (GO #4#)))
                                (GO #5=#:G444)))))
                            #5# (EXIT #3#))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |LIMITPS;complLimit|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OnePointCompletion| FE) "failed")))
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
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #1=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #2=((|Boolean|)
                    (|Union| #3="complex" #4="real: two sides"
                             #5="real: left side" #6="real: right side"
                             #7="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #8=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE . #9=((|Boolean|) (|Union| #3# #4# #5# #6# #7#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #10=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #11=(|Boolean|) #12=(|Union| #3# #4# #5# #6# #7#)
              #13=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #14=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #15=(|Boolean|) #16=(|Union| #3# #4# #5# #6# #7#)
              #17=(|Boolean|) FE (|Mapping| #18=(|Boolean|) FE)
              (|Mapping| #19=(|Boolean|) FE) (|Mapping| #20=(|Boolean|) FE)))))
          (|pseries|
           (|Union| (|:| |%series| |Upx|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|upxs| (|Upx|))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|) . #1#) FE . #2#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|) . #8#) FE . #9#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #10#) FE #11# #12# #13# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #14#) FE #15# #16# #17# FE
              (|Mapping| #18# FE) (|Mapping| #19# FE) (|Mapping| #20# FE)))))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|uls| (|Uls|)) (#21=#:G482 NIL) (|lim| (FE)) (|answer| (FE)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT % 7) |x|
                                                   (QREFELT % 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT % 7) |x|
                                                    (QREFELT % 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT % 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| %)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                                        (QREFELT % 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT % 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT % 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
                       (LETT |pseries|
                             (SPADCALL |fcn| NIL (CONS 0 "complex")
                                       (|compiledLookupCheck| '|exprToUPS|
                                                              (LIST
                                                               (LIST '|Union|
                                                                     (LIST '|:|
                                                                           '|%series|
                                                                           (|devaluate|
                                                                            |Upx|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#22="complex"
                                                                     '#23="real: two sides"
                                                                     '#24="real: left side"
                                                                     '#25="real: right side"
                                                                     '#26="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (PROGN
                           (LETT #21# (CONS 1 "failed"))
                           (GO #27=#:G481)))
                         (#28='T
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT % 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Upx|))
                              (PROGN
                               (LETT #21# (CONS 0 (SPADCALL (QREFELT % 92))))
                               (GO #27#)))
                             (#28#
                              (SPADCALL |upxs| (|spadConstant| % 94)
                                        (|compiledLookupCheck| '|coefficient|
                                                               (LIST
                                                                (|devaluate|
                                                                 (ELT % 7))
                                                                '%
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                               |Upx|)))))))))))
                     (#28#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT % 7)
                                                              |Uts| |Uls|)
                              |x|))
                       (LETT |lseries|
                             (SPADCALL |fcn| NIL (CONS 0 "complex")
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#22#
                                                                     '#23#
                                                                     '#24#
                                                                     '#25#
                                                                     '#26#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (PROGN (LETT #21# (CONS 1 "failed")) (GO #27#)))
                         (#28#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT % 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Uls|))
                              (PROGN
                               (LETT #21# (CONS 0 (SPADCALL (QREFELT % 92))))
                               (GO #27#)))
                             (#28#
                              (SPADCALL |uls| 0
                                        (|compiledLookupCheck| '|coefficient|
                                                               (LIST
                                                                (|devaluate|
                                                                 (ELT % 7))
                                                                '%
                                                                (LIST
                                                                 '|Integer|))
                                                               |Uls|)))))))))))))))
            (EXIT
             (COND
              ((SPADCALL |x| (SPADCALL |lim| (QREFELT % 23)) (QREFELT % 24))
               (COND
                ((SPADCALL |x|
                           (SPADCALL
                            (LETT |answer| (SPADCALL |lim| (QREFELT % 45)))
                            (QREFELT % 23))
                           (QREFELT % 24))
                 (|error| "limit: can't evaluate limit"))
                (#28# (CONS 0 (SPADCALL |answer| (QREFELT % 95))))))
              (#28# (CONS 0 (SPADCALL |lim| (QREFELT % 95))))))))
          #27# (EXIT #21#)))) 

(SDEFUN |LIMITPS;okProblem?|
        ((|function| (|String|)) (|problem| (|String|)) (% (|Boolean|)))
        (COND
         ((OR (EQUAL |function| "log") (EQUAL |function| "nth root"))
          (COND ((EQUAL |problem| "series of non-zero order") 'T)
                (#1='T (EQUAL |problem| "negative leading coefficient"))))
         ('T
          (COND ((EQUAL |function| "atan") (EQUAL |problem| "branch problem"))
                ((EQUAL |function| "erf") (EQUAL |problem| "unknown kernel"))
                (#1# (EQUAL |problem| "essential singularity")))))) 

(SDEFUN |LIMITPS;poleLimit|
        ((|order| (|Fraction| (|Integer|))) (|coef| (FE)) (|x| (|Symbol|))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed")) (|si| (|Integer|))
          (|rtLim| (|OrderedCompletion| FE)))
         (SEQ
          (COND
           ((NULL
             (SPADCALL |x| (SPADCALL |coef| (QREFELT % 23)) (QREFELT % 24)))
            (SEQ (LETT |s| (SPADCALL |coef| (QREFELT % 98)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (SEQ (LETT |si| (QCDR |s|))
                         (EXIT
                          (COND ((EQL |si| 0) (|error| "poleLimit: coef = 0"))
                                (#2='T
                                 (SEQ
                                  (LETT |rtLim|
                                        (COND
                                         ((> |si| 0) (SPADCALL (QREFELT % 70)))
                                         (#2# (SPADCALL (QREFELT % 59)))))
                                  (EXIT
                                   (COND
                                    ((EVENP (SPADCALL |order| (QREFELT % 99)))
                                     (CONS 0 |rtLim|))
                                    ((EVENP (SPADCALL |order| (QREFELT % 100)))
                                     (CONS 1
                                           (CONS (CONS 1 "failed")
                                                 (CONS 0 |rtLim|))))
                                    (#2#
                                     (CONS 1
                                           (CONS
                                            (CONS 0
                                                  (SPADCALL |rtLim|
                                                            (QREFELT % 101)))
                                            (CONS 0 |rtLim|))))))))))))
                   (#2# (CONS 2 "failed"))))))
           ('T (|error| "limit: can't evaluate limit")))))) 

(SDEFUN |LIMITPS;poleLimitPlus|
        ((|order| (|Fraction| (|Integer|))) (|coef| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
        (SPROG
         ((|s| #2=(|Union| (|Integer|) "failed")) (|si| (|Integer|))
          (|clim| #3=(|Union| (|OrderedCompletion| FE) #1#))
          (|lim| (|OrderedCompletion| FE)) (|cclim| #3#) (|ss| (|Integer|))
          (|t| (|Integer|)) (|tt| #2#) (|tti| (|Integer|)))
         (SEQ
          (COND
           ((NULL
             (SPADCALL |x| (SPADCALL |coef| (QREFELT % 23)) (QREFELT % 24)))
            (SEQ (LETT |s| (SPADCALL |coef| (QREFELT % 98)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (SEQ (LETT |si| (QCDR |s|))
                         (EXIT
                          (COND
                           ((EQL |si| 0) (|error| "poleLimitPlus: coef = 0"))
                           ((> |si| 0) (CONS 0 (SPADCALL (QREFELT % 70))))
                           (#4='T (CONS 0 (SPADCALL (QREFELT % 59))))))))
                   (#4# (CONS 1 "failed"))))))
           ('T
            (SEQ (LETT |clim| (|LIMITPS;specialLimit| |coef| |x| %))
                 (EXIT
                  (COND ((QEQCAR |clim| 1) (CONS 1 "failed"))
                        (#4#
                         (SEQ (LETT |lim| (QCDR |clim|))
                              (COND
                               ((EQL (SPADCALL |lim| (QREFELT % 32)) 0)
                                (COND
                                 ((SPADCALL (SPADCALL |lim| (QREFELT % 62))
                                            (QREFELT % 102))
                                  (EXIT
                                   (SEQ
                                    (LETT |cclim|
                                          (|LIMITPS;specialLimit|
                                           (SPADCALL |coef| (QREFELT % 29)) |x|
                                           %))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |cclim| 1) (CONS 1 "failed"))
                                      (#4#
                                       (SEQ
                                        (LETT |ss|
                                              (SPADCALL (QCDR |cclim|)
                                                        (QREFELT % 32)))
                                        (EXIT
                                         (COND
                                          ((ZEROP |ss|)
                                           (|error| "limit: internal error"))
                                          ((> |ss| 0)
                                           (CONS 0 (SPADCALL (QREFELT % 70))))
                                          (#4#
                                           (CONS 0
                                                 (SPADCALL
                                                  (QREFELT % 59))))))))))))))))
                              (LETT |t| (SPADCALL |lim| (QREFELT % 32)))
                              (EXIT
                               (COND
                                ((ZEROP |t|)
                                 (SEQ
                                  (LETT |tt| (SPADCALL |coef| (QREFELT % 98)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |tt| 0)
                                     (SEQ (LETT |tti| (QCDR |tt|))
                                          (EXIT
                                           (COND
                                            ((EQL |tti| 0)
                                             (|error|
                                              "poleLimitPlus: coef = 0"))
                                            ((> |tti| 0)
                                             (CONS 0
                                                   (SPADCALL (QREFELT % 70))))
                                            (#4#
                                             (CONS 0
                                                   (SPADCALL
                                                    (QREFELT % 59))))))))
                                    (#4# (CONS 1 "failed"))))))
                                ((> |t| 0) (CONS 0 (SPADCALL (QREFELT % 70))))
                                (#4#
                                 (CONS 0 (SPADCALL (QREFELT % 59)))))))))))))))) 

(SDEFUN |LIMITPS;realLimit|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
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
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #2=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #3=((|Boolean|)
                    (|Union| #4="complex" #5="real: two sides"
                             #6="real: left side" #7="real: right side"
                             #8="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #9=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE . #10=((|Boolean|) (|Union| #4# #5# #6# #7# #8#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #11=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #12=(|Boolean|) #13=(|Union| #4# #5# #6# #7# #8#)
              #14=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #15=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #16=(|Boolean|) #17=(|Union| #4# #5# #6# #7# #8#)
              #18=(|Boolean|) FE (|Mapping| #19=(|Boolean|) FE)
              (|Mapping| #20=(|Boolean|) FE) (|Mapping| #21=(|Boolean|) FE)))))
          (|pseries|
           (|Union| (|:| |%series| |Upx|)
                    (|:| |%problem|
                         #22=(|Record| (|:| |func| #23=(|String|))
                                       (|:| |prob| #24=(|String|))))))
          (|upxs| (|Upx|)) (|ordp| (|Fraction| (|Integer|))) (|cp| (FE))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|) . #2#) FE . #3#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|) . #9#) FE . #10#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #11#) FE #12# #13# #14# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #15#) FE #16# #17# #18# FE
              (|Mapping| #19# FE) (|Mapping| #20# FE) (|Mapping| #21# FE)))))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|trouble| #22#) (|function| #23#) (|problem| #24#)
          (|xK| (|Kernel| FE)) (|fcn0| (FE))
          (|left| #25=(|Union| (|OrderedCompletion| FE) #1#)) (|right| #25#)
          (|uls| (|Uls|)) (|ordl| (|Integer|)) (|cl| (FE)) (#26=#:G561 NIL)
          (|lim| (|Union| FE "failed")) (|answer| (FE)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT % 7) |x|
                                                   (QREFELT % 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT % 7) |x|
                                                    (QREFELT % 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT % 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| %)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                                        (QREFELT % 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT % 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT % 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
                       (LETT |pseries|
                             (SPADCALL |fcn| 'T (CONS 1 "real: two sides")
                                       (|compiledLookupCheck| '|exprToUPS|
                                                              (LIST
                                                               (LIST '|Union|
                                                                     (LIST '|:|
                                                                           '|%series|
                                                                           (|devaluate|
                                                                            |Upx|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#27="complex"
                                                                     '#28="real: two sides"
                                                                     '#29="real: left side"
                                                                     '#30="real: right side"
                                                                     '#31="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (SEQ (LETT |trouble| (CDR |pseries|))
                               (LETT |function| (QCAR |trouble|))
                               (LETT |problem| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((|LIMITPS;okProblem?| |function| |problem| %)
                                  (SEQ
                                   (LETT |left|
                                         (SEQ
                                          (LETT |xK|
                                                (SPADCALL |x| (QREFELT % 82)))
                                          (LETT |fcn0|
                                                (SPADCALL |fcn| |xK|
                                                          (SPADCALL
                                                           (SPADCALL |xK|
                                                                     (QREFELT %
                                                                              18))
                                                           (QREFELT % 69))
                                                          (QREFELT % 41)))
                                          (EXIT
                                           (|LIMITPS;limitPlus| |fcn0| |x|
                                            %))))
                                   (LETT |right|
                                         (|LIMITPS;limitPlus| |fcn| |x| %))
                                   (COND
                                    ((QEQCAR |left| 1)
                                     (COND
                                      ((QEQCAR |right| 1)
                                       (EXIT
                                        (PROGN
                                         (LETT #26# (CONS 2 "failed"))
                                         (GO #32=#:G560)))))))
                                   (COND
                                    ((QEQCAR |left| 0)
                                     (COND
                                      ((QEQCAR |right| 0)
                                       (COND
                                        ((SPADCALL (QCDR |left|) (QCDR |right|)
                                                   (QREFELT % 103))
                                         (EXIT
                                          (PROGN
                                           (LETT #26# (CONS 0 (QCDR |left|)))
                                           (GO #32#)))))))))
                                   (EXIT
                                    (PROGN
                                     (LETT #26# (CONS 1 (CONS |left| |right|)))
                                     (GO #32#)))))
                                 (#33='T
                                  (PROGN
                                   (LETT #26# (CONS 2 "failed"))
                                   (GO #32#)))))))
                         (#33#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT % 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Upx|))
                              (SEQ
                               (LETT |cp|
                                     (SPADCALL |upxs|
                                               (LETT |ordp|
                                                     (SPADCALL |upxs|
                                                               (|compiledLookupCheck|
                                                                '|order|
                                                                (LIST
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|Integer|))
                                                                 '%)
                                                                |Upx|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT % 7))
                                                      '%
                                                      (LIST '|Fraction|
                                                            (LIST '|Integer|)))
                                                |Upx|)))
                               (EXIT
                                (PROGN
                                 (LETT #26#
                                       (|LIMITPS;poleLimit| |ordp| |cp| |x| %))
                                 (GO #32#)))))
                             (#33#
                              (CONS 0
                                    (SPADCALL |upxs| (|spadConstant| % 94)
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT % 7)) '%
                                                     (LIST '|Fraction|
                                                           (LIST '|Integer|)))
                                               |Upx|))))))))))))
                     (#33#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT % 7)
                                                              |Uts| |Uls|)
                              |x|))
                       (LETT |lseries|
                             (SPADCALL |fcn| 'T (CONS 1 "real: two sides")
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#27#
                                                                     '#28#
                                                                     '#29#
                                                                     '#30#
                                                                     '#31#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (SEQ (LETT |trouble| (CDR |lseries|))
                               (LETT |function| (QCAR |trouble|))
                               (LETT |problem| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((|LIMITPS;okProblem?| |function| |problem| %)
                                  (SEQ
                                   (LETT |left|
                                         (SEQ
                                          (LETT |xK|
                                                (SPADCALL |x| (QREFELT % 82)))
                                          (LETT |fcn0|
                                                (SPADCALL |fcn| |xK|
                                                          (SPADCALL
                                                           (SPADCALL |xK|
                                                                     (QREFELT %
                                                                              18))
                                                           (QREFELT % 69))
                                                          (QREFELT % 41)))
                                          (EXIT
                                           (|LIMITPS;limitPlus| |fcn0| |x|
                                            %))))
                                   (LETT |right|
                                         (|LIMITPS;limitPlus| |fcn| |x| %))
                                   (COND
                                    ((QEQCAR |left| 1)
                                     (COND
                                      ((QEQCAR |right| 1)
                                       (EXIT
                                        (PROGN
                                         (LETT #26# (CONS 2 "failed"))
                                         (GO #32#)))))))
                                   (COND
                                    ((QEQCAR |left| 0)
                                     (COND
                                      ((QEQCAR |right| 0)
                                       (COND
                                        ((SPADCALL (QCDR |left|) (QCDR |right|)
                                                   (QREFELT % 103))
                                         (EXIT
                                          (PROGN
                                           (LETT #26# (CONS 0 (QCDR |left|)))
                                           (GO #32#)))))))))
                                   (EXIT
                                    (PROGN
                                     (LETT #26# (CONS 1 (CONS |left| |right|)))
                                     (GO #32#)))))
                                 (#33#
                                  (PROGN
                                   (LETT #26# (CONS 2 "failed"))
                                   (GO #32#)))))))
                         (#33#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT % 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Uls|))
                              (SEQ
                               (LETT |cl|
                                     (SPADCALL |uls|
                                               (LETT |ordl|
                                                     (SPADCALL |uls|
                                                               (|compiledLookupCheck|
                                                                '|order|
                                                                (LIST
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '%)
                                                                |Uls|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT % 7))
                                                      '% (LIST '|Integer|))
                                                |Uls|)))
                               (EXIT
                                (PROGN
                                 (LETT #26#
                                       (|LIMITPS;poleLimit|
                                        (SPADCALL |ordl| (QREFELT % 104)) |cl|
                                        |x| %))
                                 (GO #32#)))))
                             (#33#
                              (CONS 0
                                    (SPADCALL |uls| 0
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT % 7)) '%
                                                     (LIST '|Integer|))
                                               |Uls|))))))))))))))))
            (EXIT
             (COND ((QEQCAR |lim| 1) (CONS 2 "failed"))
                   ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT % 23))
                              (QREFELT % 24))
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL
                                 (LETT |answer|
                                       (SPADCALL (QCDR |lim|) (QREFELT % 45)))
                                 (QREFELT % 23))
                                (QREFELT % 24))
                      (|error| "limit: can't evaluate limit"))
                     (#33# (CONS 0 (SPADCALL |answer| (QREFELT % 43))))))
                   (#33# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT % 43))))))))
          #32# (EXIT #26#)))) 

(SDEFUN |LIMITPS;xxpLimit|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) "failed")))
        (SPROG
         ((|xpack|
           (CATEGORY |package|
            (SIGNATURE |exprToXXP|
             ((|Union|
               (|:| |%expansion| (|ExponentialExpansion| R FE |x| |zeroFE|))
               (|:| |%problem|
                    (|Record| (|:| |func| (|String|))
                              (|:| |prob| (|String|)))))
              FE (|Boolean|)))
            (SIGNATURE |localAbs| (FE FE))))
          (|xxp|
           (|Union|
            (|:| |%expansion| (|ExponentialExpansion| R FE |x| |zeroFE|))
            (|:| |%problem|
                 (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|)))))))
         (SEQ
          (LETT |xpack|
                (|FunctionSpaceToExponentialExpansion| (QREFELT % 6)
                                                       (QREFELT % 7) |x|
                                                       (QREFELT % 9)))
          (LETT |xxp|
                (SPADCALL |fcn| 'T
                          (|compiledLookupCheck| '|exprToXXP|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:|
                                                              '|%expansion|
                                                              (LIST
                                                               '|ExponentialExpansion|
                                                               (|devaluate|
                                                                (ELT % 6))
                                                               (|devaluate|
                                                                (ELT % 7))
                                                               |x|
                                                               (QREFELT % 9)))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT % 7))
                                                  (LIST '|Boolean|))
                                                 |xpack|)))
          (EXIT
           (COND ((QEQCAR |xxp| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (CDR |xxp|)
                            (|compiledLookupCheck| '|limitPlus|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (LIST
                                                           '|OrderedCompletion|
                                                           (|devaluate|
                                                            (ELT % 7)))
                                                          '"failed")
                                                    '%)
                                                   (|ExponentialExpansion|
                                                    (ELT % 6) (ELT % 7) |x|
                                                    (ELT % 9)))))))))) 

(SDEFUN |LIMITPS;limitPlus|
        ((|fcn| (FE)) (|x| (|Symbol|))
         (% (|Union| (|OrderedCompletion| FE) #1="failed")))
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
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| (% (|Variable| |x|)))
             (SIGNATURE |differentiate| (% % (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| (% % (|Variable| |x|)))
                 |noBranch|))))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #2=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #3=((|Boolean|)
                    (|Union| #4="complex" #5="real: two sides"
                             #6="real: left side" #7="real: right side"
                             #8="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #9=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE . #10=((|Boolean|) (|Union| #4# #5# #6# #7# #8#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #11=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #12=(|Boolean|) #13=(|Union| #4# #5# #6# #7# #8#)
              #14=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|)
                       . #15=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #16=(|Boolean|) #17=(|Union| #4# #5# #6# #7# #8#)
              #18=(|Boolean|) FE (|Mapping| #19=(|Boolean|) FE)
              (|Mapping| #20=(|Boolean|) FE) (|Mapping| #21=(|Boolean|) FE)))))
          (|pseries|
           (|Union| (|:| |%series| |Upx|)
                    (|:| |%problem|
                         #22=(|Record| (|:| |func| (|String|))
                                       (|:| |prob| #23=(|String|))))))
          (|upxs| (|Upx|)) (|ordp| (|Fraction| (|Integer|))) (|cp| (FE))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|) . #2#) FE . #3#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|) . #9#) FE . #10#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #11#) FE #12# #13# #14# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|) . #15#) FE #16# #17# #18# FE
              (|Mapping| #19# FE) (|Mapping| #20# FE) (|Mapping| #21# FE)))))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|trouble| #22#) (|pp| #23#) (|uls| (|Uls|)) (|ordl| (|Integer|))
          (|cl| (FE)) (#24=#:G601 NIL) (|lim| (|Union| FE "failed"))
          (|answer| (FE)) (|xLim| (|Union| (|OrderedCompletion| FE) #1#)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT % 7) |x|
                                                   (QREFELT % 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT % 7) |x|
                                                    (QREFELT % 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT % 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| %)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT % 7) |x|
                                                        (QREFELT % 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT % 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT % 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
                       (LETT |pseries|
                             (SPADCALL |fcn| 'T (CONS 3 "real: right side")
                                       (|compiledLookupCheck| '|exprToGenUPS|
                                                              (LIST
                                                               (LIST '|Union|
                                                                     (LIST '|:|
                                                                           '|%series|
                                                                           (|devaluate|
                                                                            |Upx|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#25="complex"
                                                                     '#26="real: two sides"
                                                                     '#27="real: left side"
                                                                     '#28="real: right side"
                                                                     '#29="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (SEQ (LETT |trouble| (CDR |pseries|))
                               (LETT |pp| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((EQUAL |pp| "negative leading coefficient")
                                  (PROGN
                                   (LETT #24# (CONS 1 "failed"))
                                   (GO #30=#:G600)))
                                 (#31='T (CONS 1 "failed"))))))
                         (#31#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT % 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Upx|))
                              (SEQ
                               (LETT |cp|
                                     (SPADCALL |upxs|
                                               (LETT |ordp|
                                                     (SPADCALL |upxs|
                                                               (|compiledLookupCheck|
                                                                '|order|
                                                                (LIST
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|Integer|))
                                                                 '%)
                                                                |Upx|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT % 7))
                                                      '%
                                                      (LIST '|Fraction|
                                                            (LIST '|Integer|)))
                                                |Upx|)))
                               (EXIT
                                (PROGN
                                 (LETT #24#
                                       (|LIMITPS;poleLimitPlus| |ordp| |cp| |x|
                                        %))
                                 (GO #30#)))))
                             (#31#
                              (CONS 0
                                    (SPADCALL |upxs| (|spadConstant| % 94)
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT % 7)) '%
                                                     (LIST '|Fraction|
                                                           (LIST '|Integer|)))
                                               |Upx|))))))))))))
                     (#31#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT % 6) (QREFELT % 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT % 7)
                                                              |Uts| |Uls|)
                              |x|))
                       (LETT |lseries|
                             (SPADCALL |fcn| 'T (CONS 3 "real: right side")
                                       (|compiledLookupCheck| '|exprToGenUPS|
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#25#
                                                                     '#26#
                                                                     '#27#
                                                                     '#28#
                                                                     '#29#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (SEQ (LETT |trouble| (CDR |lseries|))
                               (LETT |pp| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((EQUAL |pp| "negative leading coefficient")
                                  (PROGN
                                   (LETT #24# (CONS 1 "failed"))
                                   (GO #30#)))
                                 (#31# (CONS 1 "failed"))))))
                         (#31#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '%)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT % 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '%
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             %
                                                                             7)))
                                                                          '%)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '%)
                                                               |Uls|))
                              (SEQ
                               (LETT |cl|
                                     (SPADCALL |uls|
                                               (LETT |ordl|
                                                     (SPADCALL |uls|
                                                               (|compiledLookupCheck|
                                                                '|order|
                                                                (LIST
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '%)
                                                                |Uls|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT % 7))
                                                      '% (LIST '|Integer|))
                                                |Uls|)))
                               (EXIT
                                (PROGN
                                 (LETT #24#
                                       (|LIMITPS;poleLimitPlus|
                                        (SPADCALL |ordl| (QREFELT % 104)) |cl|
                                        |x| %))
                                 (GO #30#)))))
                             (#31#
                              (CONS 0
                                    (SPADCALL |uls| 0
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT % 7)) '%
                                                     (LIST '|Integer|))
                                               |Uls|))))))))))))))))
            (EXIT
             (COND
              ((QEQCAR |lim| 1)
               (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |fcn| |x| %))
                    (EXIT
                     (COND
                      ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |fcn| |x| %))
                      (#31# |xLim|)))))
              ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT % 23))
                         (QREFELT % 24))
               (COND
                ((SPADCALL |x|
                           (SPADCALL
                            (LETT |answer|
                                  (SPADCALL (QCDR |lim|) (QREFELT % 45)))
                            (QREFELT % 23))
                           (QREFELT % 24))
                 (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |answer| |x| %))
                      (EXIT
                       (COND
                        ((QEQCAR |xLim| 1)
                         (|LIMITPS;specialLimit| |answer| |x| %))
                        (#31# |xLim|)))))
                (#31# (CONS 0 (SPADCALL |answer| (QREFELT % 43))))))
              (#31# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT % 43))))))))
          #30# (EXIT #24#)))) 

(SDEFUN |LIMITPS;limit1|
        ((|fcn| (FE)) (|eq| (|Equation| (|OrderedCompletion| FE)))
         (|do_lim|
          (|Mapping|
           #1=(|Union| (|OrderedCompletion| FE)
                       (|Record|
                        (|:| |leftHandLimit|
                             (|Union| (|OrderedCompletion| FE) #2="failed"))
                        (|:| |rightHandLimit|
                             (|Union| (|OrderedCompletion| FE) #2#)))
                       #3="failed")
           FE (|Symbol|) (|OrderedCompletion| FE)))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #2#))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #2#)))
                   #3#)))
        (SPROG
         ((|f| #4=(|Union| FE "failed")) (|xx| (|Union| (|Symbol|) "failed"))
          (|x| (|Symbol|)) (|a| (|OrderedCompletion| FE)) (|ae| #4#)
          (|knx| (|Kernel| FE)) (|a1| (FE)) (|res1| #1#)
          (|res2| (|Union| (|OrderedCompletion| FE) #2#)) (#5=#:G621 NIL))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT % 106)) (QREFELT % 40)))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#6='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT % 80)))
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit:left hand side must be a variable"))
                    (#6#
                     (SEQ
                      (EXIT
                       (SEQ (LETT |x| (QCDR |xx|))
                            (LETT |a| (SPADCALL |eq| (QREFELT % 107)))
                            (SEQ (LETT |ae| (SPADCALL |a| (QREFELT % 40)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ae| 0)
                                    (COND
                                     ((SPADCALL |x|
                                                (SPADCALL (QCDR |ae|)
                                                          (QREFELT % 23))
                                                (QREFELT % 24))
                                      (PROGN
                                       (LETT #5#
                                             (SEQ
                                              (LETT |knx|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT % 49))
                                                     (QREFELT % 82)))
                                              (LETT |a1|
                                                    (SPADCALL (QCDR |ae|)
                                                              (LIST
                                                               (SPADCALL |x|
                                                                         (QREFELT
                                                                          %
                                                                          82)))
                                                              (LIST
                                                               (SPADCALL |knx|
                                                                         (QREFELT
                                                                          %
                                                                          18)))
                                                              (QREFELT % 77)))
                                              (LETT |res1|
                                                    (SPADCALL |fcn| |x|
                                                              (SPADCALL |a1|
                                                                        (QREFELT
                                                                         % 43))
                                                              |do_lim|))
                                              (EXIT
                                               (COND ((QEQCAR |res1| 2) |res1|)
                                                     ((QEQCAR |res1| 1)
                                                      (|error| "impossible"))
                                                     (#6#
                                                      (SEQ
                                                       (LETT |res2|
                                                             (|LIMITPS;subst_in_result|
                                                              (CONS 0
                                                                    (QCDR
                                                                     |res1|))
                                                              |knx| (QCDR |f|)
                                                              %))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |res2| 1)
                                                          (|error|
                                                           "impossible"))
                                                         (#6#
                                                          (CONS 0
                                                                (QCDR
                                                                 |res2|)))))))))))
                                       (GO #7=#:G617))))))))
                            (EXIT (SPADCALL |fcn| |x| |a| |do_lim|))))
                      #7# (EXIT #5#)))))))))))) 

(SDEFUN |LIMITPS;limit;FEEU;35|
        ((|fcn| (FE)) (|eq| (|Equation| (|OrderedCompletion| FE)))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
        (|LIMITPS;limit1| |fcn| |eq| (CONS #'|LIMITPS;limit;FEEU;35!0| %) %)) 

(SDEFUN |LIMITPS;limit;FEEU;35!0| ((|f| NIL) (|x| NIL) (|a| NIL) (% NIL))
        (COND
         ((|LIMITPS;is_exp_log| |f| |x| %)
          (SPADCALL |f| |x| |a| (QREFELT % 111)))
         ('T (|LIMITPS;locallimit| |f| |x| |a| %)))) 

(SDEFUN |LIMITPS;limit;FEEU;36|
        ((|fcn| (FE)) (|eq| (|Equation| (|OrderedCompletion| FE)))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
        (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) %)
         %)) 

(SDEFUN |LIMITPS;limit;FEEU;37|
        ((|fcn| (FE)) (|eq| (|Equation| (|OrderedCompletion| FE)))
         (%
          (|Union| (|OrderedCompletion| FE)
                   (|Record|
                    (|:| |leftHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1="failed"))
                    (|:| |rightHandLimit|
                         (|Union| (|OrderedCompletion| FE) #1#)))
                   "failed")))
        (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) %)
         %)) 

(SDEFUN |LIMITPS;complexLimit;FEEU;38|
        ((|fcn| (FE)) (|eq| (|Equation| (|OnePointCompletion| FE)))
         (% (|Union| (|OnePointCompletion| FE) "failed")))
        (SPROG
         ((|f| #1=(|Union| FE "failed")) (|xx| (|Union| (|Symbol|) "failed"))
          (|x| (|Symbol|)) (|a| (|OnePointCompletion| FE)) (|ae| #1#)
          (|knx| (|Kernel| FE)) (|a1| (FE))
          (|res1| (|Union| (|OnePointCompletion| FE) "failed")) (|res2| #1#)
          (#2=#:G663 NIL))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT % 116)) (QREFELT % 75)))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT % 80)))
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit:left hand side must be a variable"))
                    (#3#
                     (SEQ
                      (EXIT
                       (SEQ (LETT |x| (QCDR |xx|))
                            (LETT |a| (SPADCALL |eq| (QREFELT % 117)))
                            (SEQ (LETT |ae| (SPADCALL |a| (QREFELT % 75)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ae| 0)
                                    (COND
                                     ((SPADCALL |x|
                                                (SPADCALL (QCDR |ae|)
                                                          (QREFELT % 23))
                                                (QREFELT % 24))
                                      (PROGN
                                       (LETT #2#
                                             (SEQ
                                              (LETT |knx|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT % 49))
                                                     (QREFELT % 82)))
                                              (LETT |a1|
                                                    (SPADCALL (QCDR |ae|)
                                                              (LIST
                                                               (SPADCALL |x|
                                                                         (QREFELT
                                                                          %
                                                                          82)))
                                                              (LIST
                                                               (SPADCALL |knx|
                                                                         (QREFELT
                                                                          %
                                                                          18)))
                                                              (QREFELT % 77)))
                                              (LETT |res1|
                                                    (|LIMITPS;locallimitcomplex|
                                                     |fcn| |x|
                                                     (SPADCALL |a1|
                                                               (QREFELT % 95))
                                                     %))
                                              (EXIT
                                               (COND ((QEQCAR |res1| 1) |res1|)
                                                     (#3#
                                                      (SEQ
                                                       (LETT |res2|
                                                             (SPADCALL
                                                              (QCDR |res1|)
                                                              (QREFELT % 75)))
                                                       (EXIT
                                                        (COND
                                                         ((OR (QEQCAR |res2| 1)
                                                              (NULL
                                                               (QEQCAR |res2|
                                                                       0)))
                                                          |res1|)
                                                         ('T
                                                          (CONS 0
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCDR |res2|)
                                                                  (LIST |knx|)
                                                                  (LIST
                                                                   (QCDR |f|))
                                                                  (QREFELT %
                                                                           77))
                                                                 (QREFELT %
                                                                          95))))))))))))
                                       (GO #4=#:G656))))))))
                            (EXIT
                             (|LIMITPS;locallimitcomplex| |fcn| |x| |a| %))))
                      #4# (EXIT #2#)))))))))))) 

(DECLAIM (NOTINLINE |PowerSeriesLimitPackage;|)) 

(DEFUN |PowerSeriesLimitPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PowerSeriesLimitPackage| DV$1 DV$2))
          (LETT % (GETREFV 120))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PowerSeriesLimitPackage|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|spadConstant| % 8))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (COND
             ((|domainEqual| |#2| (|Expression| (|Integer|)))
              (QSETREFV % 91
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;23|)
                              %)))
             ('T
              (QSETREFV % 91
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;24|)
                              %)))))
           ('T
            (QSETREFV % 91
                      (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;25|) %))))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (COND
             ((|domainEqual| |#2| (|Expression| (|Integer|)))
              (QSETREFV % 114
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;35|) %)))
             ('T
              (QSETREFV % 114
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;36|)
                              %)))))
           ('T
            (QSETREFV % 114
                      (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;37|) %))))
          %))) 

(DEFUN |PowerSeriesLimitPackage| (&REST #1=#:G664)
  (SPROG NIL
         (PROG (#2=#:G665)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PowerSeriesLimitPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PowerSeriesLimitPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PowerSeriesLimitPackage|)))))))))) 

(MAKEPROP '|PowerSeriesLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |0|)
              '|zeroFE| (|List| 17) (4 . |tower|) (|BasicOperator|)
              (|Kernel| 7) (9 . |operator|) (|Symbol|) (14 . |name|)
              (|Kernel| %) (19 . |coerce|) (24 . |differentiate|) (|Boolean|)
              (30 . =) (|List| 15) (36 . |variables|) (41 . |member?|)
              (47 . |kernels|) (52 . |is?|) (58 . |name|) (63 . -) (69 . |inv|)
              (|SingleInteger|) (|OrderedCompletion| 7) (74 . |whatInfinity|)
              (79 . |0|) (83 . |1|) (87 . |numerator|) (92 . |denominator|)
              (|Integer|) (97 . ~=) (|Union| 7 '"failed")
              (103 . |retractIfCan|) (108 . |eval|) (115 . /) (121 . |coerce|)
              (|ElementaryFunctionStructurePackage| 6 7) (126 . |normalize|)
              (131 . ~=) (|NonNegativeInteger|) (137 . ~=) (143 . |new|)
              (147 . |coerce|) (|Equation| 7) (152 . |equation|) (|Equation| %)
              (158 . |eval|) (|List| 7) (164 . |argument|) (169 . |1|)
              (173 . -) (178 . |minusInfinity|) (182 . |log|) (187 . |elt|)
              (193 . |retract|) (|LiouvillianFunction| 6 7) (198 . |erf|)
              (203 . |pi|) (207 . |coerce|)
              (|SparseMultivariatePolynomial| 6 13) (212 . |1|) (216 . -)
              (221 . |plusInfinity|) (225 . |retract|) (230 . *) (236 . +)
              (|OnePointCompletion| 7) (242 . |retractIfCan|) (|List| %)
              (247 . |subst|) (254 . |lhs|) (|Union| 15 '"failed")
              (259 . |retractIfCan|) (264 . |rhs|) (269 . |kernel|) (|String|)
              (|ToolsForSign| 6) (274 . |direction|) (|Union| 110 '"failed")
              (|Expression| 37) (|MrvLimitPackage|) (279 . |mrv_limit|)
              (|Union| 31 '#1="failed") (287 . |limit|) (294 . |infinity|)
              (|Fraction| 37) (298 . |0|) (302 . |coerce|)
              (|Union| 37 '"failed") (|ElementaryFunctionSign| 6 7)
              (307 . |sign|) (312 . |numer|) (317 . |denom|) (322 . -)
              (327 . |zero?|) (332 . =) (338 . |coerce|) (|Equation| 31)
              (343 . |lhs|) (348 . |rhs|)
              (|Record| (|:| |leftHandLimit| 86) (|:| |rightHandLimit| 86))
              (|Union| 110 108 '"failed") (|OrderedCompletion| 87)
              (353 . |mrv_limit|)
              (|Record| (|:| |leftHandLimit| 90) (|:| |rightHandLimit| 90))
              (|Union| 31 112 '#2="failed") (360 . |limit|) (|Equation| 74)
              (366 . |lhs|) (371 . |rhs|) (|Union| 74 '#3="failed")
              |LIMITPS;complexLimit;FEEU;38|)
           '#(|limit| 376 |complexLimit| 389) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|limit|
                                 ((|Union| (|OrderedCompletion| |#2|)
                                           (|Record|
                                            (|:| |leftHandLimit|
                                                 (|Union|
                                                  (|OrderedCompletion| |#2|)
                                                  #1#))
                                            (|:| |rightHandLimit|
                                                 (|Union|
                                                  (|OrderedCompletion| |#2|)
                                                  #1#)))
                                           #2#)
                                  |#2|
                                  (|Equation| (|OrderedCompletion| |#2|))))
                                T)
                              '((|complexLimit|
                                 ((|Union| (|OnePointCompletion| |#2|) #3#)
                                  |#2|
                                  (|Equation| (|OnePointCompletion| |#2|))))
                                T)
                              '((|limit|
                                 ((|Union| (|OrderedCompletion| |#2|) #1#) |#2|
                                  (|Equation| |#2|) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 119
                                            '(0 7 0 8 1 7 10 0 11 1 13 12 0 14
                                              1 12 15 0 16 1 7 0 17 18 2 7 0 0
                                              15 19 2 7 20 0 0 21 1 7 22 0 23 2
                                              22 20 15 0 24 1 7 10 0 25 2 13 20
                                              0 15 26 1 13 15 0 27 2 7 0 0 0 28
                                              1 7 0 0 29 1 31 30 0 32 0 6 0 33
                                              0 6 0 34 1 7 0 0 35 1 7 0 0 36 2
                                              37 20 0 0 38 1 31 39 0 40 3 7 0 0
                                              17 0 41 2 7 0 0 0 42 1 31 0 7 43
                                              1 44 7 7 45 2 7 20 0 0 46 2 47 20
                                              0 0 48 0 15 0 49 1 7 0 15 50 2 51
                                              0 7 7 52 2 7 0 0 53 54 1 13 55 0
                                              56 0 7 0 57 1 6 0 0 58 0 31 0 59
                                              1 7 0 0 60 2 7 0 12 0 61 1 31 7 0
                                              62 1 63 7 7 64 0 7 0 65 1 7 0 37
                                              66 0 67 0 68 1 7 0 0 69 0 31 0 70
                                              1 7 17 0 71 2 7 0 37 0 72 2 7 0 0
                                              0 73 1 74 39 0 75 3 7 0 0 10 76
                                              77 1 51 7 0 78 1 7 79 0 80 1 51 7
                                              0 81 1 13 0 15 82 1 84 37 83 85 4
                                              88 86 87 15 87 83 89 3 0 90 7 51
                                              83 91 0 74 0 92 0 93 0 94 1 74 0
                                              7 95 1 97 96 7 98 1 93 37 0 99 1
                                              93 37 0 100 1 31 0 0 101 1 7 20 0
                                              102 2 31 20 0 0 103 1 93 0 37 104
                                              1 105 31 0 106 1 105 31 0 107 3
                                              88 109 87 15 110 111 2 0 113 7
                                              105 114 1 115 74 0 116 1 115 74 0
                                              117 3 0 90 7 51 83 91 2 0 113 7
                                              105 114 2 0 118 7 115 119)))))
           '|lookupComplete|)) 
