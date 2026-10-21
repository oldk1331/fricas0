
(SDEFUN |SPFUTS;lambertW0;2UTS;1| ((|x| (UTS)) (% (UTS)))
        (SPROG ((|dx| (UTS)))
               (SEQ (LETT |dx| (SPADCALL |x| (QREFELT % 8)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS #'|SPFUTS;lambertW0;2UTS;1!1| (VECTOR |dx| %))
                       (QREFELT % 28))
                      (QREFELT % 12)))))) 

(SDEFUN |SPFUTS;lambertW0;2UTS;1!1| ((|s| NIL) ($$ NIL))
        (PROG (% |dx|)
          (LETT % (QREFELT $$ 1))
          (LETT |dx| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (|spadConstant| % 9)
                             (CONS #'|SPFUTS;lambertW0;2UTS;1!0|
                                   (VECTOR % |s| |dx|))
                             (QREFELT % 25))))))) 

(SDEFUN |SPFUTS;lambertW0;2UTS;1!0| (($$ NIL))
        (PROG (|dx| |s| %)
          (LETT |dx| (QREFELT $$ 2))
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL |dx|
                        (SPADCALL
                         (SPADCALL (SPADCALL |s| (QREFELT % 12))
                                   (QREFELT % 13))
                         (QREFELT % 14))
                        (QREFELT % 15))
              (SPADCALL
               (SPADCALL (|spadConstant| % 16) (SPADCALL |s| (QREFELT % 12))
                         (QREFELT % 17))
               (SPADCALL (|spadConstant| % 16) (QREFELT % 13)) (QREFELT % 21))
              (QREFELT % 15))
             (QREFELT % 22)))))) 

(SDEFUN |SPFUTS;compose| ((|s| (|Stream| |Coef|)) (|x| (UTS)) (% (UTS)))
        (SPADCALL (SPADCALL |s| (SPADCALL |x| (QREFELT % 22)) (QREFELT % 30))
                  (QREFELT % 12))) 

(SDEFUN |SPFUTS;p_re|
        ((|k| (|Integer|)) (|lcr| (|List| |Coef|)) (% (|Stream| |Coef|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SPFUTS;p_re!0| (VECTOR |k| % |lcr|))
                          (QREFELT % 50))))) 

(SDEFUN |SPFUTS;p_re!0| (($$ NIL))
        (PROG (|lcr| % |k|)
          (LETT |lcr| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lm| NIL) (|ck_m| NIL) (#1=#:G21 NIL) (|cm| NIL) (#2=#:G20 NIL)
              (|m| NIL) (#3=#:G19 NIL) (|ss| NIL) (|two| NIL) (|three| NIL)
              (|ck| NIL))
             (SEQ (LETT |lm| (SPADCALL |lcr| (QREFELT % 32)))
                  (LETT |ss| (|spadConstant| % 9))
                  (SEQ (LETT |ck_m| NIL)
                       (LETT #1# (SPADCALL |lcr| (QREFELT % 35)))
                       (LETT |cm| NIL) (LETT #2# |lm|) (LETT |m| 2)
                       (LETT #3# (SPADCALL |k| 2 (QREFELT % 34))) G190
                       (COND
                        ((OR (|greater_SI| |m| #3#) (ATOM #2#)
                             (PROGN (LETT |cm| (CAR #2#)) NIL) (ATOM #1#)
                             (PROGN (LETT |ck_m| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |ss|
                               (SPADCALL |ss|
                                         (SPADCALL |cm| |ck_m| (QREFELT % 36))
                                         (QREFELT % 37)))))
                       (LETT |m|
                             (PROG1 (|inc_SI| |m|)
                               (LETT #2#
                                     (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |two|
                        (SPADCALL (|spadConstant| % 18) (|spadConstant| % 18)
                                  (QREFELT % 37)))
                  (LETT |three|
                        (SPADCALL |two| (|spadConstant| % 18) (QREFELT % 37)))
                  (LETT |ck|
                        (SPADCALL (SPADCALL |three| |ss| (QREFELT % 36))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |k| |two| (QREFELT % 38))
                                    (|spadConstant| % 18) (QREFELT % 37))
                                   (SPADCALL
                                    (SPADCALL |k| (|spadConstant| % 18)
                                              (QREFELT % 38))
                                    |three| (QREFELT % 42))
                                   (QREFELT % 36))
                                  (QREFELT % 43)))
                  (EXIT
                   (SPADCALL |ck|
                             (|SPFUTS;p_re|
                              (SPADCALL |k| (|spadConstant| % 45)
                                        (QREFELT % 46))
                              (SPADCALL |ck| |lcr| (QREFELT % 47)) %)
                             (QREFELT % 48))))))))) 

(SDEFUN |SPFUTS;p_stream|
        ((|g2| (|Coef|)) (|g3| (|Coef|)) (% (|Stream| |Coef|)))
        (SPROG
         ((|c2| (|Coef|)) (|c4| (|Coef|)) (|c5| (|Coef|)) (|c20| (|Coef|))
          (|c28| (|Coef|)))
         (SEQ
          (LETT |c2|
                (SPADCALL (|spadConstant| % 18) (|spadConstant| % 18)
                          (QREFELT % 37)))
          (LETT |c4| (SPADCALL |c2| |c2| (QREFELT % 37)))
          (LETT |c5| (SPADCALL |c4| (|spadConstant| % 18) (QREFELT % 37)))
          (LETT |c20| (SPADCALL |c4| |c5| (QREFELT % 36)))
          (LETT |c28|
                (SPADCALL |c4| (SPADCALL |c5| |c2| (QREFELT % 37))
                          (QREFELT % 36)))
          (EXIT
           (SPADCALL (|spadConstant| % 9)
                     (SPADCALL (SPADCALL |g2| |c20| (QREFELT % 43))
                               (SPADCALL (SPADCALL |g3| |c28| (QREFELT % 43))
                                         (|SPFUTS;p_re| 4
                                          (LIST
                                           (SPADCALL |g3| |c28| (QREFELT % 43))
                                           (SPADCALL |g2| |c20|
                                                     (QREFELT % 43)))
                                          %)
                                         (QREFELT % 48))
                               (QREFELT % 48))
                     (QREFELT % 48)))))) 

(SDEFUN |SPFUTS;weierstrassP0;2Coef2UTS;5|
        ((|g2| (|Coef|)) (|g3| (|Coef|)) (|x| (UTS)) (% (UTS)))
        (|SPFUTS;compose| (|SPFUTS;p_stream| |g2| |g3| %)
         (SPADCALL |x| |x| (QREFELT % 15)) %)) 

(SDEFUN |SPFUTS;weierstrassPPrime0;2Coef2UTS;6|
        ((|g2| (|Coef|)) (|g3| (|Coef|)) (|x| (UTS)) (% (UTS)))
        (SPADCALL (SPADCALL (+ 1 1) |x| (QREFELT % 52))
                  (|SPFUTS;compose|
                   (SPADCALL (|SPFUTS;p_stream| |g2| |g3| %) (QREFELT % 53))
                   (SPADCALL |x| |x| (QREFELT % 15)) %)
                  (QREFELT % 15))) 

(SDEFUN |SPFUTS;weierstrassZeta0;2Coef2UTS;7|
        ((|g2| (|Coef|)) (|g3| (|Coef|)) (|x| (UTS)) (% (UTS)))
        (SPROG ((|ps2| (|Stream| |Coef|)))
               (SEQ
                (LETT |ps2|
                      (SPADCALL (|SPFUTS;p_stream| |g2| |g3| %)
                                (SPADCALL (SPADCALL |x| |x| (QREFELT % 15))
                                          (QREFELT % 22))
                                (QREFELT % 30)))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 9) |ps2| (QREFELT % 55))
                   (QREFELT % 12))
                  (QREFELT % 13)))))) 

(SDEFUN |SPFUTS;weierstrassSigma0;2Coef2UTS;8|
        ((|g2| (|Coef|)) (|g3| (|Coef|)) (|x| (UTS)) (% (UTS)))
        (SPROG
         ((|ps2| (|Stream| |Coef|)) (|zs| #1=(|Stream| |Coef|)) (|lsigma| #1#))
         (SEQ
          (LETT |ps2|
                (SPADCALL (|SPFUTS;p_stream| |g2| |g3| %)
                          (SPADCALL (SPADCALL |x| |x| (QREFELT % 15))
                                    (QREFELT % 22))
                          (QREFELT % 30)))
          (LETT |zs| (SPADCALL (|spadConstant| % 9) |ps2| (QREFELT % 55)))
          (LETT |lsigma|
                (SPADCALL (|spadConstant| % 9) (SPADCALL |zs| (QREFELT % 57))
                          (QREFELT % 55)))
          (EXIT
           (SPADCALL |x|
                     (SPADCALL (SPADCALL |lsigma| (QREFELT % 59))
                               (QREFELT % 12))
                     (QREFELT % 15)))))) 

(DECLAIM (NOTINLINE |SpecialFunctionUnivariateTaylorSeries;|)) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$|
                (LIST '|SpecialFunctionUnivariateTaylorSeries| DV$1 DV$2))
          (LETT % (GETREFV 61))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|SpecialFunctionUnivariateTaylorSeries| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries| (&REST #1=#:G32)
  (SPROG NIL
         (PROG (#2=#:G33)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SpecialFunctionUnivariateTaylorSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |SpecialFunctionUnivariateTaylorSeries;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SpecialFunctionUnivariateTaylorSeries|)))))))))) 

(MAKEPROP '|SpecialFunctionUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |0|) (9 . |0|) (|Stream| 6)
              (13 . |series|) (18 . -) (23 . |exp|) (28 . *) (34 . |1|)
              (38 . +) (44 . |1|) (|PositiveInteger|) (48 . |1|) (52 . ^)
              (58 . |coefficients|) (|Mapping| 11)
              (|StreamTaylorSeriesOperations| 6) (63 . |lazyIntegrate|)
              (|Mapping| 11 11) (|ParadoxicalCombinatorsForStreams| 6) (69 . Y)
              |SPFUTS;lambertW0;2UTS;1| (74 . |compose|) (|List| 6)
              (80 . |reverse|) (|Integer|) (85 . -) (91 . |rest|) (96 . *)
              (102 . +) (108 . *) (|Fraction| 33) (114 . |1|) (118 . *)
              (124 . -) (130 . /) (|SingleInteger|) (136 . |1|) (140 . +)
              (146 . |cons|) (152 . |concat|) (|Mapping| %) (158 . |delay|)
              |SPFUTS;weierstrassP0;2Coef2UTS;5| (163 . *) (169 . |deriv|)
              |SPFUTS;weierstrassPPrime0;2Coef2UTS;6| (174 . |integrate|)
              |SPFUTS;weierstrassZeta0;2Coef2UTS;7| (180 . -)
              (|StreamTranscendentalFunctions| 6) (185 . |exp|)
              |SPFUTS;weierstrassSigma0;2Coef2UTS;8|)
           '#(|weierstrassZeta0| 190 |weierstrassSigma0| 197
              |weierstrassPPrime0| 204 |weierstrassP0| 211 |lambertW0| 218)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|lambertW0| (|#2| |#2|)) T)
                                   '((|weierstrassP0| (|#2| |#1| |#1| |#2|)) T)
                                   '((|weierstrassPPrime0|
                                      (|#2| |#1| |#1| |#2|))
                                     T)
                                   '((|weierstrassZeta0| (|#2| |#1| |#1| |#2|))
                                     T)
                                   '((|weierstrassSigma0|
                                      (|#2| |#1| |#1| |#2|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(1 7 0 0 8 0 6 0 9 0 7 0 10 1 7 0
                                              11 12 1 7 0 0 13 1 7 0 0 14 2 7 0
                                              0 0 15 0 7 0 16 2 7 0 0 0 17 0 6
                                              0 18 0 19 0 20 2 7 0 0 0 21 1 7
                                              11 0 22 2 24 11 6 23 25 1 27 11
                                              26 28 2 24 11 11 11 30 1 31 0 0
                                              32 2 33 0 0 0 34 1 31 0 0 35 2 6
                                              0 0 0 36 2 6 0 0 0 37 2 6 0 33 0
                                              38 0 39 0 40 2 39 0 33 0 41 2 6 0
                                              0 0 42 2 6 0 0 0 43 0 44 0 45 2
                                              33 0 0 0 46 2 31 0 6 0 47 2 11 0
                                              6 0 48 1 11 0 49 50 2 7 0 19 0 52
                                              1 24 11 11 53 2 24 11 6 11 55 1
                                              24 11 11 57 1 58 11 11 59 3 0 7 6
                                              6 7 56 3 0 7 6 6 7 60 3 0 7 6 6 7
                                              54 3 0 7 6 6 7 51 1 0 7 7 29)))))
           '|lookupComplete|)) 
