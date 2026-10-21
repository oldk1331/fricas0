
(SDEFUN |INTLOCP;split|
        ((|z| #1=(|Integer|))
         (%
          (|Record| (|:| |ppow| (|NonNegativeInteger|))
                    (|:| |pfree| (|Integer|)))))
        (SPROG
         ((|x| (|Union| (|Integer|) #2="failed")) (#3=#:G32 NIL) (|a| #1#)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((ZEROP |z|) (CONS 0 0))
                ('T
                 (SEQ (LETT |a| |z|) (LETT |n| 0)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ (LETT |x| (|exquo_INT| |a| (QREFELT % 6)))
                                   (EXIT (NULL (QEQCAR |x| 1)))))
                             (GO G191)))
                           (SEQ
                            (LETT |a|
                                  (PROG2 (LETT #3# |x|)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                                    (|Union| (|Integer|) #2#)
                                                    #3#)))
                            (EXIT (LETT |n| (+ |n| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS |n| |a|)))))))) 

(MAKEPROP '|INTLOCP;exponent;%Nni;2| '|SPADreplace| 'QCAR) 

(SDEFUN |INTLOCP;exponent;%Nni;2| ((|x| (%)) (% (|NonNegativeInteger|)))
        (QCAR |x|)) 

(MAKEPROP '|INTLOCP;unitPart;%F;3| '|SPADreplace| 'QCDR) 

(SDEFUN |INTLOCP;unitPart;%F;3| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (QCDR |x|)) 

(SDEFUN |INTLOCP;coerce;I%;4| ((|z| (|Integer|)) (% (%)))
        (SPROG
         ((|s|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|)))))
         (SEQ (LETT |s| (|INTLOCP;split| |z| %))
              (EXIT (CONS (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT % 16))))))) 

(SDEFUN |INTLOCP;retract;%I;5| ((|x| (%)) (% (|Integer|)))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ (LETT |q| (SPADCALL |x| (QREFELT % 15)))
                    (COND
                     ((NULL (EQL (SPADCALL |q| (QREFELT % 18)) 1))
                      (EXIT (|error| "not an integer"))))
                    (EXIT
                     (* (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 13)))
                        (SPADCALL |q| (QREFELT % 19))))))) 

(SDEFUN |INTLOCP;retractIfCan;%U;6|
        ((|x| (%)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ (LETT |q| (SPADCALL |x| (QREFELT % 15)))
                    (COND
                     ((NULL (EQL (SPADCALL |q| (QREFELT % 18)) 1))
                      (EXIT (CONS 1 "failed"))))
                    (EXIT
                     (CONS 0
                           (*
                            (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 13)))
                            (SPADCALL |q| (QREFELT % 19)))))))) 

(SDEFUN |INTLOCP;coerce;%F;7| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 13)))
                  (SPADCALL |x| (QREFELT % 15)) (QREFELT % 23))) 

(SDEFUN |INTLOCP;retract;F%;8| ((|q| (|Fraction| (|Integer|))) (% (%)))
        (SPROG
         ((|d| (|Integer|))
          (|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|)))))
         (SEQ (LETT |d| (SPADCALL |q| (QREFELT % 18)))
              (EXIT
               (COND
                ((QEQCAR (|exquo_INT| |d| (QREFELT % 6)) 0)
                 (|error| "denominator contains power of p"))
                ('T
                 (SEQ
                  (LETT |snum|
                        (|INTLOCP;split| (SPADCALL |q| (QREFELT % 19)) %))
                  (EXIT
                   (CONS (QCAR |snum|)
                         (SPADCALL (QCDR |snum|) |d| (QREFELT % 25))))))))))) 

(SDEFUN |INTLOCP;retractIfCan;FU;9|
        ((|q| (|Fraction| (|Integer|))) (% (|Union| % "failed")))
        (SPROG
         ((|d| (|Integer|))
          (|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|)))))
         (SEQ (LETT |d| (SPADCALL |q| (QREFELT % 18)))
              (EXIT
               (COND
                ((QEQCAR (|exquo_INT| |d| (QREFELT % 6)) 0) (CONS 1 "failed"))
                ('T
                 (SEQ
                  (LETT |snum|
                        (|INTLOCP;split| (SPADCALL |q| (QREFELT % 19)) %))
                  (EXIT
                   (CONS 0
                         (CONS (QCAR |snum|)
                               (SPADCALL (QCDR |snum|) |d|
                                         (QREFELT % 25)))))))))))) 

(SDEFUN |INTLOCP;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((|po| (|OutputForm|)) (|q| (|Fraction| (|Integer|))))
               (SEQ
                (COND
                 ((ZEROP (SPADCALL |x| (QREFELT % 13)))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 30)))
                 (#1='T
                  (SEQ (LETT |po| (SPADCALL (QREFELT % 6) (QREFELT % 32)))
                       (COND
                        ((> (SPADCALL |x| (QREFELT % 13)) 1)
                         (LETT |po|
                               (SPADCALL |po|
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT % 13))
                                          (QREFELT % 33))
                                         (QREFELT % 34)))))
                       (LETT |q| (SPADCALL |x| (QREFELT % 15)))
                       (EXIT
                        (COND ((SPADCALL |q| (QREFELT % 35)) |po|)
                              (#1#
                               (SPADCALL |po| (SPADCALL |q| (QREFELT % 30))
                                         (QREFELT % 36))))))))))) 

(SDEFUN |INTLOCP;0;%;11| ((% (%))) (SPADCALL 0 (QREFELT % 17))) 

(SDEFUN |INTLOCP;1;%;12| ((% (%))) (SPADCALL 1 (QREFELT % 17))) 

(SDEFUN |INTLOCP;zero?;%B;13| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 40))) 

(SDEFUN |INTLOCP;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|q| (|Fraction| (|Integer|)))
          (|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|#G16| (|Integer|)) (|#G17| (%)) (|#G18| (%)) (|e| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 41)) |y|)
                ((SPADCALL |y| (QREFELT % 41)) |x|)
                (#1='T
                 (SEQ
                  (LETT |e|
                        (- (SPADCALL |x| (QREFELT % 13))
                           (SPADCALL |y| (QREFELT % 13))))
                  (EXIT
                   (COND
                    ((ZEROP |e|)
                     (SEQ
                      (LETT |q|
                            (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                      (SPADCALL |y| (QREFELT % 15))
                                      (QREFELT % 42)))
                      (EXIT
                       (COND
                        ((SPADCALL |q| (QREFELT % 40)) (|spadConstant| % 38))
                        (#1#
                         (SEQ
                          (LETT |snum|
                                (|INTLOCP;split| (SPADCALL |q| (QREFELT % 19))
                                 %))
                          (EXIT
                           (CONS
                            (+ (SPADCALL |x| (QREFELT % 13)) (QCAR |snum|))
                            (SPADCALL (QCDR |snum|)
                                      (SPADCALL |q| (QREFELT % 18))
                                      (QREFELT % 25))))))))))
                    (#1#
                     (SEQ
                      (COND
                       ((< |e| 0)
                        (PROGN
                         (LETT |#G16| (- |e|))
                         (LETT |#G17| |y|)
                         (LETT |#G18| |x|)
                         (LETT |e| |#G16|)
                         (LETT |x| |#G17|)
                         (LETT |y| |#G18|))))
                      (EXIT
                       (CONS (SPADCALL |y| (QREFELT % 13))
                             (SPADCALL
                              (SPADCALL (EXPT (QREFELT % 6) |e|)
                                        (SPADCALL |x| (QREFELT % 15))
                                        (QREFELT % 23))
                              (SPADCALL |y| (QREFELT % 15))
                              (QREFELT % 42)))))))))))))) 

(SDEFUN |INTLOCP;-;2%;15| ((|x| (%)) (% (%)))
        (CONS (SPADCALL |x| (QREFELT % 13))
              (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 44)))) 

(SDEFUN |INTLOCP;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |x| (QREFELT % 41)) (SPADCALL |y| (QREFELT % 41)))
          (|spadConstant| % 38))
         ('T
          (CONS (+ (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
                (SPADCALL (SPADCALL |x| (QREFELT % 15))
                          (SPADCALL |y| (QREFELT % 15)) (QREFELT % 46)))))) 

(SDEFUN |INTLOCP;*;I2%;17| ((|z| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |z| (QREFELT % 17)) |x| (QREFELT % 47))) 

(SDEFUN |INTLOCP;^;%Nni%;18| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (CONS (* |n| (SPADCALL |x| (QREFELT % 13)))
              (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 49)))) 

(SDEFUN |INTLOCP;=;2%B;19| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15))
                    (QREFELT % 51)))
         ('T NIL))) 

(MAKEPROP '|INTLOCP;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTLOCP;characteristic;Nni;20| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |INTLOCP;euclideanSize;%Nni;21| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 13))) 

(SDEFUN |INTLOCP;divide;2%R;22|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG ((|e| (|Integer|)) (|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL |y| (QREFELT % 41)) (|error| "division by zero"))
                 (#1='T
                  (SEQ
                   (LETT |e|
                         (- (SPADCALL |x| (QREFELT % 13))
                            (SPADCALL |y| (QREFELT % 13))))
                   (EXIT
                    (COND ((< |e| 0) (CONS (|spadConstant| % 38) |x|))
                          (#1#
                           (SEQ
                            (LETT |z|
                                  (CONS |e|
                                        (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                                  (SPADCALL |y| (QREFELT % 15))
                                                  (QREFELT % 55))))
                            (EXIT (CONS |z| (|spadConstant| % 38))))))))))))) 

(SDEFUN |INTLOCP;exquo;2%U;23| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|e| (|Integer|)) (|z| (%)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 41)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |e|
                              (- (SPADCALL |x| (QREFELT % 13))
                                 (SPADCALL |y| (QREFELT % 13))))
                        (EXIT
                         (COND ((< |e| 0) (CONS 1 "failed"))
                               (#1#
                                (SEQ
                                 (LETT |z|
                                       (CONS |e|
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT % 15))
                                              (SPADCALL |y| (QREFELT % 15))
                                              (QREFELT % 55))))
                                 (EXIT (CONS 0 |z|)))))))))))) 

(SDEFUN |INTLOCP;opposite?;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15))
                    (QREFELT % 59)))
         ('T NIL))) 

(SDEFUN |INTLOCP;unitNormal;%R;25|
        ((|x| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (COND
         ((SPADCALL |x| (QREFELT % 41))
          (VECTOR (|spadConstant| % 39) |x| (|spadConstant| % 39)))
         ('T
          (VECTOR (CONS 0 (SPADCALL |x| (QREFELT % 15)))
                  (CONS (SPADCALL |x| (QREFELT % 13)) (|spadConstant| % 61))
                  (CONS 0
                        (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                  (QREFELT % 62))))))) 

(SDEFUN |INTLOCP;unitCanonical;2%;26| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 41)) |x|)
              ('T (CONS (SPADCALL |x| (QREFELT % 13)) (|spadConstant| % 61))))) 

(SDEFUN |INTLOCP;associates?;2%B;27| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |x| (QREFELT % 41)) (SPADCALL |y| (QREFELT % 41)))
              ((SPADCALL |y| (QREFELT % 41)) (SPADCALL |x| (QREFELT % 41)))
              ('T
               (EQL (SPADCALL |x| (QREFELT % 13))
                    (SPADCALL |y| (QREFELT % 13)))))) 

(SDEFUN |INTLOCP;unit?;%B;28| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT % 13)))
          (NULL (SPADCALL |x| (QREFELT % 41))))
         ('T NIL))) 

(SDEFUN |INTLOCP;recip;%U;29| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((NULL (SPADCALL |x| (QREFELT % 67))) (CONS 1 "failed"))
              ('T
               (CONS 0
                     (CONS 0
                           (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                     (QREFELT % 62))))))) 

(SDEFUN |INTLOCP;gcd;3%;30| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (MIN (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
              (|spadConstant| % 61))) 

(SDEFUN |INTLOCP;lcm;3%;31| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (MAX (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
              (SPADCALL (SPADCALL |x| (QREFELT % 15))
                        (SPADCALL |y| (QREFELT % 15)) (QREFELT % 46)))) 

(SDEFUN |INTLOCP;lcmCoef;2%R;32|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))))
        (SPROG
         ((|ex| #1=(|NonNegativeInteger|)) (|ux| #2=(|Fraction| (|Integer|)))
          (|ey| #1#) (|uy| #2#) (|emax| (|NonNegativeInteger|)) (|cx| (%))
          (|cy| (%)))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT % 41)) (SPADCALL |y| (QREFELT % 41)))
            (VECTOR (|spadConstant| % 38) (|spadConstant| % 38)
                    (|spadConstant| % 38)))
           ('T
            (SEQ (LETT |ex| (SPADCALL |x| (QREFELT % 13)))
                 (LETT |ux| (SPADCALL |x| (QREFELT % 15)))
                 (LETT |ey| (SPADCALL |y| (QREFELT % 13)))
                 (LETT |uy| (SPADCALL |y| (QREFELT % 15)))
                 (LETT |emax| (MAX |ex| |ey|))
                 (LETT |cx| (CONS (- |emax| |ex|) |uy|))
                 (LETT |cy| (CONS (- |emax| |ey|) |ux|))
                 (EXIT
                  (VECTOR (CONS |emax| (SPADCALL |ux| |uy| (QREFELT % 46)))
                          |cx| |cy|)))))))) 

(SDEFUN |INTLOCP;<;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13)))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15))
                    (QREFELT % 73)))
         ('T
          (SPADCALL (SPADCALL |x| (QREFELT % 24)) (SPADCALL |y| (QREFELT % 24))
                    (QREFELT % 73))))) 

(SDEFUN |INTLOCP;positive?;%B;34| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 75))) 

(SDEFUN |INTLOCP;negative?;%B;35| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 77))) 

(SDEFUN |INTLOCP;hashUpdate!;Hs%Hs;36|
        ((|hs| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPADCALL (SPADCALL |hs| (SPADCALL |x| (QREFELT % 13)) (QREFELT % 80))
                  (SPADCALL |x| (QREFELT % 15)) (QREFELT % 81))) 

(DECLAIM (NOTINLINE |IntegerLocalizedAtPrime;|)) 

(DEFUN |IntegerLocalizedAtPrime;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IntegerLocalizedAtPrime| DV$1))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegerLocalizedAtPrime|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL |#1| (QREFELT % 10)))
          (COND ((QREFELT % 11))
                ('T
                 (|error|
                  "Argument of IntegerLocalizedAtPrime must be a prime")))
          %))) 

(DEFUN |IntegerLocalizedAtPrime| (#1=#:G172)
  (SPROG NIL
         (PROG (#2=#:G173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegerLocalizedAtPrime|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerLocalizedAtPrime;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegerLocalizedAtPrime|)))))))))) 

(MAKEPROP '|IntegerLocalizedAtPrime| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Integer|)
              (|IntegerPrimesPackage| 8) (0 . |prime?|) '#:G0
              (|NonNegativeInteger|) |INTLOCP;exponent;%Nni;2| (|Fraction| 8)
              |INTLOCP;unitPart;%F;3| (5 . |coerce|) |INTLOCP;coerce;I%;4|
              (10 . |denom|) (15 . |numer|) |INTLOCP;retract;%I;5|
              (|Union| 8 '"failed") |INTLOCP;retractIfCan;%U;6| (20 . *)
              |INTLOCP;coerce;%F;7| (26 . /) |INTLOCP;retract;F%;8|
              (|Union| % '"failed") |INTLOCP;retractIfCan;FU;9| (|OutputForm|)
              (32 . |coerce|) (|PositiveInteger|) (37 . |coerce|)
              (42 . |coerce|) (47 . ^) (53 . |one?|) (58 . *)
              |INTLOCP;coerce;%Of;10|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INTLOCP;0;%;11|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INTLOCP;1;%;12|) %))
              (64 . |zero?|) |INTLOCP;zero?;%B;13| (69 . +) |INTLOCP;+;3%;14|
              (75 . -) |INTLOCP;-;2%;15| (80 . *) |INTLOCP;*;3%;16|
              |INTLOCP;*;I2%;17| (86 . ^) |INTLOCP;^;%Nni%;18| (92 . =)
              |INTLOCP;=;2%B;19| |INTLOCP;characteristic;Nni;20|
              |INTLOCP;euclideanSize;%Nni;21| (98 . /)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |INTLOCP;divide;2%R;22| |INTLOCP;exquo;2%U;23|
              (104 . |opposite?|) |INTLOCP;opposite?;2%B;24| (110 . |1|)
              (114 . |inv|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              |INTLOCP;unitNormal;%R;25| |INTLOCP;unitCanonical;2%;26|
              |INTLOCP;associates?;2%B;27| |INTLOCP;unit?;%B;28|
              |INTLOCP;recip;%U;29| |INTLOCP;gcd;3%;30| |INTLOCP;lcm;3%;31|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              |INTLOCP;lcmCoef;2%R;32| (119 . <) |INTLOCP;<;2%B;33|
              (125 . |positive?|) |INTLOCP;positive?;%B;34| (130 . |negative?|)
              |INTLOCP;negative?;%B;35| (|HashState|) (135 . |hashUpdate!|)
              (141 . |hashUpdate!|) |INTLOCP;hashUpdate!;Hs%Hs;36| (|String|)
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 84 '"failed")
              (|Record| (|:| |coef| 84) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 88 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|SingleInteger|))
           '#(~= 147 |zero?| 153 |unitPart| 158 |unitNormal| 163
              |unitCanonical| 168 |unit?| 173 |subtractIfCan| 178 |smaller?|
              184 |sizeLess?| 190 |sign| 196 |sample| 201 |rightRecip| 205
              |rightPower| 210 |retractIfCan| 222 |retract| 232 |rem| 242
              |recip| 248 |quo| 253 |principalIdeal| 259 |positive?| 264
              |plenaryPower| 269 |opposite?| 275 |one?| 281 |negative?| 286
              |multiEuclidean| 291 |min| 297 |max| 303 |leftRecip| 309
              |leftPower| 314 |lcmCoef| 326 |lcm| 332 |latex| 343 |hashUpdate!|
              348 |hash| 354 |gcdPolynomial| 359 |gcd| 365 |extendedEuclidean|
              376 |exquo| 389 |expressIdealMember| 395 |exponent| 401
              |euclideanSize| 406 |divide| 411 |commutator| 417 |coerce| 423
              |characteristic| 443 |associator| 447 |associates?| 454
              |antiCommutator| 460 |annihilate?| 466 |abs| 472 ^ 477 >= 489 >
              495 = 501 <= 507 < 513 |1| 519 |0| 523 - 527 + 538 * 544)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(|EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL |Algebra&|
                |EntireRing&| NIL NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| |OrderedAbelianSemiGroup&| NIL NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL NIL NIL |AbelianSemiGroup&| |SetWithZero&|
                |Magma&| NIL |SetCategory&| NIL |RetractableTo&|
                |RetractableFrom&| |Hashable&| NIL |BasicType&| NIL NIL NIL
                |PartialOrder&| NIL NIL NIL NIL)
             (CONS
              '#((|EuclideanDomain|) (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|Algebra| $$) (|EntireRing|) (|OrderedRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|Module| $$) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                 (|OrderedMagmaWithZero|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|Comparable|) (|MagmaWithZero|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|ComparableRepresentation|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 8) (|RetractableFrom| 14)
                 (|Hashable|) (|CoercibleTo| 29) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|CharacteristicZero|) (|CoercibleFrom| 8) (|CoercibleTo| 14)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 91
                                  '(1 9 7 8 10 1 14 0 8 16 1 14 8 0 18 1 14 8 0
                                    19 2 14 0 12 0 23 2 14 0 8 8 25 1 14 29 0
                                    30 1 31 29 0 32 1 12 29 0 33 2 29 0 0 0 34
                                    1 14 7 0 35 2 29 0 0 0 36 1 14 7 0 40 2 14
                                    0 0 0 42 1 14 0 0 44 2 14 0 0 14 46 2 14 0
                                    0 8 49 2 14 7 0 0 51 2 14 0 0 0 55 2 14 7 0
                                    0 59 0 14 0 61 1 14 0 0 62 2 14 7 0 0 73 1
                                    14 7 0 75 1 14 7 0 77 2 12 79 79 0 80 2 14
                                    79 79 0 81 2 0 7 0 0 1 1 0 7 0 41 1 0 14 0
                                    15 1 0 63 0 64 1 0 0 0 65 1 0 7 0 67 2 0 27
                                    0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 1 1 8 0 1 0 0
                                    0 1 1 0 27 0 1 2 0 0 0 31 1 2 0 0 0 12 1 1
                                    0 21 0 22 1 0 27 14 28 1 0 8 0 20 1 0 0 14
                                    26 2 0 0 0 0 1 1 0 27 0 68 2 0 0 0 0 1 1 0
                                    87 84 1 1 1 7 0 76 2 0 0 0 31 1 2 0 7 0 0
                                    60 1 0 7 0 1 1 1 7 0 78 2 0 86 84 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 27 0 1 2 0 0 0 31 1 2
                                    0 0 0 12 1 2 0 71 0 0 72 1 0 0 84 1 2 0 0 0
                                    0 70 1 0 83 0 1 2 0 79 79 0 82 1 0 91 0 1 2
                                    0 85 85 85 1 1 0 0 84 1 2 0 0 0 0 69 3 0 89
                                    0 0 0 1 2 0 90 0 0 1 2 0 27 0 0 58 2 0 86
                                    84 0 1 1 0 12 0 13 1 0 12 0 54 2 0 56 0 0
                                    57 2 0 0 0 0 1 1 0 29 0 37 1 0 0 8 17 1 0 0
                                    0 1 1 0 14 0 24 0 0 12 53 3 0 0 0 0 0 1 2 0
                                    7 0 0 66 2 0 0 0 0 1 2 0 7 0 0 1 1 2 0 0 1
                                    2 0 0 0 31 1 2 0 0 0 12 50 2 0 7 0 0 1 2 0
                                    7 0 0 1 2 0 7 0 0 52 2 0 7 0 0 1 2 0 7 0 0
                                    74 0 0 0 39 0 0 0 38 2 0 0 0 0 1 1 0 0 0 45
                                    2 0 0 0 0 43 2 0 0 31 0 1 2 0 0 0 0 47 2 0
                                    0 8 0 48 2 0 0 12 0 1)))))
           '|lookupComplete|)) 
