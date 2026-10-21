
(SDEFUN |POLYROOT;zroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|))
                    (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|)))))
        (SPROG
         ((|s|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|))
                     (|:| |radicand| (|List| #1=(|Integer|)))))
          (#2=#:G0 NIL) (#3=#:G17 NIL) (#4=#:G14 #1#) (#5=#:G12 #1#)
          (#6=#:G13 NIL))
         (SEQ
          (COND ((OR (ZEROP |x|) (EQL |x| 1)) (VECTOR 1 |x| 1))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n|
                                  (QREFELT % 20)))
                  (EXIT
                   (VECTOR (QVELT |s| 0) (QVELT |s| 1)
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT #2# NIL) (LETT #3# (QVELT |s| 2)) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT #2# (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4# #2#)
                                    (COND (#6# (LETT #5# (* #5# #4#)))
                                          ('T
                                           (PROGN
                                            (LETT #5# #4#)
                                            (LETT #6# 'T)))))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#6# #5#) ('T 1))))))))))) 

(SDEFUN |POLYROOT;iroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|))
                    (|:| |coef| (|Integer|)))))
        (SPROG
         ((|ru| (|Union| (|Integer|) "failed")) (|e| (|Integer|))
          (|nn| (|Integer|)) (|p| (|Integer|)) (#1=#:G30 NIL))
         (SEQ
          (COND ((EQL |x| 1) (CONS 1 1))
                ('T
                 (SEQ (LETT |e| 1) (LETT |nn| |n|) (LETT |p| 2)
                      (SEQ G190 (COND ((NULL (<= |p| |nn|)) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (EQL (REM |nn| |p|) 0))
                               (LETT |p| (SPADCALL |p| (QREFELT % 22))))
                              ('T
                               (SEQ
                                (LETT |ru| (SPADCALL |x| |p| (QREFELT % 25)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ru| 0)
                                   (SEQ (LETT |x| (QCDR |ru|))
                                        (LETT |e| (* |e| |p|))
                                        (EXIT
                                         (LETT |nn|
                                               (|quotient_INT| |nn| |p|)))))
                                  ('T
                                   (LETT |p|
                                         (SPADCALL |p| (QREFELT % 22)))))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS
                        (PROG1 (LETT #1# (|quotient_INT| |n| |e|))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |x|)))))))) 

(SDEFUN |POLYROOT;czroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|)))))
         (SEQ (LETT |rec| (|POLYROOT;zroot| |x| |n| %))
              (COND
               ((EQL (QVELT |rec| 0) 2)
                (COND
                 ((< (QVELT |rec| 2) 0)
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL
                                      (SPADCALL (SPADCALL (QREFELT % 26))
                                                (QREFELT % 27))
                                      (QREFELT % 28))
                                     (QREFELT % 29))
                           (SPADCALL (- (QVELT |rec| 2)) (QREFELT % 30))))))))
              (EXIT
               (VECTOR (QVELT |rec| 0)
                       (SPADCALL (QVELT |rec| 1) (QREFELT % 30))
                       (SPADCALL (QVELT |rec| 2) (QREFELT % 30))))))) 

(SDEFUN |POLYROOT;qroot;FNniR;4|
        ((|x| (|Fraction| (|Integer|))) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|sn|
           #1=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                        (|:| |radicand| F)))
          (|sd| #1#) (#2=#:G40 NIL) (|m| (|NonNegativeInteger|)))
         (SEQ
          (LETT |sn| (|POLYROOT;czroot| (SPADCALL |x| (QREFELT % 32)) |n| %))
          (LETT |sd| (|POLYROOT;czroot| (SPADCALL |x| (QREFELT % 33)) |n| %))
          (LETT |m|
                (PROG1
                    (LETT #2#
                          (SPADCALL (QVELT |sn| 0) (QVELT |sd| 0)
                                    (QREFELT % 34)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (EXIT
           (VECTOR |m| (SPADCALL (QVELT |sn| 1) (QVELT |sd| 1) (QREFELT % 35))
                   (SPADCALL
                    (SPADCALL (QVELT |sn| 2)
                              (|quotient_INT| |m| (QVELT |sn| 0))
                              (QREFELT % 36))
                    (SPADCALL (QVELT |sd| 2)
                              (|quotient_INT| |m| (QVELT |sd| 0))
                              (QREFELT % 36))
                    (QREFELT % 35))))))) 

(SDEFUN |POLYROOT;qroot;FNniR;5|
        ((|x| (|Fraction| (|Integer|))) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|sn|
           #1=(|Record| (|:| |exponent| (|NonNegativeInteger|))
                        (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|))))
          (|sd| #1#) (#2=#:G46 NIL) (|m| (|NonNegativeInteger|)))
         (SEQ
          (LETT |sn| (|POLYROOT;zroot| (SPADCALL |x| (QREFELT % 32)) |n| %))
          (LETT |sd| (|POLYROOT;zroot| (SPADCALL |x| (QREFELT % 33)) |n| %))
          (LETT |m|
                (PROG1
                    (LETT #2#
                          (SPADCALL (QVELT |sn| 0) (QVELT |sd| 0)
                                    (QREFELT % 34)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (EXIT
           (VECTOR |m|
                   (SPADCALL (SPADCALL (QVELT |sn| 1) (QREFELT % 30))
                             (SPADCALL (QVELT |sd| 1) (QREFELT % 30))
                             (QREFELT % 35))
                   (SPADCALL
                    (SPADCALL
                     (EXPT (QVELT |sn| 2) (|quotient_INT| |m| (QVELT |sn| 0)))
                     (QREFELT % 30))
                    (SPADCALL
                     (EXPT (QVELT |sd| 2) (|quotient_INT| |m| (QVELT |sd| 0)))
                     (QREFELT % 30))
                    (QREFELT % 35))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;6|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG ((|r| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 40)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 1)
                       (VECTOR |n| (|spadConstant| % 41)
                               (SPADCALL (SPADCALL |x| (QREFELT % 27))
                                         (QREFELT % 28))))
                      ('T (SPADCALL (QCDR |r|) |n| (QREFELT % 38)))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;7|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG ((|r| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 43)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 1)
                       (VECTOR |n| (|spadConstant| % 41)
                               (SPADCALL (SPADCALL |x| (QREFELT % 27))
                                         (QREFELT % 28))))
                      ('T
                       (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 44)) |n|
                                 (QREFELT % 38)))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;8|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (VECTOR |n| (|spadConstant| % 41)
                (SPADCALL (SPADCALL |x| (QREFELT % 27)) (QREFELT % 28)))) 

(SDEFUN |POLYROOT;rsplit|
        ((|l| (|List| P)) (% (|Record| (|:| |coef| R) (|:| |poly| P))))
        (SPROG
         ((|q| NIL) (#1=#:G78 NIL) (|u| (|Union| R "failed")) (|p| (P))
          (|r| (R)))
         (SEQ (LETT |r| (|spadConstant| % 11)) (LETT |p| (|spadConstant| % 12))
              (SEQ (LETT |q| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |q| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |q| (QREFELT % 46)))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (LETT |p| (SPADCALL |p| |q| (QREFELT % 47))))
                          ('T
                           (LETT |r|
                                 (SPADCALL |r| (QCDR |u|) (QREFELT % 48)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |r| |p|))))) 

(SDEFUN |POLYROOT;nthr;PNniR;10|
        ((|x| (P)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                    (|:| |radicand| (|List| P)))))
        (SPROG
         ((|c| (R)) (|r| (|Union| (|Integer|) "failed"))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|))))
          (|cp| (P)) (|xu| (|Union| P #1="failed")) (#2=#:G90 NIL)
          (|rec2|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                     (|:| |radicand| (|List| P))))
          (|l| (|Integer|)) (|e| (|NonNegativeInteger|))
          (|e2| (|NonNegativeInteger|)) (#3=#:G100 NIL) (|ri| NIL)
          (#4=#:G101 NIL) (|rad2| (|List| P)))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 49)))
              (EXIT
               (COND
                ((QEQCAR |r| 0)
                 (SEQ (LETT |rec| (|POLYROOT;zroot| (QCDR |r|) |n| %))
                      (EXIT
                       (VECTOR (QVELT |rec| 0)
                               (SPADCALL (QVELT |rec| 1) (QREFELT % 50))
                               (LIST
                                (SPADCALL (QVELT |rec| 2) (QREFELT % 50)))))))
                (#5='T
                 (SEQ (LETT |c| (SPADCALL |x| (QREFELT % 51)))
                      (LETT |r| (SPADCALL |c| (QREFELT % 43)))
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (SEQ (LETT |rec| (|POLYROOT;iroot| (QCDR |r|) |n| %))
                              (EXIT
                               (COND
                                ((EQL (QCAR |rec|) |n|)
                                 (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n|
                                           (QREFELT % 56)))
                                (#5#
                                 (SEQ (LETT |cp| (SPADCALL |c| (QREFELT % 27)))
                                      (LETT |xu|
                                            (SPADCALL |x| |cp| (QREFELT % 58)))
                                      (LETT |rec2|
                                            (SPADCALL
                                             (SPADCALL
                                              (PROG2 (LETT #2# |xu|)
                                                  (QCDR #2#)
                                                (|check_union2| (QEQCAR #2# 0)
                                                                (QREFELT % 9)
                                                                (|Union|
                                                                 (QREFELT % 9)
                                                                 #1#)
                                                                #2#))
                                              (QREFELT % 52))
                                             |n| (QREFELT % 56)))
                                      (EXIT
                                       (COND
                                        ((EQL (QCAR |rec|) 1)
                                         (VECTOR (QVELT |rec2| 0)
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |rec|)
                                                            (QREFELT % 50))
                                                  (QVELT |rec2| 1)
                                                  (QREFELT % 47))
                                                 (QVELT |rec2| 2)))
                                        (#5#
                                         (SEQ
                                          (LETT |l|
                                                (SPADCALL (QCAR |rec|)
                                                          (QVELT |rec2| 0)
                                                          (QREFELT % 34)))
                                          (LETT |e|
                                                (|quotient_INT| |l|
                                                                (QCAR |rec|)))
                                          (LETT |e2|
                                                (|quotient_INT| |l|
                                                                (QVELT |rec2|
                                                                       0)))
                                          (LETT |rad2|
                                                (PROGN
                                                 (LETT #3# NIL)
                                                 (SEQ (LETT |ri| NIL)
                                                      (LETT #4#
                                                            (QVELT |rec2| 2))
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #4#)
                                                            (PROGN
                                                             (LETT |ri|
                                                                   (CAR #4#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #3#
                                                              (CONS
                                                               (SPADCALL |ri|
                                                                         |e2|
                                                                         (QREFELT
                                                                          %
                                                                          59))
                                                               #3#))))
                                                      (LETT #4# (CDR #4#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #3#)))))
                                          (EXIT
                                           (VECTOR |l| (QVELT |rec2| 1)
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL (QCDR |rec|)
                                                               (QREFELT % 50))
                                                     |e| (QREFELT % 59))
                                                    |rad2|)))))))))))))
                        (#5#
                         (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n|
                                   (QREFELT % 56)))))))))))) 

(SDEFUN |POLYROOT;nthr;PNniR;11|
        ((|x| (P)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                    (|:| |radicand| (|List| P)))))
        (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n| (QREFELT % 56))) 

(SDEFUN |POLYROOT;froot;FNniR;12|
        ((|x| (F)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|sn|
           #1=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                        (|:| |radicand| (|List| P))))
          (|sd| #1#) (|pn| #2=(|Record| (|:| |coef| R) (|:| |poly| P)))
          (|pd| #2#)
          (|rn|
           #3=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                        (|:| |radicand| F)))
          (|rd| #3#) (#4=#:G108 NIL) (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT % 62))
                (SPADCALL |x| (|spadConstant| % 41) (QREFELT % 63)))
            (VECTOR 1 |x| (|spadConstant| % 41)))
           ('T
            (SEQ
             (LETT |sn|
                   (SPADCALL (SPADCALL |x| (QREFELT % 64)) |n| (QREFELT % 60)))
             (LETT |sd|
                   (SPADCALL (SPADCALL |x| (QREFELT % 65)) |n| (QREFELT % 60)))
             (LETT |pn| (|POLYROOT;rsplit| (QVELT |sn| 2) %))
             (LETT |pd| (|POLYROOT;rsplit| (QVELT |sd| 2) %))
             (LETT |rn| (SPADCALL (QCAR |pn|) (QVELT |sn| 0) (QREFELT % 42)))
             (LETT |rd| (SPADCALL (QCAR |pd|) (QVELT |sd| 0) (QREFELT % 42)))
             (LETT |m|
                   (PROG1
                       (LETT #4#
                             (SPADCALL
                              (LIST (QVELT |rn| 0) (QVELT |rd| 0)
                                    (QVELT |sn| 0) (QVELT |sd| 0))
                              (QREFELT % 67)))
                     (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #4#)))
             (EXIT
              (VECTOR |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QVELT |sn| 1) (QREFELT % 28))
                                 (SPADCALL (QVELT |sd| 1) (QREFELT % 28))
                                 (QREFELT % 35))
                       (SPADCALL (QVELT |rn| 1) (QVELT |rd| 1) (QREFELT % 35))
                       (QREFELT % 68))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QVELT |rn| 2)
                                   (|quotient_INT| |m| (QVELT |rn| 0))
                                   (QREFELT % 36))
                         (SPADCALL (QVELT |rd| 2)
                                   (|quotient_INT| |m| (QVELT |rd| 0))
                                   (QREFELT % 36))
                         (QREFELT % 35))
                        (SPADCALL
                         (SPADCALL (QCDR |pn|)
                                   (|quotient_INT| |m| (QVELT |sn| 0))
                                   (QREFELT % 59))
                         (QREFELT % 28))
                        (QREFELT % 68))
                       (SPADCALL
                        (SPADCALL (QCDR |pd|)
                                  (|quotient_INT| |m| (QVELT |sd| 0))
                                  (QREFELT % 59))
                        (QREFELT % 28))
                       (QREFELT % 35)))))))))) 

(DECLAIM (NOTINLINE |PolynomialRoots;|)) 

(DEFUN |PolynomialRoots;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|PolynomialRoots| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 70))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3| '(|GcdDomain|))))))
    (|haddProp| |$ConstructorCache| '|PolynomialRoots|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasSignature| |#3| (LIST '|imaginary| (LIST (|devaluate| |#3|))))
      (PROGN
       (QSETREFV % 38 (CONS (|dispatchFunction| |POLYROOT;qroot;FNniR;4|) %))))
     ('T
      (QSETREFV % 38 (CONS (|dispatchFunction| |POLYROOT;qroot;FNniR;5|) %))))
    (COND
     ((|HasCategory| |#3| '(|RetractableTo| (|Fraction| (|Integer|))))
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;6|) %)))
     ((|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;7|) %)))
     ('T
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;8|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (COND
        ((|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (QSETREFV % 60
                   (CONS (|dispatchFunction| |POLYROOT;nthr;PNniR;10|) %)))
        ('T
         (QSETREFV % 60
                   (CONS (|dispatchFunction| |POLYROOT;nthr;PNniR;11|) %))))
       (QSETREFV % 69
                 (CONS (|dispatchFunction| |POLYROOT;froot;FNniR;12|) %)))))
    %))) 

(DEFUN |PolynomialRoots| (&REST #1=#:G111)
  (SPROG NIL
         (PROG (#2=#:G112)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialRoots|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialRoots;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialRoots|)))))))))) 

(MAKEPROP '|PolynomialRoots| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |1|) (4 . |1|)
              (|Factored| %) (|Integer|) (8 . |squareFree|)
              (|Record| (|:| |exponent| 18) (|:| |coef| 14)
                        (|:| |radicand| (|List| 14)))
              (|Factored| 14) (|NonNegativeInteger|) (|FactoredFunctions| 14)
              (13 . |nthRoot|) (|IntegerPrimesPackage| 14) (19 . |nextPrime|)
              (|Union| 14 '"failed") (|IntegerRoots| 14)
              (24 . |perfectNthRoot|) (30 . |imaginary|) (34 . |coerce|)
              (39 . |coerce|) (44 . *) (50 . |coerce|) (|Fraction| 14)
              (55 . |numer|) (60 . |denom|) (65 . |lcm|) (71 . /) (77 . ^)
              (|Record| (|:| |exponent| 18) (|:| |coef| 10)
                        (|:| |radicand| 10))
              (83 . |qroot|) (|Union| 31 '#1="failed") (89 . |retractIfCan|)
              (94 . |1|) (98 . |rroot|) (104 . |retractIfCan|) (109 . |coerce|)
              (|Union| 8 '#1#) (114 . |retractIfCan|) (119 . *) (125 . *)
              (131 . |retractIfCan|) (136 . |coerce|) (141 . |content|)
              (146 . |squareFree|)
              (|Record| (|:| |exponent| 18) (|:| |coef| 9)
                        (|:| |radicand| (|List| 9)))
              (|Factored| 9) (|FactoredFunctions| 9) (151 . |nthRoot|)
              (|Union| % '"failed") (157 . |exquo|) (163 . ^) (169 . |nthr|)
              (|Boolean|) (175 . |zero?|) (180 . =) (186 . |numer|)
              (191 . |denom|) (|List| %) (196 . |lcm|) (201 . *)
              (207 . |froot|))
           '#(|rroot| 213 |qroot| 219 |nthr| 225 |froot| 231) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rroot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  |#3| (|NonNegativeInteger|)))
                                T)
                              '((|qroot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  (|Fraction| (|Integer|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|froot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  |#5| (|NonNegativeInteger|)))
                                (|has| 8 (|GcdDomain|)))
                              '((|nthr|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#4|)
                                   (|:| |radicand| (|List| |#4|)))
                                  |#4| (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 69
                                            '(0 8 0 11 0 9 0 12 1 14 13 0 15 2
                                              19 16 17 18 20 1 21 14 14 22 2 24
                                              23 14 18 25 0 8 0 26 1 9 0 8 27 1
                                              10 0 9 28 2 10 0 14 0 29 1 10 0
                                              14 30 1 31 14 0 32 1 31 14 0 33 2
                                              14 0 0 0 34 2 10 0 0 0 35 2 10 0
                                              0 18 36 2 0 37 31 18 38 1 8 39 0
                                              40 0 10 0 41 2 0 37 8 18 42 1 8
                                              23 0 43 1 31 0 14 44 1 9 45 0 46
                                              2 9 0 0 0 47 2 8 0 0 0 48 1 9 23
                                              0 49 1 9 0 14 50 1 9 8 0 51 1 9
                                              13 0 52 2 55 53 54 18 56 2 9 57 0
                                              0 58 2 9 0 0 18 59 2 0 53 9 18 60
                                              1 10 61 0 62 2 10 61 0 0 63 1 10
                                              9 0 64 1 10 9 0 65 1 14 0 66 67 2
                                              10 0 0 0 68 2 0 37 10 18 69 2 0
                                              37 8 18 42 2 0 37 31 18 38 2 0 53
                                              9 18 60 2 1 37 10 18 69)))))
           '|lookupComplete|)) 
