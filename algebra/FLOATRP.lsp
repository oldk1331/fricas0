
(SDEFUN |FLOATRP;makeEq|
        ((|nres| (|List| |Par|)) (|lv| (|List| (|Symbol|)))
         (% (|List| (|Equation| (|Polynomial| |Par|)))))
        (SPROG ((#1=#:G5 NIL) (|r| NIL) (#2=#:G7 NIL) (|x| NIL) (#3=#:G6 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |r| NIL) (LETT #2# |nres|) (LETT |x| NIL)
                      (LETT #3# |lv|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)
                            (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |x| (QREFELT % 9))
                                         (SPADCALL |r| (QREFELT % 10))
                                         (QREFELT % 12))
                               #1#))))
                      (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#))))
                      (GO G190) G191 (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FLOATRP;realRoots;FParL;2|
        ((|p| (|Fraction| (|Polynomial| (|Integer|)))) (|eps| (|Par|))
         (% (|List| |Par|)))
        (SPADCALL (SPADCALL |p| (QREFELT % 15)) |eps| (QREFELT % 18))) 

(SDEFUN |FLOATRP;realRoots;LLParL;3|
        ((|lp| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|lv| (|List| (|Symbol|))) (|eps| (|Par|))
         (% (|List| (|List| |Par|))))
        (SPROG
         ((#1=#:G15 NIL) (#2=#:G16 NIL)
          (|lnum| (|List| (|Polynomial| (|Integer|)))) (#3=#:G17 NIL) (|p| NIL)
          (#4=#:G18 NIL) (|dp| #5=(|Polynomial| (|Integer|)))
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
                        (LETT #1# (CONS (SPADCALL |p| (QREFELT % 15)) #1#))))
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
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 20)))
                                    (|spadConstant| % 21) (QREFELT % 23))
                          (LETT #3# (CONS |dp| #3#))))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 27)))))) 

(SDEFUN |FLOATRP;solve;LParL;4|
        ((|lp| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|eps| (|Par|))
         (% (|List| (|List| (|Equation| (|Polynomial| |Par|))))))
        (SPROG
         ((#1=#:G34 NIL) (#2=#:G35 NIL)
          (|lnum| (|List| (|Polynomial| (|Integer|)))) (#3=#:G36 NIL) (|p| NIL)
          (#4=#:G37 NIL) (|dp| #5=(|Polynomial| (|Integer|)))
          (|lden| (|List| #5#)) (|np| NIL) (#6=#:G38 NIL)
          (#7=#:G25 #8=(|List| (|Symbol|))) (#9=#:G23 #8#) (#10=#:G24 NIL)
          (#11=#:G39 NIL) (#12=#:G28 #8#) (#13=#:G26 #8#) (#14=#:G27 NIL)
          (|lv| #8#) (#15=#:G40 NIL) (|numres| NIL) (#16=#:G41 NIL))
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
                        (LETT #1# (CONS (SPADCALL |p| (QREFELT % 15)) #1#))))
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
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 20)))
                                    (|spadConstant| % 21) (QREFELT % 23))
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
                         (LETT #7# (SPADCALL |np| (QREFELT % 30)))
                         (COND
                          (#10# (LETT #9# (SPADCALL #9# #7# (QREFELT % 31))))
                          ('T (PROGN (LETT #9# #7#) (LETT #10# 'T)))))))
                      (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                 (COND (#10# #9#) (#17='T (|IdentityError| '|setUnion|)))))
          (COND
           ((SPADCALL |lden| NIL (QREFELT % 32))
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
                                     (LETT #12# (SPADCALL |dp| (QREFELT % 30)))
                                     (COND
                                      (#14#
                                       (LETT #13#
                                             (SPADCALL #13# #12#
                                                       (QREFELT % 31))))
                                      ('T
                                       (PROGN
                                        (LETT #13# #12#)
                                        (LETT #14# 'T)))))))
                                  (LETT #11# (CDR #11#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#14# #13#)
                                   (#17# (|IdentityError| '|setUnion|))))
                            (QREFELT % 31)))))
          (EXIT
           (PROGN
            (LETT #15# NIL)
            (SEQ (LETT |numres| NIL)
                 (LETT #16# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 27)))
                 G190
                 (COND
                  ((OR (ATOM #16#) (PROGN (LETT |numres| (CAR #16#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #15# (CONS (|FLOATRP;makeEq| |numres| |lv| %) #15#))))
                 (LETT #16# (CDR #16#)) (GO G190) G191
                 (EXIT (NREVERSE #15#)))))))) 

(SDEFUN |FLOATRP;solve;LParL;5|
        ((|le| (|List| (|Equation| (|Fraction| (|Polynomial| (|Integer|))))))
         (|eps| (|Par|))
         (% (|List| (|List| (|Equation| (|Polynomial| |Par|))))))
        (SPROG
         ((#1=#:G59 NIL) (|ep| NIL) (#2=#:G60 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
          (#3=#:G61 NIL) (#4=#:G62 NIL)
          (|lnum| (|List| (|Polynomial| (|Integer|)))) (#5=#:G63 NIL) (|p| NIL)
          (#6=#:G64 NIL) (|dp| #7=(|Polynomial| (|Integer|)))
          (|lden| (|List| #7#)) (|np| NIL) (#8=#:G65 NIL)
          (#9=#:G50 #10=(|List| (|Symbol|))) (#11=#:G48 #10#) (#12=#:G49 NIL)
          (#13=#:G66 NIL) (#14=#:G53 #10#) (#15=#:G51 #10#) (#16=#:G52 NIL)
          (|lv| #10#) (#17=#:G67 NIL) (|numres| NIL) (#18=#:G68 NIL))
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
                               (SPADCALL (SPADCALL |ep| (QREFELT % 36))
                                         (SPADCALL |ep| (QREFELT % 37))
                                         (QREFELT % 38))
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
                        (LETT #3# (CONS (SPADCALL |p| (QREFELT % 15)) #3#))))
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
                         ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT % 20)))
                                    (|spadConstant| % 21) (QREFELT % 23))
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
                         (LETT #9# (SPADCALL |np| (QREFELT % 30)))
                         (COND
                          (#12# (LETT #11# (SPADCALL #11# #9# (QREFELT % 31))))
                          ('T (PROGN (LETT #11# #9#) (LETT #12# 'T)))))))
                      (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                 (COND (#12# #11#) (#19='T (|IdentityError| '|setUnion|)))))
          (COND
           ((SPADCALL |lden| NIL (QREFELT % 32))
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
                                     (LETT #14# (SPADCALL |dp| (QREFELT % 30)))
                                     (COND
                                      (#16#
                                       (LETT #15#
                                             (SPADCALL #15# #14#
                                                       (QREFELT % 31))))
                                      ('T
                                       (PROGN
                                        (LETT #15# #14#)
                                        (LETT #16# 'T)))))))
                                  (LETT #13# (CDR #13#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#16# #15#)
                                   (#19# (|IdentityError| '|setUnion|))))
                            (QREFELT % 31)))))
          (EXIT
           (PROGN
            (LETT #17# NIL)
            (SEQ (LETT |numres| NIL)
                 (LETT #18# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT % 27)))
                 G190
                 (COND
                  ((OR (ATOM #18#) (PROGN (LETT |numres| (CAR #18#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #17# (CONS (|FLOATRP;makeEq| |numres| |lv| %) #17#))))
                 (LETT #18# (CDR #18#)) (GO G190) G191
                 (EXIT (NREVERSE #17#)))))))) 

(SDEFUN |FLOATRP;solve;FParL;6|
        ((|p| (|Fraction| (|Polynomial| (|Integer|)))) (|eps| (|Par|))
         (% (|List| (|Equation| (|Polynomial| |Par|)))))
        (SPROG
         ((|mvar| (|Union| (|Symbol|) "failed")) (|x| (|Polynomial| |Par|))
          (#1=#:G80 NIL) (|val| NIL) (#2=#:G81 NIL))
         (SEQ
          (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT % 15)) (QREFELT % 42)))
          (EXIT
           (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
                 ('T
                  (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT % 9)))
                       (EXIT
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |val| NIL)
                              (LETT #2# (SPADCALL |p| |eps| (QREFELT % 19)))
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
                                                           (QREFELT % 10))
                                                 (QREFELT % 12))
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |FLOATRP;solve;EParL;7|
        ((|eq| (|Equation| (|Fraction| (|Polynomial| (|Integer|)))))
         (|eps| (|Par|)) (% (|List| (|Equation| (|Polynomial| |Par|)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 36))
                   (SPADCALL |eq| (QREFELT % 37)) (QREFELT % 38))
         |eps| (QREFELT % 44))) 

(DECLAIM (NOTINLINE |FloatingRealPackage;|)) 

(DEFUN |FloatingRealPackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FloatingRealPackage| DV$1))
          (LETT % (GETREFV 46))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatingRealPackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatingRealPackage| (#1=#:G83)
  (SPROG NIL
         (PROG (#2=#:G84)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FloatingRealPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FloatingRealPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FloatingRealPackage|)))))))))) 

(MAKEPROP '|FloatingRealPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|Polynomial| 6) (0 . |coerce|) (5 . |coerce|) (|Equation| 8)
              (10 . |equation|) (|Polynomial| (|Integer|)) (|Fraction| 13)
              (16 . |numer|) (|List| 6)
              (|InnerNumericFloatSolvePackage| (|Integer|) 6 6)
              (21 . |innerSolve1|) |FLOATRP;realRoots;FParL;2| (27 . |denom|)
              (32 . |1|) (|Boolean|) (36 . ~=) (|List| 16) (|List| 13)
              (|List| 7) (42 . |innerSolve|) (|List| 14)
              |FLOATRP;realRoots;LLParL;3| (50 . |variables|) (55 . |setUnion|)
              (61 . ~=) (|List| 43) |FLOATRP;solve;LParL;4| (|Equation| 14)
              (67 . |lhs|) (72 . |rhs|) (77 . -) (|List| 35)
              |FLOATRP;solve;LParL;5| (|Union| 7 '"failed")
              (83 . |mainVariable|) (|List| 11) |FLOATRP;solve;FParL;6|
              |FLOATRP;solve;EParL;7|)
           '#(|solve| 88 |realRoots| 112) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List|
                                   (|Fraction| (|Polynomial| (|Integer|))))
                                  |#1|))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  |#1|))
                                T)
                              '((|solve|
                                 ((|List| (|Equation| (|Polynomial| |#1|)))
                                  (|Fraction| (|Polynomial| (|Integer|)))
                                  |#1|))
                                T)
                              '((|solve|
                                 ((|List| (|Equation| (|Polynomial| |#1|)))
                                  (|Equation|
                                   (|Fraction| (|Polynomial| (|Integer|))))
                                  |#1|))
                                T)
                              '((|realRoots|
                                 ((|List| (|List| |#1|))
                                  (|List|
                                   (|Fraction| (|Polynomial| (|Integer|))))
                                  (|List| (|Symbol|)) |#1|))
                                T)
                              '((|realRoots|
                                 ((|List| |#1|)
                                  (|Fraction| (|Polynomial| (|Integer|)))
                                  |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 45
                                            '(1 8 0 7 9 1 8 0 6 10 2 11 0 8 8
                                              12 1 14 13 0 15 2 17 16 13 6 18 1
                                              14 13 0 20 0 13 0 21 2 13 22 0 0
                                              23 4 17 24 25 25 26 6 27 1 13 26
                                              0 30 2 26 0 0 0 31 2 25 22 0 0 32
                                              1 35 14 0 36 1 35 14 0 37 2 14 0
                                              0 0 38 1 13 41 0 42 2 0 43 35 6
                                              45 2 0 33 39 6 40 2 0 43 14 6 44
                                              2 0 33 28 6 34 3 0 24 28 26 6 29
                                              2 0 16 14 6 19)))))
           '|lookupComplete|)) 
