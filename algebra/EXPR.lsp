
(PUT '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(SDEFUN |EXPR;belong?;BoB;1| ((|op| (|BasicOperator|)) (% (|Boolean|))) 'T) 

(SDEFUN |EXPR;retNotUnit| ((|x| (%)) (% (R)))
        (SPROG ((|u| (|Union| R "failed")) (|k| (|Kernel| %)))
               (SEQ
                (LETT |u|
                      (SPADCALL (LETT |k| (SPADCALL |x| (QREFELT % 13)))
                                (QREFELT % 17)))
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T (|error| "Not retractable"))))))) 

(SDEFUN |EXPR;retNotUnitIfCan| ((|x| (%)) (% (|Union| R "failed")))
        (SPROG ((|r| (|Union| (|Kernel| %) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |r|) (QREFELT % 17)))))))) 

(SDEFUN |EXPR;operator;2Bo;4| ((|op| #1=(|BasicOperator|)) (% #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT % 21))
                  (SPADCALL |op| (QREFELT % 22)))
                 ((SPADCALL |op| (QREFELT % 24))
                  (SPADCALL |op| (QREFELT % 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT % 26))
                     (COND
                      ((SPADCALL |op| (QREFELT % 7) (QREFELT % 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT % 29))
                                   (QREFELT % 30))
                         (QREFELT % 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT % 33)))
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QREFELT % 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QCDR |n|)
                                (QREFELT % 36))))))))))) 

(SDEFUN |EXPR;poly_to_MP|
        ((|p| (|Polynomial| R))
         (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPROG
         ((|vl2| (|List| (|Kernel| %))) (#1=#:G96 NIL) (|z| NIL) (#2=#:G95 NIL)
          (|vl1| (|List| (|Symbol|)))
          (|ps| (|SparseMultivariatePolynomial| R (|Symbol|))))
         (SEQ (LETT |ps| |p|) (LETT |vl1| (SPADCALL |ps| (QREFELT % 40)))
              (LETT |vl2|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |z| NIL) (LETT #1# |vl1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |z| (QREFELT % 30)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT % 44)))))) 

(SDEFUN |EXPR;Zero;%;6| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;One;%;7| ((% (%))) (|spadConstant| % 48)) 

(SDEFUN |EXPR;one?;%B;8| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 49) (QREFELT % 51))) 

(SDEFUN |EXPR;zero?;%B;9| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL |x| (QREFELT % 53))) 

(SDEFUN |EXPR;-;2%;10| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;*;I2%;11| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 58))) 

(SDEFUN |EXPR;coerce;I%;12| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 60))) 

(SDEFUN |EXPR;*;3%;13| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 62))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 64))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;-;3%;15| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 66))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;/;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 68))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;number?;%B;17| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((|HasCategory| (QREFELT % 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT % 70)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT % 72)) 0))))
         (#1# (SPADCALL |x| (QREFELT % 70))))) 

(SDEFUN |EXPR;simplifyPower| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|args| (|List| %)) (|k| (|List| (|Kernel| %))))
               (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 75)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| '|%power| (QREFELT % 76))
                       (SEQ
                        (LETT |args|
                              (SPADCALL (SPADCALL |k| (QREFELT % 77))
                                        (QREFELT % 79)))
                        (COND
                         ((NULL (EQL (SPADCALL |args| (QREFELT % 80)) 2))
                          (EXIT (|error| "Too many arguments to ^"))))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |args| 1 (QREFELT % 81))
                                     (QREFELT % 73))
                           (SPADCALL
                            (|EXPR;reduc|
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 81)) |n|
                                       (QREFELT % 82))
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 81))
                                       (QREFELT % 83))
                             %)
                            (SPADCALL |args| 2 (QREFELT % 81)) (QREFELT % 84)))
                          (#1='T
                           (SPADCALL (SPADCALL |args| (QREFELT % 85))
                                     (SPADCALL |n|
                                               (SPADCALL |args| (QREFELT % 86))
                                               (QREFELT % 59))
                                     (QREFELT % 84)))))))
                      (#1#
                       (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT % 82))
                        (SPADCALL |x| (QREFELT % 83)) %))))))) 

(SDEFUN |EXPR;^;%Nni%;19| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;^;%I%;20| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| % 49) |x| (QREFELT % 69)))
                (#1#
                 (SPADCALL
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                  (QREFELT % 69))))))) 

(SDEFUN |EXPR;^;%Pi%;21| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;smaller?;2%B;22| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;=;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 67)) (|spadConstant| % 46)
                  (QREFELT % 51))) 

(SDEFUN |EXPR;numer;%Smp;24|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 97))) 

(SDEFUN |EXPR;denom;%Smp;25|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 100))) 

(SDEFUN |EXPR;coerce;Smp%;26|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%)))
        (CONS |p| (|spadConstant| % 103))) 

(SDEFUN |EXPR;coerce;P%;27| ((|p| (|Polynomial| R)) (% (%)))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| %))
                    (EXIT (CONS |en| (|spadConstant| % 103)))))) 

(SDEFUN |EXPR;coerce;F%;28| ((|pq| (|Fraction| (|Polynomial| R))) (% (%)))
        (SPROG
         ((|ed| #1=(|SparseMultivariatePolynomial| R (|Kernel| %))) (|en| #1#))
         (SEQ (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 108)) %))
              (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 109)) %))
              (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2%;29| ((|x| (%)) (% (%)))
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT % 83)) %)) 

(SDEFUN |EXPR;commonk| ((|x| (%)) (|y| (%)) (% (|List| (|Kernel| %))))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT % 83))
         (SPADCALL |y| (QREFELT % 83)) %)) 

(SDEFUN |EXPR;algkernels|
        ((|l| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT % 8) %))
                         |l| (QREFELT % 113)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG (% ALGOP)
          (LETT % (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 31)) ALGOP (QREFELT % 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL |f| (QREFELT % 83)) (QREFELT % 115))) 

(SDEFUN |EXPR;simple_root| ((|r| (|Kernel| %)) (% (|Boolean|)))
        (SPROG ((|a| (%)) (|al| (|List| %)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT % 116))
                  (SEQ (LETT |al| (SPADCALL |r| (QREFELT % 79)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |al| 2 (QREFELT % 81))
                                    (SPADCALL 2 (QREFELT % 61))
                                    (QREFELT % 117))
                          NIL)
                         (#1='T
                          (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT % 81)))
                               (EXIT
                                (NULL
                                 (>
                                  (LENGTH
                                   (|EXPR;algkernels|
                                    (SPADCALL |a| (QREFELT % 75)) %))
                                  0)))))))))
                 (#1# NIL))))) 

(SDEFUN |EXPR;root_reduce| ((|x| (%)) (|r| (|Kernel| %)) (% (%)))
        (SPROG
         ((|d1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|n1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|c0| #1=(|SparseMultivariatePolynomial| R (|Kernel| %))) (|c1| #1#)
          (|n0| #2=(|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|dp|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|dn| (|SparseMultivariatePolynomial| R (|Kernel| %))) (|an| #2#)
          (|a| (%)))
         (SEQ
          (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT % 79)) 1 (QREFELT % 81)))
          (LETT |an| (SPADCALL |a| (QREFELT % 99)))
          (LETT |dn| (SPADCALL |a| (QREFELT % 101)))
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT % 101)) |r| (QREFELT % 119)))
          (LETT |n0| (SPADCALL |x| (QREFELT % 99)))
          (LETT |c1| (SPADCALL |dp| (QREFELT % 121)))
          (LETT |c0|
                (SPADCALL (SPADCALL |dp| (QREFELT % 122)) (QREFELT % 121)))
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT % 123))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 103) |r| 1
                                                (QREFELT % 124))
                                      |c1| (QREFELT % 123))
                                     |n0| (QREFELT % 123))
                                    (QREFELT % 125))
                          (QREFELT % 123)))
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT % 123)) |dn|
                           (QREFELT % 123))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT % 123)) |c1|
                           (QREFELT % 123))
                 (QREFELT % 125)))
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT % 126)) (LIST |r|) %))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;35| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;35| ((% (|Boolean|))) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;36| ((|x| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|res| (|Boolean|)))
               (SEQ (LETT |res| (SPADCALL (QREFELT % 127)))
                    (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| (%)) (|ckl| (|List| (|Kernel| %))) (% (%)))
        (SPROG
         ((|x1| (%)) (|q| (|SparseUnivariatePolynomial| %)) (#1=#:G174 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G173 NIL)
          (|r| (|Kernel| %)) (|akl| (|List| (|Kernel| %))))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| %))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT % 127))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 103)
                                     (SPADCALL |x1| (QREFELT % 101))
                                     (QREFELT % 126))
                           (QREFELT % 83)))
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#3='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT % 129)))
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| %)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| %))
                                    (GO #4=#:G172))))))))
                             (LETT |sas| (SPADCALL (QREFELT % 131)))
                             (SEQ (LETT |k| NIL) (LETT #1# |akl|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |q|
                                         (SPADCALL |x1| |k|
                                                   (SPADCALL |k|
                                                             (QREFELT % 132))
                                                   (QREFELT % 135)))
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT % 136))
                                                     (QREFELT % 137))
                                           (QREFELT % 138)))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#3# |x1|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp%;38|
        ((|x| (|SparseMultivariatePolynomial| R . #1=((|Kernel| %))))
         (|y| (|SparseMultivariatePolynomial| R . #1#)) (% (%)))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT % 126))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| % 103) (QREFELT % 126))
          (SPADCALL |y| (|spadConstant| % 103) (QREFELT % 126)) %)
         %)) 

(SDEFUN |EXPR;reducedSystem;MM;39| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |m|
                           (QREFELT % 142))
                 (QREFELT % 145)))
          (EXIT (SPADCALL |mm| (QREFELT % 147)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;40|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPROG
         ((|r|
           (|Record|
            (|:| |mat|
                 (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| %))))
            (|:| |vec|
                 (|Vector| (|SparseMultivariatePolynomial| R (|Kernel| %)))))))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |m|
                           (QREFELT % 142))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |v|
                           (QREFELT % 150))
                 (QREFELT % 153)))
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT % 155)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| (|List| (|Kernel| %))) (|y| (|List| (|Kernel| %)))
         (% (|List| (|Kernel| %))))
        (SPROG ((|ans| (|List| (|Kernel| %))) (#1=#:G191 NIL) (|k| NIL))
               (SEQ (LETT |ans| NIL)
                    (SEQ (LETT |k| NIL) (LETT #1# (NREVERSE |x|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| |y| (QREFELT % 157))
                             (LETT |ans|
                                   (SPADCALL |k| |ans| (QREFELT % 158)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS%;42|
        ((|x| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|)) (% (%)))
        (SPADCALL |x| |v| (QREFELT % 160))) 

(SDEFUN |EXPR;rootSum;%SupS%;43|
        ((|x| (%)) (|p| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|))
         (% (%)))
        (SPADCALL |x| |p| |v| (QREFELT % 162))) 

(SDEFUN |EXPR;pi;%;44| ((% (%))) (SPADCALL (QREFELT % 165))) 

(SDEFUN |EXPR;exp;2%;45| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 167))) 

(SDEFUN |EXPR;log;2%;46| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 169))) 

(SDEFUN |EXPR;sin;2%;47| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 171))) 

(SDEFUN |EXPR;cos;2%;48| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 173))) 

(SDEFUN |EXPR;tan;2%;49| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 175))) 

(SDEFUN |EXPR;cot;2%;50| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 177))) 

(SDEFUN |EXPR;sec;2%;51| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 179))) 

(SDEFUN |EXPR;csc;2%;52| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 181))) 

(SDEFUN |EXPR;asin;2%;53| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 183))) 

(SDEFUN |EXPR;acos;2%;54| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 185))) 

(SDEFUN |EXPR;atan;2%;55| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 187))) 

(SDEFUN |EXPR;acot;2%;56| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 189))) 

(SDEFUN |EXPR;asec;2%;57| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 191))) 

(SDEFUN |EXPR;acsc;2%;58| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 193))) 

(SDEFUN |EXPR;sinh;2%;59| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 195))) 

(SDEFUN |EXPR;cosh;2%;60| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 197))) 

(SDEFUN |EXPR;tanh;2%;61| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 199))) 

(SDEFUN |EXPR;coth;2%;62| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 201))) 

(SDEFUN |EXPR;sech;2%;63| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 203))) 

(SDEFUN |EXPR;csch;2%;64| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 205))) 

(SDEFUN |EXPR;asinh;2%;65| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 207))) 

(SDEFUN |EXPR;acosh;2%;66| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 209))) 

(SDEFUN |EXPR;atanh;2%;67| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 211))) 

(SDEFUN |EXPR;acoth;2%;68| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 213))) 

(SDEFUN |EXPR;asech;2%;69| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 215))) 

(SDEFUN |EXPR;acsch;2%;70| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 217))) 

(SDEFUN |EXPR;abs;2%;71| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 220))) 

(SDEFUN |EXPR;sign;2%;72| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 222))) 

(SDEFUN |EXPR;unitStep;2%;73| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 224))) 

(SDEFUN |EXPR;ceiling;2%;74| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 226))) 

(SDEFUN |EXPR;floor;2%;75| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 228))) 

(SDEFUN |EXPR;fractionPart;2%;76| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 230))) 

(SDEFUN |EXPR;diracDelta;2%;77| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 232))) 

(SDEFUN |EXPR;conjugate;2%;78| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 234))) 

(SDEFUN |EXPR;Gamma;2%;79| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 236))) 

(SDEFUN |EXPR;Gamma;3%;80| ((|a| (%)) (|x| (%)) (% (%)))
        (SPADCALL |a| |x| (QREFELT % 238))) 

(SDEFUN |EXPR;Beta;3%;81| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 240))) 

(SDEFUN |EXPR;Beta;4%;82| ((|x| (%)) (|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |x| |a| |b| (QREFELT % 242))) 

(SDEFUN |EXPR;digamma;2%;83| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 244))) 

(SDEFUN |EXPR;polygamma;3%;84| ((|k| (%)) (|x| (%)) (% (%)))
        (SPADCALL |k| |x| (QREFELT % 246))) 

(SDEFUN |EXPR;besselJ;3%;85| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 248))) 

(SDEFUN |EXPR;besselY;3%;86| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 250))) 

(SDEFUN |EXPR;besselI;3%;87| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 252))) 

(SDEFUN |EXPR;besselK;3%;88| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 254))) 

(SDEFUN |EXPR;airyAi;2%;89| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 256))) 

(SDEFUN |EXPR;airyAiPrime;2%;90| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 258))) 

(SDEFUN |EXPR;airyBi;2%;91| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 260))) 

(SDEFUN |EXPR;airyBiPrime;2%;92| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 262))) 

(SDEFUN |EXPR;lambertW;2%;93| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 264))) 

(SDEFUN |EXPR;polylog;3%;94| ((|s| (%)) (|x| (%)) (% (%)))
        (SPADCALL |s| |x| (QREFELT % 266))) 

(SDEFUN |EXPR;weierstrassP;4%;95| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 268))) 

(SDEFUN |EXPR;weierstrassPPrime;4%;96|
        ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 270))) 

(SDEFUN |EXPR;weierstrassSigma;4%;97| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 272))) 

(SDEFUN |EXPR;weierstrassZeta;4%;98| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 274))) 

(SDEFUN |EXPR;weierstrassPInverse;4%;99|
        ((|g2| (%)) (|g3| (%)) (|z| (%)) (% (%)))
        (SPADCALL |g2| |g3| |z| (QREFELT % 276))) 

(SDEFUN |EXPR;whittakerM;4%;100| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 278))) 

(SDEFUN |EXPR;whittakerW;4%;101| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 280))) 

(SDEFUN |EXPR;angerJ;3%;102| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 282))) 

(SDEFUN |EXPR;weberE;3%;103| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 284))) 

(SDEFUN |EXPR;struveH;3%;104| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 286))) 

(SDEFUN |EXPR;struveL;3%;105| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 288))) 

(SDEFUN |EXPR;hankelH1;3%;106| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 290))) 

(SDEFUN |EXPR;hankelH2;3%;107| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 292))) 

(SDEFUN |EXPR;lommelS1;4%;108| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 294))) 

(SDEFUN |EXPR;lommelS2;4%;109| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 296))) 

(SDEFUN |EXPR;kummerM;4%;110| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 298))) 

(SDEFUN |EXPR;kummerU;4%;111| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 300))) 

(SDEFUN |EXPR;legendreP;4%;112| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 302))) 

(SDEFUN |EXPR;legendreQ;4%;113| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 304))) 

(SDEFUN |EXPR;kelvinBei;3%;114| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 306))) 

(SDEFUN |EXPR;kelvinBer;3%;115| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 308))) 

(SDEFUN |EXPR;kelvinKei;3%;116| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 310))) 

(SDEFUN |EXPR;kelvinKer;3%;117| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 312))) 

(SDEFUN |EXPR;ellipticK;2%;118| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 314))) 

(SDEFUN |EXPR;ellipticE;2%;119| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 316))) 

(SDEFUN |EXPR;ellipticE;3%;120| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 318))) 

(SDEFUN |EXPR;ellipticF;3%;121| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 320))) 

(SDEFUN |EXPR;ellipticPi;4%;122| ((|z| (%)) (|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |n| |m| (QREFELT % 322))) 

(SDEFUN |EXPR;jacobiSn;3%;123| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 324))) 

(SDEFUN |EXPR;jacobiCn;3%;124| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 326))) 

(SDEFUN |EXPR;jacobiDn;3%;125| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 328))) 

(SDEFUN |EXPR;jacobiZeta;3%;126| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 330))) 

(SDEFUN |EXPR;jacobiTheta;3%;127| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 332))) 

(SDEFUN |EXPR;lerchPhi;4%;128| ((|z| (%)) (|s| (%)) (|a| (%)) (% (%)))
        (SPADCALL |z| |s| |a| (QREFELT % 334))) 

(SDEFUN |EXPR;riemannZeta;2%;129| ((|z| (%)) (% (%)))
        (SPADCALL |z| (QREFELT % 336))) 

(SDEFUN |EXPR;charlierC;4%;130| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 338))) 

(SDEFUN |EXPR;hermiteH;3%;131| ((|n| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |z| (QREFELT % 340))) 

(SDEFUN |EXPR;jacobiP;5%;132| ((|n| (%)) (|a| (%)) (|b| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |z| (QREFELT % 342))) 

(SDEFUN |EXPR;laguerreL;4%;133| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 344))) 

(SDEFUN |EXPR;meixnerM;5%;134|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 346))) 

(SDEFUN |EXPR;hypergeometricF;2L2%;135|
        ((|la| #1=(|List| %)) (|lb| #1#) (|x| (%)) (% (%)))
        (SPADCALL |la| |lb| |x| (QREFELT % 348))) 

(SDEFUN |EXPR;meijerG;4L2%;136|
        ((|la| #1=(|List| %)) (|lb| #1#) (|lc| #1#) (|ld| #1#) (|x| (%))
         (% (%)))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT % 351))) 

(SDEFUN |EXPR;^;3%;137| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 354))) 

(SDEFUN |EXPR;factorial;2%;138| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 355))) 

(SDEFUN |EXPR;binomial;3%;139| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 357))) 

(SDEFUN |EXPR;permutation;3%;140| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 359))) 

(SDEFUN |EXPR;factorials;2%;141| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 361))) 

(SDEFUN |EXPR;factorials;%S%;142| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 363))) 

(SDEFUN |EXPR;summation;%S%;143| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 365))) 

(SDEFUN |EXPR;summation;%Sb%;144|
        ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 368))) 

(SDEFUN |EXPR;product;%S%;145| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 371))) 

(SDEFUN |EXPR;product;%Sb%;146| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 373))) 

(SDEFUN |EXPR;erf;2%;147| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 376))) 

(SDEFUN |EXPR;erfi;2%;148| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 378))) 

(SDEFUN |EXPR;Ei;2%;149| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 380))) 

(SDEFUN |EXPR;Si;2%;150| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 382))) 

(SDEFUN |EXPR;Ci;2%;151| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 384))) 

(SDEFUN |EXPR;Shi;2%;152| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 386))) 

(SDEFUN |EXPR;Chi;2%;153| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 388))) 

(SDEFUN |EXPR;li;2%;154| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 390))) 

(SDEFUN |EXPR;dilog;2%;155| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 392))) 

(SDEFUN |EXPR;fresnelS;2%;156| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 394))) 

(SDEFUN |EXPR;fresnelC;2%;157| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 396))) 

(SDEFUN |EXPR;integral;%S%;158| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 398))) 

(SDEFUN |EXPR;integral;%Sb%;159| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 400))) 

(SDEFUN |EXPR;operator;2Bo;160| ((|op| #1=(|BasicOperator|)) (% #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT % 402))
                  (SPADCALL |op| (QREFELT % 403)))
                 ((SPADCALL |op| (QREFELT % 404))
                  (SPADCALL |op| (QREFELT % 405)))
                 ((SPADCALL |op| (QREFELT % 406))
                  (SPADCALL |op| (QREFELT % 407)))
                 ((SPADCALL |op| (QREFELT % 408))
                  (SPADCALL |op| (QREFELT % 409)))
                 ((SPADCALL |op| (QREFELT % 410))
                  (SPADCALL |op| (QREFELT % 411)))
                 ((SPADCALL |op| (QREFELT % 21))
                  (SPADCALL |op| (QREFELT % 22)))
                 ((SPADCALL |op| (QREFELT % 24))
                  (SPADCALL |op| (QREFELT % 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT % 26))
                     (COND
                      ((SPADCALL |op| (QREFELT % 7) (QREFELT % 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT % 29))
                                   (QREFELT % 30))
                         (QREFELT % 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT % 33)))
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QREFELT % 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QCDR |n|)
                                (QREFELT % 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| (%)) (|l| (|List| (|Kernel| %))) (% (%)))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| %)) (#1=#:G329 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT % 132)))
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|EXPR;evl| (SPADCALL |x| (QREFELT % 99)) |k| |p|
                             %)
                            (|EXPR;evl| (SPADCALL |x| (QREFELT % 101)) |k| |p|
                             %)
                            (QREFELT % 68)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |EXPR;evl0|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %))))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 413)) |k| (QREFELT % 416))
                  (QREFELT % 418))) 

(SDEFUN |EXPR;evl|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %)) (|m| (|SparseUnivariatePolynomial| %))
         (% (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT % 419)) (SPADCALL |m| (QREFELT % 420)))
          (SPADCALL |p| (QREFELT % 413)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| %) |m| (QREFELT % 421))
                    (SPADCALL (SPADCALL |k| (QREFELT % 422)) (QREFELT % 413))
                    (QREFELT % 423))))) 

(SDEFUN |EXPR;noalg?| ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPROG ((#1=#:G339 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| % 424)
                                    (QREFELT % 425)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT % 426))
                                        (QREFELT % 75))
                              %)))
                           (PROGN (LETT #1# NIL) (GO #2=#:G338)))
                          ('T (LETT |p| (SPADCALL |p| (QREFELT % 427)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |EXPR;algkers|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|List| (|Kernel| %))))
        (SPROG ((|res| (|List| (|Kernel| %))) (|lc| (%)))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 424)
                                      (QREFELT % 425)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT % 426)))
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT % 83))
                                              |res| (QREFELT % 428)))
                              (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 427)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT % 429)))))) 

(SDEFUN |EXPR;algpars| ((|lk| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG
         ((|res| (|List| (|Kernel| %))) (|arg| (|List| %)) (#1=#:G352 NIL)
          (|k| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 116)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT % 116)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT % 79)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT % 81))
                                      (QREFELT % 75))
                            |res| (QREFELT % 428)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 429)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| %)
                  (SPADCALL |p| (QREFELT % 431)) (QREFELT % 433))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 101)) (|spadConstant| % 103)
                  (QREFELT % 430))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| (|SparseUnivariatePolynomial| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPADCALL (ELT % 99) |p| (QREFELT % 436))) 

(SDEFUN |EXPR;def_poly|
        ((|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G363 NIL)
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| %))) (|arg2| (%))
          (|arg1| (%)) (|args| (|List| %)))
         (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 79)))
              (LETT |arg1| (SPADCALL |args| (QREFELT % 85)))
              (LETT |arg2| (SPADCALL |args| 2 (QREFELT % 81)))
              (EXIT
               (COND
                ((SPADCALL |k| '|rootOf| (QREFELT % 116))
                 (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT % 99)))
                      (EXIT
                       (SPADCALL |p1| (SPADCALL |arg2| (QREFELT % 13))
                                 (QREFELT % 119)))))
                ((SPADCALL |k| '|nthRoot| (QREFELT % 116))
                 (SEQ
                  (LETT |n|
                        (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT % 437)))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 101)) |n|
                              (QREFELT % 438))
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 99)) (QREFELT % 439))
                    (QREFELT % 440)))))
                ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| (|Kernel| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Symbol|)))
        (SPROG
         ((#1=#:G372 NIL) (#2=#:G373 NIL) (|k| NIL) (#3=#:G374 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #3# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #3#)
                       (PROGN (LETT |s| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |k0| (QREFELT % 441))
                     (PROGN (LETT #1# |s|) (GO #4=#:G371))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| (|Symbol|)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Kernel| %)))
        (SPROG
         ((#1=#:G386 NIL) (#2=#:G387 NIL) (|k| NIL) (#3=#:G388 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #3# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #3#)
                       (PROGN (LETT |s| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| |s0|) (PROGN (LETT #1# |k|) (GO #4=#:G385))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap2: symbol not on the list"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;MP_to_PI|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Polynomial| (|Integer|))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;MP_to_PI!0| (VECTOR |ls| |lk| %))
                         (ELT % 446) |p| (QREFELT % 450)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 443) (|EXPR;varmap1| |k| |lk| |ls| %)
                      (|spadConstant| % 444) (QREFELT % 445)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (|xk| (|Kernel| %)) (% (|Polynomial| (|Integer|))))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |p2| (SPADCALL |p| |xk| (QREFELT % 451)))
                    (EXIT (|EXPR;MP_to_PI| |p2| |lk| |ls| %))))) 

(SDEFUN |EXPR;SUP_to_PI|
        ((|p| (|SparseUnivariatePolynomial| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|xk| (|Kernel| %))
         (% (|Polynomial| (|Integer|))))
        (SPROG
         ((|p1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %)))))
         (SEQ (LETT |p1| (|EXPR;SUP_to_SUPP| |p| %))
              (EXIT (|EXPR;SUPP_to_PI| |p1| |lk| |ls| |xk| %))))) 

(SDEFUN |EXPR;PI_to_SUP|
        ((|p| (|Polynomial| (|Integer|))) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|xk| (|Kernel| %))
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|p3| (|SparseUnivariatePolynomial| %))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (SEQ
          (LETT |p1|
                (SPADCALL (CONS #'|EXPR;PI_to_SUP!0| (VECTOR |ls| |lk| %))
                          (ELT % 455) |p| (QREFELT % 459)))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT % 119)))
          (EXIT (LETT |p3| (SPADCALL (ELT % 104) |p2| (QREFELT % 462))))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 103) (|EXPR;varmap2| |s| |lk| |ls| %)
                      (|spadConstant| % 444) (QREFELT % 124)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| (%)) (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 99)) |lk| |ls| %)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 101)) |lk| |ls| %)
                  (QREFELT % 467))) 

(SDEFUN |EXPR;SUPP_to_PT|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (|k| (|Kernel| %)) (|s| (|Symbol|))
         (%
          (|Record| (|:| |var| (|Symbol|))
                    (|:| |coef|
                         (|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| (|Integer|))))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|p2| (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (SEQ (LETT |p2| (SPADCALL |p| |k| (QREFELT % 451)))
              (LETT |up|
                    (SPADCALL
                     (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| %)
                               (QREFELT % 468))
                     (QREFELT % 470)))
              (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT|
        ((|p| (|SparseUnivariatePolynomial| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|s| (|Symbol|))
         (%
          (|Record| (|:| |var| (|Symbol|))
                    (|:| |coef|
                         (|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| (|Integer|))))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ
          (LETT |up|
                (SPADCALL (CONS #'|EXPR;SUP_to_PT!0| (VECTOR % |ls| |lk|)) |p|
                          (QREFELT % 473)))
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |ls| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| %))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;179|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G446 NIL) (|m| NIL) (#3=#:G447 NIL) (|k| NIL) (#4=#:G445 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G444 NIL) (#7=#:G443 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G441 NIL)
          (#9=#:G442 NIL) (#10=#:G440 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G439 NIL)
          (#13=#:G438 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| %)))))
          (#14=#:G437 NIL) (#15=#:G436 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| %))) (|xk| (|Kernel| %))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G435 NIL)
          (#18=#:G434 NIL) (|akers| (|List| (|Kernel| %)))
          (|all_kers0| (|List| (|Kernel| %))) (|apars| (|List| (|Kernel| %)))
          (|cl| (|List| %)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| % 424) (QREFELT % 474)) |q|)
                ((EQL (SPADCALL |p| (QREFELT % 420)) 0) (|spadConstant| % 475))
                ((SPADCALL |q| (|spadConstant| % 424) (QREFELT % 474)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT % 420)) 0)
                   (|spadConstant| % 475))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| %)
                      (COND
                       ((|EXPR;noalg?| |q| %)
                        (EXIT (SPADCALL |p| |q| (QREFELT % 476)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT % 431))
                                    (SPADCALL |q| (QREFELT % 431))
                                    (QREFELT % 477)))
                    (LETT |akers| (SPADCALL |cl| (QREFELT % 478)))
                    (LETT |apars| (|EXPR;algpars| |akers| %))
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT % 479)) |apars|
                                    (QREFELT % 480)))
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT % 481))))
                    (LETT |all_syms0|
                          (PROGN
                           (LETT #18# NIL)
                           (SEQ (LETT |k| NIL) (LETT #17# |all_kers0|) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN (LETT |k| (CAR #17#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #18#
                                        (CONS (SPADCALL (QREFELT % 482))
                                              #18#))))
                                (LETT #17# (CDR #17#)) (GO G190) G191
                                (EXIT (NREVERSE #18#)))))
                    (LETT |x| (SPADCALL (QREFELT % 482)))
                    (LETT |xk| (SPADCALL |x| (QREFELT % 30)))
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT % 483)))
                    (LETT |all_syms| (CONS |x| |all_syms0|))
                    (LETT |lm|
                          (PROGN
                           (LETT #15# NIL)
                           (SEQ (LETT |k| NIL) (LETT #14# |akers|) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |k| (CAR #14#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #15#
                                        (CONS (|EXPR;def_poly| |k| %) #15#))))
                                (LETT #14# (CDR #14#)) (GO G190) G191
                                (EXIT (NREVERSE #15#)))))
                    (LETT |a_syms|
                          (PROGN
                           (LETT #13# NIL)
                           (SEQ (LETT |k| NIL) (LETT #12# |akers|) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |k| (CAR #12#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (|EXPR;varmap1| |k| |all_kers|
                                          |all_syms| %)
                                         #13#))))
                                (LETT #12# (CDR #12#)) (GO G190) G191
                                (EXIT (NREVERSE #13#)))))
                    (LETT |p_syms|
                          (SPADCALL |all_syms0| |a_syms| (QREFELT % 484)))
                    (COND
                     ((|EXPR;trivial_denoms| |p| %)
                      (COND
                       ((|EXPR;trivial_denoms| |q| %)
                        (EXIT
                         (SEQ
                          (LETT |p1|
                                (|EXPR;SUP_to_PI| |p| |all_kers| |all_syms|
                                 |xk| %))
                          (LETT |q1|
                                (|EXPR;SUP_to_PI| |q| |all_kers| |all_syms|
                                 |xk| %))
                          (LETT |lm1|
                                (PROGN
                                 (LETT #10# NIL)
                                 (SEQ (LETT |k| NIL) (LETT #9# |akers|)
                                      (LETT |m| NIL) (LETT #8# |lm|) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN (LETT |m| (CAR #8#)) NIL)
                                            (ATOM #9#)
                                            (PROGN (LETT |k| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (|EXPR;SUPP_to_PI| |m|
                                                |all_kers| |all_syms| |k| %)
                                               #10#))))
                                      (LETT #8#
                                            (PROG1 (CDR #8#)
                                              (LETT #9# (CDR #9#))))
                                      (GO G190) G191 (EXIT (NREVERSE #10#)))))
                          (LETT |a_syms|
                                (PROGN
                                 (LETT #7# NIL)
                                 (SEQ (LETT |k| NIL) (LETT #6# |akers|) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN (LETT |k| (CAR #6#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (|EXPR;varmap1| |k| |all_kers|
                                                |all_syms| %)
                                               #7#))))
                                      (LETT #6# (CDR #6#)) (GO G190) G191
                                      (EXIT (NREVERSE #7#)))))
                          (LETT |p_syms|
                                (SPADCALL |all_syms0| |a_syms|
                                          (QREFELT % 484)))
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT % 486)))
                          (EXIT
                           (|EXPR;PI_to_SUP| |g1| |all_kers| |all_syms| |xk|
                            %))))))))
                    (LETT |p2|
                          (|EXPR;SUP_to_PT| |p| |all_kers0| |all_syms0| |x| %))
                    (LETT |q2|
                          (|EXPR;SUP_to_PT| |q| |all_kers0| |all_syms0| |x| %))
                    (LETT |lm2|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |k| NIL) (LETT #3# |akers|)
                                (LETT |m| NIL) (LETT #2# |lm|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#)) NIL)
                                      (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (|EXPR;SUPP_to_PT| |m| |all_kers0|
                                          |all_syms0| |k| |x| %)
                                         #4#))))
                                (LETT #2#
                                      (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                                (GO G190) G191 (EXIT (NREVERSE #4#)))))
                    (LETT |g2|
                          (SPADCALL |p2| |q2| |lm2| |p_syms| |x| |a_syms|
                                    (QREFELT % 489)))
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      %)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;180|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| %)
           (COND
            ((|EXPR;noalg?| |q| %)
             (EXIT (SPADCALL |p| |q| (QREFELT % 476)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT % 492))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;181|
        ((|x| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |x| (QREFELT % 495))) 

(SDEFUN |EXPR;coerce;An%;182| ((|x| (|AlgebraicNumber|)) (% (%)))
        (SPADCALL (SPADCALL |x| (|spadConstant| % 499) (QREFELT % 500))
                  (QREFELT % 104))) 

(SDEFUN |EXPR;^;%F%;183| ((|x| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |x| |r| (QREFELT % 504))) 

(SDEFUN |EXPR;minPoly;KSup;184|
        ((|k| (|Kernel| %)) (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |k| (QREFELT % 506))) 

(SDEFUN |EXPR;definingPolynomial;2%;185| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 507))) 

(SDEFUN |EXPR;retract;%F;186| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL |x| (QREFELT % 509))) 

(SDEFUN |EXPR;retractIfCan;%U;187|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 511))) 

(SDEFUN |EXPR;coerce;An%;188| ((|x| (|AlgebraicNumber|)) (% (%)))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT % 513)) %)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT % 514)) %)
                  (QREFELT % 69))) 

(SDEFUN |EXPR;k2expr| ((|k| (|Kernel| (|AlgebraicNumber|))) (% (%)))
        (SPADCALL (ELT % 502) |k| (QREFELT % 518))) 

(SDEFUN |EXPR;smp2expr|
        ((|p|
          (|SparseMultivariatePolynomial| (|Integer|)
                                          (|Kernel| (|AlgebraicNumber|))))
         (% (%)))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) %) (ELT % 61) |p|
                  (QREFELT % 523))) 

(SDEFUN |EXPR;retractIfCan;%U;191|
        ((|x| (%)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((#1=#:G486 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 99)) %))
                 (EXIT
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (LETT |d|
                           (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 101)) %))
                     (EXIT
                      (COND
                       ((QEQCAR |d| 0)
                        (PROGN
                         (LETT #1#
                               (CONS 0
                                     (SPADCALL (QCDR |n|) (QCDR |d|)
                                               (QREFELT % 524))))
                         (GO #3=#:G481))))))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| (R)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT % 527)) (QREFELT % 72)))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT % 528))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an|
        ((|k| (|Kernel| %)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G520 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G521 NIL)
          (|x| NIL)
          (|eq|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|eqa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|ccu| #2#) (|cc| (%)) (|a1| (%)) (|s1| (|Symbol|))
          (|s1u| (|Union| (|Symbol|) #3#)) (|k1| (|Kernel| %))
          (|k1u| (|Union| (|Kernel| %) #3#)) (|a2| (%)) (|args| (|List| %))
          (|op| (|BasicOperator|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (SPADCALL (LETT |op| (SPADCALL |k| (QREFELT % 31)))
                        (QREFELT % 529)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT % 530))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 79)))
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT % 81)))
                    (LETT |k1u| (SPADCALL |a2| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#5='T
                            (SEQ (LETT |k1| (QCDR |k1u|))
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT % 532)))
                                 (EXIT
                                  (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                        (#5#
                                         (SEQ (LETT |s1| (QCDR |s1u|))
                                              (LETT |a1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT % 81)))
                                              (EXIT
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |a1|
                                                            (QREFELT % 101))
                                                  (|spadConstant| % 103)
                                                  (QREFELT % 533))
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#5#
                                                 (SEQ
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT %
                                                                            99))
                                                         |k1| (QREFELT % 119)))
                                                  (LETT |eqa|
                                                        (|spadConstant| % 535))
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     % 536)
                                                                    (QREFELT %
                                                                             537)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          %
                                                                          121))
                                                               (QREFELT %
                                                                        104)))
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         %
                                                                         526)))
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed"))
                                                            (GO #6=#:G519)))
                                                          ('T
                                                           (SEQ
                                                            (LETT |eqa|
                                                                  (SPADCALL
                                                                   |eqa|
                                                                   (SPADCALL
                                                                    (QCDR
                                                                     |ccu|)
                                                                    (SPADCALL
                                                                     |eq|
                                                                     (QREFELT %
                                                                              538))
                                                                    (QREFELT %
                                                                             539))
                                                                   (QREFELT %
                                                                            540)))
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT %
                                                                             122)))))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT %
                                                                            541))))))))))))))))))
              (#5#
               (SEQ (LETT |arg| NIL)
                    (SEQ (LETT |x| NIL)
                         (LETT #4# (SPADCALL |k| (QREFELT % 79))) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT % 526)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN (LETT #1# (CONS 1 "failed")) (GO #6#)))
                                ('T (LETT |arg| (CONS (QCDR |a|) |arg|))))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT % 542))
                                     (NREVERSE |arg|) (QREFELT % 543))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (% (|Union| (|AlgebraicNumber|) #1="failed")))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G537 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| %))
          (|x1| (|Union| (|Kernel| %) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT % 545)))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT % 546)) %))
                  (#3='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|))
                                    (QREFELT % 119)))
                    (LETT |t| (|EXPR;k2an| |k| %))
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#3#
                            (SEQ (LETT |ans| (|spadConstant| % 547))
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT % 548))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT % 121))
                                              %))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed"))
                                           (GO #4=#:G536)))
                                         ('T
                                          (SEQ
                                           (LETT |ans|
                                                 (SPADCALL |ans|
                                                           (SPADCALL (QCDR |c|)
                                                                     (SPADCALL
                                                                      (QCDR
                                                                       |t|)
                                                                      (SPADCALL
                                                                       |up|
                                                                       (QREFELT
                                                                        % 538))
                                                                      (QREFELT
                                                                       % 549))
                                                                     (QREFELT %
                                                                              550))
                                                           (QREFELT % 551)))
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT %
                                                                     122)))))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT % 121)) %))
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#3#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT %
                                                                  551))))))))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;%If;195| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 553))) 

(SDEFUN |EXPR;eval;%Bo%S%;196|
        ((|f| (%)) (|op| (|BasicOperator|)) (|g| (%)) (|x| (|Symbol|)) (% (%)))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT % 556))) 

(SDEFUN |EXPR;eval;%LLS%;197|
        ((|f| (%)) (|ls| (|List| (|BasicOperator|))) (|lg| (|List| %))
         (|x| (|Symbol|)) (% (%)))
        (SPROG
         ((|res| (%)) (#1=#:G575 NIL) (|g| NIL) (#2=#:G574 NIL)
          (|nlg| (|List| %)) (#3=#:G573 NIL) (#4=#:G572 NIL)
          (|lbackwardSubs| (|List| (|Equation| %))) (#5=#:G570 NIL) (|i| NIL)
          (#6=#:G571 NIL) (|j| NIL) (#7=#:G569 NIL)
          (|lforwardSubs| (|List| (|Equation| %))) (#8=#:G567 NIL)
          (#9=#:G568 NIL) (#10=#:G566 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G565 NIL) (#12=#:G564 NIL) (#13=#:G563 NIL) (#14=#:G562 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G561 NIL)
          (#16=#:G560 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL)
                 (SEQ (LETT |g| NIL) (LETT #15# |lg|) G190
                      (COND
                       ((OR (ATOM #15#) (PROGN (LETT |g| (CAR #15#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS (SPADCALL |g| (QREFELT % 558)) #16#))))
                      (LETT #15# (CDR #15#)) (GO G190) G191
                      (EXIT (NREVERSE #16#)))))
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT % 559)) (QREFELT % 560)))
          (LETT |lsd| (SPADCALL (ELT % 561) |lsym| (QREFELT % 563)))
          (EXIT
           (COND
            ((NULL |lsd|)
             (SPADCALL |f| |ls|
                       (PROGN
                        (LETT #14# NIL)
                        (SEQ (LETT |g| NIL) (LETT #13# |lg|) G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |g| (CAR #13#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #14#
                                     (CONS (SPADCALL |g| |x| (QREFELT % 565))
                                           #14#))))
                             (LETT #13# (CDR #13#)) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT % 568)))
            ('T
             (SEQ
              (LETT |ns|
                    (PROGN
                     (LETT #12# NIL)
                     (SEQ (LETT |i| NIL) (LETT #11# |lsd|) G190
                          (COND
                           ((OR (ATOM #11#) (PROGN (LETT |i| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS (SPADCALL (QREFELT % 482)) #12#))))
                          (LETT #11# (CDR #11#)) (GO G190) G191
                          (EXIT (NREVERSE #12#)))))
              (LETT |lforwardSubs|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |j| NIL) (LETT #9# |ns|) (LETT |i| NIL)
                          (LETT #8# |lsd|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL)
                                (ATOM #9#) (PROGN (LETT |j| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL (SPADCALL |i| (QREFELT % 569))
                                             (SPADCALL |j| (QREFELT % 569))
                                             (QREFELT % 571))
                                   #10#))))
                          (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#))))
                          (GO G190) G191 (EXIT (NREVERSE #10#)))))
              (LETT |lbackwardSubs|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |j| NIL) (LETT #6# |ns|) (LETT |i| NIL)
                          (LETT #5# |lsd|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL)
                                (ATOM #6#) (PROGN (LETT |j| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |j| (QREFELT % 569))
                                             (SPADCALL |i| (QREFELT % 569))
                                             (QREFELT % 571))
                                   #7#))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT (NREVERSE #7#)))))
              (LETT |nlg|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL |g| |lforwardSubs|
                                             (QREFELT % 573))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |res|
                    (SPADCALL |f| |ls|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |g| NIL) (LETT #1# |nlg|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |g| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |g| |x| (QREFELT % 565))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 568)))
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT % 573)))))))))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;198|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 577))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;199|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 583))) 

(SDEFUN |EXPR;Zero;%;200| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;One;%;201| ((% (%))) (|spadConstant| % 48)) 

(SDEFUN |EXPR;-;2%;202| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;*;I2%;203| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 58))) 

(SDEFUN |EXPR;*;3%;204| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 62))) 

(SDEFUN |EXPR;+;3%;205| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;206| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;207| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(PUT '|EXPR;numer;%Smp;208| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;%Smp;208|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %)))) |x|) 

(PUT '|EXPR;coerce;Smp%;209| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp%;209|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%))) |p|) 

(SDEFUN |EXPR;coerce;P%;210| ((|p| (|Polynomial| R)) (% (%)))
        (|EXPR;poly_to_MP| |p| %)) 

(SDEFUN |EXPR;reducedSystem;MM;211| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPADCALL |m| (QREFELT % 586))) 

(SDEFUN |EXPR;reducedSystem;MVR;212|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPADCALL |m| |v| (QREFELT % 587))) 

(SDEFUN |EXPR;convert;%If;213| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 553))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Integer|)))
         (|l| (|PatternMatchResult| (|Integer|) |Rep|))
         (% (|PatternMatchResult| (|Integer|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 589))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;215|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) %)
                  (QREFELT % 593))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Float|)))
         (|l| (|PatternMatchResult| (|Float|) |Rep|))
         (% (|PatternMatchResult| (|Float|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 595))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;217|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) %)
                  (QREFELT % 599))) 

(SDEFUN |EXPR;Zero;%;218| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;+;3%;219| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;220| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;221| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;coerce;K%;222| ((|k| (|Kernel| %)) (% (%)))
        (SPADCALL 1 |k| (QREFELT % 600))) 

(SDEFUN |EXPR;kernels;%L;223| ((|x| (%)) (% (|List| (|Kernel| %))))
        (SPROG ((#1=#:G615 NIL) (|f| NIL) (#2=#:G614 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 603)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R%;224| ((|x| (R)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 604)) (|spadConstant| % 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT % 605)) (QREFELT % 136))))) 

(SDEFUN |EXPR;retract;%R;225| ((|x| (%)) (% (R)))
        (COND ((SPADCALL |x| (QREFELT % 54)) (|spadConstant| % 87))
              ('T (|EXPR;retNotUnit| |x| %)))) 

(SDEFUN |EXPR;coerce;%Of;226| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 607))) 

(SDEFUN |EXPR;kereval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 613)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR % |lv| |lk|))
                             |x2| (QREFELT % 610))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT % 609)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 613))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G648 NIL) (|a| NIL) (#2=#:G647 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x| (QREFELT % 31))
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #1# (SPADCALL |x| (QREFELT % 79)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |a| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 614))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 615)))))))) 

(SDEFUN |EXPR;isPlus;%U;229| ((|x| (%)) (% (|Union| (|List| %) "failed")))
        (SPROG
         ((#1=#:G664 NIL) (|t| NIL) (#2=#:G663 NIL)
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 603))))
                (NULL (CDR |l|)))
            (CONS 1 "failed"))
           ('T
            (CONS 0
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QCDR |t|) (QCAR |t|)
                                           (QREFELT % 600))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;%U;230|
        ((|x| (%))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| %)))
                   "failed")))
        (SPROG
         ((|t| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 603))))
                (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT % 618)))
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;%LL%;231|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G680 NIL) (#2=#:G679 (%)) (#3=#:G681 (%)) (#4=#:G683 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# (SPADCALL |x| (QREFELT % 603))) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;kereval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 65))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;subst;%LL%;232|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G686 NIL) (#2=#:G685 (%)) (#3=#:G687 (%)) (#4=#:G689 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# (SPADCALL |x| (QREFELT % 603))) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;subeval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 65))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;retractIfCan;%U;233| ((|x| (%)) (% (|Union| R "failed")))
        (COND ((SPADCALL |x| (QREFELT % 54)) (CONS 0 (|spadConstant| % 87)))
              ('T (|EXPR;retNotUnitIfCan| |x| %)))) 

(SDEFUN |EXPR;-;2%;234| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;smaller?;2%B;235| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;=;2%B;236| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(PUT '|EXPR;coerce;K%;237| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K%;237| ((|k| (|Kernel| %)) (% (%))) |k|) 

(PUT '|EXPR;kernels;%L;238| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;%L;238| ((|x| (%)) (% (|List| (|Kernel| %)))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R%;239| ((|x| (R)) (% (%))) (SPADCALL |x| (QREFELT % 605))) 

(SDEFUN |EXPR;retract;%R;240| ((|x| (%)) (% (R))) (|EXPR;retNotUnit| |x| %)) 

(SDEFUN |EXPR;retractIfCan;%U;241| ((|x| (%)) (% (|Union| R "failed")))
        (|EXPR;retNotUnitIfCan| |x| %)) 

(SDEFUN |EXPR;coerce;%Of;242| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 607))) 

(SDEFUN |EXPR;eval;%LL%;243|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;%LL%;243!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 613)))) 

(SDEFUN |EXPR;eval;%LL%;243!1| ((|x1| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;%LL%;243!0| (VECTOR % |lv| |lk|)) |x1|
                    (QREFELT % 610))))))) 

(SDEFUN |EXPR;eval;%LL%;243!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT % 609)))))) 

(SDEFUN |EXPR;subst;%LL%;244|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;%LL%;244!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 613))))) 

(SDEFUN |EXPR;subst;%LL%;244!0| ((|x1| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G734 NIL) (|a| NIL) (#2=#:G733 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x1| (QREFELT % 31))
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #1# (SPADCALL |x1| (QREFELT % 79)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |a| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 614))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 615)))))))) 

(SDEFUN |EXPR;convert;%If;245| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 553))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G781)
  (SPROG NIL
         (PROG (#2=#:G782)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Expression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Expression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Expression|)))))))))) 

(DEFUN |Expression;| (|#1|)
  (SPROG
   ((#1=#:G780 NIL) (|pv$| NIL) (#2=#:G775 NIL) (#3=#:G776 NIL) (#4=#:G777 NIL)
    (#5=#:G778 NIL) (#6=#:G779 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Expression| DV$1))
    (LETT % (GETREFV 654))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #6#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)
                                        (|HasCategory| |#1| '(|Group|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #6#)
                                         #2#
                                         (|HasCategory| |#1| '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #6#)
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 8589934592))
    (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 17179869184))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 34359738368))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 68719476736))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 137438953472))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 '|%symbol|)
    (QSETREFV % 8 '|%alg|)
    (COND ((|testBitVector| |pv$| 1))
          ('T
           (QSETREFV % 37
                     (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) %))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV % 45
                    (|Fraction|
                     (|SparseMultivariatePolynomial| |#1| (|Kernel| %))))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;%;6|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;%;7|) % 49)))
          (QSETREFV % 52 (CONS (|dispatchFunction| |EXPR;one?;%B;8|) %))
          (QSETREFV % 54 (CONS (|dispatchFunction| |EXPR;zero?;%B;9|) %))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;10|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;11|) %))
          (QSETREFV % 61 (CONS (|dispatchFunction| |EXPR;coerce;I%;12|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;13|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;14|) %))
          (QSETREFV % 67 (CONS (|dispatchFunction| |EXPR;-;3%;15|) %))
          (QSETREFV % 69 (CONS (|dispatchFunction| |EXPR;/;3%;16|) %))
          (QSETREFV % 73 (CONS (|dispatchFunction| |EXPR;number?;%B;17|) %))
          (QSETREFV % 90 (CONS (|dispatchFunction| |EXPR;^;%Nni%;19|) %))
          (QSETREFV % 91 (CONS (|dispatchFunction| |EXPR;^;%I%;20|) %))
          (QSETREFV % 93 (CONS (|dispatchFunction| |EXPR;^;%Pi%;21|) %))
          (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;22|) %))
          (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;23|) %))
          (QSETREFV % 99 (CONS (|dispatchFunction| |EXPR;numer;%Smp;24|) %))
          (QSETREFV % 101 (CONS (|dispatchFunction| |EXPR;denom;%Smp;25|) %))
          (QSETREFV % 102
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))))
          (QSETREFV % 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;26|) %))
          (QSETREFV % 106 (CONS (|dispatchFunction| |EXPR;coerce;P%;27|) %))
          (QSETREFV % 110 (CONS (|dispatchFunction| |EXPR;coerce;F%;28|) %))
          (QSETREFV % 111 (CONS (|dispatchFunction| |EXPR;reduce;2%;29|) %))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV % 127
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;35|) %))
          (QSETREFV % 128
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;36|)
                     %))
          (QSETREFV % 139 (CONS (|dispatchFunction| |EXPR;/;2Smp%;38|) %))
          (QSETREFV % 148
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;39|) %))
          (QSETREFV % 156
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;40|) %))
          (QSETREFV % 161 (CONS (|dispatchFunction| |EXPR;rootOf;SupS%;42|) %))
          (QSETREFV % 163
                    (CONS (|dispatchFunction| |EXPR;rootSum;%SupS%;43|) %))
          (QSETREFV % 166 (CONS (|dispatchFunction| |EXPR;pi;%;44|) %))
          (QSETREFV % 168 (CONS (|dispatchFunction| |EXPR;exp;2%;45|) %))
          (QSETREFV % 170 (CONS (|dispatchFunction| |EXPR;log;2%;46|) %))
          (QSETREFV % 172 (CONS (|dispatchFunction| |EXPR;sin;2%;47|) %))
          (QSETREFV % 174 (CONS (|dispatchFunction| |EXPR;cos;2%;48|) %))
          (QSETREFV % 176 (CONS (|dispatchFunction| |EXPR;tan;2%;49|) %))
          (QSETREFV % 178 (CONS (|dispatchFunction| |EXPR;cot;2%;50|) %))
          (QSETREFV % 180 (CONS (|dispatchFunction| |EXPR;sec;2%;51|) %))
          (QSETREFV % 182 (CONS (|dispatchFunction| |EXPR;csc;2%;52|) %))
          (QSETREFV % 184 (CONS (|dispatchFunction| |EXPR;asin;2%;53|) %))
          (QSETREFV % 186 (CONS (|dispatchFunction| |EXPR;acos;2%;54|) %))
          (QSETREFV % 188 (CONS (|dispatchFunction| |EXPR;atan;2%;55|) %))
          (QSETREFV % 190 (CONS (|dispatchFunction| |EXPR;acot;2%;56|) %))
          (QSETREFV % 192 (CONS (|dispatchFunction| |EXPR;asec;2%;57|) %))
          (QSETREFV % 194 (CONS (|dispatchFunction| |EXPR;acsc;2%;58|) %))
          (QSETREFV % 196 (CONS (|dispatchFunction| |EXPR;sinh;2%;59|) %))
          (QSETREFV % 198 (CONS (|dispatchFunction| |EXPR;cosh;2%;60|) %))
          (QSETREFV % 200 (CONS (|dispatchFunction| |EXPR;tanh;2%;61|) %))
          (QSETREFV % 202 (CONS (|dispatchFunction| |EXPR;coth;2%;62|) %))
          (QSETREFV % 204 (CONS (|dispatchFunction| |EXPR;sech;2%;63|) %))
          (QSETREFV % 206 (CONS (|dispatchFunction| |EXPR;csch;2%;64|) %))
          (QSETREFV % 208 (CONS (|dispatchFunction| |EXPR;asinh;2%;65|) %))
          (QSETREFV % 210 (CONS (|dispatchFunction| |EXPR;acosh;2%;66|) %))
          (QSETREFV % 212 (CONS (|dispatchFunction| |EXPR;atanh;2%;67|) %))
          (QSETREFV % 214 (CONS (|dispatchFunction| |EXPR;acoth;2%;68|) %))
          (QSETREFV % 216 (CONS (|dispatchFunction| |EXPR;asech;2%;69|) %))
          (QSETREFV % 218 (CONS (|dispatchFunction| |EXPR;acsch;2%;70|) %))
          (QSETREFV % 221 (CONS (|dispatchFunction| |EXPR;abs;2%;71|) %))
          (QSETREFV % 223 (CONS (|dispatchFunction| |EXPR;sign;2%;72|) %))
          (QSETREFV % 225 (CONS (|dispatchFunction| |EXPR;unitStep;2%;73|) %))
          (QSETREFV % 227 (CONS (|dispatchFunction| |EXPR;ceiling;2%;74|) %))
          (QSETREFV % 229 (CONS (|dispatchFunction| |EXPR;floor;2%;75|) %))
          (QSETREFV % 231
                    (CONS (|dispatchFunction| |EXPR;fractionPart;2%;76|) %))
          (QSETREFV % 233
                    (CONS (|dispatchFunction| |EXPR;diracDelta;2%;77|) %))
          (QSETREFV % 235 (CONS (|dispatchFunction| |EXPR;conjugate;2%;78|) %))
          (QSETREFV % 237 (CONS (|dispatchFunction| |EXPR;Gamma;2%;79|) %))
          (QSETREFV % 239 (CONS (|dispatchFunction| |EXPR;Gamma;3%;80|) %))
          (QSETREFV % 241 (CONS (|dispatchFunction| |EXPR;Beta;3%;81|) %))
          (QSETREFV % 243 (CONS (|dispatchFunction| |EXPR;Beta;4%;82|) %))
          (QSETREFV % 245 (CONS (|dispatchFunction| |EXPR;digamma;2%;83|) %))
          (QSETREFV % 247 (CONS (|dispatchFunction| |EXPR;polygamma;3%;84|) %))
          (QSETREFV % 249 (CONS (|dispatchFunction| |EXPR;besselJ;3%;85|) %))
          (QSETREFV % 251 (CONS (|dispatchFunction| |EXPR;besselY;3%;86|) %))
          (QSETREFV % 253 (CONS (|dispatchFunction| |EXPR;besselI;3%;87|) %))
          (QSETREFV % 255 (CONS (|dispatchFunction| |EXPR;besselK;3%;88|) %))
          (QSETREFV % 257 (CONS (|dispatchFunction| |EXPR;airyAi;2%;89|) %))
          (QSETREFV % 259
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2%;90|) %))
          (QSETREFV % 261 (CONS (|dispatchFunction| |EXPR;airyBi;2%;91|) %))
          (QSETREFV % 263
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2%;92|) %))
          (QSETREFV % 265 (CONS (|dispatchFunction| |EXPR;lambertW;2%;93|) %))
          (QSETREFV % 267 (CONS (|dispatchFunction| |EXPR;polylog;3%;94|) %))
          (QSETREFV % 269
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4%;95|) %))
          (QSETREFV % 271
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4%;96|)
                          %))
          (QSETREFV % 273
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4%;97|)
                          %))
          (QSETREFV % 275
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4%;98|) %))
          (QSETREFV % 277
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4%;99|)
                          %))
          (QSETREFV % 279
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4%;100|) %))
          (QSETREFV % 281
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4%;101|) %))
          (QSETREFV % 283 (CONS (|dispatchFunction| |EXPR;angerJ;3%;102|) %))
          (QSETREFV % 285 (CONS (|dispatchFunction| |EXPR;weberE;3%;103|) %))
          (QSETREFV % 287 (CONS (|dispatchFunction| |EXPR;struveH;3%;104|) %))
          (QSETREFV % 289 (CONS (|dispatchFunction| |EXPR;struveL;3%;105|) %))
          (QSETREFV % 291 (CONS (|dispatchFunction| |EXPR;hankelH1;3%;106|) %))
          (QSETREFV % 293 (CONS (|dispatchFunction| |EXPR;hankelH2;3%;107|) %))
          (QSETREFV % 295 (CONS (|dispatchFunction| |EXPR;lommelS1;4%;108|) %))
          (QSETREFV % 297 (CONS (|dispatchFunction| |EXPR;lommelS2;4%;109|) %))
          (QSETREFV % 299 (CONS (|dispatchFunction| |EXPR;kummerM;4%;110|) %))
          (QSETREFV % 301 (CONS (|dispatchFunction| |EXPR;kummerU;4%;111|) %))
          (QSETREFV % 303
                    (CONS (|dispatchFunction| |EXPR;legendreP;4%;112|) %))
          (QSETREFV % 305
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4%;113|) %))
          (QSETREFV % 307
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3%;114|) %))
          (QSETREFV % 309
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3%;115|) %))
          (QSETREFV % 311
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3%;116|) %))
          (QSETREFV % 313
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3%;117|) %))
          (QSETREFV % 315
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2%;118|) %))
          (QSETREFV % 317
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2%;119|) %))
          (QSETREFV % 319
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3%;120|) %))
          (QSETREFV % 321
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3%;121|) %))
          (QSETREFV % 323
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4%;122|) %))
          (QSETREFV % 325 (CONS (|dispatchFunction| |EXPR;jacobiSn;3%;123|) %))
          (QSETREFV % 327 (CONS (|dispatchFunction| |EXPR;jacobiCn;3%;124|) %))
          (QSETREFV % 329 (CONS (|dispatchFunction| |EXPR;jacobiDn;3%;125|) %))
          (QSETREFV % 331
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3%;126|) %))
          (QSETREFV % 333
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3%;127|) %))
          (QSETREFV % 335 (CONS (|dispatchFunction| |EXPR;lerchPhi;4%;128|) %))
          (QSETREFV % 337
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2%;129|) %))
          (QSETREFV % 339
                    (CONS (|dispatchFunction| |EXPR;charlierC;4%;130|) %))
          (QSETREFV % 341 (CONS (|dispatchFunction| |EXPR;hermiteH;3%;131|) %))
          (QSETREFV % 343 (CONS (|dispatchFunction| |EXPR;jacobiP;5%;132|) %))
          (QSETREFV % 345
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4%;133|) %))
          (QSETREFV % 347 (CONS (|dispatchFunction| |EXPR;meixnerM;5%;134|) %))
          (COND
           ((|testBitVector| |pv$| 34)
            (PROGN
             (QSETREFV % 350
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2%;135|)
                        (|getDomainView| % '(|RetractableTo| (|Integer|)))))
             (QSETREFV % 352
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2%;136|)
                             (|getDomainView| %
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV % 84 (CONS (|dispatchFunction| |EXPR;^;3%;137|) %))
          (QSETREFV % 356
                    (CONS (|dispatchFunction| |EXPR;factorial;2%;138|) %))
          (QSETREFV % 358 (CONS (|dispatchFunction| |EXPR;binomial;3%;139|) %))
          (QSETREFV % 360
                    (CONS (|dispatchFunction| |EXPR;permutation;3%;140|) %))
          (QSETREFV % 362
                    (CONS (|dispatchFunction| |EXPR;factorials;2%;141|) %))
          (QSETREFV % 364
                    (CONS (|dispatchFunction| |EXPR;factorials;%S%;142|) %))
          (QSETREFV % 366
                    (CONS (|dispatchFunction| |EXPR;summation;%S%;143|) %))
          (QSETREFV % 370
                    (CONS (|dispatchFunction| |EXPR;summation;%Sb%;144|) %))
          (QSETREFV % 372 (CONS (|dispatchFunction| |EXPR;product;%S%;145|) %))
          (QSETREFV % 374
                    (CONS (|dispatchFunction| |EXPR;product;%Sb%;146|) %))
          (QSETREFV % 377 (CONS (|dispatchFunction| |EXPR;erf;2%;147|) %))
          (QSETREFV % 379 (CONS (|dispatchFunction| |EXPR;erfi;2%;148|) %))
          (QSETREFV % 381 (CONS (|dispatchFunction| |EXPR;Ei;2%;149|) %))
          (QSETREFV % 383 (CONS (|dispatchFunction| |EXPR;Si;2%;150|) %))
          (QSETREFV % 385 (CONS (|dispatchFunction| |EXPR;Ci;2%;151|) %))
          (QSETREFV % 387 (CONS (|dispatchFunction| |EXPR;Shi;2%;152|) %))
          (QSETREFV % 389 (CONS (|dispatchFunction| |EXPR;Chi;2%;153|) %))
          (QSETREFV % 391 (CONS (|dispatchFunction| |EXPR;li;2%;154|) %))
          (QSETREFV % 393 (CONS (|dispatchFunction| |EXPR;dilog;2%;155|) %))
          (QSETREFV % 395 (CONS (|dispatchFunction| |EXPR;fresnelS;2%;156|) %))
          (QSETREFV % 397 (CONS (|dispatchFunction| |EXPR;fresnelC;2%;157|) %))
          (QSETREFV % 399
                    (CONS (|dispatchFunction| |EXPR;integral;%S%;158|) %))
          (QSETREFV % 401
                    (CONS (|dispatchFunction| |EXPR;integral;%Sb%;159|) %))
          (QSETREFV % 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;160|) %))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV % 452
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV % 453 (|ModularAlgebraicGcdTools3|))
                (QSETREFV % 454
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 452) (QREFELT % 453)))
                (QSETREFV % 463 (|ModularEvaluation2|))
                (QSETREFV % 464 (|ModularAlgebraicGcdTools4|))
                (QSETREFV % 465
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 452) (QREFELT % 463) (QREFELT % 464)))
                (QSETREFV % 490
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;179|)
                           %))))
              ('T
               (QSETREFV % 490
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;180|)
                          %))))
             (COND
              ((|testBitVector| |pv$| 27)
               (QSETREFV % 497
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;181|)
                          %)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV % 502
                      (CONS (|dispatchFunction| |EXPR;coerce;An%;182|) %))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 505 (CONS (|dispatchFunction| |EXPR;^;%F%;183|) %))
             (QSETREFV % 132
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;184|) %))
             (QSETREFV % 508
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2%;185|)
                        %))
             (QSETREFV % 510
                       (CONS (|dispatchFunction| |EXPR;retract;%F;186|) %))
             (QSETREFV % 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;187|)
                             %))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV % 502
                               (CONS (|dispatchFunction| |EXPR;coerce;An%;188|)
                                     %))
                     (QSETREFV % 526
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;%U;191|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV % 554
                       (CONS (|dispatchFunction| |EXPR;convert;%If;195|) %))
             (QSETREFV % 557
                       (CONS (|dispatchFunction| |EXPR;eval;%Bo%S%;196|) %))
             (QSETREFV % 556
                       (CONS (|dispatchFunction| |EXPR;eval;%LLS%;197|) %)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV % 579
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;198|)
                            %))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV % 585
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;199|)
                            %))))))
        ('T
         (PROGN
          (SETELT % 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;%;200|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;%;201|) % 49)))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;202|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;203|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;204|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;205|) %))
          (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;206|) %))
          (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;207|) %))
          (QSETREFV % 99 (CONS (|dispatchFunction| |EXPR;numer;%Smp;208|) %))
          (QSETREFV % 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;209|) %))
          (QSETREFV % 106 (CONS (|dispatchFunction| |EXPR;coerce;P%;210|) %))
          (QSETREFV % 148
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;211|) %))
          (QSETREFV % 156
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;212|) %))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV % 554
                      (CONS (|dispatchFunction| |EXPR;convert;%If;213|) %))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV % 579
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;215|)
                        %)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV % 585
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;217|)
                        %))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT % 45 (|FreeModule| (|Integer|) (|Kernel| %)))
       (QSETREFV % 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;%;218|) % 47)))
       (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;219|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;220|) %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;221|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |EXPR;coerce;K%;222|) %))
       (QSETREFV % 75 (CONS (|dispatchFunction| |EXPR;kernels;%L;223|) %))
       (QSETREFV % 527 (CONS (|dispatchFunction| |EXPR;coerce;R%;224|) %))
       (QSETREFV % 437 (CONS (|dispatchFunction| |EXPR;retract;%R;225|) %))
       (QSETREFV % 608 (CONS (|dispatchFunction| |EXPR;coerce;%Of;226|) %))
       (QSETREFV % 617 (CONS (|dispatchFunction| |EXPR;isPlus;%U;229|) %))
       (QSETREFV % 621 (CONS (|dispatchFunction| |EXPR;isMult;%U;230|) %))
       (QSETREFV % 609 (CONS (|dispatchFunction| |EXPR;eval;%LL%;231|) %))
       (QSETREFV % 614 (CONS (|dispatchFunction| |EXPR;subst;%LL%;232|) %))
       (QSETREFV % 622
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;233|) %))
       (COND
        ((|HasCategory| |#1| '(|AbelianGroup|))
         (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;234|) %))))))
     ('T
      (PROGN
       (SETELT % 45 (|Kernel| %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;235|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;236|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |EXPR;coerce;K%;237|) %))
       (QSETREFV % 75 (CONS (|dispatchFunction| |EXPR;kernels;%L;238|) %))
       (QSETREFV % 527 (CONS (|dispatchFunction| |EXPR;coerce;R%;239|) %))
       (QSETREFV % 437 (CONS (|dispatchFunction| |EXPR;retract;%R;240|) %))
       (QSETREFV % 622
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;241|) %))
       (QSETREFV % 608 (CONS (|dispatchFunction| |EXPR;coerce;%Of;242|) %))
       (QSETREFV % 609 (CONS (|dispatchFunction| |EXPR;eval;%LL%;243|) %))
       (QSETREFV % 614 (CONS (|dispatchFunction| |EXPR;subst;%LL%;244|) %))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV % 554
                   (CONS (|dispatchFunction| |EXPR;convert;%If;245|) %)))))))
    %))) 

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| %)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace&| $$ 6) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace&| $$) (25 . |belong?|) (30 . |operator|)
              (35 . |nullary?|) (|Symbol|) (40 . |has?|) (46 . |name|)
              (51 . |kernel|) (56 . |operator|) (|Union| 35 '"failed")
              (61 . |arity|) (66 . |operator|) (|NonNegativeInteger|)
              (71 . |operator|) (77 . |operator|) (|List| 27)
              (|SparseMultivariatePolynomial| 6 27) (82 . |variables|)
              (|SparseMultivariatePolynomial| 6 15) (|List| 15)
              (|SparsePolynomialCoercionHelpers| 6 27 15)
              (87 . |remap_variables|) '|Rep| (94 . |Zero|) (98 . |Zero|)
              (102 . |One|) (106 . |One|) (110 . |One|) (114 . =)
              (120 . |one?|) (125 . |zero?|) (130 . |zero?|) (135 . -)
              (140 . -) (|Integer|) (145 . *) (151 . *) (157 . |coerce|)
              (162 . |coerce|) (167 . *) (173 . *) (179 . +) (185 . +)
              (191 . -) (197 . -) (203 . /) (209 . /) (215 . |ground?|)
              (|Union| 503 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . |algtower|) (273 . ^) (279 . |first|)
              (284 . |second|) (289 . |Zero|) (293 . |numerator|)
              (298 . |denominator|) (303 . ^) (309 . ^) (|PositiveInteger|)
              (315 . ^) (321 . |smaller?|) (327 . |smaller?|) (333 . =)
              (339 . |numer|) (|SparseMultivariatePolynomial| 6 12)
              (344 . |numer|) (349 . |denom|) (354 . |denom|) 'EREP
              (359 . |One|) (363 . |coerce|) (|Polynomial| 6) (368 . |coerce|)
              (|Fraction| 105) (373 . |numer|) (378 . |denom|) (383 . |coerce|)
              (388 . |reduce|) (|Mapping| 9 15) (393 . |select!|)
              (|AlgebraicManipulations| 6 $$) (399 . |ratDenom|) (405 . |is?|)
              (411 . ~=) (|SparseUnivariatePolynomial| %) (417 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (423 . |leadingCoefficient|)
              (428 . |reductum|) (433 . *) (439 . |monomial|) (446 . -)
              (452 . /) (458 . |getSimplifyDenomsFlag|)
              (462 . |setSimplifyDenomsFlag|) (467 . |elt|)
              (|SingletonAsOrderedSet|) (473 . |create|) (477 . |minPoly|)
              (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 498 15 6 41 $$)
              (482 . |univariate|) (489 . |coerce|) (494 . |eval|)
              (501 . |retract|) (506 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (512 . |map|) (|Matrix| 41) (|Matrix| %) (518 . |reducedSystem|)
              (|Matrix| 6) (523 . |reducedSystem|) (528 . |reducedSystem|)
              (|Vector| $$) (533 . |map|)
              (|Record| (|:| |mat| 143) (|:| |vec| (|Vector| 41))) (|Vector| %)
              (539 . |reducedSystem|)
              (|Record| (|:| |mat| 146) (|:| |vec| (|Vector| 6)))
              (545 . |reducedSystem|) (551 . |reducedSystem|) (557 . |member?|)
              (563 . |concat|) (|AlgebraicFunction| 6 $$) (569 . |rootOf|)
              (575 . |rootOf|) (581 . |rootSum|) (588 . |rootSum|)
              (|ElementaryFunction| 6 $$) (595 . |pi|) (599 . |pi|)
              (603 . |exp|) (608 . |exp|) (613 . |log|) (618 . |log|)
              (623 . |sin|) (628 . |sin|) (633 . |cos|) (638 . |cos|)
              (643 . |tan|) (648 . |tan|) (653 . |cot|) (658 . |cot|)
              (663 . |sec|) (668 . |sec|) (673 . |csc|) (678 . |csc|)
              (683 . |asin|) (688 . |asin|) (693 . |acos|) (698 . |acos|)
              (703 . |atan|) (708 . |atan|) (713 . |acot|) (718 . |acot|)
              (723 . |asec|) (728 . |asec|) (733 . |acsc|) (738 . |acsc|)
              (743 . |sinh|) (748 . |sinh|) (753 . |cosh|) (758 . |cosh|)
              (763 . |tanh|) (768 . |tanh|) (773 . |coth|) (778 . |coth|)
              (783 . |sech|) (788 . |sech|) (793 . |csch|) (798 . |csch|)
              (803 . |asinh|) (808 . |asinh|) (813 . |acosh|) (818 . |acosh|)
              (823 . |atanh|) (828 . |atanh|) (833 . |acoth|) (838 . |acoth|)
              (843 . |asech|) (848 . |asech|) (853 . |acsch|) (858 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (863 . |abs|) (868 . |abs|)
              (873 . |sign|) (878 . |sign|) (883 . |unitStep|)
              (888 . |unitStep|) (893 . |ceiling|) (898 . |ceiling|)
              (903 . |floor|) (908 . |floor|) (913 . |fractionPart|)
              (918 . |fractionPart|) (923 . |diracDelta|) (928 . |diracDelta|)
              (933 . |conjugate|) (938 . |conjugate|) (943 . |Gamma|)
              (948 . |Gamma|) (953 . |Gamma|) (959 . |Gamma|) (965 . |Beta|)
              (971 . |Beta|) (977 . |Beta|) (984 . |Beta|) (991 . |digamma|)
              (996 . |digamma|) (1001 . |polygamma|) (1007 . |polygamma|)
              (1013 . |besselJ|) (1019 . |besselJ|) (1025 . |besselY|)
              (1031 . |besselY|) (1037 . |besselI|) (1043 . |besselI|)
              (1049 . |besselK|) (1055 . |besselK|) (1061 . |airyAi|)
              (1066 . |airyAi|) (1071 . |airyAiPrime|) (1076 . |airyAiPrime|)
              (1081 . |airyBi|) (1086 . |airyBi|) (1091 . |airyBiPrime|)
              (1096 . |airyBiPrime|) (1101 . |lambertW|) (1106 . |lambertW|)
              (1111 . |polylog|) (1117 . |polylog|) (1123 . |weierstrassP|)
              (1130 . |weierstrassP|) (1137 . |weierstrassPPrime|)
              (1144 . |weierstrassPPrime|) (1151 . |weierstrassSigma|)
              (1158 . |weierstrassSigma|) (1165 . |weierstrassZeta|)
              (1172 . |weierstrassZeta|) (1179 . |weierstrassPInverse|)
              (1186 . |weierstrassPInverse|) (1193 . |whittakerM|)
              (1200 . |whittakerM|) (1207 . |whittakerW|) (1214 . |whittakerW|)
              (1221 . |angerJ|) (1227 . |angerJ|) (1233 . |weberE|)
              (1239 . |weberE|) (1245 . |struveH|) (1251 . |struveH|)
              (1257 . |struveL|) (1263 . |struveL|) (1269 . |hankelH1|)
              (1275 . |hankelH1|) (1281 . |hankelH2|) (1287 . |hankelH2|)
              (1293 . |lommelS1|) (1300 . |lommelS1|) (1307 . |lommelS2|)
              (1314 . |lommelS2|) (1321 . |kummerM|) (1328 . |kummerM|)
              (1335 . |kummerU|) (1342 . |kummerU|) (1349 . |legendreP|)
              (1356 . |legendreP|) (1363 . |legendreQ|) (1370 . |legendreQ|)
              (1377 . |kelvinBei|) (1383 . |kelvinBei|) (1389 . |kelvinBer|)
              (1395 . |kelvinBer|) (1401 . |kelvinKei|) (1407 . |kelvinKei|)
              (1413 . |kelvinKer|) (1419 . |kelvinKer|) (1425 . |ellipticK|)
              (1430 . |ellipticK|) (1435 . |ellipticE|) (1440 . |ellipticE|)
              (1445 . |ellipticE|) (1451 . |ellipticE|) (1457 . |ellipticF|)
              (1463 . |ellipticF|) (1469 . |ellipticPi|) (1476 . |ellipticPi|)
              (1483 . |jacobiSn|) (1489 . |jacobiSn|) (1495 . |jacobiCn|)
              (1501 . |jacobiCn|) (1507 . |jacobiDn|) (1513 . |jacobiDn|)
              (1519 . |jacobiZeta|) (1525 . |jacobiZeta|)
              (1531 . |jacobiTheta|) (1537 . |jacobiTheta|) (1543 . |lerchPhi|)
              (1550 . |lerchPhi|) (1557 . |riemannZeta|) (1562 . |riemannZeta|)
              (1567 . |charlierC|) (1574 . |charlierC|) (1581 . |hermiteH|)
              (1587 . |hermiteH|) (1593 . |jacobiP|) (1601 . |jacobiP|)
              (1609 . |laguerreL|) (1616 . |laguerreL|) (1623 . |meixnerM|)
              (1631 . |meixnerM|) (1639 . |hypergeometricF|) (|List| %)
              (1646 . |hypergeometricF|) (1653 . |meijerG|) (1662 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1671 . ^) (1677 . |factorial|)
              (1682 . |factorial|) (1687 . |binomial|) (1693 . |binomial|)
              (1699 . |permutation|) (1705 . |permutation|)
              (1711 . |factorials|) (1716 . |factorials|) (1721 . |factorials|)
              (1727 . |factorials|) (1733 . |summation|) (1739 . |summation|)
              (|SegmentBinding| $$) (1745 . |summation|) (|SegmentBinding| %)
              (1751 . |summation|) (1757 . |product|) (1763 . |product|)
              (1769 . |product|) (1775 . |product|)
              (|LiouvillianFunction| 6 $$) (1781 . |erf|) (1786 . |erf|)
              (1791 . |erfi|) (1796 . |erfi|) (1801 . |Ei|) (1806 . |Ei|)
              (1811 . |Si|) (1816 . |Si|) (1821 . |Ci|) (1826 . |Ci|)
              (1831 . |Shi|) (1836 . |Shi|) (1841 . |Chi|) (1846 . |Chi|)
              (1851 . |li|) (1856 . |li|) (1861 . |dilog|) (1866 . |dilog|)
              (1871 . |fresnelS|) (1876 . |fresnelS|) (1881 . |fresnelC|)
              (1886 . |fresnelC|) (1891 . |integral|) (1897 . |integral|)
              (1903 . |integral|) (1909 . |integral|) (1915 . |belong?|)
              (1920 . |operator|) (1925 . |belong?|) (1930 . |operator|)
              (1935 . |belong?|) (1940 . |operator|) (1945 . |belong?|)
              (1950 . |operator|) (1955 . |belong?|) (1960 . |operator|)
              (|Fraction| 41) (1965 . |coerce|) (|Fraction| 417)
              (|PolynomialCategoryQuotientFunctions| 498 15 6 41 412)
              (1970 . |univariate|) (|SparseUnivariatePolynomial| 412)
              (1976 . |numer|) (1981 . |degree|) (1987 . |degree|)
              (1992 . |rem|) (1998 . |coerce|) (2003 . |elt|) (2009 . |Zero|)
              (2013 . ~=) (2019 . |leadingCoefficient|) (2024 . |reductum|)
              (2029 . |concat|) (2035 . |removeDuplicates|) (2040 . =)
              (2046 . |coefficients|) (|Mapping| 9 $$) (2051 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 133 41 120)
              (2057 . |map|) (2063 . |retract|) (2068 . |monomial|)
              (2074 . |coerce|) (2079 . -) (2085 . =) (|Polynomial| 57)
              (2091 . |One|) (2095 . |One|) (2099 . |monomial|)
              (2106 . |coerce|) (|Mapping| 442 15) (|Mapping| 442 57)
              (|PolynomialCategoryLifting| 498 15 57 41 442) (2111 . |map|)
              (2118 . |multivariate|) 'MD 'MOP1 'MGCD1 (2124 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 442
                                           41)
              (2129 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 120 $$ 133)
              (2136 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 442) (2142 . /)
              (2148 . |coerce|) (|SparseUnivariatePolynomial| 466)
              (2153 . |coerce|) (|Mapping| 466 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 133 466 469)
              (2158 . |map|) (2164 . =) (2170 . |One|) (2174 . |gcdPolynomial|)
              (2180 . |concat|) (2186 . |algtower|) (2191 . |kernels|)
              (2196 . |setUnion|) (2202 . |sort|) (2207 . |new|)
              (2211 . |cons|) (2217 . |setDifference|) (|List| 442)
              (2223 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 469)) (|List| 487)
              (2233 . |algebraicGcd|) (2243 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2249 . |gcdPolynomial|) (|Factored| 133)
              (|ExpressionFactorPolynomial| 6 $$) (2255 . |factorPolynomial|)
              (|Factored| 118) (2260 . |factorPolynomial|)
              (|IndexedExponents| 15) (2265 . |Zero|) (2269 . |monomial|)
              (|AlgebraicNumber|) (2275 . |coerce|) (|Fraction| 57) (2280 . ^)
              (2286 . ^) (2292 . |minPoly|) (2297 . |definingPolynomial|)
              (2302 . |definingPolynomial|) (2307 . |retract|)
              (2312 . |retract|) (2317 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2322 . |numer|)
              (2327 . |denom|) (|Mapping| $$ 501) (|Kernel| 501)
              (|ExpressionSpaceFunctions2| 501 $$) (2332 . |map|)
              (|Mapping| $$ 516) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 516)
              (|PolynomialCategoryLifting| (|IndexedExponents| 516) 516 57 521
                                           $$)
              (2338 . |map|) (2345 . /) (|Union| 501 '"failed")
              (2351 . |retractIfCan|) (2356 . |coerce|) (2361 . |coerce|)
              (2366 . |belong?|) (2371 . |is?|) (|Union| 27 '#1#)
              (2377 . |retractIfCan|) (2382 . ~=)
              (|SparseUnivariatePolynomial| 501) (2388 . |Zero|)
              (2392 . |Zero|) (2396 . ~=) (2402 . |degree|) (2407 . |monomial|)
              (2413 . +) (2419 . |rootOf|) (2425 . |operator|) (2430 . |elt|)
              (|Union| 15 '"failed") (2436 . |mainVariable|)
              (2441 . |leadingCoefficient|) (2446 . |Zero|) (2450 . |ground?|)
              (2455 . ^) (2461 . *) (2467 . +) (|InputForm|) (2473 . |convert|)
              (2478 . |convert|) (|List| 10) (2483 . |eval|) (2491 . |eval|)
              (2499 . |variables|) (2504 . |concat|)
              (2509 . |removeDuplicates|) (2514 . |scripted?|) (|Mapping| 9 27)
              (2519 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2525 . |compiledFunction|) (|Mapping| % %) (|List| 566)
              (2531 . |eval|) (2538 . |coerce|) (|Equation| $$) (2543 . =)
              (|List| 652) (2549 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2555 . |patternMatch|) (|PatternMatchResult| 57 %)
              (2562 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2569 . |patternMatch|) (|PatternMatchResult| (|Float|) %)
              (2576 . |patternMatch|) (2583 . |reducedSystem|)
              (2588 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2594 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 590 15 575 590)
              (|PatternMatchPolynomialCategory| 57 498 15 6 45)
              (2601 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2609 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 596 15 581 596)
              (|PatternMatchPolynomialCategory| (|Float|) 498 15 6 45)
              (2616 . |patternMatch|) (2624 . |monomial|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 601)
              (2630 . |listOfTerms|) (2635 . |zero?|) (2640 . |constantKernel|)
              (|OutputForm|) (2645 . |coerce|) (2650 . |coerce|)
              (2655 . |eval|) (2662 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2668 . |match|) (2676 . |subst|)
              (2683 . |kernel|) (|Union| 349 '#2="failed") (2689 . |isPlus|)
              (2694 . |first|) (|Record| (|:| |coef| 57) (|:| |var| 12))
              (|Union| 619 '#2#) (2699 . |isMult|) (2704 . |retractIfCan|)
              (|Union| 152 '#3="failed") (|Union| 625 '#3#) (|List| 118)
              (|Record| (|:| |mat| 627) (|:| |vec| (|Vector| 57)))
              (|Matrix| 57) (|Union| % '"failed") (|Factored| %) (|Fraction| 6)
              (|Polynomial| 630) (|Fraction| 118) (|Fraction| 631)
              (|Union| 107 '#1#) (|Polynomial| %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |coef| 349) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 640 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Union| 57 '#1#) (|Record| (|:| |var| 12) (|:| |exponent| 57))
              (|Union| 644 '#2#) (|Record| (|:| |val| %) (|:| |exponent| 57))
              (|Union| 646 '#2#) (|List| 35) (|Mapping| % 349) (|List| 649)
              (|Union| 105 '#1#) (|Equation| %) (|String|))
           '#(~= 2709 |zerosOf| 2715 |zeroOf| 2742 |zero?| 2769 |whittakerW|
              2774 |whittakerM| 2781 |weierstrassZeta| 2788 |weierstrassSigma|
              2795 |weierstrassPPrime| 2802 |weierstrassPInverse| 2809
              |weierstrassP| 2816 |weberE| 2823 |variables| 2829 |univariate|
              2839 |unitStep| 2845 |unitNormal| 2850 |unitCanonical| 2855
              |unit?| 2860 |tower| 2865 |tanh| 2875 |tan| 2880 |summation| 2885
              |subtractIfCan| 2897 |subst| 2903 |struveL| 2922 |struveH| 2928
              |squareFreePolynomial| 2934 |squareFreePart| 2939 |squareFree|
              2944 |sqrt| 2949 |solveLinearPolynomialEquation| 2954 |smaller?|
              2960 |sizeLess?| 2966 |sinh| 2972 |sin| 2977 |sign| 2982
              |setSimplifyDenomsFlag| 2987 |sech| 2992 |sec| 2997 |sample| 3002
              |rootsOf| 3006 |rootSum| 3033 |rootOf| 3040 |rightRecip| 3067
              |rightPower| 3072 |riemannZeta| 3084 |retractIfCan| 3089
              |retract| 3129 |rem| 3169 |reducedSystem| 3175 |reduce| 3197
              |recip| 3202 |quo| 3207 |product| 3213 |principalIdeal| 3225
              |prime?| 3230 |polylog| 3235 |polygamma| 3241 |plenaryPower| 3247
              |pi| 3253 |permutation| 3257 |patternMatch| 3263 |paren| 3277
              |opposite?| 3282 |operators| 3288 |operator| 3293 |one?| 3298
              |odd?| 3303 |numerator| 3308 |numer| 3313 |number?| 3318
              |nthRoot| 3323 |multiEuclidean| 3329 |minPoly| 3335 |meixnerM|
              3340 |meijerG| 3348 |map| 3357 |mainKernel| 3363 |lommelS2| 3368
              |lommelS1| 3375 |log| 3382 |li| 3387 |lerchPhi| 3392 |legendreQ|
              3399 |legendreP| 3406 |leftRecip| 3413 |leftPower| 3418 |lcmCoef|
              3430 |lcm| 3436 |latex| 3447 |lambertW| 3452 |laguerreL| 3457
              |kummerU| 3464 |kummerM| 3471 |kernels| 3478 |kernel| 3488
              |kelvinKer| 3500 |kelvinKei| 3506 |kelvinBer| 3512 |kelvinBei|
              3518 |jacobiZeta| 3524 |jacobiTheta| 3530 |jacobiSn| 3536
              |jacobiP| 3542 |jacobiDn| 3550 |jacobiCn| 3556 |isTimes| 3562
              |isPower| 3567 |isPlus| 3572 |isMult| 3577 |isExpt| 3582 |is?|
              3599 |inv| 3611 |integral| 3616 |hypergeometricF| 3628 |hermiteH|
              3635 |height| 3641 |hankelH2| 3646 |hankelH1| 3652 |ground?| 3658
              |ground| 3663 |getSimplifyDenomsFlag| 3668 |gcdPolynomial| 3672
              |gcd| 3678 |fresnelS| 3689 |fresnelC| 3694 |freeOf?| 3699
              |fractionPart| 3711 |floor| 3716 |factorials| 3721 |factorial|
              3732 |factorSquareFreePolynomial| 3737 |factorPolynomial| 3742
              |factor| 3747 |extendedEuclidean| 3752 |exquo| 3765
              |expressIdealMember| 3771 |exp| 3777 |even?| 3782 |eval| 3787
              |euclideanSize| 3931 |erfi| 3936 |erf| 3941 |elt| 3946
              |ellipticPi| 4042 |ellipticK| 4049 |ellipticF| 4054 |ellipticE|
              4060 |divide| 4071 |distribute| 4077 |diracDelta| 4088 |dilog|
              4093 |digamma| 4098 |differentiate| 4103 |denominator| 4129
              |denom| 4134 |definingPolynomial| 4139 |csch| 4144 |csc| 4149
              |coth| 4154 |cot| 4159 |cosh| 4164 |cos| 4169 |convert| 4174
              |conjugate| 4194 |conditionP| 4205 |commutator| 4210 |coerce|
              4216 |charthRoot| 4286 |charlierC| 4291 |characteristic| 4298
              |ceiling| 4302 |box| 4307 |binomial| 4312 |besselY| 4318
              |besselK| 4324 |besselJ| 4330 |besselI| 4336 |belong?| 4342
              |atanh| 4347 |atan| 4352 |associator| 4357 |associates?| 4364
              |asinh| 4370 |asin| 4375 |asech| 4380 |asec| 4385 |applyQuote|
              4390 |antiCommutator| 4426 |annihilate?| 4432 |angerJ| 4438
              |algtower| 4444 |airyBiPrime| 4454 |airyBi| 4459 |airyAiPrime|
              4464 |airyAi| 4469 |acsch| 4474 |acsc| 4479 |acoth| 4484 |acot|
              4489 |acosh| 4494 |acos| 4499 |abs| 4504 ^ 4509 |Zero| 4539 |Si|
              4543 |Shi| 4548 |One| 4553 |Gamma| 4557 |Ei| 4568 D 4573 |Ci|
              4599 |Chi| 4604 |Beta| 4609 = 4622 / 4628 - 4640 + 4651 * 4657)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(1 0 1 1 28 1 1 1 1 1 1 1 1 1 1 1 2 3 4 5 21 1
                                  1 2 5 21 1 1 2 5 5 1 6 2 5 5 26 1 1 6 2 5 5
                                  26 21 7 15 15 5 17 0 0 30 16 17 21 0 0 12 13
                                  17 1 31 0 0 0 0 0 0 20 1 1 5 14 1 1 19 0 0 0
                                  0 0 0 0 0 20 1 1 1 1 5 8 9 10 11 14 18 1 1 1
                                  1 1 1 1 1 1 19))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |Algebra&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |PartialDifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Rng&| |Module&| |Module&|
                |Module&| |FullyLinearlyExplicitOver&| NIL NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |Group&| |AbelianGroup&| NIL NIL NIL
                |ExpressionSpace&| NIL |AbelianMonoid&| |MagmaWithUnit&| NIL
                |NonAssociativeSemiRng&| NIL |FullyRetractableTo&| NIL NIL
                |Magma&| NIL |AbelianSemiGroup&| |SetCategory&|
                |RetractableTo&| NIL |RetractableTo&| |Evalable&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&| NIL
                |RetractableTo&| |RetractableTo&|
                |TranscendentalFunctionCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL |RadicalCategory&| NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DivisionRing|) (|CommutativeRing|) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 503) (|Algebra| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 27) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 503)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|) (|Module| $$)
                 (|Module| 503) (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|SemiRng|) (|BiModule| 503 503) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|LinearlyExplicitOver| 6)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 57)
                 (|LeftModule| 503) (|RightModule| 503) (|LeftModule| $$)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|RightModule| 57) (|NonAssociativeRng|) (|Group|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|ExpressionSpace|)
                 (|FullyPatternMatchable| 6) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|Comparable|) (|FullyRetractableTo| 6)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|Magma|) (|LiouvillianFunctionCategory|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|RetractableTo| 6) (|Patternable| 6)
                 (|RetractableTo| 27) (|Evalable| $$) (|RetractableTo| 15)
                 (|RetractableTo| 503)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|RetractableTo| (|Polynomial| 6))
                 (|RetractableTo| 57) (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|RetractableTo| 501)
                 (|BasicType|) (|CoercibleFrom| 6) (|Type|)
                 (|CoercibleFrom| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|CoercibleFrom| 15)
                 (|CoercibleTo| 606) (|CoercibleFrom| 503)
                 (|CoercibleFrom| (|Fraction| (|Polynomial| 6)))
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|Polynomial| 6))
                 (|TwoSidedRecip|) (|ConvertibleTo| 552) (|ConvertibleTo| 581)
                 (|ConvertibleTo| 575) (|CoercibleFrom| 57) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 501))
              (|makeByteWordVec2| 653
                                  '(1 0 12 0 13 1 16 14 15 17 1 0 18 0 19 1 20
                                    9 10 21 1 20 10 10 22 1 23 9 10 24 1 23 10
                                    10 25 1 10 9 0 26 2 10 9 0 27 28 1 10 27 0
                                    29 1 15 0 27 30 1 15 10 0 31 1 10 32 0 33 1
                                    10 0 27 34 2 10 0 27 35 36 1 0 10 10 37 1
                                    39 38 0 40 3 43 41 39 38 42 44 0 45 0 46 0
                                    0 0 47 0 45 0 48 0 0 0 49 0 6 0 50 2 45 9 0
                                    0 51 1 0 9 0 52 1 45 9 0 53 1 0 9 0 54 1 45
                                    0 0 55 1 0 0 0 56 2 45 0 57 0 58 2 0 0 57 0
                                    59 1 45 0 57 60 1 0 0 57 61 2 45 0 0 0 62 2
                                    0 0 0 0 63 2 45 0 0 0 64 2 0 0 0 0 65 2 45
                                    0 0 0 66 2 0 0 0 0 67 2 45 0 0 0 68 2 0 0 0
                                    0 69 1 0 9 0 70 1 0 71 0 72 1 0 9 0 73 1 0
                                    74 0 75 2 0 9 0 27 76 1 42 15 0 77 1 15 78
                                    0 79 1 78 35 0 80 2 78 2 0 57 81 2 45 0 0
                                    57 82 1 0 74 0 83 2 0 0 0 0 84 1 78 2 0 85
                                    1 78 2 0 86 0 6 0 87 1 0 0 0 88 1 0 0 0 89
                                    2 0 0 0 35 90 2 0 0 0 57 91 2 0 0 0 92 93 2
                                    45 9 0 0 94 2 0 9 0 0 95 2 0 9 0 0 96 1 45
                                    41 0 97 1 0 98 0 99 1 45 41 0 100 1 0 98 0
                                    101 0 41 0 103 1 0 0 98 104 1 0 0 105 106 1
                                    107 105 0 108 1 107 105 0 109 1 0 0 107 110
                                    1 0 0 0 111 2 42 0 112 0 113 2 114 2 2 42
                                    115 2 15 9 0 27 116 2 0 9 0 0 117 2 41 118
                                    0 15 119 1 120 41 0 121 1 120 0 0 122 2 41
                                    0 0 0 123 3 41 0 0 15 35 124 2 41 0 0 0 125
                                    2 45 0 41 41 126 0 0 9 127 1 0 9 9 128 2 42
                                    15 0 57 129 0 130 0 131 1 0 118 12 132 3
                                    134 133 2 15 133 135 1 0 0 12 136 3 133 0 0
                                    130 2 137 1 133 2 0 138 2 0 0 98 98 139 2
                                    141 0 140 0 142 1 45 143 144 145 1 41 146
                                    144 147 1 0 146 144 148 2 149 0 140 0 150 2
                                    45 151 144 152 153 2 41 154 144 152 155 2 0
                                    154 144 152 156 2 42 9 15 0 157 2 42 0 15 0
                                    158 2 159 2 133 27 160 2 0 0 118 27 161 3
                                    159 2 2 133 27 162 3 0 0 0 118 27 163 0 164
                                    2 165 0 0 0 166 1 164 2 2 167 1 0 0 0 168 1
                                    164 2 2 169 1 0 0 0 170 1 164 2 2 171 1 0 0
                                    0 172 1 164 2 2 173 1 0 0 0 174 1 164 2 2
                                    175 1 0 0 0 176 1 164 2 2 177 1 0 0 0 178 1
                                    164 2 2 179 1 0 0 0 180 1 164 2 2 181 1 0 0
                                    0 182 1 164 2 2 183 1 0 0 0 184 1 164 2 2
                                    185 1 0 0 0 186 1 164 2 2 187 1 0 0 0 188 1
                                    164 2 2 189 1 0 0 0 190 1 164 2 2 191 1 0 0
                                    0 192 1 164 2 2 193 1 0 0 0 194 1 164 2 2
                                    195 1 0 0 0 196 1 164 2 2 197 1 0 0 0 198 1
                                    164 2 2 199 1 0 0 0 200 1 164 2 2 201 1 0 0
                                    0 202 1 164 2 2 203 1 0 0 0 204 1 164 2 2
                                    205 1 0 0 0 206 1 164 2 2 207 1 0 0 0 208 1
                                    164 2 2 209 1 0 0 0 210 1 164 2 2 211 1 0 0
                                    0 212 1 164 2 2 213 1 0 0 0 214 1 164 2 2
                                    215 1 0 0 0 216 1 164 2 2 217 1 0 0 0 218 1
                                    219 2 2 220 1 0 0 0 221 1 219 2 2 222 1 0 0
                                    0 223 1 219 2 2 224 1 0 0 0 225 1 219 2 2
                                    226 1 0 0 0 227 1 219 2 2 228 1 0 0 0 229 1
                                    219 2 2 230 1 0 0 0 231 1 219 2 2 232 1 0 0
                                    0 233 1 219 2 2 234 1 0 0 0 235 1 219 2 2
                                    236 1 0 0 0 237 2 219 2 2 2 238 2 0 0 0 0
                                    239 2 219 2 2 2 240 2 0 0 0 0 241 3 219 2 2
                                    2 2 242 3 0 0 0 0 0 243 1 219 2 2 244 1 0 0
                                    0 245 2 219 2 2 2 246 2 0 0 0 0 247 2 219 2
                                    2 2 248 2 0 0 0 0 249 2 219 2 2 2 250 2 0 0
                                    0 0 251 2 219 2 2 2 252 2 0 0 0 0 253 2 219
                                    2 2 2 254 2 0 0 0 0 255 1 219 2 2 256 1 0 0
                                    0 257 1 219 2 2 258 1 0 0 0 259 1 219 2 2
                                    260 1 0 0 0 261 1 219 2 2 262 1 0 0 0 263 1
                                    219 2 2 264 1 0 0 0 265 2 219 2 2 2 266 2 0
                                    0 0 0 267 3 219 2 2 2 2 268 3 0 0 0 0 0 269
                                    3 219 2 2 2 2 270 3 0 0 0 0 0 271 3 219 2 2
                                    2 2 272 3 0 0 0 0 0 273 3 219 2 2 2 2 274 3
                                    0 0 0 0 0 275 3 219 2 2 2 2 276 3 0 0 0 0 0
                                    277 3 219 2 2 2 2 278 3 0 0 0 0 0 279 3 219
                                    2 2 2 2 280 3 0 0 0 0 0 281 2 219 2 2 2 282
                                    2 0 0 0 0 283 2 219 2 2 2 284 2 0 0 0 0 285
                                    2 219 2 2 2 286 2 0 0 0 0 287 2 219 2 2 2
                                    288 2 0 0 0 0 289 2 219 2 2 2 290 2 0 0 0 0
                                    291 2 219 2 2 2 292 2 0 0 0 0 293 3 219 2 2
                                    2 2 294 3 0 0 0 0 0 295 3 219 2 2 2 2 296 3
                                    0 0 0 0 0 297 3 219 2 2 2 2 298 3 0 0 0 0 0
                                    299 3 219 2 2 2 2 300 3 0 0 0 0 0 301 3 219
                                    2 2 2 2 302 3 0 0 0 0 0 303 3 219 2 2 2 2
                                    304 3 0 0 0 0 0 305 2 219 2 2 2 306 2 0 0 0
                                    0 307 2 219 2 2 2 308 2 0 0 0 0 309 2 219 2
                                    2 2 310 2 0 0 0 0 311 2 219 2 2 2 312 2 0 0
                                    0 0 313 1 219 2 2 314 1 0 0 0 315 1 219 2 2
                                    316 1 0 0 0 317 2 219 2 2 2 318 2 0 0 0 0
                                    319 2 219 2 2 2 320 2 0 0 0 0 321 3 219 2 2
                                    2 2 322 3 0 0 0 0 0 323 2 219 2 2 2 324 2 0
                                    0 0 0 325 2 219 2 2 2 326 2 0 0 0 0 327 2
                                    219 2 2 2 328 2 0 0 0 0 329 2 219 2 2 2 330
                                    2 0 0 0 0 331 2 219 2 2 2 332 2 0 0 0 0 333
                                    3 219 2 2 2 2 334 3 0 0 0 0 0 335 1 219 2 2
                                    336 1 0 0 0 337 3 219 2 2 2 2 338 3 0 0 0 0
                                    0 339 2 219 2 2 2 340 2 0 0 0 0 341 4 219 2
                                    2 2 2 2 342 4 0 0 0 0 0 0 343 3 219 2 2 2 2
                                    344 3 0 0 0 0 0 345 4 219 2 2 2 2 2 346 4 0
                                    0 0 0 0 0 347 3 219 2 78 78 2 348 3 0 0 349
                                    349 0 350 5 219 2 78 78 78 78 2 351 5 0 0
                                    349 349 349 349 0 352 2 353 2 2 2 354 1 353
                                    2 2 355 1 0 0 0 356 2 353 2 2 2 357 2 0 0 0
                                    0 358 2 353 2 2 2 359 2 0 0 0 0 360 1 353 2
                                    2 361 1 0 0 0 362 2 353 2 2 27 363 2 0 0 0
                                    27 364 2 353 2 2 27 365 2 0 0 0 27 366 2
                                    353 2 2 367 368 2 0 0 0 369 370 2 353 2 2
                                    27 371 2 0 0 0 27 372 2 353 2 2 367 373 2 0
                                    0 0 369 374 1 375 2 2 376 1 0 0 0 377 1 375
                                    2 2 378 1 0 0 0 379 1 375 2 2 380 1 0 0 0
                                    381 1 375 2 2 382 1 0 0 0 383 1 375 2 2 384
                                    1 0 0 0 385 1 375 2 2 386 1 0 0 0 387 1 375
                                    2 2 388 1 0 0 0 389 1 375 2 2 390 1 0 0 0
                                    391 1 375 2 2 392 1 0 0 0 393 1 375 2 2 394
                                    1 0 0 0 395 1 375 2 2 396 1 0 0 0 397 2 375
                                    2 2 27 398 2 0 0 0 27 399 2 375 2 2 367 400
                                    2 0 0 0 369 401 1 159 9 10 402 1 159 10 10
                                    403 1 164 9 10 404 1 164 10 10 405 1 353 9
                                    10 406 1 353 10 10 407 1 375 9 10 408 1 375
                                    10 10 409 1 219 9 10 410 1 219 10 10 411 1
                                    412 0 41 413 2 415 414 412 15 416 1 414 417
                                    0 418 2 41 35 0 15 419 1 133 35 0 420 2 133
                                    0 0 0 421 1 41 0 15 422 2 417 412 0 412 423
                                    0 133 0 424 2 133 9 0 0 425 1 133 2 0 426 1
                                    133 0 0 427 2 42 0 0 0 428 1 42 0 0 429 2
                                    41 9 0 0 430 1 133 78 0 431 2 78 9 432 0
                                    433 2 435 120 434 133 436 1 0 6 0 437 2 120
                                    0 41 35 438 1 120 0 41 439 2 120 0 0 0 440
                                    2 15 9 0 0 441 0 442 0 443 0 35 0 444 3 442
                                    0 0 27 35 445 1 442 0 57 446 3 449 442 447
                                    448 41 450 2 41 0 118 15 451 1 41 0 57 455
                                    3 458 41 456 457 442 459 2 461 133 460 120
                                    462 2 466 0 442 442 467 1 466 0 442 468 1
                                    469 0 466 470 2 472 469 471 133 473 2 133 9
                                    0 0 474 0 133 0 475 2 45 118 118 118 476 2
                                    78 0 0 0 477 1 0 74 349 478 1 0 74 349 479
                                    2 42 0 0 0 480 1 42 0 0 481 0 27 0 482 2 42
                                    0 15 0 483 2 38 0 0 0 484 6 454 442 442 442
                                    485 38 27 38 486 6 465 442 487 487 488 38
                                    27 38 489 2 0 118 118 118 490 2 491 118 118
                                    118 492 1 494 493 133 495 1 0 496 118 497 0
                                    498 0 499 2 41 0 6 498 500 1 0 0 501 502 2
                                    159 2 2 503 504 2 0 0 0 503 505 1 159 133
                                    15 506 1 159 2 2 507 1 0 0 0 508 1 45 503 0
                                    509 1 0 503 0 510 1 45 71 0 511 1 501 512 0
                                    513 1 501 512 0 514 2 517 2 515 516 518 3
                                    522 2 519 520 521 523 2 501 0 0 0 524 1 0
                                    525 0 526 1 0 0 6 527 1 501 0 503 528 1 501
                                    9 10 529 2 10 9 0 27 530 1 0 531 0 532 2 41
                                    9 0 0 533 0 534 0 535 0 120 0 536 2 120 9 0
                                    0 537 1 120 35 0 538 2 534 0 501 35 539 2
                                    534 0 0 0 540 2 501 0 118 27 541 1 501 10
                                    10 542 2 501 0 10 349 543 1 41 544 0 545 1
                                    41 6 0 546 0 501 0 547 1 120 9 0 548 2 501
                                    0 0 35 549 2 501 0 0 0 550 2 501 0 0 0 551
                                    1 45 552 0 553 1 0 552 0 554 4 0 0 0 555
                                    349 27 556 4 0 0 0 10 0 27 557 1 0 38 0 558
                                    1 38 0 349 559 1 38 0 0 560 1 27 9 0 561 2
                                    38 0 562 0 563 2 564 140 2 27 565 3 0 0 0
                                    555 567 568 1 0 0 27 569 2 570 0 2 2 571 2
                                    0 0 0 572 573 3 576 574 2 575 574 577 3 0
                                    578 0 575 578 579 3 582 580 2 581 580 583 3
                                    0 584 0 581 584 585 1 45 146 144 586 2 45
                                    154 144 152 587 3 588 574 15 575 574 589 4
                                    592 590 45 575 590 591 593 3 594 580 15 581
                                    580 595 4 598 596 45 581 596 597 599 2 45 0
                                    57 15 600 1 45 602 0 603 1 6 9 0 604 1 16
                                    15 6 605 1 45 606 0 607 1 0 606 0 608 3 0 0
                                    0 74 349 609 2 0 0 566 12 610 4 612 2 42 78
                                    15 611 613 3 0 0 0 74 349 614 2 0 0 10 349
                                    615 1 0 616 0 617 1 602 601 0 618 1 0 620 0
                                    621 1 0 14 0 622 2 0 9 0 0 117 2 1 349 0 27
                                    1 1 1 349 0 1 2 1 349 118 27 1 1 1 349 635
                                    1 1 1 349 118 1 2 1 0 0 27 1 1 1 0 0 1 2 1
                                    0 118 27 1 1 1 0 635 1 1 1 0 118 1 1 33 9 0
                                    54 3 1 0 0 0 0 281 3 1 0 0 0 0 279 3 1 0 0
                                    0 0 275 3 1 0 0 0 0 273 3 1 0 0 0 0 271 3 1
                                    0 0 0 0 277 3 1 0 0 0 0 269 2 1 0 0 0 285 1
                                    0 38 349 1 1 0 38 0 558 2 1 632 0 12 1 1 1
                                    0 0 225 1 1 636 0 1 1 1 0 0 1 1 1 9 0 1 1 0
                                    74 349 1 1 0 74 0 1 1 1 0 0 200 1 1 0 0 176
                                    2 1 0 0 27 366 2 1 0 0 369 370 2 22 628 0 0
                                    1 2 0 0 0 572 573 3 0 0 0 74 349 614 2 0 0
                                    0 652 1 2 1 0 0 0 289 2 1 0 0 0 287 1 28
                                    496 118 1 1 1 0 0 1 1 1 629 0 1 1 1 0 0 1 2
                                    28 624 625 118 1 2 0 9 0 0 95 2 1 9 0 0 1 1
                                    1 0 0 196 1 1 0 0 172 1 1 0 0 223 1 1 9 9
                                    128 1 1 0 0 204 1 1 0 0 180 0 32 0 1 2 1
                                    349 0 27 1 1 1 349 0 1 1 1 349 118 1 2 1
                                    349 118 27 1 1 1 349 635 1 3 1 0 0 118 27
                                    163 2 1 0 0 27 1 1 1 0 0 1 1 1 0 118 1 2 1
                                    0 118 27 161 1 1 0 635 1 1 16 628 0 1 2 16
                                    0 0 35 1 2 16 0 0 92 1 1 1 0 0 337 1 19 525
                                    0 526 1 20 71 0 72 1 1 634 0 1 1 14 643 0 1
                                    1 5 651 0 1 1 0 14 0 622 1 0 531 0 532 1 0
                                    18 0 19 1 19 501 0 1 1 20 503 0 510 1 1 107
                                    0 1 1 14 57 0 1 1 5 105 0 1 1 0 6 0 437 1 0
                                    27 0 1 1 0 12 0 13 2 1 0 0 0 1 2 25 626 144
                                    152 1 1 25 627 144 1 1 5 146 144 148 2 5
                                    154 144 152 156 1 1 0 0 111 1 16 628 0 1 2
                                    1 0 0 0 1 2 1 0 0 27 372 2 1 0 0 369 374 1
                                    1 638 349 1 1 1 9 0 1 2 1 0 0 0 267 2 1 0 0
                                    0 247 2 2 0 0 92 1 0 1 0 166 2 1 0 0 0 360
                                    3 12 584 0 581 584 585 3 13 578 0 575 578
                                    579 1 0 0 0 1 2 33 9 0 0 1 1 0 555 0 1 1 0
                                    10 10 37 1 16 9 0 52 1 34 9 0 1 1 5 0 0 88
                                    1 5 98 0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 616
                                    349 0 1 1 35 118 12 132 4 1 0 0 0 0 0 347 5
                                    36 0 349 349 349 349 0 352 2 0 0 566 12 610
                                    1 0 18 0 1 3 1 0 0 0 0 297 3 1 0 0 0 0 295
                                    1 1 0 0 170 1 1 0 0 391 3 1 0 0 0 0 335 3 1
                                    0 0 0 0 305 3 1 0 0 0 0 303 1 16 628 0 1 2
                                    16 0 0 35 1 2 16 0 0 92 1 2 1 637 0 0 1 1 1
                                    0 349 1 2 1 0 0 0 1 1 0 653 0 1 1 1 0 0 265
                                    3 1 0 0 0 0 345 3 1 0 0 0 0 301 3 1 0 0 0 0
                                    299 1 0 74 0 75 1 0 74 349 479 2 0 0 10 0 1
                                    2 0 0 10 349 615 2 1 0 0 0 313 2 1 0 0 0
                                    311 2 1 0 0 0 309 2 1 0 0 0 307 2 1 0 0 0
                                    331 2 1 0 0 0 333 2 1 0 0 0 325 4 1 0 0 0 0
                                    0 343 2 1 0 0 0 329 2 1 0 0 0 327 1 16 616
                                    0 1 1 5 647 0 1 1 29 616 0 617 1 29 620 0
                                    621 2 5 645 0 10 1 2 5 645 0 27 1 1 16 645
                                    0 1 2 0 9 0 27 76 2 0 9 0 10 1 1 8 0 0 1 2
                                    1 0 0 27 399 2 1 0 0 369 401 3 36 0 349 349
                                    0 350 2 1 0 0 0 341 1 0 35 0 1 2 1 0 0 0
                                    293 2 1 0 0 0 291 1 0 9 0 70 1 0 6 0 1 0 1
                                    9 127 2 1 118 118 118 490 2 1 0 0 0 1 1 1 0
                                    349 1 1 1 0 0 395 1 1 0 0 397 2 0 9 0 27 1
                                    2 0 9 0 0 1 1 1 0 0 231 1 1 0 0 229 2 1 0 0
                                    27 364 1 1 0 0 362 1 1 0 0 356 1 28 496 118
                                    1 1 28 496 118 497 1 1 629 0 1 3 1 641 0 0
                                    0 1 2 1 642 0 0 1 2 1 628 0 0 1 2 1 616 349
                                    0 1 1 1 0 0 168 1 34 9 0 1 4 9 0 0 10 0 27
                                    557 4 9 0 0 555 349 27 556 4 5 0 0 38 648
                                    567 1 4 5 0 0 27 35 649 1 4 5 0 0 38 648
                                    650 1 4 5 0 0 27 35 566 1 3 0 0 0 10 649 1
                                    3 0 0 0 10 566 1 3 0 0 0 555 650 1 3 0 0 0
                                    27 566 1 3 0 0 0 555 567 568 3 0 0 0 27 649
                                    1 3 0 0 0 38 567 1 3 0 0 0 38 650 1 3 0 0 0
                                    349 349 1 2 0 0 0 652 1 3 0 0 0 0 0 1 3 0 0
                                    0 74 349 609 2 0 0 0 572 1 3 0 0 0 12 0 1 1
                                    1 35 0 1 1 1 0 0 379 1 1 0 0 377 10 0 0 10
                                    0 0 0 0 0 0 0 0 0 1 2 0 0 10 349 1 8 0 0 10
                                    0 0 0 0 0 0 0 1 9 0 0 10 0 0 0 0 0 0 0 0 1
                                    7 0 0 10 0 0 0 0 0 0 1 5 0 0 10 0 0 0 0 1 6
                                    0 0 10 0 0 0 0 0 1 4 0 0 10 0 0 0 1 2 0 0
                                    10 0 1 3 0 0 10 0 0 1 3 1 0 0 0 0 323 1 1 0
                                    0 315 2 1 0 0 0 321 1 1 0 0 317 2 1 0 0 0
                                    319 2 1 639 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1
                                    0 0 233 1 1 0 0 393 1 1 0 0 245 3 5 0 0 38
                                    648 1 3 5 0 0 27 35 1 2 5 0 0 27 1 2 5 0 0
                                    38 1 1 1 0 0 89 1 1 98 0 101 1 35 0 0 508 1
                                    1 0 0 206 1 1 0 0 182 1 1 0 0 202 1 1 0 0
                                    178 1 1 0 0 198 1 1 0 0 174 1 9 552 0 554 1
                                    10 581 0 1 1 11 575 0 1 1 1 0 629 1 2 7 0 0
                                    0 1 1 1 0 0 235 1 37 623 144 1 2 18 0 0 0 1
                                    1 19 0 501 502 1 24 0 503 1 1 23 0 57 61 1
                                    1 0 630 1 1 1 0 631 1 1 1 0 633 1 1 1 0 107
                                    110 1 1 0 0 1 1 5 0 98 104 1 5 0 105 106 1
                                    0 0 6 527 1 0 0 27 569 1 0 0 12 136 1 0 606
                                    0 608 1 38 628 0 1 3 1 0 0 0 0 339 0 5 35 1
                                    1 1 0 0 227 1 0 0 0 1 2 1 0 0 0 358 2 1 0 0
                                    0 251 2 1 0 0 0 255 2 1 0 0 0 249 2 1 0 0 0
                                    253 1 0 9 10 11 1 1 0 0 212 1 1 0 0 188 3 5
                                    0 0 0 0 1 2 1 9 0 0 1 1 1 0 0 208 1 1 0 0
                                    184 1 1 0 0 216 1 1 0 0 192 2 0 0 27 349 1
                                    5 0 0 27 0 0 0 0 1 3 0 0 27 0 0 1 4 0 0 27
                                    0 0 0 1 2 0 0 27 0 1 2 5 0 0 0 1 2 5 9 0 0
                                    1 2 1 0 0 0 283 1 1 74 0 83 1 1 74 349 478
                                    1 1 0 0 263 1 1 0 0 261 1 1 0 0 259 1 1 0 0
                                    257 1 1 0 0 218 1 1 0 0 194 1 1 0 0 214 1 1
                                    0 0 190 1 1 0 0 210 1 1 0 0 186 1 1 0 0 221
                                    2 8 0 0 57 91 2 1 0 0 0 84 2 1 0 0 503 505
                                    2 16 0 0 35 90 2 16 0 0 92 93 0 33 0 47 1 1
                                    0 0 383 1 1 0 0 387 0 16 0 49 1 1 0 0 237 2
                                    1 0 0 0 239 1 1 0 0 381 3 5 0 0 27 35 1 3 5
                                    0 0 38 648 1 2 5 0 0 38 1 2 5 0 0 27 1 1 1
                                    0 0 385 1 1 0 0 389 2 1 0 0 0 241 3 1 0 0 0
                                    0 243 2 0 9 0 0 96 2 8 0 0 0 69 2 1 0 98 98
                                    139 1 22 0 0 56 2 22 0 0 0 67 2 29 0 0 0 65
                                    2 25 0 0 57 1 2 33 0 35 0 1 2 22 0 57 0 59
                                    2 29 0 92 0 1 2 2 0 6 0 1 2 1 0 503 0 1 2 1
                                    0 0 503 1 2 5 0 0 6 1 2 16 0 0 0 63)))))
           '|lookupComplete|)) 
