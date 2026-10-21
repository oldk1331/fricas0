
(SDEFUN |LEADCDET;polCase;ZNniLB;1|
        ((|d| (Z)) (|nk| (|NonNegativeInteger|)) (|lval| (|List| Z))
         (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G28 NIL) (|j| NIL) (#2=#:G10 NIL) (#3=#:G29 NIL)
          (#4=#:G11 NIL) (|y| (Z)) (#5=#:G17 NIL) (|q| (Z)) (#6=#:G27 NIL)
          (|distlist| (|List| Z)))
         (SEQ
          (EXIT
           (SEQ (LETT |distlist| (LIST |d|))
                (SEQ (LETT |i| 1) (LETT #1# |nk|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |q|
                            (QVELT
                             (SPADCALL (SPADCALL |lval| |i| (QREFELT % 12))
                                       (QREFELT % 14))
                             1))
                      (SEQ (LETT |j| 0)
                           (LETT #3#
                                 (PROG1 (LETT #2# (- |i| 1))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))
                           G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |y|
                                  (SPADCALL |distlist|
                                            (PROG1 (LETT #4# (- |i| |j|))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 12)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |y| (|spadConstant| % 15)
                                              (QREFELT % 18)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |y| (SPADCALL |y| |q| (QREFELT % 19)))
                                  (EXIT
                                   (LETT |q|
                                         (PROG2
                                             (LETT #5#
                                                   (SPADCALL |q| |y|
                                                             (QREFELT % 21)))
                                             (QCDR #5#)
                                           (|check_union2| (QEQCAR #5# 0)
                                                           (QREFELT % 8)
                                                           (|Union|
                                                            (QREFELT % 8)
                                                            "failed")
                                                           #5#)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |q| (|spadConstant| % 15)
                                         (QREFELT % 22))
                               (PROGN (LETT #6# NIL) (GO #7=#:G26))))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (LETT |distlist|
                             (SPADCALL |distlist| (LIST |q|) (QREFELT % 23)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #6#)))) 

(SDEFUN |LEADCDET;checkpow| ((|a| (Z)) (|b| (Z)) (% (|NonNegativeInteger|)))
        (SPROG ((|i| NIL) (|qt| (|Union| Z "failed")) (#1=#:G38 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 0) G190 NIL
                      (SEQ (LETT |qt| (SPADCALL |b| |a| (QREFELT % 21)))
                           (COND
                            ((QEQCAR |qt| 1)
                             (PROGN (LETT #1# |i|) (GO #2=#:G37))))
                           (EXIT (LETT |b| (QCDR |qt|))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |LEADCDET;distribute|
        ((|contm| (Z)) (|unilist| (|List| (|SparseUnivariatePolynomial| Z)))
         (|pl| (|List| P)) (|vl| (|List| Z)) (|lvar| (|List| OV))
         (|lval| (|List| Z))
         (%
          (|Union|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| Z))))
           "failed")))
        (SPROG
         ((|nf| (|NonNegativeInteger|)) (#1=#:G55 NIL) (|lcp| (Z))
          (#2=#:G45 NIL) (|d| (Z)) (|conu| (|Union| Z #3="failed"))
          (#4=#:G54 NIL) (|i| NIL) (#5=#:G56 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nf| (LENGTH |unilist|))
                (SEQ (LETT |i| 1) (LETT #1# |nf|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |lcp|
                            (SPADCALL (SPADCALL |unilist| |i| (QREFELT % 28))
                                      (QREFELT % 29)))
                      (LETT |d|
                            (SPADCALL |lcp| (SPADCALL |vl| |i| (QREFELT % 12))
                                      (QREFELT % 19)))
                      (SPADCALL |pl| |i|
                                (SPADCALL
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |lcp| |d| (QREFELT % 21)))
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                                   (|Union| (QREFELT % 8) #3#)
                                                   #2#))
                                 (SPADCALL |pl| |i| (QREFELT % 31))
                                 (QREFELT % 32))
                                (QREFELT % 33))
                      (LETT |d|
                            (PROG2
                                (LETT #2#
                                      (SPADCALL
                                       (SPADCALL |vl| |i| (QREFELT % 12)) |d|
                                       (QREFELT % 21)))
                                (QCDR #2#)
                              (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                              (|Union| (QREFELT % 8) #3#)
                                              #2#)))
                      (SPADCALL |unilist| |i|
                                (SPADCALL |d|
                                          (SPADCALL |unilist| |i|
                                                    (QREFELT % 28))
                                          (QREFELT % 34))
                                (QREFELT % 35))
                      (LETT |conu| (SPADCALL |contm| |d| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((QEQCAR |conu| 1)
                         (PROGN (LETT #4# (CONS 1 "failed")) (GO #6=#:G53)))
                        ('T (LETT |contm| (QCDR |conu|))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |contm| (|spadConstant| % 15) (QREFELT % 18))
                  (SEQ (LETT |i| 1) (LETT #5# |nf|) G190
                       (COND ((|greater_SI| |i| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |pl| |i|
                                   (SPADCALL |contm|
                                             (SPADCALL |pl| |i| (QREFELT % 31))
                                             (QREFELT % 32))
                                   (QREFELT % 33))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
                (EXIT (CONS 0 (VECTOR |pl| |contm| |unilist|)))))
          #6# (EXIT #4#)))) 

(SDEFUN |LEADCDET;distFact;ZLRLLLU;4|
        ((|contm| (Z)) (|unilist| (|List| (|SparseUnivariatePolynomial| Z)))
         (|plead|
          (|Record| (|:| |contp| Z)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         (|vl| (|List| Z)) (|lvar| (|List| OV)) (|lval| (|List| Z))
         (%
          (|Union|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| Z))))
           "failed")))
        (SPROG
         ((|nf| (|NonNegativeInteger|)) (|fpl| NIL) (#1=#:G92 NIL)
          (|lpol| (|List| P)) (|lexp| (|List| (|Integer|))) (#2=#:G93 NIL)
          (#3=#:G94 NIL) (|vlp| (|List| Z)) (#4=#:G95 NIL) (#5=#:G96 NIL)
          (|aux| (|List| P)) (#6=#:G97 NIL) (#7=#:G98 NIL)
          (|h| (|NonNegativeInteger|)) (|d| (Z)) (#8=#:G71 NIL) (|c| (Z))
          (|k| NIL) (#9=#:G99 NIL) (#10=#:G91 NIL) (#11=#:G100 NIL) (|i| NIL)
          (#12=#:G101 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lpol| NIL) (LETT |lexp| NIL)
                (LETT |nf| (LENGTH |unilist|)) (LETT |vl| (REVERSE |vl|))
                (SEQ (LETT |fpl| NIL) (LETT #1# (QCDR |plead|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |fpl| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |lpol| (CONS (QCAR |fpl|) |lpol|))
                          (EXIT (LETT |lexp| (CONS (QCDR |fpl|) |lexp|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (LETT |vlp|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |i| 1) (LETT #3# |nf|) G190
                            (COND ((|greater_SI| |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2# (CONS (|spadConstant| % 15) #2#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                (LETT |aux|
                      (PROGN
                       (LETT #4# NIL)
                       (SEQ (LETT |i| 1) (LETT #5# |nf|) G190
                            (COND ((|greater_SI| |i| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4# (CONS (|spadConstant| % 16) #4#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #4#)))))
                (SEQ (LETT |i| 1) (LETT #6# |nf|) G190
                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL |contm|
                                      (SPADCALL
                                       (SPADCALL |unilist| |i| (QREFELT % 28))
                                       (QREFELT % 29))
                                      (QREFELT % 36)))
                      (COND
                       ((OR (SPADCALL |c| (|spadConstant| % 15) (QREFELT % 22))
                            (SPADCALL |c|
                                      (SPADCALL (|spadConstant| % 15)
                                                (QREFELT % 37))
                                      (QREFELT % 22)))
                        (EXIT "next i")))
                      (SEQ (LETT |k| 1) (LETT #7# (LENGTH |lpol|)) G190
                           (COND ((|greater_SI| |k| #7#) (GO G191)))
                           (SEQ
                            (LETT |h|
                                  (|LEADCDET;checkpow|
                                   (SPADCALL |vl| |k| (QREFELT % 12)) |c| %))
                            (EXIT
                             (COND
                              ((SPADCALL |h| 0 (QREFELT % 40))
                               (SEQ
                                (COND
                                 ((> |h| (SPADCALL |lexp| |k| (QREFELT % 42)))
                                  (PROGN
                                   (LETT #10# (CONS 1 "failed"))
                                   (GO #13=#:G90))))
                                (SPADCALL |lexp| |k|
                                          (-
                                           (SPADCALL |lexp| |k| (QREFELT % 42))
                                           |h|)
                                          (QREFELT % 43))
                                (SPADCALL |aux| |i|
                                          (SPADCALL
                                           (SPADCALL |aux| |i| (QREFELT % 31))
                                           (SPADCALL
                                            (SPADCALL |lpol| |k|
                                                      (QREFELT % 31))
                                            |h| (QREFELT % 44))
                                           (QREFELT % 45))
                                          (QREFELT % 33))
                                (LETT |d|
                                      (SPADCALL
                                       (SPADCALL |vl| |k| (QREFELT % 12)) |h|
                                       (QREFELT % 46)))
                                (SPADCALL |vlp| |i|
                                          (SPADCALL
                                           (SPADCALL |vlp| |i| (QREFELT % 12))
                                           |d| (QREFELT % 36))
                                          (QREFELT % 47))
                                (EXIT
                                 (LETT |c|
                                       (PROG2
                                           (LETT #8#
                                                 (SPADCALL |c| |d|
                                                           (QREFELT % 21)))
                                           (QCDR #8#)
                                         (|check_union2| (QEQCAR #8# 0)
                                                         (QREFELT % 8)
                                                         (|Union| (QREFELT % 8)
                                                                  "failed")
                                                         #8#)))))))))
                           (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |contm| (|spadConstant| % 15)
                                   (QREFELT % 22))
                         (SPADCALL |vlp| |i| |c| (QREFELT % 47))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| 1) (LETT #9# (LENGTH |lpol|)) G190
                     (COND ((|greater_SI| |k| #9#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |lexp| |k| (QREFELT % 42)) 0
                                   (QREFELT % 48))
                         (PROGN (LETT #10# (CONS 1 "failed")) (GO #13#))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |contm| (|spadConstant| % 15) (QREFELT % 22))
                   (CONS 0
                         (VECTOR
                          (PROGN
                           (LETT #11# NIL)
                           (SEQ (LETT |i| 1) (LETT #12# |nf|) G190
                                (COND ((|greater_SI| |i| #12#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |vlp| |i| (QREFELT % 12))
                                          (SPADCALL |aux| |i| (QREFELT % 31))
                                          (QREFELT % 32))
                                         #11#))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT (NREVERSE #11#))))
                          (|spadConstant| % 15) |unilist|)))
                  ('T
                   (|LEADCDET;distribute| |contm| |unilist| |aux| |vlp| |lvar|
                    |lval| %))))))
          #13# (EXIT #10#)))) 

(DECLAIM (NOTINLINE |LeadingCoefDetermination;|)) 

(DEFUN |LeadingCoefDetermination;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|LeadingCoefDetermination| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 55))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|LeadingCoefDetermination|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |LeadingCoefDetermination| (&REST #1=#:G102)
  (SPROG NIL
         (PROG (#2=#:G103)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LeadingCoefDetermination|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LeadingCoefDetermination;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LeadingCoefDetermination|)))))))))) 

(MAKEPROP '|LeadingCoefDetermination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (|List| 8) (0 . |elt|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (6 . |unitNormal|) (11 . |1|) (15 . |1|) (|Boolean|) (19 . ~=)
              (25 . |gcd|) (|Union| % '"failed") (31 . |exquo|) (37 . =)
              (43 . |append|) (|NonNegativeInteger|)
              |LEADCDET;polCase;ZNniLB;1| (|SparseUnivariatePolynomial| 8)
              (|List| 26) (49 . |elt|) (55 . |leadingCoefficient|) (|List| 9)
              (60 . |elt|) (66 . *) (72 . |setelt!|) (79 . *) (85 . |setelt!|)
              (92 . *) (98 . -) (103 . |0|) (107 . |0|) (111 . ~=) (|List| 10)
              (117 . |elt|) (123 . |setelt!|) (130 . ^) (136 . *) (142 . ^)
              (148 . |setelt!|) (155 . ~=)
              (|Record| (|:| |polfac| 30) (|:| |correct| 8)
                        (|:| |corrfact| 27))
              (|Union| 49 '"failed") (|Record| (|:| |irr| 9) (|:| |pow| 24))
              (|Record| (|:| |contp| 8) (|:| |factors| (|List| 51))) (|List| 6)
              |LEADCDET;distFact;ZLRLLLU;4|)
           '#(|polCase| 161 |distFact| 168) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|polCase|
                                 ((|Boolean|) |#3| (|NonNegativeInteger|)
                                  (|List| |#3|)))
                                T)
                              '((|distFact|
                                 ((|Union|
                                   (|Record| (|:| |polfac| (|List| |#4|))
                                             (|:| |correct| |#3|)
                                             (|:| |corrfact|
                                                  (|List|
                                                   (|SparseUnivariatePolynomial|
                                                    |#3|))))
                                   "failed")
                                  |#3|
                                  (|List| (|SparseUnivariatePolynomial| |#3|))
                                  (|Record| (|:| |contp| |#3|)
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#4|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))
                                  (|List| |#3|) (|List| |#1|) (|List| |#3|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 54
                                            '(2 11 8 0 10 12 1 8 13 0 14 0 8 0
                                              15 0 9 0 16 2 8 17 0 0 18 2 8 0 0
                                              0 19 2 8 20 0 0 21 2 8 17 0 0 22
                                              2 11 0 0 0 23 2 27 26 0 10 28 1
                                              26 8 0 29 2 30 9 0 10 31 2 9 0 8
                                              0 32 3 30 9 0 10 9 33 2 26 0 8 0
                                              34 3 27 26 0 10 26 35 2 8 0 0 0
                                              36 1 8 0 0 37 0 7 0 38 0 8 0 39 2
                                              24 17 0 0 40 2 41 10 0 10 42 3 41
                                              10 0 10 10 43 2 9 0 0 24 44 2 9 0
                                              0 0 45 2 8 0 0 24 46 3 11 8 0 10
                                              8 47 2 10 17 0 0 48 3 0 17 8 24
                                              11 25 6 0 50 8 27 52 11 53 11
                                              54)))))
           '|lookupComplete|)) 
