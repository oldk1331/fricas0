
(SDEFUN |LEXP;ident|
        ((|l1|
          (|List| (|Record| (|:| |k| #1=(|LyndonWord| |VarSet|)) (|:| |c| R))))
         (|l2|
          (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
         (% (|List| (|Equation| R))))
        (SPROG
         ((#2=#:G17 NIL) (#3=#:G18 NIL) (#4=#:G19 NIL) (|t| NIL) (#5=#:G20 NIL)
          (|u1| #1#) (|c1| (R)) (|u2| #1#) (|c2| (R)) (|r| (R)))
         (SEQ
          (COND
           ((NULL |l1|)
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |t| NIL) (LETT #3# |l2|) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (|spadConstant| % 10) (QCDR |t|)
                                     (QREFELT % 12))
                           #2#))))
                  (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))
           ((NULL |l2|)
            (PROGN
             (LETT #4# NIL)
             (SEQ (LETT |t| NIL) (LETT #5# |l1|) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL (QCDR |t|) (|spadConstant| % 10)
                                     (QREFELT % 12))
                           #4#))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT (NREVERSE #4#)))))
           (#6='T
            (SEQ (LETT |u1| (QCAR (|SPADfirst| |l1|)))
                 (LETT |c1| (QCDR (|SPADfirst| |l1|)))
                 (LETT |u2| (QCAR (|SPADfirst| |l2|)))
                 (LETT |c2| (QCDR (|SPADfirst| |l2|)))
                 (EXIT
                  (COND
                   ((SPADCALL |u1| |u2| (QREFELT % 15))
                    (SEQ (LETT |r| (SPADCALL |c1| |c2| (QREFELT % 16)))
                         (EXIT
                          (COND
                           ((SPADCALL |r| (|spadConstant| % 10) (QREFELT % 17))
                            (|LEXP;ident| (CDR |l1|) (CDR |l2|) %))
                           (#6#
                            (CONS (SPADCALL |c1| |c2| (QREFELT % 12))
                                  (|LEXP;ident| (CDR |l1|) (CDR |l2|) %)))))))
                   ((SPADCALL |u1| |u2| (QREFELT % 18))
                    (CONS (SPADCALL (|spadConstant| % 10) |c2| (QREFELT % 12))
                          (|LEXP;ident| |l1| (CDR |l2|) %)))
                   (#6#
                    (CONS (SPADCALL |c1| (|spadConstant| % 10) (QREFELT % 12))
                          (|LEXP;ident| (CDR |l1|) |l2| %))))))))))) 

(SDEFUN |LEXP;compareTerm1s|
        ((|u| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))
         (|v| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))
         (% (|Boolean|)))
        (SPADCALL (QCAR |v|) (QCAR |u|) (QREFELT % 18))) 

(SDEFUN |LEXP;out|
        ((|t| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))
         (% (|OutputForm|)))
        (COND
         ((SPADCALL (QCDR |t|) (|spadConstant| % 19) (QREFELT % 17))
          (SPADCALL (SPADCALL (|STR_to_CHAR| "e") (QREFELT % 22))
                    (SPADCALL (QCAR |t|) (QREFELT % 23)) (QREFELT % 24)))
         ('T
          (SPADCALL (SPADCALL (|STR_to_CHAR| "e") (QREFELT % 22))
                    (SPADCALL (SPADCALL (QCDR |t|) (QREFELT % 25))
                              (SPADCALL (QCAR |t|) (QREFELT % 23))
                              (QREFELT % 26))
                    (QREFELT % 24))))) 

(SDEFUN |LEXP;identification;2%L;4|
        ((|x| (%)) (|y| (%)) (% (|List| (|Equation| R))))
        (SPROG
         ((|l1|
           #1=(|List|
               (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (|l2| #1#))
         (SEQ (LETT |l1| (SPADCALL |x| (QREFELT % 29)))
              (LETT |l2| (SPADCALL |y| (QREFELT % 29)))
              (EXIT (|LEXP;ident| |l1| |l2| %))))) 

(SDEFUN |LEXP;LyndonCoordinates;%L;5|
        ((|x| (%))
         (% (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))))
        (SPROG
         ((#1=#:G49 NIL) (|t| NIL) (#2=#:G50 NIL)
          (|l| (|Union| (|LyndonWord| |VarSet|) #3="failed")) (#4=#:G40 NIL)
          (|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))))
         (SEQ
          (LETT |lt|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# (SPADCALL |x| (QREFELT % 34)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((QEQCAR
                           (LETT |l| (SPADCALL (QCAR |t|) (QREFELT % 37))) 0)
                          (LETT #1#
                                (CONS
                                 (CONS
                                  (PROG2 (LETT #4# |l|)
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 0)
                                                    (|LyndonWord|
                                                     (QREFELT % 6))
                                                    (|Union|
                                                     (|LyndonWord|
                                                      (QREFELT % 6))
                                                     #3#)
                                                    #4#))
                                  (QCDR |t|))
                                 #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (LETT |lt|
                 (SPADCALL (CONS (|function| |LEXP;compareTerm1s|) %) |lt|
                           (QREFELT % 39))))))) 

(SDEFUN |LEXP;*;3%;6| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G52 NIL))
               (SPADCALL |x| |y|
                         (PROG1 (LETT #1# (QREFELT % 8))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT % 41)))) 

(SDEFUN |LEXP;exp;Lp%;7| ((|p| (|LiePolynomial| |VarSet| R)) (% (%)))
        (SPROG ((#1=#:G55 NIL))
               (SPADCALL (SPADCALL |p| (QREFELT % 44))
                         (PROG1 (LETT #1# (QREFELT % 8))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT % 45)))) 

(SDEFUN |LEXP;log;%Lp;8| ((|p| (%)) (% (|LiePolynomial| |VarSet| R)))
        (SPROG ((#1=#:G60 NIL) (#2=#:G65 NIL))
               (PROG2
                   (LETT #2#
                         (SPADCALL
                          (SPADCALL |p|
                                    (PROG1 (LETT #1# (QREFELT % 8))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT % 47))
                          (QREFELT % 49)))
                   (QCDR #2#)
                 (|check_union2| (QEQCAR #2# 0)
                                 (|LiePolynomial| (QREFELT % 6) (QREFELT % 7))
                                 (|Union|
                                  (|LiePolynomial| (QREFELT % 6) (QREFELT % 7))
                                  "failed")
                                 #2#)))) 

(SDEFUN |LEXP;coerce;%Of;9| ((|p| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (#1=#:G77 NIL) (|t| NIL) (#2=#:G78 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 51) (QREFELT % 52))
            (SPADCALL (|spadConstant| % 19) (QREFELT % 25)))
           ('T
            (SEQ (LETT |lt| (SPADCALL |p| (QREFELT % 29)))
                 (EXIT
                  (SPADCALL (ELT % 26)
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |t| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1# (CONS (|LEXP;out| |t| %) #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#))))
                            (QREFELT % 55))))))))) 

(SDEFUN |LEXP;LyndonBasis;LL;10|
        ((|lv| (|List| |VarSet|)) (% (|List| (|LiePolynomial| |VarSet| R))))
        (SPROG ((#1=#:G82 NIL) (|l| NIL) (#2=#:G83 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |l| NIL)
                      (LETT #2# (SPADCALL |lv| (QREFELT % 8) (QREFELT % 60)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |l| (QREFELT % 61)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(MAKEPROP '|LEXP;coerce;%Xpbwp;11| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |LEXP;coerce;%Xpbwp;11| ((|p| (%)) (% (|XPBWPolynomial| |VarSet| R)))
        |p|) 

(SDEFUN |LEXP;inv;2%;12| ((|x| (%)) (% (%)))
        (SPROG
         ((#1=#:G91 NIL) (|t| NIL) (#2=#:G92 NIL)
          (|lt|
           (|List|
            (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
                      (|:| |c| R)))))
         (SEQ
          (COND
           ((SPADCALL |x| (|spadConstant| % 51) (QREFELT % 52))
            (|spadConstant| % 51))
           ('T
            (SEQ
             (LETT |lt|
                   (SPADCALL (SPADCALL |x| (QREFELT % 65)) (QREFELT % 34)))
             (LETT |lt|
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS
                                  (CONS (QCAR |t|)
                                        (COND
                                         ((ODDP
                                           (SPADCALL (QCAR |t|)
                                                     (QREFELT % 66)))
                                          (SPADCALL (QCDR |t|) (QREFELT % 67)))
                                         ('T (QCDR |t|))))
                                  #1#))))
                         (LETT #2# (CDR #2#)) (GO G190) G191
                         (EXIT (NREVERSE #1#)))))
             (EXIT |lt|))))))) 

(DECLAIM (NOTINLINE |LieExponentials;|)) 

(DEFUN |LieExponentials;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 |#3|)
          (LETT |dv$| (LIST '|LieExponentials| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 73))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LieExponentials|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|XPBWPolynomial| |#1| |#2|))
          %))) 

(DEFUN |LieExponentials| (&REST #1=#:G96)
  (SPROG NIL
         (PROG (#2=#:G97)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|LieExponentials|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LieExponentials;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LieExponentials|)))))))))) 

(MAKEPROP '|LieExponentials| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XPBWPolynomial| 6 7) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |0|) (|Equation| 7)
              (4 . |equation|) (|Boolean|) (|LyndonWord| 6) (10 . =) (16 . -)
              (22 . =) (28 . |lexico|) (34 . |1|) (|OutputForm|) (|Character|)
              (38 . |coerce|) (43 . |coerce|) (48 . ^) (54 . |coerce|) (59 . *)
              (|Record| (|:| |k| 14) (|:| |c| 7)) (|List| 27)
              |LEXP;LyndonCoordinates;%L;5| (|List| 11)
              |LEXP;identification;2%L;4| (|Record| (|:| |k| 36) (|:| |c| 7))
              (|List| 32) (65 . |listOfTerms|) (|Union| 14 '"failed")
              (|PoincareBirkhoffWittLyndonBasis| 6) (70 . |retractIfCan|)
              (|Mapping| 13 27 27) (75 . |sort|) (|NonNegativeInteger|)
              (81 . |product|) |LEXP;*;3%;6| (|LiePolynomial| 6 7)
              (88 . |coerce|) (93 . |exp|) |LEXP;exp;Lp%;7| (99 . |log|)
              (|Union| 43 '"failed") (105 . |LiePolyIfCan|) |LEXP;log;%Lp;8|
              (110 . |1|) (114 . =) (|Mapping| 20 20 20) (|List| 20)
              (120 . |reduce|) |LEXP;coerce;%Of;9| (|List| %) (|List| 6)
              (|PositiveInteger|) (126 . |LyndonWordsList|) (132 . |LiePoly|)
              (|List| 43) |LEXP;LyndonBasis;LL;10| |LEXP;coerce;%Xpbwp;11|
              (137 . |mirror|) (142 . |length|) (147 . -) |LEXP;inv;2%;12|
              (|String|) (|Union| % '"failed") (|Integer|)
              (|XDistributedPolynomial| 6 7))
           '#(~= 152 |varList| 158 |sample| 163 |rightRecip| 167 |rightPower|
              172 |recip| 184 |one?| 189 |mirror| 194 |log| 199 |listOfTerms|
              204 |leftRecip| 209 |leftPower| 214 |latex| 226 |inv| 231
              |identification| 236 |exp| 242 |conjugate| 247 |commutator| 253
              |coerce| 259 ^ 274 |LyndonCoordinates| 292 |LyndonBasis| 297 =
              302 |1| 308 / 312 * 318)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| NIL |MagmaWithUnit&| NIL |Magma&| |SetCategory&|
                     NIL |BasicType&| NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|MagmaWithUnit|) (|SemiGroup|)
                      (|Magma|) (|SetCategory|) (|CoercibleTo| 20)
                      (|BasicType|) (|TwoSidedRecip|) (|unitsKnown|))
                   (|makeByteWordVec2| 72
                                       '(0 7 0 10 2 11 0 7 7 12 2 14 13 0 0 15
                                         2 7 0 0 0 16 2 7 13 0 0 17 2 14 13 0 0
                                         18 0 7 0 19 1 21 20 0 22 1 14 20 0 23
                                         2 20 0 0 0 24 1 7 20 0 25 2 20 0 0 0
                                         26 1 0 33 0 34 1 36 35 0 37 2 28 0 38
                                         0 39 3 9 0 0 0 40 41 1 9 0 43 44 2 9 0
                                         0 40 45 2 9 0 0 40 47 1 9 48 0 49 0 0
                                         0 51 2 0 13 0 0 52 2 54 20 53 0 55 2
                                         14 57 58 59 60 1 43 0 14 61 1 0 0 0 65
                                         1 36 40 0 66 1 7 0 0 67 2 0 13 0 0 1 1
                                         0 58 0 1 0 0 0 1 1 0 70 0 1 2 0 0 0 59
                                         1 2 0 0 0 40 1 1 0 70 0 1 1 0 13 0 1 1
                                         0 0 0 65 1 0 43 0 50 1 0 33 0 34 1 0
                                         70 0 1 2 0 0 0 59 1 2 0 0 0 40 1 1 0
                                         69 0 1 1 0 0 0 68 2 0 30 0 0 31 1 0 0
                                         43 46 2 0 0 0 0 1 2 0 0 0 0 1 1 0 20 0
                                         56 1 0 72 0 1 1 0 5 0 64 2 0 0 0 59 1
                                         2 0 0 0 40 1 2 0 0 0 71 1 1 0 28 0 29
                                         1 0 62 58 63 2 0 13 0 0 52 0 0 0 51 2
                                         0 0 0 0 1 2 0 0 0 0 42)))))
           '|lookupComplete|)) 
