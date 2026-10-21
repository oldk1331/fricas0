
(SDEFUN |APPRULE;applist|
        ((|lrule| (|List| (|RewriteRule| |Base| R F))) (|arglist| (|List| F))
         (% (|List| F)))
        (SPROG ((#1=#:G11 NIL) (|arg| NIL) (#2=#:G12 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |arg| NIL) (LETT #2# |arglist|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |arg| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (|APPRULE;app| |lrule| |arg| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |APPRULE;splitRules|
        ((|l| (|List| (|RewriteRule| |Base| R F)))
         (%
          (|Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
                    (|:| |rl| (|List| (|RewriteRule| |Base| R F))))))
        (SPROG
         ((|r| NIL) (#1=#:G26 NIL) (|u| (|Union| (|Equation| F) "failed"))
          (|ncr| (|List| (|RewriteRule| |Base| R F)))
          (|lk| (|List| (|Kernel| F))) (|lv| (|List| F)))
         (SEQ (LETT |ncr| NIL) (LETT |lk| NIL) (LETT |lv| NIL)
              (SEQ (LETT |r| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |r| (QREFELT % 11)))
                        (EXIT
                         (COND ((QEQCAR |u| 1) (LETT |ncr| (CONS |r| |ncr|)))
                               ('T
                                (SEQ
                                 (LETT |lk|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QCDR |u|) (QREFELT % 13))
                                         (QREFELT % 15))
                                        |lk|))
                                 (EXIT
                                  (LETT |lv|
                                        (CONS
                                         (SPADCALL (QCDR |u|) (QREFELT % 16))
                                         |lv|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |lk| |lv| |ncr|))))) 

(SDEFUN |APPRULE;applyRules;L2F;3|
        ((|l| (|List| (|RewriteRule| |Base| R F))) (|s| (F)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
                     (|:| |rl| (|List| (|RewriteRule| |Base| R F)))))
          (|new| (F)) (#1=#:G33 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rec| (|APPRULE;splitRules| |l| %))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |new|
                             (|APPRULE;localApply| (QVELT |rec| 0)
                              (QVELT |rec| 1) (QVELT |rec| 2) |s| 1 %))
                       (EXIT
                        (COND
                         ((SPADCALL |new| |s| (QREFELT % 18))
                          (PROGN (LETT #1# |s|) (GO #2=#:G32)))
                         ('T (LETT |s| |new|)))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |APPRULE;applyRules;LFPiF;4|
        ((|l| (|List| (|RewriteRule| |Base| R F))) (|s| (F))
         (|n| (|PositiveInteger|)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
                     (|:| |rl| (|List| (|RewriteRule| |Base| R F))))))
         (SEQ (LETT |rec| (|APPRULE;splitRules| |l| %))
              (EXIT
               (|APPRULE;localApply| (QVELT |rec| 0) (QVELT |rec| 1)
                (QVELT |rec| 2) |s| |n| %))))) 

(SDEFUN |APPRULE;localApply|
        ((|lk| (|List| (|Kernel| F))) (|lv| (|List| F))
         (|lrule| (|List| (|RewriteRule| |Base| R F))) (|subject| (F))
         (|n| (|PositiveInteger|)) (% (F)))
        (SPROG
         ((|i| NIL) (#1=#:G44 NIL) (|v| NIL) (#2=#:G46 NIL) (|k| NIL)
          (#3=#:G45 NIL))
         (SEQ
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (SEQ (LETT |v| NIL) (LETT #2# |lv|) (LETT |k| NIL)
                     (LETT #3# |lk|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL)
                           (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |subject|
                             (SPADCALL |subject| |k| |v| (QREFELT % 23)))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |subject| (|APPRULE;app| |lrule| |subject| %))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |subject|)))) 

(SDEFUN |APPRULE;rewrite|
        ((|f| (F)) (|res| (|PatternMatchResult| |Base| F))
         (|l| (|List| (|Symbol|))) (% (F)))
        (SPROG
         ((|rec| NIL) (#1=#:G55 NIL) (|lk| (|List| (|Kernel| F)))
          (|lv| (|List| F)))
         (SEQ (LETT |lk| NIL) (LETT |lv| NIL)
              (SEQ (LETT |rec| NIL) (LETT #1# (SPADCALL |res| (QREFELT % 27)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lk|
                          (CONS (SPADCALL (QCAR |rec|) (QREFELT % 30)) |lk|))
                    (EXIT (LETT |lv| (CONS (QCDR |rec|) |lv|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f| |lk| |lv| (QREFELT % 33)))))) 

(SDEFUN |APPRULE;isitwithpred|
        ((|subject| (F)) (|pat| (|Pattern| |Base|))
         (|vars| (|List| (|Pattern| |Base|)))
         (|bad| (|List| (|PatternMatchResult| |Base| F)))
         (% (|PatternMatchResult| |Base| F)))
        (SPROG
         ((|u| (|PatternMatchResult| |Base| F)) (#1=#:G60 NIL) (|v| NIL)
          (#2=#:G75 NIL) (#3=#:G67 NIL))
         (SEQ
          (COND
           ((OR
             (SPADCALL
              (LETT |u|
                    (SPADCALL |subject| |pat| (SPADCALL (QREFELT % 34))
                              (QREFELT % 37)))
              (QREFELT % 38))
             (PROG2 (LETT #1# (SPADCALL |u| |pat| (QREFELT % 40)))
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|Boolean|)
                               (|Union| (|Boolean|) "failed") #1#)))
            |u|)
           ((SPADCALL |u| |bad| (QREFELT % 42)) (SPADCALL (QREFELT % 43)))
           ('T
            (SEQ
             (SEQ (LETT |v| NIL) (LETT #2# |vars|) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v|
                              (PROG2
                                  (LETT #3# (SPADCALL |v| |u| (QREFELT % 45)))
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0) (QREFELT % 8)
                                                (|Union| (QREFELT % 8)
                                                         "failed")
                                                #3#))
                              (QREFELT % 47))))
                  (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|APPRULE;isitwithpred| |subject| |pat| |vars| (CONS |u| |bad|)
               %)))))))) 

(SDEFUN |APPRULE;isit|
        ((|subject| (F)) (|pat| (|Pattern| |Base|))
         (% (|PatternMatchResult| |Base| F)))
        (SPROG ((|v| NIL) (|l| (|List| (|Pattern| |Base|))) (#1=#:G81 NIL))
               (SEQ
                (COND
                 ((SPADCALL |pat| (QREFELT % 48))
                  (SEQ
                   (SEQ (LETT |v| NIL)
                        (LETT #1# (LETT |l| (SPADCALL |pat| (QREFELT % 49))))
                        G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |v| (QREFELT % 50))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (|APPRULE;isitwithpred| |subject| |pat| |l| NIL %))))
                 ('T
                  (SPADCALL |subject| |pat| (SPADCALL (QREFELT % 34))
                            (QREFELT % 37))))))) 

(SDEFUN |APPRULE;app|
        ((|lrule| (|List| (|RewriteRule| |Base| R F))) (|subject| (F)) (% (F)))
        (SPROG
         ((|r| NIL) (#1=#:G129 NIL) (|u| (|PatternMatchResult| |Base| F))
          (#2=#:G128 NIL) (#3=#:G127 NIL) (|k| (|Union| (|Kernel| F) "failed"))
          (#4=#:G0 NIL) (#5=#:G130 NIL) (#6=#:G99 (F)) (#7=#:G97 (F))
          (#8=#:G98 NIL) (|l| (|Union| (|List| F) #9="failed")) (#10=#:G1 NIL)
          (#11=#:G131 NIL) (#12=#:G102 (F)) (#13=#:G100 (F)) (#14=#:G101 NIL)
          (|e|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))) #9#))
          (|ee| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|f| (F)) (#15=#:G112 NIL) (#16=#:G117 NIL) (#17=#:G120 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |r| NIL) (LETT #1# |lrule|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |u|
                               (|APPRULE;isit| |subject|
                                (SPADCALL |r| (QREFELT % 51)) %))
                         (QREFELT % 38)))
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #2#
                                     (|APPRULE;rewrite|
                                      (SPADCALL |r| (QREFELT % 52)) |u|
                                      (SPADCALL |r| (QREFELT % 54)) %))
                               (GO #18=#:G126)))
                        (GO #19=#:G84))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
             #19# (EXIT #3#))
            (LETT |k| (SPADCALL |subject| (QREFELT % 56)))
            (EXIT
             (COND
              ((QEQCAR |k| 0)
               (SPADCALL (SPADCALL (QCDR |k|) (QREFELT % 58))
                         (|APPRULE;applist| |lrule|
                          (SPADCALL (QCDR |k|) (QREFELT % 60)) %)
                         (QREFELT % 61)))
              (#20='T
               (SEQ (LETT |l| (SPADCALL |subject| (QREFELT % 63)))
                    (EXIT
                     (COND
                      ((QEQCAR |l| 0)
                       (PROGN
                        (LETT #8# NIL)
                        (SEQ (LETT #4# NIL)
                             (LETT #5#
                                   (|APPRULE;applist| |lrule| (QCDR |l|) %))
                             G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT #4# (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #6# #4#)
                                (COND
                                 (#8#
                                  (LETT #7# (SPADCALL #7# #6# (QREFELT % 64))))
                                 ('T (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                             (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                        (COND (#8# #7#) (#20# (|spadConstant| % 65)))))
                      (#20#
                       (SEQ (LETT |l| (SPADCALL |subject| (QREFELT % 66)))
                            (EXIT
                             (COND
                              ((QEQCAR |l| 0)
                               (PROGN
                                (LETT #14# NIL)
                                (SEQ (LETT #10# NIL)
                                     (LETT #11#
                                           (|APPRULE;applist| |lrule|
                                            (QCDR |l|) %))
                                     G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN (LETT #10# (CAR #11#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #12# #10#)
                                        (COND
                                         (#14#
                                          (LETT #13#
                                                (SPADCALL #13# #12#
                                                          (QREFELT % 67))))
                                         ('T
                                          (PROGN
                                           (LETT #13# #12#)
                                           (LETT #14# 'T)))))))
                                     (LETT #11# (CDR #11#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#14# #13#)
                                      (#20# (|spadConstant| % 68)))))
                              (#20#
                               (SEQ
                                (LETT |e| (SPADCALL |subject| (QREFELT % 71)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |e| 0)
                                   (SEQ (LETT |ee| (QCDR |e|))
                                        (LETT |f|
                                              (|APPRULE;app| |lrule|
                                               (QCAR |ee|) %))
                                        (EXIT
                                         (COND
                                          ((PLUSP (QCDR |ee|))
                                           (SPADCALL |f|
                                                     (PROG1
                                                         (LETT #15#
                                                               (QCDR |ee|))
                                                       (|check_subtype2|
                                                        (>= #15# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #15#))
                                                     (QREFELT % 73)))
                                          (#20#
                                           (SPADCALL
                                            (PROG2
                                                (LETT #16#
                                                      (SPADCALL |f|
                                                                (QREFELT %
                                                                         75)))
                                                (QCDR #16#)
                                              (|check_union2| (QEQCAR #16# 0)
                                                              (QREFELT % 8)
                                                              (|Union|
                                                               (QREFELT % 8)
                                                               "failed")
                                                              #16#))
                                            (PROG1 (LETT #17# (- (QCDR |ee|)))
                                              (|check_subtype2| (>= #17# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #17#))
                                            (QREFELT % 73)))))))
                                  (#20# |subject|)))))))))))))))))
          #18# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |ApplyRules;|)) 

(DEFUN |ApplyRules;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|ApplyRules| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 76))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ApplyRules| (LIST DV$1 DV$2 DV$3)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ApplyRules| (&REST #1=#:G132)
  (SPROG NIL
         (PROG (#2=#:G133)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ApplyRules|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ApplyRules;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ApplyRules|)))))))))) 

(MAKEPROP '|ApplyRules| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 12 '"failed") (|RewriteRule| 6 7 8)
              (0 . |retractIfCan|) (|Equation| 8) (5 . |lhs|) (|Kernel| %)
              (10 . |retract|) (15 . |rhs|) (|Boolean|) (20 . =) (|List| 10)
              |APPRULE;applyRules;L2F;3| (|PositiveInteger|)
              |APPRULE;applyRules;LFPiF;4| (26 . |eval|)
              (|Record| (|:| |key| 28) (|:| |entry| 8)) (|List| 24)
              (|PatternMatchResult| 6 8) (33 . |destruct|) (|Symbol|)
              (|Kernel| 8) (38 . |kernel|) (|List| 14) (|List| %) (43 . |eval|)
              (50 . |new|) (|PatternMatchResult| 6 %) (|Pattern| 6)
              (54 . |patternMatch|) (61 . |failed?|) (|Union| 17 '"failed")
              (66 . |satisfy?|) (|List| 26) (72 . |member?|) (78 . |failed|)
              (|Union| 8 '"failed") (82 . |getMatch|) (|PatternFunctions1| 6 8)
              (88 . |addBadValue|) (94 . |hasTopPredicate?|) (99 . |variables|)
              (104 . |resetBadValues|) (109 . |pattern|) (114 . |rhs|)
              (|List| 28) (119 . |quotedOperators|) (|Union| 14 '"failed")
              (124 . |retractIfCan|) (|BasicOperator|) (129 . |operator|)
              (|List| 8) (134 . |argument|) (139 . |elt|)
              (|Union| 32 '#1="failed") (145 . |isPlus|) (150 . +) (156 . |0|)
              (160 . |isTimes|) (165 . *) (171 . |1|)
              (|Record| (|:| |val| %) (|:| |exponent| (|Integer|)))
              (|Union| 69 '#1#) (175 . |isPower|) (|NonNegativeInteger|)
              (180 . ^) (|Union| % '"failed") (186 . |recip|))
           '#(|applyRules| 191) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|applyRules|
                                 (|#3| (|List| (|RewriteRule| |#1| |#2| |#3|))
                                  |#3|))
                                T)
                              '((|applyRules|
                                 (|#3| (|List| (|RewriteRule| |#1| |#2| |#3|))
                                  |#3| (|PositiveInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 75
                                            '(1 10 9 0 11 1 12 8 0 13 1 8 14 0
                                              15 1 12 8 0 16 2 8 17 0 0 18 3 8
                                              0 0 14 0 23 1 26 25 0 27 1 29 0
                                              28 30 3 8 0 0 31 32 33 0 26 0 34
                                              3 8 35 0 36 35 37 1 26 17 0 38 2
                                              26 39 0 36 40 2 41 17 26 0 42 0
                                              26 0 43 2 26 44 36 0 45 2 46 36
                                              36 8 47 1 36 17 0 48 1 36 32 0 49
                                              1 36 0 0 50 1 10 36 0 51 1 10 8 0
                                              52 1 10 53 0 54 1 8 55 0 56 1 29
                                              57 0 58 1 29 59 0 60 2 8 0 57 32
                                              61 1 8 62 0 63 2 8 0 0 0 64 0 8 0
                                              65 1 8 62 0 66 2 8 0 0 0 67 0 8 0
                                              68 1 8 70 0 71 2 8 0 0 72 73 1 8
                                              74 0 75 2 0 8 19 8 20 3 0 8 19 8
                                              21 22)))))
           '|lookupComplete|)) 
