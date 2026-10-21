
(SDEFUN |XPBWPOLY;outForm|
        ((|t|
          (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
                    (|:| |c| R)))
         (% (|OutputForm|)))
        (COND
         ((SPADCALL (QCDR |t|) (|spadConstant| % 9) (QREFELT % 11))
          (SPADCALL (QCAR |t|) (QREFELT % 14)))
         ((SPADCALL (QCAR |t|) (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (QCDR |t|) (QREFELT % 17)))
         ('T
          (SPADCALL (SPADCALL (QCDR |t|) (QREFELT % 17))
                    (SPADCALL (QCAR |t|) (QREFELT % 14)) (QREFELT % 18))))) 

(SDEFUN |XPBWPOLY;prod1|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (|p| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G26 NIL) (#2=#:G24 (%)) (#3=#:G22 (%))
          (#4=#:G23 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| |b| (QCAR |t|) %)
                                   (QREFELT % 19)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 21))))))) 

(SDEFUN |XPBWPOLY;prod2|
        ((|p| (%)) (|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G31 NIL) (#2=#:G29 (%)) (#3=#:G27 (%))
          (#4=#:G28 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| (QCAR |t|) |b| %)
                                   (QREFELT % 19)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 21))))))) 

(SDEFUN |XPBWPOLY;prod11|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (|p| (%))
         (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|limit| (|Integer|)) (|t| NIL) (#1=#:G37 NIL) (#2=#:G34 (%))
          (#3=#:G32 (%)) (#4=#:G33 NIL))
         (SEQ (LETT |limit| (- |n| (SPADCALL |b| (QREFELT % 23))))
              (EXIT
               (PROGN
                (LETT #4# NIL)
                (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((<= (SPADCALL (QCAR |t|) (QREFELT % 23)) |limit|)
                         (PROGN
                          (LETT #2#
                                (SPADCALL (QCDR |t|)
                                          (|XPBWPOLY;prod| |b| (QCAR |t|) %)
                                          (QREFELT % 19)))
                          (COND
                           (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND (#4# #3#) ('T (|spadConstant| % 21)))))))) 

(SDEFUN |XPBWPOLY;prod22|
        ((|p| (%)) (|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|limit| (|Integer|)) (|t| NIL) (#1=#:G43 NIL) (#2=#:G40 (%))
          (#3=#:G38 (%)) (#4=#:G39 NIL))
         (SEQ (LETT |limit| (- |n| (SPADCALL |b| (QREFELT % 23))))
              (EXIT
               (PROGN
                (LETT #4# NIL)
                (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((<= (SPADCALL (QCAR |t|) (QREFELT % 23)) |limit|)
                         (PROGN
                          (LETT #2#
                                (SPADCALL (QCDR |t|)
                                          (|XPBWPOLY;prod| (QCAR |t|) |b| %)
                                          (QREFELT % 19)))
                          (COND
                           (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND (#4# #3#) ('T (|spadConstant| % 21)))))))) 

(SDEFUN |XPBWPOLY;prod|
        ((|g| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (|d| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (COND
         ((SPADCALL |d| (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (|spadConstant| % 9) |g| (QREFELT % 25)))
         ((SPADCALL |g| (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (|spadConstant| % 9) |d| (QREFELT % 25)))
         ('T
          (|XPBWPOLY;process| (REVERSE (SPADCALL |g| (QREFELT % 27)))
           (SPADCALL |d| (QREFELT % 29)) (CDR (SPADCALL |d| (QREFELT % 27)))
           %)))) 

(SDEFUN |XPBWPOLY;Dexpand|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((|l| NIL) (#1=#:G49 NIL)
          (#2=#:G47 #3=(|XDistributedPolynomial| |VarSet| R)) (#4=#:G45 #3#)
          (#5=#:G46 NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
            (|spadConstant| % 31))
           (#6='T
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |l| NIL) (LETT #1# (SPADCALL |b| (QREFELT % 27))) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (SPADCALL |l| (QREFELT % 33))
                                     (QREFELT % 34)))
                     (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 35))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# (|spadConstant| % 31))))))))) 

(SDEFUN |XPBWPOLY;Rexpand|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((|l| NIL) (#1=#:G54 NIL)
          (#2=#:G52 #3=(|XRecursivePolynomial| |VarSet| R)) (#4=#:G50 #3#)
          (#5=#:G51 NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
            (|spadConstant| % 37))
           (#6='T
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |l| NIL) (LETT #1# (SPADCALL |b| (QREFELT % 27))) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (SPADCALL |l| (QREFELT % 33))
                                     (QREFELT % 38)))
                     (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 39))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# (|spadConstant| % 37))))))))) 

(SDEFUN |XPBWPOLY;mirror1|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (SPROG ((|lp| (|LiePolynomial| |VarSet| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
                  (|spadConstant| % 24))
                 ('T
                  (SEQ
                   (LETT |lp|
                         (SPADCALL (SPADCALL |b| (QREFELT % 29))
                                   (QREFELT % 33)))
                   (LETT |lp| (SPADCALL |lp| (QREFELT % 40)))
                   (EXIT
                    (SPADCALL
                     (|XPBWPOLY;mirror1| (SPADCALL |b| (QREFELT % 41)) %)
                     (SPADCALL |lp| (QREFELT % 42)) (QREFELT % 43))))))))) 

(SDEFUN |XPBWPOLY;process|
        ((|gauche| (|List| (|LyndonWord| |VarSet|)))
         (|x| (|LyndonWord| |VarSet|))
         (|droite| (|List| (|LyndonWord| |VarSet|))) (% (%)))
        (SPROG
         ((|p| (|LiePolynomial| |VarSet| R)) (#1=#:G78 NIL) (#2=#:G63 (%))
          (#3=#:G61 (%)) (#4=#:G62 NIL) (|rd| (|List| (|LyndonWord| |VarSet|)))
          (|fd| (|LyndonWord| |VarSet|)) (#5=#:G79 NIL) (#6=#:G67 (%))
          (#7=#:G65 (%)) (#8=#:G66 NIL) (#9=#:G80 NIL) (#10=#:G70 (%))
          (#11=#:G68 (%)) (#12=#:G69 NIL) (|r1| (%)) (|t| NIL) (#13=#:G81 NIL)
          (#14=#:G73 (%)) (#15=#:G71 (%)) (#16=#:G72 NIL) (|r2| (%)))
         (SEQ
          (COND
           ((NULL |gauche|)
            (SPADCALL (|spadConstant| % 9) (CONS |x| |droite|) (QREFELT % 25)))
           ((NULL (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT % 44)))
            (SPADCALL (|spadConstant| % 9)
                      (SPADCALL (REVERSE |gauche|) (CONS |x| |droite|)
                                (QREFELT % 45))
                      (QREFELT % 25)))
           ('T
            (SEQ
             (LETT |p| (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT % 46)))
             (EXIT
              (COND
               ((NULL |droite|)
                (SEQ
                 (LETT |r1|
                       (PROGN
                        (LETT #4# NIL)
                        (SEQ (LETT |t| NIL)
                             (LETT #1# (SPADCALL |p| (QREFELT % 49))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (SPADCALL (QCDR |t|)
                                                (|XPBWPOLY;process|
                                                 (CDR |gauche|) (QCAR |t|)
                                                 |droite| %)
                                                (QREFELT % 19)))
                                (COND
                                 (#4#
                                  (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                                 ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (COND (#4# #3#) (#17='T (|spadConstant| % 21)))))
                 (LETT |r2|
                       (|XPBWPOLY;process| (CDR |gauche|) |x|
                        (SPADCALL (|SPADfirst| |gauche|) (QREFELT % 50)) %))
                 (EXIT (SPADCALL |r1| |r2| (QREFELT % 20)))))
               (#17#
                (SEQ (LETT |rd| (CDR |droite|))
                     (LETT |fd| (|SPADfirst| |droite|))
                     (LETT |r1|
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT |t| NIL)
                                 (LETT #5# (SPADCALL |p| (QREFELT % 49))) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |t| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #6#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 50))
                                                     |fd| |rd| %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#8#
                                      (LETT #7#
                                            (SPADCALL #7# #6# (QREFELT % 20))))
                                     ('T
                                      (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#8# #7#) (#17# (|spadConstant| % 21)))))
                     (LETT |r1|
                           (PROGN
                            (LETT #12# NIL)
                            (SEQ (LETT |t| NIL) (LETT #9# |r1|) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN (LETT |t| (CAR #9#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #10#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 29))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT %
                                                                         27)))
                                                     %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#12#
                                      (LETT #11#
                                            (SPADCALL #11# #10#
                                                      (QREFELT % 20))))
                                     ('T
                                      (PROGN
                                       (LETT #11# #10#)
                                       (LETT #12# 'T)))))))
                                 (LETT #9# (CDR #9#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#12# #11#) (#17# (|spadConstant| % 21)))))
                     (LETT |r2|
                           (|XPBWPOLY;process|
                            (LIST (|SPADfirst| |gauche|) |x|) |fd| |rd| %))
                     (LETT |r2|
                           (PROGN
                            (LETT #16# NIL)
                            (SEQ (LETT |t| NIL) (LETT #13# |r2|) G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN (LETT |t| (CAR #13#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #14#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 29))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT %
                                                                         27)))
                                                     %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#16#
                                      (LETT #15#
                                            (SPADCALL #15# #14#
                                                      (QREFELT % 20))))
                                     ('T
                                      (PROGN
                                       (LETT #15# #14#)
                                       (LETT #16# 'T)))))))
                                 (LETT #13# (CDR #13#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#16# #15#) (#17# (|spadConstant| % 21)))))
                     (EXIT (SPADCALL |r1| |r2| (QREFELT % 20))))))))))))) 

(SDEFUN |XPBWPOLY;1;%;11| ((% (%)))
        (SPADCALL (|spadConstant| % 9) (|spadConstant| % 15) (QREFELT % 25))) 

(SDEFUN |XPBWPOLY;coerce;R%;12| ((|r| (R)) (% (%)))
        (LIST (CONS (|spadConstant| % 15) |r|))) 

(SDEFUN |XPBWPOLY;coerce;%Of;13| ((|p| (%)) (% (|OutputForm|)))
        (SPROG ((|rec| NIL) (#1=#:G92 NIL) (|le| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((NULL |p|) (SPADCALL (|spadConstant| % 52) (QREFELT % 17)))
                 ('T
                  (SEQ (LETT |le| NIL)
                       (SEQ (LETT |rec| NIL) (LETT #1# |p|) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rec| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |le|
                                    (CONS (|XPBWPOLY;outForm| |rec| %) |le|))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL (ELT % 53) |le| (QREFELT % 56))))))))) 

(SDEFUN |XPBWPOLY;coerce;VarSet%;14| ((|v| (|VarSet|)) (% (%)))
        (SPADCALL (|spadConstant| % 9) (SPADCALL |v| (QREFELT % 58))
                  (QREFELT % 25))) 

(SDEFUN |XPBWPOLY;coerce;Lp%;15| ((|p| (|LiePolynomial| |VarSet| R)) (% (%)))
        (SPROG ((#1=#:G98 NIL) (|t| NIL) (#2=#:G99 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# (SPADCALL |p| (QREFELT % 49)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (CONS (SPADCALL (QCAR |t|) (QREFELT % 60))
                                     (QCDR |t|))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |XPBWPOLY;coerce;%Xdp;16|
        ((|p| (%)) (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G104 NIL)
          (#2=#:G102 #3=(|XDistributedPolynomial| |VarSet| R)) (#4=#:G100 #3#)
          (#5=#:G101 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;Dexpand| (QCAR |t|) %)
                                   (QREFELT % 61)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 62))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|spadConstant| % 63))))))) 

(SDEFUN |XPBWPOLY;coerce;%Xrp;17|
        ((|p| (%)) (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G109 NIL)
          (#2=#:G107 #3=(|XRecursivePolynomial| |VarSet| R)) (#4=#:G105 #3#)
          (#5=#:G106 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 66))
           (#6='T
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;Rexpand| (QCAR |t|) %)
                                     (QREFELT % 67)))
                     (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 68))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# (|spadConstant| % 66))))))))) 

(SDEFUN |XPBWPOLY;constant?;%B;18| ((|p| (%)) (% (|Boolean|)))
        (COND ((NULL |p|) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT % 70)) (|spadConstant| % 15)
                         (QREFELT % 16))))) 

(SDEFUN |XPBWPOLY;constant;%R;19| ((|p| (%)) (% (R)))
        (COND
         ((OR (NULL |p|)
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 16))))
          (|spadConstant| % 52))
         ('T (QCDR (SPADCALL |p| '|last| (QREFELT % 74)))))) 

(SDEFUN |XPBWPOLY;quasiRegular?;%B;20| ((|p| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65)) 'T)
              ('T
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 76))))) 

(SDEFUN |XPBWPOLY;quasiRegular;2%;21| ((|p| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 16))))
          |p|)
         ('T (SPADCALL |p| (LENGTH |p|) (QREFELT % 79))))) 

(SDEFUN |XPBWPOLY;*;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G124 NIL) (#2=#:G121 (%)) (#3=#:G119 (%))
          (#4=#:G120 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 21))
           (#5='T
            (PROGN
             (LETT #4# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |x|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod1| (QCAR |t|) |y| %)
                                     (QREFELT % 19)))
                     (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#4# #3#) (#5# (|spadConstant| % 21))))))))) 

(SDEFUN |XPBWPOLY;varList;%L;23| ((|p| (%)) (% (|List| |VarSet|)))
        (SPROG
         ((|b| NIL) (#1=#:G130 NIL) (#2=#:G127 #3=(|List| |VarSet|))
          (#4=#:G125 #3#) (#5=#:G126 NIL) (|lv| #3#))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |b| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QCAR |b|) (QREFELT % 82)))
                         (COND
                          (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 83))))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |lv| (QREFELT % 84)))))) 

(SDEFUN |XPBWPOLY;degree;%Nni;24| ((|p| (%)) (% (|NonNegativeInteger|)))
        (COND
         ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
          (|error| "null polynomial"))
         ('T (SPADCALL (SPADCALL |p| (QREFELT % 70)) (QREFELT % 23))))) 

(SDEFUN |XPBWPOLY;trunc;%Nni%;25|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
              (NULL (> (SPADCALL |p| (QREFELT % 86)) |n|)))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT % 87)) |n| (QREFELT % 88))))) 

(SDEFUN |XPBWPOLY;product;2%Nni%;26|
        ((|x| (%)) (|y| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G138 NIL) (#2=#:G136 (%)) (#3=#:G134 (%))
          (#4=#:G135 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (|spadConstant| % 21) (QREFELT % 65))
                (SPADCALL |y| (|spadConstant| % 21) (QREFELT % 65)))
            (|spadConstant| % 21))
           ('T
            (PROGN
             (LETT #4# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |x|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod11| (QCAR |t|) |y| |n| %)
                                     (QREFELT % 19)))
                     (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#4# #3#) ('T (|spadConstant| % 21))))))))) 

(SDEFUN |XPBWPOLY;exp;%Nni%;27|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|i| NIL) (#1=#:G145 NIL) (|k1| (|Fraction| (|Integer|))) (|k2| (R))
          (|s| (%)) (|r| (%)))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 24))
           ((NULL (SPADCALL |p| (QREFELT % 77)))
            (|error| "a proper polynomial is required"))
           ('T
            (SEQ (LETT |s| (|spadConstant| % 24))
                 (LETT |r| (|spadConstant| % 24))
                 (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT % 91)))
                           (LETT |k2|
                                 (SPADCALL |k1| (|spadConstant| % 9)
                                           (QREFELT % 92)))
                           (LETT |s|
                                 (SPADCALL |k2|
                                           (SPADCALL |p| |s| |n|
                                                     (QREFELT % 89))
                                           (QREFELT % 19)))
                           (EXIT (LETT |r| (SPADCALL |r| |s| (QREFELT % 20)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;log;%Nni%;28|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|p1| (%)) (|i| NIL) (#1=#:G152 NIL) (|k1| (|Fraction| (|Integer|)))
          (|k2| (R)) (|s| (%)) (|r| (%)))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 24) (QREFELT % 65))
            (|spadConstant| % 21))
           ('T
            (SEQ
             (LETT |p1| (SPADCALL (|spadConstant| % 24) |p| (QREFELT % 94)))
             (COND
              ((NULL (SPADCALL |p1| (QREFELT % 77)))
               (EXIT (|error| "constant term ~= 1, impossible log"))))
             (LETT |s| (SPADCALL (|spadConstant| % 24) (QREFELT % 95)))
             (LETT |r| (|spadConstant| % 21))
             (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT % 91)))
                       (LETT |k2|
                             (SPADCALL |k1| (|spadConstant| % 9)
                                       (QREFELT % 92)))
                       (LETT |s| (SPADCALL |p1| |s| |n| (QREFELT % 89)))
                       (EXIT
                        (LETT |r|
                              (SPADCALL (SPADCALL |k2| |s| (QREFELT % 19)) |r|
                                        (QREFELT % 20)))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;LiePolyIfCan;%U;29|
        ((|p| (%)) (% (|Union| (|LiePolynomial| |VarSet| R) "failed")))
        (SPROG
         ((#1=#:G168 NIL) (#2=#:G158 #3=(|Boolean|)) (#4=#:G156 #3#)
          (#5=#:G157 NIL) (#6=#:G169 NIL) (|t| NIL) (#7=#:G170 NIL)
          (|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (CONS 0 (|spadConstant| % 97)))
           ((PROGN
             (LETT #5# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2# (SPADCALL (QCAR |t|) (QREFELT % 98)))
                     (COND (#5# (LETT #4# (COND (#4# #2#) ('T NIL))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#8='T 'T)))
            (SEQ
             (LETT |lt|
                   (PROGN
                    (LETT #6# NIL)
                    (SEQ (LETT |t| NIL) (LETT #7# |p|) G190
                         (COND
                          ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (CONS (SPADCALL (QCAR |t|) (QREFELT % 99))
                                        (QCDR |t|))
                                  #6#))))
                         (LETT #7# (CDR #7#)) (GO G190) G191
                         (EXIT (NREVERSE #6#)))))
             (EXIT (CONS 0 |lt|))))
           (#8# (CONS 1 "failed")))))) 

(SDEFUN |XPBWPOLY;mirror;2%;30| ((|p| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G175 NIL) (#2=#:G173 (%)) (#3=#:G171 (%))
          (#4=#:G172 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;mirror1| (QCAR |t|) %)
                                   (QREFELT % 19)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 20))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 21))))))) 

(DECLAIM (NOTINLINE |XPBWPolynomial;|)) 

(DEFUN |XPBWPolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G189 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XPBWPolynomial| DV$1 DV$2))
    (LETT % (GETREFV 116))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|)))
                                        (|HasCategory| |#2|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|PoincareBirkhoffWittLyndonBasis|
                                                |#1|)
                                               '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#2| '(|Comparable|))
                                         #1#)
                                        (|HasCategory| |#2|
                                                       '(|Module|
                                                         (|Fraction|
                                                          (|Integer|))))))))
    (|haddProp| |$ConstructorCache| '|XPBWPolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|List|
               (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |#1|))
                         (|:| |c| |#2|))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV % 93 (CONS (|dispatchFunction| |XPBWPOLY;exp;%Nni%;27|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |XPBWPOLY;log;%Nni%;28|) %)))))
    %))) 

(DEFUN |XPBWPolynomial| (&REST #1=#:G190)
  (SPROG NIL
         (PROG (#2=#:G191)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPBWPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPBWPolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPBWPolynomial|)))))))))) 

(MAKEPROP '|XPBWPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 13) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |1|) (|Boolean|) (4 . =)
              (|OutputForm|) (|PoincareBirkhoffWittLyndonBasis| 6)
              (10 . |coerce|) (15 . |1|) (19 . =) (25 . |coerce|) (30 . *)
              (36 . *) (42 . +) (48 . |0|) (|NonNegativeInteger|)
              (52 . |length|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XPBWPOLY;1;%;11|) %))
              (57 . |monomial|) (|List| 28) (63 . |listOfTerms|)
              (|LyndonWord| 6) (68 . |first|) (|XDistributedPolynomial| 6 7)
              (73 . |1|) (|LiePolynomial| 6 7) (77 . |LiePoly|) (82 . |coerce|)
              (87 . *) (|XRecursivePolynomial| 6 7) (93 . |1|) (97 . |coerce|)
              (102 . *) (108 . |mirror|) (113 . |rest|)
              |XPBWPOLY;coerce;Lp%;15| |XPBWPOLY;*;3%;22| (118 . |lexico|)
              (124 . |append|) (130 . |construct|)
              (|Record| (|:| |k| 28) (|:| |c| 7)) (|List| 47)
              (136 . |listOfTerms|) (141 . |list|) |XPBWPOLY;coerce;R%;12|
              (146 . |0|) (150 . +) (|Mapping| 12 12 12) (|List| 12)
              (156 . |reduce|) |XPBWPOLY;coerce;%Of;13| (162 . |coerce|)
              |XPBWPOLY;coerce;VarSet%;14| (167 . |coerce|) (172 . *) (178 . +)
              (184 . |0|) |XPBWPOLY;coerce;%Xdp;16| (188 . =) (194 . |0|)
              (198 . *) (204 . +) |XPBWPOLY;coerce;%Xrp;17|
              (210 . |leadingSupport|) |XPBWPOLY;constant?;%B;18|
              (|Record| (|:| |k| 13) (|:| |c| 7)) '"last" (215 . |elt|)
              |XPBWPOLY;constant;%R;19| (221 . ~=)
              |XPBWPOLY;quasiRegular?;%B;20| (|Integer|) (227 . |delete|)
              |XPBWPOLY;quasiRegular;2%;21| (|List| 6) (233 . |varList|)
              (238 . |setUnion|) (244 . |sort|) |XPBWPOLY;varList;%L;23|
              |XPBWPOLY;degree;%Nni;24| (249 . |reductum|)
              |XPBWPOLY;trunc;%Nni%;25| |XPBWPOLY;product;2%Nni%;26|
              (|Fraction| 78) (254 . /) (260 . *) (266 . |exp|) (272 . -)
              (278 . -) (283 . |log|) (289 . |0|) (293 . |retractable?|)
              (298 . |retract|) (|Union| 32 '"failed")
              |XPBWPOLY;LiePolyIfCan;%U;29| |XPBWPOLY;mirror;2%;30| (|String|)
              (|PositiveInteger|) (|Union| % '"failed") (|FreeMonoid| 6)
              (|Union| 7 '#1="failed") (|Union| 106 '#1#)
              (|Record| (|:| |k| 106) (|:| |c| 7)) (|Mapping| 7 7) (|List| %)
              (|List| 13) (|List| 7) (|List| 72) (|Mapping| 7 13))
           '#(~= 303 |zero?| 309 |varList| 314 |trunc| 319 |support| 325
              |subtractIfCan| 330 |smaller?| 336 |sh| 342 |sample| 354 |rquo|
              358 |rightRecip| 376 |rightPower| 381 |retractIfCan| 393
              |retract| 403 |reductum| 413 |recip| 418 |quasiRegular?| 423
              |quasiRegular| 428 |product| 433 |plenaryPower| 440 |opposite?|
              446 |one?| 452 |numberOfMonomials| 457 |monomials| 462
              |monomial?| 467 |monomial| 472 |mirror| 484 |mindegTerm| 489
              |mindeg| 494 |maxdeg| 499 |map| 504 |lquo| 510 |log| 528
              |listOfTerms| 534 |linearExtend| 539 |leftRecip| 545 |leftPower|
              550 |leadingTerm| 562 |leadingSupport| 567 |leadingMonomial| 572
              |leadingCoefficient| 577 |latex| 582 |exp| 587 |degree| 593
              |constructOrdered| 598 |construct| 603 |constant?| 608 |constant|
              613 |commutator| 618 |coerce| 624 |coefficients| 664
              |coefficient| 669 |coef| 675 |characteristic| 687 |associator|
              691 |antiCommutator| 698 |annihilate?| 704 ^ 710 |LiePolyIfCan|
              722 = 727 |1| 733 |0| 737 - 741 + 752 * 758)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 5 0 0 0 0 5 0 0 0 0 0 0 3 2 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |FreeModuleCategory&| |Rng&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|) (|NonAssociativeAlgebra| 7)
                 (|SemiRing|)
                 (|FreeModuleCategory| 7 (|PoincareBirkhoffWittLyndonBasis| 6))
                 (|Rng|) (|Module| 7) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  6))
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7
                                           (|PoincareBirkhoffWittLyndonBasis|
                                            6))
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|SetCategory|) (|RetractableTo| 7)
                 (|RetractableTo| (|FreeMonoid| 6)) (|noZeroDivisors|)
                 (|CharacteristicZero|) (|CoercibleTo| 12) (|BasicType|)
                 (|unitsKnown|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| (|FreeMonoid| 6)))
              (|makeByteWordVec2| 115
                                  '(0 7 0 9 2 7 10 0 0 11 1 13 12 0 14 0 13 0
                                    15 2 13 10 0 0 16 1 7 12 0 17 2 12 0 0 0 18
                                    2 0 0 7 0 19 2 0 0 0 0 20 0 0 0 21 1 13 22
                                    0 23 2 0 0 7 13 25 1 13 26 0 27 1 13 28 0
                                    29 0 30 0 31 1 32 0 28 33 1 32 30 0 34 2 30
                                    0 0 0 35 0 36 0 37 1 32 36 0 38 2 36 0 0 0
                                    39 1 32 0 0 40 1 13 0 0 41 2 28 10 0 0 44 2
                                    26 0 0 0 45 2 32 0 28 28 46 1 32 48 0 49 1
                                    26 0 28 50 0 7 0 52 2 12 0 0 0 53 2 55 12
                                    54 0 56 1 13 0 6 58 1 13 0 28 60 2 30 0 7 0
                                    61 2 30 0 0 0 62 0 30 0 63 2 0 10 0 0 65 0
                                    36 0 66 2 36 0 7 0 67 2 36 0 0 0 68 1 0 13
                                    0 70 2 8 72 0 73 74 2 13 10 0 0 76 2 8 0 0
                                    78 79 1 13 81 0 82 2 81 0 0 0 83 1 81 0 0
                                    84 1 0 0 0 87 2 90 0 78 78 91 2 7 0 90 0 92
                                    2 0 0 0 22 93 2 0 0 0 0 94 1 0 0 0 95 2 0 0
                                    0 22 96 0 32 0 97 1 13 10 0 98 1 13 28 0 99
                                    2 0 10 0 0 1 1 0 10 0 1 1 0 81 0 85 2 0 0 0
                                    22 88 1 0 112 0 1 2 0 105 0 0 1 2 5 10 0 0
                                    1 2 1 0 0 22 1 2 1 0 0 0 1 0 0 0 1 2 0 0 0
                                    6 1 2 0 0 0 106 1 2 0 0 0 0 1 1 0 105 0 1 2
                                    0 0 0 104 1 2 0 0 0 22 1 1 0 107 0 1 1 0
                                    108 0 1 1 0 7 0 1 1 0 106 0 1 1 4 0 0 87 1
                                    0 105 0 1 1 0 10 0 77 1 0 0 0 80 3 0 0 0 0
                                    22 89 2 1 0 0 104 1 2 0 10 0 0 1 1 0 10 0 1
                                    1 0 22 0 1 1 0 111 0 1 1 0 10 0 1 2 0 0 7
                                    106 1 2 0 0 7 13 25 1 0 0 0 102 1 0 109 0 1
                                    1 0 106 0 1 1 0 106 0 1 2 0 0 110 0 1 2 0 0
                                    0 6 1 2 0 0 0 106 1 2 0 0 0 0 1 2 6 0 0 22
                                    96 1 0 114 0 1 2 1 7 115 0 1 1 0 105 0 1 2
                                    0 0 0 104 1 2 0 0 0 22 1 1 4 72 0 1 1 4 13
                                    0 70 1 4 0 0 1 1 4 7 0 1 1 0 103 0 1 2 6 0
                                    0 22 93 1 0 22 0 86 1 4 0 114 1 1 0 0 114 1
                                    1 0 10 0 71 1 0 7 0 75 2 0 0 0 0 1 1 0 12 0
                                    57 1 0 0 78 1 1 0 0 7 51 1 0 0 106 1 1 0 0
                                    6 59 1 0 0 32 42 1 0 30 0 64 1 0 36 0 69 1
                                    0 113 0 1 2 0 7 0 13 1 2 0 7 0 106 1 2 0 7
                                    0 0 1 0 0 22 1 3 0 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 10 0 0 1 2 0 0 0 104 1 2 0 0 0 22 1 1 0
                                    100 0 101 2 0 10 0 0 65 0 0 0 24 0 0 0 21 1
                                    0 0 0 95 2 0 0 0 0 94 2 0 0 0 0 20 2 0 0
                                    104 0 1 2 0 0 0 0 43 2 0 0 78 0 1 2 0 0 22
                                    0 1 2 0 0 0 7 1 2 0 0 7 0 19 2 0 0 6 0
                                    1)))))
           '|lookupComplete|)) 
