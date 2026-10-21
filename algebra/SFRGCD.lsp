
(SDEFUN |SFRGCD;startTableGcd!;3SV;1|
        ((|ok| (|String|)) (|ko| (|String|)) (|domainName| (|String|))
         (% (|Void|)))
        (SEQ (SPADCALL (QREFELT % 15)) (SPADCALL |ok| |ko| (QREFELT % 17))
             (SPADCALL |domainName| (QREFELT % 18))
             (EXIT (SPADCALL (QREFELT % 19))))) 

(SDEFUN |SFRGCD;stopTableGcd!;V;2| ((% (|Void|)))
        (SEQ (COND ((SPADCALL (QREFELT % 22)) (SPADCALL (QREFELT % 23))))
             (EXIT (SPADCALL (QREFELT % 24))))) 

(SDEFUN |SFRGCD;startTableInvSet!;3SV;3|
        ((|ok| (|String|)) (|ko| (|String|)) (|domainName| (|String|))
         (% (|Void|)))
        (SEQ (SPADCALL (QREFELT % 28)) (SPADCALL |ok| |ko| (QREFELT % 29))
             (SPADCALL |domainName| (QREFELT % 30))
             (EXIT (SPADCALL (QREFELT % 19))))) 

(SDEFUN |SFRGCD;stopTableInvSet!;V;4| ((% (|Void|)))
        (SEQ (COND ((SPADCALL (QREFELT % 32)) (SPADCALL (QREFELT % 33))))
             (EXIT (SPADCALL (QREFELT % 34))))) 

(SDEFUN |SFRGCD;stoseInvertible?;PTSB;5|
        ((|p| (P)) (|ts| (TS)) (% (|Boolean|)))
        (SPROG
         ((|q| (P)) (|v| (V))
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#1=#:G112 NIL) (#2=#:G110 NIL) (#3=#:G97 NIL)
          (|ts_v| (P)) (|ts_v-| (TS))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#4=#:G113 NIL) (|g| (P)) (#5=#:G111 NIL)
          (#6=#:G109 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SPADCALL (SPADCALL |p| |ts| (QREFELT % 36)) (QREFELT % 37)))
            (EXIT
             (COND ((SPADCALL |q| (QREFELT % 38)) NIL)
                   ((SPADCALL |q| |ts| (QREFELT % 39)) 'T)
                   ('T
                    (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 40)))
                         (COND
                          ((NULL (SPADCALL |v| |ts| (QREFELT % 41)))
                           (EXIT
                            (SEQ
                             (LETT |toCheck|
                                   (SPADCALL |p| |ts| (QREFELT % 44)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bwt| NIL) (LETT #1# |toCheck|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |bwt| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|BooleanEquality| (QCAR |bwt|) NIL)
                                        (PROGN
                                         (LETT #2#
                                               (PROGN
                                                (LETT #5# NIL)
                                                (GO #7=#:G108)))
                                         (GO #8=#:G90))))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL)))
                              #8# (EXIT #2#))
                             (EXIT (PROGN (LETT #5# 'T) (GO #7#)))))))
                         (LETT |ts_v|
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL |ts| |v| (QREFELT % 46)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                                 (|Union| (QREFELT % 9)
                                                          "failed")
                                                 #3#)))
                         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT % 47)))
                         (LETT |lgwt|
                               (SPADCALL |ts_v| |q| |ts_v-| NIL 'T
                                         (QREFELT % 49)))
                         (SEQ (LETT |gwt| NIL) (LETT #4# |lgwt|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |gwt| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |g| (QCAR |gwt|))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |g| (QREFELT % 50)))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |g| (QREFELT % 40)) |v|
                                           (QREFELT % 51))
                                          (PROGN
                                           (LETT #6#
                                                 (PROGN
                                                  (LETT #5# NIL)
                                                  (GO #7#)))
                                           (GO #9=#:G103)))))))))
                               #9# (EXIT #6#))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))))
          #7# (EXIT #5#)))) 

(SDEFUN |SFRGCD;stosePrepareSubResAlgo;2PTSL;6|
        ((|p1| (P)) (|p2| (P)) (|ts| (TS))
         (% (|List| #1=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))))
        (SPROG
         ((|v| (V)) (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#2=#:G133 NIL) (|p3| (P)) (#3=#:G120 NIL) (|s| (P))
          (|newp2| (P))
          (|toSave|
           (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|toSee| (|List| #1#)))
         (SEQ (LETT |toSee| (LIST (CONS (LIST |p1| |p2|) |ts|)))
              (LETT |toSave| NIL) (LETT |v| (SPADCALL |p1| (QREFELT % 40)))
              (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                   (SEQ (LETT |lpwt| (|SPADfirst| |toSee|))
                        (LETT |toSee| (CDR |toSee|))
                        (LETT |p1| (SPADCALL (QCAR |lpwt|) 1 (QREFELT % 55)))
                        (LETT |p2| (SPADCALL (QCAR |lpwt|) 2 (QREFELT % 55)))
                        (LETT |ts| (QCDR |lpwt|))
                        (LETT |lbwt|
                              (SPADCALL (SPADCALL |p2| |v| (QREFELT % 56)) |ts|
                                        (QREFELT % 44)))
                        (EXIT
                         (SEQ (LETT |bwt| NIL) (LETT #2# |lbwt|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |bwt| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((|BooleanEquality| (QCAR |bwt|) 'T)
                                 (COND
                                  ((> (SPADCALL |p2| |v| (QREFELT % 58)) 0)
                                   (EXIT
                                    (SEQ
                                     (LETT |p3|
                                           (SPADCALL |p1|
                                                     (SPADCALL |p2|
                                                               (QREFELT % 59))
                                                     (QREFELT % 60)))
                                     (LETT |s|
                                           (SPADCALL
                                            (SPADCALL |p2| (QREFELT % 61))
                                            (PROG1
                                                (LETT #3#
                                                      (-
                                                       (SPADCALL |p1|
                                                                 (QREFELT %
                                                                          62))
                                                       (SPADCALL |p2|
                                                                 (QREFELT %
                                                                          62))))
                                              (|check_subtype2| (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                            (QREFELT % 63)))
                                     (EXIT
                                      (LETT |toSave|
                                            (CONS
                                             (CONS (LIST |p2| |p3| |s|)
                                                   (QCDR |bwt|))
                                             |toSave|)))))))))
                               (LETT |newp2|
                                     (SPADCALL
                                      (SPADCALL |p2| (QCDR |bwt|)
                                                (QREFELT % 36))
                                      (QREFELT % 37)))
                               (EXIT
                                (COND
                                 ((|BooleanEquality| (QCAR |bwt|) 'T)
                                  (LETT |toSave|
                                        (CONS
                                         (CONS
                                          (LIST |p2| (|spadConstant| % 64)
                                                (|spadConstant| % 65))
                                          (QCDR |bwt|))
                                         |toSave|)))
                                 ((SPADCALL |newp2| (QREFELT % 38))
                                  (LETT |toSave|
                                        (CONS
                                         (CONS
                                          (LIST |p1| (|spadConstant| % 64)
                                                (|spadConstant| % 65))
                                          (QCDR |bwt|))
                                         |toSave|)))
                                 ('T
                                  (LETT |toSee|
                                        (CONS
                                         (CONS (LIST |p1| |newp2|)
                                               (QCDR |bwt|))
                                         |toSee|))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |toSave|)))) 

(SDEFUN |SFRGCD;stoseIntegralLastSubResultant;2PTSL;7|
        ((|p1| (P)) (|p2| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG ((|lsr| (P)) (|gi1i2| (P)) (|ex| (|Union| P "failed")))
               (SEQ (LETT |lsr| (SPADCALL |p1| |p2| (QREFELT % 69)))
                    (EXIT
                     (COND
                      ((OR (SPADCALL |lsr| (QREFELT % 50))
                           (SPADCALL (SPADCALL |lsr| (QREFELT % 40))
                                     (SPADCALL |p1| (QREFELT % 40))
                                     (QREFELT % 70)))
                       (LIST (CONS |lsr| |ts|)))
                      ('T
                       (SEQ
                        (LETT |gi1i2|
                              (SPADCALL (SPADCALL |p1| (QREFELT % 61))
                                        (SPADCALL |p2| (QREFELT % 61))
                                        (QREFELT % 71)))
                        (LETT |ex|
                              (SPADCALL (SPADCALL |gi1i2| |lsr| (QREFELT % 72))
                                        (SPADCALL |lsr| (QREFELT % 61))
                                        (QREFELT % 74)))
                        (EXIT
                         (COND ((QEQCAR |ex| 1) (LIST (CONS |lsr| |ts|)))
                               ('T (LIST (CONS (QCDR |ex|) |ts|)))))))))))) 

(SDEFUN |SFRGCD;stoseInternalLastSubResultant;2PTS2BL;8|
        ((|p1| (P)) (|p2| (P)) (|ts| (TS)) (|b1| (|Boolean|))
         (|b2| (|Boolean|))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG
         ((|k|
           (|Record| (|:| |arg1| P) (|:| |arg2| P) (|:| |arg3| TS)
                     (|:| |arg4| (|Boolean|))))
          (|e|
           (|Union| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))
                    "failed"))
          (#1=#:G162 NIL) (|p3| (P)) (#2=#:G156 NIL) (|s| (P))
          (|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|toSave| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
         (SEQ
          (EXIT
           (SEQ (LETT |k| (VECTOR |p1| |p2| |ts| |b2|))
                (LETT |e| (SPADCALL |k| (QREFELT % 77)))
                (EXIT
                 (COND ((QEQCAR |e| 0) (QCDR |e|))
                       ((SPADCALL |ts| (QREFELT % 78))
                        (SEQ
                         (LETT |toSave|
                               (SPADCALL |p1| |p2| |ts| (QREFELT % 75)))
                         (SPADCALL |k| |toSave| (QREFELT % 79))
                         (EXIT (PROGN (LETT #1# |toSave|) (GO #3=#:G161)))))
                       (#4='T
                        (SEQ
                         (COND
                          (|b1|
                           (SEQ
                            (LETT |p3|
                                  (SPADCALL |p1| (SPADCALL |p2| (QREFELT % 59))
                                            (QREFELT % 60)))
                            (LETT |s|
                                  (SPADCALL (SPADCALL |p2| (QREFELT % 61))
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL |p1|
                                                                 (QREFELT %
                                                                          62))
                                                       (SPADCALL |p2|
                                                                 (QREFELT %
                                                                          62))))
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (QREFELT % 63)))
                            (EXIT
                             (LETT |toSee|
                                   (LIST (CONS (LIST |p2| |p3| |s|) |ts|))))))
                          (#4#
                           (LETT |toSee|
                                 (SPADCALL |p1| |p2| |ts| (QREFELT % 68)))))
                         (LETT |toSave|
                               (SPADCALL |toSee| (SPADCALL |p1| (QREFELT % 40))
                                         |b2| (QREFELT % 80)))
                         (SPADCALL |k| |toSave| (QREFELT % 79))
                         (EXIT |toSave|)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SFRGCD;stoseInternalLastSubResultant;LVBL;9|
        ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
         (|v| (V)) (|b2| (|Boolean|))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG
         ((#1=#:G189 NIL) (|ts| (TS))
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#2=#:G190 NIL) (#3=#:G188 NIL)
          (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (#4=#:G176 NIL) (|delta| (|NonNegativeInteger|)) (|p3| (P))
          (#5=#:G191 NIL)
          (|toReturn| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|#G37| (P)) (|#G38| (P)) (|p1| (P)) (|p2| (P)) (|s| (P))
          (#6=#:G192 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |toReturn| NIL)
                (SEQ G190 (COND ((NULL (NULL (NULL |llpwt|))) (GO G191)))
                     (SEQ (LETT |toSee| |llpwt|) (LETT |llpwt| NIL)
                          (SEQ (LETT #1# |toSee|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |lpwt| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |p1|
                                      (SPADCALL (QCAR |lpwt|) 1
                                                (QREFELT % 55)))
                                (LETT |p2|
                                      (SPADCALL (QCAR |lpwt|) 2
                                                (QREFELT % 55)))
                                (LETT |s|
                                      (SPADCALL (QCAR |lpwt|) 3
                                                (QREFELT % 55)))
                                (LETT |ts| (QCDR |lpwt|))
                                (LETT |lbwt|
                                      (SPADCALL
                                       (SPADCALL |p2| |v| (QREFELT % 56)) |ts|
                                       (QREFELT % 44)))
                                (EXIT
                                 (SEQ (LETT |bwt| NIL) (LETT #2# |lbwt|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |bwt| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((|BooleanEquality| (QCAR |bwt|) NIL)
                                          (SEQ
                                           (LETT |toReturn|
                                                 (CONS (CONS |p1| (QCDR |bwt|))
                                                       |toReturn|))
                                           (EXIT
                                            (COND
                                             (|b2|
                                              (COND
                                               ((PLUSP
                                                 (SPADCALL |p1| |v|
                                                           (QREFELT % 58)))
                                                (PROGN
                                                 (LETT #3# |toReturn|)
                                                 (GO #7=#:G187)))))))))
                                         ('T
                                          (LETT |llpwt|
                                                (CONS
                                                 (CONS (LIST |p1| |p2| |s|)
                                                       (QCDR |bwt|))
                                                 |llpwt|))))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND ((NULL |llpwt|) "leave")
                                 ('T
                                  (SEQ (LETT |toSee| |llpwt|)
                                       (LETT |llpwt| NIL)
                                       (LETT |lpwt| (|SPADfirst| |toSee|))
                                       (LETT |toSee| (CDR |toSee|))
                                       (LETT |p1|
                                             (SPADCALL (QCAR |lpwt|) 1
                                                       (QREFELT % 55)))
                                       (LETT |p2|
                                             (SPADCALL (QCAR |lpwt|) 2
                                                       (QREFELT % 55)))
                                       (LETT |s|
                                             (SPADCALL (QCAR |lpwt|) 3
                                                       (QREFELT % 55)))
                                       (LETT |delta|
                                             (PROG1
                                                 (LETT #4#
                                                       (-
                                                        (SPADCALL |p1|
                                                                  (QREFELT %
                                                                           62))
                                                        (SPADCALL |p2| |v|
                                                                  (QREFELT %
                                                                           58))))
                                               (|check_subtype2| (>= #4# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #4#)))
                                       (LETT |p3|
                                             (SPADCALL |p2|
                                                       (SPADCALL |p2| |v|
                                                                 (QREFELT %
                                                                          56))
                                                       |s| |delta|
                                                       (QREFELT % 81)))
                                       (EXIT
                                        (COND
                                         ((ZEROP
                                           (SPADCALL |p3| |v| (QREFELT % 58)))
                                          (SEQ
                                           (LETT |toReturn|
                                                 (CONS
                                                  (CONS |p3| (QCDR |lpwt|))
                                                  |toReturn|))
                                           (EXIT
                                            (SEQ (LETT #5# |toSee|) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT |lpwt| (CAR #5#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |toReturn|
                                                         (CONS
                                                          (CONS |p3|
                                                                (QCDR |lpwt|))
                                                          |toReturn|))))
                                                 (LETT #5# (CDR #5#)) (GO G190)
                                                 G191 (EXIT NIL)))))
                                         ('T
                                          (SEQ
                                           (PROGN
                                            (LETT |#G37| |p3|)
                                            (LETT |#G38|
                                                  (SPADCALL |p1| |p2| |p3| |s|
                                                            (QREFELT % 82)))
                                            (LETT |p1| |#G37|)
                                            (LETT |p2| |#G38|))
                                           (LETT |s|
                                                 (SPADCALL |p1| |v|
                                                           (QREFELT % 56)))
                                           (LETT |llpwt|
                                                 (CONS
                                                  (CONS (LIST |p1| |p2| |s|)
                                                        (QCDR |lpwt|))
                                                  |llpwt|))
                                           (EXIT
                                            (SEQ (LETT #6# |toSee|) G190
                                                 (COND
                                                  ((OR (ATOM #6#)
                                                       (PROGN
                                                        (LETT |lpwt| (CAR #6#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |llpwt|
                                                         (CONS
                                                          (CONS
                                                           (LIST |p1| |p2| |s|)
                                                           (QCDR |lpwt|))
                                                          |llpwt|))))
                                                 (LETT #6# (CDR #6#)) (GO G190)
                                                 G191 (EXIT NIL))))))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |toReturn|)))
          #7# (EXIT #3#)))) 

(SDEFUN |SFRGCD;stoseLastSubResultant;2PTSL;10|
        ((|p1| (P)) (|p2| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG ((|#G44| (P)) (|#G45| (P)))
               (SEQ
                (COND
                 ((SPADCALL |p1| (QREFELT % 50))
                  (|error|
                   "in stoseLastSubResultantElseSplit$SFRGCD  : bad #1"))
                 ((OR (SPADCALL |p2| (QREFELT % 50))
                      (NULL
                       (SPADCALL (SPADCALL |p2| (QREFELT % 40))
                                 (SPADCALL |p1| (QREFELT % 40))
                                 (QREFELT % 51))))
                  (|error|
                   "in stoseLastSubResultantElseSplit$SFRGCD : bad #2"))
                 ((OR
                   (SPADCALL (SPADCALL |p1| (QREFELT % 40)) |ts|
                             (QREFELT % 41))
                   (NULL (SPADCALL |p1| |ts| (QREFELT % 83))))
                  (|error|
                   "in stoseLastSubResultantElseSplit$SFRGCD : bad #1"))
                 ((NULL (SPADCALL |p2| |ts| (QREFELT % 83)))
                  (|error|
                   "in stoseLastSubResultantElseSplit$SFRGCD : bad #2"))
                 ('T
                  (SEQ
                   (COND
                    ((SPADCALL |p1| |ts| (QREFELT % 84))
                     (COND
                      ((SPADCALL |p2| |ts| (QREFELT % 84))
                       (EXIT (SPADCALL |p1| |p2| |ts| (QREFELT % 75)))))))
                   (COND
                    ((< (SPADCALL |p1| (QREFELT % 62))
                        (SPADCALL |p2| (QREFELT % 62)))
                     (SEQ
                      (PROGN
                       (LETT |#G44| |p2|)
                       (LETT |#G45| |p1|)
                       (LETT |p1| |#G44|)
                       (LETT |p2| |#G45|))
                      (EXIT
                       (COND
                        ((ODDP (SPADCALL |p1| (QREFELT % 62)))
                         (COND
                          ((ODDP (SPADCALL |p2| (QREFELT % 62)))
                           (LETT |p2| (SPADCALL |p2| (QREFELT % 59)))))))))))
                   (EXIT (SPADCALL |p1| |p2| |ts| NIL NIL (QREFELT % 49))))))))) 

(SDEFUN |SFRGCD;stoseSquareFreePart_wip|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (SPROG
         ((|v| (V)) (|q| (P))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#1=#:G216 NIL) (|us| (TS)) (|g| (P)) (|sfp| (P))
          (|lpwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
         (SEQ
          (COND ((EQL (SPADCALL |p| (QREFELT % 62)) 1) (LIST (CONS |p| |ts|)))
                ('T
                 (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 40)))
                      (LETT |q|
                            (SPADCALL (SPADCALL |p| |v| (QREFELT % 87))
                                      (QREFELT % 88)))
                      (LETT |lgwt|
                            (SPADCALL |p| |q| |ts| 'T NIL (QREFELT % 49)))
                      (LETT |lpwt| NIL)
                      (SEQ (LETT |gwt| NIL) (LETT #1# |lgwt|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |gwt| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |g| (QCAR |gwt|))
                                (LETT |us| (QCDR |gwt|))
                                (COND
                                 ((OR (SPADCALL |g| (QREFELT % 50))
                                      (SPADCALL (SPADCALL |g| (QREFELT % 40))
                                                |v| (QREFELT % 70)))
                                  (EXIT
                                   (LETT |lpwt|
                                         (CONS (CONS |p| |us|) |lpwt|)))))
                                (LETT |g| (SPADCALL |g| (QREFELT % 88)))
                                (LETT |sfp| (SPADCALL |p| |g| (QREFELT % 89)))
                                (LETT |sfp|
                                      (SPADCALL
                                       (SPADCALL |sfp| |us| (QREFELT % 90))
                                       (QREFELT % 88)))
                                (EXIT
                                 (LETT |lpwt|
                                       (CONS (CONS |sfp| |us|) |lpwt|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |lpwt|))))))) 

(SDEFUN |SFRGCD;stoseSquareFreePart_base|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (LIST (CONS |p| |ts|))) 

(SDEFUN |SFRGCD;stoseSquareFreePart;PTSL;13|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))))
        (|SFRGCD;stoseSquareFreePart_wip| |p| |ts| %)) 

(SDEFUN |SFRGCD;stoseInvertible?_sqfreg;PTSL;14|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPROG
         ((|q| (P)) (|v| (V))
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#1=#:G254 NIL) (|newq| (P)) (#2=#:G253 NIL)
          (#3=#:G227 NIL) (|ts_v| (P)) (|ts_v-| (TS)) (|ts_v+| (TS))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#4=#:G255 NIL) (|lts| #5=(|List| TS)) (#6=#:G256 NIL)
          (|g| (P)) (|lts_g| #5#) (|ts_g| NIL) (#7=#:G257 NIL) (|h| (P))
          (|lts_h| #5#) (|ts_h| NIL) (#8=#:G258 NIL)
          (|lbwt|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SPADCALL (SPADCALL |p| |ts| (QREFELT % 36)) (QREFELT % 37)))
            (EXIT
             (COND ((SPADCALL |q| (QREFELT % 38)) (LIST (CONS NIL |ts|)))
                   ((SPADCALL |q| |ts| (QREFELT % 39)) (LIST (CONS 'T |ts|)))
                   ('T
                    (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 40)))
                         (COND
                          ((NULL (SPADCALL |v| |ts| (QREFELT % 41)))
                           (EXIT
                            (SEQ (LETT |lbwt| NIL)
                                 (LETT |toCheck|
                                       (SPADCALL (SPADCALL |q| (QREFELT % 61))
                                                 |ts| (QREFELT % 92)))
                                 (SEQ (LETT |bwt| NIL) (LETT #1# |toCheck|)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |bwt| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((QCAR |bwt|)
                                          (LETT |lbwt| (CONS |bwt| |lbwt|)))
                                         ('T
                                          (SEQ
                                           (LETT |newq|
                                                 (SPADCALL |q| (QCDR |bwt|)
                                                           (QREFELT % 93)))
                                           (EXIT
                                            (COND
                                             ((SPADCALL |newq| (QREFELT % 38))
                                              (LETT |lbwt|
                                                    (CONS |bwt| |lbwt|)))
                                             ('T
                                              (LETT |lbwt|
                                                    (SPADCALL
                                                     (SPADCALL |newq|
                                                               (QCDR |bwt|)
                                                               (QREFELT % 92))
                                                     |lbwt|
                                                     (QREFELT % 94)))))))))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (PROGN (LETT #2# |lbwt|) (GO #9=#:G252)))))))
                         (LETT |ts_v|
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL |ts| |v| (QREFELT % 46)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                                 (|Union| (QREFELT % 9)
                                                          "failed")
                                                 #3#)))
                         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT % 47)))
                         (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT % 95)))
                         (LETT |lgwt|
                               (SPADCALL |ts_v| |q| |ts_v-| NIL NIL
                                         (QREFELT % 49)))
                         (LETT |lbwt| NIL)
                         (SEQ (LETT |gwt| NIL) (LETT #4# |lgwt|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |gwt| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |g| (QCAR |gwt|))
                                   (LETT |ts| (QCDR |gwt|))
                                   (COND
                                    ((OR (SPADCALL |g| (QREFELT % 50))
                                         (SPADCALL
                                          (SPADCALL |g| (QREFELT % 40)) |v|
                                          (QREFELT % 70)))
                                     (EXIT
                                      (SEQ
                                       (LETT |lts|
                                             (SPADCALL |ts_v| |ts|
                                                       (QREFELT % 97)))
                                       (LETT |lts|
                                             (SPADCALL
                                              (SPADCALL |ts_v+| (QREFELT % 98))
                                              |lts| (QREFELT % 99)))
                                       (EXIT
                                        (SEQ (LETT #6# |lts|) G190
                                             (COND
                                              ((OR (ATOM #6#)
                                                   (PROGN
                                                    (LETT |ts| (CAR #6#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |lbwt|
                                                     (CONS (CONS 'T |ts|)
                                                           |lbwt|))))
                                             (LETT #6# (CDR #6#)) (GO G190)
                                             G191 (EXIT NIL)))))))
                                   (LETT |g| (SPADCALL |g| (QREFELT % 88)))
                                   (LETT |lts_g|
                                         (SPADCALL |g| |ts| (QREFELT % 97)))
                                   (LETT |lts_g|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT % 98))
                                          |lts_g| (QREFELT % 99)))
                                   (SEQ (LETT |ts_g| NIL) (LETT #7# |lts_g|)
                                        G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |ts_g| (CAR #7#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |lbwt|
                                                (CONS (CONS NIL |ts_g|)
                                                      |lbwt|))))
                                        (LETT #7# (CDR #7#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |h|
                                         (SPADCALL |ts_v| |g| (QREFELT % 89)))
                                   (COND
                                    ((OR (SPADCALL |h| (QREFELT % 50))
                                         (SPADCALL
                                          (SPADCALL |h| (QREFELT % 40)) |v|
                                          (QREFELT % 70)))
                                     (EXIT "leave")))
                                   (LETT |h| (SPADCALL |h| (QREFELT % 88)))
                                   (LETT |lts_h|
                                         (SPADCALL |h| |ts| (QREFELT % 97)))
                                   (LETT |lts_h|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT % 98))
                                          |lts_h| (QREFELT % 99)))
                                   (EXIT
                                    (SEQ (LETT |ts_h| NIL) (LETT #8# |lts_h|)
                                         G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |ts_h| (CAR #8#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |lbwt|
                                                 (CONS (CONS 'T |ts_h|)
                                                       |lbwt|))))
                                         (LETT #8# (CDR #8#)) (GO G190) G191
                                         (EXIT NIL))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL
                           (CONS #'|SFRGCD;stoseInvertible?_sqfreg;PTSL;14!0|
                                 %)
                           |lbwt| (QREFELT % 102)))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |SFRGCD;stoseInvertible?_sqfreg;PTSL;14!0|
        ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 100))) 

(SDEFUN |SFRGCD;stoseInvertibleSet_sqfreg;PTSL;15|
        ((|p| (P)) (|ts| (TS)) (% (|List| TS)))
        (SPROG
         ((|k| (|Record| (|:| |arg1| P) (|:| |arg3| TS)))
          (|e| (|Union| (|List| TS) "failed")) (|q| (P)) (|v| (V))
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#1=#:G291 NIL) (|newq| (P)) (#2=#:G290 NIL)
          (#3=#:G274 NIL) (|ts_v| (P)) (|ts_v-| (TS)) (|ts_v+| (TS))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#4=#:G292 NIL) (|lts| #5=(|List| TS)) (|g| (P))
          (|h| (P)) (|lts_h| #5#) (|toSave| (|List| TS)))
         (SEQ
          (EXIT
           (SEQ (LETT |k| (CONS |p| |ts|))
                (LETT |e| (SPADCALL |k| (QREFELT % 104)))
                (EXIT
                 (COND ((QEQCAR |e| 0) (QCDR |e|))
                       (#6='T
                        (SEQ
                         (LETT |q|
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT % 36))
                                         (QREFELT % 37)))
                         (EXIT
                          (COND ((SPADCALL |q| (QREFELT % 38)) NIL)
                                ((SPADCALL |q| |ts| (QREFELT % 39))
                                 (LIST |ts|))
                                (#6#
                                 (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 40)))
                                      (LETT |toSave| NIL)
                                      (COND
                                       ((NULL
                                         (SPADCALL |v| |ts| (QREFELT % 41)))
                                        (EXIT
                                         (SEQ
                                          (LETT |toCheck|
                                                (SPADCALL
                                                 (SPADCALL |q| (QREFELT % 61))
                                                 |ts| (QREFELT % 92)))
                                          (SEQ (LETT |bwt| NIL)
                                               (LETT #1# |toCheck|) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |bwt| (CAR #1#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((QCAR |bwt|)
                                                   (LETT |toSave|
                                                         (CONS (QCDR |bwt|)
                                                               |toSave|)))
                                                  ('T
                                                   (SEQ
                                                    (LETT |newq|
                                                          (SPADCALL |q|
                                                                    (QCDR
                                                                     |bwt|)
                                                                    (QREFELT %
                                                                             93)))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |newq|
                                                                 (QREFELT %
                                                                          38))
                                                       "leave")
                                                      ('T
                                                       (LETT |toSave|
                                                             (SPADCALL
                                                              (SPADCALL |newq|
                                                                        (QCDR
                                                                         |bwt|)
                                                                        (QREFELT
                                                                         %
                                                                         106))
                                                              |toSave|
                                                              (QREFELT %
                                                                       107)))))))))))
                                               (LETT #1# (CDR #1#)) (GO G190)
                                               G191 (EXIT NIL))
                                          (LETT |toSave|
                                                (SPADCALL |toSave|
                                                          (QREFELT % 108)))
                                          (EXIT
                                           (PROGN
                                            (LETT #2#
                                                  (SPADCALL |toSave|
                                                            (QREFELT % 110)))
                                            (GO #7=#:G289)))))))
                                      (LETT |ts_v|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL |ts| |v|
                                                                (QREFELT %
                                                                         46)))
                                                (QCDR #3#)
                                              (|check_union2| (QEQCAR #3# 0)
                                                              (QREFELT % 9)
                                                              (|Union|
                                                               (QREFELT % 9)
                                                               "failed")
                                                              #3#)))
                                      (LETT |ts_v-|
                                            (SPADCALL |ts| |v| (QREFELT % 47)))
                                      (LETT |ts_v+|
                                            (SPADCALL |ts| |v| (QREFELT % 95)))
                                      (LETT |lgwt|
                                            (SPADCALL |ts_v| |q| |ts_v-| NIL
                                                      NIL (QREFELT % 49)))
                                      (SEQ (LETT |gwt| NIL) (LETT #4# |lgwt|)
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |gwt| (CAR #4#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ (LETT |g| (QCAR |gwt|))
                                                (LETT |ts| (QCDR |gwt|))
                                                (COND
                                                 ((OR
                                                   (SPADCALL |g|
                                                             (QREFELT % 50))
                                                   (SPADCALL
                                                    (SPADCALL |g|
                                                              (QREFELT % 40))
                                                    |v| (QREFELT % 70)))
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |lts|
                                                          (SPADCALL |ts_v| |ts|
                                                                    (QREFELT %
                                                                             97)))
                                                    (LETT |lts|
                                                          (SPADCALL
                                                           (SPADCALL |ts_v+|
                                                                     (QREFELT %
                                                                              98))
                                                           |lts|
                                                           (QREFELT % 99)))
                                                    (EXIT
                                                     (LETT |toSave|
                                                           (SPADCALL |lts|
                                                                     |toSave|
                                                                     (QREFELT %
                                                                              107))))))))
                                                (LETT |g|
                                                      (SPADCALL |g|
                                                                (QREFELT %
                                                                         88)))
                                                (LETT |h|
                                                      (SPADCALL |ts_v| |g|
                                                                (QREFELT %
                                                                         89)))
                                                (LETT |h|
                                                      (SPADCALL |h|
                                                                (QREFELT %
                                                                         88)))
                                                (COND
                                                 ((OR
                                                   (SPADCALL |h|
                                                             (QREFELT % 50))
                                                   (SPADCALL
                                                    (SPADCALL |h|
                                                              (QREFELT % 40))
                                                    |v| (QREFELT % 70)))
                                                  (EXIT "leave")))
                                                (LETT |lts_h|
                                                      (SPADCALL |h| |ts|
                                                                (QREFELT %
                                                                         97)))
                                                (LETT |lts_h|
                                                      (SPADCALL
                                                       (SPADCALL |ts_v+|
                                                                 (QREFELT %
                                                                          98))
                                                       |lts_h| (QREFELT % 99)))
                                                (EXIT
                                                 (LETT |toSave|
                                                       (SPADCALL |lts_h|
                                                                 |toSave|
                                                                 (QREFELT %
                                                                          107)))))
                                           (LETT #4# (CDR #4#)) (GO G190) G191
                                           (EXIT NIL))
                                      (LETT |toSave|
                                            (SPADCALL |toSave|
                                                      (QREFELT % 110)))
                                      (SPADCALL |k| |toSave| (QREFELT % 111))
                                      (EXIT |toSave|)))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |SFRGCD;stoseInvertible?_reg;PTSL;16|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPROG
         ((|q| (P)) (|v| (V))
          (|toCheck|
           #1=(|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (#2=#:G333 NIL) (|newq| (P)) (#3=#:G332 NIL) (#4=#:G301 NIL)
          (|ts_v| (P)) (|ts_v-| (TS)) (|ts_v+| (TS))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#5=#:G334 NIL) (|lts| #6=(|List| TS)) (#7=#:G335 NIL)
          (|g| (P)) (|lts_g| #6#) (|ts_g| NIL) (#8=#:G336 NIL) (|h| (P))
          (|lts_h| #6#) (|ts_h| NIL) (#9=#:G337 NIL) (|inv| #1#)
          (#10=#:G338 NIL) (|bwt| NIL) (#11=#:G339 NIL)
          (|lbwt|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SPADCALL (SPADCALL |p| |ts| (QREFELT % 36)) (QREFELT % 37)))
            (EXIT
             (COND ((SPADCALL |q| (QREFELT % 38)) (LIST (CONS NIL |ts|)))
                   ((SPADCALL |q| |ts| (QREFELT % 39)) (LIST (CONS 'T |ts|)))
                   ('T
                    (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 40)))
                         (COND
                          ((NULL (SPADCALL |v| |ts| (QREFELT % 41)))
                           (EXIT
                            (SEQ (LETT |lbwt| NIL)
                                 (LETT |toCheck|
                                       (SPADCALL (SPADCALL |q| (QREFELT % 61))
                                                 |ts| (QREFELT % 112)))
                                 (SEQ (LETT |bwt| NIL) (LETT #2# |toCheck|)
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |bwt| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((QCAR |bwt|)
                                          (LETT |lbwt| (CONS |bwt| |lbwt|)))
                                         ('T
                                          (SEQ
                                           (LETT |newq|
                                                 (SPADCALL |q| (QCDR |bwt|)
                                                           (QREFELT % 93)))
                                           (EXIT
                                            (COND
                                             ((SPADCALL |newq| (QREFELT % 38))
                                              (LETT |lbwt|
                                                    (CONS |bwt| |lbwt|)))
                                             ('T
                                              (LETT |lbwt|
                                                    (SPADCALL
                                                     (SPADCALL |newq|
                                                               (QCDR |bwt|)
                                                               (QREFELT % 112))
                                                     |lbwt|
                                                     (QREFELT % 94)))))))))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (PROGN
                                   (LETT #3# |lbwt|)
                                   (GO #12=#:G331)))))))
                         (LETT |ts_v|
                               (PROG2
                                   (LETT #4#
                                         (SPADCALL |ts| |v| (QREFELT % 46)))
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0) (QREFELT % 9)
                                                 (|Union| (QREFELT % 9)
                                                          "failed")
                                                 #4#)))
                         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT % 47)))
                         (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT % 95)))
                         (LETT |lgwt|
                               (SPADCALL |ts_v| |q| |ts_v-| NIL NIL
                                         (QREFELT % 49)))
                         (LETT |lbwt| NIL)
                         (SEQ (LETT |gwt| NIL) (LETT #5# |lgwt|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |gwt| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |g| (QCAR |gwt|))
                                   (LETT |ts| (QCDR |gwt|))
                                   (COND
                                    ((OR (SPADCALL |g| (QREFELT % 50))
                                         (SPADCALL
                                          (SPADCALL |g| (QREFELT % 40)) |v|
                                          (QREFELT % 70)))
                                     (EXIT
                                      (SEQ
                                       (LETT |lts|
                                             (SPADCALL |ts_v| |ts|
                                                       (QREFELT % 97)))
                                       (LETT |lts|
                                             (SPADCALL
                                              (SPADCALL |ts_v+| (QREFELT % 98))
                                              |lts| (QREFELT % 99)))
                                       (EXIT
                                        (SEQ (LETT #7# |lts|) G190
                                             (COND
                                              ((OR (ATOM #7#)
                                                   (PROGN
                                                    (LETT |ts| (CAR #7#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |lbwt|
                                                     (CONS (CONS 'T |ts|)
                                                           |lbwt|))))
                                             (LETT #7# (CDR #7#)) (GO G190)
                                             G191 (EXIT NIL)))))))
                                   (LETT |g| (SPADCALL |g| (QREFELT % 88)))
                                   (LETT |lts_g|
                                         (SPADCALL |g| |ts| (QREFELT % 97)))
                                   (LETT |lts_g|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT % 98))
                                          |lts_g| (QREFELT % 99)))
                                   (SEQ (LETT |ts_g| NIL) (LETT #8# |lts_g|)
                                        G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN
                                               (LETT |ts_g| (CAR #8#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |lbwt|
                                                (CONS (CONS NIL |ts_g|)
                                                      |lbwt|))))
                                        (LETT #8# (CDR #8#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |h|
                                         (SPADCALL |ts_v| |g| (QREFELT % 89)))
                                   (COND
                                    ((OR (SPADCALL |h| (QREFELT % 50))
                                         (SPADCALL
                                          (SPADCALL |h| (QREFELT % 40)) |v|
                                          (QREFELT % 70)))
                                     (EXIT "leave")))
                                   (LETT |h| (SPADCALL |h| (QREFELT % 88)))
                                   (LETT |lts_h|
                                         (SPADCALL |h| |ts| (QREFELT % 97)))
                                   (LETT |lts_h|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT % 98))
                                          |lts_h| (QREFELT % 99)))
                                   (EXIT
                                    (SEQ (LETT |ts_h| NIL) (LETT #9# |lts_h|)
                                         G190
                                         (COND
                                          ((OR (ATOM #9#)
                                               (PROGN
                                                (LETT |ts_h| (CAR #9#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |inv|
                                                (SPADCALL |q| |ts_h|
                                                          (QREFELT % 112)))
                                          (EXIT
                                           (LETT |lbwt|
                                                 (SPADCALL
                                                  (PROGN
                                                   (LETT #10# NIL)
                                                   (SEQ (LETT |bwt| NIL)
                                                        (LETT #11# |inv|) G190
                                                        (COND
                                                         ((OR (ATOM #11#)
                                                              (PROGN
                                                               (LETT |bwt|
                                                                     (CAR
                                                                      #11#))
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (COND
                                                           ((QCAR |bwt|)
                                                            (LETT #10#
                                                                  (CONS |bwt|
                                                                        #10#))))))
                                                        (LETT #11# (CDR #11#))
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #10#))))
                                                  |lbwt| (QREFELT % 94)))))
                                         (LETT #9# (CDR #9#)) (GO G190) G191
                                         (EXIT NIL))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL
                           (CONS #'|SFRGCD;stoseInvertible?_reg;PTSL;16!0| %)
                           |lbwt| (QREFELT % 102)))))))))
          #12# (EXIT #3#)))) 

(SDEFUN |SFRGCD;stoseInvertible?_reg;PTSL;16!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 100))) 

(SDEFUN |SFRGCD;stoseInvertibleSet_reg;PTSL;17|
        ((|p| (P)) (|ts| (TS)) (% (|List| TS)))
        (SPROG
         ((|k| (|Record| (|:| |arg1| P) (|:| |arg3| TS)))
          (|e| (|Union| (|List| TS) "failed")) (|q| (P)) (|v| (V))
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|bwt| NIL) (#1=#:G372 NIL) (|newq| (P)) (#2=#:G371 NIL)
          (#3=#:G352 NIL) (|ts_v| (P)) (|ts_v-| (TS)) (|ts_v+| (TS))
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|gwt| NIL) (#4=#:G373 NIL) (|lts| #5=(|List| TS)) (|g| (P))
          (|h| (P)) (|lts_h| #5#) (|ts_h| NIL) (#6=#:G374 NIL)
          (|inv| (|List| TS)) (|toSave| (|List| TS)))
         (SEQ
          (EXIT
           (SEQ (LETT |k| (CONS |p| |ts|))
                (LETT |e| (SPADCALL |k| (QREFELT % 104)))
                (EXIT
                 (COND ((QEQCAR |e| 0) (QCDR |e|))
                       (#7='T
                        (SEQ
                         (LETT |q|
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT % 36))
                                         (QREFELT % 37)))
                         (EXIT
                          (COND ((SPADCALL |q| (QREFELT % 38)) NIL)
                                ((SPADCALL |q| |ts| (QREFELT % 39))
                                 (LIST |ts|))
                                (#7#
                                 (SEQ (LETT |v| (SPADCALL |q| (QREFELT % 40)))
                                      (LETT |toSave| NIL)
                                      (COND
                                       ((NULL
                                         (SPADCALL |v| |ts| (QREFELT % 41)))
                                        (EXIT
                                         (SEQ
                                          (LETT |toCheck|
                                                (SPADCALL
                                                 (SPADCALL |q| (QREFELT % 61))
                                                 |ts| (QREFELT % 112)))
                                          (SEQ (LETT |bwt| NIL)
                                               (LETT #1# |toCheck|) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |bwt| (CAR #1#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((QCAR |bwt|)
                                                   (LETT |toSave|
                                                         (CONS (QCDR |bwt|)
                                                               |toSave|)))
                                                  ('T
                                                   (SEQ
                                                    (LETT |newq|
                                                          (SPADCALL |q|
                                                                    (QCDR
                                                                     |bwt|)
                                                                    (QREFELT %
                                                                             93)))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |newq|
                                                                 (QREFELT %
                                                                          38))
                                                       "leave")
                                                      ('T
                                                       (LETT |toSave|
                                                             (SPADCALL
                                                              (SPADCALL |newq|
                                                                        (QCDR
                                                                         |bwt|)
                                                                        (QREFELT
                                                                         %
                                                                         113))
                                                              |toSave|
                                                              (QREFELT %
                                                                       107)))))))))))
                                               (LETT #1# (CDR #1#)) (GO G190)
                                               G191 (EXIT NIL))
                                          (LETT |toSave|
                                                (SPADCALL |toSave|
                                                          (QREFELT % 108)))
                                          (EXIT
                                           (PROGN
                                            (LETT #2#
                                                  (SPADCALL |toSave|
                                                            (QREFELT % 110)))
                                            (GO #8=#:G370)))))))
                                      (LETT |ts_v|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL |ts| |v|
                                                                (QREFELT %
                                                                         46)))
                                                (QCDR #3#)
                                              (|check_union2| (QEQCAR #3# 0)
                                                              (QREFELT % 9)
                                                              (|Union|
                                                               (QREFELT % 9)
                                                               "failed")
                                                              #3#)))
                                      (LETT |ts_v-|
                                            (SPADCALL |ts| |v| (QREFELT % 47)))
                                      (LETT |ts_v+|
                                            (SPADCALL |ts| |v| (QREFELT % 95)))
                                      (LETT |lgwt|
                                            (SPADCALL |ts_v| |q| |ts_v-| NIL
                                                      NIL (QREFELT % 49)))
                                      (SEQ (LETT |gwt| NIL) (LETT #4# |lgwt|)
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |gwt| (CAR #4#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ (LETT |g| (QCAR |gwt|))
                                                (LETT |ts| (QCDR |gwt|))
                                                (COND
                                                 ((OR
                                                   (SPADCALL |g|
                                                             (QREFELT % 50))
                                                   (SPADCALL
                                                    (SPADCALL |g|
                                                              (QREFELT % 40))
                                                    |v| (QREFELT % 70)))
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |lts|
                                                          (SPADCALL |ts_v| |ts|
                                                                    (QREFELT %
                                                                             97)))
                                                    (LETT |lts|
                                                          (SPADCALL
                                                           (SPADCALL |ts_v+|
                                                                     (QREFELT %
                                                                              98))
                                                           |lts|
                                                           (QREFELT % 99)))
                                                    (EXIT
                                                     (LETT |toSave|
                                                           (SPADCALL |lts|
                                                                     |toSave|
                                                                     (QREFELT %
                                                                              107))))))))
                                                (LETT |g|
                                                      (SPADCALL |g|
                                                                (QREFELT %
                                                                         88)))
                                                (LETT |h|
                                                      (SPADCALL |ts_v| |g|
                                                                (QREFELT %
                                                                         89)))
                                                (LETT |h|
                                                      (SPADCALL |h|
                                                                (QREFELT %
                                                                         88)))
                                                (COND
                                                 ((OR
                                                   (SPADCALL |h|
                                                             (QREFELT % 50))
                                                   (SPADCALL
                                                    (SPADCALL |h|
                                                              (QREFELT % 40))
                                                    |v| (QREFELT % 70)))
                                                  (EXIT "leave")))
                                                (LETT |lts_h|
                                                      (SPADCALL |h| |ts|
                                                                (QREFELT %
                                                                         97)))
                                                (LETT |lts_h|
                                                      (SPADCALL
                                                       (SPADCALL |ts_v+|
                                                                 (QREFELT %
                                                                          98))
                                                       |lts_h| (QREFELT % 99)))
                                                (EXIT
                                                 (SEQ (LETT |ts_h| NIL)
                                                      (LETT #6# |lts_h|) G190
                                                      (COND
                                                       ((OR (ATOM #6#)
                                                            (PROGN
                                                             (LETT |ts_h|
                                                                   (CAR #6#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |inv|
                                                             (SPADCALL |q|
                                                                       |ts_h|
                                                                       (QREFELT
                                                                        %
                                                                        113)))
                                                       (EXIT
                                                        (LETT |toSave|
                                                              (SPADCALL
                                                               (SPADCALL |inv|
                                                                         |toSave|
                                                                         (QREFELT
                                                                          %
                                                                          107))
                                                               (QREFELT %
                                                                        108)))))
                                                      (LETT #6# (CDR #6#))
                                                      (GO G190) G191
                                                      (EXIT NIL))))
                                           (LETT #4# (CDR #4#)) (GO G190) G191
                                           (EXIT NIL))
                                      (LETT |toSave|
                                            (SPADCALL |toSave|
                                                      (QREFELT % 110)))
                                      (SPADCALL |k| |toSave| (QREFELT % 111))
                                      (EXIT |toSave|)))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |SFRGCD;stoseInvertible?;PTSL;18|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPADCALL |p| |ts| (QREFELT % 92))) 

(SDEFUN |SFRGCD;stoseInvertibleSet;PTSL;19|
        ((|p| (P)) (|ts| (TS)) (% (|List| TS)))
        (SPADCALL |p| |ts| (QREFELT % 106))) 

(SDEFUN |SFRGCD;stoseInvertible?;PTSL;20|
        ((|p| (P)) (|ts| (TS))
         (% (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS)))))
        (SPADCALL |p| |ts| (QREFELT % 112))) 

(SDEFUN |SFRGCD;stoseInvertibleSet;PTSL;21|
        ((|p| (P)) (|ts| (TS)) (% (|List| TS)))
        (SPADCALL |p| |ts| (QREFELT % 113))) 

(DECLAIM (NOTINLINE |SquareFreeRegularTriangularSetGcdPackage;|)) 

(DEFUN |SquareFreeRegularTriangularSetGcdPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$|
          (LIST '|SquareFreeRegularTriangularSetGcdPackage| DV$1 DV$2 DV$3 DV$4
                DV$5))
    (LETT % (GETREFV 115))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|SquareFreeRegularTriangularSetGcdPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#5|
                     (LIST '|SquareFreeRegularTriangularSetCategory|
                           (|devaluate| |#1|) (|devaluate| |#2|)
                           (|devaluate| |#3|) (|devaluate| |#4|)))
      (PROGN
       (QSETREFV % 44
                 (CONS (|dispatchFunction| |SFRGCD;stoseInvertible?;PTSL;18|)
                       %))
       (QSETREFV % 114
                 (CONS (|dispatchFunction| |SFRGCD;stoseInvertibleSet;PTSL;19|)
                       %))))
     ('T
      (PROGN
       (QSETREFV % 44
                 (CONS (|dispatchFunction| |SFRGCD;stoseInvertible?;PTSL;20|)
                       %))
       (QSETREFV % 114
                 (CONS (|dispatchFunction| |SFRGCD;stoseInvertibleSet;PTSL;21|)
                       %)))))
    %))) 

(DEFUN |SquareFreeRegularTriangularSetGcdPackage| (&REST #1=#:G381)
  (SPROG NIL
         (PROG (#2=#:G382)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SquareFreeRegularTriangularSetGcdPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |SquareFreeRegularTriangularSetGcdPackage;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SquareFreeRegularTriangularSetGcdPackage|)))))))))) 

(MAKEPROP '|SquareFreeRegularTriangularSetGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Void|)
              (|Record| (|:| |arg1| 9) (|:| |arg2| 9) (|:| |arg3| 10)
                        (|:| |arg4| 21))
              (|Record| (|:| |val| 9) (|:| |tower| 10))
              (|TabulatedComputationPackage| 12 48) (0 . |initTable!|)
              (|String|) (4 . |printInfo!|) (10 . |startStats!|) (15 . |void|)
              |SFRGCD;startTableGcd!;3SV;1| (|Boolean|) (19 . |makingStats?|)
              (23 . |printStats!|) (27 . |clearTable!|)
              |SFRGCD;stopTableGcd!;V;2|
              (|Record| (|:| |arg1| 9) (|:| |arg3| 10))
              (|TabulatedComputationPackage| 26 105) (31 . |initTable!|)
              (35 . |printInfo!|) (41 . |startStats!|)
              |SFRGCD;startTableInvSet!;3SV;3| (46 . |makingStats?|)
              (50 . |printStats!|) (54 . |clearTable!|)
              |SFRGCD;stopTableInvSet!;V;4| (58 . |initiallyReduce|)
              (64 . |primitivePart|) (69 . |zero?|) (74 . |normalized?|)
              (80 . |mvar|) (85 . |algebraic?|)
              (|Record| (|:| |val| 21) (|:| |tower| 10)) (|List| 42)
              (91 . |stoseInvertible?|) (|Union| 9 '"failed") (97 . |select|)
              (103 . |collectUnder|) (|List| 13)
              |SFRGCD;stoseInternalLastSubResultant;2PTS2BL;8|
              (109 . |ground?|) (114 . =) |SFRGCD;stoseInvertible?;PTSB;5|
              (|Integer|) (|List| 9) (120 . |elt|) (126 . |leadingCoefficient|)
              (|NonNegativeInteger|) (132 . |degree|) (138 . -) (143 . |prem|)
              (149 . |init|) (154 . |mdeg|) (159 . ^) (165 . |0|) (169 . |1|)
              (|Record| (|:| |val| 54) (|:| |tower| 10)) (|List| 66)
              |SFRGCD;stosePrepareSubResAlgo;2PTSL;6|
              (173 . |lastSubResultant|) (179 . <) (185 . |gcd|) (191 . *)
              (|Union| % '"failed") (197 . |exquo|)
              |SFRGCD;stoseIntegralLastSubResultant;2PTSL;7|
              (|Union| 48 '#1="failed") (203 . |extractIfCan|) (208 . |empty?|)
              (213 . |insert!|) |SFRGCD;stoseInternalLastSubResultant;LVBL;9|
              (219 . |LazardQuotient2|) (227 . |next_subResultant2|)
              (235 . |initiallyReduced?|) (241 . |purelyTranscendental?|)
              |SFRGCD;stoseLastSubResultant;2PTSL;10| (247 . |1|) (251 . D)
              (257 . |mainPrimitivePart|) (262 . |lazyPquo|)
              (268 . |stronglyReduce|) |SFRGCD;stoseSquareFreePart;PTSL;13|
              |SFRGCD;stoseInvertible?_sqfreg;PTSL;14| (274 . |removeZero|)
              (280 . |concat|) (286 . |collectUpper|) (|List| %)
              (292 . |augment|) (298 . |members|) (303 . |augment|) (309 . <)
              (|Mapping| 21 42 42) (315 . |sort|) (|Union| 105 '#1#)
              (321 . |extractIfCan|) (|List| 10)
              |SFRGCD;stoseInvertibleSet_sqfreg;PTSL;15| (326 . |concat|)
              (332 . |removeDuplicates|)
              (|SquareFreeQuasiComponentPackage| 6 7 8 9 10)
              (337 . |algebraicSort|) (342 . |insert!|)
              |SFRGCD;stoseInvertible?_reg;PTSL;16|
              |SFRGCD;stoseInvertibleSet_reg;PTSL;17|
              (348 . |stoseInvertibleSet|))
           '#(|stoseSquareFreePart| 354 |stosePrepareSubResAlgo| 360
              |stoseLastSubResultant| 367 |stoseInvertibleSet_sqfreg| 374
              |stoseInvertibleSet_reg| 380 |stoseInvertibleSet| 386
              |stoseInvertible?_sqfreg| 392 |stoseInvertible?_reg| 398
              |stoseInvertible?| 404 |stoseInternalLastSubResultant| 416
              |stoseIntegralLastSubResultant| 432 |stopTableInvSet!| 439
              |stopTableGcd!| 443 |startTableInvSet!| 447 |startTableGcd!| 454)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|startTableGcd!|
                                 ((|Void|) (|String|) (|String|) (|String|)))
                                T)
                              '((|stopTableGcd!| ((|Void|))) T)
                              '((|startTableInvSet!|
                                 ((|Void|) (|String|) (|String|) (|String|)))
                                T)
                              '((|stopTableInvSet!| ((|Void|))) T)
                              '((|stosePrepareSubResAlgo|
                                 ((|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))
                                  |#4| |#4| |#5|))
                                T)
                              '((|stoseInternalLastSubResultant|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  |#4| |#4| |#5| (|Boolean|) (|Boolean|)))
                                T)
                              '((|stoseInternalLastSubResultant|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  (|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))
                                  |#3| (|Boolean|)))
                                T)
                              '((|stoseIntegralLastSubResultant|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  |#4| |#4| |#5|))
                                T)
                              '((|stoseLastSubResultant|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  |#4| |#4| |#5|))
                                T)
                              '((|stoseInvertible?| ((|Boolean|) |#4| |#5|)) T)
                              '((|stoseInvertible?_sqfreg|
                                 ((|List|
                                   (|Record| (|:| |val| (|Boolean|))
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T)
                              '((|stoseInvertibleSet_sqfreg|
                                 ((|List| |#5|) |#4| |#5|))
                                T)
                              '((|stoseInvertible?_reg|
                                 ((|List|
                                   (|Record| (|:| |val| (|Boolean|))
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T)
                              '((|stoseInvertibleSet_reg|
                                 ((|List| |#5|) |#4| |#5|))
                                T)
                              '((|stoseInvertible?|
                                 ((|List|
                                   (|Record| (|:| |val| (|Boolean|))
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T)
                              '((|stoseInvertibleSet|
                                 ((|List| |#5|) |#4| |#5|))
                                T)
                              '((|stoseSquareFreePart|
                                 ((|List|
                                   (|Record| (|:| |val| |#4|)
                                             (|:| |tower| |#5|)))
                                  |#4| |#5|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 114
                                            '(0 14 11 15 2 14 11 16 16 17 1 14
                                              11 16 18 0 11 0 19 0 14 21 22 0
                                              14 11 23 0 14 11 24 0 27 11 28 2
                                              27 11 16 16 29 1 27 11 16 30 0 27
                                              21 32 0 27 11 33 0 27 11 34 2 10
                                              9 9 0 36 1 9 0 0 37 1 9 21 0 38 2
                                              10 21 9 0 39 1 9 8 0 40 2 10 21 8
                                              0 41 2 0 43 9 10 44 2 10 45 0 8
                                              46 2 10 0 0 8 47 1 9 21 0 50 2 8
                                              21 0 0 51 2 54 9 0 53 55 2 9 0 0
                                              8 56 2 9 57 0 8 58 1 9 0 0 59 2 9
                                              0 0 0 60 1 9 0 0 61 1 9 57 0 62 2
                                              9 0 0 57 63 0 9 0 64 0 9 0 65 2 9
                                              0 0 0 69 2 8 21 0 0 70 2 9 0 0 0
                                              71 2 9 0 0 0 72 2 9 73 0 0 74 1
                                              14 76 12 77 1 10 21 0 78 2 14 11
                                              12 48 79 4 9 0 0 0 0 57 81 4 9 0
                                              0 0 0 0 82 2 10 21 9 0 83 2 10 21
                                              9 0 84 0 6 0 86 2 9 0 0 8 87 1 9
                                              0 0 88 2 9 0 0 0 89 2 10 9 9 0 90
                                              2 10 9 9 0 93 2 43 0 0 0 94 2 10
                                              0 0 8 95 2 10 96 9 0 97 1 10 54 0
                                              98 2 10 96 54 96 99 2 21 21 0 0
                                              100 2 43 0 101 0 102 1 27 103 26
                                              104 2 105 0 0 0 107 1 105 0 0 108
                                              1 109 105 105 110 2 27 11 26 105
                                              111 2 0 105 9 10 114 2 0 48 9 10
                                              91 3 0 67 9 9 10 68 3 0 48 9 9 10
                                              85 2 0 105 9 10 106 2 0 105 9 10
                                              113 2 0 105 9 10 114 2 0 43 9 10
                                              92 2 0 43 9 10 112 2 0 43 9 10 44
                                              2 0 21 9 10 52 3 0 48 67 8 21 80
                                              5 0 48 9 9 10 21 21 49 3 0 48 9 9
                                              10 75 0 0 11 35 0 0 11 25 3 0 11
                                              16 16 16 31 3 0 11 16 16 16
                                              20)))))
           '|lookupComplete|)) 
