
(SDEFUN |LO;0;%;1| ((% (%))) (CONS (|spadConstant| % 10) (|spadConstant| % 11))) 

(SDEFUN |LO;zero?;%B;2| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (QCAR |x|) (QREFELT % 13))) 

(SDEFUN |LO;-;2%;3| ((|x| (%)) (% (%)))
        (CONS (SPADCALL (QCAR |x|) (QREFELT % 15)) (QCDR |x|))) 

(SDEFUN |LO;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT % 17))
                  (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT % 17))
                  (QREFELT % 18))) 

(MAKEPROP '|LO;numer;%M;5| '|SPADreplace| 'QCAR) 

(SDEFUN |LO;numer;%M;5| ((|x| (%)) (% (M))) (QCAR |x|)) 

(MAKEPROP '|LO;denom;%R;6| '|SPADreplace| 'QCDR) 

(SDEFUN |LO;denom;%R;6| ((|x| (%)) (% (R))) (QCDR |x|)) 

(SDEFUN |LO;+;3%;7| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS
         (SPADCALL (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT % 17))
                   (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT % 17))
                   (QREFELT % 22))
         (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 23)))) 

(SDEFUN |LO;*;I2%;8| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (CONS (SPADCALL |n| (QCAR |x|) (QREFELT % 26)) (QCDR |x|))) 

(SDEFUN |LO;*;R2%;9| ((|r| (R)) (|x| (%)) (% (%)))
        (COND
         ((SPADCALL |r| (QCDR |x|) (QREFELT % 28))
          (CONS (QCAR |x|) (|spadConstant| % 11)))
         ('T (CONS (SPADCALL |r| (QCAR |x|) (QREFELT % 17)) (QCDR |x|))))) 

(SDEFUN |LO;/;%R%;10| ((|x| (%)) (|d| (R)) (% (%)))
        (SPROG ((|u| (R)))
               (COND
                ((SPADCALL (LETT |u| (SPADCALL |d| (QCDR |x|) (QREFELT % 23)))
                           (QREFELT % 30))
                 (|error| "division by zero"))
                ('T (CONS (QCAR |x|) |u|))))) 

(SDEFUN |LO;/;MR%;11| ((|m| (M)) (|d| (R)) (% (%)))
        (COND ((SPADCALL |d| (QREFELT % 30)) (|error| "division by zero"))
              ('T (CONS |m| |d|)))) 

(SDEFUN |LO;coerce;%Of;12| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((|xd| (R)))
               (SEQ (LETT |xd| (QCDR |x|))
                    (EXIT
                     (COND
                      ((SPADCALL |xd| (|spadConstant| % 11) (QREFELT % 28))
                       (SPADCALL (QCAR |x|) (QREFELT % 34)))
                      ('T
                       (SPADCALL (SPADCALL (QCAR |x|) (QREFELT % 34))
                                 (SPADCALL |xd| (QREFELT % 35))
                                 (QREFELT % 36)))))))) 

(DECLAIM (NOTINLINE |Localize;|)) 

(DEFUN |Localize;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G27 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|Localize| DV$1 DV$2))
          (LETT % (GETREFV 42))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (LETT #1#
                                                    (|HasCategory| |#2|
                                                                   '(|AbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               #1#)))))
          (|haddProp| |$ConstructorCache| '|Localize| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 (|Record| (|:| |num| |#1|) (|:| |den| |#2|)))
          %))) 

(DEFUN |Localize| (&REST #1=#:G28)
  (SPROG NIL
         (PROG (#2=#:G29)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Localize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Localize;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Localize|)))))))))) 

(MAKEPROP '|Localize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |LO;0;%;1|) %))
              (0 . |0|) (4 . |1|) (|Boolean|) (8 . |zero?|) |LO;zero?;%B;2|
              (13 . -) |LO;-;2%;3| (18 . *) (24 . =) |LO;=;2%B;4|
              |LO;numer;%M;5| |LO;denom;%R;6| (30 . +) (36 . *) |LO;+;3%;7|
              (|Integer|) (42 . *) |LO;*;I2%;8| (48 . =) |LO;*;R2%;9|
              (54 . |zero?|) |LO;/;%R%;10| |LO;/;MR%;11| (|OutputForm|)
              (59 . |coerce|) (64 . |coerce|) (69 . /) |LO;coerce;%Of;12|
              (|String|) (|PositiveInteger|) (|Union| % '"failed")
              (|NonNegativeInteger|))
           '#(~= 75 |zero?| 81 |subtractIfCan| 86 |sample| 92 |opposite?| 96
              |numer| 102 |latex| 107 |denom| 112 |coerce| 117 = 122 |0| 128 /
              132 - 144 + 155 * 161)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 1 1 3 2 0 0 0 0))
                 (CONS
                  '#(|Module&| NIL NIL NIL |AbelianGroup&| NIL |AbelianMonoid&|
                     |SetWithZero&| |AbelianSemiGroup&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|Module| 7) (|BiModule| 7 7) (|RightModule| 7)
                      (|LeftModule| 7) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|SetWithZero|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|CoercibleTo| 33) (|BasicType|))
                   (|makeByteWordVec2| 41
                                       '(0 6 0 10 0 7 0 11 1 6 12 0 13 1 6 0 0
                                         15 2 6 0 7 0 17 2 6 12 0 0 18 2 6 0 0
                                         0 22 2 7 0 0 0 23 2 6 0 25 0 26 2 7 12
                                         0 0 28 1 7 12 0 30 1 6 33 0 34 1 7 33
                                         0 35 2 33 0 0 0 36 2 0 12 0 0 1 1 2 12
                                         0 14 2 1 40 0 0 1 0 2 0 1 2 2 12 0 0 1
                                         1 0 6 0 20 1 0 38 0 1 1 0 7 0 21 1 0
                                         33 0 37 2 0 12 0 0 19 0 2 0 9 2 0 0 0
                                         7 31 2 0 0 6 7 32 1 1 0 0 16 2 1 0 0 0
                                         1 2 0 0 0 0 24 2 0 0 39 0 1 2 0 0 7 0
                                         29 2 0 0 0 7 1 2 1 0 25 0 27 2 2 0 41
                                         0 1)))))
           '|lookupComplete|)) 
