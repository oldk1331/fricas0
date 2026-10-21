
(MAKEPROP '|GENMOEBF;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |GENMOEBF;rep| ((|x| (%)) (% (|Rep|))) |x|) 

(MAKEPROP '|GENMOEBF;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |GENMOEBF;per| ((|r| (|Rep|)) (% (%))) |r|) 

(SDEFUN |GENMOEBF;members;%L;3| ((|mf| (%)) (% (|List| P)))
        (QVELT (|GENMOEBF;rep| |mf| %) 2)) 

(SDEFUN |GENMOEBF;generalizedMoebiusFunction;LM%;4|
        ((|xx| (|List| P)) (|z| (|Mapping| R P P)) (% (%)))
        (SPROG
         ((|xxo| (|List| P)) (#1=#:G24 NIL) (|y| NIL) (#2=#:G25 NIL)
          (#3=#:G26 NIL) (|x| NIL) (#4=#:G27 NIL) (|zf| (|Matrix| R))
          (|mf| (|Union| (|Matrix| R) "failed")) (#5=#:G23 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xxo|
                  (SPADCALL (SPADCALL (ELT % 12) |xx| (QREFELT % 15))
                            (QREFELT % 16)))
            (LETT |zf|
                  (SPADCALL
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |y| NIL) (LETT #2# |xxo|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |x| NIL) (LETT #4# |xxo|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |x| (CAR #4#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |y| |x|
                                                             (QREFELT % 12))
                                                   (SPADCALL |x| |y| |z|))
                                                  ('T (|spadConstant| % 17)))
                                                 #3#))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#))))
                                  #1#))))
                         (LETT #2# (CDR #2#)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))
                   (QREFELT % 20)))
            (LETT |mf| (SPADCALL |zf| (QREFELT % 22)))
            (EXIT
             (COND ((QEQCAR |mf| 1) (|error| "zeta not invertible"))
                   ('T
                    (PROGN
                     (LETT #5#
                           (|GENMOEBF;per| (VECTOR |zf| (QCDR |mf|) |xxo|) %))
                     (GO #6=#:G22)))))))
          #6# (EXIT #5#)))) 

(SDEFUN |GENMOEBF;canonicalZeta| ((|pi| (P)) (|si| (P)) (% (R)))
        (SPROG ((#1=#:G30 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |pi| |si| (QREFELT % 12))
                    (PROGN (LETT #1# (|spadConstant| % 25)) (GO #2=#:G29))))
                  (EXIT (|spadConstant| % 17))))
                #2# (EXIT #1#)))) 

(SDEFUN |GENMOEBF;apply;%2PR;6| ((|mf| (%)) (|x| (P)) (|y| (P)) (% (R)))
        (SPROG
         ((|mfn| (|Matrix| R)) (|kx| #1=(|Integer|)) (|ky| #1#) (#2=#:G35 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |mfn| (QVELT (|GENMOEBF;rep| |mf| %) 1))
                (LETT |kx|
                      (SPADCALL |x| (SPADCALL |mf| (QREFELT % 10))
                                (QREFELT % 27)))
                (LETT |ky|
                      (SPADCALL |y| (SPADCALL |mf| (QREFELT % 10))
                                (QREFELT % 27)))
                (COND
                 ((OR (ZEROP |kx|) (ZEROP |ky|))
                  (EXIT (|error| "not members"))))
                (EXIT
                 (PROGN
                  (LETT #2# (SPADCALL |mfn| |ky| |kx| (QREFELT % 28)))
                  (GO #3=#:G34)))))
          #3# (EXIT #2#)))) 

(SDEFUN |GENMOEBF;moebiusMatrix;%M;7| ((|mf| (%)) (% (|Matrix| R)))
        (QVELT (|GENMOEBF;rep| |mf| %) 1)) 

(SDEFUN |GENMOEBF;zetaMatrix| ((|mf| (%)) (% (|Matrix| R)))
        (QVELT (|GENMOEBF;rep| |mf| %) 0)) 

(SDEFUN |GENMOEBF;coerce| ((|mf| (%)) (% (|OutputForm|)))
        (SPADCALL "m" (QREFELT % 33))) 

(DECLAIM (NOTINLINE |GeneralizedFiniteMoebiusFunction;|)) 

(DEFUN |GeneralizedFiniteMoebiusFunction;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GeneralizedFiniteMoebiusFunction| DV$1 DV$2))
          (LETT % (GETREFV 34))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GeneralizedFiniteMoebiusFunction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |zmatrix| (|Matrix| |#2|))
                              (|:| |mmatrix| (|Matrix| |#2|))
                              (|:| |indices| (|List| |#1|))))
          %))) 

(DEFUN |GeneralizedFiniteMoebiusFunction| (&REST #1=#:G39)
  (SPROG NIL
         (PROG (#2=#:G40)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralizedFiniteMoebiusFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralizedFiniteMoebiusFunction;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralizedFiniteMoebiusFunction|)))))))))) 

(MAKEPROP '|GeneralizedFiniteMoebiusFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|List| 6) |GENMOEBF;members;%L;3| (|Boolean|) (0 . <=)
              (|Mapping| 11 6 6) (|ListPackage| 6) (6 . |topologicalSort|)
              (12 . |removeDuplicates|) (17 . |0|) (|List| (|List| 7))
              (|Matrix| 7) (21 . |matrix|) (|Union| % '"failed")
              (26 . |inverse|) (|Mapping| 7 6 6)
              |GENMOEBF;generalizedMoebiusFunction;LM%;4| (31 . |1|)
              (|Integer|) (35 . |position|) (41 . |elt|)
              |GENMOEBF;apply;%2PR;6| |GENMOEBF;moebiusMatrix;%M;7| (|String|)
              (|OutputForm|) (48 . |message|))
           '#(|moebiusMatrix| 53 |members| 58 |generalizedMoebiusFunction| 63
              |canonicalMoebiusFunction| 69 |apply| 74)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|generalizedMoebiusFunction|
                                 ($$ (|List| |#1|) (|Mapping| |#2| |#1| |#1|)))
                                T)
                              '((|canonicalMoebiusFunction| ($$ (|List| |#1|)))
                                T)
                              '((|apply| (|#2| $$ |#1| |#1|)) T)
                              '((|members| ((|List| |#1|) $$)) T)
                              '((|moebiusMatrix| ((|Matrix| |#2|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 33
                                            '(2 6 11 0 0 12 2 14 9 13 9 15 1 9
                                              0 0 16 0 7 0 17 1 19 0 18 20 1 19
                                              21 0 22 0 7 0 25 2 9 26 6 0 27 3
                                              19 7 0 26 26 28 1 32 0 31 33 1 0
                                              19 0 30 1 0 9 0 10 2 0 0 9 23 24
                                              1 0 0 9 1 3 0 7 0 6 6 29)))))
           '|lookupComplete|)) 
