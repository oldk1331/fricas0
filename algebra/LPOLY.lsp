
(SDEFUN |LPOLY;eval1|
        ((|lw| (|LyndonWord| |VarSet|)) (|v| (|VarSet|)) (|nv| (%)) (% (%)))
        (SPROG
         ((|s| (|Union| |VarSet| "failed")) (|l| (|LyndonWord| |VarSet|))
          (|r| (|LyndonWord| |VarSet|)))
         (SEQ
          (COND
           ((NULL (SPADCALL |v| (SPADCALL |lw| (QREFELT % 11)) (QREFELT % 13)))
            (SPADCALL |lw| (QREFELT % 14)))
           ('T
            (SEQ (LETT |s| (SPADCALL |lw| (QREFELT % 16)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (COND ((SPADCALL (QCDR |s|) |v| (QREFELT % 17)) |nv|)
                          (#1='T (SPADCALL |lw| (QREFELT % 14)))))
                   (#1#
                    (SEQ (LETT |l| (SPADCALL |lw| (QREFELT % 18)))
                         (LETT |r| (SPADCALL |lw| (QREFELT % 19)))
                         (EXIT
                          (SPADCALL (|LPOLY;eval1| |l| |v| |nv| %)
                                    (|LPOLY;eval1| |r| |v| |nv| %)
                                    (QREFELT % 20))))))))))))) 

(SDEFUN |LPOLY;eval2|
        ((|lw| (|LyndonWord| |VarSet|)) (|lv| (|List| |VarSet|))
         (|lnv| (|List| %)) (% (%)))
        (SPROG
         ((|s| (|Union| |VarSet| "failed")) (|p| (|Integer|))
          (|l| (|LyndonWord| |VarSet|)) (|r| (|LyndonWord| |VarSet|)))
         (SEQ (LETT |s| (SPADCALL |lw| (QREFELT % 16)))
              (EXIT
               (COND
                ((QEQCAR |s| 0)
                 (SEQ (LETT |p| (SPADCALL (QCDR |s|) |lv| (QREFELT % 22)))
                      (EXIT
                       (COND
                        ((EQL |p| 0)
                         (SPADCALL (|spadConstant| % 25) |lw| (QREFELT % 26)))
                        (#1='T (SPADCALL |lnv| |p| (QREFELT % 28)))))))
                (#1#
                 (SEQ (LETT |l| (SPADCALL |lw| (QREFELT % 18)))
                      (LETT |r| (SPADCALL |lw| (QREFELT % 19)))
                      (EXIT
                       (SPADCALL (|LPOLY;eval2| |l| |lv| |lnv| %)
                                 (|LPOLY;eval2| |r| |lv| |lnv| %)
                                 (QREFELT % 20)))))))))) 

(SDEFUN |LPOLY;eval;%VarSet2%;3|
        ((|p| (%)) (|v| (|VarSet|)) (|nv| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G43 NIL) (#2=#:G41 (%)) (#3=#:G39 (%))
          (#4=#:G40 NIL))
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
                                   (|LPOLY;eval1| (QCAR |t|) |v| |nv| %)
                                   (QREFELT % 29)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 30))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 23))))))) 

(SDEFUN |LPOLY;eval;%LL%;4|
        ((|p| (%)) (|lv| (|List| |VarSet|)) (|lnv| (|List| %)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G48 NIL) (#2=#:G46 (%)) (#3=#:G44 (%))
          (#4=#:G45 NIL))
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
                                   (|LPOLY;eval2| (QCAR |t|) |lv| |lnv| %)
                                   (QREFELT % 29)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 30))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 23))))))) 

(SDEFUN |LPOLY;lquo1|
        ((|p| (|XRecursivePolynomial| |VarSet| R))
         (|lw| (|LyndonWord| |VarSet|))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (COND ((SPADCALL |p| (QREFELT % 35)) (|spadConstant| % 36))
              ((SPADCALL |lw| (QREFELT % 37))
               (SPADCALL |p| (SPADCALL |lw| (QREFELT % 38)) (QREFELT % 39)))
              ('T
               (SPADCALL
                (|LPOLY;lquo1|
                 (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT % 18)) %)
                 (SPADCALL |lw| (QREFELT % 19)) %)
                (|LPOLY;lquo1|
                 (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT % 19)) %)
                 (SPADCALL |lw| (QREFELT % 18)) %)
                (QREFELT % 40))))) 

(SDEFUN |LPOLY;rquo1|
        ((|p| (|XRecursivePolynomial| |VarSet| R))
         (|lw| (|LyndonWord| |VarSet|))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (COND ((SPADCALL |p| (QREFELT % 35)) (|spadConstant| % 36))
              ((SPADCALL |lw| (QREFELT % 37))
               (SPADCALL |p| (SPADCALL |lw| (QREFELT % 38)) (QREFELT % 41)))
              ('T
               (SPADCALL
                (|LPOLY;rquo1|
                 (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT % 18)) %)
                 (SPADCALL |lw| (QREFELT % 19)) %)
                (|LPOLY;rquo1|
                 (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT % 19)) %)
                 (SPADCALL |lw| (QREFELT % 18)) %)
                (QREFELT % 40))))) 

(SDEFUN |LPOLY;coef;Xrp%R;7|
        ((|p| (|XRecursivePolynomial| |VarSet| R)) (|lp| (%)) (% (R)))
        (SPADCALL |p| (SPADCALL |lp| (QREFELT % 42)) (QREFELT % 43))) 

(SDEFUN |LPOLY;lquo;Xrp%Xrp;8|
        ((|p| (|XRecursivePolynomial| |VarSet| R)) (|lp| (%))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G60 NIL)
          (#2=#:G58 #3=(|XRecursivePolynomial| |VarSet| R)) (#4=#:G56 #3#)
          (#5=#:G57 NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| % 23) (QREFELT % 45))
            (|spadConstant| % 36))
           (#6='T
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |lp|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;lquo1| |p| (QCAR |t|) %)
                                     (QREFELT % 46)))
                     (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 47))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# (|spadConstant| % 36))))))))) 

(SDEFUN |LPOLY;rquo;Xrp%Xrp;9|
        ((|p| (|XRecursivePolynomial| |VarSet| R)) (|lp| (%))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G65 NIL)
          (#2=#:G63 #3=(|XRecursivePolynomial| |VarSet| R)) (#4=#:G61 #3#)
          (#5=#:G62 NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| % 23) (QREFELT % 45))
            (|spadConstant| % 36))
           (#6='T
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |t| NIL) (LETT #1# |lp|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;rquo1| |p| (QCAR |t|) %)
                                     (QREFELT % 46)))
                     (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 47))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# (|spadConstant| % 36))))))))) 

(SDEFUN |LPOLY;LiePolyIfCan;XdpU;10|
        ((|p| #1=(|XDistributedPolynomial| |VarSet| R))
         (% (|Union| % "failed")))
        (SPROG
         ((|t| (|Record| (|:| |k| (|FreeMonoid| |VarSet|)) (|:| |c| R)))
          (|w| (|FreeMonoid| |VarSet|)) (|coef| (R))
          (|l| (|Union| (|LyndonWord| |VarSet|) "failed")) (#2=#:G84 NIL)
          (|lp| (%)) (|r| (%)) (|p1| #1#))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |p| (QREFELT % 51))) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |p1| |p|) (LETT |r| (|spadConstant| % 23))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |p1| (|spadConstant| % 52)
                                         (QREFELT % 53)))
                              (GO G191)))
                            (SEQ (LETT |t| (SPADCALL |p1| (QREFELT % 55)))
                                 (LETT |w| (QCAR |t|)) (LETT |coef| (QCDR |t|))
                                 (LETT |l| (SPADCALL |w| (QREFELT % 58)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |l| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed"))
                                     (GO #3=#:G83)))
                                   ('T
                                    (SEQ
                                     (LETT |lp|
                                           (SPADCALL |coef|
                                                     (SPADCALL (QCDR |l|)
                                                               (QREFELT % 14))
                                                     (QREFELT % 29)))
                                     (LETT |r|
                                           (SPADCALL |r| |lp| (QREFELT % 30)))
                                     (EXIT
                                      (LETT |p1|
                                            (SPADCALL |p1|
                                                      (SPADCALL |lp|
                                                                (QREFELT % 59))
                                                      (QREFELT % 60)))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 |r|))))))
          #3# (EXIT #2#)))) 

(SDEFUN |LPOLY;makeLyndon|
        ((|u| (|LyndonWord| |VarSet|)) (|v| (|LyndonWord| |VarSet|))
         (% (|LyndonWord| |VarSet|)))
        (SPADCALL (SPADCALL |u| (QREFELT % 63)) (SPADCALL |v| (QREFELT % 63))
                  (QREFELT % 64))) 

(SDEFUN |LPOLY;crw|
        ((|u| (|LyndonWord| |VarSet|)) (|v| (|LyndonWord| |VarSet|)) (% (%)))
        (COND ((SPADCALL |u| |v| (QREFELT % 65)) (|spadConstant| % 23))
              ((SPADCALL |u| |v| (QREFELT % 66)) (|LPOLY;lyndon| |u| |v| %))
              ('T (SPADCALL (|LPOLY;lyndon| |v| |u| %) (QREFELT % 67))))) 

(SDEFUN |LPOLY;lyndon|
        ((|u| (|LyndonWord| |VarSet|)) (|v| (|LyndonWord| |VarSet|)) (% (%)))
        (SPROG ((|u1| (|LyndonWord| |VarSet|)) (|u2| (|LyndonWord| |VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT % 37))
                  (SPADCALL (|spadConstant| % 25)
                            (|LPOLY;makeLyndon| |u| |v| %) (QREFELT % 26)))
                 (#1='T
                  (SEQ (LETT |u1| (SPADCALL |u| (QREFELT % 18)))
                       (LETT |u2| (SPADCALL |u| (QREFELT % 19)))
                       (EXIT
                        (COND
                         ((SPADCALL |u2| |v| (QREFELT % 66))
                          (SPADCALL
                           (|LPOLY;cr1| |u1| (|LPOLY;lyndon| |u2| |v| %) %)
                           (|LPOLY;cr2| (|LPOLY;lyndon| |u1| |v| %) |u2| %)
                           (QREFELT % 30)))
                         (#1#
                          (SPADCALL (|spadConstant| % 25)
                                    (|LPOLY;makeLyndon| |u| |v| %)
                                    (QREFELT % 26))))))))))) 

(SDEFUN |LPOLY;cr1| ((|l| (|LyndonWord| |VarSet|)) (|p| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G95 NIL) (#2=#:G93 (%)) (#3=#:G91 (%))
          (#4=#:G92 NIL))
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
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| |l| (QCAR |t|) %)
                                   (QREFELT % 29)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 30))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 23))))))) 

(SDEFUN |LPOLY;cr2| ((|p| (%)) (|l| (|LyndonWord| |VarSet|)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G100 NIL) (#2=#:G98 (%)) (#3=#:G96 (%))
          (#4=#:G97 NIL))
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
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| (QCAR |t|) |l| %)
                                   (QREFELT % 29)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 30))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 23))))))) 

(SDEFUN |LPOLY;DPoly|
        ((|w| (|LyndonWord| |VarSet|))
         (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG ((|l| #1=(|XDistributedPolynomial| |VarSet| R)) (|r| #1#))
               (SEQ
                (COND
                 ((SPADCALL |w| (QREFELT % 37))
                  (SPADCALL (SPADCALL |w| (QREFELT % 38)) (QREFELT % 68)))
                 ('T
                  (SEQ
                   (LETT |l| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT % 18)) %))
                   (LETT |r| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT % 19)) %))
                   (EXIT
                    (SPADCALL (SPADCALL |l| |r| (QREFELT % 69))
                              (SPADCALL |r| |l| (QREFELT % 69))
                              (QREFELT % 60))))))))) 

(SDEFUN |LPOLY;RPoly|
        ((|w| (|LyndonWord| |VarSet|)) (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG ((|l| #1=(|XRecursivePolynomial| |VarSet| R)) (|r| #1#))
               (SEQ
                (COND
                 ((SPADCALL |w| (QREFELT % 37))
                  (SPADCALL (SPADCALL |w| (QREFELT % 38)) (QREFELT % 70)))
                 ('T
                  (SEQ
                   (LETT |l| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT % 18)) %))
                   (LETT |r| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT % 19)) %))
                   (EXIT
                    (SPADCALL (SPADCALL |l| |r| (QREFELT % 71))
                              (SPADCALL |r| |l| (QREFELT % 71))
                              (QREFELT % 40))))))))) 

(SDEFUN |LPOLY;coerce;VarSet%;18| ((|v| (|VarSet|)) (% (%)))
        (SPADCALL (|spadConstant| % 25) (SPADCALL |v| (QREFELT % 72))
                  (QREFELT % 26))) 

(SDEFUN |LPOLY;construct;3%;19| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|t| NIL) (#1=#:G112 NIL) (#2=#:G110 (%)) (#3=#:G108 (%))
          (#4=#:G109 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #1# |x|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |t|) (|LPOLY;cr1| (QCAR |t|) |y| %)
                                   (QREFELT % 29)))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 30))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 23))))))) 

(SDEFUN |LPOLY;construct;Lw2%;20|
        ((|l| (|LyndonWord| |VarSet|)) (|p| (%)) (% (%)))
        (|LPOLY;cr1| |l| |p| %)) 

(SDEFUN |LPOLY;construct;%Lw%;21|
        ((|p| (%)) (|l| (|LyndonWord| |VarSet|)) (% (%)))
        (|LPOLY;cr2| |p| |l| %)) 

(SDEFUN |LPOLY;construct;2Lw%;22|
        ((|u| (|LyndonWord| |VarSet|)) (|v| (|LyndonWord| |VarSet|)) (% (%)))
        (|LPOLY;crw| |u| |v| %)) 

(SDEFUN |LPOLY;coerce;%Xdp;23|
        ((|p| (%)) (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G120 NIL)
          (#2=#:G118 #3=(|XDistributedPolynomial| |VarSet| R)) (#4=#:G116 #3#)
          (#5=#:G117 NIL))
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
                         (SPADCALL (QCDR |t|) (|LPOLY;DPoly| (QCAR |t|) %)
                                   (QREFELT % 77)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 78))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|spadConstant| % 52))))))) 

(SDEFUN |LPOLY;coerce;%Xrp;24|
        ((|p| (%)) (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((|t| NIL) (#1=#:G125 NIL)
          (#2=#:G123 #3=(|XRecursivePolynomial| |VarSet| R)) (#4=#:G121 #3#)
          (#5=#:G122 NIL))
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
                         (SPADCALL (QCDR |t|) (|LPOLY;RPoly| (QCAR |t|) %)
                                   (QREFELT % 46)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 47))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|spadConstant| % 36))))))) 

(SDEFUN |LPOLY;LiePoly;Lw%;25| ((|l| (|LyndonWord| |VarSet|)) (% (%)))
        (SPADCALL (|spadConstant| % 25) |l| (QREFELT % 26))) 

(SDEFUN |LPOLY;varList;%L;26| ((|p| (%)) (% (|List| |VarSet|)))
        (SPROG
         ((|t| NIL) (#1=#:G132 NIL) (#2=#:G129 #3=(|List| |VarSet|))
          (#4=#:G127 #3#) (#5=#:G128 NIL) (|le| #3#))
         (SEQ
          (LETT |le|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QCAR |t|) (QREFELT % 11)))
                         (COND
                          (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 79))))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |le| (QREFELT % 80)))))) 

(SDEFUN |LPOLY;mirror;2%;27| ((|p| (%)) (% (%)))
        (SPROG ((#1=#:G137 NIL) (|t| NIL) (#2=#:G138 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (CONS (QCAR |t|)
                                     (COND
                                      ((ODDP
                                        (SPADCALL (QCAR |t|) (QREFELT % 83)))
                                       (QCDR |t|))
                                      ('T
                                       (SPADCALL (QCDR |t|) (QREFELT % 84)))))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |LPOLY;trunc;%Nni%;28| ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND
         ((> (SPADCALL |p| (QREFELT % 87)) |n|)
          (SPADCALL (SPADCALL |p| (QREFELT % 88)) |n| (QREFELT % 89)))
         ('T |p|))) 

(SDEFUN |LPOLY;degree;%Nni;29| ((|p| (%)) (% (|NonNegativeInteger|)))
        (COND ((NULL |p|) 0)
              ('T (SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT % 83))))) 

(SDEFUN |LPOLY;outTerm|
        ((|r| (R)) (|lw| (|LyndonWord| |VarSet|)) (% (|OutputForm|)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 25) (QREFELT % 90))
          (SPADCALL |lw| (QREFELT % 92)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT % 93))
                    (SPADCALL |lw| (QREFELT % 92)) (QREFELT % 94))))) 

(SDEFUN |LPOLY;coerce;%Of;31| ((|a| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G151 NIL) (|t| NIL) (#2=#:G152 NIL))
               (SEQ
                (COND
                 ((NULL |a|) (SPADCALL (|spadConstant| % 24) (QREFELT % 93)))
                 ('T
                  (SPADCALL (ELT % 95)
                            (NREVERSE
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |t| NIL) (LETT #2# |a|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |t| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (|LPOLY;outTerm| (QCDR |t|)
                                             (QCAR |t|) %)
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))
                            (QREFELT % 98))))))) 

(DECLAIM (NOTINLINE |LiePolynomial;|)) 

(DEFUN |LiePolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G157 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|LiePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 107))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|)))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|LyndonWord| |#1|)
                                               '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#2| '(|Comparable|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|LiePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|List| (|Record| (|:| |k| (|LyndonWord| |#1|)) (|:| |c| |#2|))))
    %))) 

(DEFUN |LiePolynomial| (&REST #1=#:G158)
  (SPROG NIL
         (PROG (#2=#:G159)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LiePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LiePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LiePolynomial|)))))))))) 

(MAKEPROP '|LiePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 10) (|local| |#1|)
              (|local| |#2|) '|Rep| (|List| 6) (|LyndonWord| 6) (0 . |varList|)
              (|Boolean|) (5 . |member?|) |LPOLY;LiePoly;Lw%;25|
              (|Union| 6 '"failed") (11 . |retractIfCan|) (16 . =)
              (22 . |left|) (27 . |right|) |LPOLY;construct;3%;19| (|Integer|)
              (32 . |position|) (38 . |0|) (42 . |0|) (46 . |1|)
              (50 . |monomial|) (|List| $$) (56 . |elt|) (62 . *) (68 . +)
              |LPOLY;eval;%VarSet2%;3| (|List| %) |LPOLY;eval;%LL%;4|
              (|XRecursivePolynomial| 6 7) (74 . |constant?|) (79 . |0|)
              (83 . |retractable?|) (88 . |retract|) (93 . |lquo|) (99 . -)
              (105 . |rquo|) |LPOLY;coerce;%Xrp;24| (111 . |coef|)
              |LPOLY;coef;Xrp%R;7| (117 . =) (123 . *) (129 . +)
              |LPOLY;lquo;Xrp%Xrp;8| |LPOLY;rquo;Xrp%Xrp;9|
              (|XDistributedPolynomial| 6 7) (135 . |quasiRegular?|)
              (140 . |0|) (144 . ~=) (|Record| (|:| |k| 57) (|:| |c| 7))
              (150 . |mindegTerm|) (|Union| % '"failed") (|FreeMonoid| 6)
              (155 . |lyndonIfCan|) |LPOLY;coerce;%Xdp;23| (160 . -)
              |LPOLY;LiePolyIfCan;XdpU;10| (|FreeMagma| 6) (166 . |coerce|)
              (171 . *) (177 . =) (183 . |lexico|) (189 . -) (194 . |coerce|)
              (199 . *) (205 . |coerce|) (210 . *) (216 . |coerce|)
              |LPOLY;coerce;VarSet%;18| |LPOLY;construct;Lw2%;20|
              |LPOLY;construct;%Lw%;21| |LPOLY;construct;2Lw%;22| (221 . *)
              (227 . +) (233 . |setUnion|) (239 . |sort|) |LPOLY;varList;%L;26|
              (|PositiveInteger|) (244 . |length|) (249 . -)
              |LPOLY;mirror;2%;27| (|NonNegativeInteger|)
              |LPOLY;degree;%Nni;29| (254 . |reductum|) |LPOLY;trunc;%Nni%;28|
              (259 . =) (|OutputForm|) (265 . |coerce|) (270 . |coerce|)
              (275 . *) (281 . +) (|Mapping| 91 91 91) (|List| 91)
              (287 . |reduce|) |LPOLY;coerce;%Of;31| (|String|) (|List| 10)
              (|Mapping| 7 7) (|List| 7) (|Record| (|:| |k| 10) (|:| |c| 7))
              (|List| 104) (|Mapping| 7 10))
           '#(~= 293 |zero?| 299 |varList| 304 |trunc| 309 |support| 315
              |subtractIfCan| 320 |smaller?| 326 |sample| 332 |rquo| 336
              |reductum| 342 |opposite?| 347 |numberOfMonomials| 353
              |monomials| 358 |monomial?| 363 |monomial| 368 |mirror| 374 |map|
              379 |lquo| 385 |listOfTerms| 391 |linearExtend| 396 |leadingTerm|
              402 |leadingSupport| 407 |leadingMonomial| 412
              |leadingCoefficient| 417 |latex| 422 |eval| 427 |degree| 441
              |constructOrdered| 446 |construct| 451 |coerce| 480
              |coefficients| 500 |coefficient| 505 |coef| 511 |LiePolyIfCan|
              517 |LiePoly| 522 = 527 |0| 533 / 537 - 543 + 554 * 560)
           'NIL
           (CONS
            (|makeByteWordVec2| 8 '(0 0 0 0 0 0 0 0 0 0 1 4 8 3 8 2 0 0 0 0))
            (CONS
             '#(NIL |FreeModuleCategory&| |LieAlgebra&| NIL |Module&| NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| NIL
                |SetWithZero&| |AbelianSemiGroup&| |SetCategory&| NIL
                |BasicType&|)
             (CONS
              '#((|FreeLieAlgebra| 6 7)
                 (|FreeModuleCategory| 7 (|LyndonWord| 6)) (|LieAlgebra| 7)
                 (|IndexedDirectProductCategory| 7 (|LyndonWord| 6))
                 (|Module| 7) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 (|LyndonWord| 6))
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Comparable|) (|AbelianMonoid|)
                 (|ComparableRepresentation|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|CoercibleTo| 91)
                 (|BasicType|))
              (|makeByteWordVec2| 106
                                  '(1 10 9 0 11 2 9 12 6 0 13 1 10 15 0 16 2 6
                                    12 0 0 17 1 10 0 0 18 1 10 0 0 19 2 9 21 6
                                    0 22 0 0 0 23 0 7 0 24 0 7 0 25 2 0 0 7 10
                                    26 2 27 2 0 21 28 2 0 0 7 0 29 2 0 0 0 0 30
                                    1 34 12 0 35 0 34 0 36 1 10 12 0 37 1 10 6
                                    0 38 2 34 0 0 6 39 2 34 0 0 0 40 2 34 0 0 6
                                    41 2 34 7 0 0 43 2 0 12 0 0 45 2 34 0 7 0
                                    46 2 34 0 0 0 47 1 50 12 0 51 0 50 0 52 2
                                    50 12 0 0 53 1 50 54 0 55 1 10 56 57 58 2
                                    50 0 0 0 60 1 10 62 0 63 2 62 0 0 0 64 2 10
                                    12 0 0 65 2 10 12 0 0 66 1 0 0 0 67 1 50 0
                                    6 68 2 50 0 0 0 69 1 34 0 6 70 2 34 0 0 0
                                    71 1 10 0 6 72 2 50 0 7 0 77 2 50 0 0 0 78
                                    2 9 0 0 0 79 1 9 0 0 80 1 10 82 0 83 1 7 0
                                    0 84 1 0 0 0 88 2 7 12 0 0 90 1 10 91 0 92
                                    1 7 91 0 93 2 91 0 0 0 94 2 91 0 0 0 95 2
                                    97 91 96 0 98 2 0 12 0 0 1 1 2 12 0 1 1 0 9
                                    0 81 2 0 0 0 86 89 1 0 101 0 1 2 4 56 0 0 1
                                    2 8 12 0 0 1 0 2 0 1 2 0 34 34 0 49 1 7 0 0
                                    88 2 2 12 0 0 1 1 0 86 0 1 1 0 32 0 1 1 0
                                    12 0 1 2 0 0 7 10 26 1 0 0 0 85 2 0 0 102 0
                                    1 2 0 34 34 0 48 1 0 105 0 1 2 6 7 106 0 1
                                    1 7 104 0 1 1 7 10 0 1 1 7 0 0 1 1 7 7 0 1
                                    1 0 100 0 1 3 0 0 0 9 32 33 3 0 0 0 6 0 31
                                    1 0 86 0 87 1 7 0 105 1 2 0 0 0 0 20 1 0 0
                                    105 1 2 0 0 10 0 74 2 0 0 10 10 76 2 0 0 0
                                    10 75 1 0 91 0 99 1 0 50 0 59 1 0 0 6 73 1
                                    0 34 0 42 1 0 103 0 1 2 0 7 0 10 1 2 0 7 34
                                    0 44 1 0 56 50 61 1 0 0 10 14 2 0 12 0 0 45
                                    0 2 0 23 2 5 0 0 7 1 2 1 0 0 0 1 1 1 0 0 67
                                    2 0 0 0 0 30 2 0 0 82 0 1 2 0 0 7 0 29 2 0
                                    0 0 7 1 2 1 0 21 0 1 2 2 0 86 0 1)))))
           '|lookupComplete|)) 
