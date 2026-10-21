
(MAKEPROP '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(SDEFUN |EXPR;belong?;BoB;1| ((|op| (|BasicOperator|)) (% (|Boolean|))) 'T) 

(SDEFUN |EXPR;retNotUnit| ((|x| (%)) (% (R)))
        (SPROG ((|k| (|Kernel| %)) (|u| (|Union| R "failed")))
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
         ((|ps| (|SparseMultivariatePolynomial| R (|Symbol|)))
          (|vl1| (|List| (|Symbol|))) (#1=#:G93 NIL) (|z| NIL) (#2=#:G94 NIL)
          (|vl2| (|List| (|Kernel| %))))
         (SEQ (LETT |ps| |p|) (LETT |vl1| (SPADCALL |ps| (QREFELT % 40)))
              (LETT |vl2|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |z| NIL) (LETT #2# |vl1|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |z| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |z| (QREFELT % 30)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT % 44)))))) 

(SDEFUN |EXPR;0;%;6| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;1;%;7| ((% (%))) (|spadConstant| % 48)) 

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

(SDEFUN |EXPR;=;2%B;17| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|lk| (|List| (|Kernel| %))) (|res| (|Rep|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 71))
                            (SPADCALL |y| (QREFELT % 71)) (QREFELT % 72))
                  (SPADCALL (SPADCALL |x| (QREFELT % 73))
                            (SPADCALL |y| (QREFELT % 73)) (QREFELT % 72)))
                 (#1='T
                  (SEQ (LETT |lk| (|EXPR;commonk| |x| |y| %))
                       (EXIT
                        (COND ((NULL |lk|) NIL)
                              (#1#
                               (SEQ
                                (LETT |res|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |x| (QREFELT % 73))
                                                  (SPADCALL |y| (QREFELT % 71))
                                                  (QREFELT % 74))
                                        (SPADCALL (SPADCALL |y| (QREFELT % 73))
                                                  (SPADCALL |x| (QREFELT % 71))
                                                  (QREFELT % 74))
                                        (QREFELT % 75))
                                       (QREFELT % 76)))
                                (EXIT
                                 (SPADCALL (|EXPR;reduc| |res| |lk| %)
                                           (QREFELT % 53))))))))))))) 

(SDEFUN |EXPR;=;2%B;18| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|res| (|Rep|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 71))
                            (SPADCALL |y| (QREFELT % 71)) (QREFELT % 72))
                  (SPADCALL (SPADCALL |x| (QREFELT % 73))
                            (SPADCALL |y| (QREFELT % 73)) (QREFELT % 72)))
                 ('T
                  (SEQ
                   (LETT |res|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 73))
                                     (SPADCALL |y| (QREFELT % 71))
                                     (QREFELT % 74))
                           (SPADCALL (SPADCALL |y| (QREFELT % 73))
                                     (SPADCALL |x| (QREFELT % 71))
                                     (QREFELT % 74))
                           (QREFELT % 75))
                          (QREFELT % 76)))
                   (EXIT
                    (SPADCALL (|EXPR;reduc| |res| (|EXPR;commonk| |x| |y| %) %)
                              (QREFELT % 53))))))))) 

(SDEFUN |EXPR;number?;%B;19| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((|HasCategory| (QREFELT % 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT % 78)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT % 80)) 0))))
         (#1# (SPADCALL |x| (QREFELT % 78))))) 

(SDEFUN |EXPR;simplifyPower| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|k| (|List| (|Kernel| %))) (|args| (|List| %)))
               (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 83)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| '|%power| (QREFELT % 84))
                       (SEQ
                        (LETT |args|
                              (SPADCALL (SPADCALL |k| (QREFELT % 85))
                                        (QREFELT % 87)))
                        (COND
                         ((NULL (EQL (SPADCALL |args| (QREFELT % 88)) 2))
                          (EXIT (|error| "Too many arguments to ^"))))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |args| 1 (QREFELT % 89))
                                     (QREFELT % 81))
                           (SPADCALL
                            (|EXPR;reduc|
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 89)) |n|
                                       (QREFELT % 90))
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 89))
                                       (QREFELT % 91))
                             %)
                            (SPADCALL |args| 2 (QREFELT % 89)) (QREFELT % 92)))
                          (#1='T
                           (SPADCALL (SPADCALL |args| (QREFELT % 93))
                                     (SPADCALL |n|
                                               (SPADCALL |args| (QREFELT % 94))
                                               (QREFELT % 59))
                                     (QREFELT % 92)))))))
                      (#1#
                       (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT % 90))
                        (SPADCALL |x| (QREFELT % 91)) %))))))) 

(SDEFUN |EXPR;^;%Nni%;21| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 96)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 97)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;^;%I%;22| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| % 49) |x| (QREFELT % 69)))
                (#1#
                 (SPADCALL
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 96)) |n| %)
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 97)) |n| %)
                  (QREFELT % 69))))))) 

(SDEFUN |EXPR;^;%Pi%;23| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 96)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 97)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;smaller?;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 71)) (SPADCALL |y| (QREFELT % 71))
                    (QREFELT % 72))
          (SPADCALL (SPADCALL |x| (QREFELT % 73)) (SPADCALL |y| (QREFELT % 73))
                    (QREFELT % 102)))
         ('T
          (SPADCALL (SPADCALL |x| (QREFELT % 71)) (SPADCALL |y| (QREFELT % 71))
                    (QREFELT % 102))))) 

(SDEFUN |EXPR;numer;%Smp;25|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 104))) 

(SDEFUN |EXPR;denom;%Smp;26|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 105))) 

(SDEFUN |EXPR;coerce;Smp%;27|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%)))
        (CONS |p| (|spadConstant| % 107))) 

(SDEFUN |EXPR;coerce;P%;28| ((|p| (|Polynomial| R)) (% (%)))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| %))
                    (EXIT (CONS |en| (|spadConstant| % 107)))))) 

(SDEFUN |EXPR;coerce;F%;29| ((|pq| (|Fraction| (|Polynomial| R))) (% (%)))
        (SPROG
         ((|en| #1=(|SparseMultivariatePolynomial| R (|Kernel| %))) (|ed| #1#))
         (SEQ (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 111)) %))
              (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 112)) %))
              (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2%;30| ((|x| (%)) (% (%)))
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT % 91)) %)) 

(SDEFUN |EXPR;commonk| ((|x| (%)) (|y| (%)) (% (|List| (|Kernel| %))))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT % 91))
         (SPADCALL |y| (QREFELT % 91)) %)) 

(SDEFUN |EXPR;algkernels|
        ((|l| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT % 8) %))
                         |l| (QREFELT % 116)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG (% ALGOP)
          (LETT % (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 31)) ALGOP (QREFELT % 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL |f| (QREFELT % 91)) (QREFELT % 118))) 

(SDEFUN |EXPR;simple_root| ((|r| (|Kernel| %)) (% (|Boolean|)))
        (SPROG ((|al| (|List| %)) (|a| (%)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT % 119))
                  (SEQ (LETT |al| (SPADCALL |r| (QREFELT % 87)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |al| 2 (QREFELT % 89))
                                    (SPADCALL 2 (QREFELT % 61))
                                    (QREFELT % 120))
                          NIL)
                         (#1='T
                          (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT % 89)))
                               (EXIT
                                (NULL
                                 (>
                                  (LENGTH
                                   (|EXPR;algkernels|
                                    (SPADCALL |a| (QREFELT % 83)) %))
                                  0)))))))))
                 (#1# NIL))))) 

(SDEFUN |EXPR;root_reduce| ((|x| (%)) (|r| (|Kernel| %)) (% (%)))
        (SPROG
         ((|a| (%)) (|an| #1=(|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|dn| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|dp|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|n0| #1#) (|c1| #2=(|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|c0| #2#) (|n1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|d1| (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (SEQ
          (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT % 87)) 1 (QREFELT % 89)))
          (LETT |an| (SPADCALL |a| (QREFELT % 73)))
          (LETT |dn| (SPADCALL |a| (QREFELT % 71)))
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT % 71)) |r| (QREFELT % 122)))
          (LETT |n0| (SPADCALL |x| (QREFELT % 73)))
          (LETT |c1| (SPADCALL |dp| (QREFELT % 124)))
          (LETT |c0|
                (SPADCALL (SPADCALL |dp| (QREFELT % 125)) (QREFELT % 124)))
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT % 74))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 107) |r| 1
                                                (QREFELT % 126))
                                      |c1| (QREFELT % 74))
                                     |n0| (QREFELT % 74))
                                    (QREFELT % 75))
                          (QREFELT % 74)))
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT % 74)) |dn|
                           (QREFELT % 74))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT % 74)) |c1|
                           (QREFELT % 74))
                 (QREFELT % 75)))
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT % 127)) (LIST |r|) %))))) 

(MAKEPROP '|EXPR;getSimplifyDenomsFlag;B;36| '|SPADreplace|
          '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;36| ((% (|Boolean|))) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;37| ((|x| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|res| (|Boolean|)))
               (SEQ (LETT |res| (SPADCALL (QREFELT % 128)))
                    (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| (%)) (|ckl| (|List| (|Kernel| %))) (% (%)))
        (SPROG
         ((|akl| (|List| (|Kernel| %))) (|r| (|Kernel| %)) (#1=#:G166 NIL)
          (|sas| (|SingletonAsOrderedSet|)) (|k| NIL) (#2=#:G167 NIL)
          (|q| (|SparseUnivariatePolynomial| %)) (|x1| (%)))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| %))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT % 128))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 107)
                                     (SPADCALL |x1| (QREFELT % 71))
                                     (QREFELT % 127))
                           (QREFELT % 91)))
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#3='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT % 130)))
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| %)
                                   (PROGN
                                    (LETT #1# (|EXPR;root_reduce| |x1| |r| %))
                                    (GO #4=#:G165))))))))
                             (LETT |sas| (SPADCALL (QREFELT % 132)))
                             (SEQ (LETT |k| NIL) (LETT #2# |akl|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |k| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |q|
                                         (SPADCALL |x1| |k|
                                                   (SPADCALL |k|
                                                             (QREFELT % 133))
                                                   (QREFELT % 136)))
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT % 137))
                                                     (QREFELT % 138))
                                           (QREFELT % 139)))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#3# |x1|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;/;2Smp%;39|
        ((|x| (|SparseMultivariatePolynomial| R #1=(|Kernel| %)))
         (|y| (|SparseMultivariatePolynomial| R #1#)) (% (%)))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT % 127))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| % 107) (QREFELT % 127))
          (SPADCALL |y| (|spadConstant| % 107) (QREFELT % 127)) %)
         %)) 

(SDEFUN |EXPR;reducedSystem;MM;40| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |m|
                           (QREFELT % 143))
                 (QREFELT % 146)))
          (EXIT (SPADCALL |mm| (QREFELT % 148)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;41|
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
                           (QREFELT % 143))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |v|
                           (QREFELT % 151))
                 (QREFELT % 154)))
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT % 156)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| (|List| (|Kernel| %))) (|y| (|List| (|Kernel| %)))
         (% (|List| (|Kernel| %))))
        (SPROG ((|k| NIL) (#1=#:G186 NIL) (|ans| (|List| (|Kernel| %))))
               (SEQ (LETT |ans| NIL)
                    (SEQ (LETT |k| NIL) (LETT #1# (NREVERSE |x|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| |y| (QREFELT % 158))
                             (LETT |ans|
                                   (SPADCALL |k| |ans| (QREFELT % 159)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS%;43|
        ((|x| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|)) (% (%)))
        (SPADCALL |x| |v| (QREFELT % 161))) 

(SDEFUN |EXPR;rootSum;%SupS%;44|
        ((|x| (%)) (|p| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|))
         (% (%)))
        (SPADCALL |x| |p| |v| (QREFELT % 163))) 

(SDEFUN |EXPR;pi;%;45| ((% (%))) (SPADCALL (QREFELT % 166))) 

(SDEFUN |EXPR;exp;2%;46| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 168))) 

(SDEFUN |EXPR;log;2%;47| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 170))) 

(SDEFUN |EXPR;sin;2%;48| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 172))) 

(SDEFUN |EXPR;cos;2%;49| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 174))) 

(SDEFUN |EXPR;tan;2%;50| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 176))) 

(SDEFUN |EXPR;cot;2%;51| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 178))) 

(SDEFUN |EXPR;sec;2%;52| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 180))) 

(SDEFUN |EXPR;csc;2%;53| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 182))) 

(SDEFUN |EXPR;asin;2%;54| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 184))) 

(SDEFUN |EXPR;acos;2%;55| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 186))) 

(SDEFUN |EXPR;atan;2%;56| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 188))) 

(SDEFUN |EXPR;acot;2%;57| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 190))) 

(SDEFUN |EXPR;asec;2%;58| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 192))) 

(SDEFUN |EXPR;acsc;2%;59| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 194))) 

(SDEFUN |EXPR;sinh;2%;60| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 196))) 

(SDEFUN |EXPR;cosh;2%;61| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 198))) 

(SDEFUN |EXPR;tanh;2%;62| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 200))) 

(SDEFUN |EXPR;coth;2%;63| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 202))) 

(SDEFUN |EXPR;sech;2%;64| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 204))) 

(SDEFUN |EXPR;csch;2%;65| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 206))) 

(SDEFUN |EXPR;asinh;2%;66| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 208))) 

(SDEFUN |EXPR;acosh;2%;67| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 210))) 

(SDEFUN |EXPR;atanh;2%;68| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 212))) 

(SDEFUN |EXPR;acoth;2%;69| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 214))) 

(SDEFUN |EXPR;asech;2%;70| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 216))) 

(SDEFUN |EXPR;acsch;2%;71| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 218))) 

(SDEFUN |EXPR;abs;2%;72| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 221))) 

(SDEFUN |EXPR;sign;2%;73| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 223))) 

(SDEFUN |EXPR;unitStep;2%;74| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 225))) 

(SDEFUN |EXPR;ceiling;2%;75| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 227))) 

(SDEFUN |EXPR;floor;2%;76| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 229))) 

(SDEFUN |EXPR;fractionPart;2%;77| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 231))) 

(SDEFUN |EXPR;diracDelta;2%;78| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 233))) 

(SDEFUN |EXPR;conjugate;2%;79| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 235))) 

(SDEFUN |EXPR;Gamma;2%;80| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 237))) 

(SDEFUN |EXPR;Gamma;3%;81| ((|a| (%)) (|x| (%)) (% (%)))
        (SPADCALL |a| |x| (QREFELT % 239))) 

(SDEFUN |EXPR;Beta;3%;82| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 241))) 

(SDEFUN |EXPR;Beta;4%;83| ((|x| (%)) (|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |x| |a| |b| (QREFELT % 243))) 

(SDEFUN |EXPR;digamma;2%;84| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 245))) 

(SDEFUN |EXPR;polygamma;3%;85| ((|k| (%)) (|x| (%)) (% (%)))
        (SPADCALL |k| |x| (QREFELT % 247))) 

(SDEFUN |EXPR;besselJ;3%;86| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 249))) 

(SDEFUN |EXPR;besselY;3%;87| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 251))) 

(SDEFUN |EXPR;besselI;3%;88| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 253))) 

(SDEFUN |EXPR;besselK;3%;89| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 255))) 

(SDEFUN |EXPR;airyAi;2%;90| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 257))) 

(SDEFUN |EXPR;airyAiPrime;2%;91| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 259))) 

(SDEFUN |EXPR;airyBi;2%;92| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 261))) 

(SDEFUN |EXPR;airyBiPrime;2%;93| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 263))) 

(SDEFUN |EXPR;lambertW;2%;94| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 265))) 

(SDEFUN |EXPR;polylog;3%;95| ((|s| (%)) (|x| (%)) (% (%)))
        (SPADCALL |s| |x| (QREFELT % 267))) 

(SDEFUN |EXPR;weierstrassP;4%;96| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 269))) 

(SDEFUN |EXPR;weierstrassPPrime;4%;97|
        ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 271))) 

(SDEFUN |EXPR;weierstrassSigma;4%;98| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 273))) 

(SDEFUN |EXPR;weierstrassZeta;4%;99| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 275))) 

(SDEFUN |EXPR;weierstrassPInverse;4%;100|
        ((|g2| (%)) (|g3| (%)) (|z| (%)) (% (%)))
        (SPADCALL |g2| |g3| |z| (QREFELT % 277))) 

(SDEFUN |EXPR;whittakerM;4%;101| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 279))) 

(SDEFUN |EXPR;whittakerW;4%;102| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 281))) 

(SDEFUN |EXPR;angerJ;3%;103| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 283))) 

(SDEFUN |EXPR;weberE;3%;104| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 285))) 

(SDEFUN |EXPR;struveH;3%;105| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 287))) 

(SDEFUN |EXPR;struveL;3%;106| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 289))) 

(SDEFUN |EXPR;hankelH1;3%;107| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 291))) 

(SDEFUN |EXPR;hankelH2;3%;108| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 293))) 

(SDEFUN |EXPR;lommelS1;4%;109| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 295))) 

(SDEFUN |EXPR;lommelS2;4%;110| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 297))) 

(SDEFUN |EXPR;kummerM;4%;111| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 299))) 

(SDEFUN |EXPR;kummerU;4%;112| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 301))) 

(SDEFUN |EXPR;legendreP;4%;113| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 303))) 

(SDEFUN |EXPR;legendreQ;4%;114| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 305))) 

(SDEFUN |EXPR;kelvinBei;3%;115| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 307))) 

(SDEFUN |EXPR;kelvinBer;3%;116| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 309))) 

(SDEFUN |EXPR;kelvinKei;3%;117| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 311))) 

(SDEFUN |EXPR;kelvinKer;3%;118| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 313))) 

(SDEFUN |EXPR;ellipticK;2%;119| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 315))) 

(SDEFUN |EXPR;ellipticE;2%;120| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 317))) 

(SDEFUN |EXPR;ellipticE;3%;121| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 319))) 

(SDEFUN |EXPR;ellipticF;3%;122| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 321))) 

(SDEFUN |EXPR;ellipticPi;4%;123| ((|z| (%)) (|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |n| |m| (QREFELT % 323))) 

(SDEFUN |EXPR;jacobiSn;3%;124| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 325))) 

(SDEFUN |EXPR;jacobiCn;3%;125| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 327))) 

(SDEFUN |EXPR;jacobiDn;3%;126| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 329))) 

(SDEFUN |EXPR;jacobiZeta;3%;127| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 331))) 

(SDEFUN |EXPR;jacobiTheta;3%;128| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 333))) 

(SDEFUN |EXPR;lerchPhi;4%;129| ((|z| (%)) (|s| (%)) (|a| (%)) (% (%)))
        (SPADCALL |z| |s| |a| (QREFELT % 335))) 

(SDEFUN |EXPR;riemannZeta;2%;130| ((|z| (%)) (% (%)))
        (SPADCALL |z| (QREFELT % 337))) 

(SDEFUN |EXPR;charlierC;4%;131| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 339))) 

(SDEFUN |EXPR;hahn_p;7%;132|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|d| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |d| |z| (QREFELT % 341))) 

(SDEFUN |EXPR;hahnQ;6%;133|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 343))) 

(SDEFUN |EXPR;hahnR;6%;134|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 345))) 

(SDEFUN |EXPR;hahnS;6%;135|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 347))) 

(SDEFUN |EXPR;hermiteH;3%;136| ((|n| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |z| (QREFELT % 349))) 

(SDEFUN |EXPR;krawtchoukK;5%;137|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 351))) 

(SDEFUN |EXPR;jacobiP;5%;138| ((|n| (%)) (|a| (%)) (|b| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |z| (QREFELT % 353))) 

(SDEFUN |EXPR;laguerreL;4%;139| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 355))) 

(SDEFUN |EXPR;meixnerM;5%;140|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 357))) 

(SDEFUN |EXPR;meixnerP;5%;141|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 359))) 

(SDEFUN |EXPR;racahR;7%;142|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|d| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |d| |z| (QREFELT % 361))) 

(SDEFUN |EXPR;wilsonW;7%;143|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|d| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |d| |z| (QREFELT % 363))) 

(SDEFUN |EXPR;hypergeometricF;2L2%;144|
        ((|la| #1=(|List| %)) (|lb| #1#) (|x| (%)) (% (%)))
        (SPADCALL |la| |lb| |x| (QREFELT % 365))) 

(SDEFUN |EXPR;meijerG;4L2%;145|
        ((|la| #1=(|List| %)) (|lb| #1#) (|lc| #1#) (|ld| #1#) (|x| (%))
         (% (%)))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT % 368))) 

(SDEFUN |EXPR;^;3%;146| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 371))) 

(SDEFUN |EXPR;factorial;2%;147| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 372))) 

(SDEFUN |EXPR;binomial;3%;148| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 374))) 

(SDEFUN |EXPR;permutation;3%;149| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 376))) 

(SDEFUN |EXPR;factorials;2%;150| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 378))) 

(SDEFUN |EXPR;factorials;%S%;151| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 380))) 

(SDEFUN |EXPR;summation;%S%;152| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 382))) 

(SDEFUN |EXPR;summation;%Sb%;153|
        ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 385))) 

(SDEFUN |EXPR;product;%S%;154| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 388))) 

(SDEFUN |EXPR;product;%Sb%;155| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 390))) 

(SDEFUN |EXPR;erf;2%;156| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 393))) 

(SDEFUN |EXPR;erfi;2%;157| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 395))) 

(SDEFUN |EXPR;Ei;2%;158| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 397))) 

(SDEFUN |EXPR;Si;2%;159| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 399))) 

(SDEFUN |EXPR;Ci;2%;160| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 401))) 

(SDEFUN |EXPR;Shi;2%;161| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 403))) 

(SDEFUN |EXPR;Chi;2%;162| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 405))) 

(SDEFUN |EXPR;li;2%;163| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 407))) 

(SDEFUN |EXPR;dilog;2%;164| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 409))) 

(SDEFUN |EXPR;fresnelS;2%;165| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 411))) 

(SDEFUN |EXPR;fresnelC;2%;166| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 413))) 

(SDEFUN |EXPR;integral;%S%;167| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 415))) 

(SDEFUN |EXPR;integral;%Sb%;168| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 417))) 

(SDEFUN |EXPR;operator;2Bo;169| ((|op| #1=(|BasicOperator|)) (% #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT % 419))
                  (SPADCALL |op| (QREFELT % 420)))
                 ((SPADCALL |op| (QREFELT % 421))
                  (SPADCALL |op| (QREFELT % 422)))
                 ((SPADCALL |op| (QREFELT % 423))
                  (SPADCALL |op| (QREFELT % 424)))
                 ((SPADCALL |op| (QREFELT % 425))
                  (SPADCALL |op| (QREFELT % 426)))
                 ((SPADCALL |op| (QREFELT % 427))
                  (SPADCALL |op| (QREFELT % 428)))
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
         ((|k| NIL) (#1=#:G335 NIL) (|p| (|SparseUnivariatePolynomial| %))
          (|d| (|NonNegativeInteger|)) (|num1| (%)) (|den1| (%))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|evaled| (|Boolean|)))
         (SEQ (LETT |num| (SPADCALL |x| (QREFELT % 73)))
              (LETT |den| (SPADCALL |x| (QREFELT % 71))) (LETT |evaled| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |p| (SPADCALL |k| (QREFELT % 133)))
                        (LETT |d| (SPADCALL |p| (QREFELT % 429)))
                        (EXIT
                         (COND
                          ((OR (>= (SPADCALL |num| |k| (QREFELT % 430)) |d|)
                               (>= (SPADCALL |den| |k| (QREFELT % 430)) |d|))
                           (SEQ (LETT |num1| (|EXPR;evl| |num| |k| |p| %))
                                (LETT |den1| (|EXPR;evl| |den| |k| |p| %))
                                (LETT |num|
                                      (SPADCALL
                                       (SPADCALL |num1| (QREFELT % 73))
                                       (SPADCALL |den1| (QREFELT % 71))
                                       (QREFELT % 74)))
                                (LETT |den|
                                      (SPADCALL
                                       (SPADCALL |den1| (QREFELT % 73))
                                       (SPADCALL |num1| (QREFELT % 71))
                                       (QREFELT % 74)))
                                (EXIT (LETT |evaled| 'T)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|evaled| (SPADCALL |num| |den| (QREFELT % 127)))
                     ('T |x|)))))) 

(SDEFUN |EXPR;evl0|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %))))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 432)) |k| (QREFELT % 435))
                  (QREFELT % 437))) 

(SDEFUN |EXPR;evl|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %)) (|m| (|SparseUnivariatePolynomial| %))
         (% (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT % 430)) (SPADCALL |m| (QREFELT % 429)))
          (SPADCALL |p| (QREFELT % 432)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| %) |m| (QREFELT % 438))
                    (SPADCALL (SPADCALL |k| (QREFELT % 439)) (QREFELT % 432))
                    (QREFELT % 440))))) 

(SDEFUN |EXPR;noalg?| ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPROG ((#1=#:G345 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| % 441)
                                    (QREFELT % 442)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT % 443))
                                        (QREFELT % 83))
                              %)))
                           (PROGN (LETT #1# NIL) (GO #2=#:G344)))
                          ('T (LETT |p| (SPADCALL |p| (QREFELT % 444)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |EXPR;algkers|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|List| (|Kernel| %))))
        (SPROG ((|lc| (%)) (|res| (|List| (|Kernel| %))))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 441)
                                      (QREFELT % 442)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT % 443)))
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT % 91))
                                              |res| (QREFELT % 445)))
                              (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 444)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT % 446)))))) 

(SDEFUN |EXPR;algpars| ((|lk| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG
         ((|k| NIL) (#1=#:G358 NIL) (|arg| (|List| %))
          (|res| (|List| (|Kernel| %))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 119)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT % 119)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT % 87)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT % 89))
                                      (QREFELT % 83))
                            |res| (QREFELT % 445)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 446)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| %)
                  (SPADCALL |p| (QREFELT % 447)) (QREFELT % 449))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 71)) (|spadConstant| % 107)
                  (QREFELT % 72))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| (|SparseUnivariatePolynomial| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPADCALL (ELT % 73) |p| (QREFELT % 452))) 

(SDEFUN |EXPR;def_poly|
        ((|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPROG
         ((|args| (|List| %)) (|arg1| (%)) (|arg2| (%))
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (#1=#:G371 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 87)))
              (LETT |arg1| (SPADCALL |args| (QREFELT % 93)))
              (LETT |arg2| (SPADCALL |args| 2 (QREFELT % 89)))
              (EXIT
               (COND
                ((SPADCALL |k| '|rootOf| (QREFELT % 119))
                 (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT % 73)))
                      (EXIT
                       (SPADCALL |p1| (SPADCALL |arg2| (QREFELT % 13))
                                 (QREFELT % 122)))))
                ((SPADCALL |k| '|nthRoot| (QREFELT % 119))
                 (SEQ
                  (LETT |n|
                        (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT % 453)))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 71)) |n|
                              (QREFELT % 454))
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 73)) (QREFELT % 455))
                    (QREFELT % 456)))))
                ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| (|Kernel| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Symbol|)))
        (SPROG
         ((|s| NIL) (#1=#:G382 NIL) (|k| NIL) (#2=#:G381 NIL) (#3=#:G380 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #1# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #1#)
                       (PROGN (LETT |s| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |k0| (QREFELT % 457))
                     (PROGN (LETT #3# |s|) (GO #4=#:G379))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #4# (EXIT #3#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| (|Symbol|)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Kernel| %)))
        (SPROG
         ((|s| NIL) (#1=#:G390 NIL) (|k| NIL) (#2=#:G389 NIL) (#3=#:G388 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #1# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #1#)
                       (PROGN (LETT |s| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| |s0|) (PROGN (LETT #3# |k|) (GO #4=#:G387))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap2: symbol not on the list"))))
          #4# (EXIT #3#)))) 

(SDEFUN |EXPR;MP_to_PI|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Polynomial| (|Integer|))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;MP_to_PI!0| (VECTOR |ls| |lk| %))
                         (ELT % 462) |p| (QREFELT % 466)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 459) (|EXPR;varmap1| |k| |lk| |ls| %)
                      (|spadConstant| % 460) (QREFELT % 461)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (|xk| (|Kernel| %)) (% (|Polynomial| (|Integer|))))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |p2| (SPADCALL |p| |xk| (QREFELT % 467)))
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
         ((|p1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|p3| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (LETT |p1|
                (SPADCALL (CONS #'|EXPR;PI_to_SUP!0| (VECTOR |ls| |lk| %))
                          (ELT % 471) |p| (QREFELT % 475)))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT % 122)))
          (EXIT (LETT |p3| (SPADCALL (ELT % 76) |p2| (QREFELT % 478))))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 107) (|EXPR;varmap2| |s| |lk| |ls| %)
                      (|spadConstant| % 460) (QREFELT % 126)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| (%)) (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 73)) |lk| |ls| %)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 71)) |lk| |ls| %)
                  (QREFELT % 483))) 

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
         ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ (LETT |p2| (SPADCALL |p| |k| (QREFELT % 467)))
              (LETT |up|
                    (SPADCALL
                     (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| %)
                               (QREFELT % 484))
                     (QREFELT % 486)))
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
                          (QREFELT % 489)))
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |ls| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| %))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;188|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SPROG
         ((|cl| (|List| %)) (|apars| (|List| (|Kernel| %)))
          (|all_kers0| (|List| (|Kernel| %))) (|akers| (|List| (|Kernel| %)))
          (#2=#:G441 NIL) (#3=#:G442 NIL) (|all_syms0| (|List| #4=(|Symbol|)))
          (|x| #4#) (|xk| (|Kernel| %)) (|all_kers| (|List| (|Kernel| %)))
          (|all_syms| (|List| (|Symbol|))) (#5=#:G443 NIL) (#6=#:G444 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| %)))))
          (#7=#:G445 NIL) (#8=#:G446 NIL) (|p1| #9=(|Polynomial| (|Integer|)))
          (|q1| #9#) (#10=#:G447 NIL) (#11=#:G449 NIL) (#12=#:G448 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#13=#:G450 NIL)
          (#14=#:G451 NIL) (|a_syms| (|List| (|Symbol|)))
          (|p_syms| (|List| (|Symbol|))) (|g1| (|Polynomial| (|Integer|)))
          (|p2|
           #15=(|Record| (|:| |var| (|Symbol|))
                         (|:| |coef|
                              (|SparseUnivariatePolynomial|
                               (|Fraction| (|Polynomial| (|Integer|)))))))
          (|q2| #15#) (#16=#:G452 NIL) (|k| NIL) (#17=#:G454 NIL) (|m| NIL)
          (#18=#:G453 NIL)
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (|g2| (|Polynomial| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| % 441) (QREFELT % 490)) |q|)
                ((EQL (SPADCALL |p| (QREFELT % 429)) 0) (|spadConstant| % 491))
                ((SPADCALL |q| (|spadConstant| % 441) (QREFELT % 490)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT % 429)) 0)
                   (|spadConstant| % 491))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| %)
                      (COND
                       ((|EXPR;noalg?| |q| %)
                        (EXIT (SPADCALL |p| |q| (QREFELT % 492)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT % 447))
                                    (SPADCALL |q| (QREFELT % 447))
                                    (QREFELT % 493)))
                    (LETT |akers| (SPADCALL |cl| (QREFELT % 494)))
                    (LETT |apars| (|EXPR;algpars| |akers| %))
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT % 495)) |apars|
                                    (QREFELT % 496)))
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT % 497))))
                    (LETT |all_syms0|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |k| NIL) (LETT #3# |all_kers0|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL (QREFELT % 498))
                                              #2#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                    (LETT |x| (SPADCALL (QREFELT % 498)))
                    (LETT |xk| (SPADCALL |x| (QREFELT % 30)))
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT % 499)))
                    (LETT |all_syms| (CONS |x| |all_syms0|))
                    (LETT |lm|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |k| NIL) (LETT #6# |akers|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |k| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (|EXPR;def_poly| |k| %) #5#))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |a_syms|
                          (PROGN
                           (LETT #7# NIL)
                           (SEQ (LETT |k| NIL) (LETT #8# |akers|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |k| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (|EXPR;varmap1| |k| |all_kers|
                                          |all_syms| %)
                                         #7#))))
                                (LETT #8# (CDR #8#)) (GO G190) G191
                                (EXIT (NREVERSE #7#)))))
                    (LETT |p_syms|
                          (SPADCALL |all_syms0| |a_syms| (QREFELT % 500)))
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
                                 (SEQ (LETT |k| NIL) (LETT #11# |akers|)
                                      (LETT |m| NIL) (LETT #12# |lm|) G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN (LETT |m| (CAR #12#)) NIL)
                                            (ATOM #11#)
                                            (PROGN (LETT |k| (CAR #11#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (|EXPR;SUPP_to_PI| |m|
                                                |all_kers| |all_syms| |k| %)
                                               #10#))))
                                      (LETT #12#
                                            (PROG1 (CDR #12#)
                                              (LETT #11# (CDR #11#))))
                                      (GO G190) G191 (EXIT (NREVERSE #10#)))))
                          (LETT |a_syms|
                                (PROGN
                                 (LETT #13# NIL)
                                 (SEQ (LETT |k| NIL) (LETT #14# |akers|) G190
                                      (COND
                                       ((OR (ATOM #14#)
                                            (PROGN (LETT |k| (CAR #14#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #13#
                                              (CONS
                                               (|EXPR;varmap1| |k| |all_kers|
                                                |all_syms| %)
                                               #13#))))
                                      (LETT #14# (CDR #14#)) (GO G190) G191
                                      (EXIT (NREVERSE #13#)))))
                          (LETT |p_syms|
                                (SPADCALL |all_syms0| |a_syms|
                                          (QREFELT % 500)))
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT % 502)))
                          (EXIT
                           (|EXPR;PI_to_SUP| |g1| |all_kers| |all_syms| |xk|
                            %))))))))
                    (LETT |p2|
                          (|EXPR;SUP_to_PT| |p| |all_kers0| |all_syms0| |x| %))
                    (LETT |q2|
                          (|EXPR;SUP_to_PT| |q| |all_kers0| |all_syms0| |x| %))
                    (LETT |lm2|
                          (PROGN
                           (LETT #16# NIL)
                           (SEQ (LETT |k| NIL) (LETT #17# |akers|)
                                (LETT |m| NIL) (LETT #18# |lm|) G190
                                (COND
                                 ((OR (ATOM #18#)
                                      (PROGN (LETT |m| (CAR #18#)) NIL)
                                      (ATOM #17#)
                                      (PROGN (LETT |k| (CAR #17#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #16#
                                        (CONS
                                         (|EXPR;SUPP_to_PT| |m| |all_kers0|
                                          |all_syms0| |k| |x| %)
                                         #16#))))
                                (LETT #18#
                                      (PROG1 (CDR #18#)
                                        (LETT #17# (CDR #17#))))
                                (GO G190) G191 (EXIT (NREVERSE #16#)))))
                    (LETT |g2|
                          (SPADCALL |p2| |q2| |lm2| |p_syms| |x| |a_syms|
                                    (QREFELT % 505)))
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      %)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;189|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| %)
           (COND
            ((|EXPR;noalg?| |q| %)
             (EXIT (SPADCALL |p| |q| (QREFELT % 492)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT % 508))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;190|
        ((|x| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |x| (QREFELT % 511))) 

(SDEFUN |EXPR;coerce;An%;191| ((|x| (|AlgebraicNumber|)) (% (%)))
        (SPADCALL (SPADCALL |x| (|spadConstant| % 515) (QREFELT % 516))
                  (QREFELT % 76))) 

(SDEFUN |EXPR;^;%F%;192| ((|x| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |x| |r| (QREFELT % 520))) 

(SDEFUN |EXPR;minPoly;KSup;193|
        ((|k| (|Kernel| %)) (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |k| (QREFELT % 522))) 

(SDEFUN |EXPR;definingPolynomial;2%;194| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 523))) 

(SDEFUN |EXPR;retract;%F;195| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL |x| (QREFELT % 525))) 

(SDEFUN |EXPR;retractIfCan;%U;196|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 527))) 

(SDEFUN |EXPR;cor1| ((|c| (|Integer|)) (% (R))) (SPADCALL |c| (QREFELT % 528))) 

(SDEFUN |EXPR;corR| ((|xe| (|Expression| (|Integer|))) (% (|Expression| R)))
        (SPADCALL (CONS (|function| |EXPR;cor1|) %) |xe| (QREFELT % 533))) 

(SDEFUN |EXPR;coerce;An%;199| ((|x| (|AlgebraicNumber|)) (% (%)))
        (|EXPR;corR| |x| %)) 

(SDEFUN |EXPR;retractIfCan;%U;200|
        ((|x| (%)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((|n| #1=(|Union| (|AlgebraicNumber|) "failed")) (|d| #1#)
          (#2=#:G484 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 73)) %))
                 (EXIT
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (LETT |d| (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 71)) %))
                     (EXIT
                      (COND
                       ((QEQCAR |d| 0)
                        (PROGN
                         (LETT #2#
                               (CONS 0
                                     (SPADCALL (QCDR |n|) (QCDR |d|)
                                               (QREFELT % 534))))
                         (GO #3=#:G479))))))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #2#)))) 

(SDEFUN |EXPR;R2AN| ((|r| (R)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT % 537)) (QREFELT % 80)))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT % 538))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;AN_op?| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (COND ((SPADCALL |op| (QREFELT % 8) (QREFELT % 28)) 'T)
              ('T (SPADCALL |op| (QREFELT % 24))))) 

(SDEFUN |EXPR;k2an|
        ((|k| (|Kernel| %)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((|op| (|BasicOperator|)) (|args| (|List| %)) (|a2| (%))
          (|k1u| (|Union| (|Kernel| %) #1="failed")) (|k1| (|Kernel| %))
          (|s1u| (|Union| (|Symbol|) #1#)) (|s1| (|Symbol|)) (|a1| (%))
          (|denu| #2=(|Union| (|AlgebraicNumber|) #1#))
          (|den1| (|AlgebraicNumber|)) (|cc| (%)) (|ccu| #2#)
          (|eqa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|eq|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|x| NIL) (#3=#:G524 NIL) (|a| #2#) (#4=#:G523 NIL)
          (|arg| (|List| (|AlgebraicNumber|))))
         (SEQ
          (EXIT
           (COND
            ((NULL (|EXPR;AN_op?| (LETT |op| (SPADCALL |k| (QREFELT % 31))) %))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT % 539))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 87)))
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT % 89)))
                    (LETT |k1u| (SPADCALL |a2| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#5='T
                            (SEQ (LETT |k1| (QCDR |k1u|))
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT % 541)))
                                 (EXIT
                                  (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                        (#5#
                                         (SEQ (LETT |s1| (QCDR |s1u|))
                                              (LETT |a1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT % 89)))
                                              (LETT |denu|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |a1|
                                                                (QREFELT % 71))
                                                      (QREFELT % 76))
                                                     (QREFELT % 536)))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |denu| 1)
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#5#
                                                 (SEQ
                                                  (LETT |den1| (QCDR |denu|))
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT %
                                                                            73))
                                                         |k1| (QREFELT % 122)))
                                                  (LETT |eqa|
                                                        (|spadConstant| % 543))
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     % 544)
                                                                    (QREFELT %
                                                                             545)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          %
                                                                          124))
                                                               (QREFELT % 76)))
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         %
                                                                         536)))
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #4#
                                                                  (CONS 1
                                                                        "failed"))
                                                            (GO #6=#:G522)))
                                                          ('T
                                                           (SEQ
                                                            (LETT |eqa|
                                                                  (SPADCALL
                                                                   |eqa|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (QCDR
                                                                      |ccu|)
                                                                     |den1|
                                                                     (QREFELT %
                                                                              534))
                                                                    (SPADCALL
                                                                     |eq|
                                                                     (QREFELT %
                                                                              546))
                                                                    (QREFELT %
                                                                             547))
                                                                   (QREFELT %
                                                                            548)))
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT %
                                                                             125)))))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT %
                                                                            549))))))))))))))))))
              (#5#
               (SEQ (LETT |arg| NIL)
                    (SEQ (LETT |x| NIL)
                         (LETT #3# (SPADCALL |k| (QREFELT % 87))) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT % 536)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN (LETT #4# (CONS 1 "failed")) (GO #6#)))
                                ('T (LETT |arg| (CONS (QCDR |a|) |arg|))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT % 550))
                                     (NREVERSE |arg|) (QREFELT % 551))))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (% (|Union| (|AlgebraicNumber|) #1="failed")))
        (SPROG
         ((|x1| (|Union| (|Kernel| %) "failed")) (|k| (|Kernel| %))
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (#2=#:G543 NIL)
          (|ans| (|AlgebraicNumber|))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|c| (|Union| (|AlgebraicNumber|) #1#)))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT % 553)))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT % 554)) %))
                  (#3='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|))
                                    (QREFELT % 122)))
                    (LETT |t| (|EXPR;k2an| |k| %))
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#3#
                            (SEQ (LETT |ans| (|spadConstant| % 555))
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT % 556))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT % 124))
                                              %))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed"))
                                           (GO #4=#:G542)))
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
                                                                        % 546))
                                                                      (QREFELT
                                                                       % 557))
                                                                     (QREFELT %
                                                                              558))
                                                           (QREFELT % 559)))
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT %
                                                                     125)))))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT % 124)) %))
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#3#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT %
                                                                  559))))))))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;%If;205| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(SDEFUN |EXPR;eval;%Bo%S%;206|
        ((|f| (%)) (|op| (|BasicOperator|)) (|g| (%)) (|x| (|Symbol|)) (% (%)))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT % 564))) 

(SDEFUN |EXPR;eval;%LLS%;207|
        ((|f| (%)) (|ls| (|List| (|BasicOperator|))) (|lg| (|List| %))
         (|x| (|Symbol|)) (% (%)))
        (SPROG
         ((#1=#:G569 NIL) (#2=#:G570 NIL)
          (|llsym| (|List| (|List| (|Symbol|)))) (|lsym| (|List| (|Symbol|)))
          (|lsd| (|List| (|Symbol|))) (#3=#:G571 NIL) (#4=#:G572 NIL)
          (#5=#:G573 NIL) (#6=#:G574 NIL) (|ns| (|List| (|Symbol|)))
          (#7=#:G575 NIL) (#8=#:G577 NIL) (#9=#:G576 NIL)
          (|lforwardSubs| (|List| (|Equation| %))) (#10=#:G578 NIL) (|j| NIL)
          (#11=#:G580 NIL) (|i| NIL) (#12=#:G579 NIL)
          (|lbackwardSubs| (|List| (|Equation| %))) (#13=#:G581 NIL)
          (#14=#:G582 NIL) (|nlg| (|List| %)) (#15=#:G583 NIL) (|g| NIL)
          (#16=#:G584 NIL) (|res| (%)))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |g| NIL) (LETT #2# |lg|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |g| (QREFELT % 566)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT % 567)) (QREFELT % 568)))
          (LETT |lsd| (SPADCALL (ELT % 569) |lsym| (QREFELT % 571)))
          (EXIT
           (COND
            ((NULL |lsd|)
             (SPADCALL |f| |ls|
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |g| NIL) (LETT #4# |lg|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |g| |x| (QREFELT % 573))
                                           #3#))))
                             (LETT #4# (CDR #4#)) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT % 576)))
            ('T
             (SEQ
              (LETT |ns|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| NIL) (LETT #6# |lsd|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT % 498)) #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |lforwardSubs|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |j| NIL) (LETT #8# |ns|) (LETT |i| NIL)
                          (LETT #9# |lsd|) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |i| (CAR #9#)) NIL)
                                (ATOM #8#) (PROGN (LETT |j| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |i| (QREFELT % 577))
                                             (SPADCALL |j| (QREFELT % 577))
                                             (QREFELT % 579))
                                   #7#))))
                          (LETT #9# (PROG1 (CDR #9#) (LETT #8# (CDR #8#))))
                          (GO G190) G191 (EXIT (NREVERSE #7#)))))
              (LETT |lbackwardSubs|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |j| NIL) (LETT #11# |ns|) (LETT |i| NIL)
                          (LETT #12# |lsd|) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |i| (CAR #12#)) NIL)
                                (ATOM #11#) (PROGN (LETT |j| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL (SPADCALL |j| (QREFELT % 577))
                                             (SPADCALL |i| (QREFELT % 577))
                                             (QREFELT % 579))
                                   #10#))))
                          (LETT #12# (PROG1 (CDR #12#) (LETT #11# (CDR #11#))))
                          (GO G190) G191 (EXIT (NREVERSE #10#)))))
              (LETT |nlg|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |g| NIL) (LETT #14# |lg|) G190
                          (COND
                           ((OR (ATOM #14#) (PROGN (LETT |g| (CAR #14#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS
                                   (SPADCALL |g| |lforwardSubs|
                                             (QREFELT % 581))
                                   #13#))))
                          (LETT #14# (CDR #14#)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (LETT |res|
                    (SPADCALL |f| |ls|
                              (PROGN
                               (LETT #15# NIL)
                               (SEQ (LETT |g| NIL) (LETT #16# |nlg|) G190
                                    (COND
                                     ((OR (ATOM #16#)
                                          (PROGN (LETT |g| (CAR #16#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (SPADCALL |g| |x| (QREFELT % 573))
                                             #15#))))
                                    (LETT #16# (CDR #16#)) (GO G190) G191
                                    (EXIT (NREVERSE #15#))))
                              (QREFELT % 576)))
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT % 581)))))))))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;208|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 585))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;209|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 591))) 

(SDEFUN |EXPR;0;%;210| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;1;%;211| ((% (%))) (|spadConstant| % 48)) 

(SDEFUN |EXPR;-;2%;212| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;*;I2%;213| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 58))) 

(SDEFUN |EXPR;*;3%;214| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 62))) 

(SDEFUN |EXPR;+;3%;215| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;216| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;217| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 594))) 

(MAKEPROP '|EXPR;numer;%Smp;218| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;%Smp;218|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %)))) |x|) 

(MAKEPROP '|EXPR;coerce;Smp%;219| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp%;219|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%))) |p|) 

(SDEFUN |EXPR;coerce;P%;220| ((|p| (|Polynomial| R)) (% (%)))
        (|EXPR;poly_to_MP| |p| %)) 

(SDEFUN |EXPR;reducedSystem;MM;221| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPADCALL |m| (QREFELT % 595))) 

(SDEFUN |EXPR;reducedSystem;MVR;222|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPADCALL |m| |v| (QREFELT % 596))) 

(SDEFUN |EXPR;convert;%If;223| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Integer|)))
         (|l| (|PatternMatchResult| (|Integer|) |Rep|))
         (% (|PatternMatchResult| (|Integer|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 598))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;225|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) %)
                  (QREFELT % 602))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Float|)))
         (|l| (|PatternMatchResult| (|Float|) |Rep|))
         (% (|PatternMatchResult| (|Float|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 604))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;227|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) %)
                  (QREFELT % 608))) 

(SDEFUN |EXPR;0;%;228| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;+;3%;229| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;230| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;231| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 594))) 

(SDEFUN |EXPR;coerce;K%;232| ((|k| (|Kernel| %)) (% (%)))
        (SPADCALL 1 |k| (QREFELT % 609))) 

(SDEFUN |EXPR;kernels;%L;233| ((|x| (%)) (% (|List| (|Kernel| %))))
        (SPROG ((#1=#:G625 NIL) (|f| NIL) (#2=#:G626 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# (SPADCALL |x| (QREFELT % 612)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (QCAR |f|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |EXPR;coerce;R%;234| ((|x| (R)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 613)) (|spadConstant| % 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT % 614)) (QREFELT % 137))))) 

(SDEFUN |EXPR;retract;%R;235| ((|x| (%)) (% (R)))
        (COND ((SPADCALL |x| (QREFELT % 54)) (|spadConstant| % 95))
              ('T (|EXPR;retNotUnit| |x| %)))) 

(SDEFUN |EXPR;coerce;%Of;236| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 616))) 

(SDEFUN |EXPR;kereval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 622)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR % |lv| |lk|))
                             |x2| (QREFELT % 619))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT % 618)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 622))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G659 NIL) (|a| NIL) (#2=#:G660 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x| (QREFELT % 31))
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #2# (SPADCALL |x| (QREFELT % 87)))
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 623))
                                             #1#))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#))))
                              (QREFELT % 624)))))))) 

(SDEFUN |EXPR;isPlus;%U;239| ((|x| (%)) (% (|Union| (|List| %) "failed")))
        (SPROG
         ((|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|)))))
          (#1=#:G675 NIL) (|t| NIL) (#2=#:G676 NIL))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 612))))
                (NULL (CDR |l|)))
            (CONS 1 "failed"))
           ('T
            (CONS 0
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |t| NIL) (LETT #2# |l|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (SPADCALL (QCDR |t|) (QCAR |t|)
                                           (QREFELT % 609))
                                 #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))))))) 

(SDEFUN |EXPR;isMult;%U;240|
        ((|x| (%))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| %)))
                   "failed")))
        (SPROG
         ((|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|)))))
          (|t| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|)))))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 612))))
                (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT % 627)))
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;%LL%;241|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G695 NIL) (#2=#:G693 (%)) (#3=#:G691 (%))
          (#4=#:G692 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 612))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;kereval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 65))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;subst;%LL%;242|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G701 NIL) (#2=#:G699 (%)) (#3=#:G697 (%))
          (#4=#:G698 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 612))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;subeval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 65))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;retractIfCan;%U;243| ((|x| (%)) (% (|Union| R "failed")))
        (COND ((SPADCALL |x| (QREFELT % 54)) (CONS 0 (|spadConstant| % 95)))
              ('T (|EXPR;retNotUnitIfCan| |x| %)))) 

(SDEFUN |EXPR;-;2%;244| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;smaller?;2%B;245| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 594))) 

(SDEFUN |EXPR;=;2%B;246| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(MAKEPROP '|EXPR;coerce;K%;247| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K%;247| ((|k| (|Kernel| %)) (% (%))) |k|) 

(MAKEPROP '|EXPR;kernels;%L;248| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;%L;248| ((|x| (%)) (% (|List| (|Kernel| %)))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R%;249| ((|x| (R)) (% (%))) (SPADCALL |x| (QREFELT % 614))) 

(SDEFUN |EXPR;retract;%R;250| ((|x| (%)) (% (R))) (|EXPR;retNotUnit| |x| %)) 

(SDEFUN |EXPR;retractIfCan;%U;251| ((|x| (%)) (% (|Union| R "failed")))
        (|EXPR;retNotUnitIfCan| |x| %)) 

(SDEFUN |EXPR;coerce;%Of;252| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 616))) 

(SDEFUN |EXPR;eval;%LL%;253|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;%LL%;253!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 622)))) 

(SDEFUN |EXPR;eval;%LL%;253!1| ((|x1| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;%LL%;253!0| (VECTOR % |lv| |lk|)) |x1|
                    (QREFELT % 619))))))) 

(SDEFUN |EXPR;eval;%LL%;253!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT % 618)))))) 

(SDEFUN |EXPR;subst;%LL%;254|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;%LL%;254!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 622))))) 

(SDEFUN |EXPR;subst;%LL%;254!0| ((|x1| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G745 NIL) (|a| NIL) (#2=#:G746 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x1| (QREFELT % 31))
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #2# (SPADCALL |x1| (QREFELT % 87)))
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 623))
                                             #1#))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#))))
                              (QREFELT % 624)))))))) 

(SDEFUN |EXPR;convert;%If;255| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G792 NIL) (#2=#:G791 NIL)
    (#3=#:G790 NIL) (#4=#:G789 NIL) (#5=#:G788 NIL) (#6=#:G787 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Expression| DV$1))
    (LETT % (GETREFV 663))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                        (AND #1#
                                             (|HasCategory| |#1|
                                                            '(|IntegralDomain|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#)
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
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #2#)
                                        (LETT #3#
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
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|)))
                                         #3#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR #4#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|RetractableTo|
                                                              (|Integer|)))
                                             (|HasCategory| |#1|
                                                            '(|IntegralDomain|))))
                                        (LETT #5#
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
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #5#)
                                        (OR
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
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #5#
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #2#)
                                         #5#
                                         (|HasCategory| |#1| '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #2#)
                                         #5#)
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)))))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|CharacteristicZero|))
         (|augmentPredVector| % 34359738368))
    (AND
     (OR #4#
         (AND (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
              (|HasCategory| |#1| '(|IntegralDomain|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 68719476736))
    (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 137438953472))
    (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 274877906944))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 549755813888))
    (AND (|HasCategory| |#1| '(|IntegralDomain|)) #6#
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 1099511627776))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 '|%symbol|)
    (QSETREFV % 8 '|%alg|)
    (COND ((|testBitVector| |pv$| 1))
          ('T
           (QSETREFV % 37
                     (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) %))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV % 45
                    (|Fraction|
                     (|SparseMultivariatePolynomial| |#1| (|Kernel| %))))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;0;%;6|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;1;%;7|) % 49)))
          (QSETREFV % 52 (CONS (|dispatchFunction| |EXPR;one?;%B;8|) %))
          (QSETREFV % 54 (CONS (|dispatchFunction| |EXPR;zero?;%B;9|) %))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;10|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;11|) %))
          (QSETREFV % 61 (CONS (|dispatchFunction| |EXPR;coerce;I%;12|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;13|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;14|) %))
          (QSETREFV % 67 (CONS (|dispatchFunction| |EXPR;-;3%;15|) %))
          (QSETREFV % 69 (CONS (|dispatchFunction| |EXPR;/;3%;16|) %))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (QSETREFV % 77 (CONS (|dispatchFunction| |EXPR;=;2%B;17|) %)))
           ('T (QSETREFV % 77 (CONS (|dispatchFunction| |EXPR;=;2%B;18|) %))))
          (QSETREFV % 81 (CONS (|dispatchFunction| |EXPR;number?;%B;19|) %))
          (QSETREFV % 98 (CONS (|dispatchFunction| |EXPR;^;%Nni%;21|) %))
          (QSETREFV % 99 (CONS (|dispatchFunction| |EXPR;^;%I%;22|) %))
          (QSETREFV % 101 (CONS (|dispatchFunction| |EXPR;^;%Pi%;23|) %))
          (QSETREFV % 103 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;24|) %))
          (QSETREFV % 73 (CONS (|dispatchFunction| |EXPR;numer;%Smp;25|) %))
          (QSETREFV % 71 (CONS (|dispatchFunction| |EXPR;denom;%Smp;26|) %))
          (QSETREFV % 106
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))))
          (QSETREFV % 76 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;27|) %))
          (QSETREFV % 109 (CONS (|dispatchFunction| |EXPR;coerce;P%;28|) %))
          (QSETREFV % 113 (CONS (|dispatchFunction| |EXPR;coerce;F%;29|) %))
          (QSETREFV % 114 (CONS (|dispatchFunction| |EXPR;reduce;2%;30|) %))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV % 128
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;36|) %))
          (QSETREFV % 129
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;37|)
                     %))
          (QSETREFV % 140 (CONS (|dispatchFunction| |EXPR;/;2Smp%;39|) %))
          (QSETREFV % 149
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;40|) %))
          (QSETREFV % 157
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;41|) %))
          (QSETREFV % 162 (CONS (|dispatchFunction| |EXPR;rootOf;SupS%;43|) %))
          (QSETREFV % 164
                    (CONS (|dispatchFunction| |EXPR;rootSum;%SupS%;44|) %))
          (QSETREFV % 167 (CONS (|dispatchFunction| |EXPR;pi;%;45|) %))
          (QSETREFV % 169 (CONS (|dispatchFunction| |EXPR;exp;2%;46|) %))
          (QSETREFV % 171 (CONS (|dispatchFunction| |EXPR;log;2%;47|) %))
          (QSETREFV % 173 (CONS (|dispatchFunction| |EXPR;sin;2%;48|) %))
          (QSETREFV % 175 (CONS (|dispatchFunction| |EXPR;cos;2%;49|) %))
          (QSETREFV % 177 (CONS (|dispatchFunction| |EXPR;tan;2%;50|) %))
          (QSETREFV % 179 (CONS (|dispatchFunction| |EXPR;cot;2%;51|) %))
          (QSETREFV % 181 (CONS (|dispatchFunction| |EXPR;sec;2%;52|) %))
          (QSETREFV % 183 (CONS (|dispatchFunction| |EXPR;csc;2%;53|) %))
          (QSETREFV % 185 (CONS (|dispatchFunction| |EXPR;asin;2%;54|) %))
          (QSETREFV % 187 (CONS (|dispatchFunction| |EXPR;acos;2%;55|) %))
          (QSETREFV % 189 (CONS (|dispatchFunction| |EXPR;atan;2%;56|) %))
          (QSETREFV % 191 (CONS (|dispatchFunction| |EXPR;acot;2%;57|) %))
          (QSETREFV % 193 (CONS (|dispatchFunction| |EXPR;asec;2%;58|) %))
          (QSETREFV % 195 (CONS (|dispatchFunction| |EXPR;acsc;2%;59|) %))
          (QSETREFV % 197 (CONS (|dispatchFunction| |EXPR;sinh;2%;60|) %))
          (QSETREFV % 199 (CONS (|dispatchFunction| |EXPR;cosh;2%;61|) %))
          (QSETREFV % 201 (CONS (|dispatchFunction| |EXPR;tanh;2%;62|) %))
          (QSETREFV % 203 (CONS (|dispatchFunction| |EXPR;coth;2%;63|) %))
          (QSETREFV % 205 (CONS (|dispatchFunction| |EXPR;sech;2%;64|) %))
          (QSETREFV % 207 (CONS (|dispatchFunction| |EXPR;csch;2%;65|) %))
          (QSETREFV % 209 (CONS (|dispatchFunction| |EXPR;asinh;2%;66|) %))
          (QSETREFV % 211 (CONS (|dispatchFunction| |EXPR;acosh;2%;67|) %))
          (QSETREFV % 213 (CONS (|dispatchFunction| |EXPR;atanh;2%;68|) %))
          (QSETREFV % 215 (CONS (|dispatchFunction| |EXPR;acoth;2%;69|) %))
          (QSETREFV % 217 (CONS (|dispatchFunction| |EXPR;asech;2%;70|) %))
          (QSETREFV % 219 (CONS (|dispatchFunction| |EXPR;acsch;2%;71|) %))
          (QSETREFV % 222 (CONS (|dispatchFunction| |EXPR;abs;2%;72|) %))
          (QSETREFV % 224 (CONS (|dispatchFunction| |EXPR;sign;2%;73|) %))
          (QSETREFV % 226 (CONS (|dispatchFunction| |EXPR;unitStep;2%;74|) %))
          (QSETREFV % 228 (CONS (|dispatchFunction| |EXPR;ceiling;2%;75|) %))
          (QSETREFV % 230 (CONS (|dispatchFunction| |EXPR;floor;2%;76|) %))
          (QSETREFV % 232
                    (CONS (|dispatchFunction| |EXPR;fractionPart;2%;77|) %))
          (QSETREFV % 234
                    (CONS (|dispatchFunction| |EXPR;diracDelta;2%;78|) %))
          (QSETREFV % 236 (CONS (|dispatchFunction| |EXPR;conjugate;2%;79|) %))
          (QSETREFV % 238 (CONS (|dispatchFunction| |EXPR;Gamma;2%;80|) %))
          (QSETREFV % 240 (CONS (|dispatchFunction| |EXPR;Gamma;3%;81|) %))
          (QSETREFV % 242 (CONS (|dispatchFunction| |EXPR;Beta;3%;82|) %))
          (QSETREFV % 244 (CONS (|dispatchFunction| |EXPR;Beta;4%;83|) %))
          (QSETREFV % 246 (CONS (|dispatchFunction| |EXPR;digamma;2%;84|) %))
          (QSETREFV % 248 (CONS (|dispatchFunction| |EXPR;polygamma;3%;85|) %))
          (QSETREFV % 250 (CONS (|dispatchFunction| |EXPR;besselJ;3%;86|) %))
          (QSETREFV % 252 (CONS (|dispatchFunction| |EXPR;besselY;3%;87|) %))
          (QSETREFV % 254 (CONS (|dispatchFunction| |EXPR;besselI;3%;88|) %))
          (QSETREFV % 256 (CONS (|dispatchFunction| |EXPR;besselK;3%;89|) %))
          (QSETREFV % 258 (CONS (|dispatchFunction| |EXPR;airyAi;2%;90|) %))
          (QSETREFV % 260
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2%;91|) %))
          (QSETREFV % 262 (CONS (|dispatchFunction| |EXPR;airyBi;2%;92|) %))
          (QSETREFV % 264
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2%;93|) %))
          (QSETREFV % 266 (CONS (|dispatchFunction| |EXPR;lambertW;2%;94|) %))
          (QSETREFV % 268 (CONS (|dispatchFunction| |EXPR;polylog;3%;95|) %))
          (QSETREFV % 270
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4%;96|) %))
          (QSETREFV % 272
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4%;97|)
                          %))
          (QSETREFV % 274
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4%;98|)
                          %))
          (QSETREFV % 276
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4%;99|) %))
          (QSETREFV % 278
                    (CONS
                     (|dispatchFunction| |EXPR;weierstrassPInverse;4%;100|) %))
          (QSETREFV % 280
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4%;101|) %))
          (QSETREFV % 282
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4%;102|) %))
          (QSETREFV % 284 (CONS (|dispatchFunction| |EXPR;angerJ;3%;103|) %))
          (QSETREFV % 286 (CONS (|dispatchFunction| |EXPR;weberE;3%;104|) %))
          (QSETREFV % 288 (CONS (|dispatchFunction| |EXPR;struveH;3%;105|) %))
          (QSETREFV % 290 (CONS (|dispatchFunction| |EXPR;struveL;3%;106|) %))
          (QSETREFV % 292 (CONS (|dispatchFunction| |EXPR;hankelH1;3%;107|) %))
          (QSETREFV % 294 (CONS (|dispatchFunction| |EXPR;hankelH2;3%;108|) %))
          (QSETREFV % 296 (CONS (|dispatchFunction| |EXPR;lommelS1;4%;109|) %))
          (QSETREFV % 298 (CONS (|dispatchFunction| |EXPR;lommelS2;4%;110|) %))
          (QSETREFV % 300 (CONS (|dispatchFunction| |EXPR;kummerM;4%;111|) %))
          (QSETREFV % 302 (CONS (|dispatchFunction| |EXPR;kummerU;4%;112|) %))
          (QSETREFV % 304
                    (CONS (|dispatchFunction| |EXPR;legendreP;4%;113|) %))
          (QSETREFV % 306
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4%;114|) %))
          (QSETREFV % 308
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3%;115|) %))
          (QSETREFV % 310
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3%;116|) %))
          (QSETREFV % 312
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3%;117|) %))
          (QSETREFV % 314
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3%;118|) %))
          (QSETREFV % 316
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2%;119|) %))
          (QSETREFV % 318
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2%;120|) %))
          (QSETREFV % 320
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3%;121|) %))
          (QSETREFV % 322
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3%;122|) %))
          (QSETREFV % 324
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4%;123|) %))
          (QSETREFV % 326 (CONS (|dispatchFunction| |EXPR;jacobiSn;3%;124|) %))
          (QSETREFV % 328 (CONS (|dispatchFunction| |EXPR;jacobiCn;3%;125|) %))
          (QSETREFV % 330 (CONS (|dispatchFunction| |EXPR;jacobiDn;3%;126|) %))
          (QSETREFV % 332
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3%;127|) %))
          (QSETREFV % 334
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3%;128|) %))
          (QSETREFV % 336 (CONS (|dispatchFunction| |EXPR;lerchPhi;4%;129|) %))
          (QSETREFV % 338
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2%;130|) %))
          (QSETREFV % 340
                    (CONS (|dispatchFunction| |EXPR;charlierC;4%;131|) %))
          (QSETREFV % 342 (CONS (|dispatchFunction| |EXPR;hahn_p;7%;132|) %))
          (QSETREFV % 344 (CONS (|dispatchFunction| |EXPR;hahnQ;6%;133|) %))
          (QSETREFV % 346 (CONS (|dispatchFunction| |EXPR;hahnR;6%;134|) %))
          (QSETREFV % 348 (CONS (|dispatchFunction| |EXPR;hahnS;6%;135|) %))
          (QSETREFV % 350 (CONS (|dispatchFunction| |EXPR;hermiteH;3%;136|) %))
          (QSETREFV % 352
                    (CONS (|dispatchFunction| |EXPR;krawtchoukK;5%;137|) %))
          (QSETREFV % 354 (CONS (|dispatchFunction| |EXPR;jacobiP;5%;138|) %))
          (QSETREFV % 356
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4%;139|) %))
          (QSETREFV % 358 (CONS (|dispatchFunction| |EXPR;meixnerM;5%;140|) %))
          (QSETREFV % 360 (CONS (|dispatchFunction| |EXPR;meixnerP;5%;141|) %))
          (QSETREFV % 362 (CONS (|dispatchFunction| |EXPR;racahR;7%;142|) %))
          (QSETREFV % 364 (CONS (|dispatchFunction| |EXPR;wilsonW;7%;143|) %))
          (COND
           ((|testBitVector| |pv$| 38)
            (PROGN
             (QSETREFV % 367
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2%;144|)
                        (|getDomainView| % '(|RetractableTo| (|Integer|)))))
             (QSETREFV % 369
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2%;145|)
                             (|getDomainView| %
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV % 92 (CONS (|dispatchFunction| |EXPR;^;3%;146|) %))
          (QSETREFV % 373
                    (CONS (|dispatchFunction| |EXPR;factorial;2%;147|) %))
          (QSETREFV % 375 (CONS (|dispatchFunction| |EXPR;binomial;3%;148|) %))
          (QSETREFV % 377
                    (CONS (|dispatchFunction| |EXPR;permutation;3%;149|) %))
          (QSETREFV % 379
                    (CONS (|dispatchFunction| |EXPR;factorials;2%;150|) %))
          (QSETREFV % 381
                    (CONS (|dispatchFunction| |EXPR;factorials;%S%;151|) %))
          (QSETREFV % 383
                    (CONS (|dispatchFunction| |EXPR;summation;%S%;152|) %))
          (QSETREFV % 387
                    (CONS (|dispatchFunction| |EXPR;summation;%Sb%;153|) %))
          (QSETREFV % 389 (CONS (|dispatchFunction| |EXPR;product;%S%;154|) %))
          (QSETREFV % 391
                    (CONS (|dispatchFunction| |EXPR;product;%Sb%;155|) %))
          (QSETREFV % 394 (CONS (|dispatchFunction| |EXPR;erf;2%;156|) %))
          (QSETREFV % 396 (CONS (|dispatchFunction| |EXPR;erfi;2%;157|) %))
          (QSETREFV % 398 (CONS (|dispatchFunction| |EXPR;Ei;2%;158|) %))
          (QSETREFV % 400 (CONS (|dispatchFunction| |EXPR;Si;2%;159|) %))
          (QSETREFV % 402 (CONS (|dispatchFunction| |EXPR;Ci;2%;160|) %))
          (QSETREFV % 404 (CONS (|dispatchFunction| |EXPR;Shi;2%;161|) %))
          (QSETREFV % 406 (CONS (|dispatchFunction| |EXPR;Chi;2%;162|) %))
          (QSETREFV % 408 (CONS (|dispatchFunction| |EXPR;li;2%;163|) %))
          (QSETREFV % 410 (CONS (|dispatchFunction| |EXPR;dilog;2%;164|) %))
          (QSETREFV % 412 (CONS (|dispatchFunction| |EXPR;fresnelS;2%;165|) %))
          (QSETREFV % 414 (CONS (|dispatchFunction| |EXPR;fresnelC;2%;166|) %))
          (QSETREFV % 416
                    (CONS (|dispatchFunction| |EXPR;integral;%S%;167|) %))
          (QSETREFV % 418
                    (CONS (|dispatchFunction| |EXPR;integral;%Sb%;168|) %))
          (QSETREFV % 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;169|) %))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV % 468
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV % 469 (|ModularAlgebraicGcdTools3|))
                (QSETREFV % 470
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 468) (QREFELT % 469)))
                (QSETREFV % 479 (|ModularEvaluation2|))
                (QSETREFV % 480 (|ModularAlgebraicGcdTools4|))
                (QSETREFV % 481
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 468) (QREFELT % 479) (QREFELT % 480)))
                (QSETREFV % 506
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;188|)
                           %))))
              ('T
               (QSETREFV % 506
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;189|)
                          %))))
             (COND
              ((|testBitVector| |pv$| 34)
               (QSETREFV % 513
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;190|)
                          %)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV % 518
                      (CONS (|dispatchFunction| |EXPR;coerce;An%;191|) %))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV % 521 (CONS (|dispatchFunction| |EXPR;^;%F%;192|) %))
             (QSETREFV % 133
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;193|) %))
             (QSETREFV % 524
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2%;194|)
                        %))
             (QSETREFV % 526
                       (CONS (|dispatchFunction| |EXPR;retract;%F;195|) %))
             (QSETREFV % 80
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;196|)
                             %))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV % 518
                               (CONS (|dispatchFunction| |EXPR;coerce;An%;199|)
                                     %))
                     (QSETREFV % 536
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;%U;200|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 10)
            (PROGN
             (QSETREFV % 562
                       (CONS (|dispatchFunction| |EXPR;convert;%If;205|) %))
             (QSETREFV % 565
                       (CONS (|dispatchFunction| |EXPR;eval;%Bo%S%;206|) %))
             (QSETREFV % 564
                       (CONS (|dispatchFunction| |EXPR;eval;%LLS%;207|) %)))))
          (COND
           ((|testBitVector| |pv$| 14)
            (QSETREFV % 587
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;208|)
                            %))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV % 593
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;209|)
                            %))))))
        ('T
         (PROGN
          (SETELT % 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;0;%;210|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;1;%;211|) % 49)))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;212|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;213|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;214|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;215|) %))
          (QSETREFV % 77 (CONS (|dispatchFunction| |EXPR;=;2%B;216|) %))
          (QSETREFV % 103
                    (CONS (|dispatchFunction| |EXPR;smaller?;2%B;217|) %))
          (QSETREFV % 73 (CONS (|dispatchFunction| |EXPR;numer;%Smp;218|) %))
          (QSETREFV % 76 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;219|) %))
          (QSETREFV % 109 (CONS (|dispatchFunction| |EXPR;coerce;P%;220|) %))
          (QSETREFV % 149
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;221|) %))
          (QSETREFV % 157
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;222|) %))
          (COND
           ((|testBitVector| |pv$| 10)
            (QSETREFV % 562
                      (CONS (|dispatchFunction| |EXPR;convert;%If;223|) %))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 587
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;225|)
                        %)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV % 593
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;227|)
                        %))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT % 45 (|FreeModule| (|Integer|) (|Kernel| %)))
       (QSETREFV % 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;0;%;228|) % 47)))
       (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;229|) %))
       (QSETREFV % 77 (CONS (|dispatchFunction| |EXPR;=;2%B;230|) %))
       (QSETREFV % 103 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;231|) %))
       (QSETREFV % 137 (CONS (|dispatchFunction| |EXPR;coerce;K%;232|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |EXPR;kernels;%L;233|) %))
       (QSETREFV % 537 (CONS (|dispatchFunction| |EXPR;coerce;R%;234|) %))
       (QSETREFV % 453 (CONS (|dispatchFunction| |EXPR;retract;%R;235|) %))
       (QSETREFV % 617 (CONS (|dispatchFunction| |EXPR;coerce;%Of;236|) %))
       (QSETREFV % 626 (CONS (|dispatchFunction| |EXPR;isPlus;%U;239|) %))
       (QSETREFV % 630 (CONS (|dispatchFunction| |EXPR;isMult;%U;240|) %))
       (QSETREFV % 618 (CONS (|dispatchFunction| |EXPR;eval;%LL%;241|) %))
       (QSETREFV % 623 (CONS (|dispatchFunction| |EXPR;subst;%LL%;242|) %))
       (QSETREFV % 631
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;243|) %))
       (COND
        ((|HasCategory| |#1| '(|AbelianGroup|))
         (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;244|) %))))))
     ('T
      (PROGN
       (SETELT % 45 (|Kernel| %))
       (QSETREFV % 103 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;245|) %))
       (QSETREFV % 77 (CONS (|dispatchFunction| |EXPR;=;2%B;246|) %))
       (QSETREFV % 137 (CONS (|dispatchFunction| |EXPR;coerce;K%;247|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |EXPR;kernels;%L;248|) %))
       (QSETREFV % 537 (CONS (|dispatchFunction| |EXPR;coerce;R%;249|) %))
       (QSETREFV % 453 (CONS (|dispatchFunction| |EXPR;retract;%R;250|) %))
       (QSETREFV % 631
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;251|) %))
       (QSETREFV % 617 (CONS (|dispatchFunction| |EXPR;coerce;%Of;252|) %))
       (QSETREFV % 618 (CONS (|dispatchFunction| |EXPR;eval;%LL%;253|) %))
       (QSETREFV % 623 (CONS (|dispatchFunction| |EXPR;subst;%LL%;254|) %))
       (COND
        ((|testBitVector| |pv$| 10)
         (QSETREFV % 562
                   (CONS (|dispatchFunction| |EXPR;convert;%If;255|) %)))))))
    %))) 

(DEFUN |Expression| (#1=#:G793)
  (SPROG NIL
         (PROG (#2=#:G794)
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

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| %)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace2&| $$ 6 15) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace2&| $$ 15) (25 . |belong?|) (30 . |operator|)
              (35 . |nullary?|) (|Symbol|) (40 . |has?|) (46 . |name|)
              (51 . |kernel|) (56 . |operator|) (|Union| 35 '"failed")
              (61 . |arity|) (66 . |operator|) (|NonNegativeInteger|)
              (71 . |operator|) (77 . |operator|) (|List| 27)
              (|SparseMultivariatePolynomial| 6 27) (82 . |variables|)
              (|SparseMultivariatePolynomial| 6 15) (|List| 15)
              (|SparsePolynomialCoercionHelpers| 6 27 15)
              (87 . |remap_variables|) '|Rep| (94 . |0|) (98 . |0|) (102 . |1|)
              (106 . |1|) (110 . |1|) (114 . =) (120 . |one?|) (125 . |zero?|)
              (130 . |zero?|) (135 . -) (140 . -) (|Integer|) (145 . *)
              (151 . *) (157 . |coerce|) (162 . |coerce|) (167 . *) (173 . *)
              (179 . +) (185 . +) (191 . -) (197 . -) (203 . /) (209 . /)
              (|SparseMultivariatePolynomial| 6 12) (215 . |denom|) (220 . =)
              (226 . |numer|) (231 . *) (237 . -) (243 . |coerce|) (248 . =)
              (254 . |ground?|) (|Union| 519 '#1#) (259 . |retractIfCan|)
              (264 . |number?|) (|List| 12) (269 . |kernels|) (274 . |is?|)
              (280 . |first|) (|List| $$) (285 . |argument|) (290 . |#|)
              (295 . |elt|) (301 . ^) (307 . |algtower|) (312 . ^)
              (318 . |first|) (323 . |second|) (328 . |0|) (332 . |numerator|)
              (337 . |denominator|) (342 . ^) (348 . ^) (|PositiveInteger|)
              (354 . ^) (360 . |smaller?|) (366 . |smaller?|) (372 . |numer|)
              (377 . |denom|) 'EREP (382 . |1|) (|Polynomial| 6)
              (386 . |coerce|) (|Fraction| 108) (391 . |numer|) (396 . |denom|)
              (401 . |coerce|) (406 . |reduce|) (|Mapping| 9 15)
              (411 . |select!|) (|AlgebraicManipulations| 6 $$)
              (417 . |ratDenom|) (423 . |is?|) (429 . ~=)
              (|SparseUnivariatePolynomial| %) (435 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (441 . |leadingCoefficient|)
              (446 . |reductum|) (451 . |monomial|) (458 . /)
              (464 . |getSimplifyDenomsFlag|) (468 . |setSimplifyDenomsFlag|)
              (473 . |elt|) (|SingletonAsOrderedSet|) (479 . |create|)
              (483 . |minPoly|) (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 514 15 6 41 $$)
              (488 . |univariate|) (495 . |coerce|) (500 . |eval|)
              (507 . |retract|) (512 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (518 . |map|) (|Matrix| 41) (|Matrix| %) (524 . |reducedSystem|)
              (|Matrix| 6) (529 . |reducedSystem|) (534 . |reducedSystem|)
              (|Vector| $$) (539 . |map|)
              (|Record| (|:| |mat| 144) (|:| |vec| (|Vector| 41))) (|Vector| %)
              (545 . |reducedSystem|)
              (|Record| (|:| |mat| 147) (|:| |vec| (|Vector| 6)))
              (551 . |reducedSystem|) (557 . |reducedSystem|) (563 . |member?|)
              (569 . |concat|) (|AlgebraicFunction| 6 $$) (575 . |rootOf|)
              (581 . |rootOf|) (587 . |rootSum|) (594 . |rootSum|)
              (|ElementaryFunction| 6 $$) (601 . |pi|) (605 . |pi|)
              (609 . |exp|) (614 . |exp|) (619 . |log|) (624 . |log|)
              (629 . |sin|) (634 . |sin|) (639 . |cos|) (644 . |cos|)
              (649 . |tan|) (654 . |tan|) (659 . |cot|) (664 . |cot|)
              (669 . |sec|) (674 . |sec|) (679 . |csc|) (684 . |csc|)
              (689 . |asin|) (694 . |asin|) (699 . |acos|) (704 . |acos|)
              (709 . |atan|) (714 . |atan|) (719 . |acot|) (724 . |acot|)
              (729 . |asec|) (734 . |asec|) (739 . |acsc|) (744 . |acsc|)
              (749 . |sinh|) (754 . |sinh|) (759 . |cosh|) (764 . |cosh|)
              (769 . |tanh|) (774 . |tanh|) (779 . |coth|) (784 . |coth|)
              (789 . |sech|) (794 . |sech|) (799 . |csch|) (804 . |csch|)
              (809 . |asinh|) (814 . |asinh|) (819 . |acosh|) (824 . |acosh|)
              (829 . |atanh|) (834 . |atanh|) (839 . |acoth|) (844 . |acoth|)
              (849 . |asech|) (854 . |asech|) (859 . |acsch|) (864 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (869 . |abs|) (874 . |abs|)
              (879 . |sign|) (884 . |sign|) (889 . |unitStep|)
              (894 . |unitStep|) (899 . |ceiling|) (904 . |ceiling|)
              (909 . |floor|) (914 . |floor|) (919 . |fractionPart|)
              (924 . |fractionPart|) (929 . |diracDelta|) (934 . |diracDelta|)
              (939 . |conjugate|) (944 . |conjugate|) (949 . |Gamma|)
              (954 . |Gamma|) (959 . |Gamma|) (965 . |Gamma|) (971 . |Beta|)
              (977 . |Beta|) (983 . |Beta|) (990 . |Beta|) (997 . |digamma|)
              (1002 . |digamma|) (1007 . |polygamma|) (1013 . |polygamma|)
              (1019 . |besselJ|) (1025 . |besselJ|) (1031 . |besselY|)
              (1037 . |besselY|) (1043 . |besselI|) (1049 . |besselI|)
              (1055 . |besselK|) (1061 . |besselK|) (1067 . |airyAi|)
              (1072 . |airyAi|) (1077 . |airyAiPrime|) (1082 . |airyAiPrime|)
              (1087 . |airyBi|) (1092 . |airyBi|) (1097 . |airyBiPrime|)
              (1102 . |airyBiPrime|) (1107 . |lambertW|) (1112 . |lambertW|)
              (1117 . |polylog|) (1123 . |polylog|) (1129 . |weierstrassP|)
              (1136 . |weierstrassP|) (1143 . |weierstrassPPrime|)
              (1150 . |weierstrassPPrime|) (1157 . |weierstrassSigma|)
              (1164 . |weierstrassSigma|) (1171 . |weierstrassZeta|)
              (1178 . |weierstrassZeta|) (1185 . |weierstrassPInverse|)
              (1192 . |weierstrassPInverse|) (1199 . |whittakerM|)
              (1206 . |whittakerM|) (1213 . |whittakerW|) (1220 . |whittakerW|)
              (1227 . |angerJ|) (1233 . |angerJ|) (1239 . |weberE|)
              (1245 . |weberE|) (1251 . |struveH|) (1257 . |struveH|)
              (1263 . |struveL|) (1269 . |struveL|) (1275 . |hankelH1|)
              (1281 . |hankelH1|) (1287 . |hankelH2|) (1293 . |hankelH2|)
              (1299 . |lommelS1|) (1306 . |lommelS1|) (1313 . |lommelS2|)
              (1320 . |lommelS2|) (1327 . |kummerM|) (1334 . |kummerM|)
              (1341 . |kummerU|) (1348 . |kummerU|) (1355 . |legendreP|)
              (1362 . |legendreP|) (1369 . |legendreQ|) (1376 . |legendreQ|)
              (1383 . |kelvinBei|) (1389 . |kelvinBei|) (1395 . |kelvinBer|)
              (1401 . |kelvinBer|) (1407 . |kelvinKei|) (1413 . |kelvinKei|)
              (1419 . |kelvinKer|) (1425 . |kelvinKer|) (1431 . |ellipticK|)
              (1436 . |ellipticK|) (1441 . |ellipticE|) (1446 . |ellipticE|)
              (1451 . |ellipticE|) (1457 . |ellipticE|) (1463 . |ellipticF|)
              (1469 . |ellipticF|) (1475 . |ellipticPi|) (1482 . |ellipticPi|)
              (1489 . |jacobiSn|) (1495 . |jacobiSn|) (1501 . |jacobiCn|)
              (1507 . |jacobiCn|) (1513 . |jacobiDn|) (1519 . |jacobiDn|)
              (1525 . |jacobiZeta|) (1531 . |jacobiZeta|)
              (1537 . |jacobiTheta|) (1543 . |jacobiTheta|) (1549 . |lerchPhi|)
              (1556 . |lerchPhi|) (1563 . |riemannZeta|) (1568 . |riemannZeta|)
              (1573 . |charlierC|) (1580 . |charlierC|) (1587 . |hahn_p|)
              (1597 . |hahn_p|) (1607 . |hahnQ|) (1616 . |hahnQ|)
              (1625 . |hahnR|) (1634 . |hahnR|) (1643 . |hahnS|)
              (1652 . |hahnS|) (1661 . |hermiteH|) (1667 . |hermiteH|)
              (1673 . |krawtchoukK|) (1681 . |krawtchoukK|) (1689 . |jacobiP|)
              (1697 . |jacobiP|) (1705 . |laguerreL|) (1712 . |laguerreL|)
              (1719 . |meixnerM|) (1727 . |meixnerM|) (1735 . |meixnerP|)
              (1743 . |meixnerP|) (1751 . |racahR|) (1761 . |racahR|)
              (1771 . |wilsonW|) (1781 . |wilsonW|) (1791 . |hypergeometricF|)
              (|List| %) (1798 . |hypergeometricF|) (1805 . |meijerG|)
              (1814 . |meijerG|) (|CombinatorialFunction| 6 $$) (1823 . ^)
              (1829 . |factorial|) (1834 . |factorial|) (1839 . |binomial|)
              (1845 . |binomial|) (1851 . |permutation|) (1857 . |permutation|)
              (1863 . |factorials|) (1868 . |factorials|) (1873 . |factorials|)
              (1879 . |factorials|) (1885 . |summation|) (1891 . |summation|)
              (|SegmentBinding| $$) (1897 . |summation|) (|SegmentBinding| %)
              (1903 . |summation|) (1909 . |product|) (1915 . |product|)
              (1921 . |product|) (1927 . |product|)
              (|LiouvillianFunction| 6 $$) (1933 . |erf|) (1938 . |erf|)
              (1943 . |erfi|) (1948 . |erfi|) (1953 . |Ei|) (1958 . |Ei|)
              (1963 . |Si|) (1968 . |Si|) (1973 . |Ci|) (1978 . |Ci|)
              (1983 . |Shi|) (1988 . |Shi|) (1993 . |Chi|) (1998 . |Chi|)
              (2003 . |li|) (2008 . |li|) (2013 . |dilog|) (2018 . |dilog|)
              (2023 . |fresnelS|) (2028 . |fresnelS|) (2033 . |fresnelC|)
              (2038 . |fresnelC|) (2043 . |integral|) (2049 . |integral|)
              (2055 . |integral|) (2061 . |integral|) (2067 . |belong?|)
              (2072 . |operator|) (2077 . |belong?|) (2082 . |operator|)
              (2087 . |belong?|) (2092 . |operator|) (2097 . |belong?|)
              (2102 . |operator|) (2107 . |belong?|) (2112 . |operator|)
              (2117 . |degree|) (2122 . |degree|) (|Fraction| 41)
              (2128 . |coerce|) (|Fraction| 436)
              (|PolynomialCategoryQuotientFunctions| 514 15 6 41 431)
              (2133 . |univariate|) (|SparseUnivariatePolynomial| 431)
              (2139 . |numer|) (2144 . |rem|) (2150 . |coerce|) (2155 . |elt|)
              (2161 . |0|) (2165 . ~=) (2171 . |leadingCoefficient|)
              (2176 . |reductum|) (2181 . |concat|) (2187 . |removeDuplicates|)
              (2192 . |coefficients|) (|Mapping| 9 $$) (2197 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 134 41 123)
              (2203 . |map|) (2209 . |retract|) (2214 . |monomial|)
              (2220 . |coerce|) (2225 . -) (2231 . =) (|Polynomial| 57)
              (2237 . |1|) (2241 . |1|) (2245 . |monomial|) (2252 . |coerce|)
              (|Mapping| 458 15) (|Mapping| 458 57)
              (|PolynomialCategoryLifting| 514 15 57 41 458) (2257 . |map|)
              (2264 . |multivariate|) 'MD 'MOP1 'MGCD1 (2270 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 458
                                           41)
              (2275 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 123 $$ 134)
              (2282 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 458) (2288 . /)
              (2294 . |coerce|) (|SparseUnivariatePolynomial| 482)
              (2299 . |coerce|) (|Mapping| 482 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 134 482 485)
              (2304 . |map|) (2310 . =) (2316 . |1|) (2320 . |gcdPolynomial|)
              (2326 . |concat|) (2332 . |algtower|) (2337 . |kernels|)
              (2342 . |setUnion|) (2348 . |sort|) (2353 . |new|)
              (2357 . |cons|) (2363 . |setDifference|) (|List| 458)
              (2369 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 485)) (|List| 503)
              (2379 . |algebraicGcd|) (2389 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2395 . |gcdPolynomial|) (|Factored| 134)
              (|ExpressionFactorPolynomial| 6 $$) (2401 . |factorPolynomial|)
              (|Factored| 121) (2406 . |factorPolynomial|)
              (|IndexedExponents| 15) (2411 . |0|) (2415 . |monomial|)
              (|AlgebraicNumber|) (2421 . |coerce|) (|Fraction| 57) (2426 . ^)
              (2432 . ^) (2438 . |minPoly|) (2443 . |definingPolynomial|)
              (2448 . |definingPolynomial|) (2453 . |retract|)
              (2458 . |retract|) (2463 . |retractIfCan|) (2468 . |coerce|)
              (|Expression| 6) (|Mapping| 6 57) (|Expression| 57)
              (|FunctionSpaceFunctions2| 57 531 6 529) (2473 . |map|)
              (2479 . /) (|Union| 517 '"failed") (2485 . |retractIfCan|)
              (2490 . |coerce|) (2495 . |coerce|) (2500 . |is?|)
              (|Union| 27 '#1#) (2506 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 517) (2511 . |0|) (2515 . |0|)
              (2519 . ~=) (2525 . |degree|) (2530 . |monomial|) (2536 . +)
              (2542 . |rootOf|) (2548 . |operator|) (2553 . |elt|)
              (|Union| 15 '"failed") (2559 . |mainVariable|)
              (2564 . |leadingCoefficient|) (2569 . |0|) (2573 . |ground?|)
              (2578 . ^) (2584 . *) (2590 . +) (|InputForm|) (2596 . |convert|)
              (2601 . |convert|) (|List| 10) (2606 . |eval|) (2614 . |eval|)
              (2622 . |variables|) (2627 . |concat|)
              (2632 . |removeDuplicates|) (2637 . |scripted?|) (|Mapping| 9 27)
              (2642 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2648 . |compiledFunction|) (|Mapping| % %) (|List| 574)
              (2654 . |eval|) (2661 . |coerce|) (|Equation| $$) (2666 . =)
              (|List| 633) (2672 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2678 . |patternMatch|) (|PatternMatchResult| 57 %)
              (2685 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2692 . |patternMatch|) (|PatternMatchResult| (|Float|) %)
              (2699 . |patternMatch|) (2706 . |smaller?|)
              (2712 . |reducedSystem|) (2717 . |reducedSystem|)
              (|PatternMatchKernel| 57 $$) (2723 . |patternMatch|)
              (|PatternMatchResult| 57 45) (|Mapping| 599 15 583 599)
              (|PatternMatchPolynomialCategory| 57 514 15 6 45)
              (2730 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2738 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 605 15 589 605)
              (|PatternMatchPolynomialCategory| (|Float|) 514 15 6 45)
              (2745 . |patternMatch|) (2753 . |monomial|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 610)
              (2759 . |listOfTerms|) (2764 . |zero?|) (2769 . |constantKernel|)
              (|OutputForm|) (2774 . |coerce|) (2779 . |coerce|)
              (2784 . |eval|) (2791 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2797 . |match|) (2805 . |subst|)
              (2812 . |kernel|) (|Union| 366 '#2="failed") (2818 . |isPlus|)
              (2823 . |first|) (|Record| (|:| |coef| 57) (|:| |var| 12))
              (|Union| 628 '#2#) (2828 . |isMult|) (2833 . |retractIfCan|)
              (|String|) (|Equation| %) (|Mapping| % 366) (|List| 634)
              (|Union| 153 '#3="failed") (|Union| % '#3#) (|Union| 639 '#3#)
              (|List| 121) (|Record| (|:| |mat| 641) (|:| |vec| (|Vector| 57)))
              (|Matrix| 57) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 643 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 366) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Polynomial| %) (|Union| 110 '#1#) (|Fraction| 121)
              (|Fraction| 655) (|Fraction| 6) (|Polynomial| 654)
              (|Union| 57 '#1#) (|Union| 108 '#1#) (|List| 35)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 659 '#2#)
              (|Record| (|:| |val| %) (|:| |exponent| 57)) (|Union| 661 '#2#))
           '#(~= 2838 |zerosOf| 2844 |zeroOf| 2871 |zero?| 2898 |wilsonW| 2903
              |whittakerW| 2913 |whittakerM| 2920 |weierstrassZeta| 2927
              |weierstrassSigma| 2934 |weierstrassPPrime| 2941
              |weierstrassPInverse| 2948 |weierstrassP| 2955 |weberE| 2962
              |variables| 2968 |univariate| 2978 |unitStep| 2984 |unitNormal|
              2989 |unitCanonical| 2994 |unit?| 2999 |tower| 3004 |tanh| 3014
              |tan| 3019 |summation| 3024 |subtractIfCan| 3036 |subst| 3042
              |struveL| 3061 |struveH| 3067 |squareFreePolynomial| 3073
              |squareFreePart| 3078 |squareFree| 3083 |sqrt| 3088
              |solveLinearPolynomialEquation| 3093 |smaller?| 3099 |sizeLess?|
              3105 |sinh| 3111 |sin| 3116 |sign| 3121 |setSimplifyDenomsFlag|
              3126 |sech| 3131 |sec| 3136 |sample| 3141 |rootsOf| 3145
              |rootSum| 3172 |rootOf| 3179 |rightRecip| 3206 |rightPower| 3211
              |riemannZeta| 3223 |retractIfCan| 3228 |retract| 3268 |rem| 3308
              |reducedSystem| 3314 |reduce| 3336 |recip| 3341 |racahR| 3346
              |quo| 3356 |product| 3362 |principalIdeal| 3374 |prime?| 3379
              |polylog| 3384 |polygamma| 3390 |plenaryPower| 3396 |pi| 3402
              |permutation| 3406 |patternMatch| 3412 |paren| 3426 |opposite?|
              3431 |operators| 3437 |operator| 3442 |one?| 3447 |odd?| 3452
              |numerator| 3457 |numer| 3462 |number?| 3467 |nthRoot| 3472
              |multiEuclidean| 3478 |minPoly| 3484 |meixnerP| 3489 |meixnerM|
              3497 |meijerG| 3505 |map| 3514 |mainKernel| 3520 |lommelS2| 3525
              |lommelS1| 3532 |log| 3539 |li| 3544 |lerchPhi| 3549 |legendreQ|
              3556 |legendreP| 3563 |leftRecip| 3570 |leftPower| 3575 |lcmCoef|
              3587 |lcm| 3593 |latex| 3604 |lambertW| 3609 |laguerreL| 3614
              |kummerU| 3621 |kummerM| 3628 |krawtchoukK| 3635 |kernels| 3643
              |kernel| 3653 |kelvinKer| 3665 |kelvinKei| 3671 |kelvinBer| 3677
              |kelvinBei| 3683 |jacobiZeta| 3689 |jacobiTheta| 3695 |jacobiSn|
              3701 |jacobiP| 3707 |jacobiDn| 3715 |jacobiCn| 3721 |isTimes|
              3727 |isPower| 3732 |isPlus| 3737 |isMult| 3742 |isExpt| 3747
              |is?| 3764 |inv| 3776 |integral| 3781 |hypergeometricF| 3793
              |hermiteH| 3800 |height| 3806 |hankelH2| 3811 |hankelH1| 3817
              |hahn_p| 3823 |hahnS| 3833 |hahnR| 3842 |hahnQ| 3851 |ground?|
              3860 |ground| 3865 |getSimplifyDenomsFlag| 3870 |gcdPolynomial|
              3874 |gcd| 3880 |fresnelS| 3891 |fresnelC| 3896 |freeOf?| 3901
              |fractionPart| 3913 |floor| 3918 |factorials| 3923 |factorial|
              3934 |factorSquareFreePolynomial| 3939 |factorPolynomial| 3944
              |factor| 3949 |extendedEuclidean| 3954 |exquo| 3967
              |expressIdealMember| 3973 |exp| 3979 |even?| 3984 |eval| 3989
              |euclideanSize| 4133 |erfi| 4138 |erf| 4143 |elt| 4148
              |ellipticPi| 4244 |ellipticK| 4251 |ellipticF| 4256 |ellipticE|
              4262 |divide| 4273 |distribute| 4279 |diracDelta| 4290 |dilog|
              4295 |digamma| 4300 |differentiate| 4305 |denominator| 4331
              |denom| 4336 |definingPolynomial| 4341 |csch| 4346 |csc| 4351
              |coth| 4356 |cot| 4361 |cosh| 4366 |cos| 4371 |convert| 4376
              |conjugate| 4396 |conditionP| 4407 |commutator| 4412 |coerce|
              4418 |charthRoot| 4488 |charlierC| 4493 |characteristic| 4500
              |ceiling| 4504 |box| 4509 |binomial| 4514 |besselY| 4520
              |besselK| 4526 |besselJ| 4532 |besselI| 4538 |belong?| 4544
              |atanh| 4549 |atan| 4554 |associator| 4559 |associates?| 4566
              |asinh| 4572 |asin| 4577 |asech| 4582 |asec| 4587 |applyQuote|
              4592 |antiCommutator| 4628 |annihilate?| 4634 |angerJ| 4640
              |algtower| 4646 |airyBiPrime| 4656 |airyBi| 4661 |airyAiPrime|
              4666 |airyAi| 4671 |acsch| 4676 |acsc| 4681 |acoth| 4686 |acot|
              4691 |acosh| 4696 |acos| 4701 |abs| 4706 ^ 4711 |Si| 4741 |Shi|
              4746 |Gamma| 4751 |Ei| 4762 D 4767 |Ci| 4793 |Chi| 4798 |Beta|
              4803 = 4816 |1| 4822 |0| 4826 / 4830 - 4842 + 4853 * 4859)
           'NIL
           (CONS
            (|makeByteWordVec2| 35
                                '(1 0 1 0 1 1 35 1 1 1 1 1 1 1 6 2 4 1 1 21 21
                                  6 2 4 1 6 6 2 4 1 25 6 6 2 7 4 21 25 6 6 2 7
                                  4 4 16 8 18 6 16 0 21 18 17 29 0 0 31 1 18 30
                                  14 13 0 0 20 1 1 15 6 1 1 27 0 0 0 0 0 0 20 1
                                  1 1 1 1 1 1 1 1 19 15 12 11 10 9 6 5 3 1 1 1
                                  1 27 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| NIL
                |AlgebraicallyClosedField&| |FunctionSpace2&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |PartialDifferentialRing&| |Algebra&|
                |Algebra&| |EntireRing&| |Algebra&| NIL |Rng&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| |Module&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| |Group&| NIL NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |ExpressionSpace2&| |AbelianSemiGroup&| NIL |Magma&|
                |SetWithZero&| NIL NIL |FullyRetractableTo&| NIL
                |RetractableTo&| NIL |TranscendentalFunctionCategory&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| |RetractableTo&| |Evalable&| |RetractableTo&|
                NIL |RetractableTo&| |SetCategory&| NIL |RadicalCategory&| NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL |BasicType&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|FunctionSpace2| 6 15) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|)
                 (|PartialDifferentialRing| 27) (|Algebra| 6) (|Algebra| 519)
                 (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 519)
                 (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 519)
                 (|Module| $$) (|LinearlyExplicitOver| 57)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 6)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 519 519)
                 (|NonAssociativeRng|) (|RightModule| 57) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|RightModule| 519) (|LeftModule| 519) (|AbelianGroup|)
                 (|Group|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|FullyPatternMatchable| 6)
                 (|ExpressionSpace2| 15) (|AbelianSemiGroup|)
                 (|LiouvillianFunctionCategory|) (|Magma|) (|SetWithZero|)
                 (|PatternMatchable| 57) (|PatternMatchable| (|Float|))
                 (|FullyRetractableTo| 6) (|ComparableRepresentation|)
                 (|RetractableTo| 517) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 57)
                 (|RetractableTo| (|Polynomial| 6)) (|CommutativeStar|)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|RetractableTo| 519) (|RetractableTo| 15) (|Evalable| $$)
                 (|RetractableTo| 27) (|Patternable| 6) (|RetractableTo| 6)
                 (|SetCategory|) (|CoercibleFrom| 517) (|RadicalCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|)
                 (|unitsKnown|) (|CoercibleFrom| 57) (|ConvertibleTo| 583)
                 (|ConvertibleTo| 589) (|ConvertibleTo| 560) (|TwoSidedRecip|)
                 (|CoercibleFrom| (|Polynomial| 6)) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|)
                 (|CoercibleFrom| (|Fraction| (|Polynomial| 6)))
                 (|CoercibleFrom| 519) (|CoercibleTo| 615) (|CoercibleFrom| 15)
                 (|InnerEvalable| 15 $$) (|InnerEvalable| $$ $$)
                 (|CoercibleFrom| 27) (|Type|) (|CoercibleFrom| 6)
                 (|BasicType|))
              (|makeByteWordVec2| 662
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
                                    0 69 1 0 70 0 71 2 41 9 0 0 72 1 0 70 0 73
                                    2 41 0 0 0 74 2 41 0 0 0 75 1 0 0 70 76 2 0
                                    9 0 0 77 1 0 9 0 78 1 0 79 0 80 1 0 9 0 81
                                    1 0 82 0 83 2 0 9 0 27 84 1 42 15 0 85 1 15
                                    86 0 87 1 86 35 0 88 2 86 2 0 57 89 2 45 0
                                    0 57 90 1 0 82 0 91 2 0 0 0 0 92 1 86 2 0
                                    93 1 86 2 0 94 0 6 0 95 1 0 0 0 96 1 0 0 0
                                    97 2 0 0 0 35 98 2 0 0 0 57 99 2 0 0 0 100
                                    101 2 41 9 0 0 102 2 0 9 0 0 103 1 45 41 0
                                    104 1 45 41 0 105 0 41 0 107 1 0 0 108 109
                                    1 110 108 0 111 1 110 108 0 112 1 0 0 110
                                    113 1 0 0 0 114 2 42 0 115 0 116 2 117 2 2
                                    42 118 2 15 9 0 27 119 2 0 9 0 0 120 2 41
                                    121 0 15 122 1 123 41 0 124 1 123 0 0 125 3
                                    41 0 0 15 35 126 2 45 0 41 41 127 0 0 9 128
                                    1 0 9 9 129 2 42 15 0 57 130 0 131 0 132 1
                                    0 121 12 133 3 135 134 2 15 134 136 1 0 0
                                    12 137 3 134 0 0 131 2 138 1 134 2 0 139 2
                                    0 0 70 70 140 2 142 0 141 0 143 1 45 144
                                    145 146 1 41 147 145 148 1 0 147 145 149 2
                                    150 0 141 0 151 2 45 152 145 153 154 2 41
                                    155 145 153 156 2 0 155 145 153 157 2 42 9
                                    15 0 158 2 42 0 15 0 159 2 160 2 134 27 161
                                    2 0 0 121 27 162 3 160 2 2 134 27 163 3 0 0
                                    0 121 27 164 0 165 2 166 0 0 0 167 1 165 2
                                    2 168 1 0 0 0 169 1 165 2 2 170 1 0 0 0 171
                                    1 165 2 2 172 1 0 0 0 173 1 165 2 2 174 1 0
                                    0 0 175 1 165 2 2 176 1 0 0 0 177 1 165 2 2
                                    178 1 0 0 0 179 1 165 2 2 180 1 0 0 0 181 1
                                    165 2 2 182 1 0 0 0 183 1 165 2 2 184 1 0 0
                                    0 185 1 165 2 2 186 1 0 0 0 187 1 165 2 2
                                    188 1 0 0 0 189 1 165 2 2 190 1 0 0 0 191 1
                                    165 2 2 192 1 0 0 0 193 1 165 2 2 194 1 0 0
                                    0 195 1 165 2 2 196 1 0 0 0 197 1 165 2 2
                                    198 1 0 0 0 199 1 165 2 2 200 1 0 0 0 201 1
                                    165 2 2 202 1 0 0 0 203 1 165 2 2 204 1 0 0
                                    0 205 1 165 2 2 206 1 0 0 0 207 1 165 2 2
                                    208 1 0 0 0 209 1 165 2 2 210 1 0 0 0 211 1
                                    165 2 2 212 1 0 0 0 213 1 165 2 2 214 1 0 0
                                    0 215 1 165 2 2 216 1 0 0 0 217 1 165 2 2
                                    218 1 0 0 0 219 1 220 2 2 221 1 0 0 0 222 1
                                    220 2 2 223 1 0 0 0 224 1 220 2 2 225 1 0 0
                                    0 226 1 220 2 2 227 1 0 0 0 228 1 220 2 2
                                    229 1 0 0 0 230 1 220 2 2 231 1 0 0 0 232 1
                                    220 2 2 233 1 0 0 0 234 1 220 2 2 235 1 0 0
                                    0 236 1 220 2 2 237 1 0 0 0 238 2 220 2 2 2
                                    239 2 0 0 0 0 240 2 220 2 2 2 241 2 0 0 0 0
                                    242 3 220 2 2 2 2 243 3 0 0 0 0 0 244 1 220
                                    2 2 245 1 0 0 0 246 2 220 2 2 2 247 2 0 0 0
                                    0 248 2 220 2 2 2 249 2 0 0 0 0 250 2 220 2
                                    2 2 251 2 0 0 0 0 252 2 220 2 2 2 253 2 0 0
                                    0 0 254 2 220 2 2 2 255 2 0 0 0 0 256 1 220
                                    2 2 257 1 0 0 0 258 1 220 2 2 259 1 0 0 0
                                    260 1 220 2 2 261 1 0 0 0 262 1 220 2 2 263
                                    1 0 0 0 264 1 220 2 2 265 1 0 0 0 266 2 220
                                    2 2 2 267 2 0 0 0 0 268 3 220 2 2 2 2 269 3
                                    0 0 0 0 0 270 3 220 2 2 2 2 271 3 0 0 0 0 0
                                    272 3 220 2 2 2 2 273 3 0 0 0 0 0 274 3 220
                                    2 2 2 2 275 3 0 0 0 0 0 276 3 220 2 2 2 2
                                    277 3 0 0 0 0 0 278 3 220 2 2 2 2 279 3 0 0
                                    0 0 0 280 3 220 2 2 2 2 281 3 0 0 0 0 0 282
                                    2 220 2 2 2 283 2 0 0 0 0 284 2 220 2 2 2
                                    285 2 0 0 0 0 286 2 220 2 2 2 287 2 0 0 0 0
                                    288 2 220 2 2 2 289 2 0 0 0 0 290 2 220 2 2
                                    2 291 2 0 0 0 0 292 2 220 2 2 2 293 2 0 0 0
                                    0 294 3 220 2 2 2 2 295 3 0 0 0 0 0 296 3
                                    220 2 2 2 2 297 3 0 0 0 0 0 298 3 220 2 2 2
                                    2 299 3 0 0 0 0 0 300 3 220 2 2 2 2 301 3 0
                                    0 0 0 0 302 3 220 2 2 2 2 303 3 0 0 0 0 0
                                    304 3 220 2 2 2 2 305 3 0 0 0 0 0 306 2 220
                                    2 2 2 307 2 0 0 0 0 308 2 220 2 2 2 309 2 0
                                    0 0 0 310 2 220 2 2 2 311 2 0 0 0 0 312 2
                                    220 2 2 2 313 2 0 0 0 0 314 1 220 2 2 315 1
                                    0 0 0 316 1 220 2 2 317 1 0 0 0 318 2 220 2
                                    2 2 319 2 0 0 0 0 320 2 220 2 2 2 321 2 0 0
                                    0 0 322 3 220 2 2 2 2 323 3 0 0 0 0 0 324 2
                                    220 2 2 2 325 2 0 0 0 0 326 2 220 2 2 2 327
                                    2 0 0 0 0 328 2 220 2 2 2 329 2 0 0 0 0 330
                                    2 220 2 2 2 331 2 0 0 0 0 332 2 220 2 2 2
                                    333 2 0 0 0 0 334 3 220 2 2 2 2 335 3 0 0 0
                                    0 0 336 1 220 2 2 337 1 0 0 0 338 3 220 2 2
                                    2 2 339 3 0 0 0 0 0 340 6 220 2 2 2 2 2 2 2
                                    341 6 0 0 0 0 0 0 0 0 342 5 220 2 2 2 2 2 2
                                    343 5 0 0 0 0 0 0 0 344 5 220 2 2 2 2 2 2
                                    345 5 0 0 0 0 0 0 0 346 5 220 2 2 2 2 2 2
                                    347 5 0 0 0 0 0 0 0 348 2 220 2 2 2 349 2 0
                                    0 0 0 350 4 220 2 2 2 2 2 351 4 0 0 0 0 0 0
                                    352 4 220 2 2 2 2 2 353 4 0 0 0 0 0 0 354 3
                                    220 2 2 2 2 355 3 0 0 0 0 0 356 4 220 2 2 2
                                    2 2 357 4 0 0 0 0 0 0 358 4 220 2 2 2 2 2
                                    359 4 0 0 0 0 0 0 360 6 220 2 2 2 2 2 2 2
                                    361 6 0 0 0 0 0 0 0 0 362 6 220 2 2 2 2 2 2
                                    2 363 6 0 0 0 0 0 0 0 0 364 3 220 2 86 86 2
                                    365 3 0 0 366 366 0 367 5 220 2 86 86 86 86
                                    2 368 5 0 0 366 366 366 366 0 369 2 370 2 2
                                    2 371 1 370 2 2 372 1 0 0 0 373 2 370 2 2 2
                                    374 2 0 0 0 0 375 2 370 2 2 2 376 2 0 0 0 0
                                    377 1 370 2 2 378 1 0 0 0 379 2 370 2 2 27
                                    380 2 0 0 0 27 381 2 370 2 2 27 382 2 0 0 0
                                    27 383 2 370 2 2 384 385 2 0 0 0 386 387 2
                                    370 2 2 27 388 2 0 0 0 27 389 2 370 2 2 384
                                    390 2 0 0 0 386 391 1 392 2 2 393 1 0 0 0
                                    394 1 392 2 2 395 1 0 0 0 396 1 392 2 2 397
                                    1 0 0 0 398 1 392 2 2 399 1 0 0 0 400 1 392
                                    2 2 401 1 0 0 0 402 1 392 2 2 403 1 0 0 0
                                    404 1 392 2 2 405 1 0 0 0 406 1 392 2 2 407
                                    1 0 0 0 408 1 392 2 2 409 1 0 0 0 410 1 392
                                    2 2 411 1 0 0 0 412 1 392 2 2 413 1 0 0 0
                                    414 2 392 2 2 27 415 2 0 0 0 27 416 2 392 2
                                    2 384 417 2 0 0 0 386 418 1 160 9 10 419 1
                                    160 10 10 420 1 165 9 10 421 1 165 10 10
                                    422 1 370 9 10 423 1 370 10 10 424 1 392 9
                                    10 425 1 392 10 10 426 1 220 9 10 427 1 220
                                    10 10 428 1 134 35 0 429 2 41 35 0 15 430 1
                                    431 0 41 432 2 434 433 431 15 435 1 433 436
                                    0 437 2 134 0 0 0 438 1 41 0 15 439 2 436
                                    431 0 431 440 0 134 0 441 2 134 9 0 0 442 1
                                    134 2 0 443 1 134 0 0 444 2 42 0 0 0 445 1
                                    42 0 0 446 1 134 86 0 447 2 86 9 448 0 449
                                    2 451 123 450 134 452 1 0 6 0 453 2 123 0
                                    41 35 454 1 123 0 41 455 2 123 0 0 0 456 2
                                    15 9 0 0 457 0 458 0 459 0 35 0 460 3 458 0
                                    0 27 35 461 1 458 0 57 462 3 465 458 463
                                    464 41 466 2 41 0 121 15 467 1 41 0 57 471
                                    3 474 41 472 473 458 475 2 477 134 476 123
                                    478 2 482 0 458 458 483 1 482 0 458 484 1
                                    485 0 482 486 2 488 485 487 134 489 2 134 9
                                    0 0 490 0 134 0 491 2 45 121 121 121 492 2
                                    86 0 0 0 493 1 0 82 366 494 1 0 82 366 495
                                    2 42 0 0 0 496 1 42 0 0 497 0 27 0 498 2 42
                                    0 15 0 499 2 38 0 0 0 500 6 470 458 458 458
                                    501 38 27 38 502 6 481 458 503 503 504 38
                                    27 38 505 2 0 121 121 121 506 2 507 121 121
                                    121 508 1 510 509 134 511 1 0 512 121 513 0
                                    514 0 515 2 41 0 6 514 516 1 0 0 517 518 2
                                    160 2 2 519 520 2 0 0 0 519 521 1 160 134
                                    15 522 1 160 2 2 523 1 0 0 0 524 1 45 519 0
                                    525 1 0 519 0 526 1 45 79 0 527 1 6 0 57
                                    528 2 532 529 530 531 533 2 517 0 0 0 534 1
                                    0 535 0 536 1 0 0 6 537 1 517 0 519 538 2
                                    10 9 0 27 539 1 0 540 0 541 0 542 0 543 0
                                    123 0 544 2 123 9 0 0 545 1 123 35 0 546 2
                                    542 0 517 35 547 2 542 0 0 0 548 2 517 0
                                    121 27 549 1 531 10 10 550 2 531 0 10 366
                                    551 1 41 552 0 553 1 41 6 0 554 0 517 0 555
                                    1 123 9 0 556 2 517 0 0 35 557 2 517 0 0 0
                                    558 2 517 0 0 0 559 1 45 560 0 561 1 0 560
                                    0 562 4 0 0 0 563 366 27 564 4 0 0 0 10 0
                                    27 565 1 0 38 0 566 1 38 0 366 567 1 38 0 0
                                    568 1 27 9 0 569 2 38 0 570 0 571 2 572 141
                                    2 27 573 3 0 0 0 563 575 576 1 0 0 27 577 2
                                    578 0 2 2 579 2 0 0 0 580 581 3 584 582 2
                                    583 582 585 3 0 586 0 583 586 587 3 590 588
                                    2 589 588 591 3 0 592 0 589 592 593 2 45 9
                                    0 0 594 1 45 147 145 595 2 45 155 145 153
                                    596 3 597 582 15 583 582 598 4 601 599 45
                                    583 599 600 602 3 603 588 15 589 588 604 4
                                    607 605 45 589 605 606 608 2 45 0 57 15 609
                                    1 45 611 0 612 1 6 9 0 613 1 16 15 6 614 1
                                    45 615 0 616 1 0 615 0 617 3 0 0 0 82 366
                                    618 2 0 0 574 12 619 4 621 2 42 86 15 620
                                    622 3 0 0 0 82 366 623 2 0 0 10 366 624 1 0
                                    625 0 626 1 611 610 0 627 1 0 629 0 630 1 0
                                    14 0 631 2 0 9 0 0 120 1 1 366 650 1 2 1
                                    366 121 27 1 1 1 366 121 1 1 1 366 0 1 2 1
                                    366 0 27 1 1 1 0 650 1 2 1 0 121 27 1 1 1 0
                                    121 1 1 1 0 0 1 2 1 0 0 27 1 1 33 9 0 54 6
                                    1 0 0 0 0 0 0 0 364 3 1 0 0 0 0 282 3 1 0 0
                                    0 0 280 3 1 0 0 0 0 276 3 1 0 0 0 0 274 3 1
                                    0 0 0 0 272 3 1 0 0 0 0 278 3 1 0 0 0 0 270
                                    2 1 0 0 0 286 1 0 38 0 566 1 0 38 366 1 2 1
                                    652 0 12 1 1 1 0 0 226 1 1 649 0 1 1 1 0 0
                                    1 1 1 9 0 1 1 0 82 366 1 1 0 82 0 1 1 1 0 0
                                    201 1 1 0 0 177 2 1 0 0 27 383 2 1 0 0 386
                                    387 2 22 637 0 0 1 2 0 0 0 633 1 2 0 0 0
                                    580 581 3 0 0 0 82 366 623 2 1 0 0 0 290 2
                                    1 0 0 0 288 1 35 512 121 1 1 1 0 0 1 1 1
                                    642 0 1 1 1 0 0 1 2 35 638 639 121 1 2 0 9
                                    0 0 103 2 1 9 0 0 1 1 1 0 0 197 1 1 0 0 173
                                    1 1 0 0 224 1 1 9 9 129 1 1 0 0 205 1 1 0 0
                                    181 0 32 0 1 1 1 366 650 1 2 1 366 121 27 1
                                    1 1 366 121 1 1 1 366 0 1 2 1 366 0 27 1 3
                                    1 0 0 121 27 164 1 1 0 650 1 2 1 0 121 27
                                    162 1 1 0 121 1 1 1 0 0 1 2 1 0 0 27 1 1 17
                                    637 0 1 2 17 0 0 100 1 2 17 0 0 35 1 1 1 0
                                    0 338 1 0 18 0 19 1 0 540 0 541 1 0 14 0
                                    631 1 20 535 0 536 1 27 79 0 80 1 1 651 0 1
                                    1 15 656 0 1 1 6 657 0 1 1 0 12 0 13 1 0 27
                                    0 1 1 0 6 0 453 1 20 517 0 1 1 27 519 0 526
                                    1 1 110 0 1 1 15 57 0 1 1 6 108 0 1 2 1 0 0
                                    0 1 2 24 640 145 153 1 1 24 641 145 1 2 6
                                    155 145 153 157 1 6 147 145 149 1 1 0 0 114
                                    1 17 637 0 1 6 1 0 0 0 0 0 0 0 362 2 1 0 0
                                    0 1 2 1 0 0 27 389 2 1 0 0 386 391 1 1 647
                                    366 1 1 1 9 0 1 2 1 0 0 0 268 2 1 0 0 0 248
                                    2 2 0 0 100 1 0 1 0 167 2 1 0 0 0 377 3 13
                                    592 0 589 592 593 3 14 586 0 583 586 587 1
                                    0 0 0 1 2 33 9 0 0 1 1 0 563 0 1 1 0 10 10
                                    37 1 17 9 0 52 1 38 9 0 1 1 6 0 0 96 1 6 70
                                    0 73 1 1 9 0 81 2 1 0 0 57 1 2 1 625 366 0
                                    1 1 39 121 12 133 4 1 0 0 0 0 0 360 4 1 0 0
                                    0 0 0 358 5 40 0 366 366 366 366 0 369 2 0
                                    0 574 12 619 1 0 18 0 1 3 1 0 0 0 0 298 3 1
                                    0 0 0 0 296 1 1 0 0 171 1 1 0 0 408 3 1 0 0
                                    0 0 336 3 1 0 0 0 0 306 3 1 0 0 0 0 304 1
                                    17 637 0 1 2 17 0 0 100 1 2 17 0 0 35 1 2 1
                                    648 0 0 1 2 1 0 0 0 1 1 1 0 366 1 1 0 632 0
                                    1 1 1 0 0 266 3 1 0 0 0 0 356 3 1 0 0 0 0
                                    302 3 1 0 0 0 0 300 4 1 0 0 0 0 0 352 1 0
                                    82 0 83 1 0 82 366 495 2 0 0 10 0 1 2 0 0
                                    10 366 624 2 1 0 0 0 314 2 1 0 0 0 312 2 1
                                    0 0 0 310 2 1 0 0 0 308 2 1 0 0 0 332 2 1 0
                                    0 0 334 2 1 0 0 0 326 4 1 0 0 0 0 0 354 2 1
                                    0 0 0 330 2 1 0 0 0 328 1 17 625 0 1 1 6
                                    662 0 1 1 28 625 0 626 1 28 629 0 630 2 6
                                    660 0 27 1 2 6 660 0 10 1 1 17 660 0 1 2 0
                                    9 0 10 1 2 0 9 0 27 84 1 9 0 0 1 2 1 0 0 27
                                    416 2 1 0 0 386 418 3 40 0 366 366 0 367 2
                                    1 0 0 0 350 1 0 35 0 1 2 1 0 0 0 294 2 1 0
                                    0 0 292 6 1 0 0 0 0 0 0 0 342 5 1 0 0 0 0 0
                                    0 348 5 1 0 0 0 0 0 0 346 5 1 0 0 0 0 0 0
                                    344 1 0 9 0 78 1 0 6 0 1 0 1 9 128 2 1 121
                                    121 121 506 1 1 0 366 1 2 1 0 0 0 1 1 1 0 0
                                    412 1 1 0 0 414 2 0 9 0 0 1 2 0 9 0 27 1 1
                                    1 0 0 232 1 1 0 0 230 2 1 0 0 27 381 1 1 0
                                    0 379 1 1 0 0 373 1 35 512 121 1 1 35 512
                                    121 513 1 1 642 0 1 3 1 644 0 0 0 1 2 1 645
                                    0 0 1 2 1 637 0 0 1 2 1 625 366 0 1 1 1 0 0
                                    169 1 38 9 0 1 3 0 0 0 12 0 1 2 0 0 0 580 1
                                    3 0 0 0 82 366 618 2 0 0 0 633 1 3 0 0 0
                                    366 366 1 3 0 0 0 0 0 1 3 0 0 0 38 575 1 3
                                    0 0 0 38 635 1 3 0 0 0 27 574 1 3 0 0 0 27
                                    634 1 3 0 0 0 563 575 576 3 0 0 0 10 634 1
                                    3 0 0 0 563 635 1 3 0 0 0 10 574 1 4 10 0 0
                                    563 366 27 564 4 10 0 0 10 0 27 565 4 6 0 0
                                    27 35 574 1 4 6 0 0 38 658 635 1 4 6 0 0 27
                                    35 634 1 4 6 0 0 38 658 575 1 1 1 35 0 1 1
                                    1 0 0 396 1 1 0 0 394 2 0 0 10 0 1 4 0 0 10
                                    0 0 0 1 3 0 0 10 0 0 1 5 0 0 10 0 0 0 0 1 7
                                    0 0 10 0 0 0 0 0 0 1 6 0 0 10 0 0 0 0 0 1 8
                                    0 0 10 0 0 0 0 0 0 0 1 10 0 0 10 0 0 0 0 0
                                    0 0 0 0 1 9 0 0 10 0 0 0 0 0 0 0 0 1 2 0 0
                                    10 366 1 3 1 0 0 0 0 324 1 1 0 0 316 2 1 0
                                    0 0 322 2 1 0 0 0 320 1 1 0 0 318 2 1 646 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 1 1 0 0 234 1 1 0
                                    0 410 1 1 0 0 246 2 6 0 0 27 1 3 6 0 0 27
                                    35 1 2 6 0 0 38 1 3 6 0 0 38 658 1 1 1 0 0
                                    97 1 1 70 0 71 1 39 0 0 524 1 1 0 0 207 1 1
                                    0 0 183 1 1 0 0 203 1 1 0 0 179 1 1 0 0 199
                                    1 1 0 0 175 1 10 560 0 562 1 11 589 0 1 1
                                    12 583 0 1 1 1 0 642 1 2 8 0 0 0 1 1 1 0 0
                                    236 1 41 636 145 1 2 19 0 0 0 1 1 0 615 0
                                    617 1 0 0 12 137 1 0 0 27 577 1 0 0 6 537 1
                                    20 0 517 518 1 37 0 519 1 1 23 0 57 61 1 1
                                    0 0 1 1 1 0 110 113 1 1 0 653 1 1 1 0 654 1
                                    1 1 0 655 1 1 6 0 108 109 1 6 0 70 76 1 41
                                    637 0 1 3 1 0 0 0 0 340 0 6 35 1 1 1 0 0
                                    228 1 0 0 0 1 2 1 0 0 0 375 2 1 0 0 0 252 2
                                    1 0 0 0 256 2 1 0 0 0 250 2 1 0 0 0 254 1 0
                                    9 10 11 1 1 0 0 213 1 1 0 0 189 3 6 0 0 0 0
                                    1 2 1 9 0 0 1 1 1 0 0 209 1 1 0 0 185 1 1 0
                                    0 217 1 1 0 0 193 2 0 0 27 0 1 3 0 0 27 0 0
                                    1 5 0 0 27 0 0 0 0 1 4 0 0 27 0 0 0 1 2 0 0
                                    27 366 1 2 6 0 0 0 1 2 6 9 0 0 1 2 1 0 0 0
                                    284 1 1 82 0 91 1 1 82 366 494 1 1 0 0 264
                                    1 1 0 0 262 1 1 0 0 260 1 1 0 0 258 1 1 0 0
                                    219 1 1 0 0 195 1 1 0 0 215 1 1 0 0 191 1 1
                                    0 0 211 1 1 0 0 187 1 1 0 0 222 2 9 0 0 57
                                    99 2 1 0 0 519 521 2 1 0 0 0 92 2 17 0 0
                                    100 101 2 17 0 0 35 98 1 1 0 0 400 1 1 0 0
                                    404 2 1 0 0 0 240 1 1 0 0 238 1 1 0 0 398 2
                                    6 0 0 38 1 2 6 0 0 27 1 3 6 0 0 27 35 1 3 6
                                    0 0 38 658 1 1 1 0 0 402 1 1 0 0 406 3 1 0
                                    0 0 0 244 2 1 0 0 0 242 2 0 9 0 0 77 0 17 0
                                    49 0 33 0 47 2 9 0 0 0 69 2 1 0 70 70 140 1
                                    22 0 0 56 2 22 0 0 0 67 2 28 0 0 0 65 2 36
                                    0 0 519 1 2 36 0 519 0 1 2 24 0 0 57 1 2 33
                                    0 35 0 1 2 22 0 57 0 59 2 28 0 100 0 1 2 2
                                    0 6 0 1 2 6 0 0 6 1 2 17 0 0 0 63)))))
           '|lookupComplete|)) 
