
(SDEFUN |INFSP;numeric| ((|r| (K)) (% (F)))
        (SPROG ((|gr| (|Complex| (|Integer|))))
               (SEQ
                (COND
                 ((|domainEqual| (QREFELT % 6) (|Integer|))
                  (COND
                   ((|domainEqual| (QREFELT % 7) (|Float|))
                    (SPADCALL |r| (QREFELT % 11)))
                   ((|domainEqual| (QREFELT % 7) (|Fraction| (|Integer|)))
                    (SPADCALL |r| (QREFELT % 13)))
                   ((|domainEqual| (QREFELT % 7) (|Complex| (|Float|)))
                    (SPADCALL |r| (QREFELT % 15)))
                   ((|domainEqual| (QREFELT % 7)
                                   (|Complex| (|Fraction| (|Integer|))))
                    (SPADCALL |r| (QREFELT % 17)))))
                 ((|domainEqual| (QREFELT % 6) (|Complex| (|Integer|)))
                  (SEQ (LETT |gr| |r|)
                       (EXIT
                        (COND
                         ((|domainEqual| (QREFELT % 7)
                                         (|Complex| (|Fraction| (|Integer|))))
                          (SPADCALL
                           (SPADCALL (SPADCALL |gr| (QREFELT % 19))
                                     (QREFELT % 13))
                           (SPADCALL (SPADCALL |gr| (QREFELT % 20))
                                     (QREFELT % 13))
                           (QREFELT % 21)))
                         ((|domainEqual| (QREFELT % 7) (|Complex| (|Float|)))
                          (SPADCALL |gr| (QREFELT % 22)))))))
                 ('T (|error| "case not handled")))))) 

(SDEFUN |INFSP;makeEq;LLL;2|
        ((|nres| (|List| F)) (|lv| (|List| (|Symbol|)))
         (% (|List| (|Equation| (|Polynomial| F)))))
        (SPROG
         ((#1=#:G15 NIL) (|r| NIL) (#2=#:G17 NIL) (|x| NIL) (#3=#:G16 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |r| NIL) (LETT #2# |nres|) (LETT |x| NIL) (LETT #3# |lv|)
                G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL) (ATOM #2#)
                      (PROGN (LETT |r| (CAR #2#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #1#
                        (CONS
                         (SPADCALL (SPADCALL |x| (QREFELT % 25))
                                   (SPADCALL |r| (QREFELT % 26))
                                   (QREFELT % 28))
                         #1#))))
                (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#)))) (GO G190)
                G191 (EXIT (NREVERSE #1#))))))) 

(SDEFUN |INFSP;evaluate|
        ((|pol| (|Polynomial| K)) (|xvar| (|Symbol|)) (|zvar| (|Symbol|))
         (|z| (F)) (% (F)))
        (SPROG
         ((|rpp| (|Polynomial| F))
          (|upol| (|SparseUnivariatePolynomial| (|Polynomial| F))))
         (SEQ
          (LETT |rpp|
                (SPADCALL (CONS (|function| |INFSP;numeric|) %) |pol|
                          (QREFELT % 36)))
          (LETT |rpp| (SPADCALL |rpp| |zvar| |z| (QREFELT % 37)))
          (LETT |upol| (SPADCALL |rpp| |xvar| (QREFELT % 39)))
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |upol| 0 (QREFELT % 44)) (QREFELT % 45))
             (QREFELT % 46))
            (SPADCALL (SPADCALL |upol| (QREFELT % 47)) (QREFELT % 46))
            (QREFELT % 48)))))) 

(SDEFUN |INFSP;myConvert| ((|eps| (|Par|)) (% (|Fraction| (|Integer|))))
        (COND ((|domainEqual| (QREFELT % 8) (|Fraction| (|Integer|))) |eps|)
              ((|domainEqual| (QREFELT % 8) (|Float|))
               (SPADCALL |eps| (QREFELT % 49))))) 

(SDEFUN |INFSP;innerSolve1;PParL;5|
        ((|pol| (|Polynomial| K)) (|eps| (|Par|)) (% (|List| F)))
        (SPADCALL (SPADCALL |pol| (QREFELT % 51)) |eps| (QREFELT % 52))) 

(SDEFUN |INFSP;innerSolve1;SupParL;6|
        ((|upol| (|SparseUnivariatePolynomial| K)) (|eps| (|Par|))
         (% (|List| F)))
        (SPROG
         ((#1=#:G35 NIL) (#2=#:G36 NIL)
          (|z|
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#3=#:G37 NIL) (|x| NIL) (#4=#:G38 NIL))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT % 6) (|Complex| (|Integer|)))
            (COND
             ((OR (|domainEqual| (QREFELT % 8) (|Fraction| (|Integer|)))
                  (|domainEqual| (QREFELT % 8) (|Float|)))
              (EXIT (SPADCALL |upol| |eps| (QREFELT % 56)))))))
          (EXIT
           (COND
            ((|domainEqual| (QREFELT % 6) (|Integer|))
             (COND
              ((|domainEqual| (QREFELT % 7) (|Float|))
               (SEQ
                (LETT |z|
                      (SPADCALL |upol| (|INFSP;myConvert| |eps| %)
                                (QREFELT % 61)))
                (EXIT
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |x| NIL) (LETT #2# |z|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 2 (QREFELT % 63))
                                           (SPADCALL (QCAR |x|) (QCDR |x|)
                                                     (QREFELT % 64))
                                           (QREFELT % 65))
                                 (QREFELT % 66))
                                #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#)))))))
              ((|domainEqual| (QREFELT % 7) (|Fraction| (|Integer|)))
               (SEQ
                (LETT |z|
                      (SPADCALL |upol| (|INFSP;myConvert| |eps| %)
                                (QREFELT % 61)))
                (EXIT
                 (PROGN
                  (LETT #3# NIL)
                  (SEQ (LETT |x| NIL) (LETT #4# |z|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SPADCALL (SPADCALL 1 2 (QREFELT % 63))
                                          (SPADCALL (QCAR |x|) (QCDR |x|)
                                                    (QREFELT % 67))
                                          (QREFELT % 68))
                                #3#))))
                       (LETT #4# (CDR #4#)) (GO G190) G191
                       (EXIT (NREVERSE #3#)))))))
              (#5='T (|error| "improper arguments to INFSP"))))
            (#5# (|error| "improper arguments to INFSP"))))))) 

(SDEFUN |INFSP;K_to_CI| ((|x| (K)) (% (|Complex| (|Interval| (|Float|)))))
        (COND
         ((|domainEqual| (QREFELT % 6) (|Integer|))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 70))
                    (|spadConstant| % 71) (QREFELT % 73)))
         ((|domainEqual| (QREFELT % 6) (|Complex| (|Integer|)))
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 13))
                     (QREFELT % 70))
           (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 13))
                     (QREFELT % 70))
           (QREFELT % 73)))
         ('T (|error| "improper arguments to INFSP")))) 

(SDEFUN |INFSP;F_to_CI| ((|x| (F)) (% (|Complex| (|Interval| (|Float|)))))
        (COND
         ((|domainEqual| (QREFELT % 7) (|Float|))
          (SPADCALL (SPADCALL |x| (QREFELT % 74)) (|spadConstant| % 71)
                    (QREFELT % 73)))
         ((|domainEqual| (QREFELT % 7) (|Fraction| (|Integer|)))
          (SPADCALL (SPADCALL |x| (QREFELT % 70)) (|spadConstant| % 71)
                    (QREFELT % 73)))
         ((|domainEqual| (QREFELT % 7) (|Complex| (|Float|)))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 75)) (QREFELT % 74))
                    (SPADCALL (SPADCALL |x| (QREFELT % 76)) (QREFELT % 74))
                    (QREFELT % 73)))
         ((|domainEqual| (QREFELT % 7) (|Complex| (|Fraction| (|Integer|))))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 77)) (QREFELT % 70))
                    (SPADCALL (SPADCALL |x| (QREFELT % 78)) (QREFELT % 70))
                    (QREFELT % 73)))
         ('T (|error| "improper arguments to INFSP")))) 

(SDEFUN |INFSP;F_to_CI1|
        ((|x| (F)) (|eps| (|Float|)) (% (|Complex| (|Interval| (|Float|)))))
        (SPROG
         ((|fuzz1| (|Interval| (|Float|)))
          (|fuzz| (|Complex| (|Interval| (|Float|)))))
         (SEQ
          (LETT |fuzz1|
                (SPADCALL (SPADCALL |eps| (QREFELT % 79)) |eps|
                          (QREFELT % 80)))
          (LETT |fuzz|
                (COND
                 ((OR (|domainEqual| (QREFELT % 7) (|Float|))
                      (|domainEqual| (QREFELT % 7) (|Fraction| (|Integer|))))
                  (SPADCALL |fuzz1| (|spadConstant| % 71) (QREFELT % 73)))
                 ((OR (|domainEqual| (QREFELT % 7) (|Complex| (|Float|)))
                      (|domainEqual| (QREFELT % 7)
                                     (|Complex| (|Fraction| (|Integer|)))))
                  (SPADCALL |fuzz1| |fuzz1| (QREFELT % 73)))
                 ('T (|error| "improper arguments to INFSP"))))
          (EXIT (SPADCALL (|INFSP;F_to_CI| |x| %) |fuzz| (QREFELT % 81)))))) 

(SDEFUN |INFSP;iF_to_Float| ((|x| (|Interval| (|Float|))) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 82)) (SPADCALL |x| (QREFELT % 83))
                   (QREFELT % 84))
         2 (QREFELT % 85))) 

(SDEFUN |INFSP;iF_to_RN|
        ((|x| (|Interval| (|Float|))) (% (|Fraction| (|Integer|))))
        (SPROG
         ((|fx| (|Float|)) (|mx| (|Integer|)) (|ex| (|Integer|))
          (|bx| (|PositiveInteger|)))
         (SEQ (LETT |fx| (|INFSP;iF_to_Float| |x| %))
              (LETT |mx| (SPADCALL |fx| (QREFELT % 86)))
              (LETT |ex| (SPADCALL |fx| (QREFELT % 87)))
              (LETT |bx| (SPADCALL (QREFELT % 89)))
              (EXIT
               (SPADCALL |mx|
                         (SPADCALL (SPADCALL |bx| (QREFELT % 13)) |ex|
                                   (QREFELT % 90))
                         (QREFELT % 91)))))) 

(SDEFUN |INFSP;CI_to_F| ((|x| (|Complex| (|Interval| (|Float|)))) (% (F)))
        (SPROG ((|rx| (|Interval| (|Float|))) (|ix| (|Interval| (|Float|))))
               (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 92)))
                    (LETT |ix| (SPADCALL |x| (QREFELT % 93)))
                    (EXIT
                     (COND
                      ((|domainEqual| (QREFELT % 7) (|Float|))
                       (|INFSP;iF_to_Float| |rx| %))
                      ((|domainEqual| (QREFELT % 7) (|Complex| (|Float|)))
                       (SPADCALL (|INFSP;iF_to_Float| |rx| %)
                                 (|INFSP;iF_to_Float| |ix| %) (QREFELT % 94)))
                      ((|domainEqual| (QREFELT % 7) (|Fraction| (|Integer|)))
                       (|INFSP;iF_to_RN| |rx| %))
                      ((|domainEqual| (QREFELT % 7)
                                      (|Complex| (|Fraction| (|Integer|))))
                       (SPADCALL (|INFSP;iF_to_RN| |rx| %)
                                 (|INFSP;iF_to_RN| |ix| %) (QREFELT % 21)))
                      ('T (|error| "improper arguments to INFSP"))))))) 

(SDEFUN |INFSP;ieval0|
        ((|pol| (|Polynomial| K)) (|xvar| (|Symbol|)) (|zvar| (|Symbol|))
         (|z| (|Complex| (|Interval| (|Float|))))
         (% (|Union| (|Complex| (|Interval| (|Float|))) "failed")))
        (SPROG
         ((|rpp| (|Polynomial| (|Complex| (|Interval| (|Float|)))))
          (|upol|
           (|SparseUnivariatePolynomial|
            (|Polynomial| (|Complex| (|Interval| (|Float|))))))
          (|iden| (|Union| (|Complex| (|Interval| (|Float|))) "failed")))
         (SEQ
          (LETT |rpp|
                (SPADCALL (CONS (|function| |INFSP;K_to_CI|) %) |pol|
                          (QREFELT % 98)))
          (LETT |rpp| (SPADCALL |rpp| |zvar| |z| (QREFELT % 99)))
          (LETT |upol| (SPADCALL |rpp| |xvar| (QREFELT % 100)))
          (LETT |iden|
                (SPADCALL
                 (SPADCALL (SPADCALL |upol| (QREFELT % 102)) (QREFELT % 103))
                 (QREFELT % 105)))
          (EXIT
           (COND ((QEQCAR |iden| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |upol| 0 (QREFELT % 106))
                                    (QREFELT % 107))
                          (QREFELT % 103))
                         (QCDR |iden|) (QREFELT % 108))))))))) 

(SDEFUN |INFSP;ieval|
        ((|pol| (|Polynomial| K)) (|xvar| (|Symbol|)) (|zvar| (|Symbol|))
         (|z| (F)) (|eps| (|Float|))
         (% (|Union| (|Complex| (|Interval| (|Float|))) "failed")))
        (SPROG ((|nz| (|Complex| (|Interval| (|Float|)))))
               (SEQ (LETT |nz| (|INFSP;F_to_CI1| |z| |eps| %))
                    (EXIT (|INFSP;ieval0| |pol| |xvar| |zvar| |nz| %))))) 

(SDEFUN |INFSP;findGenZeros|
        ((|lp| (|List| (|Polynomial| K))) (|rlvar| (|List| (|Symbol|)))
         (|eps| (|Par|)) (% (|List| (|List| F))))
        (SPROG
         ((|f| (|Polynomial| K)) (|zvar| (|Symbol|))
          (|rlp| (|List| (|Polynomial| K))) (|feps| (|Float|))
          (|obits| (|PositiveInteger|)) (|neps| (|Par|)) (|nfeps| (|Float|))
          (|lz| (|List| F)) (|z| NIL) (#1=#:G82 NIL) (|xvar| NIL)
          (#2=#:G84 NIL) (|pol| NIL) (#3=#:G83 NIL)
          (|pp| (|Union| (|Complex| (|Interval| (|Float|))) "failed"))
          (|ppi| (|Complex| (|Interval| (|Float|)))) (|ok| (|Boolean|))
          (#4=#:G80 NIL) (|sol1| (|List| F)) (|sol| (|List| (|List| F)))
          (#5=#:G81 NIL) (|etol| (|Integer|)) (|ebits| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |rlp| (REVERSE |lp|)) (LETT |f| (|SPADfirst| |rlp|))
                (LETT |zvar| (|SPADfirst| |rlvar|)) (LETT |rlp| (CDR |rlp|))
                (LETT |etol| 10000)
                (LETT |feps|
                      (COND ((|domainEqual| (QREFELT % 8) (|Float|)) |eps|)
                            ((|domainEqual| (QREFELT % 8)
                                            (|Fraction| (|Integer|)))
                             (SPADCALL |eps| (QREFELT % 109)))))
                (LETT |neps|
                      (SPADCALL (SPADCALL 1 4 (QREFELT % 63)) |eps|
                                (QREFELT % 112)))
                (LETT |nfeps|
                      (LETT |feps|
                            (SPADCALL (SPADCALL 1 4 (QREFELT % 63)) |feps|
                                      (QREFELT % 114))))
                (LETT |obits| (SPADCALL (QREFELT % 115))) (LETT |ebits| 100)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (SPADCALL (+ |obits| |ebits|) (QREFELT % 116))
                           (LETT |neps|
                                 (SPADCALL (SPADCALL 1 |etol| (QREFELT % 63))
                                           |neps| (QREFELT % 112)))
                           (LETT |nfeps|
                                 (SPADCALL (SPADCALL 1 |etol| (QREFELT % 63))
                                           |nfeps| (QREFELT % 114)))
                           (LETT |lz| (SPADCALL |f| |neps| (QREFELT % 53)))
                           (LETT |ok| 'T) (LETT |sol| NIL)
                           (SEQ (LETT |z| NIL) (LETT #1# |lz|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |z| (CAR #1#)) NIL)
                                      (NULL |ok|))
                                  (GO G191)))
                                (SEQ
                                 (LETT |sol1|
                                       (LIST
                                        (|INFSP;CI_to_F|
                                         (|INFSP;F_to_CI1| |z| |feps| %) %)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |xvar| NIL)
                                        (LETT #2# (CDR |rlvar|))
                                        (LETT |pol| NIL) (LETT #3# |rlp|) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |pol| (CAR #3#))
                                               NIL)
                                              (ATOM #2#)
                                              (PROGN
                                               (LETT |xvar| (CAR #2#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |pp|
                                               (|INFSP;ieval| |pol| |xvar|
                                                |zvar| |z| |nfeps| %))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |pp| 1)
                                            (SEQ (LETT |ok| NIL)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #4# |$NoValue|)
                                                   (GO #6=#:G71)))))
                                           ('T
                                            (SEQ (LETT |ppi| (QCDR |pp|))
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |ppi|
                                                               (QREFELT % 92))
                                                     (QREFELT % 117))
                                                    |feps| (QREFELT % 119))
                                                   (EXIT
                                                    (SEQ (LETT |ok| NIL)
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #4#
                                                                 |$NoValue|)
                                                           (GO #6#))))))
                                                  ((SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |ppi|
                                                               (QREFELT % 93))
                                                     (QREFELT % 117))
                                                    |feps| (QREFELT % 119))
                                                   (EXIT
                                                    (SEQ (LETT |ok| NIL)
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #4# 1)
                                                           (GO #6#)))))))
                                                 (EXIT
                                                  (LETT |sol1|
                                                        (CONS
                                                         (|INFSP;CI_to_F| |ppi|
                                                          %)
                                                         |sol1|))))))))
                                        (LETT #3#
                                              (PROG1 (CDR #3#)
                                                (LETT #2# (CDR #2#))))
                                        (GO G190) G191 (EXIT NIL)))
                                  #6# (EXIT #4#))
                                 (EXIT (LETT |sol| (CONS |sol1| |sol|))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ (SPADCALL |obits| (QREFELT % 116))
                                   (EXIT
                                    (PROGN
                                     (LETT #5# (REVERSE |sol|))
                                     (GO #7=#:G79)))))
                             ('T
                              (SEQ (LETT |etol| (EXPT |etol| 2))
                                   (EXIT (LETT |ebits| (* 2 |ebits|))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |INFSP;oldCoord|
        ((|numres| (|List| F)) (|lval| (|List| (|Integer|))) (% (|List| F)))
        (SPROG
         ((|rnumres| (|List| F)) (|nr| NIL) (#1=#:G91 NIL) (|n| NIL)
          (#2=#:G90 NIL) (#3=#:G87 (F)) (#4=#:G85 (F)) (#5=#:G86 NIL))
         (SEQ (LETT |rnumres| (REVERSE |numres|))
              (SPADCALL |rnumres| '|first|
                        (SPADCALL (|SPADfirst| |rnumres|)
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |nr| NIL)
                                        (LETT #1# (CDR |rnumres|))
                                        (LETT |n| NIL) (LETT #2# |lval|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |n| (CAR #2#)) NIL)
                                              (ATOM #1#)
                                              (PROGN
                                               (LETT |nr| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #3#
                                                 (SPADCALL |n| |nr|
                                                           (QREFELT % 120)))
                                           (COND
                                            (#5#
                                             (LETT #4#
                                                   (SPADCALL #4# #3#
                                                             (QREFELT % 67))))
                                            ('T
                                             (PROGN
                                              (LETT #4# #3#)
                                              (LETT #5# 'T)))))))
                                        (LETT #2#
                                              (PROG1 (CDR #2#)
                                                (LETT #1# (CDR #1#))))
                                        (GO G190) G191 (EXIT NIL))
                                   (COND (#5# #4#) ('T (|spadConstant| % 41))))
                                  (QREFELT % 67))
                        (QREFELT % 122))
              (EXIT (REVERSE |rnumres|))))) 

(SDEFUN |INFSP;innerSolve2|
        ((|lp| (|List| (|Polynomial| K))) (|lv| (|List| (|Symbol|)))
         (|eps| (|Par|)) (% (|List| (|List| F))))
        (SPROG
         ((|mainvar| (|Symbol|))
          (|up1| #1=(|SparseUnivariatePolynomial| (|Polynomial| K)))
          (|up2| #1#)
          (|vec|
           (|PrimitiveArray| (|SparseUnivariatePolynomial| (|Polynomial| K))))
          (|p0| (|Polynomial| K)) (|p1| (|Polynomial| K)))
         (SEQ (LETT |mainvar| (|SPADfirst| |lv|))
              (LETT |up1|
                    (SPADCALL (SPADCALL |lp| 1 (QREFELT % 124)) |mainvar|
                              (QREFELT % 125)))
              (LETT |up2|
                    (SPADCALL (SPADCALL |lp| 2 (QREFELT % 124)) |mainvar|
                              (QREFELT % 125)))
              (LETT |vec| (SPADCALL |up1| |up2| (QREFELT % 129)))
              (LETT |p0|
                    (SPADCALL
                     (SPADCALL (QAREF1 |vec| 0) |mainvar| (QREFELT % 130))
                     (QREFELT % 131)))
              (LETT |p1|
                    (SPADCALL
                     (SPADCALL (QAREF1 |vec| 1) |mainvar| (QREFELT % 130))
                     |mainvar| (QREFELT % 132)))
              (COND
               ((OR (SPADCALL |p1| (QREFELT % 133))
                    (SPADCALL
                     (SPADCALL |p0|
                               (SPADCALL
                                (SPADCALL |p1| |mainvar| (QREFELT % 125))
                                (QREFELT % 137))
                               (QREFELT % 138))
                     (|spadConstant| % 139) (QREFELT % 140)))
                (EXIT
                 (SPADCALL (CONS (|spadConstant| % 134) |lp|) NIL |lv| |eps|
                           (QREFELT % 136)))))
              (EXIT
               (|INFSP;findGenZeros| (LIST |p1| |p0|) (REVERSE |lv|) |eps|
                %))))) 

(SDEFUN |INFSP;innerSolve;2LLParL;18|
        ((|lp| (|List| (|Polynomial| K))) (|ld| (|List| (|Polynomial| K)))
         (|lv| (|List| (|Symbol|))) (|eps| (|Par|)) (% (|List| (|List| F))))
        (SPROG
         ((#1=#:G248 NIL) (|p| NIL) (#2=#:G249 NIL)
          (|lnp| (|List| (|DistributedMultivariatePolynomial| |lv| K)))
          (OV
           (|Join| (|OrderedSet|) (|Finite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|))) (|Hashable|)
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| % "failed") (|Symbol|))))))
          (#3=#:G250 NIL) (|vv| NIL) (#4=#:G251 NIL) (#5=#:G100 NIL)
          (|lvv| (|List| OV))
          (|dmp|
           (|Join|
            (|PolynomialCategory| K
                                  (|DirectProduct| (|#| |lv|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lv|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| (% % (|List| (|Integer|)))))))
          (#6=#:G252 NIL) (|q1| NIL) (#7=#:G253 NIL) (|lq| (|List| |dmp|))
          (|gb|
           (CATEGORY |package|
            (SIGNATURE |credPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |redPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |gbasis|
             ((|List| |dmp|) (|List| |dmp|) (|Integer|) (|Integer|)))
            (SIGNATURE |gbasisExtend|
             ((|List| |dmp|) (|List| |dmp|) (|List| |dmp|) (|Integer|)
              (|Integer|)))
            (SIGNATURE |critT|
             ((|Boolean|)
              (|Record|
               (|:| |lcmfij|
                    #8=(|DirectProduct| (|call| LENGTH |lv|)
                                        (|NonNegativeInteger|)))
               (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |dmp|)
               (|:| |polj| |dmp|))))
            (SIGNATURE |critM| ((|Boolean|) #8# #8#))
            (SIGNATURE |critB| ((|Boolean|) #8# #8# #8# #8#))
            (SIGNATURE |critBonD|
             ((|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              |dmp|
              (|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMTonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              #8#
              (|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |redPo|
             ((|Record| (|:| |poly| |dmp|) (|:| |mult| K)) |dmp|
              (|List| |dmp|)))
            (SIGNATURE |hMonic| (|dmp| |dmp|))
            (SIGNATURE |updatF|
             ((|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))
              |dmp| (|NonNegativeInteger|)
              (|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))))
            (SIGNATURE |sPol|
             (|dmp|
              (|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |updatD|
             ((|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #8#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |minGbasis| ((|List| |dmp|) (|List| |dmp|)))
            (SIGNATURE |lepol| ((|Integer|) |dmp|))
            (SIGNATURE |prinshINFO| ((|Void|) |dmp|))
            (SIGNATURE |prindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |fprindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |prinpolINFO| ((|Void|) (|List| |dmp|)))
            (SIGNATURE |prinb| ((|Void|) (|Integer|)))
            (SIGNATURE |critpOrder|
             ((|Boolean|)
              (|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |makeCrit|
             ((|Record| (|:| |lcmfij| #8#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |pol| |dmp|))
              |dmp| (|NonNegativeInteger|)))
            (SIGNATURE |virtualDegree| ((|NonNegativeInteger|) |dmp|))))
          (#9=#:G254 NIL) (#10=#:G255 NIL) (|fq| NIL) (#11=#:G256 NIL)
          (#12=#:G109 #13=(|Boolean|)) (#14=#:G107 #13#) (#15=#:G108 NIL)
          (|rlv| (|List| (|Symbol|))) (|rrlvv| (|List| OV)) (#16=#:G257 NIL)
          (|res1| (|List| (|DistributedMultivariatePolynomial| |lv| K)))
          (|f| NIL) (#17=#:G258 NIL) (#18=#:G0 NIL) (#19=#:G259 NIL)
          (#20=#:G206 #21=(|NonNegativeInteger|)) (#22=#:G204 #21#)
          (#23=#:G205 NIL) (#24=#:G116 #25=(|Boolean|)) (#26=#:G114 #25#)
          (#27=#:G115 NIL) (|listGen| (|List| (|List| |dmp|))) (#28=#:G247 NIL)
          (#29=#:G260 NIL) (|pr| NIL) (#30=#:G261 NIL) (#31=#:G262 NIL)
          (#32=#:G263 NIL) (|listG| (|List| (|List| (|Polynomial| K))))
          (|res| NIL) (#33=#:G264 NIL) (#34=#:G215 #35=(|List| (|List| F)))
          (#36=#:G213 #35#) (#37=#:G214 NIL) (#38=#:G265 NIL)
          (|partRes|
           (|List| (|List| (|DistributedMultivariatePolynomial| |lv| K))))
          (|gres| NIL) (#39=#:G266 NIL)
          (|genRecord|
           (|Record|
            (|:| |dpolys|
                 #40=(|List| (|DistributedMultivariatePolynomial| |lv| K)))
            (|:| |coords| #41=(|List| (|Integer|)))))
          (|lgen| #40#) (|lval| #41#) (#42=#:G267 NIL) (|i| NIL)
          (#43=#:G268 NIL) (|laval| (|List| (|Integer|))) (|lnorm| (|Integer|))
          (|neps| (|Par|)) (#44=#:G269 NIL) (|pf| NIL) (#45=#:G270 NIL)
          (|lgen1| (|List| (|Polynomial| K))) (|lris| #35#) (#46=#:G271 NIL)
          (|r| NIL) (#47=#:G272 NIL) (|result| (|List| (|List| F))))
         (SEQ
          (LETT |lnp|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL |p|
                                         (|compiledLookupCheck| '|pToDmp|
                                                                (LIST
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lv|
                                                                  (|devaluate|
                                                                   (ELT % 6)))
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT % 6))))
                                                                (|PolToPol|
                                                                 |lv|
                                                                 (ELT % 6))))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT OV (|OrderedVariableList| |lv|))
          (LETT |lvv|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |vv| NIL) (LETT #4# |lv|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |vv| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |vv|
                                                   (|compiledLookupCheck|
                                                    '|variable|
                                                    (LIST
                                                     (LIST '|Union| '%
                                                           '#48="failed")
                                                     (LIST '|Symbol|))
                                                    OV)))
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0) OV
                                                 (|Union| OV #48#) #5#))
                               #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |dmp| (|DistributedMultivariatePolynomial| |lv| (QREFELT % 6)))
          (LETT |lq| NIL)
          (COND
           ((SPADCALL |ld| NIL (QREFELT % 141))
            (LETT |lq|
                  (PROGN
                   (LETT #6# NIL)
                   (SEQ (LETT |q1| NIL) (LETT #7# |ld|) G190
                        (COND
                         ((OR (ATOM #7#) (PROGN (LETT |q1| (CAR #7#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #6#
                                (CONS
                                 (SPADCALL |q1|
                                           (|compiledLookupCheck| '|pToDmp|
                                                                  (LIST
                                                                   (LIST
                                                                    '|DistributedMultivariatePolynomial|
                                                                    |lv|
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6)))
                                                                   (LIST
                                                                    '|Polynomial|
                                                                    (|devaluate|
                                                                     (ELT %
                                                                          6))))
                                                                  (|PolToPol|
                                                                   |lv|
                                                                   (ELT % 6))))
                                 #6#))))
                        (LETT #7# (CDR #7#)) (GO G190) G191
                        (EXIT (NREVERSE #6#)))))))
          (LETT |partRes|
                (SPADCALL |lnp| |lvv|
                          (|compiledLookupCheck| '|groebSolve|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|List|
                                                              (LIST
                                                               '|DistributedMultivariatePolynomial|
                                                               |lv|
                                                               (|devaluate|
                                                                (ELT % 6)))))
                                                  (LIST '|List|
                                                        (LIST
                                                         '|DistributedMultivariatePolynomial|
                                                         |lv|
                                                         (|devaluate|
                                                          (ELT % 6))))
                                                  (LIST '|List|
                                                        (LIST
                                                         '|OrderedVariableList|
                                                         |lv|)))
                                                 (|GroebnerSolve| |lv|
                                                                  (ELT % 6)
                                                                  (ELT % 6)))))
          (EXIT
           (COND
            ((SPADCALL |partRes|
                       (SPADCALL NIL
                                 (|compiledLookupCheck| '|list|
                                                        (LIST '%
                                                              (LIST '|List|
                                                                    (LIST
                                                                     '|DistributedMultivariatePolynomial|
                                                                     |lv|
                                                                     (|devaluate|
                                                                      (ELT %
                                                                           6)))))
                                                        (|List|
                                                         (|List|
                                                          (|DistributedMultivariatePolynomial|
                                                           |lv| (ELT % 6))))))
                       (|compiledLookupCheck| '= (LIST (LIST '|Boolean|) '% '%)
                                              (|List|
                                               (|List|
                                                (|DistributedMultivariatePolynomial|
                                                 |lv| (ELT % 6))))))
             NIL)
            (#49='T
             (SEQ
              (COND
               ((SPADCALL |lq| NIL
                          (|compiledLookupCheck| '~=
                                                 (LIST (LIST '|Boolean|) '% '%)
                                                 (|List| |dmp|)))
                (SEQ
                 (LETT |gb|
                       (|GroebnerInternalPackage| (QREFELT % 6)
                                                  (|DirectProduct|
                                                   (LENGTH |lv|)
                                                   (|NonNegativeInteger|))
                                                  |dmp|))
                 (EXIT
                  (LETT |partRes|
                        (PROGN
                         (LETT #9# NIL)
                         (SEQ (LETT |pr| NIL) (LETT #10# |partRes|) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |pr| (CAR #10#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((PROGN
                                   (LETT #15# NIL)
                                   (SEQ (LETT |fq| NIL) (LETT #11# |lq|) G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |fq| (CAR #11#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #12#
                                                 (SPADCALL
                                                  (SPADCALL |fq| |pr|
                                                            (|compiledLookupCheck|
                                                             '|redPol|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |dmp|)))
                                                             |gb|))
                                                  (SPADCALL
                                                   (|compiledLookupCheck| '|0|
                                                                          (LIST
                                                                           '%)
                                                                          (|DistributedMultivariatePolynomial|
                                                                           |lv|
                                                                           (ELT
                                                                            %
                                                                            6))))
                                                  (|compiledLookupCheck| '~=
                                                                         (LIST
                                                                          (LIST
                                                                           '|Boolean|)
                                                                          '%
                                                                          '%)
                                                                         (|DistributedMultivariatePolynomial|
                                                                          |lv|
                                                                          (ELT
                                                                           %
                                                                           6)))))
                                           (COND
                                            (#15#
                                             (LETT #14#
                                                   (COND (#14# #12#)
                                                         ('T NIL))))
                                            ('T
                                             (PROGN
                                              (LETT #14# #12#)
                                              (LETT #15# 'T)))))))
                                        (LETT #11# (CDR #11#)) (GO G190) G191
                                        (EXIT NIL))
                                   (COND (#15# #14#) (#49# 'T)))
                                  (LETT #9# (CONS |pr| #9#))))))
                              (LETT #10# (CDR #10#)) (GO G190) G191
                              (EXIT (NREVERSE #9#)))))))))
              (LETT |rlv| (REVERSE |lv|)) (LETT |rrlvv| (CDR (REVERSE |lvv|)))
              (LETT |listGen| NIL)
              (SEQ (LETT |res| NIL) (LETT #16# |partRes|) G190
                   (COND
                    ((OR (ATOM #16#) (PROGN (LETT |res| (CAR #16#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |res1| (CDR (REVERSE |res|)))
                          (EXIT
                           (COND
                            ((PROGN
                              (LETT #27# NIL)
                              (SEQ (LETT |f| NIL) (LETT #17# |res1|) G190
                                   (COND
                                    ((OR (ATOM #17#)
                                         (PROGN (LETT |f| (CAR #17#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #24#
                                            (EQL
                                             (PROGN
                                              (LETT #23# NIL)
                                              (SEQ (LETT #18# NIL)
                                                   (LETT #19#
                                                         (SPADCALL |f| |rrlvv|
                                                                   (|compiledLookupCheck|
                                                                    '|degree|
                                                                    (LIST
                                                                     (LIST
                                                                      '|List|
                                                                      (LIST
                                                                       '|NonNegativeInteger|))
                                                                     '%
                                                                     (LIST
                                                                      '|List|
                                                                      (LIST
                                                                       '|OrderedVariableList|
                                                                       |lv|)))
                                                                    (|DistributedMultivariatePolynomial|
                                                                     |lv|
                                                                     (ELT %
                                                                          6)))))
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #19#)
                                                         (PROGN
                                                          (LETT #18#
                                                                (CAR #19#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #20# #18#)
                                                      (COND
                                                       (#23#
                                                        (LETT #22#
                                                              (MAX #22# #20#)))
                                                       ('T
                                                        (PROGN
                                                         (LETT #22# #20#)
                                                         (LETT #23# 'T)))))))
                                                   (LETT #19# (CDR #19#))
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#23# #22#)
                                                    ('T
                                                     (|IdentityError|
                                                      '|max|))))
                                             1))
                                      (COND
                                       (#27#
                                        (LETT #26#
                                              (COND (#26# #24#) ('T NIL))))
                                       ('T
                                        (PROGN
                                         (LETT #26# #24#)
                                         (LETT #27# 'T)))))))
                                   (LETT #17# (CDR #17#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#27# #26#) ('T 'T)))
                             (PROGN
                              (LETT #28#
                                    (LETT |listGen| (CONS |res| |listGen|)))
                              (GO #50=#:G207)))))))
                    #50# (EXIT #28#))
                   (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))
              (LETT |result| NIL)
              (COND
               ((SPADCALL |listGen| NIL
                          (|compiledLookupCheck| '~=
                                                 (LIST (LIST '|Boolean|) '% '%)
                                                 (|List| (|List| |dmp|))))
                (SEQ
                 (LETT |listG|
                       (PROGN
                        (LETT #29# NIL)
                        (SEQ (LETT |pr| NIL) (LETT #30# |listGen|) G190
                             (COND
                              ((OR (ATOM #30#)
                                   (PROGN (LETT |pr| (CAR #30#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #29#
                                     (CONS
                                      (PROGN
                                       (LETT #31# NIL)
                                       (SEQ (LETT |pf| NIL) (LETT #32# |pr|)
                                            G190
                                            (COND
                                             ((OR (ATOM #32#)
                                                  (PROGN
                                                   (LETT |pf| (CAR #32#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #31#
                                                    (CONS
                                                     (SPADCALL |pf|
                                                               (|compiledLookupCheck|
                                                                '|dmpToP|
                                                                (LIST
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT % 6)))
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lv|
                                                                  (|devaluate|
                                                                   (ELT % 6))))
                                                                (|PolToPol|
                                                                 |lv|
                                                                 (ELT % 6))))
                                                     #31#))))
                                            (LETT #32# (CDR #32#)) (GO G190)
                                            G191 (EXIT (NREVERSE #31#))))
                                      #29#))))
                             (LETT #30# (CDR #30#)) (GO G190) G191
                             (EXIT (NREVERSE #29#)))))
                 (LETT |result|
                       (PROGN
                        (LETT #37# NIL)
                        (SEQ (LETT |res| NIL) (LETT #33# |listG|) G190
                             (COND
                              ((OR (ATOM #33#)
                                   (PROGN (LETT |res| (CAR #33#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #34#
                                      (|INFSP;findGenZeros| |res| |rlv| |eps|
                                       %))
                                (COND
                                 (#37#
                                  (LETT #36#
                                        (SPADCALL #36# #34# (QREFELT % 142))))
                                 ('T
                                  (PROGN (LETT #36# #34#) (LETT #37# 'T)))))))
                             (LETT #33# (CDR #33#)) (GO G190) G191 (EXIT NIL))
                        (COND (#37# #36#) (#49# NIL))))
                 (EXIT
                  (SEQ (LETT |gres| NIL) (LETT #38# |listGen|) G190
                       (COND
                        ((OR (ATOM #38#) (PROGN (LETT |gres| (CAR #38#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |partRes|
                               (SPADCALL |partRes|
                                         (SPADCALL |gres| |partRes|
                                                   (|compiledLookupCheck|
                                                    '|position|
                                                    (LIST (LIST '|Integer|)
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (|devaluate|
                                                                  (ELT % 6))))
                                                          '%)
                                                    (|List|
                                                     (|List|
                                                      (|DistributedMultivariatePolynomial|
                                                       |lv| (ELT % 6))))))
                                         (|compiledLookupCheck| '|delete|
                                                                (LIST '% '%
                                                                      (LIST
                                                                       '|Integer|))
                                                                (|List|
                                                                 (|List|
                                                                  (|DistributedMultivariatePolynomial|
                                                                   |lv|
                                                                   (ELT %
                                                                        6)))))))))
                       (LETT #38# (CDR #38#)) (GO G190) G191 (EXIT NIL))))))
              (SEQ (LETT |gres| NIL) (LETT #39# |partRes|) G190
                   (COND
                    ((OR (ATOM #39#) (PROGN (LETT |gres| (CAR #39#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |genRecord|
                          (SPADCALL |gres| |lvv|
                                    (|compiledLookupCheck| '|genericPosition|
                                                           (LIST
                                                            (LIST '|Record|
                                                                  (LIST '|:|
                                                                        '|dpolys|
                                                                        (LIST
                                                                         '|List|
                                                                         (LIST
                                                                          '|DistributedMultivariatePolynomial|
                                                                          |lv|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            %
                                                                            6)))))
                                                                  (LIST '|:|
                                                                        '|coords|
                                                                        (LIST
                                                                         '|List|
                                                                         (LIST
                                                                          '|Integer|))))
                                                            (LIST '|List|
                                                                  (LIST
                                                                   '|DistributedMultivariatePolynomial|
                                                                   |lv|
                                                                   (|devaluate|
                                                                    (ELT %
                                                                         6))))
                                                            (LIST '|List|
                                                                  (LIST
                                                                   '|OrderedVariableList|
                                                                   |lv|)))
                                                           (|GroebnerSolve|
                                                            |lv| (ELT % 6)
                                                            (ELT % 6)))))
                    (LETT |lgen| (QCAR |genRecord|))
                    (LETT |lval| (QCDR |genRecord|))
                    (LETT |laval|
                          (PROGN
                           (LETT #42# NIL)
                           (SEQ (LETT |i| NIL) (LETT #43# |lval|) G190
                                (COND
                                 ((OR (ATOM #43#)
                                      (PROGN (LETT |i| (CAR #43#)) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #42# (CONS (ABS |i|) #42#))))
                                (LETT #43# (CDR #43#)) (GO G190) G191
                                (EXIT (NREVERSE #42#)))))
                    (LETT |lnorm|
                          (SPADCALL (ELT % 144) |laval| (QREFELT % 147)))
                    (LETT |neps|
                          (SPADCALL (SPADCALL 1 (+ 1 |lnorm|) (QREFELT % 63))
                                    |eps| (QREFELT % 112)))
                    (LETT |lgen1|
                          (PROGN
                           (LETT #44# NIL)
                           (SEQ (LETT |pf| NIL) (LETT #45# |lgen|) G190
                                (COND
                                 ((OR (ATOM #45#)
                                      (PROGN (LETT |pf| (CAR #45#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #44#
                                        (CONS
                                         (SPADCALL |pf|
                                                   (|compiledLookupCheck|
                                                    '|dmpToP|
                                                    (LIST
                                                     (LIST '|Polynomial|
                                                           (|devaluate|
                                                            (ELT % 6)))
                                                     (LIST
                                                      '|DistributedMultivariatePolynomial|
                                                      |lv|
                                                      (|devaluate| (ELT % 6))))
                                                    (|PolToPol| |lv|
                                                                (ELT % 6))))
                                         #44#))))
                                (LETT #45# (CDR #45#)) (GO G190) G191
                                (EXIT (NREVERSE #44#)))))
                    (LETT |lris| (|INFSP;findGenZeros| |lgen1| |rlv| |neps| %))
                    (EXIT
                     (LETT |result|
                           (SPADCALL
                            (PROGN
                             (LETT #46# NIL)
                             (SEQ (LETT |r| NIL) (LETT #47# |lris|) G190
                                  (COND
                                   ((OR (ATOM #47#)
                                        (PROGN (LETT |r| (CAR #47#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #46#
                                          (CONS (|INFSP;oldCoord| |r| |lval| %)
                                                #46#))))
                                  (LETT #47# (CDR #47#)) (GO G190) G191
                                  (EXIT (NREVERSE #46#))))
                            |result| (QREFELT % 142)))))
                   (LETT #39# (CDR #39#)) (GO G190) G191 (EXIT NIL))
              (EXIT |result|)))))))) 

(DECLAIM (NOTINLINE |InnerNumericFloatSolvePackage;|)) 

(DEFUN |InnerNumericFloatSolvePackage;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|InnerNumericFloatSolvePackage| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 150))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InnerNumericFloatSolvePackage|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |InnerNumericFloatSolvePackage| (&REST #1=#:G273)
  (SPROG NIL
         (PROG (#2=#:G274)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerNumericFloatSolvePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerNumericFloatSolvePackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerNumericFloatSolvePackage|)))))))))) 

(MAKEPROP '|InnerNumericFloatSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Integer|) (|Float|) (0 . |coerce|)
              (|Fraction| 9) (5 . |coerce|) (|Complex| 10) (10 . |coerce|)
              (|Complex| 12) (15 . |coerce|) (|Complex| 9) (20 . |real|)
              (25 . |imag|) (30 . |complex|) (36 . |convert|) (|Symbol|)
              (|Polynomial| 7) (41 . |coerce|) (46 . |coerce|) (|Equation| 24)
              (51 . |equation|) (|List| 27) (|List| 7) (|List| 23)
              |INFSP;makeEq;LLL;2| (|Mapping| 7 6) (|Polynomial| 6)
              (|PolynomialFunctions2| 6 7) (57 . |map|) (63 . |eval|)
              (|SparseUnivariatePolynomial| %) (70 . |univariate|) (76 . |0|)
              (80 . |0|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 24) (84 . |coefficient|) (90 . -)
              (95 . |retract|) (100 . |leadingCoefficient|) (105 . /)
              (111 . |retract|) (|SparseUnivariatePolynomial| 6)
              (116 . |univariate|) |INFSP;innerSolve1;SupParL;6|
              |INFSP;innerSolve1;PParL;5| (|List| (|Complex| 8))
              (|ComplexRootPackage| 50 8) (121 . |complexZeros|)
              (|Record| (|:| |left| 12) (|:| |right| 12)) (|List| 57)
              (|SparseUnivariatePolynomial| 9) (|RealZeroPackage| 59)
              (127 . |realZeros|) (133 . |1|) (137 . /) (143 . +) (149 . *)
              (155 . |convert|) (160 . +) (166 . *) (|Interval| 10)
              (172 . |interval|) (177 . |0|) (|Complex| 69) (181 . |complex|)
              (187 . |interval|) (192 . |real|) (197 . |imag|) (202 . |real|)
              (207 . |imag|) (212 . -) (217 . |interval|) (223 . +)
              (229 . |sup|) (234 . |inf|) (239 . +) (245 . /)
              (251 . |mantissa|) (256 . |exponent|) (|PositiveInteger|)
              (261 . |base|) (265 . ^) (271 . *) (277 . |real|) (282 . |imag|)
              (287 . |complex|) (|Polynomial| 72) (|Mapping| 72 6)
              (|PolynomialFunctions2| 6 72) (293 . |map|) (299 . |eval|)
              (306 . |univariate|) (|SparseUnivariatePolynomial| 95)
              (312 . |leadingCoefficient|) (317 . |retract|)
              (|Union| % '"failed") (322 . |recip|) (327 . |coefficient|)
              (333 . -) (338 . *) (344 . |coerce|) (349 . |1|) (353 . |1|)
              (357 . *) (363 . |1|) (367 . *) (373 . |bits|) (377 . |bits|)
              (382 . |width|) (|Boolean|) (387 . >) (393 . *) '"first"
              (399 . |setelt!|) (|List| 34) (406 . |elt|) (412 . |univariate|)
              (|PrimitiveArray| 127) (|SparseUnivariatePolynomial| 34)
              (|SubResultantPackage| 34 127) (418 . |subresultantVector|)
              (424 . |multivariate|) (430 . |primitivePart|)
              (435 . |primitivePart|) (441 . |zero?|) (446 . |0|) (|List| 30)
              |INFSP;innerSolve;2LLParL;18| (450 . |leadingCoefficient|)
              (455 . |gcd|) (461 . |1|) (465 . ~=) (471 . ~=) (477 . |append|)
              (483 . +) (489 . +) (|Mapping| 9 9 9) (|List| 9) (495 . |reduce|)
              (501 . |1|) (505 . |1|))
           '#(|makeEq| 509 |innerSolve1| 515 |innerSolve| 527) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|innerSolve1|
                                 ((|List| |#2|)
                                  (|SparseUnivariatePolynomial| |#1|) |#3|))
                                T)
                              '((|innerSolve1|
                                 ((|List| |#2|) (|Polynomial| |#1|) |#3|))
                                T)
                              '((|innerSolve|
                                 ((|List| (|List| |#2|))
                                  (|List| (|Polynomial| |#1|))
                                  (|List| (|Polynomial| |#1|))
                                  (|List| (|Symbol|)) |#3|))
                                T)
                              '((|makeEq|
                                 ((|List| (|Equation| (|Polynomial| |#2|)))
                                  (|List| |#2|) (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 149
                                            '(1 10 0 9 11 1 12 0 9 13 1 14 0 9
                                              15 1 16 0 9 17 1 18 9 0 19 1 18 9
                                              0 20 2 16 0 12 12 21 1 18 14 0 22
                                              1 24 0 23 25 1 24 0 7 26 2 27 0
                                              24 24 28 2 35 24 33 34 36 3 24 0
                                              0 23 7 37 2 24 38 0 23 39 0 6 0
                                              40 0 7 0 41 2 43 24 0 42 44 1 24
                                              0 0 45 1 24 7 0 46 1 43 24 0 47 2
                                              7 0 0 0 48 1 10 12 0 49 1 34 50 0
                                              51 2 55 54 50 8 56 2 60 58 59 12
                                              61 0 7 0 62 2 12 0 9 9 63 2 12 0
                                              0 0 64 2 12 0 0 12 65 1 12 10 0
                                              66 2 7 0 0 0 67 2 7 0 0 0 68 1 69
                                              0 12 70 0 69 0 71 2 72 0 69 69 73
                                              1 69 0 10 74 1 14 10 0 75 1 14 10
                                              0 76 1 16 12 0 77 1 16 12 0 78 1
                                              10 0 0 79 2 69 0 10 10 80 2 72 0
                                              0 0 81 1 69 10 0 82 1 69 10 0 83
                                              2 10 0 0 0 84 2 10 0 0 9 85 1 10
                                              9 0 86 1 10 9 0 87 0 10 88 89 2
                                              12 0 0 9 90 2 12 0 9 0 91 1 72 69
                                              0 92 1 72 69 0 93 2 14 0 10 10 94
                                              2 97 95 96 34 98 3 95 0 0 23 72
                                              99 2 95 38 0 23 100 1 101 95 0
                                              102 1 95 72 0 103 1 72 104 0 105
                                              2 101 95 0 42 106 1 95 0 0 107 2
                                              72 0 0 0 108 1 10 0 12 109 0 6 0
                                              110 0 8 0 111 2 8 0 12 0 112 0 10
                                              0 113 2 10 0 12 0 114 0 10 88 115
                                              1 10 88 88 116 1 69 10 0 117 2 10
                                              118 0 0 119 2 7 0 9 0 120 3 30 7
                                              0 121 7 122 2 123 34 0 9 124 2 34
                                              38 0 23 125 2 128 126 127 127 129
                                              2 34 0 38 23 130 1 34 0 0 131 2
                                              34 0 0 23 132 1 34 118 0 133 0 34
                                              0 134 1 127 34 0 137 2 34 0 0 0
                                              138 0 34 0 139 2 34 118 0 0 140 2
                                              123 118 0 0 141 2 135 0 0 0 142 2
                                              42 0 0 0 143 2 9 0 0 0 144 2 146
                                              9 145 0 147 0 12 0 148 0 72 0 149
                                              2 0 29 30 31 32 2 0 30 50 8 52 2
                                              0 30 34 8 53 4 0 135 123 123 31 8
                                              136)))))
           '|lookupComplete|)) 
