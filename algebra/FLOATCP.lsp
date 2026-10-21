
(SDEFUN |FLOATCP;complexRoots;FParL;1|
        ((|q| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))
         (|eps| (|Par|)) (% (|List| (|Complex| |Par|))))
        (SPROG ((|p| (|Polynomial| (|Complex| (|Integer|)))))
               (SEQ (LETT |p| (SPADCALL |q| (QREFELT % 9)))
                    (EXIT
                     (SPADCALL (SPADCALL |p| (QREFELT % 11)) |eps|
                               (QREFELT % 14)))))) 

(SDEFUN |FLOATCP;complexRoots;LLParL;2|
        ((|lp| (|List| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
         (|lv| (|List| (|Symbol|))) (|eps| (|Par|))
         (% (|List| (|List| (|Complex| |Par|)))))
        (SPROG
         ((#1=#:G10 NIL) (#2=#:G11 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#3=#:G12 NIL) (|p| NIL) (#4=#:G13 NIL)
          (|dp| #5=(|Polynomial| (|Complex| (|Integer|))))
          (|lden| (|List| #5#)))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |p| (QREFELT % 9)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lden|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |p| NIL) (LETT #4# |lp|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 16)))
                                    (|spadConstant| % 17) (QREFELT % 19))
                          (LETT #3# (CONS |dp| #3#))))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 24)))))) 

(SDEFUN |FLOATCP;complexSolve;LParL;3|
        ((|lp| (|List| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
         (|eps| (|Par|))
         (% (|List| (|List| (|Equation| (|Polynomial| (|Complex| |Par|)))))))
        (SPROG
         ((#1=#:G31 NIL) (#2=#:G32 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#3=#:G33 NIL) (|p| NIL) (#4=#:G34 NIL)
          (|dp| #5=(|Polynomial| (|Complex| (|Integer|))))
          (|lden| (|List| #5#)) (|np| NIL) (#6=#:G35 NIL)
          (#7=#:G20 #8=(|List| (|Symbol|))) (#9=#:G18 #8#) (#10=#:G19 NIL)
          (#11=#:G36 NIL) (#12=#:G23 #8#) (#13=#:G21 #8#) (#14=#:G22 NIL)
          (|lv| #8#) (#15=#:G37 NIL) (|nres| NIL) (#16=#:G38 NIL)
          (#17=#:G39 NIL) (|r| NIL) (#18=#:G41 NIL) (|x| NIL) (#19=#:G40 NIL))
         (SEQ
          (LETT |lnum|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |p| (QREFELT % 9)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lden|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |p| NIL) (LETT #4# |lp|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 16)))
                                    (|spadConstant| % 17) (QREFELT % 19))
                          (LETT #3# (CONS |dp| #3#))))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |lv|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |np| NIL) (LETT #6# |lnum|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |np| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #7# (SPADCALL |np| (QREFELT % 27)))
                         (COND
                          (#10# (LETT #9# (SPADCALL #9# #7# (QREFELT % 28))))
                          ('T (PROGN (LETT #9# #7#) (LETT #10# 'T)))))))
                      (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                 (COND (#10# #9#) (#20='T (|IdentityError| '|setUnion|)))))
          (COND
           ((SPADCALL |lden| NIL (QREFELT % 29))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #14# NIL)
                             (SEQ (LETT #11# |lden|) G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN (LETT |dp| (CAR #11#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #12# (SPADCALL |dp| (QREFELT % 27)))
                                     (COND
                                      (#14#
                                       (LETT #13#
                                             (SPADCALL #13# #12#
                                                       (QREFELT % 28))))
                                      ('T
                                       (PROGN
                                        (LETT #13# #12#)
                                        (LETT #14# 'T)))))))
                                  (LETT #11# (CDR #11#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#14# #13#)
                                   (#20# (|IdentityError| '|setUnion|))))
                            (QREFELT % 28)))))
          (EXIT
           (PROGN
            (LETT #15# NIL)
            (SEQ (LETT |nres| NIL)
                 (LETT #16# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 24)))
                 G190
                 (COND
                  ((OR (ATOM #16#) (PROGN (LETT |nres| (CAR #16#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #15#
                         (CONS
                          (PROGN
                           (LETT #17# NIL)
                           (SEQ (LETT |r| NIL) (LETT #18# |nres|)
                                (LETT |x| NIL) (LETT #19# |lv|) G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN (LETT |x| (CAR #19#)) NIL)
                                      (ATOM #18#)
                                      (PROGN (LETT |r| (CAR #18#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #17#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT % 32))
                                          (SPADCALL |r| (QREFELT % 34))
                                          (QREFELT % 36))
                                         #17#))))
                                (LETT #19#
                                      (PROG1 (CDR #19#)
                                        (LETT #18# (CDR #18#))))
                                (GO G190) G191 (EXIT (NREVERSE #17#))))
                          #15#))))
                 (LETT #16# (CDR #16#)) (GO G190) G191
                 (EXIT (NREVERSE #15#)))))))) 

(SDEFUN |FLOATCP;complexSolve;LParL;4|
        ((|le|
          (|List|
           (|Equation| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))))
         (|eps| (|Par|))
         (% (|List| (|List| (|Equation| (|Polynomial| (|Complex| |Par|)))))))
        (SPROG
         ((#1=#:G61 NIL) (|ep| NIL) (#2=#:G62 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
          (#3=#:G63 NIL) (#4=#:G64 NIL)
          (|lnum| (|List| (|Polynomial| (|Complex| (|Integer|)))))
          (#5=#:G65 NIL) (|p| NIL) (#6=#:G66 NIL)
          (|dp| #7=(|Polynomial| (|Complex| (|Integer|))))
          (|lden| (|List| #7#)) (|np| NIL) (#8=#:G67 NIL)
          (#9=#:G50 #10=(|List| (|Symbol|))) (#11=#:G48 #10#) (#12=#:G49 NIL)
          (#13=#:G68 NIL) (#14=#:G53 #10#) (#15=#:G51 #10#) (#16=#:G52 NIL)
          (|lv| #10#) (#17=#:G69 NIL) (|nres| NIL) (#18=#:G70 NIL)
          (#19=#:G71 NIL) (|r| NIL) (#20=#:G73 NIL) (|x| NIL) (#21=#:G72 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |ep| NIL) (LETT #2# |le|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |ep| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |ep| (QREFELT % 40))
                                         (SPADCALL |ep| (QREFELT % 41))
                                         (QREFELT % 42))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lnum|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |p| NIL) (LETT #4# |lp|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3# (CONS (SPADCALL |p| (QREFELT % 9)) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |lden|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |p| NIL) (LETT #6# |lp|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 16)))
                                    (|spadConstant| % 17) (QREFELT % 19))
                          (LETT #5# (CONS |dp| #5#))))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |lv|
                (PROGN
                 (LETT #12# NIL)
                 (SEQ (LETT |np| NIL) (LETT #8# |lnum|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |np| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #9# (SPADCALL |np| (QREFELT % 27)))
                         (COND
                          (#12# (LETT #11# (SPADCALL #11# #9# (QREFELT % 28))))
                          ('T (PROGN (LETT #11# #9#) (LETT #12# 'T)))))))
                      (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                 (COND (#12# #11#) (#22='T (|IdentityError| '|setUnion|)))))
          (COND
           ((SPADCALL |lden| NIL (QREFELT % 29))
            (LETT |lv|
                  (SPADCALL |lv|
                            (PROGN
                             (LETT #16# NIL)
                             (SEQ (LETT #13# |lden|) G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN (LETT |dp| (CAR #13#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #14# (SPADCALL |dp| (QREFELT % 27)))
                                     (COND
                                      (#16#
                                       (LETT #15#
                                             (SPADCALL #15# #14#
                                                       (QREFELT % 28))))
                                      ('T
                                       (PROGN
                                        (LETT #15# #14#)
                                        (LETT #16# 'T)))))))
                                  (LETT #13# (CDR #13#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#16# #15#)
                                   (#22# (|IdentityError| '|setUnion|))))
                            (QREFELT % 28)))))
          (EXIT
           (PROGN
            (LETT #17# NIL)
            (SEQ (LETT |nres| NIL)
                 (LETT #18# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 24)))
                 G190
                 (COND
                  ((OR (ATOM #18#) (PROGN (LETT |nres| (CAR #18#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #17#
                         (CONS
                          (PROGN
                           (LETT #19# NIL)
                           (SEQ (LETT |r| NIL) (LETT #20# |nres|)
                                (LETT |x| NIL) (LETT #21# |lv|) G190
                                (COND
                                 ((OR (ATOM #21#)
                                      (PROGN (LETT |x| (CAR #21#)) NIL)
                                      (ATOM #20#)
                                      (PROGN (LETT |r| (CAR #20#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #19#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT % 32))
                                          (SPADCALL |r| (QREFELT % 34))
                                          (QREFELT % 36))
                                         #19#))))
                                (LETT #21#
                                      (PROG1 (CDR #21#)
                                        (LETT #20# (CDR #20#))))
                                (GO G190) G191 (EXIT (NREVERSE #19#))))
                          #17#))))
                 (LETT #18# (CDR #18#)) (GO G190) G191
                 (EXIT (NREVERSE #17#)))))))) 

(SDEFUN |FLOATCP;complexSolve;FParL;5|
        ((|p| (|Fraction| (|Polynomial| (|Complex| (|Integer|)))))
         (|eps| (|Par|))
         (% (|List| (|Equation| (|Polynomial| (|Complex| |Par|))))))
        (SPROG
         ((|mvar| (|Union| (|Symbol|) "failed"))
          (|x| (|Polynomial| (|Complex| |Par|))) (#1=#:G85 NIL) (|val| NIL)
          (#2=#:G86 NIL))
         (SEQ
          (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT % 9)) (QREFELT % 46)))
          (EXIT
           (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
                 ('T
                  (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT % 32)))
                       (EXIT
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |val| NIL)
                              (LETT #2# (SPADCALL |p| |eps| (QREFELT % 15)))
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |val| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (SPADCALL |x|
                                                 (SPADCALL |val|
                                                           (QREFELT % 34))
                                                 (QREFELT % 36))
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |FLOATCP;complexSolve;EParL;6|
        ((|eq|
          (|Equation| (|Fraction| (|Polynomial| (|Complex| (|Integer|))))))
         (|eps| (|Par|))
         (% (|List| (|Equation| (|Polynomial| (|Complex| |Par|))))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 40))
                   (SPADCALL |eq| (QREFELT % 41)) (QREFELT % 42))
         |eps| (QREFELT % 48))) 

(DECLAIM (NOTINLINE |FloatingComplexPackage;|)) 

(DEFUN |FloatingComplexPackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FloatingComplexPackage| DV$1))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatingComplexPackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatingComplexPackage| (#1=#:G88)
  (SPROG NIL
         (PROG (#2=#:G89)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FloatingComplexPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FloatingComplexPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FloatingComplexPackage|)))))))))) 

(MAKEPROP '|FloatingComplexPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Polynomial| (|Complex| (|Integer|))) (|Fraction| 7)
              (0 . |numer|)
              (|SparseUnivariatePolynomial| (|Complex| (|Integer|)))
              (5 . |univariate|) (|List| 33) (|ComplexRootPackage| 10 6)
              (10 . |complexZeros|) |FLOATCP;complexRoots;FParL;1|
              (16 . |denom|) (21 . |1|) (|Boolean|) (25 . ~=) (|List| 12)
              (|List| 7) (|List| 30)
              (|InnerNumericFloatSolvePackage| (|Complex| (|Integer|)) 33 6)
              (31 . |innerSolve|) (|List| 8) |FLOATCP;complexRoots;LLParL;2|
              (39 . |variables|) (44 . |setUnion|) (50 . ~=) (|Symbol|)
              (|Polynomial| 33) (56 . |coerce|) (|Complex| 6) (61 . |coerce|)
              (|Equation| 31) (66 . |equation|) (|List| 47)
              |FLOATCP;complexSolve;LParL;3| (|Equation| 8) (72 . |lhs|)
              (77 . |rhs|) (82 . -) (|List| 39) |FLOATCP;complexSolve;LParL;4|
              (|Union| 30 '"failed") (88 . |mainVariable|) (|List| 35)
              |FLOATCP;complexSolve;FParL;5| |FLOATCP;complexSolve;EParL;6|)
           '#(|complexSolve| 93 |complexRoots| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complexSolve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Polynomial| (|Complex| |#1|)))))
                                  (|List|
                                   (|Fraction|
                                    (|Polynomial| (|Complex| (|Integer|)))))
                                  |#1|))
                                T)
                              '((|complexSolve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Polynomial| (|Complex| |#1|)))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction|
                                     (|Polynomial| (|Complex| (|Integer|))))))
                                  |#1|))
                                T)
                              '((|complexSolve|
                                 ((|List|
                                   (|Equation|
                                    (|Polynomial| (|Complex| |#1|))))
                                  (|Fraction|
                                   (|Polynomial| (|Complex| (|Integer|))))
                                  |#1|))
                                T)
                              '((|complexSolve|
                                 ((|List|
                                   (|Equation|
                                    (|Polynomial| (|Complex| |#1|))))
                                  (|Equation|
                                   (|Fraction|
                                    (|Polynomial| (|Complex| (|Integer|)))))
                                  |#1|))
                                T)
                              '((|complexRoots|
                                 ((|List| (|Complex| |#1|))
                                  (|Fraction|
                                   (|Polynomial| (|Complex| (|Integer|))))
                                  |#1|))
                                T)
                              '((|complexRoots|
                                 ((|List| (|List| (|Complex| |#1|)))
                                  (|List|
                                   (|Fraction|
                                    (|Polynomial| (|Complex| (|Integer|)))))
                                  (|List| (|Symbol|)) |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 49
                                            '(1 8 7 0 9 1 7 10 0 11 2 13 12 10
                                              6 14 1 8 7 0 16 0 7 0 17 2 7 18 0
                                              0 19 4 23 20 21 21 22 6 24 1 7 22
                                              0 27 2 22 0 0 0 28 2 21 18 0 0 29
                                              1 31 0 30 32 1 31 0 33 34 2 35 0
                                              31 31 36 1 39 8 0 40 1 39 8 0 41
                                              2 8 0 0 0 42 1 7 45 0 46 2 0 47
                                              39 6 49 2 0 37 43 6 44 2 0 47 8 6
                                              48 2 0 37 25 6 38 2 0 12 8 6 15 3
                                              0 20 25 22 6 26)))))
           '|lookupComplete|)) 
