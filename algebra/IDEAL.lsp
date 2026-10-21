
(SDEFUN |IDEAL;npoly| ((|f| (|DPoly|)) (% (|newPoly|)))
        (COND
         ((SPADCALL |f| (|spadConstant| % 13) (QREFELT % 15))
          (|spadConstant| % 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |f| (QREFELT % 17))
                     (SPADCALL 0 (SPADCALL |f| (QREFELT % 20)) (QREFELT % 22))
                     (QREFELT % 23))
           (|IDEAL;npoly| (SPADCALL |f| (QREFELT % 24)) %) (QREFELT % 25))))) 

(SDEFUN |IDEAL;oldpoly| ((|q| (|newPoly|)) (% #1=(|Union| |DPoly| "failed")))
        (SPROG ((|dq| (|newExpon|)) (|n| (|NonNegativeInteger|)) (|g| #1#))
               (SEQ
                (COND
                 ((SPADCALL |q| (|spadConstant| % 16) (QREFELT % 26))
                  (CONS 0 (|spadConstant| % 13)))
                 (#2='T
                  (SEQ (LETT |dq| (SPADCALL |q| (QREFELT % 27)))
                       (LETT |n| (SPADCALL |dq| (QREFELT % 28)))
                       (EXIT
                        (COND
                         ((SPADCALL |n| 0 (QREFELT % 29)) (CONS 1 "failed"))
                         (#2#
                          (SEQ
                           (LETT |g|
                                 (|IDEAL;oldpoly| (SPADCALL |q| (QREFELT % 30))
                                  %))
                           (EXIT
                            (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                                  (#2#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT % 31))
                                           (SPADCALL |dq| (QREFELT % 32))
                                           (QREFELT % 33))
                                          (QCDR |g|)
                                          (QREFELT % 34)))))))))))))))) 

(SDEFUN |IDEAL;leadterm|
        ((|f| (|DPoly|)) (|lvar| (|List| |VarSet|)) (% (|DPoly|)))
        (SPROG ((|lf| (|List| |VarSet|)))
               (COND
                ((OR (NULL (LETT |lf| (SPADCALL |f| (QREFELT % 36))))
                     (SPADCALL |lf| |lvar| (QREFELT % 37)))
                 |f|)
                ('T
                 (|IDEAL;leadterm|
                  (SPADCALL (SPADCALL |f| (|SPADfirst| |lf|) (QREFELT % 39))
                            (QREFELT % 41))
                  |lvar| %))))) 

(SDEFUN |IDEAL;choosel| ((|f| (|DPoly|)) (|g| (|DPoly|)) (% (|DPoly|)))
        (SPROG ((|f1| (|Union| |DPoly| "failed")))
               (SEQ
                (COND ((SPADCALL |g| (|spadConstant| % 13) (QREFELT % 15)) |f|)
                      (#1='T
                       (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT % 43)))
                            (EXIT
                             (COND ((QEQCAR |f1| 1) |f|)
                                   (#1#
                                    (|IDEAL;choosel| (QCDR |f1|) |g| %)))))))))) 

(SDEFUN |IDEAL;contractGrob| ((I1 (|List| |newPoly|)) (% (%)))
        (SPROG
         ((J1 (|List| |newPoly|)) (#1=#:G57 NIL) (|f| NIL) (#2=#:G58 NIL)
          (#3=#:G36 NIL))
         (SEQ (LETT J1 (SPADCALL I1 (QREFELT % 46)))
              (SEQ G190
                   (COND
                    ((NULL (QEQCAR (|IDEAL;oldpoly| (|SPADfirst| J1) %) 1))
                     (GO G191)))
                   (SEQ (EXIT (LETT J1 (CDR J1)))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (CONS
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# J1) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (PROG2 (LETT #3# (|IDEAL;oldpoly| |f| %))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                                 (|Union| (QREFELT % 9)
                                                          "failed")
                                                 #3#))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                'T))))) 

(SDEFUN |IDEAL;makeleast|
        ((|fullVars| (|List| |VarSet|)) (|leastVars| (|List| |VarSet|))
         (% (|List| |VarSet|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G64 NIL) (|vv| NIL)
          (#2=#:G65 NIL))
         (SEQ (LETT |n| (LENGTH |leastVars|))
              (EXIT
               (COND ((< (LENGTH |fullVars|) |n|) (|error| "wrong vars"))
                     ((EQL |n| 0) |fullVars|)
                     ('T
                      (SPADCALL
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |vv| NIL) (LETT #2# |fullVars|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |vv| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |vv| |leastVars| (QREFELT % 47)))
                                 (LETT #1# (CONS |vv| #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))
                       |leastVars| (QREFELT % 48)))))))) 

(SDEFUN |IDEAL;isMonic?| ((|f| (|DPoly|)) (|x| (|VarSet|)) (% (|Boolean|)))
        (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT % 39)) (QREFELT % 41))
                  (QREFELT % 49))) 

(SDEFUN |IDEAL;subset|
        ((|lv| (|List| |VarSet|)) (% #1=(|List| (|List| |VarSet|))))
        (SPROG
         ((|v| (|VarSet|)) (|ll| #1#) (#2=#:G73 NIL) (|set| NIL) (#3=#:G74 NIL)
          (|l1| (|List| (|List| |VarSet|))))
         (SEQ
          (COND ((EQL (LENGTH |lv|) 1) (LIST |lv| NIL))
                ('T
                 (SEQ (LETT |v| (SPADCALL |lv| 1 (QREFELT % 53)))
                      (LETT |ll| (|IDEAL;subset| (CDR |lv|) %))
                      (LETT |l1|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |set| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |set| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2# (CONS (CONS |v| |set|) #2#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#)))))
                      (EXIT (SPADCALL |l1| |ll| (QREFELT % 55))))))))) 

(SDEFUN |IDEAL;monomDim|
        ((|listm| (%)) (|lv| #1=(|List| |VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|f| NIL) (#2=#:G91 NIL) (|mvset| (|List| |VarSet|))
          (|monvar| (|List| (|List| |VarSet|)))
          (|lsubset| (|List| (|List| |VarSet|))) (|subs| NIL) (#3=#:G92 NIL)
          (#4=#:G93 NIL) (|ldif| #1#) (#5=#:G90 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |monvar| NIL)
                (SEQ (LETT |f| NIL)
                     (LETT #2# (SPADCALL |listm| (QREFELT % 57))) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mvset| (SPADCALL |f| (QREFELT % 36)))
                          (EXIT
                           (COND
                            ((> (LENGTH |mvset|) 1)
                             (LETT |monvar| (CONS |mvset| |monvar|)))
                            ('T
                             (LETT |lv|
                                   (SPADCALL |lv|
                                             (SPADCALL
                                              (SPADCALL |mvset| 1
                                                        (QREFELT % 53))
                                              |lv| (QREFELT % 59))
                                             (QREFELT % 60)))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((NULL |lv|) 0)
                       ('T
                        (SEQ
                         (LETT |lsubset|
                               (SPADCALL (CONS #'|IDEAL;monomDim!0| %)
                                         (|IDEAL;subset| |lv| %)
                                         (QREFELT % 64)))
                         (SEQ (LETT |subs| NIL) (LETT #3# |lsubset|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |subs| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ldif| |lv|)
                                   (SEQ (LETT #4# |monvar|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |mvset| (CAR #4#))
                                               NIL)
                                              (NULL
                                               (SPADCALL |ldif| NIL
                                                         (QREFELT % 65))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |ldif|
                                                (SPADCALL |mvset| |subs|
                                                          (QREFELT % 66)))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL (NULL |ldif|))
                                      (PROGN
                                       (LETT #5# (LENGTH |subs|))
                                       (GO #6=#:G89))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 0)))))))
          #6# (EXIT #5#)))) 

(SDEFUN |IDEAL;monomDim!0| ((|z1| NIL) (|z2| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 61)) (SPADCALL |z2| (QREFELT % 61))
                  (QREFELT % 62))) 

(SDEFUN |IDEAL;=;2%B;10| ((I (%)) (J (%)) (% (|Boolean|)))
        (COND ((SPADCALL I J (QREFELT % 67)) (SPADCALL J I (QREFELT % 67)))
              ('T NIL))) 

(SDEFUN |IDEAL;element?;DPoly%B;11| ((|f| (|DPoly|)) (I (%)) (% (|Boolean|)))
        (SPROG ((|Id| (|List| |DPoly|)))
               (SEQ (LETT |Id| (QCAR (SPADCALL I (QREFELT % 69))))
                    (EXIT
                     (COND
                      ((NULL |Id|)
                       (SPADCALL |f| (|spadConstant| % 13) (QREFELT % 15)))
                      ('T
                       (SPADCALL (SPADCALL |f| |Id| (QREFELT % 71))
                                 (|spadConstant| % 13) (QREFELT % 15)))))))) 

(SDEFUN |IDEAL;in?;2%B;12| ((I (%)) (J (%)) (% (|Boolean|)))
        (SPROG
         ((|f| NIL) (#1=#:G104 NIL) (#2=#:G101 #3=(|Boolean|)) (#4=#:G99 #3#)
          (#5=#:G100 NIL))
         (SEQ (LETT J (SPADCALL J (QREFELT % 69)))
              (EXIT
               (COND ((NULL (QCAR I)) 'T)
                     (#6='T
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |f| NIL) (LETT #1# (QCAR I)) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #2# (SPADCALL |f| J (QREFELT % 72)))
                               (COND (#5# (LETT #4# (COND (#4# #2#) ('T NIL))))
                                     ('T
                                      (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (COND (#5# #4#) (#6# 'T))))))))) 

(SDEFUN |IDEAL;groebner;2%;13| ((I (%)) (% (%)))
        (SPROG
         ((|f| NIL) (#1=#:G112 NIL) (#2=#:G107 #3=(|Boolean|)) (#4=#:G105 #3#)
          (#5=#:G106 NIL))
         (SEQ
          (COND
           ((QCDR I)
            (COND
             ((PROGN
               (LETT #5# NIL)
               (SEQ (LETT |f| NIL) (LETT #1# (QCAR I)) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #2# (NULL (SPADCALL |f| (QREFELT % 73))))
                       (COND (#5# (LETT #4# (COND (#4# 'T) ('T #2#))))
                             ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
               (COND (#5# #4#) (#6='T NIL)))
              I)
             (#6# (CONS NIL 'T))))
           (#6# (CONS (SPADCALL (QCAR I) (QREFELT % 74)) 'T)))))) 

(SDEFUN |IDEAL;intersect;3%;14| ((I (%)) (J (%)) (% (%)))
        (SPROG
         ((|Id| #1=(|List| |DPoly|)) (|Jd| #1#) (|tp| (|newPoly|))
          (|tp1| (|newPoly|)) (#2=#:G127 NIL) (#3=#:G128 NIL) (#4=#:G129 NIL)
          (|f| NIL) (#5=#:G130 NIL))
         (SEQ
          (COND ((NULL (LETT |Id| (QCAR I))) I) ((NULL (LETT |Jd| (QCAR J))) J)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL (|spadConstant| % 50)
                                  (SPADCALL 1 (|spadConstant| % 19)
                                            (QREFELT % 22))
                                  (QREFELT % 23)))
                  (LETT |tp1|
                        (SPADCALL |tp| (|spadConstant| % 75) (QREFELT % 76)))
                  (EXIT
                   (|IDEAL;contractGrob|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |f| NIL) (LETT #3# |Id|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |tp| (|IDEAL;npoly| |f| %)
                                              (QREFELT % 77))
                                    #2#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |f| NIL) (LETT #5# |Jd|) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (SPADCALL |tp1| (|IDEAL;npoly| |f| %)
                                              (QREFELT % 77))
                                    #4#))))
                           (LETT #5# (CDR #5#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT % 78))
                    %)))))))) 

(SDEFUN |IDEAL;intersect;L%;15| ((|lid| (|List| %)) (% (%)))
        (SPROG
         ((|l| NIL) (#1=#:G135 NIL) (#2=#:G133 (%)) (#3=#:G131 (%))
          (#4=#:G132 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |l| NIL) (LETT #1# |lid|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2# |l|)
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 79))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|IdentityError| '|intersect|))))))) 

(SDEFUN |IDEAL;quotient;%DPoly%;16| ((I (%)) (|f| (|DPoly|)) (% (%)))
        (SPROG ((#1=#:G143 NIL) (|g| NIL) (#2=#:G144 NIL) (#3=#:G36 NIL))
               (SEQ
                (CONS
                 (SPADCALL
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |g| NIL)
                        (LETT #2#
                              (QCAR
                               (SPADCALL I (SPADCALL (LIST |f|) (QREFELT % 82))
                                         (QREFELT % 79))))
                        G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |g| |f| (QREFELT % 43)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                                   (|Union| (QREFELT % 9)
                                                            "failed")
                                                   #3#))
                                 #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (QREFELT % 84))
                 'T)))) 

(SDEFUN |IDEAL;quotient;3%;17| ((I (%)) (J (%)) (% (%)))
        (SPROG
         ((|Jdl| (|List| |DPoly|)) (|f| NIL) (#1=#:G153 NIL) (#2=#:G150 (%))
          (#3=#:G148 (%)) (#4=#:G149 NIL))
         (SEQ (LETT |Jdl| (QCAR J))
              (EXIT
               (COND
                ((NULL |Jdl|)
                 (SPADCALL (LIST (|spadConstant| % 51)) (QREFELT % 86)))
                (#5='T
                 (CONS
                  (QCAR
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |f| NIL) (LETT #1# |Jdl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #2# (SPADCALL I |f| (QREFELT % 85)))
                            (COND
                             (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 79))))
                             ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (COND (#4# #3#) (#5# (|IdentityError| '|intersect|)))))
                  'T))))))) 

(SDEFUN |IDEAL;+;3%;18| ((I (%)) (J (%)) (% (%)))
        (CONS
         (SPADCALL (SPADCALL (QCAR I) (QCAR J) (QREFELT % 88)) (QREFELT % 74))
         'T)) 

(SDEFUN |IDEAL;*;3%;19| ((I (%)) (J (%)) (% (%)))
        (SPROG
         ((|g| NIL) (#1=#:G161 NIL) (#2=#:G162 NIL) (|f| NIL) (#3=#:G163 NIL)
          (#4=#:G157 #5=(|List| |DPoly|)) (#6=#:G155 #5#) (#7=#:G156 NIL))
         (SEQ
          (CONS
           (SPADCALL
            (PROGN
             (LETT #7# NIL)
             (SEQ (LETT |g| NIL) (LETT #1# (QCAR J)) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |f| NIL) (LETT #3# (QCAR I)) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |f| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL |f| |g| (QREFELT % 90))
                                          #2#))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))
                     (COND (#7# (LETT #6# (SPADCALL #6# #4# (QREFELT % 91))))
                           ('T (PROGN (LETT #6# #4#) (LETT #7# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#7# #6#) ('T NIL)))
            (QREFELT % 74))
           'T)))) 

(SDEFUN |IDEAL;^;%Nni%;20| ((I (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G164 NIL))
               (COND ((EQL |n| 0) (CONS (LIST (|spadConstant| % 51)) 'T))
                     ('T
                      (SPADCALL I
                                (SPADCALL I
                                          (PROG1 (LETT #1# (- |n| 1))
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT % 93))
                                (QREFELT % 92)))))) 

(SDEFUN |IDEAL;saturate;%DPoly%;21| ((I (%)) (|f| (|DPoly|)) (% (%)))
        (SPROG ((|tp| (|newPoly|)) (#1=#:G170 NIL) (|g| NIL) (#2=#:G171 NIL))
               (SEQ
                (COND
                 ((SPADCALL |f| (|spadConstant| % 13) (QREFELT % 15))
                  (|error| "f is zero"))
                 ('T
                  (SEQ
                   (LETT |tp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 50)
                                     (SPADCALL 1 (|spadConstant| % 19)
                                               (QREFELT % 22))
                                     (QREFELT % 23))
                           (|IDEAL;npoly| |f| %) (QREFELT % 77))
                          (|spadConstant| % 75) (QREFELT % 76)))
                   (EXIT
                    (|IDEAL;contractGrob|
                     (CONS |tp|
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |g| NIL) (LETT #2# (QCAR I)) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |g| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS (|IDEAL;npoly| |g| %) #1#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #1#)))))
                     %)))))))) 

(SDEFUN |IDEAL;saturate;%DPolyL%;22|
        ((I (%)) (|f| (|DPoly|)) (|lvar| (|List| |VarSet|)) (% (%)))
        (SPROG
         ((|Id| (|List| |DPoly|)) (#1=#:G191 NIL)
          (#2=#:G174 #3=(|List| |VarSet|)) (#4=#:G172 #3#) (#5=#:G173 NIL)
          (|fullVars| #3#) (|newVars| (|List| |VarSet|)) (#6=#:G192 NIL)
          (#7=#:G193 NIL) (|subVars| (|List| |DPoly|)) (#8=#:G194 NIL)
          (#9=#:G195 NIL) (J (|List| |DPoly|)) (#10=#:G196 NIL)
          (#11=#:G197 NIL) (|ltJ| (|List| |DPoly|)) (|ltg| NIL)
          (#12=#:G198 NIL) (#13=#:G184 (|DPoly|)) (#14=#:G182 (|DPoly|))
          (#15=#:G183 NIL) (|s| (|DPoly|)) (#16=#:G199 NIL) (|vv| NIL)
          (#17=#:G200 NIL) (|fullPol| (|List| |DPoly|)) (#18=#:G201 NIL)
          (|g| NIL) (#19=#:G202 NIL))
         (SEQ (LETT |Id| (QCAR I))
              (LETT |fullVars|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |g| NIL) (LETT #1# |Id|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |g| (QREFELT % 36)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 95))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#20='T (|IdentityError| '|setUnion|)))))
              (LETT |newVars| (|IDEAL;makeleast| |fullVars| |lvar| %))
              (LETT |subVars|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #7# |newVars|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |vv| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL (|spadConstant| % 51) |vv| 1
                                             (QREFELT % 96))
                                   #6#))))
                          (LETT #7# (CDR #7#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT J
                    (SPADCALL
                     (PROGN
                      (LETT #8# NIL)
                      (SEQ (LETT |g| NIL) (LETT #9# |Id|) G190
                           (COND
                            ((OR (ATOM #9#) (PROGN (LETT |g| (CAR #9#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #8#
                                   (CONS
                                    (SPADCALL |g| |fullVars| |subVars|
                                              (QREFELT % 97))
                                    #8#))))
                           (LETT #9# (CDR #9#)) (GO G190) G191
                           (EXIT (NREVERSE #8#))))
                     (QREFELT % 74)))
              (LETT |ltJ|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |g| NIL) (LETT #11# J) G190
                          (COND
                           ((OR (ATOM #11#) (PROGN (LETT |g| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (|IDEAL;leadterm| |g| |lvar| %)
                                        #10#))))
                          (LETT #11# (CDR #11#)) (GO G190) G191
                          (EXIT (NREVERSE #10#)))))
              (LETT |s|
                    (PROGN
                     (LETT #15# NIL)
                     (SEQ (LETT |ltg| NIL) (LETT #12# |ltJ|) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |ltg| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #13# (|IDEAL;choosel| |ltg| |f| %))
                             (COND
                              (#15#
                               (LETT #14# (SPADCALL #14# #13# (QREFELT % 90))))
                              ('T (PROGN (LETT #14# #13#) (LETT #15# 'T)))))))
                          (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
                     (COND (#15# #14#) (#20# (|spadConstant| % 51)))))
              (LETT |fullPol|
                    (PROGN
                     (LETT #16# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #17# |fullVars|) G190
                          (COND
                           ((OR (ATOM #17#) (PROGN (LETT |vv| (CAR #17#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #16#
                                  (CONS
                                   (SPADCALL (|spadConstant| % 51) |vv| 1
                                             (QREFELT % 96))
                                   #16#))))
                          (LETT #17# (CDR #17#)) (GO G190) G191
                          (EXIT (NREVERSE #16#)))))
              (EXIT
               (CONS
                (PROGN
                 (LETT #18# NIL)
                 (SEQ (LETT |g| NIL)
                      (LETT #19#
                            (QCAR
                             (SPADCALL (SPADCALL J (QREFELT % 82)) |s|
                                       (QREFELT % 94))))
                      G190
                      (COND
                       ((OR (ATOM #19#) (PROGN (LETT |g| (CAR #19#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #18#
                              (CONS
                               (SPADCALL |g| |newVars| |fullPol|
                                         (QREFELT % 97))
                               #18#))))
                      (LETT #19# (CDR #19#)) (GO G190) G191
                      (EXIT (NREVERSE #18#))))
                'T))))) 

(SDEFUN |IDEAL;zeroDim?;%LB;23|
        ((I (%)) (|lvar| (|List| |VarSet|)) (% (|Boolean|)))
        (SPROG
         ((J (|List| |DPoly|)) (|n| (|NonNegativeInteger|)) (|f| NIL)
          (#1=#:G218 NIL) (#2=#:G209 NIL) (|x| (|VarSet|)))
         (SEQ (LETT J (QCAR (SPADCALL I (QREFELT % 69))))
              (EXIT
               (COND
                ((OR (NULL J)
                     (SPADCALL J (LIST (|spadConstant| % 51)) (QREFELT % 99)))
                 NIL)
                ('T
                 (SEQ (LETT |n| (LENGTH |lvar|))
                      (EXIT
                       (COND ((< (LENGTH J) |n|) NIL)
                             ('T
                              (SEQ
                               (SEQ (LETT |f| NIL) (LETT #1# J) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |f| (CAR #1#)) NIL)
                                          (NULL (NULL (NULL |lvar|))))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |x|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL |f|
                                                               (QREFELT %
                                                                        101)))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (QREFELT % 8)
                                                             (|Union|
                                                              (QREFELT % 8)
                                                              "failed")
                                                             #2#)))
                                     (EXIT
                                      (COND
                                       ((|IDEAL;isMonic?| |f| |x| %)
                                        (LETT |lvar|
                                              (SPADCALL |lvar|
                                                        (SPADCALL |x| |lvar|
                                                                  (QREFELT %
                                                                           59))
                                                        (QREFELT % 60)))))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (NULL |lvar|))))))))))))) 

(SDEFUN |IDEAL;zeroDim?;%B;24| ((I (%)) (% (|Boolean|)))
        (SPROG
         ((|g| NIL) (#1=#:G224 NIL) (#2=#:G221 #3=(|List| |VarSet|))
          (#4=#:G219 #3#) (#5=#:G220 NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |g| NIL) (LETT #1# (QCAR I)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |g| (QREFELT % 36)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 95))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT % 102))))) 

(SDEFUN |IDEAL;inRadical?;DPoly%B;25| ((|f| (|DPoly|)) (I (%)) (% (|Boolean|)))
        (SPROG
         ((|tp| (|newPoly|)) (|Id| (|List| |DPoly|)) (#1=#:G343 NIL) (|g| NIL)
          (#2=#:G344 NIL))
         (SEQ
          (COND ((SPADCALL |f| (|spadConstant| % 13) (QREFELT % 15)) 'T)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 50)
                                    (SPADCALL 1 (|spadConstant| % 19)
                                              (QREFELT % 22))
                                    (QREFELT % 23))
                          (|IDEAL;npoly| |f| %) (QREFELT % 77))
                         (|spadConstant| % 75) (QREFELT % 76)))
                  (LETT |Id| (QCAR I))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 75)
                              (SPADCALL
                               (CONS |tp|
                                     (PROGN
                                      (LETT #1# NIL)
                                      (SEQ (LETT |g| NIL) (LETT #2# |Id|) G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |g| (CAR #2#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #1#
                                                   (CONS (|IDEAL;npoly| |g| %)
                                                         #1#))))
                                           (LETT #2# (CDR #2#)) (GO G190) G191
                                           (EXIT (NREVERSE #1#)))))
                               (QREFELT % 46))
                              (QREFELT % 104))
                    (|spadConstant| % 16) (QREFELT % 26))))))))) 

(SDEFUN |IDEAL;dimension;%LI;26|
        ((I (%)) (|lvar| (|List| |VarSet|)) (% (|Integer|)))
        (SPROG
         ((|f| NIL) (#1=#:G358 NIL) (#2=#:G347 #3=(|List| |VarSet|))
          (#4=#:G345 #3#) (#5=#:G346 NIL) (|vv| NIL) (#6=#:G359 NIL)
          (#7=#:G351 #8=(|Boolean|)) (#9=#:G349 #8#) (#10=#:G350 NIL)
          (|truelist| #3#) (|ed| (|Integer|)) (|leadid| (%))
          (|n1| (|Integer|)))
         (SEQ (LETT I (SPADCALL I (QREFELT % 69)))
              (EXIT
               (COND ((NULL (QCAR I)) (LENGTH |lvar|))
                     ((SPADCALL (|spadConstant| % 51) I (QREFELT % 72)) -1)
                     (#11='T
                      (SEQ
                       (LETT |truelist|
                             (PROGN
                              (LETT #5# NIL)
                              (SEQ (LETT |f| NIL) (LETT #1# (QCAR I)) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |f| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #2# (SPADCALL |f| (QREFELT % 36)))
                                      (COND
                                       (#5#
                                        (LETT #4#
                                              (SPADCALL #4# #2#
                                                        (QREFELT % 95))))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#5# #4#)
                                    (#11# (|IdentityError| '|setUnion|)))))
                       (EXIT
                        (COND
                         ((PROGN
                           (LETT #10# NIL)
                           (SEQ (LETT |vv| NIL) (LETT #6# |truelist|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |vv| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7#
                                         (NULL
                                          (SPADCALL |vv| |lvar|
                                                    (QREFELT % 47))))
                                   (COND
                                    (#10# (LETT #9# (COND (#9# 'T) ('T #7#))))
                                    ('T
                                     (PROGN (LETT #9# #7#) (LETT #10# 'T)))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (COND (#10# #9#) (#11# NIL)))
                          (|error| "wrong variables"))
                         (#11#
                          (SEQ
                           (LETT |truelist|
                                 (SPADCALL |lvar|
                                           (SPADCALL |lvar| |truelist|
                                                     (QREFELT % 66))
                                           (QREFELT % 66)))
                           (LETT |ed| (- (LENGTH |lvar|) (LENGTH |truelist|)))
                           (LETT |leadid| (SPADCALL I (QREFELT % 106)))
                           (LETT |n1| (|IDEAL;monomDim| |leadid| |truelist| %))
                           (EXIT (+ |ed| |n1|))))))))))))) 

(SDEFUN |IDEAL;dimension;%I;27| ((I (%)) (% (|Integer|)))
        (SPROG
         ((|g| NIL) (#1=#:G365 NIL) (#2=#:G362 #3=(|List| |VarSet|))
          (#4=#:G360 #3#) (#5=#:G361 NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |g| NIL) (LETT #1# (QCAR I)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |g| (QREFELT % 36)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 95))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT % 107))))) 

(SDEFUN |IDEAL;leadingIdeal;2%;28| ((I (%)) (% (%)))
        (SPROG
         ((|Idl| (|List| |DPoly|)) (#1=#:G370 NIL) (|f| NIL) (#2=#:G371 NIL))
         (SEQ (LETT |Idl| (QCAR (SPADCALL I (QREFELT % 69))))
              (EXIT
               (CONS
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |Idl|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL |f| (SPADCALL |f| (QREFELT % 24))
                                         (QREFELT % 109))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                'T))))) 

(SDEFUN |IDEAL;monompol|
        ((|df| (|List| (|NonNegativeInteger|))) (|lcf| (F))
         (|lv| (|List| |VarSet|)) (% (|Polynomial| F)))
        (SPROG
         ((|v| NIL) (#1=#:G377 NIL) (|dd| NIL) (#2=#:G376 NIL)
          (|g| (|Polynomial| F)))
         (SEQ (LETT |g| (SPADCALL |lcf| (QREFELT % 111)))
              (SEQ (LETT |v| NIL) (LETT #1# |lv|) (LETT |dd| NIL)
                   (LETT #2# |df|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |dd| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |g|
                           (SPADCALL |g| (SPADCALL |v| (QREFELT % 113)) |dd|
                                     (QREFELT % 114)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |g|)))) 

(SDEFUN |IDEAL;relationsIdeal;LSt;30|
        ((|listf| (|List| |DPoly|))
         (%
          (|SuchThat| (|List| (|Polynomial| F))
                      (|List| (|Equation| (|Polynomial| F))))))
        (SPROG
         ((|nf| (|NonNegativeInteger|)) (#1=#:G413 NIL)
          (#2=#:G380 #3=(|List| |VarSet|)) (#4=#:G378 #3#) (#5=#:G379 NIL)
          (|lvint| #3#) (#6=#:G414 NIL) (|vv| NIL) (#7=#:G415 NIL)
          (|vl| (|List| (|Symbol|))) (#8=#:G416 NIL) (#9=#:G417 NIL)
          (|nvar| (|List| (|Symbol|)))
          (|DirP|
           (|Join| (|DirectProductCategory| |nf| #10=(|NonNegativeInteger|))
                   (CATEGORY |package|
                    (IF (|has| #10# (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|))))
          (|nExponent|
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (IF (|has| |Expon| (|Finite|))
                        (IF (|has| |DirP| (|Finite|))
                            (ATTRIBUTE (|Finite|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Monoid|))
                        (IF (|has| |DirP| (|Monoid|))
                            (ATTRIBUTE (|Monoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianMonoid|))
                        (IF (|has| |DirP| (|AbelianMonoid|))
                            (ATTRIBUTE (|AbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|CancellationAbelianMonoid|))
                        (IF (|has| |DirP| (|CancellationAbelianMonoid|))
                            (ATTRIBUTE (|CancellationAbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Group|))
                        (IF (|has| |DirP| (|Group|))
                            (ATTRIBUTE (|Group|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianGroup|))
                        (IF (|has| |DirP| (|AbelianGroup|))
                            (ATTRIBUTE (|AbelianGroup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedAbelianMonoidSup|))
                        (IF (|has| |DirP| (|OrderedAbelianMonoidSup|))
                            (ATTRIBUTE (|OrderedAbelianMonoidSup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedSet|))
                        (IF (|has| |DirP| (|OrderedSet|))
                            (ATTRIBUTE (|OrderedSet|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Comparable|))
                        (IF (|has| |DirP| (|Comparable|))
                            (ATTRIBUTE (|Comparable|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Hashable|))
                        (IF (|has| |DirP| (|Hashable|))
                            (ATTRIBUTE (|Hashable|))
                            |noBranch|)
                        |noBranch|)
                    (SIGNATURE |construct| (% |Expon| |DirP|))
                    (SIGNATURE |first| (|Expon| %))
                    (SIGNATURE |second| (|DirP| %)))))
          (|nPoly|
           (|Join| (|FiniteAbelianMonoidRing| F |nExponent|)
                   (|VariablesCommuteWithCoefficients|)
                   (CATEGORY |package|
                    (IF (|has| F (|canonicalUnitNormal|))
                        (ATTRIBUTE (|canonicalUnitNormal|))
                        |noBranch|)
                    (IF (|has| F (|Hashable|))
                        (IF (|has| |nExponent| (|Hashable|))
                            (ATTRIBUTE (|Hashable|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| F (|Comparable|))
                        (ATTRIBUTE (|Comparable|))
                        |noBranch|))))
          (|gp|
           (CATEGORY |package|
            (SIGNATURE |groebner| ((|List| |nPoly|) (|List| |nPoly|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|) (|String|)))
            (IF (|has| F (|Field|))
                (SIGNATURE |normalForm| (|nPoly| |nPoly| (|List| |nPoly|)))
                |noBranch|)))
          (|i| NIL) (#11=#:G418 NIL) (|vec2| (|Vector| (|NonNegativeInteger|)))
          (|df| (|List| (|NonNegativeInteger|))) (|lcf| (F))
          (|pol| #12=(|Polynomial| F)) (|f| (|DPoly|))
          (|lp| (|List| (|Polynomial| F))) (#13=#:G419 NIL) (|v| NIL)
          (#14=#:G420 NIL) (|npol| (|List| (|Polynomial| F))) (#15=#:G421 NIL)
          (#16=#:G423 NIL) (#17=#:G422 NIL)
          (|leq| (|List| (|Equation| (|Polynomial| F)))) (|n| (|Expon|))
          (#18=#:G412 NIL) (|lf| (|List| |nPoly|)) (#19=#:G424 NIL)
          (|dq| (|nExponent|)) (|lcq| (F)) (|q| (|nPoly|))
          (|vdq| (|Vector| (|NonNegativeInteger|))) (|j| NIL) (|p| NIL)
          (#20=#:G425 NIL) (#21=#:G404 #22=(|Polynomial| F)) (#23=#:G402 #22#)
          (#24=#:G403 NIL) (|g| #12#) (|solsn| (|List| (|Polynomial| F))))
         (SEQ
          (COND ((NULL |listf|) (SPADCALL NIL NIL (QREFELT % 118)))
                (#25='T
                 (SEQ (LETT |nf| (LENGTH |listf|))
                      (LETT |lvint|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT #1# |listf|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |g| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #2# (SPADCALL |g| (QREFELT % 36)))
                                     (COND
                                      (#5#
                                       (LETT #4#
                                             (SPADCALL #4# #2#
                                                       (QREFELT % 95))))
                                      ('T
                                       (PROGN
                                        (LETT #4# #2#)
                                        (LETT #5# 'T)))))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#5# #4#)
                                   (#25# (|IdentityError| '|setUnion|)))))
                      (LETT |vl|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |vv| NIL) (LETT #7# |lvint|) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |vv| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS (SPADCALL |vv| (QREFELT % 113))
                                                #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (LETT |nvar|
                            (PROGN
                             (LETT #8# NIL)
                             (SEQ (LETT |i| 1) (LETT #9# |nf|) G190
                                  (COND ((|greater_SI| |i| #9#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS (SPADCALL (QREFELT % 119))
                                                #8#))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #8#)))))
                      (LETT |DirP|
                            (|DirectProduct| |nf| (|NonNegativeInteger|)))
                      (LETT |nExponent| (|Product| (QREFELT % 7) |DirP|))
                      (LETT |nPoly|
                            (|PolynomialRing| (QREFELT % 6) |nExponent|))
                      (LETT |gp|
                            (|GroebnerPackage| (QREFELT % 6) |nExponent|
                                               |nPoly|))
                      (LETT |lf| NIL) (LETT |lp| NIL)
                      (SEQ (LETT |i| 1) (LETT #11# |listf|) G190
                           (COND
                            ((OR (ATOM #11#) (PROGN (LETT |f| (CAR #11#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |vec2| (SPADCALL |nf| 0 (QREFELT % 121)))
                                (SPADCALL |vec2| |i| 1 (QREFELT % 122))
                                (LETT |g|
                                      (SPADCALL
                                       (|compiledLookupCheck| '|0| (LIST '%)
                                                              |nPoly|)))
                                (LETT |pol| (|spadConstant| % 123))
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |f| (|spadConstant| % 13)
                                                  (QREFELT % 124)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |df|
                                            (SPADCALL
                                             (SPADCALL |f|
                                                       (SPADCALL |f|
                                                                 (QREFELT %
                                                                          24))
                                                       (QREFELT % 109))
                                             |lvint| (QREFELT % 126)))
                                      (LETT |lcf|
                                            (SPADCALL |f| (QREFELT % 17)))
                                      (LETT |pol|
                                            (SPADCALL |pol|
                                                      (|IDEAL;monompol| |df|
                                                       |lcf| |lvint| %)
                                                      (QREFELT % 127)))
                                      (LETT |g|
                                            (SPADCALL |g|
                                                      (SPADCALL |lcf|
                                                                (SPADCALL
                                                                 (SPADCALL |f|
                                                                           (QREFELT
                                                                            %
                                                                            20))
                                                                 (SPADCALL
                                                                  (|compiledLookupCheck|
                                                                   '|0|
                                                                   (LIST '%)
                                                                   |DirP|))
                                                                 (|compiledLookupCheck|
                                                                  '|construct|
                                                                  (LIST '%
                                                                        (|devaluate|
                                                                         (ELT %
                                                                              7))
                                                                        (|devaluate|
                                                                         |DirP|))
                                                                  |nExponent|))
                                                                (|compiledLookupCheck|
                                                                 '|monomial|
                                                                 (LIST '%
                                                                       (|devaluate|
                                                                        (ELT %
                                                                             6))
                                                                       (|devaluate|
                                                                        |nExponent|))
                                                                 |nPoly|))
                                                      (|compiledLookupCheck| '+
                                                                             (LIST
                                                                              '%
                                                                              '%
                                                                              '%)
                                                                             |nPoly|)))
                                      (EXIT
                                       (LETT |f|
                                             (SPADCALL |f| (QREFELT % 24)))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (LETT |lp| (CONS |pol| |lp|))
                                (EXIT
                                 (LETT |lf|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 50)
                                                   (SPADCALL
                                                    (|spadConstant| % 19)
                                                    (SPADCALL |vec2|
                                                              (|compiledLookupCheck|
                                                               '|directProduct|
                                                               (LIST '%
                                                                     (LIST
                                                                      '|Vector|
                                                                      (LIST
                                                                       '|NonNegativeInteger|)))
                                                               |DirP|))
                                                    (|compiledLookupCheck|
                                                     '|construct|
                                                     (LIST '%
                                                           (|devaluate|
                                                            (ELT % 7))
                                                           (|devaluate|
                                                            |DirP|))
                                                     |nExponent|))
                                                   (|compiledLookupCheck|
                                                    '|monomial|
                                                    (LIST '%
                                                          (|devaluate|
                                                           (ELT % 6))
                                                          (|devaluate|
                                                           |nExponent|))
                                                    |nPoly|))
                                         |g|
                                         (|compiledLookupCheck| '-
                                                                (LIST '% '% '%)
                                                                |nPoly|))
                                        |lf|))))
                           (LETT #11#
                                 (PROG1 (CDR #11#) (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |npol|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT |v| NIL) (LETT #14# |nvar|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |v| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS (SPADCALL |v| (QREFELT % 130))
                                                #13#))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))
                      (LETT |leq|
                            (PROGN
                             (LETT #15# NIL)
                             (SEQ (LETT #16# (REVERSE |lp|)) (LETT |p| NIL)
                                  (LETT #17# |npol|) G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN (LETT |p| (CAR #17#)) NIL)
                                        (ATOM #16#)
                                        (PROGN (LETT |pol| (CAR #16#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #15#
                                          (CONS
                                           (SPADCALL |p| |pol| (QREFELT % 131))
                                           #15#))))
                                  (LETT #17#
                                        (PROG1 (CDR #17#)
                                          (LETT #16# (CDR #16#))))
                                  (GO G190) G191 (EXIT (NREVERSE #15#)))))
                      (LETT |lf|
                            (SPADCALL |lf|
                                      (|compiledLookupCheck| '|groebner|
                                                             (LIST
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |nPoly|))
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |nPoly|)))
                                                             |gp|)))
                      (SEQ
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |lf| NIL
                                          (|compiledLookupCheck| '~=
                                                                 (LIST
                                                                  (LIST
                                                                   '|Boolean|)
                                                                  '% '%)
                                                                 (|List|
                                                                  |nPoly|))))
                               (GO G191)))
                             (SEQ (LETT |q| (|SPADfirst| |lf|))
                                  (LETT |dq|
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|degree|
                                                   (LIST
                                                    (|devaluate| |nExponent|)
                                                    '%)
                                                   |nPoly|)))
                                  (LETT |n|
                                        (SPADCALL |dq|
                                                  (|compiledLookupCheck|
                                                   '|first|
                                                   (LIST
                                                    (|devaluate| (ELT % 7)) '%)
                                                   |nExponent|)))
                                  (COND
                                   ((SPADCALL |n| (|spadConstant| % 19)
                                              (QREFELT % 132))
                                    (PROGN
                                     (LETT #18# |$NoValue|)
                                     (GO #26=#:G399))))
                                  (EXIT (LETT |lf| (CDR |lf|))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #26# (EXIT #18#))
                      (LETT |solsn| NIL)
                      (SEQ (LETT #19# |lf|) G190
                           (COND
                            ((OR (ATOM #19#) (PROGN (LETT |q| (CAR #19#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |g| (|spadConstant| % 123))
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |q|
                                                  (SPADCALL
                                                   (|compiledLookupCheck| '|0|
                                                                          (LIST
                                                                           '%)
                                                                          |nPoly|))
                                                  (|compiledLookupCheck| '~=
                                                                         (LIST
                                                                          (LIST
                                                                           '|Boolean|)
                                                                          '%
                                                                          '%)
                                                                         |nPoly|)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dq|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|degree|
                                                       (LIST
                                                        (|devaluate|
                                                         |nExponent|)
                                                        '%)
                                                       |nPoly|)))
                                      (LETT |lcq|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|leadingCoefficient|
                                                       (LIST
                                                        (|devaluate| (ELT % 6))
                                                        '%)
                                                       |nPoly|)))
                                      (LETT |q|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|reductum| (LIST '% '%)
                                                       |nPoly|)))
                                      (LETT |vdq|
                                            (SPADCALL |dq|
                                                      (|compiledLookupCheck|
                                                       '|second|
                                                       (LIST
                                                        (|devaluate| |DirP|)
                                                        '%)
                                                       |nExponent|)))
                                      (EXIT
                                       (LETT |g|
                                             (SPADCALL |g|
                                                       (SPADCALL |lcq|
                                                                 (PROGN
                                                                  (LETT #24#
                                                                        NIL)
                                                                  (SEQ
                                                                   (LETT |j| 1)
                                                                   (LETT |p|
                                                                         NIL)
                                                                   (LETT #20#
                                                                         |npol|)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #20#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |p|
                                                                        (CAR
                                                                         #20#))
                                                                       NIL))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT
                                                                       #21#
                                                                       (SPADCALL
                                                                        |p|
                                                                        (SPADCALL
                                                                         |vdq|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          133))
                                                                        (QREFELT
                                                                         %
                                                                         134)))
                                                                      (COND
                                                                       (#24#
                                                                        (LETT
                                                                         #23#
                                                                         (SPADCALL
                                                                          #23#
                                                                          #21#
                                                                          (QREFELT
                                                                           %
                                                                           135))))
                                                                       ('T
                                                                        (PROGN
                                                                         (LETT
                                                                          #23#
                                                                          #21#)
                                                                         (LETT
                                                                          #24#
                                                                          'T)))))))
                                                                   (LETT #20#
                                                                         (PROG1
                                                                             (CDR
                                                                              #20#)
                                                                           (LETT
                                                                            |j|
                                                                            (|inc_SI|
                                                                             |j|))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                                  (COND
                                                                   (#24# #23#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     % 136))))
                                                                 (QREFELT %
                                                                          137))
                                                       (QREFELT % 127)))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT (LETT |solsn| (CONS |g| |solsn|))))
                           (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |solsn| |leq| (QREFELT % 118))))))))) 

(MAKEPROP '|IDEAL;coerce;L%;31| '|SPADreplace| '(XLAM (|Id|) (CONS |Id| NIL))) 

(SDEFUN |IDEAL;coerce;L%;31| ((|Id| (|List| |DPoly|)) (% (%))) (CONS |Id| NIL)) 

(SDEFUN |IDEAL;coerce;%Of;32| ((I (%)) (% (|OutputForm|)))
        (SPROG ((|Idl| (|List| |DPoly|)))
               (SEQ (LETT |Idl| (QCAR I))
                    (EXIT
                     (COND
                      ((NULL |Idl|)
                       (SPADCALL (LIST (|spadConstant| % 13)) (QREFELT % 140)))
                      ('T (SPADCALL |Idl| (QREFELT % 140)))))))) 

(SDEFUN |IDEAL;ideal;L%;33| ((|Id| (|List| |DPoly|)) (% (%)))
        (SPROG ((#1=#:G434 NIL) (|f| NIL) (#2=#:G435 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |f| NIL) (LETT #2# |Id|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (|spadConstant| % 13) (QREFELT % 124))
                           (LETT #1# (CONS |f| #1#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 NIL)))) 

(SDEFUN |IDEAL;groebnerIdeal;L%;34| ((|Id| (|List| |DPoly|)) (% (%)))
        (CONS |Id| 'T)) 

(MAKEPROP '|IDEAL;generators;%L;35| '|SPADreplace| 'QCAR) 

(SDEFUN |IDEAL;generators;%L;35| ((I (%)) (% (|List| |DPoly|))) (QCAR I)) 

(MAKEPROP '|IDEAL;groebner?;%B;36| '|SPADreplace| 'QCDR) 

(SDEFUN |IDEAL;groebner?;%B;36| ((I (%)) (% (|Boolean|))) (QCDR I)) 

(SDEFUN |IDEAL;one?;%B;37| ((I (%)) (% (|Boolean|)))
        (SPADCALL (|spadConstant| % 51) I (QREFELT % 72))) 

(SDEFUN |IDEAL;zero?;%B;38| ((I (%)) (% (|Boolean|)))
        (NULL (QCAR (SPADCALL I (QREFELT % 69))))) 

(DECLAIM (NOTINLINE |PolynomialIdeal;|)) 

(DEFUN |PolynomialIdeal;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialIdeal| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 148))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|ConvertibleTo|
                                                         (|Symbol|)))))))
    (|haddProp| |$ConstructorCache| '|PolynomialIdeal|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10
              (|Record| (|:| |idl| (|List| |#4|)) (|:| |isGr| (|Boolean|))))
    (QSETREFV % 11 (|Product| (|NonNegativeInteger|) |#2|))
    (QSETREFV % 12 (|PolynomialRing| |#1| (QREFELT % 11)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 138
                 (CONS (|dispatchFunction| |IDEAL;relationsIdeal;LSt;30|)
                       %)))))
    %))) 

(DEFUN |PolynomialIdeal| (&REST #1=#:G442)
  (SPROG NIL
         (PROG (#2=#:G443)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialIdeal|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialIdeal;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialIdeal|)))))))))) 

(MAKEPROP '|PolynomialIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| '|newExpon| '|newPoly|
              (0 . |0|) (|Boolean|) (4 . =) (10 . |0|)
              (14 . |leadingCoefficient|) (19 . |0|) (23 . |0|) (27 . |degree|)
              (|NonNegativeInteger|) (32 . |construct|) (38 . |monomial|)
              (44 . |reductum|) (49 . +) (55 . =) (61 . |degree|)
              (66 . |first|) (71 . ~=) (77 . |reductum|)
              (82 . |leadingCoefficient|) (87 . |second|) (92 . |monomial|)
              (98 . +) (|List| 8) (104 . |variables|) (109 . =)
              (|SparseUnivariatePolynomial| %) (115 . |univariate|)
              (|SparseUnivariatePolynomial| 9) (121 . |leadingCoefficient|)
              (|Union| % '"failed") (126 . |exquo|) (|List| 12)
              (|GroebnerPackage| 6 11 12) (132 . |groebner|) (137 . |member?|)
              (143 . |append|) (149 . |ground?|) (154 . |1|) (158 . |1|)
              (|Integer|) (162 . |elt|) (|List| 35) (168 . |concat|) (|List| 9)
              |IDEAL;generators;%L;35| (174 . |1|) (178 . |position|)
              (184 . |delete|) (190 . |#|) (195 . >) (|Mapping| 14 35 35)
              (201 . |sort|) (207 . ~=) (213 . |setDifference|)
              |IDEAL;in?;2%B;12| |IDEAL;=;2%B;10| |IDEAL;groebner;2%;13|
              (|GroebnerPackage| 6 7 9) (219 . |normalForm|)
              |IDEAL;element?;DPoly%B;11| (225 . |zero?|) (230 . |groebner|)
              (235 . |1|) (239 . -) (245 . *) (251 . |concat|)
              |IDEAL;intersect;3%;14| (|List| %) |IDEAL;intersect;L%;15|
              |IDEAL;coerce;L%;31| (|GroebnerInternalPackage| 6 7 9)
              (257 . |minGbasis|) |IDEAL;quotient;%DPoly%;16|
              |IDEAL;ideal;L%;33| |IDEAL;quotient;3%;17| (262 . |concat|)
              |IDEAL;+;3%;18| (268 . *) (274 . |append|) |IDEAL;*;3%;19|
              |IDEAL;^;%Nni%;20| |IDEAL;saturate;%DPoly%;21| (280 . |setUnion|)
              (286 . |monomial|) (293 . |eval|) |IDEAL;saturate;%DPolyL%;22|
              (300 . =) (|Union| 8 '"failed") (306 . |mainVariable|)
              |IDEAL;zeroDim?;%LB;23| |IDEAL;zeroDim?;%B;24|
              (311 . |normalForm|) |IDEAL;inRadical?;DPoly%B;25|
              |IDEAL;leadingIdeal;2%;28| |IDEAL;dimension;%LI;26|
              |IDEAL;dimension;%I;27| (317 . -) (|Polynomial| 6)
              (323 . |coerce|) (|Symbol|) (328 . |convert|) (333 . |monomial|)
              (|List| 110) (|List| 128) (|SuchThat| 115 116)
              (340 . |construct|) (346 . |new|) (|Vector| 21) (350 . |new|)
              (356 . |setelt!|) (363 . |0|) (367 . ~=) (|List| 21)
              (373 . |degree|) (379 . +) (|Equation| 110) (385 . |0|)
              (389 . |coerce|) (394 . =) (400 . =) (406 . |elt|) (412 . ^)
              (418 . *) (424 . |1|) (428 . *) (434 . |relationsIdeal|)
              (|OutputForm|) (439 . |coerce|) |IDEAL;coerce;%Of;32|
              |IDEAL;groebnerIdeal;L%;34| |IDEAL;groebner?;%B;36|
              |IDEAL;one?;%B;37| |IDEAL;zero?;%B;38| (|String|)
              (|Record| (|:| |mval| (|Matrix| 6)) (|:| |invmval| (|Matrix| 6))
                        (|:| |genIdeal| %)))
           '#(~= 444 |zeroDim?| 450 |zero?| 461 |saturate| 466 |relationsIdeal|
              479 |quotient| 484 |one?| 496 |leadingIdeal| 501 |latex| 506
              |intersect| 511 |inRadical?| 522 |in?| 528 |ideal| 534
              |groebnerIdeal| 539 |groebner?| 544 |groebner| 549 |generators|
              554 |generalPosition| 559 |element?| 565 |dimension| 571 |coerce|
              582 |backOldPos| 592 ^ 597 = 603 + 609 * 615)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 139) (|BasicType|))
                        (|makeByteWordVec2| 147
                                            '(0 9 0 13 2 9 14 0 0 15 0 12 0 16
                                              1 9 6 0 17 0 6 0 18 0 7 0 19 1 9
                                              7 0 20 2 11 0 21 7 22 2 12 0 6 11
                                              23 1 9 0 0 24 2 12 0 0 0 25 2 12
                                              14 0 0 26 1 12 11 0 27 1 11 21 0
                                              28 2 21 14 0 0 29 1 12 0 0 30 1
                                              12 6 0 31 1 11 7 0 32 2 9 0 6 7
                                              33 2 9 0 0 0 34 1 9 35 0 36 2 35
                                              14 0 0 37 2 9 38 0 8 39 1 40 9 0
                                              41 2 9 42 0 0 43 1 45 44 44 46 2
                                              35 14 8 0 47 2 35 0 0 0 48 1 9 14
                                              0 49 0 6 0 50 0 9 0 51 2 35 8 0
                                              52 53 2 54 0 0 0 55 0 21 0 58 2
                                              35 52 8 0 59 2 35 0 0 52 60 1 35
                                              21 0 61 2 21 14 0 0 62 2 54 0 63
                                              0 64 2 35 14 0 0 65 2 35 0 0 0 66
                                              2 70 9 9 56 71 1 9 14 0 73 1 70
                                              56 56 74 0 12 0 75 2 12 0 0 0 76
                                              2 12 0 0 0 77 2 44 0 0 0 78 1 83
                                              56 56 84 2 56 0 0 0 88 2 9 0 0 0
                                              90 2 56 0 0 0 91 2 35 0 0 0 95 3
                                              9 0 0 8 21 96 3 9 0 0 35 80 97 2
                                              56 14 0 0 99 1 9 100 0 101 2 45
                                              12 12 44 104 2 9 0 0 0 109 1 110
                                              0 6 111 1 8 112 0 113 3 110 0 0
                                              112 21 114 2 117 0 115 116 118 0
                                              112 0 119 2 120 0 21 21 121 3 120
                                              21 0 52 21 122 0 110 0 123 2 9 14
                                              0 0 124 2 9 125 0 35 126 2 110 0
                                              0 0 127 0 128 0 129 1 110 0 112
                                              130 2 128 0 110 110 131 2 7 14 0
                                              0 132 2 120 21 0 52 133 2 110 0 0
                                              21 134 2 110 0 0 0 135 0 110 0
                                              136 2 110 0 6 0 137 1 0 117 56
                                              138 1 56 139 0 140 2 0 14 0 0 1 1
                                              0 14 0 103 2 0 14 0 35 102 1 0 14
                                              0 145 2 0 0 0 9 94 3 0 0 0 9 35
                                              98 1 1 117 56 138 2 0 0 0 9 85 2
                                              0 0 0 0 87 1 0 14 0 144 1 0 0 0
                                              106 1 0 146 0 1 1 0 0 80 81 2 0 0
                                              0 0 79 2 0 14 9 0 105 2 0 14 0 0
                                              67 1 0 0 56 86 1 0 0 56 142 1 0
                                              14 0 143 1 0 0 0 69 1 0 56 0 57 2
                                              0 147 0 35 1 2 0 14 9 0 72 2 0 52
                                              0 35 107 1 0 52 0 108 1 0 139 0
                                              141 1 0 0 56 82 1 0 0 147 1 2 0 0
                                              0 21 93 2 0 14 0 0 68 2 0 0 0 0
                                              89 2 0 0 0 0 92)))))
           '|lookupComplete|)) 
