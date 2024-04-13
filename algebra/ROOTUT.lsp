
(PUT '|ROOTUT;root_pair| '|SPADreplace| 'CONS) 

(SDEFUN |ROOTUT;root_pair|
        ((|a| (F)) (|b| (F)) (% (|Record| (|:| |real| F) (|:| |imag| F))))
        (CONS |a| |b|)) 

(SDEFUN |ROOTUT;root4| ((|a| (F)) (% (F)))
        (SPROG
         ((|p1| (|SparseUnivariatePolynomial| F))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 4 (QREFELT % 14)))
              (LETT |p1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 16) (QVELT |rec| 0)
                               (QREFELT % 18))
                     (SPADCALL (QVELT |rec| 2) (QREFELT % 19)) (QREFELT % 20)))
              (EXIT
               (SPADCALL (QVELT |rec| 1) (SPADCALL |p1| (QREFELT % 22))
                         (QREFELT % 23)))))) 

(SDEFUN |ROOTUT;my_sqrt;2F;3| ((|a| (F)) (% (F)))
        (SPROG
         ((|fr1| #1=(|SparseUnivariatePolynomial| F))
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL (|spadConstant| % 16) 2 (QREFELT % 18))
                          (SPADCALL |a| (QREFELT % 19)) (QREFELT % 20)))
          (LETT |fr| (SPADCALL |p| (QREFELT % 25)))
          (LETT |fl| (SPADCALL |fr| (QREFELT % 30)))
          (EXIT
           (COND ((EQL (LENGTH |fl|) 1) (SPADCALL |a| (QREFELT % 31)))
                 (#2='T
                  (SEQ (LETT |fr1| (QVELT (SPADCALL |fl| 1 (QREFELT % 33)) 1))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |fr1| (QREFELT % 34)) 1
                                    (QREFELT % 36))
                          (|error| "impossible"))
                         (#2#
                          (SPADCALL
                           (SPADCALL (SPADCALL |fr1| 0 (QREFELT % 38))
                                     (SPADCALL |fr1| 1 (QREFELT % 38))
                                     (QREFELT % 39))
                           (QREFELT % 40)))))))))))) 

(SDEFUN |ROOTUT;my_root3;2F;4| ((|a| (F)) (% (F)))
        (SPROG
         ((|fr1| #1=(|SparseUnivariatePolynomial| F))
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL (|spadConstant| % 16) 2 (QREFELT % 18))
                          (SPADCALL |a| (QREFELT % 19)) (QREFELT % 20)))
          (LETT |fr| (SPADCALL |p| (QREFELT % 25)))
          (LETT |fl| (SPADCALL |fr| (QREFELT % 30)))
          (EXIT
           (COND
            ((EQL (LENGTH |fl|) 1)
             (SPADCALL |a| (SPADCALL 1 3 (QREFELT % 45)) (QREFELT % 46)))
            (#2='T
             (SEQ (LETT |fr1| (QVELT (SPADCALL |fl| 1 (QREFELT % 33)) 1))
                  (COND
                   ((SPADCALL (SPADCALL |fr1| (QREFELT % 34)) 1 (QREFELT % 36))
                    (LETT |fr1| (QVELT (SPADCALL |fl| 2 (QREFELT % 33)) 1))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |fr1| (QREFELT % 34)) 1
                               (QREFELT % 36))
                     (|error| "impossible"))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |fr1| 0 (QREFELT % 38))
                                (SPADCALL |fr1| 1 (QREFELT % 38))
                                (QREFELT % 39))
                      (QREFELT % 40)))))))))))) 

(SDEFUN |ROOTUT;do_rp|
        ((|r| (F)) (|q| (F))
         (|res1|
          (|Record| (|:| |reals| (|List| F))
                    (|:| |complexes|
                         (|List| (|Record| (|:| |real| F) (|:| |imag| F))))))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|qr| (F)) (|su| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |su| (SPADCALL |q| (QREFELT % 50)))
                    (EXIT
                     (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                           ((< 0 (QCDR |su|))
                            (SEQ (LETT |qr| (SPADCALL |q| (QREFELT % 41)))
                                 (EXIT
                                  (CONS 0
                                        (CONS (QCAR |res1|)
                                              (CONS
                                               (|ROOTUT;root_pair| |r| |qr| %)
                                               (QCDR |res1|)))))))
                           ('T
                            (SEQ
                             (LETT |qr|
                                   (SPADCALL (SPADCALL |q| (QREFELT % 40))
                                             (QREFELT % 41)))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (CONS (SPADCALL |r| |qr| (QREFELT % 51))
                                           (CONS
                                            (SPADCALL |r| |qr| (QREFELT % 52))
                                            (QCAR |res1|)))
                                     (QCDR |res1|))))))))))) 

(SDEFUN |ROOTUT;quartic3|
        ((|r1| (F)) (|a0| (F)) (|a| (F)) (|b| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|q2| (F))
          (|res1|
           (|Union|
            (|Record| (|:| |reals| (|List| F))
                      (|:| |complexes|
                           (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
            "failed"))
          (|q1| (F)) (|qq| (F)) (|rr| (F)))
         (SEQ (LETT |rr| (SPADCALL |r1| (QREFELT % 41)))
              (LETT |qq|
                    (SPADCALL |r1|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 16)
                                         (SPADCALL 2 (QREFELT % 53))
                                         (QREFELT % 39))
                               |a| (QREFELT % 23))
                              (QREFELT % 51)))
              (LETT |q1|
                    (SPADCALL |qq|
                              (SPADCALL (SPADCALL |b| |rr| (QREFELT % 23))
                                        (SPADCALL 4 |r1| (QREFELT % 55))
                                        (QREFELT % 39))
                              (QREFELT % 51)))
              (LETT |res1|
                    (|ROOTUT;do_rp| (SPADCALL |rr| |a0| (QREFELT % 51)) |q1|
                     (CONS NIL NIL) %))
              (EXIT
               (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ
                       (LETT |q2|
                             (SPADCALL |qq|
                                       (SPADCALL
                                        (SPADCALL |b| |rr| (QREFELT % 23))
                                        (SPADCALL 4 |r1| (QREFELT % 55))
                                        (QREFELT % 39))
                                       (QREFELT % 52)))
                       (EXIT
                        (|ROOTUT;do_rp|
                         (SPADCALL (SPADCALL |rr| (QREFELT % 40)) |a0|
                                   (QREFELT % 51))
                         |q2| (QCDR |res1|) %))))))))) 

(SDEFUN |ROOTUT;do_f2|
        ((|del| (F)) (|a2| (F)) (|b2| (F)) (|a0| (F)) (|a| (F)) (|b| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|d2| (F)) (|su| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |d2| (SPADCALL |del| (QREFELT % 41)))
                    (LETT |su| (SPADCALL |d2| (QREFELT % 50)))
                    (EXIT
                     (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ
                             (COND
                              ((< (QCDR |su|) 0)
                               (LETT |d2| (SPADCALL |d2| (QREFELT % 40)))))
                             (EXIT
                              (|ROOTUT;quartic3|
                               (SPADCALL
                                (SPADCALL (SPADCALL |b2| (QREFELT % 40)) |d2|
                                          (QREFELT % 51))
                                (SPADCALL 2 |a2| (QREFELT % 55))
                                (QREFELT % 39))
                               |a0| |a| |b| %))))))))) 

(SDEFUN |ROOTUT;quartic2;SupFU;8|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((#1=#:G140 NIL) (|su| (|Union| (|Integer|) "failed")) (|t2| (F))
          (|t1| (F)) (|del| (F)) (|b2| (F)) (|a2| (F)) (|s1| (|Integer|))
          (|r1| (F)) (|f2| #2=(|SparseUnivariatePolynomial| F))
          (|f1| #3=(|SparseUnivariatePolynomial| F))
          (|#G30| (|SparseUnivariatePolynomial| F)) (|#G29| #2#)
          (#4=#:G139 NIL) (|cnt| (|Integer|)) (|cc| (F)) (#5=#:G142 NIL)
          (|flf| (|List| (|SparseUnivariatePolynomial| F))) (#6=#:G141 NIL)
          (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fr| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|r| (|SparseUnivariatePolynomial| F))
          (|xx| (|SparseUnivariatePolynomial| F)) (|c| (F)) (|b| (F))
          (|a| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (SPADCALL |p| 2 (QREFELT % 38)))
                (LETT |b| (SPADCALL |p| 1 (QREFELT % 38)))
                (LETT |c| (SPADCALL |p| 0 (QREFELT % 38)))
                (LETT |xx| (SPADCALL (|spadConstant| % 16) 1 (QREFELT % 18)))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL 64 (SPADCALL |xx| 3 (QREFELT % 56))
                                 (QREFELT % 57))
                       (SPADCALL (SPADCALL 32 |a| (QREFELT % 55))
                                 (SPADCALL |xx| 2 (QREFELT % 56))
                                 (QREFELT % 58))
                       (QREFELT % 59)))
                (LETT |r|
                      (SPADCALL |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 16 |c| (QREFELT % 55))
                                            (QREFELT % 40))
                                  (SPADCALL 4 (SPADCALL |a| 2 (QREFELT % 60))
                                            (QREFELT % 55))
                                  (QREFELT % 51))
                                 |xx| (QREFELT % 58))
                                (QREFELT % 59)))
                (LETT |r|
                      (SPADCALL |r|
                                (SPADCALL (SPADCALL |b| 2 (QREFELT % 60))
                                          (QREFELT % 19))
                                (QREFELT % 20)))
                (LETT |fr| (SPADCALL |r| (QREFELT % 25)))
                (LETT |fl| (SPADCALL |fr| (QREFELT % 30)))
                (EXIT
                 (COND ((EQL (LENGTH |fl|) 1) (CONS 1 "failed"))
                       (#7='T
                        (SEQ (LETT |flf| NIL)
                             (SEQ (LETT |fac| NIL) (LETT #6# |fl|) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |fac| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |f1| (QVELT |fac| 1))
                                       (EXIT
                                        (COND
                                         ((EQL (QVELT |fac| 2) 2)
                                          (LETT |flf|
                                                (CONS |f1| (CONS |f1| |flf|))))
                                         ('T (LETT |flf| (CONS |f1| |flf|))))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND
                               ((EQL (LENGTH |flf|) 3)
                                (SEQ (LETT |cnt| 0)
                                     (SEQ (LETT #5# |flf|) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |f1| (CAR #5#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SEQ
                                             (LETT |cc|
                                                   (SPADCALL
                                                    (SPADCALL |f1| 0
                                                              (QREFELT % 38))
                                                    (SPADCALL |f1| 1
                                                              (QREFELT % 38))
                                                    (QREFELT % 39)))
                                             (LETT |su|
                                                   (SPADCALL |cc|
                                                             (QREFELT % 50)))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |su| 1)
                                                (PROGN
                                                 (LETT #1# (CONS 1 "failed"))
                                                 (GO #8=#:G138)))
                                               ((< (QCDR |su|) 0)
                                                (SEQ (LETT |cnt| (+ |cnt| 1))
                                                     (EXIT
                                                      (COND
                                                       ((> |cnt| 1)
                                                        (PROGN
                                                         (LETT #4# |$NoValue|)
                                                         (GO #9=#:G109)))
                                                       ('T
                                                        (LETT |r1|
                                                              |cc|))))))))))
                                           #9# (EXIT #4#))
                                          (LETT #5# (CDR #5#)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((EQL |cnt| 0) (|error| "impossible"))
                                       (#7#
                                        (|ROOTUT;quartic3|
                                         (SPADCALL |r1| (QREFELT % 40)) |a0|
                                         |a| |b| %))))))
                               ((EQL (LENGTH |flf|) 2)
                                (SEQ (LETT |f1| (|SPADfirst| |flf|))
                                     (LETT |f2|
                                           (SPADCALL |flf| (QREFELT % 62)))
                                     (COND
                                      ((EQL (SPADCALL |f2| (QREFELT % 34)) 1)
                                       (PROGN
                                        (LETT |#G29| |f2|)
                                        (LETT |#G30| |f1|)
                                        (LETT |f1| |#G29|)
                                        (LETT |f2| |#G30|))))
                                     (LETT |r1|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |f1| 0 (QREFELT % 38))
                                             (SPADCALL |f1| 1 (QREFELT % 38))
                                             (QREFELT % 39))
                                            (QREFELT % 40)))
                                     (LETT |su| (SPADCALL |r1| (QREFELT % 50)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |su| 1)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed"))
                                         (GO #8#)))
                                       (#7#
                                        (SEQ (LETT |s1| (QCDR |su|))
                                             (LETT |a2|
                                                   (SPADCALL |f2| 2
                                                             (QREFELT % 38)))
                                             (LETT |b2|
                                                   (SPADCALL |f2| 1
                                                             (QREFELT % 38)))
                                             (LETT |del|
                                                   (SPADCALL
                                                    (SPADCALL |b2| 2
                                                              (QREFELT % 60))
                                                    (SPADCALL
                                                     (SPADCALL 4 |a2|
                                                               (QREFELT % 55))
                                                     (SPADCALL |f2| 0
                                                               (QREFELT % 38))
                                                     (QREFELT % 23))
                                                    (QREFELT % 52)))
                                             (SEQ
                                              (LETT |su|
                                                    (SPADCALL |del|
                                                              (QREFELT % 50)))
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |su| 1))
                                                 (SEQ
                                                  (COND
                                                   ((< (QCDR |su|) 0)
                                                    (PROGN
                                                     (LETT #1#
                                                           (COND
                                                            ((< 0 |s1|)
                                                             (|ROOTUT;quartic3|
                                                              |r1| |a0| |a| |b|
                                                              %))
                                                            (#7#
                                                             (|error|
                                                              "impossible"))))
                                                     (GO #8#))))
                                                  (EXIT
                                                   (COND
                                                    ((< 0 |s1|)
                                                     (SEQ
                                                      (LETT |t1|
                                                            (SPADCALL |r1|
                                                                      (SPADCALL
                                                                       |b2|
                                                                       (SPADCALL
                                                                        2 |a2|
                                                                        (QREFELT
                                                                         % 55))
                                                                       (QREFELT
                                                                        % 39))
                                                                      (QREFELT
                                                                       % 51)))
                                                      (LETT |t2|
                                                            (SPADCALL
                                                             (SPADCALL |del|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         4 |a2|
                                                                         (QREFELT
                                                                          %
                                                                          55))
                                                                        |a2|
                                                                        (QREFELT
                                                                         % 23))
                                                                       (QREFELT
                                                                        % 39))
                                                             (SPADCALL |t1|
                                                                       |t1|
                                                                       (QREFELT
                                                                        % 23))
                                                             (QREFELT % 52)))
                                                      (LETT |su|
                                                            (SPADCALL |t2|
                                                                      (QREFELT
                                                                       % 50)))
                                                      (EXIT
                                                       (COND
                                                        ((NULL (QEQCAR |su| 1))
                                                         (COND
                                                          ((< 0 (QCDR |su|))
                                                           (PROGN
                                                            (LETT #1#
                                                                  (|ROOTUT;do_f2|
                                                                   |del| |a2|
                                                                   |b2| |a0|
                                                                   |a| |b| %))
                                                            (GO #8#)))
                                                          (#7#
                                                           (PROGN
                                                            (LETT #1#
                                                                  (|ROOTUT;quartic3|
                                                                   |r1| |a0|
                                                                   |a| |b| %))
                                                            (GO #8#)))))))))
                                                    (#7#
                                                     (PROGN
                                                      (LETT #1#
                                                            (|ROOTUT;do_f2|
                                                             |del| |a2| |b2|
                                                             |a0| |a| |b| %))
                                                      (GO #8#))))))))))
                                             (LETT |su|
                                                   (SPADCALL |b2|
                                                             (QREFELT % 50)))
                                             (COND
                                              ((OR (QEQCAR |su| 1)
                                                   (NULL (< 0 (QCDR |su|))))
                                               (EXIT
                                                (PROGN
                                                 (LETT #1# (CONS 1 "failed"))
                                                 (GO #8#)))))
                                             (LETT |su|
                                                   (SPADCALL
                                                    (SPADCALL |a2|
                                                              (SPADCALL |f2| 0
                                                                        (QREFELT
                                                                         % 38))
                                                              (QREFELT % 23))
                                                    (QREFELT % 50)))
                                             (COND
                                              ((OR (QEQCAR |su| 1)
                                                   (NULL (< 0 (QCDR |su|))))
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed"))
                                                (GO #8#))))
                                             (EXIT
                                              (|ROOTUT;quartic3| |r1| |a0| |a|
                                               |b| %))))))))
                               (#7# (|error| "impossible"))))))))))
          #8# (EXIT #1#)))) 

(PUT '|ROOTUT;quartic2;SupFU;9| '|SPADreplace|
     '(XLAM (|p| |a0|) (CONS 1 "failed"))) 

(SDEFUN |ROOTUT;quartic2;SupFU;9|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (CONS 1 "failed")) 

(SDEFUN |ROOTUT;my_sqrt;2F;10| ((|a| (F)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 2 (QREFELT % 14)))
              (EXIT
               (COND ((EQL (QVELT |rec| 0) 2) (SPADCALL |a| (QREFELT % 31)))
                     ('T
                      (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2)
                                (QREFELT % 23)))))))) 

(SDEFUN |ROOTUT;my_root3;2F;11| ((|a| (F)) (% (F)))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |a| 3 (QREFELT % 14)))
              (EXIT
               (COND
                ((EQL (QVELT |rec| 0) 3)
                 (SPADCALL |a| (SPADCALL 1 3 (QREFELT % 45)) (QREFELT % 46)))
                ('T
                 (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT % 23)))))))) 

(SDEFUN |ROOTUT;qubic|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|su| (|Union| (|Integer|) "failed")) (|r1| (F)) (|a| (F))
          (|rp| (|SparseUnivariatePolynomial| F)) (|a0| (F)))
         (SEQ
          (LETT |p|
                (SPADCALL
                 (SPADCALL (|spadConstant| % 16) (SPADCALL |p| (QREFELT % 67))
                           (QREFELT % 39))
                 |p| (QREFELT % 58)))
          (LETT |a0|
                (SPADCALL
                 (SPADCALL (SPADCALL |p| 2 (QREFELT % 38))
                           (SPADCALL 3 (QREFELT % 53)) (QREFELT % 39))
                 (QREFELT % 40)))
          (LETT |p|
                (SPADCALL |p| (QREFELT % 10)
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 16) 1 (QREFELT % 18))
                           (SPADCALL |a0| (QREFELT % 19)) (QREFELT % 59))
                          (QREFELT % 71)))
          (EXIT
           (COND
            ((SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT % 72)))
                       (QREFELT % 73))
             (SEQ (LETT |a| (SPADCALL |rp| (QREFELT % 74)))
                  (EXIT
                   (COND
                    ((SPADCALL |a| (|spadConstant| % 75) (QREFELT % 76))
                     (CONS 0 (CONS (LIST |a0| |a0| |a0|) NIL)))
                    (#1='T
                     (SEQ (LETT |su| (SPADCALL |a| (QREFELT % 50)))
                          (EXIT
                           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                 ((< (QCDR |su|) 0)
                                  (SEQ
                                   (LETT |r1|
                                         (SPADCALL
                                          (SPADCALL |a| (QREFELT % 40))
                                          (QREFELT % 47)))
                                   (LETT |su| (SPADCALL |r1| (QREFELT % 50)))
                                   (EXIT
                                    (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                          (#1#
                                           (CONS 0
                                                 (CONS
                                                  (LIST
                                                   (SPADCALL |r1| |a0|
                                                             (QREFELT % 51)))
                                                  (LIST
                                                   (|ROOTUT;root_pair|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r1|
                                                                (SPADCALL 2
                                                                          (QREFELT
                                                                           %
                                                                           53))
                                                                (QREFELT % 39))
                                                      (QREFELT % 40))
                                                     |a0| (QREFELT % 51))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL 3
                                                                 (QREFELT %
                                                                          53))
                                                       (QREFELT % 31))
                                                      |r1| (QREFELT % 23))
                                                     (SPADCALL 2
                                                               (QREFELT % 53))
                                                     (QREFELT % 39))
                                                    %)))))))))
                                 (#1#
                                  (SEQ
                                   (LETT |r1| (SPADCALL |a| (QREFELT % 47)))
                                   (LETT |su| (SPADCALL |r1| (QREFELT % 50)))
                                   (EXIT
                                    (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                          (#1#
                                           (CONS 0
                                                 (CONS
                                                  (LIST
                                                   (SPADCALL
                                                    (SPADCALL |r1|
                                                              (QREFELT % 40))
                                                    |a0| (QREFELT % 51)))
                                                  (LIST
                                                   (|ROOTUT;root_pair|
                                                    (SPADCALL
                                                     (SPADCALL |r1|
                                                               (SPADCALL 2
                                                                         (QREFELT
                                                                          %
                                                                          53))
                                                               (QREFELT % 39))
                                                     |a0| (QREFELT % 51))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL 3
                                                                 (QREFELT %
                                                                          53))
                                                       (QREFELT % 31))
                                                      |r1| (QREFELT % 23))
                                                     (SPADCALL 2
                                                               (QREFELT % 53))
                                                     (QREFELT % 39))
                                                    %)))))))))))))))))
            (#1# (CONS 1 "failed"))))))) 

(SDEFUN |ROOTUT;quartic0|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a0| (F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((|cl| (|List| (|Record| (|:| |real| F) (|:| |imag| F))))
          (|cp| (|Record| (|:| |real| F) (|:| |imag| F))) (|rl| (|List| F))
          (#1=#:G179 NIL) (|r| NIL)
          (|r1|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F))))))
          (|ru|
           (|Union|
            (|Record| (|:| |reals| (|List| F))
                      (|:| |complexes|
                           (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
            "failed"))
          (|pu| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (LETT |pu|
                (SPADCALL |p| (SPADCALL (|spadConstant| % 16) 1 (QREFELT % 18))
                          (QREFELT % 78)))
          (EXIT
           (COND ((QEQCAR |pu| 1) (|error| "impossible"))
                 (#2='T
                  (SEQ (LETT |p| (QCDR |pu|))
                       (LETT |ru| (|ROOTUT;qubic| |p| %))
                       (EXIT
                        (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                              (#2#
                               (SEQ (LETT |r1| (QCDR |ru|))
                                    (LETT |rl| (LIST |a0|))
                                    (SEQ (LETT |r| NIL) (LETT #1# (QCAR |r1|))
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |r| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |rl|
                                                 (CONS
                                                  (SPADCALL |r| |a0|
                                                            (QREFELT % 51))
                                                  |rl|))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |cl|
                                          (COND ((NULL (QCDR |r1|)) NIL)
                                                (#2#
                                                 (SEQ
                                                  (LETT |cp|
                                                        (|SPADfirst|
                                                         (QCDR |r1|)))
                                                  (EXIT
                                                   (LIST
                                                    (|ROOTUT;root_pair|
                                                     (SPADCALL (QCAR |cp|) |a0|
                                                               (QREFELT % 51))
                                                     (QCDR |cp|) %)))))))
                                    (EXIT (CONS 0 (CONS |rl| |cl|)))))))))))))) 

(SDEFUN |ROOTUT;quartic|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG
         ((#1=#:G202 NIL) (|r3| (F)) (|r2| (F))
          (|su| (|Union| (|Integer|) "failed")) (|x2| (F)) (|x1| (F))
          (|r1| (F)) (|si| (|Integer|)) (|del| (F)) (|c| (F)) (|b| (F))
          (|a| (F)) (|rp| (|SparseUnivariatePolynomial| F)) (|a0| (F))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| 0 (QREFELT % 38)) (|spadConstant| % 75)
                      (QREFELT % 76))
            (|ROOTUT;quartic0| |p| (|spadConstant| % 75) %))
           (#2='T
            (SEQ (LETT |lc| (SPADCALL |p| (QREFELT % 67)))
                 (LETT |p|
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 16) |lc| (QREFELT % 39))
                        |p| (QREFELT % 58)))
                 (LETT |a0|
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| 3 (QREFELT % 38))
                                  (SPADCALL 4 (QREFELT % 53)) (QREFELT % 39))
                        (QREFELT % 40)))
                 (LETT |p|
                       (SPADCALL |p| (QREFELT % 10)
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 16) 1
                                            (QREFELT % 18))
                                  (SPADCALL |a0| (QREFELT % 19))
                                  (QREFELT % 59))
                                 (QREFELT % 71)))
                 (EXIT
                  (COND
                   ((SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT % 72)))
                              (QREFELT % 73))
                    (SEQ (LETT |a| (SPADCALL |rp| (QREFELT % 74)))
                         (EXIT
                          (COND
                           ((SPADCALL |a| (|spadConstant| % 75) (QREFELT % 76))
                            (CONS 0 (CONS (LIST |a0| |a0| |a0| |a0|) NIL)))
                           (#2#
                            (SEQ (LETT |su| (SPADCALL |a| (QREFELT % 50)))
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                        (#2#
                                         (SEQ (LETT |si| (QCDR |su|))
                                              (EXIT
                                               (COND
                                                ((EQL |si| 1)
                                                 (SEQ
                                                  (LETT |r1|
                                                        (|ROOTUT;root4|
                                                         (SPADCALL |a|
                                                                   (SPADCALL
                                                                    (SPADCALL 4
                                                                              (QREFELT
                                                                               %
                                                                               53))
                                                                    (SPADCALL
                                                                     |p|
                                                                     (QREFELT %
                                                                              67))
                                                                    (QREFELT %
                                                                             23))
                                                                   (QREFELT %
                                                                            39))
                                                         %))
                                                  (EXIT
                                                   (CONS 0
                                                         (CONS NIL
                                                               (LIST
                                                                (|ROOTUT;root_pair|
                                                                 (SPADCALL |r1|
                                                                           |a0|
                                                                           (QREFELT
                                                                            %
                                                                            51))
                                                                 |r1| %)
                                                                (|ROOTUT;root_pair|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |r1|
                                                                   (QREFELT %
                                                                            40))
                                                                  |a0|
                                                                  (QREFELT %
                                                                           51))
                                                                 |r1| %)))))))
                                                ((EQL |si| -1)
                                                 (SEQ
                                                  (LETT |r1|
                                                        (SPADCALL
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            22))
                                                         (QREFELT % 80)))
                                                  (EXIT
                                                   (CONS 0
                                                         (CONS
                                                          (LIST
                                                           (SPADCALL |r1| |a0|
                                                                     (QREFELT %
                                                                              51))
                                                           (SPADCALL
                                                            (SPADCALL |r1|
                                                                      (QREFELT
                                                                       % 40))
                                                            |a0|
                                                            (QREFELT % 51)))
                                                          (LIST
                                                           (|ROOTUT;root_pair|
                                                            |a0| |r1| %)))))))
                                                (#2#
                                                 (|error|
                                                  "impossible"))))))))))))))
                   ((SPADCALL (SPADCALL |p| 0 (QREFELT % 38))
                              (|spadConstant| % 75) (QREFELT % 76))
                    (|ROOTUT;quartic0| |p| |a0| %))
                   ((SPADCALL (SPADCALL |p| 1 (QREFELT % 38))
                              (|spadConstant| % 75) (QREFELT % 76))
                    (SEQ (LETT |b| (SPADCALL |p| 2 (QREFELT % 38)))
                         (LETT |c| (SPADCALL |p| 0 (QREFELT % 38)))
                         (LETT |del|
                               (SPADCALL (SPADCALL |b| |b| (QREFELT % 23))
                                         (SPADCALL 4 |c| (QREFELT % 55))
                                         (QREFELT % 52)))
                         (LETT |su| (SPADCALL |del| (QREFELT % 50)))
                         (EXIT
                          (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                                (#2#
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (SEQ (LETT |si| (QCDR |su|))
                                         (EXIT
                                          (COND
                                           ((NULL (< |si| 0))
                                            (PROGN
                                             (LETT #1#
                                                   (SEQ
                                                    (LETT |r1|
                                                          (SPADCALL |del|
                                                                    (QREFELT %
                                                                             41)))
                                                    (LETT |x1|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |b|
                                                                      (QREFELT
                                                                       % 40))
                                                            |r1|
                                                            (QREFELT % 51))
                                                           (SPADCALL 2
                                                                     (QREFELT %
                                                                              53))
                                                           (QREFELT % 39)))
                                                    (LETT |x2|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |b|
                                                                      (QREFELT
                                                                       % 40))
                                                            |r1|
                                                            (QREFELT % 52))
                                                           (SPADCALL 2
                                                                     (QREFELT %
                                                                              53))
                                                           (QREFELT % 39)))
                                                    (LETT |su|
                                                          (SPADCALL |x1|
                                                                    (QREFELT %
                                                                             50)))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |su| 1)
                                                       (CONS 1 "failed"))
                                                      ((< (QCDR |su|) 0)
                                                       (CONS 0
                                                             (CONS NIL
                                                                   (LIST
                                                                    (|ROOTUT;root_pair|
                                                                     |a0|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x1|
                                                                       (QREFELT
                                                                        % 40))
                                                                      (QREFELT
                                                                       % 41))
                                                                     %)
                                                                    (|ROOTUT;root_pair|
                                                                     |a0|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x2|
                                                                       (QREFELT
                                                                        % 40))
                                                                      (QREFELT
                                                                       % 41))
                                                                     %)))))
                                                      (#2#
                                                       (SEQ
                                                        (LETT |su|
                                                              (SPADCALL |x2|
                                                                        (QREFELT
                                                                         %
                                                                         50)))
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |su| 1)
                                                           (CONS 1 "failed"))
                                                          (#2#
                                                           (SEQ
                                                            (LETT |r2|
                                                                  (SPADCALL
                                                                   |x1|
                                                                   (QREFELT %
                                                                            41)))
                                                            (EXIT
                                                             (COND
                                                              ((< (QCDR |su|)
                                                                  0)
                                                               (CONS 0
                                                                     (CONS
                                                                      (LIST
                                                                       (SPADCALL
                                                                        |r2|
                                                                        |a0|
                                                                        (QREFELT
                                                                         % 51))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |r2|
                                                                         (QREFELT
                                                                          %
                                                                          40))
                                                                        |a0|
                                                                        (QREFELT
                                                                         %
                                                                         51)))
                                                                      (LIST
                                                                       (|ROOTUT;root_pair|
                                                                        |a0|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |x2|
                                                                          (QREFELT
                                                                           %
                                                                           40))
                                                                         (QREFELT
                                                                          %
                                                                          41))
                                                                        %)))))
                                                              (#2#
                                                               (SEQ
                                                                (LETT |r3|
                                                                      (SPADCALL
                                                                       |x2|
                                                                       (QREFELT
                                                                        % 41)))
                                                                (EXIT
                                                                 (CONS 0
                                                                       (CONS
                                                                        (LIST
                                                                         (SPADCALL
                                                                          |r2|
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           51))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |r2|
                                                                           (QREFELT
                                                                            %
                                                                            40))
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           51))
                                                                         (SPADCALL
                                                                          |r3|
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           51))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |r3|
                                                                           (QREFELT
                                                                            %
                                                                            40))
                                                                          |a0|
                                                                          (QREFELT
                                                                           %
                                                                           51)))
                                                                        NIL)))))))))))))))))
                                             (GO #3=#:G195))))))
                                    (EXIT (SPADCALL |p| |a0| (QREFELT % 66)))))
                                  #3# (EXIT #1#)))))))
                   (#2# (SPADCALL |p| |a0| (QREFELT % 66))))))))))) 

(SDEFUN |ROOTUT;complex_roots;SupU;15|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|Union|
           (|Record| (|:| |reals| (|List| F))
                     (|:| |complexes|
                          (|List| (|Record| (|:| |real| F) (|:| |imag| F)))))
           "failed")))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 34)))
                    (EXIT
                     (COND ((EQL |d| 3) (|ROOTUT;qubic| |p| %))
                           ((EQL |d| 4) (|ROOTUT;quartic| |p| %))
                           ('T (CONS 1 "failed"))))))) 

(DECLAIM (NOTINLINE |RootUtilities;|)) 

(DEFUN |RootUtilities| (&REST #1=#:G205)
  (SPROG NIL
         (PROG (#2=#:G206)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RootUtilities|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RootUtilities;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RootUtilities|)))))))))) 

(DEFUN |RootUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RootUtilities| DV$1 DV$2))
          (LETT % (GETREFV 82))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RootUtilities| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV % 41
                       (CONS (|dispatchFunction| |ROOTUT;my_sqrt;2F;3|) %))
             (QSETREFV % 47
                       (CONS (|dispatchFunction| |ROOTUT;my_root3;2F;4|) %))
             (QSETREFV % 66
                       (CONS (|dispatchFunction| |ROOTUT;quartic2;SupFU;8|)
                             %))))
           ('T
            (PROGN
             (QSETREFV % 66
                       (CONS (|dispatchFunction| |ROOTUT;quartic2;SupFU;9|) %))
             (QSETREFV % 41
                       (CONS (|dispatchFunction| |ROOTUT;my_sqrt;2F;10|) %))
             (QSETREFV % 47
                       (CONS (|dispatchFunction| |ROOTUT;my_root3;2F;11|)
                             %)))))
          %))) 

(MAKEPROP '|RootUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SingletonAsOrderedSet|) (0 . |create|) '|dummy|
              (|Record| (|:| |exponent| 12) (|:| |coef| 7) (|:| |radicand| 7))
              (|NonNegativeInteger|)
              (|PolynomialRoots| (|IndexedExponents| (|Kernel| 7)) (|Kernel| 7)
                                 6 42 7)
              (4 . |froot|) (10 . |One|) (14 . |One|)
              (|SparseUnivariatePolynomial| 7) (18 . |monomial|)
              (24 . |coerce|) (29 . -) (|SparseUnivariatePolynomial| %)
              (35 . |zeroOf|) (40 . *) (|Factored| %) (46 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 26) (|:| |factor| 17) (|:| |exponent| 12))
              (|List| 27) (|Factored| 17) (51 . |factorList|) (56 . |sqrt|)
              (|Integer|) (61 . |elt|) (67 . |degree|) (|Boolean|) (72 . ~=)
              (78 . |Zero|) (82 . |coefficient|) (88 . /) (94 . -)
              (99 . |my_sqrt|) (|SparseMultivariatePolynomial| 6 (|Kernel| 7))
              (104 . |One|) (|Fraction| 32) (108 . /) (114 . ^)
              (120 . |my_root3|) (|Union| 32 '"failed")
              (|ElementaryFunctionSign| 6 7) (125 . |sign|) (130 . +) (136 . -)
              (142 . |coerce|) (|PositiveInteger|) (147 . *) (153 . ^)
              (159 . *) (165 . *) (171 . +) (177 . ^) (|List| 17)
              (183 . |second|) (|Record| (|:| |real| 7) (|:| |imag| 7))
              (|Record| (|:| |reals| (|List| 7)) (|:| |complexes| (|List| 63)))
              (|Union| 64 '"failed") (188 . |quartic2|)
              (194 . |leadingCoefficient|) (199 . |One|) (203 . /)
              (209 . |One|) (213 . |eval|) (220 . |reductum|) (225 . |ground?|)
              (230 . |ground|) (235 . |Zero|) (239 . =) (|Union| % '"failed")
              (245 . |exquo|) (|AlgebraicManipulations| 6 7) (251 . |rootSimp|)
              |ROOTUT;complex_roots;SupU;15|)
           '#(|quartic2| 256 |my_sqrt| 262 |my_root3| 267 |complex_roots| 272)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complex_roots|
                                 ((|Union|
                                   (|Record| (|:| |reals| (|List| |#2|))
                                             (|:| |complexes|
                                                  (|List|
                                                   (|Record| (|:| |real| |#2|)
                                                             (|:| |imag|
                                                                  |#2|)))))
                                   "failed")
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|quartic2|
                                 ((|Union|
                                   (|Record| (|:| |reals| (|List| |#2|))
                                             (|:| |complexes|
                                                  (|List|
                                                   (|Record| (|:| |real| |#2|)
                                                             (|:| |imag|
                                                                  |#2|)))))
                                   "failed")
                                  (|SparseUnivariatePolynomial| |#2|) |#2|))
                                T)
                              '((|my_sqrt| (|#2| |#2|)) T)
                              '((|my_root3| (|#2| |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 81
                                            '(0 8 0 9 2 13 11 7 12 14 0 6 0 15
                                              0 7 0 16 2 17 0 7 12 18 1 17 0 7
                                              19 2 17 0 0 0 20 1 7 0 21 22 2 7
                                              0 0 0 23 1 17 24 0 25 1 29 28 0
                                              30 1 7 0 0 31 2 28 27 0 32 33 1
                                              17 12 0 34 2 12 35 0 0 36 0 6 0
                                              37 2 17 7 0 12 38 2 7 0 0 0 39 1
                                              7 0 0 40 1 0 7 7 41 0 42 0 43 2
                                              44 0 32 32 45 2 7 0 0 44 46 1 0 7
                                              7 47 1 49 48 7 50 2 7 0 0 0 51 2
                                              7 0 0 0 52 1 7 0 32 53 2 7 0 54 0
                                              55 2 17 0 0 54 56 2 17 0 54 0 57
                                              2 17 0 7 0 58 2 17 0 0 0 59 2 7 0
                                              0 54 60 1 61 17 0 62 2 0 65 17 7
                                              66 1 17 7 0 67 0 17 0 68 2 17 0 0
                                              7 69 0 44 0 70 3 17 0 0 8 0 71 1
                                              17 0 0 72 1 17 35 0 73 1 17 7 0
                                              74 0 7 0 75 2 7 35 0 0 76 2 17 77
                                              0 0 78 1 79 7 7 80 2 0 65 17 7 66
                                              1 0 7 7 41 1 0 7 7 47 1 0 65 17
                                              81)))))
           '|lookupComplete|)) 
