
(SDEFUN |NORMPK;normInvertible?;PTSL;1|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPADCALL |p| |ts| (QREFELT % 14))) 

(SDEFUN |NORMPK;normInvertible?;PTSL;2|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPADCALL |p| |ts| (QREFELT % 16))) 

(SDEFUN |NORMPK;outputArgs;2SPTSV;3|
        ((|s1| (|String|)) (|s2| (|String|)) (|p| (P)) (|ts| (TS))
         (% (|Void|)))
        (SEQ
         (COND
          ((NULL (SPADCALL |s1| (QREFELT % 19)))
           (SPADCALL |s1| (SPADCALL |p| (QREFELT % 21)) (QREFELT % 24))))
         (SPADCALL (SPADCALL " " (QREFELT % 25)) (QREFELT % 26))
         (COND
          ((NULL (SPADCALL |s2| (QREFELT % 19)))
           (SPADCALL |s2| (SPADCALL |ts| (QREFELT % 27)) (QREFELT % 24))))
         (EXIT (SPADCALL (SPADCALL " " (QREFELT % 25)) (QREFELT % 26))))) 

(SDEFUN |NORMPK;recip;PTSR;4|
        ((|p| (P)) (|ts| (TS)) (% (|Record| (|:| |num| P) (|:| |den| P))))
        (SPROG
         ((|pd| (P)) (|pn| (P)) (|k| (|Fraction| R)) (|dp| (R)) (|cd| (R))
          (|dn| (R)) (|cn| (R))
          (|remd| #1=(|Record| (|:| |rnum| R) (|:| |polnum| P) (|:| |den| R)))
          (|remn| #1#) (|d| (P)) (|n| (P)) (|#G19| (P)) (#2=#:G25 NIL)
          (|#G18| (P)) (|g| (P))
          (|hesrg| (|Record| (|:| |gcd| P) (|:| |coef1| P))) (|ts_v| (P))
          (|v| (V)))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 29)))
              (LETT |ts_v|
                    (PROG2 (LETT #2# (SPADCALL |ts| |v| (QREFELT % 31)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                      (|Union| (QREFELT % 9) #3="failed")
                                      #2#)))
              (COND
               ((< (SPADCALL |p| (QREFELT % 33))
                   (SPADCALL |ts_v| (QREFELT % 33)))
                (SEQ (LETT |hesrg| (SPADCALL |ts_v| |p| (QREFELT % 35)))
                     (LETT |d| (QCAR |hesrg|))
                     (EXIT (LETT |n| (QCDR |hesrg|)))))
               ('T
                (SEQ (LETT |hesrg| (SPADCALL |p| |ts_v| (QREFELT % 37)))
                     (LETT |d| (QCAR |hesrg|))
                     (EXIT (LETT |n| (QCDR |hesrg|))))))
              (LETT |g| (SPADCALL |n| |d| (QREFELT % 38)))
              (PROGN
               (LETT |#G18|
                     (PROG2 (LETT #2# (SPADCALL |n| |g| (QREFELT % 40)))
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                       (|Union| (QREFELT % 9) #3#) #2#)))
               (LETT |#G19|
                     (PROG2 (LETT #2# (SPADCALL |d| |g| (QREFELT % 40)))
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                       (|Union| (QREFELT % 9) #3#) #2#)))
               (LETT |n| |#G18|)
               (LETT |d| |#G19|))
              (LETT |remn| (SPADCALL |n| |ts| (QREFELT % 42)))
              (LETT |remd| (SPADCALL |d| |ts| (QREFELT % 42)))
              (LETT |cn| (QVELT |remn| 0)) (LETT |pn| (QVELT |remn| 1))
              (LETT |dn| (QVELT |remn| 2)) (LETT |cd| (QVELT |remd| 0))
              (LETT |pd| (QVELT |remd| 1)) (LETT |dp| (QVELT |remd| 2))
              (LETT |k|
                    (SPADCALL (SPADCALL |cn| |cd| (QREFELT % 44))
                              (SPADCALL |dp| |dn| (QREFELT % 44))
                              (QREFELT % 45)))
              (LETT |pn| (SPADCALL |pn| |ts| (QREFELT % 46)))
              (LETT |pd| (SPADCALL |pd| |ts| (QREFELT % 46)))
              (EXIT
               (CONS
                (SPADCALL (SPADCALL |k| (QREFELT % 47)) |pn| (QREFELT % 48))
                (SPADCALL (SPADCALL |k| (QREFELT % 49)) |pd|
                          (QREFELT % 48))))))) 

(SDEFUN |NORMPK;normalizedAssociate;PTSP;5| ((|p| (P)) (|ts| (TS)) (% (P)))
        (SPROG
         ((|r| (P)) (|ip| (P)) (|mp| (P)) (|tp| (P))
          (|qr| (|Record| (|:| |num| P) (|:| |den| P))) (|ts_v| (P))
          (#1=#:G39 NIL) (|v| (V)) (|vp| (V)))
         (SEQ
          (COND
           ((OR (SPADCALL |ts| (QREFELT % 52)) (SPADCALL |p| (QREFELT % 53)))
            |p|)
           ((SPADCALL |p| (QREFELT % 54)) (|spadConstant| % 55))
           ((SPADCALL
             (SPADCALL (SPADCALL |p| (QREFELT % 56)) |ts| (QREFELT % 57))
             (QREFELT % 53))
            (|error| "in normalizedAssociate$NORMPK: bad #1"))
           ('T
            (SEQ (LETT |vp| (SPADCALL |p| (QREFELT % 29))) (LETT |ip| |p|)
                 (LETT |mp| (|spadConstant| % 55))
                 (LETT |tp| (|spadConstant| % 58))
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |ip| (QREFELT % 54))))
                        (GO G191)))
                      (SEQ (LETT |v| (SPADCALL |ip| (QREFELT % 29)))
                           (EXIT
                            (COND
                             ((SPADCALL |v| |ts| (QREFELT % 59))
                              (COND
                               ((SPADCALL |v| |vp| (QREFELT % 60))
                                (SEQ
                                 (LETT |ts_v|
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |ts| |v|
                                                           (QREFELT % 31)))
                                           (QCDR #1#)
                                         (|check_union2| (QEQCAR #1# 0)
                                                         (QREFELT % 9)
                                                         (|Union| (QREFELT % 9)
                                                                  "failed")
                                                         #1#)))
                                 (LETT |ip|
                                       (SPADCALL |ip| |ts_v| (QREFELT % 61)))
                                 (LETT |ip|
                                       (QVELT
                                        (SPADCALL |ip| |ts| (QREFELT % 42)) 1))
                                 (EXIT
                                  (LETT |ip|
                                        (SPADCALL
                                         (SPADCALL |ip| |ts| (QREFELT % 57))
                                         (QREFELT % 62))))))
                               ('T
                                (SEQ
                                 (LETT |qr|
                                       (SPADCALL |ip| |ts| (QREFELT % 51)))
                                 (LETT |ip| (QCDR |qr|))
                                 (LETT |tp|
                                       (SPADCALL (QCAR |qr|) |tp|
                                                 (QREFELT % 63)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ip| (QREFELT % 53))
                                    (SEQ
                                     (SPADCALL "p = " " ts = " |p| |ts|
                                               (QREFELT % 28))
                                     (EXIT
                                      (|error|
                                       "in normalizedAssociate$NORMPK: should never happen !"))))))))))
                             ('T
                              (SEQ
                               (LETT |tp|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ip| (QREFELT % 64))
                                                |mp| (QREFELT % 63))
                                      |tp| (QREFELT % 65)))
                               (LETT |mp|
                                     (SPADCALL (SPADCALL |ip| (QREFELT % 66))
                                               |mp| (QREFELT % 63)))
                               (EXIT
                                (LETT |ip|
                                      (SPADCALL |ip| (QREFELT % 56)))))))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |r|
                       (SPADCALL (SPADCALL |ip| |mp| (QREFELT % 63)) |tp|
                                 (QREFELT % 65)))
                 (LETT |r| (QVELT (SPADCALL |r| |ts| (QREFELT % 42)) 1))
                 (EXIT
                  (SPADCALL (SPADCALL |r| |ts| (QREFELT % 57))
                            (QREFELT % 62))))))))) 

(SDEFUN |NORMPK;normalize;PTSL;6|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG
         ((|lpwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))) (|q| (P))
          (|us| (TS)) (#1=#:G67 NIL) (|bwt| NIL)
          (|lbwt|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 53)) (LIST (CONS |p| |ts|)))
                ((SPADCALL |p| (QREFELT % 54))
                 (LIST (CONS (|spadConstant| % 55) |ts|)))
                ((SPADCALL
                  (SPADCALL (SPADCALL |p| (QREFELT % 56)) |ts| (QREFELT % 57))
                  (QREFELT % 53))
                 (|error|
                  "in normalize$NORMPK: init(#1) reduces to 0 with respect to #2"))
                ('T
                 (SEQ (LETT |lbwt| (SPADCALL |p| |ts| (QREFELT % 15)))
                      (LETT |lpwt| NIL)
                      (SEQ (LETT |bwt| NIL) (LETT #1# |lbwt|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |bwt| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |us| (QCDR |bwt|))
                                (LETT |q|
                                      (QVELT (SPADCALL |p| |us| (QREFELT % 42))
                                             1))
                                (LETT |q| (SPADCALL |q| |us| (QREFELT % 46)))
                                (EXIT
                                 (COND
                                  ((QCAR |bwt|)
                                   (LETT |lpwt|
                                         (CONS
                                          (CONS
                                           (SPADCALL |q| |us| (QREFELT % 67))
                                           |us|)
                                          |lpwt|)))
                                  ((SPADCALL |q| (QREFELT % 53))
                                   (LETT |lpwt|
                                         (CONS
                                          (CONS (|spadConstant| % 58) |us|)
                                          |lpwt|)))
                                  ('T
                                   (LETT |lpwt|
                                         (SPADCALL
                                          (SPADCALL |q| |us| (QREFELT % 71))
                                          |lpwt| (QREFELT % 72)))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |lpwt|))))))) 

(DECLAIM (NOTINLINE |NormalizationPackage;|)) 

(DEFUN |NormalizationPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|NormalizationPackage| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 73))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|NormalizationPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#5|
                     (LIST '|SquareFreeRegularTriangularSetCategory|
                           (|devaluate| |#1|) (|devaluate| |#2|)
                           (|devaluate| |#3|) (|devaluate| |#4|)))
      (QSETREFV % 15
                (CONS (|dispatchFunction| |NORMPK;normInvertible?;PTSL;1|) %)))
     ('T
      (QSETREFV % 15
                (CONS (|dispatchFunction| |NORMPK;normInvertible?;PTSL;2|)
                      %))))
    %))) 

(DEFUN |NormalizationPackage| (&REST #1=#:G68)
  (SPROG NIL
         (PROG (#2=#:G69)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NormalizationPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NormalizationPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NormalizationPackage|)))))))))) 

(MAKEPROP '|NormalizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Record| (|:| |val| 17) (|:| |tower| 10)) (|List| 11)
              (|SquareFreeRegularTriangularSetGcdPackage| 6 7 8 9 10)
              (0 . |stoseInvertible?_sqfreg|) (6 . |normInvertible?|)
              (12 . |stoseInvertible?_reg|) (|Boolean|) (|String|)
              (18 . |empty?|) (|OutputForm|) (23 . |coerce|) (|Void|)
              (|OutputPackage|) (28 . |output|) (34 . |message|)
              (39 . |output|) (44 . |coerce|) |NORMPK;outputArgs;2SPTSV;3|
              (49 . |mvar|) (|Union| 9 '"failed") (54 . |select|)
              (|NonNegativeInteger|) (60 . |mdeg|)
              (|Record| (|:| |gcd| %) (|:| |coef2| %))
              (65 . |halfExtendedSubResultantGcd2|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %))
              (71 . |halfExtendedSubResultantGcd1|) (77 . |gcd|)
              (|Union| % '"failed") (83 . |exquo|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (89 . |remainder|) (|Fraction| 6) (95 . /) (101 . *)
              (107 . |removeZero|) (113 . |numer|) (118 . *) (124 . |denom|)
              (|Record| (|:| |num| 9) (|:| |den| 9)) |NORMPK;recip;PTSR;4|
              (129 . |empty?|) (134 . |zero?|) (139 . |ground?|) (144 . |One|)
              (148 . |init|) (153 . |initiallyReduce|) (159 . |Zero|)
              (163 . |algebraic?|) (169 . =) (175 . |lastSubResultant|)
              (181 . |primitivePart|) (186 . *) (192 . |tail|) (197 . +)
              (203 . |mainMonomial|) |NORMPK;normalizedAssociate;PTSP;5|
              (208 . |One|) (|Record| (|:| |val| 9) (|:| |tower| 10))
              (|List| 69) |NORMPK;normalize;PTSL;6| (212 . |concat|))
           '#(|recip| 218 |outputArgs| 224 |normalizedAssociate| 232
              |normalize| 238 |normInvertible?| 244)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|recip|
                                 ((|Record| (|:| |num| |#4|) (|:| |den| |#4|))
                                  |#4| |#5|))
                                T)
                              '((|normalizedAssociate| (|#4| |#4| |#5|)) T)
                              '((|normalize|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T)
                              '((|outputArgs|
                                 ((|Void|) (|String|) (|String|) |#4| |#5|))
                                T)
                              '((|normInvertible?|
                                 ((|List|
                                   (|Record| (|:| |val| (|Boolean|))
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 72
                                            '(2 13 12 9 10 14 2 0 12 9 10 15 2
                                              13 12 9 10 16 1 18 17 0 19 1 9 20
                                              0 21 2 23 22 18 20 24 1 20 0 18
                                              25 1 23 22 20 26 1 10 20 0 27 1 9
                                              8 0 29 2 10 30 0 8 31 1 9 32 0 33
                                              2 9 34 0 0 35 2 9 36 0 0 37 2 9 0
                                              0 0 38 2 9 39 0 0 40 2 10 41 9 0
                                              42 2 43 0 6 6 44 2 43 0 0 0 45 2
                                              10 9 9 0 46 1 43 6 0 47 2 9 0 6 0
                                              48 1 43 6 0 49 1 10 17 0 52 1 9
                                              17 0 53 1 9 17 0 54 0 9 0 55 1 9
                                              0 0 56 2 10 9 9 0 57 0 9 0 58 2
                                              10 17 8 0 59 2 8 17 0 0 60 2 9 0
                                              0 0 61 1 9 0 0 62 2 9 0 0 0 63 1
                                              9 0 0 64 2 9 0 0 0 65 1 9 0 0 66
                                              0 6 0 68 2 70 0 0 0 72 2 0 50 9
                                              10 51 4 0 22 18 18 9 10 28 2 0 9
                                              9 10 67 2 0 70 9 10 71 2 0 12 9
                                              10 15)))))
           '|lookupComplete|)) 
