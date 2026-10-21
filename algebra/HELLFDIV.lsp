
(SDEFUN |HELLFDIV;0;%;1| ((% (%)))
        (SPADCALL (|spadConstant| % 27) (QREFELT % 28))) 

(SDEFUN |HELLFDIV;divisor;R%;2| ((|g| (R)) (% (%)))
        (VECTOR (|spadConstant| % 30) (|spadConstant| % 31) |g| 'T)) 

(MAKEPROP '|HELLFDIV;makeDivisor| '|SPADreplace|
          '(XLAM (|a| |b| |g|) (VECTOR |a| |b| |g| NIL))) 

(SDEFUN |HELLFDIV;makeDivisor| ((|a| (UP)) (|b| (UP)) (|g| (R)) (% (%)))
        (VECTOR |a| |b| |g| NIL)) 

(SDEFUN |HELLFDIV;princ?| ((|d| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QVELT |d| 0) (|spadConstant| % 30) (QREFELT % 33))
          (SPADCALL (QVELT |d| 1) (QREFELT % 34)))
         ('T NIL))) 

(SDEFUN |HELLFDIV;ideal;%Fi;5|
        ((|d| (%)) (% (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
        (SPADCALL (SPADCALL (VECTOR (QVELT |d| 2)) (QREFELT % 37))
                  (|HELLFDIV;mkIdeal| (QVELT |d| 0) (QVELT |d| 1) %)
                  (QREFELT % 38))) 

(SDEFUN |HELLFDIV;decompose;%R;6|
        ((|d| (%))
         (%
          (|Record| (|:| |id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
                    (|:| |principalPart| R))))
        (CONS
         (SPADCALL
          (|HELLFDIV;makeDivisor| (QVELT |d| 0) (QVELT |d| 1)
           (|spadConstant| % 27) %)
          (QREFELT % 39))
         (QVELT |d| 2))) 

(SDEFUN |HELLFDIV;mkIdeal|
        ((|a| (UP)) (|b| (UP))
         (% (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
        (SPADCALL
         (VECTOR (SPADCALL (SPADCALL |a| (QREFELT % 43)) (QREFELT % 44))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| % 45) 1 (QREFELT % 46))
                            (SPADCALL (SPADCALL |b| (QREFELT % 43))
                                      (QREFELT % 47))
                            (QREFELT % 48))
                  (QREFELT % 49)))
         (QREFELT % 37))) 

(SDEFUN |HELLFDIV;+;3%;8| ((|d1| (%)) (|d2| (%)) (% (%)))
        (SPROG
         ((|a1| (UP)) (|a2| (UP)) (|b1| (UP)) (|b2| (UP))
          (|rec| (|Record| (|:| |coef| #1=(|List| UP)) (|:| |generator| UP)))
          (|d| (UP)) (|h| #1#) (|a| (UP)) (#2=#:G23 NIL) (|b| (UP)) (|dd| (%)))
         (SEQ (LETT |a1| (QVELT |d1| 0)) (LETT |a2| (QVELT |d2| 0))
              (LETT |b1| (QVELT |d1| 1)) (LETT |b2| (QVELT |d2| 1))
              (LETT |rec|
                    (SPADCALL
                     (LIST |a1| |a2| (SPADCALL |b1| |b2| (QREFELT % 50)))
                     (QREFELT % 53)))
              (LETT |d| (QCDR |rec|)) (LETT |h| (QCAR |rec|))
              (LETT |a|
                    (PROG2
                        (LETT #2#
                              (SPADCALL (SPADCALL |a1| |a2| (QREFELT % 54))
                                        (SPADCALL |d| 2 (QREFELT % 56))
                                        (QREFELT % 58)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (QREFELT % 7)
                                      (|Union| (QREFELT % 7) #3="failed")
                                      #2#)))
              (LETT |b|
                    (SPADCALL (SPADCALL (|SPADfirst| |h|) |a1| (QREFELT % 54))
                              |b2| (QREFELT % 54)))
              (LETT |b|
                    (SPADCALL |b|
                              (SPADCALL
                               (SPADCALL (SPADCALL |h| (QREFELT % 60)) |a2|
                                         (QREFELT % 54))
                               |b1| (QREFELT % 54))
                              (QREFELT % 50)))
              (LETT |b|
                    (SPADCALL |b|
                              (SPADCALL (SPADCALL |h| (QREFELT % 61))
                                        (SPADCALL
                                         (SPADCALL |b1| |b2| (QREFELT % 54))
                                         (QREFELT % 15) (QREFELT % 50))
                                        (QREFELT % 54))
                              (QREFELT % 50)))
              (LETT |b|
                    (SPADCALL
                     (PROG2 (LETT #2# (SPADCALL |b| |d| (QREFELT % 58)))
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (QREFELT % 7)
                                       (|Union| (QREFELT % 7) #3#) #2#))
                     |a| (QREFELT % 62)))
              (LETT |dd|
                    (|HELLFDIV;makeDivisor| |a| |b|
                     (SPADCALL
                      (SPADCALL (SPADCALL |d| (QREFELT % 43)) (QVELT |d1| 2)
                                (QREFELT % 63))
                      (QVELT |d2| 2) (QREFELT % 64))
                     %))
              (COND
               ((QVELT |d1| 3)
                (COND ((QVELT |d2| 3) (EXIT (SPADCALL |dd| (QREFELT % 65)))))))
              (EXIT |dd|)))) 

(SDEFUN |HELLFDIV;*;I2%;9| ((|n| (|Integer|)) (|d| (%)) (% (%)))
        (COND ((ZEROP |n|) (|spadConstant| % 29))
              ((< |n| 0)
               (SPADCALL (- |n|) (SPADCALL |d| (QREFELT % 68)) (QREFELT % 69)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QVELT |d| 2) |n| (QREFELT % 70))
                          (QREFELT % 28))
                (SPADCALL
                 (SPADCALL (|HELLFDIV;mkIdeal| (QVELT |d| 0) (QVELT |d| 1) %)
                           |n| (QREFELT % 71))
                 (QREFELT % 72))
                (QREFELT % 66))))) 

(SDEFUN |HELLFDIV;divisor;Fi%;10|
        ((|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)) (% (%)))
        (SPROG
         ((|v| (|Vector| R)) (|n| (|NonNegativeInteger|)) (|a| (R)) (|h| (R))
          (|u| (|Union| UP "failed")) (|w| (|Union| UP "failed")))
         (SEQ
          (LETT |n|
                (QVSIZE
                 (LETT |v|
                       (SPADCALL (SPADCALL |i| (QREFELT % 73))
                                 (QREFELT % 74)))))
          (EXIT
           (COND
            ((EQL |n| 1)
             (SPADCALL
              (SPADCALL |v| (SPADCALL |v| (QREFELT % 75)) (QREFELT % 76))
              (QREFELT % 28)))
            ((SPADCALL |n| 2 (QREFELT % 77))
             (|error|
              #1="divisor: incomplete implementation for hyperelliptic curves"))
            (#2='T
             (SEQ
              (LETT |a|
                    (SPADCALL |v| (SPADCALL |v| (QREFELT % 75))
                              (QREFELT % 76)))
              (LETT |h| (SPADCALL |v| (QVSIZE |v|) (QREFELT % 76)))
              (LETT |u| (|HELLFDIV;polyIfCan| |a| %))
              (EXIT
               (COND
                ((QEQCAR |u| 0)
                 (SEQ (LETT |w| (|HELLFDIV;redpolyIfCan| |h| (QCDR |u|) %))
                      (EXIT
                       (COND
                        ((QEQCAR |w| 0)
                         (|HELLFDIV;makeDivisor| (QCDR |u|) (QCDR |w|)
                          (|spadConstant| % 27) %))
                        (#2# (|error| #1#))))))
                (#2#
                 (SEQ (LETT |u| (|HELLFDIV;polyIfCan| |h| %))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SEQ
                          (LETT |w| (|HELLFDIV;redpolyIfCan| |a| (QCDR |u|) %))
                          (EXIT
                           (COND
                            ((QEQCAR |w| 0)
                             (|HELLFDIV;makeDivisor| (QCDR |u|) (QCDR |w|)
                              (|spadConstant| % 27) %))
                            (#2# (|error| #1#))))))
                        (#2# (|error| #1#))))))))))))))) 

(SDEFUN |HELLFDIV;polyIfCan| ((|a| (R)) (% (|Union| UP "failed")))
        (SPROG
         ((|u| (|Union| (|Fraction| UP) "failed")) (|v| (|Union| UP "failed")))
         (SEQ (LETT |u| (SPADCALL |a| (QREFELT % 79)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ (LETT |v| (SPADCALL (QCDR |u|) (QREFELT % 80)))
                           (EXIT
                            (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                  (#1# (CONS 0 (QCDR |v|)))))))))))) 

(SDEFUN |HELLFDIV;redpolyIfCan|
        ((|h| (R)) (|a| (UP)) (% (|Union| UP "failed")))
        (SPROG
         ((|p| (UPUP)) (|q| (|Fraction| UP))
          (|rec|
           (|Record| (|:| |coef1| UP) (|:| |coef2| UP) (|:| |generator| UP)))
          (#1=#:G23 NIL))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL (LETT |p| (SPADCALL |h| (QREFELT % 81))) (QREFELT % 82))
             1 (QREFELT % 83))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |q|
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| 0 (QREFELT % 84))
                              (SPADCALL |p| 1 (QREFELT % 84)) (QREFELT % 85))
                    (QREFELT % 86)))
             (LETT |rec|
                   (SPADCALL (SPADCALL |q| (QREFELT % 87)) |a| (QREFELT % 89)))
             (COND
              ((NULL (SPADCALL (QVELT |rec| 2) (QREFELT % 90)))
               (EXIT (CONS 1 "failed"))))
             (EXIT
              (CONS 0
                    (SPADCALL
                     (PROG2
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT % 91))
                                          (QVELT |rec| 0) (QREFELT % 54))
                                (QVELT |rec| 2) (QREFELT % 58)))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                       (|Union| (QREFELT % 7) "failed") #1#))
                     |a| (QREFELT % 62)))))))))) 

(SDEFUN |HELLFDIV;coerce;%Of;13| ((|d| (%)) (% (|OutputForm|)))
        (SPROG ((|r| (|OutputForm|)) (|g| (|OutputForm|)) (|z| (|Boolean|)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (LIST (SPADCALL (QVELT |d| 0) (QREFELT % 92))
                             (SPADCALL (QVELT |d| 1) (QREFELT % 92)))
                       (QREFELT % 93)))
                (LETT |g|
                      (SPADCALL (QREFELT % 23)
                                (LIST (SPADCALL (QVELT |d| 2) (QREFELT % 94)))
                                (QREFELT % 95)))
                (LETT |z|
                      (SPADCALL (QVELT |d| 2) (|spadConstant| % 27)
                                (QREFELT % 96)))
                (EXIT
                 (COND
                  ((|HELLFDIV;princ?| |d| %)
                   (COND (|z| (QREFELT % 26)) (#1='T |g|)))
                  (|z| |r|) (#1# (SPADCALL |r| |g| (QREFELT % 97)))))))) 

(SDEFUN |HELLFDIV;reduce;2%;14| ((|d| (%)) (% (%)))
        (SPROG
         ((|a| (UP)) (|b| (UP)) (#1=#:G23 NIL) (|a0| (UP)) (|b0| (UP))
          (|g| (R)))
         (SEQ
          (COND ((QVELT |d| 3) |d|)
                ((<= (SPADCALL (LETT |a| (QVELT |d| 0)) (QREFELT % 17))
                     (QREFELT % 19))
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT % 90))
                    (COND
                     ((NULL
                       (SPADCALL |a| (|spadConstant| % 30) (QREFELT % 33)))
                      (EXIT
                       (SPADCALL
                        (|HELLFDIV;makeDivisor| (|spadConstant| % 30)
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (QVELT |d| 1) |a| (QREFELT % 58)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                           (|Union| (QREFELT % 7) #2="failed")
                                           #1#))
                         (SPADCALL (QVELT |d| 2)
                                   (SPADCALL (SPADCALL |a| (QREFELT % 43))
                                             (QREFELT % 44))
                                   (QREFELT % 99))
                         %)
                        (QREFELT % 65)))))))
                  (QSETVELT |d| 3 'T) (EXIT |d|)))
                ('T
                 (SEQ (LETT |b| (QVELT |d| 1))
                      (LETT |a0|
                            (PROG2
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL (QREFELT % 15)
                                                 (SPADCALL |b| 2
                                                           (QREFELT % 56))
                                                 (QREFELT % 100))
                                       |a| (QREFELT % 58)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                              (|Union| (QREFELT % 7) #2#)
                                              #1#)))
                      (LETT |b0|
                            (SPADCALL (SPADCALL |b| (QREFELT % 101)) |a0|
                                      (QREFELT % 62)))
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL (QVELT |d| 2)
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| (QREFELT % 43))
                                          (QREFELT % 47))
                                         (SPADCALL (|spadConstant| % 45) 1
                                                   (QREFELT % 46))
                                         (QREFELT % 48))
                                        (QREFELT % 49))
                                       (QREFELT % 64))
                             (SPADCALL (SPADCALL |a0| (QREFELT % 43))
                                       (QREFELT % 44))
                             (QREFELT % 99)))
                      (EXIT
                       (SPADCALL (|HELLFDIV;makeDivisor| |a0| |b0| |g| %)
                                 (QREFELT % 65))))))))) 

(SDEFUN |HELLFDIV;generator;%U;15| ((|d| (%)) (% (|Union| R "failed")))
        (SEQ (LETT |d| (SPADCALL |d| (QREFELT % 65)))
             (EXIT
              (COND ((|HELLFDIV;princ?| |d| %) (CONS 0 (QVELT |d| 2)))
                    ('T (CONS 1 "failed")))))) 

(SDEFUN |HELLFDIV;generator;%ILU;16|
        ((|d| (%)) (|k| (|Integer|)) (|lp| (|List| UP))
         (% (|Union| R "failed")))
        (SPROG
         ((|p| NIL) (#1=#:G108 NIL) (|cg| (UP)) (#2=#:G23 NIL) (|cp| (UP)))
         (SEQ (LETT |d| (SPADCALL |d| (QREFELT % 65)))
              (EXIT
               (COND ((|HELLFDIV;princ?| |d| %) (CONS 0 (QVELT |d| 2)))
                     (#3='T
                      (SEQ (LETT |cp| (QVELT |d| 0))
                           (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |p| (CAR #1#)) NIL)
                                      (NULL
                                       (> (SPADCALL |cp| (QREFELT % 17)) 0)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |cg|
                                       (SPADCALL |cp| |p| (QREFELT % 104)))
                                 (EXIT
                                  (LETT |cp|
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |cp| |cg|
                                                            (QREFELT % 58)))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (QREFELT % 7)
                                                          (|Union|
                                                           (QREFELT % 7)
                                                           "failed")
                                                          #2#)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             ((EQL (SPADCALL |cp| (QREFELT % 17)) 0)
                              (CONS 0 (QVELT |d| 2)))
                             (#3# (CONS 1 "failed"))))))))))) 

(SDEFUN |HELLFDIV;-;2%;17| ((|d| (%)) (% (%)))
        (SPROG ((|a| (UP)) (|di| (%)))
               (SEQ (LETT |a| (QVELT |d| 0))
                    (LETT |di|
                          (|HELLFDIV;makeDivisor| |a|
                           (SPADCALL (QVELT |d| 1) (QREFELT % 101))
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| (QREFELT % 43))
                                      (QVELT |d| 2) (QREFELT % 63))
                            (QREFELT % 106))
                           %))
                    (QSETVELT |di| 3 (QVELT |d| 3)) (EXIT |di|)))) 

(SDEFUN |HELLFDIV;=;2%B;18| ((|d1| (%)) (|d2| (%)) (% (|Boolean|)))
        (SEQ (LETT |d1| (SPADCALL |d1| (QREFELT % 65)))
             (LETT |d2| (SPADCALL |d2| (QREFELT % 65)))
             (EXIT
              (COND
               ((SPADCALL (QVELT |d1| 0) (QVELT |d2| 0) (QREFELT % 33))
                (COND
                 ((SPADCALL (QVELT |d1| 1) (QVELT |d2| 1) (QREFELT % 33))
                  (SPADCALL (QVELT |d1| 2) (QVELT |d2| 2) (QREFELT % 96)))
                 (#1='T NIL)))
               (#1# NIL))))) 

(SDEFUN |HELLFDIV;divisor;2F%;19| ((|a| (F)) (|b| (F)) (% (%)))
        (SPROG ((|x| (UP)) (|d| (UP)))
               (SEQ
                (LETT |x| (SPADCALL (|spadConstant| % 18) 1 (QREFELT % 108)))
                (COND
                 ((NULL
                   (SPADCALL
                    (SPADCALL
                     (LETT |d|
                           (SPADCALL |x| (SPADCALL |a| (QREFELT % 109))
                                     (QREFELT % 100)))
                     (SPADCALL (SPADCALL (QREFELT % 110)) (QREFELT % 111))
                     (QREFELT % 104))
                    (QREFELT % 90)))
                  (EXIT (|error| "divisor: point is singular"))))
                (EXIT
                 (|HELLFDIV;makeDivisor| |d| (SPADCALL |b| (QREFELT % 109))
                  (|spadConstant| % 27) %))))) 

(SDEFUN |HELLFDIV;intReduce| ((|h| (R)) (|b| (UP)) (% (R)))
        (SPROG
         ((|v| (|Vector| UP)) (#1=#:G125 NIL) (|i| NIL) (#2=#:G126 NIL)
          (#3=#:G124 NIL))
         (SEQ (LETT |v| (QCAR (SPADCALL |h| (QREFELT % 114))))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #1#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(QVSIZE |v|)
                            #5=(SPADCALL |v| (QREFELT % 116))))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL (QAREF1O |v| |i| 1) |b|
                                          (QREFELT % 62)))))
                      (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)
                (|spadConstant| % 30) (QREFELT % 117)))))) 

(SDEFUN |HELLFDIV;divisor;R2UP%;21| ((|h| (R)) (|a| (UP)) (|g| (UP)) (% (%)))
        (SPROG
         ((|hh| (UPUP)) (|b| (|Fraction| UP))
          (|rec|
           (|Record| (|:| |coef1| UP) (|:| |coef2| UP) (|:| |generator| UP)))
          (#1=#:G23 NIL) (|bb| (UP)))
         (SEQ
          (LETT |a|
                (SPADCALL |a|
                          (SPADCALL (SPADCALL |h| (QREFELT % 118))
                                    (QREFELT % 111))
                          (QREFELT % 104)))
          (LETT |h| (|HELLFDIV;intReduce| |h| |a| %))
          (COND
           ((NULL (SPADCALL (SPADCALL |g| |a| (QREFELT % 104)) (QREFELT % 90)))
            (LETT |h|
                  (|HELLFDIV;intReduce|
                   (SPADCALL |h| (SPADCALL (QREFELT % 119)) (QREFELT % 120))
                   |a| %))))
          (LETT |hh| (SPADCALL |h| (QREFELT % 81)))
          (LETT |b|
                (SPADCALL
                 (SPADCALL (SPADCALL |hh| 0 (QREFELT % 84))
                           (SPADCALL |hh| 1 (QREFELT % 84)) (QREFELT % 85))
                 (QREFELT % 86)))
          (LETT |rec|
                (SPADCALL (SPADCALL |b| (QREFELT % 87)) |a| (QREFELT % 89)))
          (COND
           ((NULL (SPADCALL (QVELT |rec| 2) (QREFELT % 90)))
            (EXIT
             (|error|
              "divisor: incomplete implementation for hyperelliptic curves"))))
          (LETT |bb|
                (SPADCALL
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| (QREFELT % 91))
                                      (QVELT |rec| 0) (QREFELT % 54))
                            (QVELT |rec| 2) (QREFELT % 58)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                   (|Union| (QREFELT % 7) "failed") #1#))
                 |a| (QREFELT % 62)))
          (EXIT
           (SPADCALL (|HELLFDIV;makeDivisor| |a| |bb| (|spadConstant| % 27) %)
                     (QREFELT % 65)))))) 

(DECLAIM (NOTINLINE |HyperellipticFiniteDivisor;|)) 

(DEFUN |HyperellipticFiniteDivisor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL)
    (#1=#:G23 NIL) (#2=#:G29 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|HyperellipticFiniteDivisor| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 123))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|HyperellipticFiniteDivisor|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 12 (SPADCALL (QREFELT % 11)))
    (QSETREFV % 13 (QREFELT % 12))
    (COND
     ((QEQCAR (QREFELT % 12) 1)
      (|error| "HyperellipticFiniteDivisor: curve must be hyperelliptic")))
    (QSETREFV % 14
              (|Record| (|:| |center| |#2|) (|:| |polyPart| |#2|)
                        (|:| |principalPart| |#4|)
                        (|:| |reduced?| (|Boolean|))))
    (QSETREFV % 15
              (PROG2 (LETT #1# (QREFELT % 13))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3="failed")
                                #1#)))
    (QSETREFV % 19
              (PROG2
                  (LETT #2#
                        (|exquo_INT|
                         (- (SPADCALL (QREFELT % 15) (QREFELT % 17)) 1) 2))
                  (QCDR #2#)
                (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                (|Union| (|Integer|) #3#) #2#)))
    (QSETREFV % 23 (SPADCALL '|div| (QREFELT % 22)))
    (QSETREFV % 26 (SPADCALL 0 (QREFELT % 25)))
    %))) 

(DEFUN |HyperellipticFiniteDivisor| (&REST #1=#:G133)
  (SPROG NIL
         (PROG (#2=#:G134)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|HyperellipticFiniteDivisor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |HyperellipticFiniteDivisor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|HyperellipticFiniteDivisor|)))))))))) 

(MAKEPROP '|HyperellipticFiniteDivisor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 7 '"failed")
              (0 . |hyperelliptic|) '|#G1| '|uhyper| '|Rep| '|hyper|
              (|NonNegativeInteger|) (4 . |degree|) (9 . |1|) '|gen|
              (|OutputForm|) (|Symbol|) (13 . |coerce|) '|dvd| (|Integer|)
              (18 . |coerce|) '|zer| (23 . |1|) |HELLFDIV;divisor;R%;2|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |HELLFDIV;0;%;1|) %))
              (27 . |1|) (31 . |0|) (|Boolean|) (35 . =) (41 . |zero?|)
              (|Vector| 9) (|FractionalIdeal| 7 42 8 9) (46 . |ideal|) (51 . *)
              |HELLFDIV;ideal;%Fi;5|
              (|Record| (|:| |id| 36) (|:| |principalPart| 9))
              |HELLFDIV;decompose;%R;6| (|Fraction| 7) (57 . |coerce|)
              (62 . |coerce|) (67 . |1|) (71 . |monomial|) (77 . |coerce|)
              (82 . -) (88 . |reduce|) (93 . +)
              (|Record| (|:| |coef| 52) (|:| |generator| %)) (|List| %)
              (99 . |principalIdeal|) (104 . *) (|PositiveInteger|) (110 . ^)
              (|Union| % '"failed") (116 . |exquo|) (|List| 7) (122 . |second|)
              (127 . |third|) (132 . |rem|) (138 . *) (144 . *)
              |HELLFDIV;reduce;2%;14| |HELLFDIV;+;3%;8| (150 . |0|)
              |HELLFDIV;-;2%;17| |HELLFDIV;*;I2%;9| (154 . ^) (160 . ^)
              |HELLFDIV;divisor;Fi%;10| (166 . |minimize|) (171 . |basis|)
              (176 . |minIndex|) (181 . |elt|) (187 . ~=)
              (|Union| 42 '"failed") (193 . |retractIfCan|)
              (198 . |retractIfCan|) (203 . |lift|) (208 . |degree|) (213 . ~=)
              (219 . |coefficient|) (225 . /) (231 . -) (236 . |denom|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (241 . |extendedEuclidean|) (247 . |ground?|) (252 . |numer|)
              (257 . |coerce|) (262 . |bracket|) (267 . |coerce|)
              (272 . |prefix|) (278 . =) (284 . +) |HELLFDIV;coerce;%Of;13|
              (290 . /) (296 . -) (302 . -) (|Union| 9 '"failed")
              |HELLFDIV;generator;%U;15| (307 . |gcd|)
              |HELLFDIV;generator;%ILU;16| (313 . |inv|) |HELLFDIV;=;2%B;18|
              (318 . |monomial|) (324 . |coerce|) (329 . |discriminant|)
              (333 . |retract|) |HELLFDIV;divisor;2F%;19|
              (|Record| (|:| |num| 115) (|:| |den| 7))
              (338 . |integralCoordinates|) (|Vector| 7) (343 . |minIndex|)
              (348 . |integralRepresents|) (354 . |norm|) (359 . |rank|)
              (363 . ^) |HELLFDIV;divisor;R2UP%;21| (|String|))
           '#(~= 369 |zero?| 375 |subtractIfCan| 380 |sample| 386 |reduce| 390
              |principal?| 395 |opposite?| 400 |latex| 406 |ideal| 411
              |generator| 416 |divisor| 428 |decompose| 467 |coerce| 472 = 477
              |0| 483 - 487 + 498 * 504)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|FiniteDivisorCategory&| |AbelianGroup&| NIL
                     |AbelianMonoid&| |SetWithZero&| |AbelianSemiGroup&|
                     |SetCategory&| NIL |BasicType&|)
                  (CONS
                   '#((|FiniteDivisorCategory| 6 7 8 9) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|SetWithZero|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|CoercibleTo| 20) (|BasicType|))
                   (|makeByteWordVec2| 122
                                       '(0 9 10 11 1 7 16 0 17 0 6 0 18 1 21 20
                                         0 22 1 24 20 0 25 0 9 0 27 0 7 0 30 0
                                         7 0 31 2 7 32 0 0 33 1 7 32 0 34 1 36
                                         0 35 37 2 36 0 0 0 38 1 42 0 7 43 1 9
                                         0 42 44 0 42 0 45 2 8 0 42 16 46 1 8 0
                                         42 47 2 8 0 0 0 48 1 9 0 8 49 2 7 0 0
                                         0 50 1 7 51 52 53 2 7 0 0 0 54 2 7 0 0
                                         55 56 2 7 57 0 0 58 1 59 7 0 60 1 59 7
                                         0 61 2 7 0 0 0 62 2 9 0 42 0 63 2 9 0
                                         0 0 64 0 6 0 67 2 9 0 0 24 70 2 36 0 0
                                         24 71 1 36 0 0 73 1 36 35 0 74 1 35 24
                                         0 75 2 35 9 0 24 76 2 16 32 0 0 77 1 9
                                         78 0 79 1 42 10 0 80 1 9 8 0 81 1 8 16
                                         0 82 2 24 32 0 0 83 2 8 42 0 16 84 2
                                         42 0 0 0 85 1 42 0 0 86 1 42 7 0 87 2
                                         7 88 0 0 89 1 7 32 0 90 1 42 7 0 91 1
                                         7 20 0 92 1 20 0 52 93 1 9 20 0 94 2
                                         20 0 0 52 95 2 9 32 0 0 96 2 20 0 0 0
                                         97 2 9 0 0 0 99 2 7 0 0 0 100 1 7 0 0
                                         101 2 7 0 0 0 104 1 9 0 0 106 2 7 0 6
                                         16 108 1 7 0 6 109 0 9 42 110 1 42 7 0
                                         111 1 9 113 0 114 1 115 24 0 116 2 9 0
                                         115 7 117 1 9 42 0 118 0 9 55 119 2 9
                                         0 0 55 120 2 0 32 0 0 1 1 0 32 0 1 2 0
                                         57 0 0 1 0 0 0 1 1 0 0 0 65 1 0 32 0 1
                                         2 0 32 0 0 1 1 0 122 0 1 1 0 36 0 39 1
                                         0 102 0 103 3 0 102 0 24 59 105 1 0 0
                                         9 28 1 0 0 36 72 3 0 0 6 6 24 1 2 0 0
                                         6 6 112 3 0 0 9 7 7 121 5 0 0 9 7 7 7
                                         6 1 1 0 40 0 41 1 0 20 0 98 2 0 32 0 0
                                         107 0 0 0 29 1 0 0 0 68 2 0 0 0 0 1 2
                                         0 0 0 0 66 2 0 0 55 0 1 2 0 0 16 0 1 2
                                         0 0 24 0 69)))))
           '|lookupComplete|)) 
