
(SDEFUN |INTDEN;li_factors|
        ((|df| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                     (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
        (SPROG
         ((|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|dummy| (|SingletonAsOrderedSet|)) (|u0| (F)) (|fac| NIL)
          (#2=#:G121 NIL) (|f1| #1#) (|deg1| (|NonNegativeInteger|))
          (|rsum| (F)) (#3=#:G122 NIL) (#4=#:G123 NIL) (|vlst| (|List| F))
          (#5=#:G124 NIL) (#6=#:G125 NIL) (|dvvec| (|Vector| F))
          (#7=#:G126 NIL) (|kk| NIL) (#8=#:G127 NIL) (|ulst| (|List| F))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|cd|
           (|Record| (|:| |num| (|List| (|Integer|)))
                     (|:| |den| #9=(|Integer|))))
          (|d| #9#) (#10=#:G120 NIL) (#11=#:G128 NIL) (#12=#:G130 NIL)
          (|ui| NIL) (#13=#:G129 NIL) (|u1| (F)) (#14=#:G131 NIL) (|ki| NIL)
          (#15=#:G133 NIL) (|c| NIL) (#16=#:G132 NIL) (|k2| (F))
          (|f2| (|SparseUnivariatePolynomial| F))
          (|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (LETT |lfac|
                (SPADCALL (SPADCALL |df| (QREFELT % 11)) (QREFELT % 15)))
          (LETT |res| NIL) (LETT |dummy| (SPADCALL (QREFELT % 17)))
          (LETT |vlst| NIL)
          (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT % 20)) 1 (QREFELT % 22)))
          (SEQ (LETT |fac| NIL) (LETT #2# |lfac|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |f1| (QVELT |fac| 1))
                      (LETT |f1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f1| (QREFELT % 23))
                                       (QREFELT % 24))
                             |f1| (QREFELT % 25)))
                      (LETT |deg1| (SPADCALL |f1| (QREFELT % 27)))
                      (EXIT
                       (COND
                        ((EQL |deg1| 0)
                         (PROGN (LETT #10# |$NoValue|) (GO #17=#:G47)))
                        ((SPADCALL
                          (CONS #'|INTDEN;li_factors!0| (VECTOR % |x|))
                          (SPADCALL |f1| (QREFELT % 34)) (QREFELT % 36))
                         (LETT |res|
                               (CONS
                                (VECTOR |f1| |f1| |u0| (|spadConstant| % 31) 1)
                                |res|)))
                        ((NULL |lk|) (PROGN (LETT #10# |$NoValue|) (GO #17#)))
                        ('T
                         (SEQ
                          (LETT |rsum|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |deg1| (QREFELT % 37))
                                           (QREFELT % 24))
                                 (SPADCALL |f1| (- |deg1| 1) (QREFELT % 40))
                                 (QREFELT % 41)))
                          (COND
                           ((> |deg1| 1)
                            (LETT |f2|
                                  (SPADCALL |f1| |dummy|
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 39) 1
                                                       (QREFELT % 42))
                                             (SPADCALL |rsum| (QREFELT % 43))
                                             (QREFELT % 44))
                                            (QREFELT % 45)))))
                          (COND
                           ((> |deg1| 1)
                            (COND
                             ((NULL
                               (SPADCALL
                                (CONS #'|INTDEN;li_factors!1| (VECTOR % |x|))
                                (SPADCALL |f2| (QREFELT % 34)) (QREFELT % 36)))
                              (EXIT
                               (PROGN (LETT #10# |$NoValue|) (GO #17#)))))))
                          (COND
                           ((NULL |vlst|)
                            (SEQ
                             (LETT |vlst|
                                   (PROGN
                                    (LETT #3# NIL)
                                    (SEQ (LETT |kk| NIL) (LETT #4# |lk|) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |kk| (CAR #4#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (COND
                                                   ((SPADCALL |kk| '|log|
                                                              (QREFELT % 46))
                                                    (SPADCALL |kk|
                                                              (QREFELT % 48)))
                                                   ('T
                                                    (SPADCALL
                                                     (SPADCALL |kk|
                                                               (QREFELT % 20))
                                                     1 (QREFELT % 22))))
                                                  #3#))))
                                         (LETT #4# (CDR #4#)) (GO G190) G191
                                         (EXIT (NREVERSE #3#)))))
                             (LETT |dvvec|
                                   (SPADCALL
                                    (PROGN
                                     (LETT #5# NIL)
                                     (SEQ (LETT |c| NIL) (LETT #6# |vlst|) G190
                                          (COND
                                           ((OR (ATOM #6#)
                                                (PROGN
                                                 (LETT |c| (CAR #6#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #5#
                                                  (CONS
                                                   (SPADCALL |c| |x|
                                                             (QREFELT % 30))
                                                   #5#))))
                                          (LETT #6# (CDR #6#)) (GO G190) G191
                                          (EXIT (NREVERSE #5#))))
                                    (QREFELT % 50)))
                             (EXIT
                              (LETT |ulst|
                                    (PROGN
                                     (LETT #7# NIL)
                                     (SEQ (LETT |kk| NIL) (LETT #8# |lk|) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |kk| (CAR #8#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #7#
                                                  (CONS
                                                   (COND
                                                    ((SPADCALL |kk| '|log|
                                                               (QREFELT % 46))
                                                     (SPADCALL
                                                      (SPADCALL |kk|
                                                                (QREFELT % 20))
                                                      1 (QREFELT % 22)))
                                                    ('T
                                                     (SPADCALL |kk|
                                                               (QREFELT %
                                                                        48))))
                                                   #7#))))
                                          (LETT #8# (CDR #8#)) (GO G190) G191
                                          (EXIT (NREVERSE #7#)))))))))
                          (LETT |su|
                                (SPADCALL |dvvec|
                                          (SPADCALL |rsum| |x| (QREFELT % 30))
                                          (QREFELT % 53)))
                          (EXIT
                           (COND
                            ((QEQCAR |su| 1)
                             (PROGN (LETT #10# |$NoValue|) (GO #17#)))
                            ('T
                             (SEQ (LETT |sv| (QCDR |su|))
                                  (LETT |cd| (SPADCALL |sv| (QREFELT % 57)))
                                  (LETT |d| (QCDR |cd|))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |d| 1 (QREFELT % 58))
                                     (PROGN (LETT #10# |$NoValue|) (GO #17#)))
                                    ('T
                                     (SEQ
                                      (LETT |u1|
                                            (SPADCALL (ELT % 41)
                                                      (PROGN
                                                       (LETT #11# NIL)
                                                       (SEQ (LETT |ki| NIL)
                                                            (LETT #12#
                                                                  (QCAR |cd|))
                                                            (LETT |ui| NIL)
                                                            (LETT #13# |ulst|)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #13#)
                                                                  (PROGN
                                                                   (LETT |ui|
                                                                         (CAR
                                                                          #13#))
                                                                   NIL)
                                                                  (ATOM #12#)
                                                                  (PROGN
                                                                   (LETT |ki|
                                                                         (CAR
                                                                          #12#))
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #11#
                                                                    (CONS
                                                                     (SPADCALL
                                                                      |ui| |ki|
                                                                      (QREFELT
                                                                       % 59))
                                                                     #11#))))
                                                            (LETT #13#
                                                                  (PROG1
                                                                      (CDR
                                                                       #13#)
                                                                    (LETT #12#
                                                                          (CDR
                                                                           #12#))))
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #11#))))
                                                      (QREFELT % 61)))
                                      (LETT |k2|
                                            (SPADCALL (ELT % 62)
                                                      (PROGN
                                                       (LETT #14# NIL)
                                                       (SEQ (LETT |ki| NIL)
                                                            (LETT #15#
                                                                  (QCAR |cd|))
                                                            (LETT |c| NIL)
                                                            (LETT #16# |vlst|)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #16#)
                                                                  (PROGN
                                                                   (LETT |c|
                                                                         (CAR
                                                                          #16#))
                                                                   NIL)
                                                                  (ATOM #15#)
                                                                  (PROGN
                                                                   (LETT |ki|
                                                                         (CAR
                                                                          #15#))
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #14#
                                                                    (CONS
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |ki|
                                                                        (QREFELT
                                                                         % 63))
                                                                       (QREFELT
                                                                        % 64))
                                                                      |c|
                                                                      (QREFELT
                                                                       % 41))
                                                                     #14#))))
                                                            (LETT #16#
                                                                  (PROG1
                                                                      (CDR
                                                                       #16#)
                                                                    (LETT #15#
                                                                          (CDR
                                                                           #15#))))
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #14#))))
                                                      (QREFELT % 61)))
                                      (LETT |f2|
                                            (SPADCALL |f1| |dummy|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (|spadConstant| % 39) 1
                                                        (QREFELT % 42))
                                                       (SPADCALL |k2|
                                                                 (QREFELT %
                                                                          43))
                                                       (QREFELT % 44))
                                                      (QREFELT % 45)))
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (CONS #'|INTDEN;li_factors!2|
                                                (VECTOR % |x|))
                                          (SPADCALL |f2| (QREFELT % 34))
                                          (QREFELT % 36)))
                                        (EXIT (|error| "Impossible 1"))))
                                      (EXIT
                                       (LETT |res|
                                             (CONS
                                              (VECTOR |f1| |f2|
                                                      (SPADCALL
                                                       (SPADCALL |u0| |d|
                                                                 (QREFELT %
                                                                          59))
                                                       |u1| (QREFELT % 41))
                                                      |k2| |d|)
                                              |res|)))))))))))))))))
                #17# (EXIT #10#))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;li_factors!2| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 30)) (|spadConstant| % 31)
                      (QREFELT % 33)))))) 

(SDEFUN |INTDEN;li_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 30)) (|spadConstant| % 31)
                      (QREFELT % 33)))))) 

(SDEFUN |INTDEN;li_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 30)) (|spadConstant| % 31)
                      (QREFELT % 33)))))) 

(SDEFUN |INTDEN;poly_factors|
        ((|df| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                     (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
        (SPROG
         ((|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|dummy| (|SingletonAsOrderedSet|)) (|v0| (F)) (|fac| NIL)
          (#2=#:G196 NIL) (|deg1| (|NonNegativeInteger|)) (|tc| (F)) (|f1| #1#)
          (|lprod| (F)) (#3=#:G197 NIL) (#4=#:G198 NIL) (|vlst| (|List| F))
          (#5=#:G199 NIL) (#6=#:G200 NIL) (|dvvec| (|Vector| F))
          (#7=#:G201 NIL) (|kk| NIL) (#8=#:G202 NIL) (|ulst| (|List| F))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|cd|
           (|Record| (|:| |num| (|List| (|Integer|)))
                     (|:| |den| #9=(|Integer|))))
          (|d| #9#) (#10=#:G203 NIL) (#11=#:G205 NIL) (|ui| NIL)
          (#12=#:G204 NIL) (|u1| (F)) (#13=#:G206 NIL) (|ki| NIL)
          (#14=#:G208 NIL) (|c| NIL) (#15=#:G207 NIL) (|k2| (F))
          (|f2| (|SparseUnivariatePolynomial| F)) (#16=#:G195 NIL)
          (|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (LETT |lfac|
                (SPADCALL (SPADCALL |df| (QREFELT % 11)) (QREFELT % 15)))
          (LETT |res| NIL) (LETT |dummy| (SPADCALL (QREFELT % 17)))
          (LETT |vlst| NIL)
          (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT % 20)) 1 (QREFELT % 22)))
          (SEQ (LETT |fac| NIL) (LETT #2# |lfac|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |f1| (QVELT |fac| 1))
                      (LETT |deg1| (SPADCALL |f1| (QREFELT % 27)))
                      (EXIT
                       (COND
                        ((EQL |deg1| 0)
                         (PROGN (LETT #16# |$NoValue|) (GO #17=#:G135)))
                        ('T
                         (SEQ (LETT |tc| (SPADCALL |f1| 0 (QREFELT % 40)))
                              (EXIT
                               (COND
                                ((SPADCALL |tc| (|spadConstant| % 31)
                                           (QREFELT % 33))
                                 (PROGN (LETT #16# |$NoValue|) (GO #17#)))
                                ('T
                                 (SEQ
                                  (LETT |f1|
                                        (SPADCALL
                                         (SPADCALL |tc| (QREFELT % 24)) |f1|
                                         (QREFELT % 25)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (CONS #'|INTDEN;poly_factors!0|
                                            (VECTOR % |x|))
                                      (SPADCALL |f1| (QREFELT % 34))
                                      (QREFELT % 36))
                                     (LETT |res|
                                           (CONS
                                            (VECTOR |f1| |f1|
                                                    (|spadConstant| % 39) |v0|
                                                    1)
                                            |res|)))
                                    ((NULL |lk|)
                                     (PROGN (LETT #16# |$NoValue|) (GO #17#)))
                                    ('T
                                     (SEQ
                                      (LETT |lprod|
                                            (SPADCALL |f1| (QREFELT % 23)))
                                      (COND
                                       ((NULL |vlst|)
                                        (SEQ
                                         (LETT |vlst|
                                               (PROGN
                                                (LETT #3# NIL)
                                                (SEQ (LETT |kk| NIL)
                                                     (LETT #4# |lk|) G190
                                                     (COND
                                                      ((OR (ATOM #4#)
                                                           (PROGN
                                                            (LETT |kk|
                                                                  (CAR #4#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #3#
                                                             (CONS
                                                              (COND
                                                               ((SPADCALL |kk|
                                                                          '|log|
                                                                          (QREFELT
                                                                           %
                                                                           46))
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           %
                                                                           48)))
                                                               ('T
                                                                (SPADCALL
                                                                 (SPADCALL |kk|
                                                                           (QREFELT
                                                                            %
                                                                            20))
                                                                 1
                                                                 (QREFELT %
                                                                          22))))
                                                              #3#))))
                                                     (LETT #4# (CDR #4#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #3#)))))
                                         (LETT |dvvec|
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #5# NIL)
                                                 (SEQ (LETT |c| NIL)
                                                      (LETT #6# |vlst|) G190
                                                      (COND
                                                       ((OR (ATOM #6#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #6#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #5#
                                                              (CONS
                                                               (SPADCALL |c|
                                                                         |x|
                                                                         (QREFELT
                                                                          %
                                                                          30))
                                                               #5#))))
                                                      (LETT #6# (CDR #6#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #5#))))
                                                (QREFELT % 50)))
                                         (EXIT
                                          (LETT |ulst|
                                                (PROGN
                                                 (LETT #7# NIL)
                                                 (SEQ (LETT |kk| NIL)
                                                      (LETT #8# |lk|) G190
                                                      (COND
                                                       ((OR (ATOM #8#)
                                                            (PROGN
                                                             (LETT |kk|
                                                                   (CAR #8#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #7#
                                                              (CONS
                                                               (COND
                                                                ((SPADCALL |kk|
                                                                           '|log|
                                                                           (QREFELT
                                                                            %
                                                                            46))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |kk|
                                                                   (QREFELT %
                                                                            20))
                                                                  1
                                                                  (QREFELT %
                                                                           22)))
                                                                ('T
                                                                 (SPADCALL |kk|
                                                                           (QREFELT
                                                                            %
                                                                            48))))
                                                               #7#))))
                                                      (LETT #8# (CDR #8#))
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE #7#)))))))))
                                      (LETT |su|
                                            (SPADCALL |dvvec|
                                                      (SPADCALL
                                                       (SPADCALL |lprod| |x|
                                                                 (QREFELT %
                                                                          30))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |deg1|
                                                                   (QREFELT %
                                                                            63))
                                                         (QREFELT % 64))
                                                        |lprod| (QREFELT % 41))
                                                       (QREFELT % 65))
                                                      (QREFELT % 53)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |su| 1)
                                         (PROGN
                                          (LETT #16# |$NoValue|)
                                          (GO #17#)))
                                        ('T
                                         (SEQ (LETT |sv| (QCDR |su|))
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT % 57)))
                                              (LETT |d| (QCDR |cd|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT % 58))
                                                 (PROGN
                                                  (LETT #16# |$NoValue|)
                                                  (GO #17#)))
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT % 41)
                                                                  (PROGN
                                                                   (LETT #10#
                                                                         NIL)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL)
                                                                    (LETT #11#
                                                                          (QCAR
                                                                           |cd|))
                                                                    (LETT |ui|
                                                                          NIL)
                                                                    (LETT #12#
                                                                          |ulst|)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #12#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ui|
                                                                         (CAR
                                                                          #12#))
                                                                        NIL)
                                                                       (ATOM
                                                                        #11#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #11#))
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT
                                                                       #10#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |ui|
                                                                         |ki|
                                                                         (QREFELT
                                                                          %
                                                                          59))
                                                                        #10#))))
                                                                    (LETT #12#
                                                                          (PROG1
                                                                              (CDR
                                                                               #12#)
                                                                            (LETT
                                                                             #11#
                                                                             (CDR
                                                                              #11#))))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #10#))))
                                                                  (QREFELT %
                                                                           61)))
                                                  (LETT |k2|
                                                        (SPADCALL (ELT % 62)
                                                                  (PROGN
                                                                   (LETT #13#
                                                                         NIL)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL)
                                                                    (LETT #14#
                                                                          (QCAR
                                                                           |cd|))
                                                                    (LETT |c|
                                                                          NIL)
                                                                    (LETT #15#
                                                                          |vlst|)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #15#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |c|
                                                                         (CAR
                                                                          #15#))
                                                                        NIL)
                                                                       (ATOM
                                                                        #14#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #14#))
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT
                                                                       #13#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |ki|
                                                                           (QREFELT
                                                                            %
                                                                            63))
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         |c|
                                                                         (QREFELT
                                                                          %
                                                                          41))
                                                                        #13#))))
                                                                    (LETT #15#
                                                                          (PROG1
                                                                              (CDR
                                                                               #15#)
                                                                            (LETT
                                                                             #14#
                                                                             (CDR
                                                                              #14#))))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #13#))))
                                                                  (QREFELT %
                                                                           61)))
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT %
                                                                             24))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     % 39)
                                                                    1
                                                                    (QREFELT %
                                                                             42))
                                                                   (QREFELT %
                                                                            25))
                                                                  (QREFELT %
                                                                           45)))
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR % |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT % 34))
                                                      (QREFELT % 36)))
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #16# |$NoValue|)
                                                      (GO #17#)))))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT %
                                                                            62))
                                                                  1)
                                                          |res|)))))))))))))))))))))))))
                #17# (EXIT #16#))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;poly_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 30)) (|spadConstant| % 31)
                      (QREFELT % 33)))))) 

(SDEFUN |INTDEN;poly_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 30)) (|spadConstant| % 31)
                      (QREFELT % 33)))))) 

(SDEFUN |INTDEN;decompose1|
        ((|nn| (|SparseUnivariatePolynomial| F))
         (|elden| (|SparseUnivariatePolynomial| F))
         (|lidens| (|List| (|SparseUnivariatePolynomial| F)))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG ((|res| (|List| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (COND
                 ((> (SPADCALL |elden| (QREFELT % 27)) 0)
                  (LETT |lidens| (CONS |elden| |lidens|)))
                 ((SPADCALL |elden| (|spadConstant| % 66) (QREFELT % 67))
                  (|error| "Impossible 5")))
                (LETT |res| (SPADCALL |nn| |lidens| (QREFELT % 70)))
                (EXIT
                 (COND ((> (SPADCALL |elden| (QREFELT % 27)) 0) |res|)
                       ('T (CONS (|spadConstant| % 71) |res|))))))) 

(SDEFUN |INTDEN;p_power_in_q|
        ((|p| (|SparseMultivariatePolynomial| F (|Kernel| F)))
         (|q| (|SparseMultivariatePolynomial| F (|Kernel| F))) (% (|Integer|)))
        (SPROG
         ((|qq|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F))
                    #1="failed"))
          (#2=#:G218 NIL) (|res| (|Integer|)))
         (SEQ (LETT |res| 0)
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR (LETT |qq| (SPADCALL |q| |p| (QREFELT % 74))) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |q|
                          (PROG2 (LETT #2# |qq|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|SparseMultivariatePolynomial|
                                             (QREFELT % 7)
                                             (|Kernel| (QREFELT % 7)))
                                            (|Union|
                                             (|SparseMultivariatePolynomial|
                                              (QREFELT % 7)
                                              (|Kernel| (QREFELT % 7)))
                                             #1#)
                                            #2#)))
                    (EXIT (LETT |res| (+ |res| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTDEN;MP_to_MPF|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|lk| (|List| (|Kernel| F)))
         (% (|SparseMultivariatePolynomial| F (|Kernel| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|INTDEN;MP_to_MPF!0| (VECTOR % |lk|))
                         (CONS #'|INTDEN;MP_to_MPF!1| %) |p| (QREFELT % 85)))) 

(SDEFUN |INTDEN;MP_to_MPF!1| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 64)) (QREFELT % 80))) 

(SDEFUN |INTDEN;MP_to_MPF!0| ((|k| NIL) ($$ NIL))
        (PROG (|lk| %)
          (LETT |lk| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |k| |lk| (QREFELT % 76))
              (SPADCALL (|spadConstant| % 77) |k| (|spadConstant| % 78)
                        (QREFELT % 79)))
             ('T (SPADCALL (SPADCALL |k| (QREFELT % 48)) (QREFELT % 80)))))))) 

(SDEFUN |INTDEN;solve_u;2FSU;6|
        ((|f1| (F)) (|u| (F)) (|x| (|Symbol|))
         (% (|Union| (|List| (|List| F)) "failed")))
        (SPROG
         ((#1=#:G296 NIL) (#2=#:G297 NIL) (|vk| (|List| #3=(|Kernel| F)))
          (|k1| (|Kernel| F)) (#4=#:G298 NIL) (|k| NIL) (#5=#:G299 NIL)
          (|vk2| (|List| #3#))
          (|df1| #6=(|SparseMultivariatePolynomial| F (|Kernel| F))) (|nu| #6#)
          (|du| #6#) (|degnf| #7=(|NonNegativeInteger|)) (|degdf| #7#)
          (|degnu| #7#) (|degdu| #7#)
          (|qu| (|Union| (|NonNegativeInteger|) "failed")) (|n| (|Integer|))
          (|m| (|Integer|)) (#8=#:G248 NIL)
          (|nup| #9=(|SparseMultivariatePolynomial| F (|Kernel| F)))
          (#10=#:G250 NIL) (|dup| #9#)
          (|ccu|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F)) "failed"))
          (|ccru| (|Union| F "failed")) (|cc| (F)) (|nf1| #6#) (#11=#:G300 NIL)
          (#12=#:G301 NIL) (|coefs| (|List| (|Symbol|))) (#13=#:G302 NIL)
          (|lpow0| (|List| #9#)) (#14=#:G303 NIL) (|pp| #9#)
          (|lpow| (|List| (|SparseMultivariatePolynomial| F (|Kernel| F))))
          (|coef| NIL) (#15=#:G305 NIL) (|p1| NIL) (#16=#:G304 NIL)
          (|eqs| (|SparseMultivariatePolynomial| F (|Kernel| F)))
          (|eqsl| (|List| F)) (|sl0| (|Union| (|List| F) "failed"))
          (|sl| (|List| F)) (#17=#:G306 NIL) (#18=#:G295 NIL) (#19=#:G307 NIL)
          (|j| NIL) (#20=#:G309 NIL) (|c| NIL) (#21=#:G308 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |vk|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |k| NIL) (LETT #2# (SPADCALL |u| (QREFELT % 87)))
                        G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT % 48)) |x|
                                       (QREFELT % 30))
                             (|spadConstant| % 31) (QREFELT % 88))
                            (LETT #1# (CONS |k| #1#))))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (EXIT
             (COND ((NULL |vk|) (|error| "solve_u: constant u"))
                   (#22='T
                    (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT % 89)))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |f1| |x| (QREFELT % 30))
                                      (|spadConstant| % 31) (QREFELT % 33))
                            (CONS 0 (LIST (LIST |f1| (|spadConstant| % 31)))))
                           (#22#
                            (SEQ
                             (LETT |vk2|
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |k| NIL)
                                         (LETT #5#
                                               (SPADCALL |f1| (QREFELT % 87)))
                                         G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |k| (CAR #5#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |k| (QREFELT % 48))
                                               |x| (QREFELT % 30))
                                              (|spadConstant| % 31)
                                              (QREFELT % 88))
                                             (LETT #4# (CONS |k| #4#))))))
                                         (LETT #5# (CDR #5#)) (GO G190) G191
                                         (EXIT (NREVERSE #4#)))))
                             (COND
                              ((NULL (SPADCALL |vk2| |vk| (QREFELT % 90)))
                               (COND
                                ((NULL
                                  (NULL (SPADCALL |vk| |vk2| (QREFELT % 90))))
                                 (EXIT
                                  (PROGN
                                   (LETT #18# (CONS 1 #23="failed"))
                                   (GO #24=#:G294))))))
                              (#22#
                               (EXIT
                                (PROGN (LETT #18# (CONS 1 #23#)) (GO #24#)))))
                             (LETT |nf1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT % 92)) |vk| %))
                             (LETT |df1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT % 93)) |vk| %))
                             (LETT |nu|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT % 92)) |vk| %))
                             (LETT |du|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT % 93)) |vk| %))
                             (LETT |degnf|
                                   (SPADCALL |nf1| |k1| (QREFELT % 94)))
                             (LETT |degdf|
                                   (SPADCALL |df1| |k1| (QREFELT % 94)))
                             (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT % 94)))
                             (LETT |degdu| (SPADCALL |du| |k1| (QREFELT % 94)))
                             (COND
                              ((EQL |degdu| 0)
                               (SEQ (LETT |qu| (|exquo_INT| |degdf| |degnu|))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #18# (CONS 1 "failed"))
                                        (GO #24#)))
                                      (#22#
                                       (SEQ (LETT |n| (QCDR |qu|))
                                            (LETT |qu|
                                                  (|exquo_INT| |degnf|
                                                               |degnu|))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |qu| 1)
                                               (PROGN
                                                (LETT #18# (CONS 1 "failed"))
                                                (GO #24#)))
                                              (#22#
                                               (LETT |m|
                                                     (- (QCDR |qu|)
                                                        |n|)))))))))))
                              ((EQL |degnu| 0)
                               (SEQ (LETT |qu| (|exquo_INT| |degdf| |degdu|))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #18# (CONS 1 "failed"))
                                        (GO #24#)))
                                      (#22#
                                       (SEQ (LETT |m| (QCDR |qu|))
                                            (LETT |qu|
                                                  (|exquo_INT| |degnf|
                                                               |degdu|))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |qu| 1)
                                               (PROGN
                                                (LETT #18# (CONS 1 "failed"))
                                                (GO #24#)))
                                              (#22#
                                               (LETT |n|
                                                     (- (QCDR |qu|)
                                                        |m|)))))))))))
                              (#22#
                               (SEQ
                                (LETT |m| (|INTDEN;p_power_in_q| |du| |df1| %))
                                (LETT |n| (|INTDEN;p_power_in_q| |nu| |df1| %))
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (+ (* |m| |degdu|) (* |n| |degnu|)) |degdf|
                                    (QREFELT % 58))
                                   (PROGN
                                    (LETT #18# (CONS 1 "failed"))
                                    (GO #24#))))))))
                             (LETT |n| (MAX |n| 0)) (LETT |m| (MAX |m| 0))
                             (LETT |nup|
                                   (COND
                                    ((> |n| 0)
                                     (SPADCALL |nu|
                                               (PROG1 (LETT #8# |n|)
                                                 (|check_subtype2| (>= #8# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #8#))
                                               (QREFELT % 95)))
                                    (#22# (|spadConstant| % 77))))
                             (LETT |dup|
                                   (COND
                                    ((> |m| 0)
                                     (SPADCALL |du|
                                               (PROG1 (LETT #10# |m|)
                                                 (|check_subtype2| (>= #10# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #10#))
                                               (QREFELT % 95)))
                                    (#22# (|spadConstant| % 77))))
                             (LETT |ccu|
                                   (SPADCALL |df1|
                                             (SPADCALL |dup| |nup|
                                                       (QREFELT % 96))
                                             (QREFELT % 74)))
                             (EXIT
                              (COND
                               ((QEQCAR |ccu| 1)
                                (PROGN
                                 (LETT #18# (CONS 1 "failed"))
                                 (GO #24#)))
                               (#22#
                                (SEQ
                                 (LETT |ccru|
                                       (SPADCALL (QCDR |ccu|) (QREFELT % 98)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ccru| 1)
                                    (PROGN
                                     (LETT #18# (CONS 1 "failed"))
                                     (GO #24#)))
                                   (#22#
                                    (SEQ (LETT |cc| (QCDR |ccru|))
                                         (LETT |nf1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 39)
                                                          |cc| (QREFELT % 65))
                                                |nf1| (QREFELT % 103)))
                                         (LETT |coefs|
                                               (PROGN
                                                (LETT #11# NIL)
                                                (SEQ (LETT |j| (- |n|))
                                                     (LETT #12# |m|) G190
                                                     (COND
                                                      ((> |j| #12#) (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #11#
                                                             (CONS
                                                              (SPADCALL
                                                               (QREFELT % 104))
                                                              #11#))))
                                                     (LETT |j| (+ |j| 1))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #11#)))))
                                         (LETT |eqs| |nf1|)
                                         (LETT |pp| (|spadConstant| % 77))
                                         (LETT |lpow0| (LIST |pp|))
                                         (SEQ (LETT |j| (- 1 |n|))
                                              (LETT #13# |m|) G190
                                              (COND ((> |j| #13#) (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |nu| |pp|
                                                               (QREFELT % 96)))
                                               (EXIT
                                                (LETT |lpow0|
                                                      (CONS |pp| |lpow0|))))
                                              (LETT |j| (+ |j| 1)) (GO G190)
                                              G191 (EXIT NIL))
                                         (LETT |lpow|
                                               (LIST (|SPADfirst| |lpow0|)))
                                         (LETT |pp| (|spadConstant| % 77))
                                         (SEQ (LETT |p1| NIL)
                                              (LETT #14# (CDR |lpow0|)) G190
                                              (COND
                                               ((OR (ATOM #14#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #14#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |du| |pp|
                                                               (QREFELT % 96)))
                                               (EXIT
                                                (LETT |lpow|
                                                      (CONS
                                                       (SPADCALL |pp| |p1|
                                                                 (QREFELT %
                                                                          96))
                                                       |lpow|))))
                                              (LETT #14# (CDR #14#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (SEQ (LETT |coef| NIL)
                                              (LETT #15# |coefs|)
                                              (LETT |p1| NIL)
                                              (LETT #16# |lpow|) G190
                                              (COND
                                               ((OR (ATOM #16#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #16#))
                                                     NIL)
                                                    (ATOM #15#)
                                                    (PROGN
                                                     (LETT |coef| (CAR #15#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |eqs|
                                                      (SPADCALL |eqs|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |coef|
                                                                  (QREFELT %
                                                                           105))
                                                                 |p1|
                                                                 (QREFELT %
                                                                          103))
                                                                (QREFELT %
                                                                         106)))))
                                              (LETT #16#
                                                    (PROG1 (CDR #16#)
                                                      (LETT #15# (CDR #15#))))
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |eqsl|
                                               (SPADCALL |eqs|
                                                         (QREFELT % 107)))
                                         (LETT |sl0|
                                               (SPADCALL |eqsl| |coefs|
                                                         (QREFELT % 111)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |sl0| 1) (CONS 1 "failed"))
                                           (#22#
                                            (SEQ (LETT |sl| (QCDR |sl0|))
                                                 (SEQ (LETT |c| NIL)
                                                      (LETT #17# |sl|) G190
                                                      (COND
                                                       ((OR (ATOM #17#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #17#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL
                                                           (SPADCALL |c| |x|
                                                                     (QREFELT %
                                                                              30))
                                                           (|spadConstant| %
                                                                           31)
                                                           (QREFELT % 88))
                                                          (PROGN
                                                           (LETT #18#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #24#))))))
                                                      (LETT #17# (CDR #17#))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (CONS 0
                                                        (PROGN
                                                         (LETT #19# NIL)
                                                         (SEQ
                                                          (LETT |j| (- |n|))
                                                          (LETT #20# |m|)
                                                          (LETT |c| NIL)
                                                          (LETT #21# |sl|) G190
                                                          (COND
                                                           ((OR (ATOM #21#)
                                                                (PROGN
                                                                 (LETT |c|
                                                                       (CAR
                                                                        #21#))
                                                                 NIL)
                                                                (> |j| #20#))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (COND
                                                             ((SPADCALL |c|
                                                                        (|spadConstant|
                                                                         % 31)
                                                                        (QREFELT
                                                                         % 88))
                                                              (LETT #19#
                                                                    (CONS
                                                                     (LIST |c|
                                                                           (SPADCALL
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             37)))
                                                                     #19#))))))
                                                          (LETT #21#
                                                                (PROG1
                                                                    (CDR #21#)
                                                                  (LETT |j|
                                                                        (+ |j|
                                                                           1))))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE
                                                            #19#))))))))))))))))))))))))))))
          #24# (EXIT #18#)))) 

(SDEFUN |INTDEN;li_int1|
        ((|f| (F)) (|u| (F)) (|x| (|Symbol|))
         (% (|Union| (|List| (|List| F)) "failed")))
        (SPROG ((|deru| (F)))
               (SEQ (LETT |deru| (SPADCALL |u| |x| (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((SPADCALL |deru| (|spadConstant| % 31) (QREFELT % 33))
                       (|error| "li_int1: constant log"))
                      ('T
                       (SPADCALL (SPADCALL |f| |deru| (QREFELT % 65)) |u| |x|
                                 (QREFELT % 113)))))))) 

(SDEFUN |INTDEN;mk_li|
        ((|c| (F)) (|j| (|Integer|)) (|u| (F)) (|s| (F)) (% (F)))
        (SPROG ((|es| (F)))
               (SEQ
                (COND
                 ((EQL |j| -1)
                  (SPADCALL |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u| (QREFELT % 114)) |s|
                                       (QREFELT % 62))
                             (QREFELT % 114))
                            (QREFELT % 41)))
                 ('T
                  (SEQ (LETT |es| (SPADCALL |s| (QREFELT % 115)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |c|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |u| |es| (QREFELT % 41))
                                     (+ |j| 1) (QREFELT % 59))
                                    (QREFELT % 116))
                                   (QREFELT % 41))
                         (SPADCALL |es| (+ |j| 1) (QREFELT % 59))
                         (QREFELT % 65))))))))) 

(SDEFUN |INTDEN;UP2UPR|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPADCALL (CONS #'|INTDEN;UP2UPR!0| %) |p| (QREFELT % 122))) 

(SDEFUN |INTDEN;UP2UPR!0| ((|x1| NIL) (% NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT % 43)) (QREFELT % 118))) 

(SDEFUN |INTDEN;li_int3|
        ((|f| (F)) (|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (%
          (|Union|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |ir|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F)))))
           "failed")))
        (SPROG
         ((|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
          (#1=#:G360 NIL) (#2=#:G361 NIL)
          (|lidens| (|List| #3=(|SparseUnivariatePolynomial| F)))
          (|elden| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|dn| (|List| (|SparseUnivariatePolynomial| F)))
          (|linums| (|List| (|SparseUnivariatePolynomial| F)))
          (|dummy| (|SingletonAsOrderedSet|)) (|linum| NIL) (#4=#:G363 NIL)
          (|ldr| NIL) (#5=#:G362 NIL) (|liden| #3#)
          (|cfac| (|SparseUnivariatePolynomial| F)) (|u1| (F))
          (|deg1| (|NonNegativeInteger|)) (|rfc| (F)) (|rf1| (F)) (|ddf| (F))
          (|c_shift| (F)) (|tf| (F))
          (|liu| (|Union| (|List| (|List| F)) "failed")) (#6=#:G359 NIL)
          (|lli| (|List| (|List| F)))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|rf1k| (|Kernel| F)) (|zzl| (|List| F)) (|e| NIL) (#7=#:G364 NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F)))))))
          (|lle| (F)) (|zz| NIL) (#8=#:G365 NIL) (|res| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;li_factors| (SPADCALL |rf| (QREFELT % 123)) |k| |lk|
                   |x| %))
            (LETT |lidens|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |ldr| NIL) (LETT #2# |ldrs|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |ldr| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS (QVELT |ldr| 0) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (EXIT
             (COND ((NULL |lidens|) (CONS 1 "failed"))
                   (#9='T
                    (SEQ
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT % 123))
                                     (SPADCALL (ELT % 124) |lidens|
                                               (QREFELT % 126))
                                     (QREFELT % 127)))
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                            (#9#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT % 128))
                                     (QCDR |elden|) |lidens| %))
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT % 129)))
                              (LETT |linums| (CDR |dn|))
                              (LETT |dummy| (SPADCALL (QREFELT % 17)))
                              (LETT |res| (|spadConstant| % 31))
                              (LETT |logs| NIL)
                              (SEQ (LETT |linum| NIL) (LETT #4# |linums|)
                                   (LETT |ldr| NIL) (LETT #5# |ldrs|) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |ldr| (CAR #5#)) NIL)
                                         (ATOM #4#)
                                         (PROGN (LETT |linum| (CAR #4#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |liden| (QVELT |ldr| 0))
                                        (LETT |cfac| (QVELT |ldr| 1))
                                        (LETT |u1| (QVELT |ldr| 2))
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |liden|
                                                         (QREFELT % 27)))
                                         (EXIT
                                          (COND
                                           ((> |deg1| 1)
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT % 131)))
                                             (LETT |c_shift|
                                                   (SPADCALL |rfc|
                                                             (QREFELT % 132)))
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 3)
                                                             (QREFELT % 133)))
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |liden|
                                                               (QREFELT % 134))
                                                     |dummy| |rf1|
                                                     (QREFELT % 135))
                                                    (QREFELT % 136)))
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |linum| |dummy|
                                                                |rf1|
                                                                (QREFELT %
                                                                         135))
                                                      (QREFELT % 136))
                                                     |ddf| (QREFELT % 65))))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 0
                                                             (QREFELT % 40)))
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |linum|
                                                              (QREFELT %
                                                                       136)))))))))
                                        (LETT |liu|
                                              (|INTDEN;li_int1| |tf| |u1| |x|
                                               %))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |liu| 1)
                                           (PROGN
                                            (LETT #6# (CONS 1 "failed"))
                                            (GO #10=#:G358)))
                                          ('T
                                           (SEQ (LETT |lli| (QCDR |liu|))
                                                (COND
                                                 ((EQL (LENGTH |lli|) 1)
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |lli| 1
                                                                (QREFELT %
                                                                         138))
                                                      2 (QREFELT % 22))
                                                     (SPADCALL
                                                      (|spadConstant| % 39)
                                                      (QREFELT % 132))
                                                     (QREFELT % 33))
                                                    (EXIT
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (LETT |logs|
                                                             (CONS
                                                              (VECTOR
                                                               (|spadConstant|
                                                                % 101)
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  % 139)
                                                                 1
                                                                 (QREFELT %
                                                                          140))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |lli| 1
                                                                     (QREFELT %
                                                                              138))
                                                                    1
                                                                    (QREFELT %
                                                                             22))
                                                                   (QREFELT %
                                                                            43))
                                                                  (QREFELT %
                                                                           118))
                                                                 (QREFELT %
                                                                          141))
                                                                (QREFELT %
                                                                         142))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |liden|
                                                                 (QREFELT %
                                                                          118))
                                                                (QREFELT %
                                                                         141)))
                                                              |logs|)))
                                                      ('T
                                                       (LETT |elpart|
                                                             (SPADCALL |elpart|
                                                                       (SPADCALL
                                                                        |linum|
                                                                        |liden|
                                                                        (QREFELT
                                                                         %
                                                                         129))
                                                                       (QREFELT
                                                                        %
                                                                        143))))))))))
                                                (COND
                                                 ((> |deg1| 1)
                                                  (SEQ
                                                   (LETT |rf1k|
                                                         (SPADCALL |rfc|
                                                                   (QREFELT %
                                                                            144)))
                                                   (EXIT
                                                    (LETT |zzl|
                                                          (SPADCALL |cfac|
                                                                    (QREFELT %
                                                                             146)))))))
                                                (EXIT
                                                 (SEQ (LETT |e| NIL)
                                                      (LETT #7# |lli|) G190
                                                      (COND
                                                       ((OR (ATOM #7#)
                                                            (PROGN
                                                             (LETT |e|
                                                                   (CAR #7#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (COND
                                                        ((SPADCALL
                                                          (SPADCALL |e| 2
                                                                    (QREFELT %
                                                                             22))
                                                          (SPADCALL
                                                           (|spadConstant| %
                                                                           39)
                                                           (QREFELT % 132))
                                                          (QREFELT % 33))
                                                         (COND
                                                          ((EQL |deg1| 1)
                                                           (EXIT
                                                            (LETT |logs|
                                                                  (CONS
                                                                   (VECTOR
                                                                    (|spadConstant|
                                                                     % 101)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       % 139)
                                                                      1
                                                                      (QREFELT
                                                                       % 140))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |e| 1
                                                                         (QREFELT
                                                                          %
                                                                          22))
                                                                        (QREFELT
                                                                         % 43))
                                                                       (QREFELT
                                                                        % 118))
                                                                      (QREFELT
                                                                       % 141))
                                                                     (QREFELT %
                                                                              142))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |liden|
                                                                      (QREFELT
                                                                       % 118))
                                                                     (QREFELT %
                                                                              141)))
                                                                   |logs|)))))))
                                                       (LETT |lle|
                                                             (|INTDEN;mk_li|
                                                              (SPADCALL |e| 1
                                                                        (QREFELT
                                                                         % 22))
                                                              (SPADCALL
                                                               (SPADCALL |e| 2
                                                                         (QREFELT
                                                                          %
                                                                          22))
                                                               (QREFELT % 147))
                                                              |u1| |c_shift|
                                                              %))
                                                       (EXIT
                                                        (COND
                                                         ((> |deg1| 1)
                                                          (SEQ (LETT |zz| NIL)
                                                               (LETT #8# |zzl|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #8#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |zz|
                                                                       (CAR
                                                                        #8#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT |res|
                                                                       (SPADCALL
                                                                        |res|
                                                                        (SPADCALL
                                                                         |lle|
                                                                         |rf1k|
                                                                         |zz|
                                                                         (QREFELT
                                                                          %
                                                                          148))
                                                                        (QREFELT
                                                                         %
                                                                         62)))))
                                                               (LETT #8#
                                                                     (CDR #8#))
                                                               (GO G190) G191
                                                               (EXIT NIL)))
                                                         ('T
                                                          (LETT |res|
                                                                (SPADCALL |res|
                                                                          |lle|
                                                                          (QREFELT
                                                                           %
                                                                           62)))))))
                                                      (LETT #7# (CDR #7#))
                                                      (GO G190) G191
                                                      (EXIT NIL))))))))
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #4# (CDR #4#))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (CONS 0
                                     (VECTOR
                                      (SPADCALL (SPADCALL |res| (QREFELT % 43))
                                                (QREFELT % 118))
                                      |elpart|
                                      (SPADCALL (|spadConstant| % 149) |logs|
                                                NIL
                                                (QREFELT % 155)))))))))))))))
          #10# (EXIT #6#)))) 

(SDEFUN |INTDEN;mk_poly|
        ((|c| (F)) (|j| (|Integer|)) (|u| (F)) (|s| (F)) (% (F)))
        (SPROG
         ((|eu| (F)) (|j1| (|Integer|)) (|i| NIL) (#1=#:G371 NIL)
          (|i1| (|Integer|)) (|res| (F)) (|ifac| (F)))
         (SEQ
          (COND
           ((EQL |j| 0)
            (SPADCALL |c|
                      (SPADCALL |u|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |u| (QREFELT % 115))
                                           (SPADCALL (|spadConstant| % 39) |s|
                                                     (QREFELT % 65))
                                           (QREFELT % 62))
                                 (QREFELT % 114))
                                (QREFELT % 133))
                      (QREFELT % 41)))
           ('T
            (SEQ
             (LETT |eu|
                   (SPADCALL |s| (SPADCALL |u| (QREFELT % 115))
                             (QREFELT % 41)))
             (LETT |j1| (+ |j| 1))
             (LETT |res|
                   (SPADCALL (SPADCALL |u| |j1| (QREFELT % 59))
                             (SPADCALL (SPADCALL |j1| (QREFELT % 63))
                                       (QREFELT % 64))
                             (QREFELT % 65)))
             (LETT |res|
                   (SPADCALL |res|
                             (SPADCALL (SPADCALL |u| |j| (QREFELT % 59))
                                       (SPADCALL
                                        (SPADCALL |eu| (|spadConstant| % 39)
                                                  (QREFELT % 62))
                                        (QREFELT % 114))
                                       (QREFELT % 41))
                             (QREFELT % 133)))
             (LETT |ifac|
                   (SPADCALL
                    (SPADCALL (SPADCALL |j| (QREFELT % 63)) (QREFELT % 64))
                    (QREFELT % 132)))
             (SEQ (LETT |i| 1) (LETT #1# |j|) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |i1| (- |j| |i|))
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL
                                        (SPADCALL |ifac|
                                                  (SPADCALL |u| |i1|
                                                            (QREFELT % 59))
                                                  (QREFELT % 41))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (+ |i| 1) (QREFELT % 63))
                                          (QREFELT % 64))
                                         (SPADCALL |eu| (QREFELT % 132))
                                         (QREFELT % 156))
                                        (QREFELT % 41))
                                       (QREFELT % 62)))
                       (EXIT
                        (LETT |ifac|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |i1| (QREFELT % 63))
                                          (QREFELT % 64))
                                |ifac| (QREFELT % 41))
                               (QREFELT % 132)))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |c| |res| (QREFELT % 41))))))))) 

(SDEFUN |INTDEN;poly_int3|
        ((|f| (F)) (|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (%
          (|Union|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |ir|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F)))))
           "failed")))
        (SPROG
         ((|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
          (#1=#:G406 NIL) (#2=#:G407 NIL)
          (|polydens| (|List| #3=(|SparseUnivariatePolynomial| F)))
          (#4=#:G408 NIL) (|p| NIL) (#5=#:G409 NIL)
          (|polydens1| (|List| #6=(|SparseUnivariatePolynomial| F)))
          (|elden| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|dn| (|List| (|SparseUnivariatePolynomial| F)))
          (|polynums1| (|List| (|SparseUnivariatePolynomial| F)))
          (|dummy| (|SingletonAsOrderedSet|))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F)))))))
          (|polynum1| NIL) (#7=#:G411 NIL) (|ldr| NIL) (#8=#:G410 NIL)
          (|polyden| #3#) (|cfac| (|SparseUnivariatePolynomial| F)) (|v1| (F))
          (|polynum| #6#) (|deg1| (|NonNegativeInteger|)) (|rfc| (F))
          (|rf1| (F)) (|ddf| (F)) (|c_shift| (F)) (|tf| (F))
          (|polyu| (|Union| (|List| (|List| F)) "failed"))
          (|lpoly| (|List| (|List| F)))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|rf1k| (|Kernel| F)) (|zzl| (|List| F)) (|e| NIL) (#9=#:G412 NIL)
          (|ii| (|Integer|)) (#10=#:G405 NIL) (#11=#:G404 NIL) (|lle| (F))
          (|zz| NIL) (#12=#:G413 NIL) (|res| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;poly_factors| (SPADCALL |rf| (QREFELT % 123)) |k|
                   |lk| |x| %))
            (LETT |polydens|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |ldr| NIL) (LETT #2# |ldrs|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |ldr| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS (QVELT |ldr| 0) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (EXIT
             (COND ((NULL |polydens|) (CONS 1 "failed"))
                   (#13='T
                    (SEQ
                     (LETT |polydens1|
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |p| NIL) (LETT #5# |polydens|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |p| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT % 23))
                                            (QREFELT % 24))
                                           |p| (QREFELT % 25))
                                          #4#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT % 123))
                                     (SPADCALL (ELT % 124) |polydens1|
                                               (QREFELT % 126))
                                     (QREFELT % 127)))
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                            (#13#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT % 128))
                                     (QCDR |elden|) |polydens1| %))
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT % 129)))
                              (LETT |polynums1| (CDR |dn|))
                              (LETT |dummy| (SPADCALL (QREFELT % 17)))
                              (LETT |res| (|spadConstant| % 31))
                              (LETT |logs| NIL)
                              (SEQ (LETT |polynum1| NIL) (LETT #7# |polynums1|)
                                   (LETT |ldr| NIL) (LETT #8# |ldrs|) G190
                                   (COND
                                    ((OR (ATOM #8#)
                                         (PROGN (LETT |ldr| (CAR #8#)) NIL)
                                         (ATOM #7#)
                                         (PROGN
                                          (LETT |polynum1| (CAR #7#))
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |polyden| (QVELT |ldr| 0))
                                        (LETT |cfac| (QVELT |ldr| 1))
                                        (LETT |v1| (QVELT |ldr| 3))
                                        (LETT |polynum|
                                              (SPADCALL
                                               (SPADCALL |polyden|
                                                         (QREFELT % 23))
                                               |polynum1| (QREFELT % 25)))
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |polyden|
                                                         (QREFELT % 27)))
                                         (EXIT
                                          (COND
                                           ((> |deg1| 1)
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT % 131)))
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 2)
                                                             (QREFELT % 65)))
                                             (LETT |c_shift|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|spadConstant| % 39)
                                                     |rfc| (QREFELT % 65))
                                                    (QREFELT % 132)))
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |cfac|
                                                               (QREFELT % 134))
                                                     |dummy| |rfc|
                                                     (QREFELT % 135))
                                                    (QREFELT % 136)))
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |polynum|
                                                                 |dummy| |rf1|
                                                                 (QREFELT %
                                                                          135))
                                                       (QREFELT % 136))
                                                      (SPADCALL |rfc| |ddf|
                                                                (QREFELT % 41))
                                                      (QREFELT % 65))
                                                     (QREFELT % 132))))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 1
                                                             (QREFELT % 40)))
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |polynum|
                                                              (QREFELT %
                                                                       136)))))))))
                                        (LETT |polyu|
                                              (|INTDEN;li_int1| |tf| |v1| |x|
                                               %))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |polyu| 1)
                                           (PROGN
                                            (LETT #10# (CONS 1 "failed"))
                                            (GO #14=#:G403)))
                                          ('T
                                           (SEQ (LETT |lpoly| (QCDR |polyu|))
                                                (COND
                                                 ((EQL (LENGTH |lpoly|) 1)
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |lpoly| 1
                                                                (QREFELT %
                                                                         138))
                                                      2 (QREFELT % 22))
                                                     (|spadConstant| % 31)
                                                     (QREFELT % 33))
                                                    (EXIT
                                                     (LETT |elpart|
                                                           (SPADCALL |elpart|
                                                                     (SPADCALL
                                                                      |polynum|
                                                                      |polyden|
                                                                      (QREFELT
                                                                       % 129))
                                                                     (QREFELT %
                                                                              143))))))))
                                                (COND
                                                 ((> |deg1| 1)
                                                  (SEQ
                                                   (LETT |rf1k|
                                                         (SPADCALL |rfc|
                                                                   (QREFELT %
                                                                            144)))
                                                   (EXIT
                                                    (LETT |zzl|
                                                          (SPADCALL |cfac|
                                                                    (QREFELT %
                                                                             146)))))))
                                                (EXIT
                                                 (SEQ (LETT |e| NIL)
                                                      (LETT #9# |lpoly|) G190
                                                      (COND
                                                       ((OR (ATOM #9#)
                                                            (PROGN
                                                             (LETT |e|
                                                                   (CAR #9#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ
                                                         (LETT |ii|
                                                               (SPADCALL
                                                                (SPADCALL |e| 2
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                (QREFELT %
                                                                         147)))
                                                         (EXIT
                                                          (COND
                                                           ((< |ii| 0)
                                                            (PROGN
                                                             (LETT #10#
                                                                   (CONS 1
                                                                         "failed"))
                                                             (GO #14#)))
                                                           ((SPADCALL
                                                             (SPADCALL |e| 1
                                                                       (QREFELT
                                                                        % 22))
                                                             (|spadConstant| %
                                                                             31)
                                                             (QREFELT % 33))
                                                            (PROGN
                                                             (LETT #11#
                                                                   |$NoValue|)
                                                             (GO #15=#:G389)))
                                                           ('T
                                                            (SEQ
                                                             (LETT |lle|
                                                                   (|INTDEN;mk_poly|
                                                                    (SPADCALL
                                                                     |e| 1
                                                                     (QREFELT %
                                                                              22))
                                                                    |ii| |v1|
                                                                    |c_shift|
                                                                    %))
                                                             (EXIT
                                                              (COND
                                                               ((> |deg1| 1)
                                                                (SEQ
                                                                 (LETT |zz|
                                                                       NIL)
                                                                 (LETT #12#
                                                                       |zzl|)
                                                                 G190
                                                                 (COND
                                                                  ((OR
                                                                    (ATOM #12#)
                                                                    (PROGN
                                                                     (LETT |zz|
                                                                           (CAR
                                                                            #12#))
                                                                     NIL))
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (LETT |res|
                                                                         (SPADCALL
                                                                          |res|
                                                                          (SPADCALL
                                                                           |lle|
                                                                           |rf1k|
                                                                           |zz|
                                                                           (QREFELT
                                                                            %
                                                                            148))
                                                                          (QREFELT
                                                                           %
                                                                           62)))))
                                                                 (LETT #12#
                                                                       (CDR
                                                                        #12#))
                                                                 (GO G190) G191
                                                                 (EXIT NIL)))
                                                               ('T
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       |res|
                                                                       |lle|
                                                                       (QREFELT
                                                                        %
                                                                        62))))))))))))
                                                       #15# (EXIT #11#))
                                                      (LETT #9# (CDR #9#))
                                                      (GO G190) G191
                                                      (EXIT NIL))))))))
                                   (LETT #8#
                                         (PROG1 (CDR #8#)
                                           (LETT #7# (CDR #7#))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (CONS 0
                                     (VECTOR
                                      (SPADCALL (SPADCALL |res| (QREFELT % 43))
                                                (QREFELT % 118))
                                      |elpart|
                                      (SPADCALL (|spadConstant| % 149) |logs|
                                                NIL
                                                (QREFELT % 155)))))))))))))))
          #14# (EXIT #10#)))) 

(SDEFUN |INTDEN;li_int;FKSR;13|
        ((|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|Record|
           (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction| (|SparseUnivariatePolynomial| F)))))))
        (SPROG
         ((|f| (F)) (#1=#:G421 NIL) (|kk| NIL) (#2=#:G422 NIL)
          (|lk| (|List| (|Kernel| F)))
          (|res|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            "failed")))
         (SEQ (LETT |f| (SPADCALL |rf| |k| (QREFELT % 158)))
              (LETT |lk|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |kk| NIL)
                           (LETT #2# (SPADCALL |f| (QREFELT % 159))) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |kk| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((COND ((SPADCALL |kk| '|exp| (QREFELT % 46)) 'T)
                                     ((SPADCALL |kk| '|log| (QREFELT % 46))
                                      (SPADCALL |kk| |k| (QREFELT % 160)))
                                     (#3='T NIL))
                               (LETT #1# (CONS |kk| #1#))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     |x| (QREFELT % 162)))
              (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| %))
              (EXIT
               (COND
                ((QEQCAR |res| 1)
                 (VECTOR (|spadConstant| % 149) |rf| (|spadConstant| % 163)))
                (#3# (QCDR |res|))))))) 

(SDEFUN |INTDEN;poly_int;FKSR;14|
        ((|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|Record|
           (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction| (|SparseUnivariatePolynomial| F)))))))
        (SPROG
         ((|f| (F)) (#1=#:G429 NIL) (|kk| NIL) (#2=#:G430 NIL)
          (|lk| (|List| (|Kernel| F)))
          (|res|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            "failed")))
         (SEQ (LETT |f| (SPADCALL |rf| |k| (QREFELT % 158)))
              (LETT |lk|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |kk| NIL)
                           (LETT #2# (SPADCALL |f| (QREFELT % 159))) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |kk| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((COND ((SPADCALL |kk| '|exp| (QREFELT % 46)) 'T)
                                     ((SPADCALL |kk| '|log| (QREFELT % 46))
                                      (SPADCALL |kk| |k| (QREFELT % 160)))
                                     (#3='T NIL))
                               (LETT #1# (CONS |kk| #1#))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     |x| (QREFELT % 162)))
              (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| %))
              (EXIT
               (COND
                ((QEQCAR |res| 1)
                 (VECTOR (|spadConstant| % 149) |rf| (|spadConstant| % 163)))
                (#3# (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |DenominatorIntegration;|)) 

(DEFUN |DenominatorIntegration;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|DenominatorIntegration| DV$1 DV$2))
          (LETT % (GETREFV 167))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DenominatorIntegration|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |DenominatorIntegration| (&REST #1=#:G431)
  (SPROG NIL
         (PROG (#2=#:G432)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DenominatorIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DenominatorIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DenominatorIntegration|)))))))))) 

(MAKEPROP '|DenominatorIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 9) (|SparseUnivariatePolynomial| 7)
              (|ExpressionFactorPolynomial| 6 7) (0 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 12) (|:| |factor| 9) (|:| |exponent| 26))
              (|List| 13) (5 . |factorList|) (|SingletonAsOrderedSet|)
              (10 . |create|) (|List| 7) (|Kernel| 7) (14 . |argument|)
              (|Integer|) (19 . |elt|) (25 . |leadingCoefficient|) (30 . |inv|)
              (35 . *) (|NonNegativeInteger|) (41 . |degree|) (46 . |0|)
              (|Symbol|) (50 . D) (56 . |0|) (|Boolean|) (60 . =)
              (66 . |coefficients|) (|Mapping| 32 7) (71 . |every?|)
              (77 . |coerce|) (82 . |1|) (86 . |1|) (90 . |coefficient|)
              (96 . *) (102 . |monomial|) (108 . |coerce|) (113 . -)
              (119 . |eval|) (126 . |is?|) (|Kernel| %) (132 . |coerce|)
              (|Vector| 7) (137 . |vector|) (|Union| 55 '"failed")
              (|IntegerLinearDependence| 7) (142 . |particularSolutionOverQ|)
              (|Record| (|:| |num| (|List| 21)) (|:| |den| 21)) (|Vector| 100)
              (|InnerCommonDenominator| 21 100 (|List| 21) 55)
              (148 . |splitDenominator|) (153 . ~=) (159 . ^) (|Mapping| 7 7 7)
              (165 . |reduce|) (171 . +) (177 . |coerce|) (182 . |coerce|)
              (187 . /) (193 . |1|) (197 . ~=) (|List| 9)
              (|PartialFractionUtilities| 7 9) (203 . |decompose|) (209 . |0|)
              (|Union| % '"failed") (|SparseMultivariatePolynomial| 7 19)
              (213 . |exquo|) (|List| 19) (219 . |member?|) (225 . |1|)
              (229 . |1|) (233 . |monomial|) (240 . |coerce|) (|Mapping| 73 19)
              (|Mapping| 73 6) (|SparseMultivariatePolynomial| 6 19)
              (|PolynomialCategoryLifting| (|IndexedExponents| 19) 19 6 83 73)
              (245 . |map|) (|List| 47) (252 . |kernels|) (257 . ~=)
              (263 . |last|) (268 . |setDifference|)
              (|SparseMultivariatePolynomial| 6 47) (274 . |numer|)
              (279 . |denom|) (284 . |degree|) (290 . ^) (296 . *)
              (|Union| 7 '"failed") (302 . |retractIfCan|) (307 . /)
              (|Fraction| 21) (313 . |1|) (317 . |1|) (321 . *) (327 . |new|)
              (331 . |coerce|) (336 . -) (342 . |coefficients|)
              (|Union| 18 '"failed") (|List| 29) (|ExpressionLinearSolve| 6 7)
              (347 . |lin_sol|) (|Union| 137 '"failed") |INTDEN;solve_u;2FSU;6|
              (353 . |log|) (358 . |exp|) (363 . |li|) (|Fraction| 9)
              (368 . |coerce|) (|SparseUnivariatePolynomial| 117)
              (|Mapping| 117 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 9 117 119)
              (373 . |map|) (379 . |denom|) (384 . *) (|Mapping| 9 9 9)
              (390 . |reduce|) (396 . |exquo|) (402 . |numer|) (407 . /)
              (|SparseUnivariatePolynomial| %) (413 . |rootOf|) (418 . -)
              (423 . -) (429 . |differentiate|) (434 . |eval|)
              (441 . |retract|) (|List| 18) (446 . |elt|) (452 . |1|)
              (456 . |monomial|) (462 . |coerce|) (467 . -) (473 . +)
              (479 . |retract|) (|List| %) (484 . |zerosOf|) (489 . |retract|)
              (494 . |eval|) (501 . |0|)
              (|Record| (|:| |scalar| 100) (|:| |coeff| 119)
                        (|:| |logand| 119))
              (|List| 150) (|Record| (|:| |integrand| 117) (|:| |intvar| 117))
              (|List| 152) (|IntegrationResult| 117) (505 . |mkAnswer|)
              (512 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 19) 19
                                                     6 83 7)
              (518 . |multivariate|) (524 . |tower|) (529 . ~=)
              (|IntegrationTools| 6 7) (535 . |varselect|) (541 . |0|)
              (|Record| (|:| |answer| 117) (|:| |logpart| 117) (|:| |ir| 154))
              |INTDEN;li_int;FKSR;13| |INTDEN;poly_int;FKSR;14|)
           '#(|solve_u| 545 |poly_int| 552 |li_int| 559) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|li_int|
                                 ((|Record|
                                   (|:| |answer|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial| |#2|)))
                                   (|:| |logpart|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial| |#2|)))
                                   (|:| |ir|
                                        (|IntegrationResult|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           |#2|)))))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  (|Kernel| |#2|) (|Symbol|)))
                                T)
                              '((|poly_int|
                                 ((|Record|
                                   (|:| |answer|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial| |#2|)))
                                   (|:| |logpart|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial| |#2|)))
                                   (|:| |ir|
                                        (|IntegrationResult|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           |#2|)))))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  (|Kernel| |#2|) (|Symbol|)))
                                T)
                              '((|solve_u|
                                 ((|Union| (|List| (|List| |#2|)) "failed")
                                  |#2| |#2| (|Symbol|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 166
                                            '(1 10 8 9 11 1 8 14 0 15 0 16 0 17
                                              1 19 18 0 20 2 18 7 0 21 22 1 9 7
                                              0 23 1 7 0 0 24 2 9 0 7 0 25 1 9
                                              26 0 27 0 6 0 28 2 7 0 0 29 30 0
                                              7 0 31 2 7 32 0 0 33 1 9 18 0 34
                                              2 18 32 35 0 36 1 7 0 21 37 0 6 0
                                              38 0 7 0 39 2 9 7 0 26 40 2 7 0 0
                                              0 41 2 9 0 7 26 42 1 9 0 7 43 2 9
                                              0 0 0 44 3 9 0 0 16 0 45 2 19 32
                                              0 29 46 1 7 0 47 48 1 49 0 18 50
                                              2 52 51 49 7 53 1 56 54 55 57 2
                                              21 32 0 0 58 2 7 0 0 21 59 2 18 7
                                              60 0 61 2 7 0 0 0 62 1 6 0 21 63
                                              1 7 0 6 64 2 7 0 0 0 65 0 9 0 66
                                              2 9 32 0 0 67 2 69 68 9 68 70 0 9
                                              0 71 2 73 72 0 0 74 2 75 32 19 0
                                              76 0 73 0 77 0 26 0 78 3 73 0 0
                                              19 26 79 1 73 0 7 80 3 84 73 81
                                              82 83 85 1 7 86 0 87 2 7 32 0 0
                                              88 1 75 19 0 89 2 75 0 0 0 90 1 7
                                              91 0 92 1 7 91 0 93 2 73 26 0 19
                                              94 2 73 0 0 26 95 2 73 0 0 0 96 1
                                              73 97 0 98 2 73 0 0 7 99 0 100 0
                                              101 0 83 0 102 2 73 0 7 0 103 0
                                              29 0 104 1 7 0 29 105 2 73 0 0 0
                                              106 1 73 18 0 107 2 110 108 18
                                              109 111 1 7 0 0 114 1 7 0 0 115 1
                                              7 0 0 116 1 117 0 9 118 2 121 119
                                              120 9 122 1 117 9 0 123 2 9 0 0 0
                                              124 2 68 9 125 0 126 2 9 72 0 0
                                              127 1 117 9 0 128 2 117 0 9 9 129
                                              1 7 0 130 131 1 7 0 0 132 2 7 0 0
                                              0 133 1 9 0 0 134 3 9 0 0 16 7
                                              135 1 9 7 0 136 2 137 18 0 21 138
                                              0 117 0 139 2 119 0 117 26 140 1
                                              119 0 117 141 2 119 0 0 0 142 2
                                              117 0 0 0 143 1 7 47 0 144 1 7
                                              145 130 146 1 7 21 0 147 3 7 0 0
                                              47 0 148 0 117 0 149 3 154 0 117
                                              151 153 155 2 7 0 0 0 156 2 157 7
                                              117 19 158 1 7 86 0 159 2 19 32 0
                                              0 160 2 161 75 75 29 162 0 154 0
                                              163 3 0 112 7 7 29 113 3 0 164
                                              117 19 29 166 3 0 164 117 19 29
                                              165)))))
           '|lookupComplete|)) 
