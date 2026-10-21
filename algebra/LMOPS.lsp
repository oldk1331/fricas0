
(SDEFUN |LMOPS;length;%E;1| ((|x| (%)) (% (E)))
        (SPROG ((#1=#:G25 NIL) (|f| NIL) (#2=#:G26 NIL))
               (SEQ
                (SPADCALL (ELT % 14)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |f| NIL)
                                (LETT #2# (SPADCALL |x| (QREFELT % 12))) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |f| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #1# (CONS (QCDR |f|) #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (|spadConstant| % 13) (QREFELT % 17))))) 

(MAKEPROP '|LMOPS;makeUnit;%;2| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LMOPS;makeUnit;%;2| ((% (%))) NIL) 

(SDEFUN |LMOPS;size;%Nni;3| ((|l| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |l| (QREFELT % 12)))) 

(SDEFUN |LMOPS;coerce;S%;4| ((|s| (S)) (% (%))) (LIST (CONS |s| (QREFELT % 8)))) 

(SDEFUN |LMOPS;coerce;%Of;5| ((|l| (%)) (% (|OutputForm|)))
        (SPADCALL |l| (QREFELT % 24))) 

(SDEFUN |LMOPS;makeTerm;SE%;6| ((|s| (S)) (|e| (E)) (% (%)))
        (COND ((SPADCALL |e| (QREFELT % 27)) (SPADCALL (QREFELT % 19)))
              ('T (LIST (CONS |s| |e|))))) 

(MAKEPROP '|LMOPS;makeMulti;L%;7| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LMOPS;makeMulti;L%;7|
        ((|l| (|List| (|Record| (|:| |gen| S) (|:| |exp| E)))) (% (%))) |l|) 

(SDEFUN |LMOPS;=;2%B;8| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPADCALL |f| |g| (QREFELT % 30))) 

(MAKEPROP '|LMOPS;listOfMonoms;%L;9| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LMOPS;listOfMonoms;%L;9|
        ((|l| (%)) (% (|List| (|Record| (|:| |gen| S) (|:| |exp| E))))) |l|) 

(SDEFUN |LMOPS;nthExpon;%IE;10| ((|f| (%)) (|i| (|Integer|)) (% (E)))
        (QCDR (SPADCALL |f| (+ (- |i| 1) (PROGN |f| 1)) (QREFELT % 33)))) 

(SDEFUN |LMOPS;nthFactor;%IS;11| ((|f| (%)) (|i| (|Integer|)) (% (S)))
        (QCAR (SPADCALL |f| (+ (- |i| 1) (PROGN |f| 1)) (QREFELT % 33)))) 

(MAKEPROP '|LMOPS;reverse;2%;12| '|SPADreplace| 'REVERSE) 

(SDEFUN |LMOPS;reverse;2%;12| ((|l| (%)) (% (%))) (REVERSE |l|)) 

(MAKEPROP '|LMOPS;reverse!;2%;13| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LMOPS;reverse!;2%;13| ((|l| (%)) (% (%))) (NREVERSE |l|)) 

(SDEFUN |LMOPS;mapGen;M2%;14| ((|f| (|Mapping| S S)) (|l| (%)) (% (%)))
        (SPROG ((#1=#:G56 NIL) (|x| NIL) (#2=#:G57 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |l|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (CONS (SPADCALL (QCAR |x|) |f|) (QCDR |x|))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |LMOPS;mapExpon;M2%;15| ((|f| (|Mapping| E E)) (|l| (%)) (% (%)))
        (SPROG
         ((|x| NIL) (#1=#:G65 NIL) (|a| (E))
          (|ans| (|List| (|Record| (|:| |gen| S) (|:| |exp| E)))))
         (SEQ (LETT |ans| NIL)
              (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |a| (SPADCALL (QCDR |x|) |f|))
                                 (|spadConstant| % 13) (QREFELT % 40))
                       (LETT |ans| (CONS (CONS (QCAR |x|) |a|) |ans|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |ans| (QREFELT % 37)))))) 

(SDEFUN |LMOPS;outputForm;%2MIOf;16|
        ((|l| (%))
         (|op| (|Mapping| (|OutputForm|) (|OutputForm|) (|OutputForm|)))
         (|opexp| (|Mapping| (|OutputForm|) (|OutputForm|) (|OutputForm|)))
         (|id| (|Integer|)) (% (|OutputForm|)))
        (SPROG ((#1=#:G76 NIL) (|p| NIL) (#2=#:G77 NIL))
               (SEQ
                (COND ((NULL |l|) (SPADCALL |id| (QREFELT % 43)))
                      ('T
                       (SEQ
                        (LETT |l|
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |p| NIL) (LETT #2# |l|) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |p| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (COND
                                              ((SPADCALL (QCDR |p|)
                                                         (QREFELT % 8)
                                                         (QREFELT % 44))
                                               (SPADCALL (QCAR |p|)
                                                         (QREFELT % 45)))
                                              ('T
                                               (SPADCALL
                                                (SPADCALL (QCAR |p|)
                                                          (QREFELT % 45))
                                                (SPADCALL (QCDR |p|)
                                                          (QREFELT % 46))
                                                |opexp|)))
                                             #1#))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#)))))
                        (EXIT (SPADCALL |op| |l| (QREFELT % 49))))))))) 

(SDEFUN |LMOPS;retractIfCan;%U;17| ((|l| (%)) (% (|Union| S "failed")))
        (SEQ
         (COND
          ((NULL (NULL |l|))
           (COND
            ((NULL (CDR |l|))
             (COND
              ((SPADCALL (QCDR (|SPADfirst| |l|)) (QREFELT % 8) (QREFELT % 44))
               (EXIT (CONS 0 (QCAR (|SPADfirst| |l|))))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |LMOPS;rightMult;%S%;18| ((|f| (%)) (|s| (S)) (% (%)))
        (SPROG ((|h| (%)))
               (SEQ
                (COND ((NULL |f|) (SPADCALL |s| (QREFELT % 22)))
                      ((SPADCALL |s|
                                 (QCAR (SPADCALL |f| '|last| (QREFELT % 54)))
                                 (QREFELT % 55))
                       (SEQ
                        (SPADCALL (LETT |h| (SPADCALL |f| (QREFELT % 56)))
                                  (CONS |s|
                                        (SPADCALL
                                         (QCDR
                                          (SPADCALL |f| '|last|
                                                    (QREFELT % 54)))
                                         (QREFELT % 8) (QREFELT % 14)))
                                  (QREFELT % 57))
                        (EXIT |h|)))
                      ('T
                       (SPADCALL |f| (CONS |s| (QREFELT % 8))
                                 (QREFELT % 58))))))) 

(SDEFUN |LMOPS;leftMult;S2%;19| ((|s| (S)) (|f| (%)) (% (%)))
        (COND ((NULL |f|) (SPADCALL |s| (QREFELT % 22)))
              ((SPADCALL |s| (QCAR (|SPADfirst| |f|)) (QREFELT % 55))
               (CONS
                (CONS |s|
                      (SPADCALL (QCDR (|SPADfirst| |f|)) (QREFELT % 8)
                                (QREFELT % 14)))
                (CDR |f|)))
              ('T (CONS (CONS |s| (QREFELT % 8)) |f|)))) 

(DECLAIM (NOTINLINE |ListMonoidOps;|)) 

(DEFUN |ListMonoidOps;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 |#3|)
          (LETT |dv$| (LIST '|ListMonoidOps| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 62))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ListMonoidOps|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|List| (|Record| (|:| |gen| |#1|) (|:| |exp| |#2|))))
          %))) 

(DEFUN |ListMonoidOps| (&REST #1=#:G99)
  (SPROG NIL
         (PROG (#2=#:G100)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|ListMonoidOps|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ListMonoidOps;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ListMonoidOps|)))))))))) 

(MAKEPROP '|ListMonoidOps| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (|Record| (|:| |gen| 6) (|:| |exp| 7))
              (|List| 10) |LMOPS;listOfMonoms;%L;9| (0 . |0|) (4 . +)
              (|Mapping| 7 7 7) (|List| 7) (10 . |reduce|) |LMOPS;length;%E;1|
              |LMOPS;makeUnit;%;2| (|NonNegativeInteger|) |LMOPS;size;%Nni;3|
              |LMOPS;coerce;S%;4| (|OutputForm|) (17 . |coerce|)
              |LMOPS;coerce;%Of;5| (|Boolean|) (22 . |zero?|)
              |LMOPS;makeTerm;SE%;6| |LMOPS;makeMulti;L%;7| (27 . =)
              |LMOPS;=;2%B;8| (|Integer|) (33 . |elt|) |LMOPS;nthExpon;%IE;10|
              |LMOPS;nthFactor;%IS;11| |LMOPS;reverse;2%;12|
              |LMOPS;reverse!;2%;13| (|Mapping| 6 6) |LMOPS;mapGen;M2%;14|
              (39 . ~=) (|Mapping| 7 7) |LMOPS;mapExpon;M2%;15| (45 . |coerce|)
              (50 . =) (56 . |coerce|) (61 . |coerce|) (|Mapping| 23 23 23)
              (|List| 23) (66 . |reduce|) |LMOPS;outputForm;%2MIOf;16|
              (|Union| 6 '"failed") |LMOPS;retractIfCan;%U;17| '"last"
              (72 . |elt|) (78 . =) (84 . |copy|) (89 . |setlast!|)
              (95 . |concat|) |LMOPS;rightMult;%S%;18| |LMOPS;leftMult;S2%;19|
              (|String|))
           '#(~= 101 |size| 107 |rightMult| 112 |reverse!| 118 |reverse| 123
              |retractIfCan| 128 |retract| 133 |outputForm| 138 |nthFactor| 146
              |nthExpon| 152 |mapGen| 158 |mapExpon| 164 |makeUnit| 170
              |makeTerm| 174 |makeMulti| 180 |listOfMonoms| 185 |length| 190
              |leftMult| 195 |latex| 201 |coerce| 206 = 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS '#(|RetractableTo&| |SetCategory&| NIL NIL |BasicType&|)
                       (CONS
                        '#((|RetractableTo| 6) (|SetCategory|)
                           (|CoercibleTo| 23) (|CoercibleFrom| 6)
                           (|BasicType|))
                        (|makeByteWordVec2| 61
                                            '(0 7 0 13 2 7 0 0 0 14 3 16 7 15 0
                                              7 17 1 9 23 0 24 1 7 26 0 27 2 9
                                              26 0 0 30 2 9 10 0 32 33 2 7 26 0
                                              0 40 1 32 23 0 43 2 7 26 0 0 44 1
                                              6 23 0 45 1 7 23 0 46 2 48 23 47
                                              0 49 2 9 10 0 53 54 2 6 26 0 0 55
                                              1 9 0 0 56 2 9 10 0 10 57 2 9 0 0
                                              10 58 2 0 26 0 0 1 1 0 20 0 21 2
                                              0 0 0 6 59 1 0 0 0 37 1 0 0 0 36
                                              1 0 51 0 52 1 0 6 0 1 4 0 23 0 47
                                              47 32 50 2 0 6 0 32 35 2 0 7 0 32
                                              34 2 0 0 38 0 39 2 0 0 41 0 42 0
                                              0 0 19 2 0 0 6 7 28 1 0 0 11 29 1
                                              0 11 0 12 1 0 7 0 18 2 0 0 6 0 60
                                              1 0 61 0 1 1 0 23 0 25 1 0 0 6 22
                                              2 0 26 0 0 31)))))
           '|lookupComplete|)) 
