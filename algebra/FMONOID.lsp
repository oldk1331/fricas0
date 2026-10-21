
(SDEFUN |FMONOID;1;%;1| ((% (%))) (SPADCALL (QREFELT % 9))) 

(SDEFUN |FMONOID;one?;%B;2| ((|f| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |f| (QREFELT % 12)))) 

(SDEFUN |FMONOID;coerce;%Of;3| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL |f| (ELT % 16) (ELT % 17) 1 (QREFELT % 20))) 

(SDEFUN |FMONOID;hcrf;3%;4| ((|f| (%)) (|g| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT % 22)) (SPADCALL |g| (QREFELT % 22))
                   (QREFELT % 23))
         (QREFELT % 24))) 

(SDEFUN |FMONOID;*;%S%;5| ((|f| (%)) (|s| (S)) (% (%)))
        (SPADCALL |f| |s| (QREFELT % 26))) 

(SDEFUN |FMONOID;*;S2%;6| ((|s| (S)) (|f| (%)) (% (%)))
        (SPADCALL |s| |f| (QREFELT % 28))) 

(SDEFUN |FMONOID;factors;%L;7|
        ((|f| (%))
         (%
          (|List|
           (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
        (SPADCALL (SPADCALL |f| (QREFELT % 12)) (QREFELT % 30))) 

(SDEFUN |FMONOID;^;SNni%;8| ((|s| (S)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |s| |n| (QREFELT % 33))) 

(SDEFUN |FMONOID;*;3%;9| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG
         ((|lg|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lf| #1#)
          (|ls| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (|h|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((SPADCALL |f| (|spadConstant| % 7) (QREFELT % 35)) |g|)
                ((SPADCALL |g| (|spadConstant| % 7) (QREFELT % 35)) |f|)
                (#2='T
                 (SEQ (LETT |lg| (SPADCALL |g| (QREFELT % 12)))
                      (LETT |ls|
                            (SPADCALL (LETT |lf| (SPADCALL |f| (QREFELT % 12)))
                                      (QREFELT % 36)))
                      (EXIT
                       (COND
                        ((SPADCALL (QCAR |ls|) (QCAR (|SPADfirst| |lg|))
                                   (QREFELT % 37))
                         (SEQ
                          (SPADCALL (LETT |h| (SPADCALL |lf| (QREFELT % 30)))
                                    (CONS (QCAR (|SPADfirst| |lg|))
                                          (+ (QCDR (|SPADfirst| |lg|))
                                             (QCDR |ls|)))
                                    (QREFELT % 38))
                          (EXIT
                           (SPADCALL (SPADCALL |h| (CDR |lg|) (QREFELT % 39))
                                     (QREFELT % 40)))))
                        (#2#
                         (SPADCALL (SPADCALL |lf| |lg| (QREFELT % 39))
                                   (QREFELT % 40))))))))))) 

(SDEFUN |FMONOID;overlap;2%R;10|
        ((|la| (%)) (|ar| (%))
         (% (|Record| (|:| |lm| %) (|:| |mm| %) (|:| |rm| %))))
        (SPROG
         ((|la0|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lar| #1#) (#2=#:G59 NIL) (|ru| (|Union| % "failed")) (#3=#:G68 NIL)
          (|m|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#4=#:G80 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lla| #1#))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |la| (|spadConstant| % 7) (QREFELT % 35))
                 (SPADCALL |ar| (|spadConstant| % 7) (QREFELT % 35)))
             (VECTOR |la| (|spadConstant| % 7) |ar|))
            ('T
             (SEQ (LETT |lla| (LETT |la0| (SPADCALL |la| (QREFELT % 12))))
                  (LETT |lar| (SPADCALL |ar| (QREFELT % 12))) (LETT |l| NIL)
                  (SEQ G190 (COND ((NULL (NULL (NULL |lla|))) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR (|SPADfirst| |lla|))
                                    (QCAR (|SPADfirst| |lar|)) (QREFELT % 37))
                          (SEQ
                           (COND
                            ((< (QCDR (|SPADfirst| |lla|))
                                (QCDR (|SPADfirst| |lar|)))
                             (COND
                              ((NULL (CDR |lla|))
                               (PROGN
                                (LETT #4#
                                      (VECTOR (SPADCALL |l| (QREFELT % 40))
                                              (SPADCALL
                                               (QCAR (|SPADfirst| |lla|))
                                               (QCDR (|SPADfirst| |lla|))
                                               (QREFELT % 33))
                                              (SPADCALL
                                               (CONS
                                                (CONS
                                                 (QCAR (|SPADfirst| |lar|))
                                                 (PROG1
                                                     (LETT #2#
                                                           (-
                                                            (QCDR
                                                             (|SPADfirst|
                                                              |lar|))
                                                            (QCDR
                                                             (|SPADfirst|
                                                              |lla|))))
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#)))
                                                (CDR |lar|))
                                               (QREFELT % 40))))
                                (GO #5=#:G79))))))
                           (EXIT
                            (COND
                             ((>= (QCDR (|SPADfirst| |lla|))
                                  (QCDR (|SPADfirst| |lar|)))
                              (SEQ
                               (LETT |ru|
                                     (SPADCALL
                                      (SPADCALL (CDR |lar|) (QREFELT % 40))
                                      (SPADCALL (CDR |lla|) (QREFELT % 40))
                                      (QREFELT % 43)))
                               (EXIT
                                (COND
                                 ((QEQCAR |ru| 0)
                                  (SEQ
                                   (COND
                                    ((> (QCDR (|SPADfirst| |lla|))
                                        (QCDR (|SPADfirst| |lar|)))
                                     (SEQ
                                      (LETT |l|
                                            (SPADCALL |l|
                                                      (CONS
                                                       (QCAR
                                                        (|SPADfirst| |lla|))
                                                       (PROG1
                                                           (LETT #3#
                                                                 (-
                                                                  (QCDR
                                                                   (|SPADfirst|
                                                                    |lla|))
                                                                  (QCDR
                                                                   (|SPADfirst|
                                                                    |lar|))))
                                                         (|check_subtype2|
                                                          (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#)))
                                                      (QREFELT % 44)))
                                      (EXIT
                                       (LETT |m|
                                             (CONS
                                              (CONS (QCAR (|SPADfirst| |lla|))
                                                    (QCDR (|SPADfirst| |lar|)))
                                              (CDR |lla|))))))
                                    ('T (LETT |m| |lla|)))
                                   (EXIT
                                    (PROGN
                                     (LETT #4#
                                           (VECTOR
                                            (SPADCALL |l| (QREFELT % 40))
                                            (SPADCALL |m| (QREFELT % 40))
                                            (QCDR |ru|)))
                                     (GO #5#))))))))))))))
                        (LETT |l|
                              (SPADCALL |l| (|SPADfirst| |lla|)
                                        (QREFELT % 44)))
                        (EXIT (LETT |lla| (CDR |lla|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (SPADCALL |la0| (QREFELT % 40)) (|spadConstant| % 7)
                           (SPADCALL |lar| (QREFELT % 40))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |FMONOID;divide;2%U;11|
        ((|lar| (%)) (|a| (%))
         (% (|Union| (|Record| (|:| |lm| %) (|:| |rm| %)) "failed")))
        (SPROG
         ((|la|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|Na| (|Integer|)) (|q| (|Union| % "failed")) (#2=#:G92 NIL)
          (#3=#:G107 NIL) (#4=#:G106 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|llar| #1#) (|Nlar| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |a| (|spadConstant| % 7) (QREFELT % 35))
             (CONS 0 (CONS |lar| (|spadConstant| % 7))))
            ('T
             (SEQ
              (LETT |Na| (LENGTH (LETT |la| (SPADCALL |a| (QREFELT % 12)))))
              (LETT |Nlar|
                    (LENGTH (LETT |llar| (SPADCALL |lar| (QREFELT % 12)))))
              (LETT |l| NIL)
              (SEQ G190 (COND ((NULL (<= |Na| |Nlar|)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (COND
                       ((SPADCALL (QCAR (|SPADfirst| |llar|))
                                  (QCAR (|SPADfirst| |la|)) (QREFELT % 37))
                        (COND
                         ((>= (QCDR (|SPADfirst| |llar|))
                              (QCDR (|SPADfirst| |la|)))
                          (SEQ
                           (LETT |q|
                                 (SPADCALL
                                  (SPADCALL (CDR |llar|) (QREFELT % 40))
                                  (SPADCALL (CDR |la|) (QREFELT % 40))
                                  (QREFELT % 43)))
                           (EXIT
                            (COND
                             ((QEQCAR |q| 0)
                              (PROGN
                               (LETT #4#
                                     (SEQ
                                      (COND
                                       ((> (QCDR (|SPADfirst| |llar|))
                                           (QCDR (|SPADfirst| |la|)))
                                        (LETT |l|
                                              (SPADCALL |l|
                                                        (CONS
                                                         (QCAR
                                                          (|SPADfirst| |la|))
                                                         (PROG1
                                                             (LETT #2#
                                                                   (-
                                                                    (QCDR
                                                                     (|SPADfirst|
                                                                      |llar|))
                                                                    (QCDR
                                                                     (|SPADfirst|
                                                                      |la|))))
                                                           (|check_subtype2|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#)))
                                                        (QREFELT % 44)))))
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (CONS 0
                                                    (CONS
                                                     (SPADCALL |l|
                                                               (QREFELT % 40))
                                                     (QCDR |q|))))
                                        (GO #5=#:G105)))))
                               (GO #6=#:G98))))))))))
                      (LETT |l|
                            (SPADCALL |l| (|SPADfirst| |llar|) (QREFELT % 44)))
                      (LETT |llar| (CDR |llar|))
                      (EXIT (LETT |Nlar| (- |Nlar| 1)))))
                    #6# (EXIT #4#))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 "failed"))))))
          #5# (EXIT #3#)))) 

(SDEFUN |FMONOID;hclf;3%;12| ((|f| (%)) (|g| (%)) (% (%)))
        (SPROG
         ((|g0| NIL) (#1=#:G118 NIL) (|f0| NIL) (#2=#:G117 NIL)
          (|h|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#3=#:G116 NIL) (#4=#:G115 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |h| NIL)
                (SEQ (LETT |g0| NIL) (LETT #1# (SPADCALL |g| (QREFELT % 12)))
                     (LETT |f0| NIL) (LETT #2# (SPADCALL |f| (QREFELT % 12)))
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f0| (CAR #2#)) NIL)
                           (ATOM #1#) (PROGN (LETT |g0| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCAR |f0|) (QCAR |g0|) (QREFELT % 50))
                         (PROGN
                          (LETT #3# (SPADCALL |h| (QREFELT % 40)))
                          (GO #5=#:G114)))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |h|
                                  (SPADCALL |h|
                                            (CONS (QCAR |f0|)
                                                  (MIN (QCDR |f0|)
                                                       (QCDR |g0|)))
                                            (QREFELT % 44)))
                            (EXIT
                             (COND
                              ((SPADCALL (QCDR |f0|) (QCDR |g0|)
                                         (QREFELT % 51))
                               (PROGN
                                (LETT #4#
                                      (PROGN
                                       (LETT #3# (SPADCALL |h| (QREFELT % 40)))
                                       (GO #5#)))
                                (GO #6=#:G110)))))))
                          #6# (EXIT #4#))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |h| (QREFELT % 40)))))
          #5# (EXIT #3#)))) 

(SDEFUN |FMONOID;lquo;2%U;13| ((|aq| (%)) (|a| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|a0| NIL) (#1=#:G135 NIL) (#2=#:G134 NIL)
          (|laq|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#3=#:G127 NIL))
         (SEQ
          (EXIT
           (COND
            ((> (SPADCALL |a| (QREFELT % 52))
                (LENGTH
                 (LETT |laq|
                       (SPADCALL (SPADCALL |aq| (QREFELT % 12))
                                 (QREFELT % 30)))))
             (CONS 1 "failed"))
            ('T
             (SEQ
              (SEQ (LETT |a0| NIL) (LETT #1# (SPADCALL |a| (QREFELT % 12)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a0| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR
                        (SPADCALL (QCAR |a0|) (QCAR (|SPADfirst| |laq|))
                                  (QREFELT % 50))
                        (> (QCDR |a0|) (QCDR (|SPADfirst| |laq|))))
                       (PROGN (LETT #2# (CONS 1 "failed")) (GO #4=#:G133)))
                      ((EQL (QCDR |a0|) (QCDR (|SPADfirst| |laq|)))
                       (LETT |laq| (CDR |laq|)))
                      ('T
                       (SPADCALL |laq|
                                 (CONS (QCAR (|SPADfirst| |laq|))
                                       (PROG1
                                           (LETT #3#
                                                 (- (QCDR (|SPADfirst| |laq|))
                                                    (QCDR |a0|)))
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#)))
                                 (QREFELT % 53))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 (SPADCALL |laq| (QREFELT % 40))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FMONOID;rquo;2%U;14| ((|qa| (%)) (|a| (%)) (% (|Union| % "failed")))
        (SPROG ((|u| (|Union| % "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |qa| (QREFELT % 22))
                                (SPADCALL |a| (QREFELT % 22)) (QREFELT % 43)))
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT % 24))))))))) 

(SDEFUN |FMONOID;lquo;%SU;15| ((|w| (%)) (|l| (S)) (% (|Union| % "failed")))
        (SPROG
         ((|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|fx| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (#1=#:G145 NIL))
         (SEQ (LETT |x| (SPADCALL |w| (QREFELT % 12)))
              (EXIT
               (COND ((NULL |x|) (CONS 1 "failed"))
                     (#2='T
                      (SEQ (LETT |fx| (|SPADfirst| |x|))
                           (EXIT
                            (COND
                             ((SPADCALL (QCAR |fx|) |l| (QREFELT % 50))
                              (CONS 1 "failed"))
                             ((EQL (QCDR |fx|) 1)
                              (CONS 0 (SPADCALL (CDR |x|) (QREFELT % 40))))
                             (#2#
                              (CONS 0
                                    (SPADCALL
                                     (CONS
                                      (CONS (QCAR |fx|)
                                            (PROG1 (LETT #1# (- (QCDR |fx|) 1))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#)))
                                      (CDR |x|))
                                     (QREFELT % 40))))))))))))) 

(SDEFUN |FMONOID;rquo;%SU;16| ((|w| (%)) (|l| (S)) (% (|Union| % "failed")))
        (SPROG ((|u| (%)) (|r| (|Union| % "failed")))
               (SEQ (LETT |u| (SPADCALL |w| (QREFELT % 22)))
                    (LETT |r| (SPADCALL |u| |l| (QREFELT % 55)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                           ('T
                            (CONS 0 (SPADCALL (QCDR |r|) (QREFELT % 24))))))))) 

(SDEFUN |FMONOID;varList1| ((|x| (%)) (% (|List| S)))
        (SPROG ((#1=#:G160 NIL) (|t| NIL) (#2=#:G161 NIL) (|le| (|List| S)))
               (SEQ
                (LETT |le|
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |t| NIL)
                            (LETT #2# (SPADCALL |x| (QREFELT % 12))) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #1# (CONS (QCAR |t|) #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))
                (EXIT (SPADCALL |le| (QREFELT % 58)))))) 

(SDEFUN |FMONOID;varList;%L;18| ((|x| (%)) (% (|List| S)))
        (SPADCALL (|FMONOID;varList1| |x| %) (QREFELT % 59))) 

(SDEFUN |FMONOID;varList;%L;19| ((|x| (%)) (% (|List| S)))
        (|FMONOID;varList1| |x| %)) 

(SDEFUN |FMONOID;first;%S;20| ((|w| (%)) (% (S)))
        (SPROG
         ((|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
         (SEQ (LETT |x| (SPADCALL |w| (QREFELT % 12)))
              (EXIT
               (COND ((NULL |x|) (|error| "empty word !!!"))
                     ('T (QCAR (|SPADfirst| |x|)))))))) 

(SDEFUN |FMONOID;rest;2%;21| ((|w| (%)) (% (%)))
        (SPROG
         ((|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|fx| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (#1=#:G168 NIL))
         (SEQ (LETT |x| (SPADCALL |w| (QREFELT % 12)))
              (EXIT
               (COND ((NULL |x|) (|error| "empty word !!!"))
                     (#2='T
                      (SEQ (LETT |fx| (|SPADfirst| |x|))
                           (EXIT
                            (COND
                             ((EQL (QCDR |fx|) 1)
                              (SPADCALL (CDR |x|) (QREFELT % 40)))
                             (#2#
                              (SPADCALL
                               (CONS
                                (CONS (QCAR |fx|)
                                      (PROG1 (LETT #1# (- (QCDR |fx|) 1))
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#)))
                                (CDR |x|))
                               (QREFELT % 40)))))))))))) 

(SDEFUN |FMONOID;mirror;2%;22| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 22))) 

(SDEFUN |FMONOID;lexico;2%B;23| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG
         ((|a1| #1=(|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (|b1| #1#) (#2=#:G190 NIL) (#3=#:G178 NIL) (#4=#:G180 NIL)
          (|lb|
           #5=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|la| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |la| (SPADCALL |a| (QREFELT % 12)))
                (LETT |lb| (SPADCALL |b| (QREFELT % 12)))
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |la|) NIL) ('T (NULL (NULL |lb|)))))
                       (GO G191)))
                     (SEQ (LETT |a1| (|SPADfirst| |la|))
                          (LETT |b1| (|SPADfirst| |lb|))
                          (EXIT
                           (COND
                            ((SPADCALL (QCAR |a1|) (QCAR |b1|) (QREFELT % 64))
                             (PROGN (LETT #2# 'T) (GO #6=#:G189)))
                            ((SPADCALL (QCAR |b1|) (QCAR |a1|) (QREFELT % 64))
                             (PROGN (LETT #2# NIL) (GO #6#)))
                            ((EQL (QCDR |a1|) (QCDR |b1|))
                             (SEQ (LETT |la| (CDR |la|))
                                  (EXIT (LETT |lb| (CDR |lb|)))))
                            ((> (QCDR |a1|) (QCDR |b1|))
                             (SEQ
                              (LETT |la|
                                    (CONS
                                     (CONS (QCAR |a1|)
                                           (PROG1
                                               (LETT #3#
                                                     (- (QCDR |a1|)
                                                        (QCDR |b1|)))
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#)))
                                     (CDR |la|)))
                              (EXIT (LETT |lb| (CDR |lb|)))))
                            ('T
                             (SEQ
                              (LETT |lb|
                                    (CONS
                                     (CONS (QCAR |b1|)
                                           (PROG1
                                               (LETT #4#
                                                     (- (QCDR |b1|)
                                                        (QCDR |a1|)))
                                             (|check_subtype2| (>= #4# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #4#)))
                                     (CDR |lb|)))
                              (EXIT (LETT |la| (CDR |la|))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (COND ((NULL |la|) (NULL (NULL |lb|))) ('T NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |FMONOID;smaller?;2%B;24| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG ((|la| #1=(|NonNegativeInteger|)) (|lb| #1#))
               (SEQ (LETT |la| (SPADCALL |a| (QREFELT % 66)))
                    (LETT |lb| (SPADCALL |b| (QREFELT % 66)))
                    (EXIT
                     (COND ((EQL |la| |lb|) (SPADCALL |a| |b| (QREFELT % 65)))
                           ('T (< |la| |lb|))))))) 

(SDEFUN |FMONOID;<;2%B;25| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPADCALL |a| |b| (QREFELT % 67))) 

(DECLAIM (NOTINLINE |FreeMonoid;|)) 

(DEFUN |FreeMonoid;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G199 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FreeMonoid| DV$1))
          (LETT % (GETREFV 74))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Comparable|)))
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|OrderedSet|)))))))
          (|haddProp| |$ConstructorCache| '|FreeMonoid| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| |#1| '(|OrderedSet|))
               (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 16))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 (|ListMonoidOps| |#1| (|NonNegativeInteger|) 1))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 60
                      (CONS (|dispatchFunction| |FMONOID;varList;%L;18|) %)))
           ('T
            (QSETREFV % 60
                      (CONS (|dispatchFunction| |FMONOID;varList;%L;19|) %))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV % 65
                       (CONS (|dispatchFunction| |FMONOID;lexico;2%B;23|) %))
             (QSETREFV % 67
                       (CONS (|dispatchFunction| |FMONOID;smaller?;2%B;24|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 68 (CONS (|dispatchFunction| |FMONOID;<;2%B;25|) %))))
          %))) 

(DEFUN |FreeMonoid| (#1=#:G200)
  (SPROG NIL
         (PROG (#2=#:G201)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FreeMonoid|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FreeMonoid;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FreeMonoid|)))))))))) 

(MAKEPROP '|FreeMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ListMonoidOps| 6 32 (NRTEVAL 1))
              (|local| |#1|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FMONOID;1;%;1|) %))
              '|Rep| (0 . |makeUnit|) (|Record| (|:| |gen| 6) (|:| |exp| 32))
              (|List| 10) (4 . |listOfMonoms|) (|Boolean|) |FMONOID;one?;%B;2|
              (|OutputForm|) (9 . *) (15 . ^) (|Mapping| 15 15 15) (|Integer|)
              (21 . |outputForm|) |FMONOID;coerce;%Of;3| (29 . |reverse|)
              |FMONOID;hclf;3%;12| (34 . |reverse!|) |FMONOID;hcrf;3%;4|
              (39 . |rightMult|) |FMONOID;*;%S%;5| (45 . |leftMult|)
              |FMONOID;*;S2%;6| (51 . |copy|) |FMONOID;factors;%L;7|
              (|NonNegativeInteger|) (56 . |makeTerm|) |FMONOID;^;SNni%;8|
              (62 . =) (68 . |last|) (73 . =) (79 . |setlast!|) (85 . |concat|)
              (91 . |makeMulti|) |FMONOID;*;3%;9| (|Union| % '"failed")
              |FMONOID;lquo;2%U;13| (96 . |concat!|)
              (|Record| (|:| |lm| %) (|:| |mm| %) (|:| |rm| %))
              |FMONOID;overlap;2%R;10| (|Record| (|:| |lm| %) (|:| |rm| %))
              (|Union| 47 '"failed") |FMONOID;divide;2%U;11| (102 . ~=)
              (108 . ~=) (114 . |size|) (119 . |setfirst!|)
              |FMONOID;rquo;2%U;14| |FMONOID;lquo;%SU;15| |FMONOID;rquo;%SU;16|
              (|List| 6) (125 . |removeDuplicates|) (130 . |sort!|)
              (135 . |varList|) |FMONOID;first;%S;20| |FMONOID;rest;2%;21|
              |FMONOID;mirror;2%;22| (140 . |smaller?|) (146 . |lexico|)
              (152 . |length|) (157 . |smaller?|) (163 . <) (|String|)
              (|PositiveInteger|) (|Union| 6 '"failed") (|Mapping| 32 32)
              (|Mapping| 6 6))
           '#(~= 169 |varList| 175 |smaller?| 180 |size| 186 |sign| 191
              |sample| 196 |rquo| 200 |rightRecip| 212 |rightPower| 217
              |retractIfCan| 229 |retract| 234 |rest| 239 |recip| 244
              |positive?| 249 |overlap| 254 |one?| 260 |nthFactor| 265
              |nthExpon| 271 |negative?| 277 |mirror| 282 |min| 287 |max| 293
              |mapGen| 299 |mapExpon| 305 |lquo| 311 |lexico| 323 |length| 329
              |leftRecip| 334 |leftPower| 339 |latex| 351 |hcrf| 356 |hclf| 362
              |first| 368 |factors| 373 |divide| 378 |coerce| 384 ^ 394 >= 412
              > 418 = 424 <= 430 < 436 |1| 442 * 446)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(1 1 0 4 0 0 4 0 0 0 1 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| NIL NIL |MagmaWithUnit&| NIL NIL
                     |Magma&| |SetCategory&| |RetractableTo&| |PartialOrder&|
                     NIL |BasicType&| NIL)
                  (CONS
                   '#((|OrderedMagma|) (|OrderedSet|) (|Monoid|) (|Comparable|)
                      (|MagmaWithUnit|) (|SemiGroup|)
                      (|ComparableRepresentation|) (|Magma|) (|SetCategory|)
                      (|RetractableTo| 6) (|PartialOrder|) (|CoercibleTo| 15)
                      (|BasicType|) (|CoercibleFrom| 6))
                   (|makeByteWordVec2| 73
                                       '(0 8 0 9 1 8 11 0 12 2 15 0 0 0 16 2 15
                                         0 0 0 17 4 8 15 0 18 18 19 20 1 8 0 0
                                         22 1 8 0 0 24 2 8 0 0 6 26 2 8 0 6 0
                                         28 1 11 0 0 30 2 8 0 6 32 33 2 0 13 0
                                         0 35 1 11 10 0 36 2 6 13 0 0 37 2 11
                                         10 0 10 38 2 11 0 0 0 39 1 8 0 11 40 2
                                         11 0 0 10 44 2 6 13 0 0 50 2 32 13 0 0
                                         51 1 0 32 0 52 2 11 10 0 10 53 1 57 0
                                         0 58 1 57 0 0 59 1 0 57 0 60 2 6 13 0
                                         0 64 2 0 13 0 0 65 1 0 32 0 66 2 0 13
                                         0 0 67 2 0 13 0 0 68 2 0 13 0 0 1 1 2
                                         57 0 60 2 3 13 0 0 67 1 0 32 0 52 1 5
                                         19 0 1 0 0 0 1 2 0 42 0 0 54 2 0 42 0
                                         6 56 1 0 42 0 1 2 0 0 0 70 1 2 0 0 0
                                         32 1 1 0 71 0 1 1 0 6 0 1 1 0 0 0 62 1
                                         0 42 0 1 1 5 13 0 1 2 0 45 0 0 46 1 0
                                         13 0 14 2 0 6 0 19 1 2 0 32 0 19 1 1 5
                                         13 0 1 1 0 0 0 63 2 1 0 0 0 1 2 1 0 0
                                         0 1 2 0 0 73 0 1 2 0 0 72 0 1 2 0 42 0
                                         0 43 2 0 42 0 6 55 2 3 13 0 0 65 1 0
                                         32 0 66 1 0 42 0 1 2 0 0 0 70 1 2 0 0
                                         0 32 1 1 0 69 0 1 2 0 0 0 0 25 2 0 0 0
                                         0 23 1 0 6 0 61 1 0 11 0 31 2 0 48 0 0
                                         49 1 0 15 0 21 1 0 0 6 1 2 0 0 0 70 1
                                         2 0 0 0 32 1 2 0 0 6 32 34 2 1 13 0 0
                                         1 2 1 13 0 0 1 2 0 13 0 0 35 2 1 13 0
                                         0 1 2 1 13 0 0 68 0 0 0 7 2 0 0 0 0 41
                                         2 0 0 6 0 29 2 0 0 0 6 27)))))
           '|lookupComplete|)) 
