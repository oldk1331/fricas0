
(SDEFUN |FILE;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT % 10))) 

(SDEFUN |FILE;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |f| 0) (QREFELT % 13))) 

(SDEFUN |FILE;open;Fn%;3| ((|fname| (|FileName|)) (% (%)))
        (SPADCALL |fname| "input" (QREFELT % 16))) 

(SDEFUN |FILE;openIfCan;FnU;4|
        ((|fname| (|FileName|)) (% (|Union| % "failed")))
        (SPADCALL |fname| "input" (QREFELT % 19))) 

(SDEFUN |FILE;open;FnS%;5| ((|fname| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|fstream| (|BasicFile|)))
               (SEQ (LETT |fstream| (SPADCALL |fname| |mode| (QREFELT % 22)))
                    (EXIT (VECTOR |fname| |fstream| |mode|))))) 

(SDEFUN |FILE;openIfCan;FnSU;6|
        ((|fname| (|FileName|)) (|mode| (|String|)) (% (|Union| % "failed")))
        (SPROG ((|res1| (|Union| (|BasicFile|) "failed")))
               (SEQ (LETT |res1| (SPADCALL |fname| |mode| (QREFELT % 23)))
                    (EXIT
                     (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                           ('T
                            (CONS 0 (VECTOR |fname| (QCDR |res1|) |mode|)))))))) 

(SDEFUN |FILE;reopen!;%S%;7| ((|f| (%)) (|mode| (|String|)) (% (%)))
        (SPROG ((|fname| (|FileName|)))
               (SEQ
                (COND
                 ((EQUAL (QVELT |f| 2) "output")
                  (SPADCALL |f| (QREFELT % 25))))
                (LETT |fname| (QVELT |f| 0))
                (QSETVELT |f| 1 (SPADCALL |fname| |mode| (QREFELT % 22)))
                (QSETVELT |f| 2 |mode|) (EXIT |f|)))) 

(SDEFUN |FILE;close!;2%;8| ((|f| (%)) (% (%)))
        (SEQ (SPADCALL (QVELT |f| 1) (QREFELT % 27)) (QSETVELT |f| 2 "closed")
             (EXIT |f|))) 

(MAKEPROP '|FILE;name;%Fn;9| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |FILE;name;%Fn;9| ((|f| (%)) (% (|FileName|))) (QVELT |f| 0)) 

(MAKEPROP '|FILE;iomode;%S;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |FILE;iomode;%S;10| ((|f| (%)) (% (|String|))) (QVELT |f| 2)) 

(SDEFUN |FILE;read!;%S;11| ((|f| (%)) (% (S)))
        (COND
         ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 31))
          (|error| "File not in read state"))
         ('T (SPADCALL (QVELT |f| 1) (QREFELT % 33))))) 

(SDEFUN |FILE;readIfCan!;%U;12| ((|f| (%)) (% (|Union| S "failed")))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 31))
                  (|error| "File not in read state"))
                 (#1='T
                  (SEQ (LETT |res1| (SPADCALL (QVELT |f| 1) (QREFELT % 36)))
                       (EXIT
                        (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                              (#1# (CONS 0 (QCDR |res1|))))))))))) 

(SDEFUN |FILE;write!;%2S;13| ((|f| (%)) (|x| (S)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 31))
           (|error| "File not in write state"))
          ('T (SEQ (SPADCALL (QVELT |f| 1) |x| (QREFELT % 39)) (EXIT |x|)))))) 

(SDEFUN |FILE;flush;%V;14| ((|f| (%)) (% (|Void|)))
        (COND
         ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 31))
          (|error| "File not in write state"))
         ('T (SPADCALL (QVELT |f| 1) (QREFELT % 41))))) 

(DECLAIM (NOTINLINE |File;|)) 

(DEFUN |File;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|File| DV$1))
          (LETT % (GETREFV 42))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|File| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|BasicFile|))
                              (|:| |fileIOmode| (|String|))))
          %))) 

(DEFUN |File| (#1=#:G63)
  (SPROG NIL
         (PROG (#2=#:G64)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|File|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|File;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|File|)))))))))) 

(MAKEPROP '|File| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (|FileName|) (0 . =) |FILE;=;2%B;1| (|OutputForm|) (6 . |coerce|)
              |FILE;coerce;%Of;2| (|String|) |FILE;open;FnS%;5|
              |FILE;open;Fn%;3| (|Union| % '"failed") |FILE;openIfCan;FnSU;6|
              |FILE;openIfCan;FnU;4| (|BasicFile|) (11 . |open|)
              (17 . |openIfCan|) (|Void|) |FILE;flush;%V;14|
              |FILE;reopen!;%S%;7| (23 . |close!|) |FILE;close!;2%;8|
              |FILE;name;%Fn;9| |FILE;iomode;%S;10| (28 . ~=) (|None|)
              (34 . |read|) |FILE;read!;%S;11| (|Union| 32 '"failed")
              (39 . |readIfCan|) (|Union| 6 '"failed") |FILE;readIfCan!;%U;12|
              (44 . |write!|) |FILE;write!;%2S;13| (50 . |flush|))
           '#(~= 55 |write!| 61 |reopen!| 67 |readIfCan!| 73 |read!| 78
              |openIfCan| 83 |open| 94 |name| 105 |latex| 110 |iomode| 115
              |flush| 120 |coerce| 125 |close!| 130 = 135)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FileCategory| 9 6) (|SetCategory|)
                           (|CoercibleTo| 12) (|BasicType|))
                        (|makeByteWordVec2| 41
                                            '(2 9 8 0 0 10 1 9 12 0 13 2 21 0 9
                                              15 22 2 21 18 9 15 23 1 21 24 0
                                              27 2 15 8 0 0 31 1 21 32 0 33 1
                                              21 35 0 36 2 21 24 0 32 39 1 21
                                              24 0 41 2 0 8 0 0 1 2 0 6 0 6 40
                                              2 0 0 0 15 26 1 0 37 0 38 1 0 6 0
                                              34 1 0 18 9 20 2 0 18 9 15 19 1 0
                                              0 9 17 2 0 0 9 15 16 1 0 9 0 29 1
                                              0 15 0 1 1 0 15 0 30 1 0 24 0 25
                                              1 0 12 0 14 1 0 0 0 28 2 0 8 0 0
                                              11)))))
           '|lookupComplete|)) 
