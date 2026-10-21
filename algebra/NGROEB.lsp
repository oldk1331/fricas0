
(SDEFUN |NGROEB;lcmCo|
        ((|c1| (|Dom|)) (|c2| (|Dom|))
         (% (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|))))
        (SPROG
         ((|lcc|
           (|Record| (|:| |llcm_res| |Dom|) (|:| |coeff1| |Dom|)
                     (|:| |coeff2| |Dom|))))
         (SEQ (LETT |lcc| (SPADCALL |c1| |c2| (QREFELT % 10)))
              (EXIT (CONS (QVELT |lcc| 1) (QVELT |lcc| 2)))))) 

(SDEFUN |NGROEB;virtualDegree;DpolNni;2|
        ((|p| (|Dpol|)) (% (|NonNegativeInteger|)))
        (SPADCALL |p| (QREFELT % 12))) 

(MAKEPROP '|NGROEB;virtualDegree;DpolNni;3| '|SPADreplace| '(XLAM (|p|) 0)) 

(SDEFUN |NGROEB;virtualDegree;DpolNni;3|
        ((|p| (|Dpol|)) (% (|NonNegativeInteger|))) 0) 

(SDEFUN |NGROEB;critpOrder|
        ((|cp1|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (|cp2|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (% (|Boolean|)))
        (COND ((< (QVELT |cp1| 1) (QVELT |cp2| 1)) 'T)
              ((< (QVELT |cp2| 1) (QVELT |cp1| 1)) NIL)
              ('T (SPADCALL (QVELT |cp1| 0) (QVELT |cp2| 0) (QREFELT % 15))))) 

(SDEFUN |NGROEB;makeCrit|
        ((|sp1|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         (|p2| (|Dpol|)) (|totdeg2| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG
         ((|p1| (|Dpol|)) (|deg| (|Expon|)) (|e1| (|Expon|)) (#1=#:G31 NIL)
          (|e2| (|Expon|)) (|tdeg| (|NonNegativeInteger|)))
         (SEQ (LETT |p1| (QCDR |sp1|))
              (LETT |deg|
                    (SPADCALL (SPADCALL |p1| (QREFELT % 16))
                              (SPADCALL |p2| (QREFELT % 16)) (QREFELT % 17)))
              (LETT |e1|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p1| (QREFELT % 16))
                                        (QREFELT % 19)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                      (|Union| (QREFELT % 7) #2="failed")
                                      #1#)))
              (LETT |e2|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p2| (QREFELT % 16))
                                        (QREFELT % 19)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                      (|Union| (QREFELT % 7) #2#) #1#)))
              (LETT |tdeg|
                    (MAX
                     (+ (QCAR |sp1|)
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 20) |e1| (QREFELT % 22))
                         (QREFELT % 13)))
                     (+ |totdeg2|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 20) |e2| (QREFELT % 22))
                         (QREFELT % 13)))))
              (EXIT (VECTOR |deg| |tdeg| |p1| |p2|))))) 

(SDEFUN |NGROEB;gbasis| ((|Pol| (|List| |Dpol|)) (% (|List| |Dpol|)))
        (SPROG
         ((|Pol1| (|List| |Dpol|)) (|toth| (|NonNegativeInteger|))
          (#1=#:G74 NIL) (#2=#:G75 NIL) (#3=#:G76 NIL) (#4=#:G77 NIL)
          (D0
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|)))
          (|s| (|Dpol|)) (|h| (|Dpol|)) (#5=#:G72 NIL) (#6=#:G73 NIL)
          (#7=#:G78 NIL) (#8=#:G79 NIL)
          (D1
           (|List|
            #9=(|Record| (|:| |lcmfij| |Expon|)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
          (D (|List| #9#))
          (|basPols|
           (|List|
            (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                      (|:| |pol| |Dpol|))))
          (|redPols| (|List| |Dpol|)) (#10=#:G80 NIL) (|x| NIL)
          (#11=#:G81 NIL))
         (SEQ
          (LETT |Pol1|
                (SPADCALL (CONS #'|NGROEB;gbasis!0| %) |Pol| (QREFELT % 26)))
          (LETT |basPols|
                (|NGROEB;updatF| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT % 27))
                 (SPADCALL (|SPADfirst| |Pol1|) (QREFELT % 13)) NIL %))
          (LETT |Pol1| (CDR |Pol1|)) (LETT D NIL)
          (SEQ G190 (COND ((NULL (NULL (NULL |Pol1|))) (GO G191)))
               (SEQ (LETT |h| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT % 27)))
                    (LETT |Pol1| (CDR |Pol1|))
                    (LETT |toth| (SPADCALL |h| (QREFELT % 13)))
                    (LETT D1
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |x| NIL) (LETT #2# |basPols|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |x| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (|NGROEB;makeCrit| |x| |h| |toth| %)
                                         #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#)))))
                    (LETT D
                          (|NGROEB;updatD|
                           (SPADCALL (CONS (|function| |NGROEB;critpOrder|) %)
                                     D1 (QREFELT % 31))
                           D %))
                    (EXIT
                     (LETT |basPols|
                           (|NGROEB;updatF| |h| |toth| |basPols| %))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT D
                (SPADCALL (CONS (|function| |NGROEB;critpOrder|) %) D
                          (QREFELT % 31)))
          (LETT |redPols|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |x| NIL) (LETT #4# |basPols|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #3# (CONS (QCDR |x|) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL (NULL (NULL D))) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT D0 (|SPADfirst| D))
                        (LETT |s|
                              (SPADCALL (SPADCALL D0 (QREFELT % 32))
                                        (QREFELT % 27)))
                        (LETT D (CDR D))
                        (LETT |h|
                              (SPADCALL (SPADCALL |s| |redPols| (QREFELT % 33))
                                        (QREFELT % 27)))
                        (EXIT
                         (COND
                          ((SPADCALL |h| (|spadConstant| % 36) (QREFELT % 37))
                           (PROGN (LETT #5# |$NoValue|) (GO #12=#:G56)))
                          ((SPADCALL (SPADCALL |h| (QREFELT % 16))
                                     (|spadConstant| % 35) (QREFELT % 38))
                           (SEQ (LETT D NIL)
                                (LETT |basPols| (|NGROEB;updatF| |h| 0 NIL %))
                                (EXIT (PROGN (LETT #6# 1) (GO #13=#:G67)))))
                          ('T
                           (SEQ
                            (LETT D1
                                  (PROGN
                                   (LETT #7# NIL)
                                   (SEQ (LETT |x| NIL) (LETT #8# |basPols|)
                                        G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN (LETT |x| (CAR #8#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #7#
                                                (CONS
                                                 (|NGROEB;makeCrit| |x| |h|
                                                  (QVELT D0 1) %)
                                                 #7#))))
                                        (LETT #8# (CDR #8#)) (GO G190) G191
                                        (EXIT (NREVERSE #7#)))))
                            (LETT D
                                  (|NGROEB;updatD|
                                   (SPADCALL
                                    (CONS (|function| |NGROEB;critpOrder|) %)
                                    D1 (QREFELT % 31))
                                   D %))
                            (LETT |basPols|
                                  (|NGROEB;updatF| |h| (QVELT D0 1) |basPols|
                                   %))
                            (EXIT
                             (LETT |redPols|
                                   (SPADCALL |redPols| |h|
                                             (QREFELT % 39))))))))))
                  #12# (EXIT #5#))
                 NIL (GO G190) G191 (EXIT NIL)))
           #13# (EXIT #6#))
          (LETT |Pol|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |x| NIL) (LETT #11# |basPols|) G190
                      (COND
                       ((OR (ATOM #11#) (PROGN (LETT |x| (CAR #11#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #10# (CONS (QCDR |x|) #10#))))
                      (LETT #11# (CDR #11#)) (GO G190) G191
                      (EXIT (NREVERSE #10#)))))
          (EXIT |Pol|)))) 

(SDEFUN |NGROEB;gbasis!0| ((|z1| NIL) (|z2| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 16)) (SPADCALL |z2| (QREFELT % 16))
                  (QREFELT % 23))) 

(SDEFUN |NGROEB;minGbasis| ((F (|List| |Dpol|)) (% #1=(|List| |Dpol|)))
        (SPROG ((|newbas| #1#))
               (SEQ
                (COND ((NULL F) NIL)
                      ('T
                       (SEQ (LETT |newbas| (|NGROEB;minGbasis| (CDR F) %))
                            (EXIT
                             (CONS
                              (SPADCALL
                               (|NGROEB;credPol| (|SPADfirst| F) |newbas| %)
                               (QREFELT % 27))
                              |newbas|)))))))) 

(SDEFUN |NGROEB;groebner;2L;8| ((F (|List| |Dpol|)) (% (|List| |Dpol|)))
        (|NGROEB;minGbasis|
         (SPADCALL (CONS #'|NGROEB;groebner;2L;8!0| %) (|NGROEB;gbasis| F %)
                   (QREFELT % 26))
         %)) 

(SDEFUN |NGROEB;groebner;2L;8!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 16)) (SPADCALL |y| (QREFELT % 16))
                  (QREFELT % 23))) 

(SDEFUN |NGROEB;sPol;RDpol;9|
        ((|p|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (% (|Dpol|)))
        (SPROG
         ((|Tij| (|Expon|)) (|fi| (|Dpol|)) (#1=#:G89 NIL) (|fj| (|Dpol|))
          (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|))))
         (SEQ (LETT |Tij| (QVELT |p| 0)) (LETT |fi| (QVELT |p| 2))
              (LETT |fj| (QVELT |p| 3))
              (LETT |fi|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 20)
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |Tij|
                                                   (SPADCALL |fi|
                                                             (QREFELT % 16))
                                                   (QREFELT % 19)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                                 (|Union| (QREFELT % 7)
                                                          #2="failed")
                                                 #1#))
                               (QREFELT % 22))
                     |fi| (QREFELT % 41)))
              (LETT |fj|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 20)
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |Tij|
                                                   (SPADCALL |fj|
                                                             (QREFELT % 16))
                                                   (QREFELT % 19)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                                 (|Union| (QREFELT % 7) #2#)
                                                 #1#))
                               (QREFELT % 22))
                     |fj| (QREFELT % 41)))
              (LETT |cc|
                    (|NGROEB;lcmCo| (SPADCALL |fi| (QREFELT % 42))
                     (SPADCALL |fj| (QREFELT % 42)) %))
              (EXIT
               (SPADCALL (SPADCALL (QCAR |cc|) |fi| (QREFELT % 43))
                         (SPADCALL (QCDR |cc|) |fj| (QREFELT % 43))
                         (QREFELT % 44)))))) 

(SDEFUN |NGROEB;redPo|
        ((|s| (|Dpol|)) (F #1=(|List| |Dpol|))
         (% (|Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|))))
        (SPROG
         ((|Fh| #1#) (|f1| (|Dpol|)) (|s1| (|Expon|)) (|d1| (|Expon|))
          (|e| (|Union| |Expon| "failed")) (|f2| (|Dpol|))
          (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|))) (|m| (|Dom|)))
         (SEQ (LETT |m| (|spadConstant| % 20)) (LETT |Fh| F)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |s| (|spadConstant| % 36) (QREFELT % 37))
                        NIL)
                       ('T (NULL (NULL F)))))
                     (GO G191)))
                   (SEQ (LETT |f1| (|SPADfirst| F))
                        (LETT |s1| (SPADCALL |s| (QREFELT % 16)))
                        (LETT |d1| (SPADCALL |f1| (QREFELT % 16)))
                        (LETT |e| (SPADCALL |s1| |d1| (QREFELT % 19)))
                        (EXIT
                         (COND
                          ((QEQCAR |e| 0)
                           (SEQ
                            (LETT |f2|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 20) (QCDR |e|)
                                             (QREFELT % 22))
                                   |f1| (QREFELT % 41)))
                            (LETT |cc|
                                  (|NGROEB;lcmCo| (SPADCALL |s| (QREFELT % 42))
                                   (SPADCALL |f2| (QREFELT % 42)) %))
                            (LETT |s|
                                  (SPADCALL
                                   (SPADCALL (QCAR |cc|) |s| (QREFELT % 43))
                                   (SPADCALL (QCDR |cc|) |f2| (QREFELT % 43))
                                   (QREFELT % 44)))
                            (COND
                             ((SPADCALL (SPADCALL |s| (QREFELT % 16)) |s1|
                                        (QREFELT % 38))
                              (SEQ
                               (SPADCALL
                                (SPADCALL "no progress in reduction"
                                          (QREFELT % 47))
                                (QREFELT % 49))
                               (SPADCALL (SPADCALL |s1| (QREFELT % 50))
                                         (QREFELT % 49))
                               (SPADCALL (SPADCALL |d1| (QREFELT % 50))
                                         (QREFELT % 49))
                               (SPADCALL (SPADCALL |e| (QREFELT % 52))
                                         (QREFELT % 49))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f2| (QREFELT % 16))
                                          (QREFELT % 50))
                                (QREFELT % 49))
                               (SPADCALL
                                (|coerceRe2E| |cc|
                                              (ELT
                                               (|Record|
                                                (|:| |co1| (QREFELT % 6))
                                                (|:| |co2| (QREFELT % 6)))
                                               0))
                                (QREFELT % 49))
                               (SPADCALL (SPADCALL |s| (QREFELT % 53))
                                         (QREFELT % 49))
                               (EXIT (|error| "no progress in reduction")))))
                            (LETT |m|
                                  (SPADCALL |m| (QCAR |cc|) (QREFELT % 54)))
                            (EXIT (LETT F |Fh|))))
                          ('T (LETT F (CDR F))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |s| |m|))))) 

(SDEFUN |NGROEB;redPol;DpolLDpol;11|
        ((|s| (|Dpol|)) (F (|List| |Dpol|)) (% (|Dpol|)))
        (|NGROEB;credPol| (QCAR (|NGROEB;redPo| |s| F %)) F %)) 

(SDEFUN |NGROEB;hMonic;2Dpol;12| ((|p| (|Dpol|)) (% (|Dpol|)))
        (SPADCALL |p| (QREFELT % 55))) 

(MAKEPROP '|NGROEB;hMonic;2Dpol;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NGROEB;hMonic;2Dpol;13| ((|p| (|Dpol|)) (% (|Dpol|))) |p|) 

(SDEFUN |NGROEB;credPol| ((|h| (|Dpol|)) (F (|List| |Dpol|)) (% (|Dpol|)))
        (SPROG
         ((|hred| (|Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|)))
          (|h0| (|Dpol|)))
         (SEQ
          (COND ((NULL F) |h|)
                ('T
                 (SEQ
                  (LETT |h0|
                        (SPADCALL (SPADCALL |h| (QREFELT % 42))
                                  (SPADCALL |h| (QREFELT % 16))
                                  (QREFELT % 22)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (LETT |h| (SPADCALL |h| (QREFELT % 56)))
                                    (|spadConstant| % 36) (QREFELT % 57)))
                         (GO G191)))
                       (SEQ (LETT |hred| (|NGROEB;redPo| |h| F %))
                            (LETT |h| (QCAR |hred|))
                            (EXIT
                             (LETT |h0|
                                   (SPADCALL
                                    (SPADCALL (QCDR |hred|) |h0|
                                              (QREFELT % 43))
                                    (SPADCALL (SPADCALL |h| (QREFELT % 42))
                                              (SPADCALL |h| (QREFELT % 16))
                                              (QREFELT % 22))
                                    (QREFELT % 58)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |h0|))))))) 

(SDEFUN |NGROEB;updatD|
        ((D1
          (|List|
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|))))
         (D2
          (|List|
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|))))
         (%
          (|List|
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|)))))
        (SPROG
         ((|dl1|
           #1=(|Record| (|:| |lcmfij| |Expon|)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (|dl2| #1#))
         (SEQ
          (COND ((NULL D1) D2) ((NULL D2) D1)
                (#2='T
                 (SEQ (LETT |dl1| (|SPADfirst| D1))
                      (LETT |dl2| (|SPADfirst| D2))
                      (EXIT
                       (COND
                        ((|NGROEB;critpOrder| |dl1| |dl2| %)
                         (CONS |dl1| (|NGROEB;updatD| (CDR D1) D2 %)))
                        (#2#
                         (CONS |dl2| (|NGROEB;updatD| D1 (CDR D2) %))))))))))) 

(SDEFUN |NGROEB;critM| ((|e1| (|Expon|)) (|e2| (|Expon|)) (% (|Boolean|)))
        (SPROG ((|en| (|Union| |Expon| "failed")))
               (QEQCAR (LETT |en| (SPADCALL |e2| |e1| (QREFELT % 19))) 0))) 

(SDEFUN |NGROEB;updatF|
        ((|h| (|Dpol|)) (|deg| (|NonNegativeInteger|))
         (F
          (|List|
           (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                     (|:| |pol| |Dpol|))))
         (%
          (|List|
           (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                     (|:| |pol| |Dpol|)))))
        (SPROG
         ((|f1|
           (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                     (|:| |pol| |Dpol|))))
         (SEQ
          (COND ((NULL F) (LIST (CONS |deg| |h|)))
                (#1='T
                 (SEQ (LETT |f1| (|SPADfirst| F))
                      (EXIT
                       (COND
                        ((|NGROEB;critM| (SPADCALL |h| (QREFELT % 16))
                          (SPADCALL (QCDR |f1|) (QREFELT % 16)) %)
                         (|NGROEB;updatF| |h| |deg| (CDR F) %))
                        (#1#
                         (CONS |f1|
                               (|NGROEB;updatF| |h| |deg| (CDR F) %))))))))))) 

(DECLAIM (NOTINLINE |NGroebnerPackage;|)) 

(DEFUN |NGroebnerPackage;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|NGroebnerPackage| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 59))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NGroebnerPackage|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasSignature| |#3|
                            (LIST '|totalDegree|
                                  (LIST '(|NonNegativeInteger|)
                                        (|devaluate| |#3|))))
            (QSETREFV % 13
                      (CONS
                       (|dispatchFunction| |NGROEB;virtualDegree;DpolNni;2|)
                       %)))
           ('T
            (QSETREFV % 13
                      (CONS
                       (|dispatchFunction| |NGROEB;virtualDegree;DpolNni;3|)
                       %))))
          (COND
           ((|HasSignature| |#3|
                            (LIST '|primitivePart|
                                  (LIST (|devaluate| |#3|)
                                        (|devaluate| |#3|))))
            (QSETREFV % 27
                      (CONS (|dispatchFunction| |NGROEB;hMonic;2Dpol;12|) %)))
           ('T
            (QSETREFV % 27
                      (CONS (|dispatchFunction| |NGROEB;hMonic;2Dpol;13|) %))))
          %))) 

(DEFUN |NGroebnerPackage| (&REST #1=#:G134)
  (SPROG NIL
         (PROG (#2=#:G135)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NGroebnerPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NGroebnerPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NGroebnerPackage|)))))))))) 

(MAKEPROP '|NGroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (0 . |lcmCoef|) (|NonNegativeInteger|) (6 . |totalDegree|)
              (11 . |virtualDegree|) (|Boolean|) (16 . <) (22 . |degree|)
              (27 . |sup|) (|Union| % '"failed") (33 . |subtractIfCan|)
              (39 . |1|) (43 . |1|) (47 . |monomial|) (53 . >)
              (|Mapping| 14 8 8) (|List| 8) (59 . |sort|) (65 . |hMonic|)
              (|Record| (|:| |lcmfij| 7) (|:| |totdeg| 11) (|:| |poli| 8)
                        (|:| |polj| 8))
              (|Mapping| 14 28 28) (|List| 28) (70 . |sort|)
              |NGROEB;sPol;RDpol;9| |NGROEB;redPol;DpolLDpol;11| (76 . |0|)
              (80 . |0|) (84 . |0|) (88 . =) (94 . =) (100 . |concat|)
              |NGROEB;groebner;2L;8| (106 . *) (112 . |leadingCoefficient|)
              (117 . *) (123 . -) (|String|) (|OutputForm|) (129 . |message|)
              (|Void|) (134 . |print|) (139 . |coerce|) (|Union| 7 '"failed")
              (144 . |coerce|) (149 . |coerce|) (154 . *)
              (160 . |primitivePart|) (165 . |reductum|) (170 . ~=) (176 . +))
           '#(|virtualDegree| 182 |sPol| 187 |redPol| 192 |hMonic| 198
              |groebner| 203)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|groebner| ((|List| |#3|) (|List| |#3|))) T)
                              '((|redPol| (|#3| |#3| (|List| |#3|))) T)
                              '((|hMonic| (|#3| |#3|)) T)
                              '((|virtualDegree| ((|NonNegativeInteger|) |#3|))
                                T)
                              '((|sPol|
                                 (|#3|
                                  (|Record| (|:| |lcmfij| |#2|)
                                            (|:| |totdeg|
                                                 (|NonNegativeInteger|))
                                            (|:| |poli| |#3|)
                                            (|:| |polj| |#3|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 58
                                            '(2 6 9 0 0 10 1 8 11 0 12 1 0 11 8
                                              13 2 7 14 0 0 15 1 8 7 0 16 2 7 0
                                              0 0 17 2 7 18 0 0 19 0 6 0 20 0 8
                                              0 21 2 8 0 6 7 22 2 7 14 0 0 23 2
                                              25 0 24 0 26 1 0 8 8 27 2 30 0 29
                                              0 31 0 6 0 34 0 7 0 35 0 8 0 36 2
                                              8 14 0 0 37 2 7 14 0 0 38 2 25 0
                                              0 8 39 2 8 0 0 0 41 1 8 6 0 42 2
                                              8 0 6 0 43 2 8 0 0 0 44 1 46 0 45
                                              47 1 46 48 0 49 1 7 46 0 50 1 51
                                              46 0 52 1 8 46 0 53 2 6 0 0 0 54
                                              1 8 0 0 55 1 8 0 0 56 2 8 14 0 0
                                              57 2 8 0 0 0 58 1 0 11 8 13 1 0 8
                                              28 32 2 0 8 8 25 33 1 0 8 8 27 1
                                              0 25 25 40)))))
           '|lookupComplete|)) 
