
(SDEFUN |JBSA;setNotation;2S;1| ((|s| (|Symbol|)) (% (|Symbol|)))
        (SEQ
         (SPADCALL
          (SPADCALL "only repeated index notation possible" (QREFELT % 34))
          (QREFELT % 36))
         (EXIT '|Repeated|))) 

(MAKEPROP '|JBSA;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBSA;getNotation;S;2| ((% (|Symbol|))) '|Repeated|) 

(SDEFUN |JBSA;multiIndex;%L;3| ((|jv| (%)) (% (|List| (|NonNegativeInteger|))))
        (SPADCALL |jv| (QREFELT % 40))) 

(SDEFUN |JBSA;index;%Pi;4| ((|jv| (%)) (% (|PositiveInteger|)))
        (SPADCALL |jv| (QREFELT % 42))) 

(SDEFUN |JBSA;type;%S;5| ((|jv| (%)) (% (|Symbol|)))
        (SPADCALL |jv| (QREFELT % 44))) 

(SDEFUN |JBSA;X;Pi%;6| ((|up| (|PositiveInteger|)) (% (%)))
        (SPADCALL |up| (QREFELT % 46))) 

(SDEFUN |JBSA;U;Pi%;7| ((|up| (|PositiveInteger|)) (% (%)))
        (SPADCALL |up| (QREFELT % 48))) 

(SDEFUN |JBSA;Pm;PiL%;8|
        ((|up| (|PositiveInteger|)) (|lo| (|List| (|NonNegativeInteger|)))
         (% (%)))
        (SPADCALL |up| |lo| (QREFELT % 50))) 

(SDEFUN |JBSA;coerce;S%;9| ((|s| (|Symbol|)) (% (%)))
        (SPADCALL |s| (QREFELT % 52))) 

(SDEFUN |JBSA;D;SL%;10| ((|u| (|Symbol|)) (|der| (|List| (|Symbol|))) (% (%)))
        (SPADCALL |u| |der| (QREFELT % 54))) 

(SDEFUN |JBSA;1;%;11| ((% (%))) (|spadConstant| % 56)) 

(SDEFUN |JBSA;numIndVar;Pi;12| ((% (|PositiveInteger|)))
        (+ (QREFELT % 11) (QREFELT % 13))) 

(SDEFUN |JBSA;numDepVar;Pi;13| ((% (|PositiveInteger|)))
        (+ (QREFELT % 11) (QREFELT % 13))) 

(SDEFUN |JBSA;name;%S;14| ((|jv| (%)) (% (|Symbol|)))
        (SPADCALL |jv| (QREFELT % 59))) 

(SDEFUN |JBSA;coerce;%E;15| ((|jv| (%)) (% (|Expression| (|Integer|))))
        (SPADCALL |jv| (QREFELT % 62))) 

(DECLAIM (NOTINLINE |JetBundleSymAna;|)) 

(DEFUN |JetBundleSymAna;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL)
    (#1=#:G46 NIL) (#2=#:G47 NIL) (#3=#:G11 NIL) (#4=#:G48 NIL) (#5=#:G49 NIL)
    (#6=#:G15 NIL) (#7=#:G50 NIL) (|jv| NIL) (#8=#:G51 NIL) (#9=#:G52 NIL)
    (#10=#:G53 NIL) (#11=#:G54 NIL) (|i| NIL) (#12=#:G55 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 |#2|)
     (LETT DV$3 |#3|)
     (LETT |dv$| (LIST '|JetBundleSymAna| DV$1 DV$2 DV$3))
     (LETT % (GETREFV 71))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
     (|haddProp| |$ConstructorCache| '|JetBundleSymAna| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (QSETREFV % 8 |#3|)
     (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 11 (SPADCALL (QREFELT % 10)))
     (QSETREFV % 13 (SPADCALL (QREFELT % 12)))
     (QSETREFV % 18
               (SPADCALL
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 11)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #3# |i|)
                                  (|check_subtype2| (> #3# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                (QREFELT % 14))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 13)) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #6# |i|)
                                  (|check_subtype2| (> #6# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #6#))
                                (QREFELT % 15))
                               #4#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT % 17)))
     (QSETREFV % 21
               (PROGN
                (LETT #7# NIL)
                (SEQ (LETT |jv| NIL) (LETT #8# (QREFELT % 18)) G190
                     (COND
                      ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #7# (CONS (SPADCALL |jv| (QREFELT % 20)) #7#))))
                     (LETT #8# (CDR #8#)) (GO G190) G191
                     (EXIT (NREVERSE #7#)))))
     (QSETREFV % 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((> (QREFELT % 11) 1)
         (SETELT % 22
                 (PROGN
                  (LETT #9# NIL)
                  (SEQ (LETT |i| 1) (LETT #10# (QREFELT % 11)) G190
                       (COND ((|greater_SI| |i| #10#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #9#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT % 27)))
                                          (QREFELT % 29))
                                #9#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #9#))))))
        ('T (SETELT % 22 (LIST (QCDR |#2|))))))
      ('T (SETELT % 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((> (QREFELT % 13) 1)
         (SETELT % 22
                 (SPADCALL (QREFELT % 22)
                           (PROGN
                            (LETT #11# NIL)
                            (SEQ (LETT |i| 1) (LETT #12# (QREFELT % 13)) G190
                                 (COND ((|greater_SI| |i| #12#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #11#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT % 27)))
                                                    (QREFELT % 29))
                                          #11#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #11#))))
                           (QREFELT % 31))))
        ('T
         (SETELT % 22
                 (SPADCALL (QREFELT % 22) (LIST (QCDR |#3|))
                           (QREFELT % 31))))))
      ('T (SETELT % 22 (SPADCALL (QREFELT % 22) (QCDR |#3|) (QREFELT % 31)))))
     (QSETREFV % 32 (|JetBundle| (QREFELT % 21) (QREFELT % 22)))
     %)))) 

(DEFUN |JetBundleSymAna| (&REST #1=#:G56)
  (SPROG NIL
         (PROG (#2=#:G57)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|JetBundleSymAna|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleSymAna;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleSymAna|)))))))))) 

(MAKEPROP '|JetBundleSymAna| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBSA;1;%;11|) %))
              (29 . |1|) (|OutputForm|) (|NonNegativeInteger|) (33 . |coerce|)
              (|List| 25) (38 . |superscript|) (|List| 19) (44 . |append|)
              '|Rep| (|String|) (50 . |message|) (|Void|) (55 . |print|)
              |JBSA;setNotation;2S;1| |JBSA;getNotation;S;2| (|List| 26)
              (60 . |multiIndex|) |JBSA;multiIndex;%L;3| (65 . |index|)
              |JBSA;index;%Pi;4| (70 . |type|) |JBSA;type;%S;5| (75 . X)
              |JBSA;X;Pi%;6| (80 . U) |JBSA;U;Pi%;7| (85 . |Pm|)
              |JBSA;Pm;PiL%;8| (91 . |coerce|) |JBSA;coerce;S%;9| (96 . D)
              |JBSA;D;SL%;10| (102 . |1|) |JBSA;numIndVar;Pi;12|
              |JBSA;numDepVar;Pi;13| (106 . |name|) |JBSA;name;%S;14|
              (|Expression| 70) (111 . |coerce|) |JBSA;coerce;%E;15|
              (|Boolean|) (|List| 9) (|List| 65) (|Union| % '"0")
              (|Union| % '"failed") (|List| %) (|Integer|))
           '#(~= 116 |weight| 122 |variables| 127 |type| 138 |smaller?| 143
              |sign| 149 |setNotation| 154 |repeatedIndex| 159 |r2m| 164
              |positive?| 169 |order| 174 |one?| 179 |numIndVar| 184
              |numDepVar| 188 |negative?| 192 |name| 197 |multiIndex| 202 |min|
              207 |max| 213 |m2r| 219 |latex| 224 |integrateIfCan| 229
              |integrate| 235 |index| 241 |getNotation| 246 |dimS| 250 |dimJ|
              255 |differentiate| 260 |derivativeOf?| 266 |coerce| 272 |class|
              287 |allRepeated| 297 X 302 U 311 |Pr| 320 |Pm| 326 P 332 D 354
              >= 360 > 366 = 372 <= 378 < 384 |1| 390)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 25) (|PartialOrder|)
                      (|CoercibleTo| 61) (|JetBundleOperationsCategory|))
                   (|makeByteWordVec2| 70
                                       '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6 0 9
                                         15 2 16 0 0 0 17 1 6 19 0 20 0 6 0 24
                                         1 26 25 0 27 2 19 0 0 28 29 2 30 0 0 0
                                         31 1 25 0 33 34 1 25 35 0 36 1 32 39 0
                                         40 1 32 9 0 42 1 32 19 0 44 1 32 0 9
                                         46 1 32 0 9 48 2 32 0 9 39 50 1 32 0
                                         19 52 2 32 0 19 30 54 0 32 0 56 1 32
                                         19 0 59 1 32 61 0 62 2 0 64 0 0 1 1 0
                                         26 0 1 2 0 69 26 9 1 1 0 69 26 1 1 0
                                         19 0 45 2 0 64 0 0 1 1 1 70 0 1 1 0 19
                                         19 37 1 0 65 0 1 1 0 39 65 1 1 1 64 0
                                         1 1 0 26 0 1 1 0 64 0 1 0 0 9 57 0 0 9
                                         58 1 1 64 0 1 1 0 19 0 60 1 0 39 0 41
                                         2 0 0 0 0 1 2 0 0 0 0 1 1 0 65 39 1 1
                                         0 33 0 1 2 0 68 0 9 1 2 0 0 0 9 1 1 0
                                         9 0 43 0 0 19 38 1 0 26 26 1 1 0 26 26
                                         1 2 0 67 0 9 1 2 0 39 0 0 1 1 0 25 0 1
                                         1 0 61 0 63 1 0 0 19 53 1 0 26 39 1 1
                                         0 26 0 1 1 0 66 39 1 0 0 0 1 1 0 0 9
                                         47 0 0 0 1 1 0 0 9 49 2 0 0 9 65 1 2 0
                                         0 9 39 51 2 0 0 9 26 1 1 0 0 26 1 1 0
                                         0 39 1 2 0 0 9 39 1 2 0 0 19 30 55 2 0
                                         64 0 0 1 2 0 64 0 0 1 2 0 64 0 0 1 2 0
                                         64 0 0 1 2 0 64 0 0 1 0 0 0 23)))))
           '|lookupComplete|)) 
