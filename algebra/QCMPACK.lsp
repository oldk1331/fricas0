
(SDEFUN |QCMPACK;squareFreeFactors| ((|lp| (|List| P)) (% (|List| P)))
        (SPROG
         ((|p| NIL) (#1=#:G68 NIL) (|lsfp| (|List| P)) (|lsflp| (|List| P)))
         (SEQ (LETT |lsflp| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lsfp| (SPADCALL |p| (QREFELT % 13)))
                        (EXIT
                         (LETT |lsflp|
                               (SPADCALL |lsfp| |lsflp| (QREFELT % 14)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT % 16) (SPADCALL |lsflp| (QREFELT % 17))
                         (QREFELT % 19)))))) 

(SDEFUN |QCMPACK;startTable!;3SV;2|
        ((|ok| (|String|)) (|ko| (|String|)) (|domainName| (|String|))
         (% (|Void|)))
        (SEQ (SPADCALL (QREFELT % 23))
             (COND
              ((NULL (SPADCALL |ok| (QREFELT % 25)))
               (COND
                ((NULL (SPADCALL |ko| (QREFELT % 25)))
                 (SPADCALL |ok| |ko| (QREFELT % 26))))))
             (COND
              ((NULL (SPADCALL |domainName| (QREFELT % 25)))
               (SPADCALL |domainName| (QREFELT % 27))))
             (EXIT (SPADCALL (QREFELT % 28))))) 

(SDEFUN |QCMPACK;stopTable!;V;3| ((% (|Void|)))
        (SEQ (COND ((SPADCALL (QREFELT % 30)) (SPADCALL (QREFELT % 31))))
             (EXIT (SPADCALL (QREFELT % 32))))) 

(SDEFUN |QCMPACK;supDimElseRittWu?;2TSB;4|
        ((|ts| (TS)) (|us| (TS)) (% (|Boolean|)))
        (SPROG ((|lp1| #1=(|List| P)) (|lp2| #1#))
               (SEQ
                (COND
                 ((< (SPADCALL |ts| (QREFELT % 35))
                     (SPADCALL |us| (QREFELT % 35)))
                  'T)
                 ((> (SPADCALL |ts| (QREFELT % 35))
                     (SPADCALL |us| (QREFELT % 35)))
                  NIL)
                 ('T
                  (SEQ (LETT |lp1| (SPADCALL |ts| (QREFELT % 36)))
                       (LETT |lp2| (SPADCALL |us| (QREFELT % 36)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |lp1|) NIL)
                                     ('T
                                      (NULL
                                       (SPADCALL (|SPADfirst| |lp2|)
                                                 (|SPADfirst| |lp1|)
                                                 (QREFELT % 16))))))
                              (GO G191)))
                            (SEQ (LETT |lp1| (CDR |lp1|))
                                 (EXIT (LETT |lp2| (CDR |lp2|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (NULL (NULL |lp1|))))))))) 

(SDEFUN |QCMPACK;algebraicSort;2L;5| ((|lts| (|List| TS)) (% (|List| TS)))
        (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT % 39)))
             (EXIT (SPADCALL (ELT % 37) |lts| (QREFELT % 41))))) 

(SDEFUN |QCMPACK;moreAlgebraic?;2TSB;6|
        ((|ts| (TS)) (|us| (TS)) (% (|Boolean|)))
        (SPROG ((|p| NIL) (#1=#:G103 NIL) (#2=#:G102 NIL) (#3=#:G101 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |ts| (QREFELT % 43))
                   (SPADCALL |us| (QREFELT % 43)))
                  ((SPADCALL |us| (QREFELT % 43)) 'T)
                  ((< (SPADCALL |ts| (QREFELT % 35))
                      (SPADCALL |us| (QREFELT % 35)))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |p| NIL)
                           (LETT #1# (SPADCALL |us| (QREFELT % 36))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |p| (QREFELT % 44)) |ts|
                                          (QREFELT % 45)))
                               (PROGN
                                (LETT #3#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G100)))
                                (GO #5=#:G95))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #3#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |QCMPACK;subTriSet?;2TSB;7| ((|ts| (TS)) (|us| (TS)) (% (|Boolean|)))
        (SPROG ((#1=#:G114 NIL) (#2=#:G108 NIL))
               (COND ((SPADCALL |ts| (QREFELT % 43)) 'T)
                     ((OR (SPADCALL |us| (QREFELT % 43))
                          (SPADCALL (SPADCALL |ts| (QREFELT % 47))
                                    (SPADCALL |us| (QREFELT % 47))
                                    (QREFELT % 48)))
                      NIL)
                     ((SPADCALL (SPADCALL |ts| (QREFELT % 47))
                                (SPADCALL |us| (QREFELT % 47)) (QREFELT % 49))
                      (SPADCALL |ts|
                                (PROG2
                                    (LETT #2# (SPADCALL |us| (QREFELT % 51)))
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0) (QREFELT % 10)
                                                  (|Union| (QREFELT % 10)
                                                           #3="failed")
                                                  #2#))
                                (QREFELT % 52)))
                     ((SPADCALL
                       (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT % 54)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT % 9)
                                         (|Union| (QREFELT % 9) #3#) #1#))
                       (PROG2 (LETT #1# (SPADCALL |us| (QREFELT % 54)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT % 9)
                                         (|Union| (QREFELT % 9) #3#) #1#))
                       (QREFELT % 55))
                      (SPADCALL
                       (PROG2 (LETT #2# (SPADCALL |ts| (QREFELT % 51)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT % 10)
                                         (|Union| (QREFELT % 10) #3#) #2#))
                       (PROG2 (LETT #2# (SPADCALL |us| (QREFELT % 51)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT % 10)
                                         (|Union| (QREFELT % 10) #3#) #2#))
                       (QREFELT % 52)))
                     ('T NIL)))) 

(SDEFUN |QCMPACK;internalSubPolSet?;2LB;8|
        ((|lp1| (|List| P)) (|lp2| (|List| P)) (% (|Boolean|)))
        (COND ((NULL |lp1|) 'T) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT % 56))
               (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT % 57)))
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT % 16))
               NIL)
              ('T (SPADCALL |lp1| (CDR |lp2|) (QREFELT % 57))))) 

(SDEFUN |QCMPACK;subPolSet?;2LB;9|
        ((|lp1| (|List| P)) (|lp2| (|List| P)) (% (|Boolean|)))
        (SEQ (LETT |lp1| (SPADCALL (ELT % 16) |lp1| (QREFELT % 19)))
             (LETT |lp2| (SPADCALL (ELT % 16) |lp2| (QREFELT % 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT % 57))))) 

(SDEFUN |QCMPACK;infRittWu?;2LB;10|
        ((|lp1| (|List| P)) (|lp2| (|List| P)) (% (|Boolean|)))
        (SEQ (LETT |lp1| (SPADCALL (ELT % 16) |lp1| (QREFELT % 19)))
             (LETT |lp2| (SPADCALL (ELT % 16) |lp2| (QREFELT % 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT % 59))))) 

(SDEFUN |QCMPACK;internalInfRittWu?;2LB;11|
        ((|lp1| (|List| P)) (|lp2| (|List| P)) (% (|Boolean|)))
        (COND ((NULL |lp1|) (NULL (NULL |lp2|))) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT % 16))
               'T)
              ((SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|)
                         (QREFELT % 16))
               NIL)
              ('T (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT % 60))))) 

(SDEFUN |QCMPACK;subCase?;2RB;12|
        ((|lpwt1| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         (|lpwt2| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         (% (|Boolean|)))
        (COND
         ((NULL (SPADCALL (QCAR |lpwt2|) (QCAR |lpwt1|) (QREFELT % 57))) NIL)
         ('T (SPADCALL (QCDR |lpwt1|) (QCDR |lpwt2|) (QREFELT % 61))))) 

(SDEFUN |QCMPACK;internalSubQuasiComponent?;2TSU;13|
        ((|ts| (TS)) (|us| (TS)) (% (|Union| (|Boolean|) "failed")))
        (SPROG
         ((#1=#:G176 NIL) (#2=#:G156 NIL) (#3=#:G174 NIL) (#4=#:G177 NIL)
          (#5=#:G173 NIL) (|lsfp| (|List| P)) (|p| NIL) (#6=#:G178 NIL)
          (#7=#:G175 NIL) (#8=#:G172 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |us| |ts| (QREFELT % 52)) (CONS 0 'T))
                 ((NULL (SPADCALL |ts| |us| (QREFELT % 46))) (CONS 0 NIL))
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #1# (SPADCALL |us| (QREFELT % 36))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((< (SPADCALL |p| (QREFELT % 64))
                                 (SPADCALL
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |ts|
                                                      (SPADCALL |p|
                                                                (QREFELT % 44))
                                                      (QREFELT % 65)))
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT % 9)
                                                    (|Union| (QREFELT % 9)
                                                             "failed")
                                                    #2#))
                                  (QREFELT % 64)))
                              (PROGN
                               (LETT #3#
                                     (PROGN
                                      (LETT #7# (CONS 1 "failed"))
                                      (GO #9=#:G171)))
                               (GO #10=#:G159))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                    #10# (EXIT #3#))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #4# (SPADCALL |us| (QREFELT % 36))) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT % 66))
                                         (QREFELT % 67)))
                              (PROGN
                               (LETT #5#
                                     (PROGN
                                      (LETT #7# (CONS 1 "failed"))
                                      (GO #9#)))
                               (GO #11=#:G162))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                    #11# (EXIT #5#))
                   (LETT |lsfp|
                         (|QCMPACK;squareFreeFactors|
                          (SPADCALL |us| (QREFELT % 68)) %))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL) (LETT #6# |lsfp|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |p| |ts| (QREFELT % 69)))
                              (PROGN
                               (LETT #8#
                                     (PROGN (LETT #7# (CONS 0 NIL)) (GO #9#)))
                               (GO #12=#:G165))))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
                    #12# (EXIT #8#))
                   (EXIT (CONS 0 'T))))))
          #9# (EXIT #7#)))) 

(SDEFUN |QCMPACK;subQuasiComponent?;2TSB;14|
        ((|ts| (TS)) (|us| (TS)) (% (|Boolean|)))
        (SPROG
         ((|k| (|Record| (|:| |left| TS) (|:| |right| TS)))
          (|e| (|Union| (|Boolean|) "failed"))
          (|ubf| (|Union| (|Boolean|) "failed")) (|b| (|Boolean|)))
         (SEQ (LETT |k| (CONS |ts| |us|))
              (LETT |e| (SPADCALL |k| (QREFELT % 72)))
              (EXIT
               (COND ((QEQCAR |e| 0) (QCDR |e|))
                     (#1='T
                      (SEQ (LETT |ubf| (SPADCALL |ts| |us| (QREFELT % 71)))
                           (LETT |b|
                                 (COND ((QEQCAR |ubf| 0) (QCDR |ubf|))
                                       (#1# NIL)))
                           (SPADCALL |k| |b| (QREFELT % 73)) (EXIT |b|)))))))) 

(SDEFUN |QCMPACK;subQuasiComponent?;TSLB;15|
        ((|ts| (TS)) (|lus| (|List| TS)) (% (|Boolean|)))
        (SPROG ((|us| NIL) (#1=#:G193 NIL) (#2=#:G192 NIL) (#3=#:G191 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |us| NIL) (LETT #1# |lus|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ts| |us| (QREFELT % 61))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# 'T) (GO #4=#:G190)))
                              (GO #5=#:G188))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |QCMPACK;removeSuperfluousCases;2L;16|
        ((|cases| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
         (% (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))))
        (SPROG
         ((|lpwt2| NIL) (#1=#:G226 NIL)
          (|lpwt1| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (|toSave|
           (|List| #2=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|maxcases|
           #3=(|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|copymaxcases| (|List| #2#)) (|headmaxcases| #3#)
          (|toSee|
           (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))))
         (SEQ
          (COND ((< (LENGTH |cases|) 2) |cases|)
                ('T
                 (SEQ
                  (LETT |toSee|
                        (SPADCALL
                         (CONS #'|QCMPACK;removeSuperfluousCases;2L;16!0| %)
                         |cases| (QREFELT % 77)))
                  (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                       (SEQ (LETT |lpwt1| (|SPADfirst| |toSee|))
                            (LETT |toSee| (CDR |toSee|)) (LETT |toSave| NIL)
                            (SEQ (LETT |lpwt2| NIL) (LETT #1# |toSee|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |lpwt2| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |lpwt1| |lpwt2| (QREFELT % 63))
                                     (LETT |lpwt1| |lpwt2|))
                                    ((NULL
                                      (SPADCALL |lpwt2| |lpwt1|
                                                (QREFELT % 63)))
                                     (LETT |toSave|
                                           (CONS |lpwt2| |toSave|))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND
                             ((NULL |maxcases|)
                              (SEQ (LETT |headmaxcases| (LIST |lpwt1|))
                                   (EXIT (LETT |maxcases| |headmaxcases|))))
                             ('T
                              (SEQ (LETT |copymaxcases| |maxcases|)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND ((NULL |copymaxcases|) NIL)
                                                 ('T
                                                  (NULL
                                                   (SPADCALL |lpwt1|
                                                             (|SPADfirst|
                                                              |copymaxcases|)
                                                             (QREFELT %
                                                                      63))))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |copymaxcases|
                                                (CDR |copymaxcases|))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL |copymaxcases|)
                                      (SEQ
                                       (SPADCALL |headmaxcases| (LIST |lpwt1|)
                                                 (QREFELT % 78))
                                       (EXIT
                                        (LETT |headmaxcases|
                                              (CDR |headmaxcases|))))))))))
                            (EXIT (LETT |toSee| (REVERSE |toSave|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |maxcases|))))))) 

(SDEFUN |QCMPACK;removeSuperfluousCases;2L;16!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 37))) 

(SDEFUN |QCMPACK;removeSuperfluousQuasiComponents;2L;17|
        ((|lts| (|List| TS)) (% (|List| TS)))
        (SPROG
         ((|us| NIL) (#1=#:G246 NIL) (|ts| (TS)) (|toSave| (|List| TS))
          (|maxlts| #2=(|List| TS)) (|copymaxlts| (|List| TS))
          (|headmaxlts| #2#) (|toSee| (|List| TS)))
         (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT % 39)))
              (EXIT
               (COND ((< (LENGTH |lts|) 2) |lts|)
                     ('T
                      (SEQ (LETT |toSee| (SPADCALL |lts| (QREFELT % 42)))
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                                (SEQ (LETT |ts| (|SPADfirst| |toSee|))
                                     (LETT |toSee| (CDR |toSee|))
                                     (LETT |toSave| NIL)
                                     (SEQ (LETT |us| NIL) (LETT #1# |toSee|)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |us| (CAR #1#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |ts| |us|
                                                        (QREFELT % 61))
                                              (LETT |ts| |us|))
                                             ((NULL
                                               (SPADCALL |us| |ts|
                                                         (QREFELT % 61)))
                                              (LETT |toSave|
                                                    (CONS |us| |toSave|))))))
                                          (LETT #1# (CDR #1#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND
                                      ((NULL |maxlts|)
                                       (SEQ (LETT |headmaxlts| (LIST |ts|))
                                            (EXIT
                                             (LETT |maxlts| |headmaxlts|))))
                                      ('T
                                       (SEQ (LETT |copymaxlts| |maxlts|)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (COND
                                                     ((NULL |copymaxlts|) NIL)
                                                     ('T
                                                      (NULL
                                                       (SPADCALL |ts|
                                                                 (|SPADfirst|
                                                                  |copymaxlts|)
                                                                 (QREFELT %
                                                                          61))))))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |copymaxlts|
                                                         (CDR |copymaxlts|))))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL |copymaxlts|)
                                               (SEQ
                                                (SPADCALL |headmaxlts|
                                                          (LIST |ts|)
                                                          (QREFELT % 80))
                                                (EXIT
                                                 (LETT |headmaxlts|
                                                       (CDR
                                                        |headmaxlts|))))))))))
                                     (EXIT (LETT |toSee| (REVERSE |toSave|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (SPADCALL |maxlts| (QREFELT % 42)))))))))) 

(SDEFUN |QCMPACK;removeAssociates| ((|lp| (|List| P)) (% (|List| P)))
        (SPROG ((#1=#:G250 NIL) (|p| NIL) (#2=#:G251 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1# (CONS (SPADCALL |p| (QREFELT % 82)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 17))))) 

(SDEFUN |QCMPACK;branchIfCan;LTSL5BU;19|
        ((|leq| (|List| P)) (|ts| (TS)) (|lineq| (|List| P)) (|b1| (|Boolean|))
         (|b2| (|Boolean|)) (|b3| (|Boolean|)) (|b4| (|Boolean|))
         (|b5| (|Boolean|))
         (%
          (|Union|
           (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                     (|:| |ineq| (|List| P)))
           "failed")))
        (SPROG
         ((#1=#:G295 NIL) (|ps| (|GeneralPolynomialSet| R E V P))
          (#2=#:G297 NIL) (#3=#:G294 NIL) (#4=#:G298 NIL) (#5=#:G293 NIL)
          (|p| NIL) (#6=#:G299 NIL) (|q| NIL) (#7=#:G300 NIL) (|g| (P))
          (#8=#:G278 NIL) (|newp| (P)) (#9=#:G296 NIL) (|newleq| (|List| P)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|b1|
              (SEQ
               (EXIT
                (SEQ (LETT |leq| (|QCMPACK;removeAssociates| |leq| %))
                     (LETT |leq| (SPADCALL (ELT % 67) |leq| (QREFELT % 84)))
                     (EXIT
                      (COND
                       ((SPADCALL (ELT % 85) |leq| (QREFELT % 86))
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #9# (CONS 1 "failed"))
                                (GO #10=#:G292)))
                         (GO #11=#:G260)))))))
               #11# (EXIT #1#))))
            (COND
             (|b2|
              (COND
               ((SPADCALL (ELT % 67) |lineq| (QREFELT % 86))
                (PROGN (LETT #9# (CONS 1 "failed")) (GO #10#)))
               ('T (LETT |lineq| (SPADCALL |lineq| (QREFELT % 87)))))))
            (COND
             (|b3|
              (SEQ (LETT |ps| (SPADCALL |leq| (QREFELT % 89)))
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ (LETT |q| NIL) (LETT #2# |lineq|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |q| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QVELT (SPADCALL |q| |ps| (QREFELT % 91)) 1)
                                (QREFELT % 67))
                               (PROGN
                                (LETT #3#
                                      (PROGN
                                       (LETT #9# (CONS 1 "failed"))
                                       (GO #10#)))
                                (GO #12=#:G268))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
                     #12# (EXIT #3#))))))
            (COND
             ((OR (NULL |leq|) (NULL |lineq|))
              (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
            (COND
             (|b4|
              (SEQ
               (EXIT
                (SEQ (LETT |q| NIL) (LETT #4# |lineq|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |q| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |q| |ts| (QREFELT % 66))
                                   (QREFELT % 67))
                         (PROGN
                          (LETT #5#
                                (PROGN (LETT #9# (CONS 1 "failed")) (GO #10#)))
                          (GO #13=#:G274))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
               #13# (EXIT #5#))))
            (COND
             (|b5|
              (SEQ (LETT |newleq| NIL)
                   (SEQ (LETT |p| NIL) (LETT #6# |leq|) G190
                        (COND
                         ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |q| NIL) (LETT #7# |lineq|) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |q| (CAR #7#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |p| (QREFELT % 44))
                                             (SPADCALL |q| (QREFELT % 44))
                                             (QREFELT % 92))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL |p| |q| (QREFELT % 93)))
                                    (LETT |newp|
                                          (PROG2
                                              (LETT #8#
                                                    (SPADCALL |p| |g|
                                                              (QREFELT % 94)))
                                              (QCDR #8#)
                                            (|check_union2| (QEQCAR #8# 0)
                                                            (QREFELT % 9)
                                                            (|Union|
                                                             (QREFELT % 9)
                                                             "failed")
                                                            #8#)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |newp| (QREFELT % 85))
                                       (PROGN
                                        (LETT #9# (CONS 1 "failed"))
                                        (GO #10#)))
                                      ('T
                                       (LETT |newleq|
                                             (CONS |newp| |newleq|)))))))
                                  ('T (LETT |newleq| (CONS |p| |newleq|))))))
                               (LETT #7# (CDR #7#)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |leq| |newleq|)))))
            (LETT |leq|
                  (SPADCALL (ELT % 16) (SPADCALL |leq| (QREFELT % 17))
                            (QREFELT % 19)))
            (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
          #10# (EXIT #9#)))) 

(SDEFUN |QCMPACK;prepareDecompose;LL2BL;20|
        ((|lp| (|List| P)) (|lts| (|List| TS)) (|b1| (|Boolean|))
         (|b2| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |eq| #1=(|List| P)) (|:| |tower| TS)
                     (|:| |ineq| #2=(|List| P))))))
        (SPROG
         ((#3=#:G339 NIL) (#4=#:G340 NIL) (|p| NIL) (#5=#:G341 NIL)
          (|lsfp| (|List| P)) (|f| NIL) (#6=#:G342 NIL) (|branch| NIL)
          (#7=#:G343 NIL) (|ts| (TS))
          (|ubf1|
           #8=(|Union|
               (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                         (|:| |ineq| (|List| P)))
               "failed"))
          (|ubf2| #8#) (|leq| #1#) (|lineq| #2#) (|newBranch| #8#)
          (#9=#:G313 NIL)
          (|branches|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (|lq| (|List| P))
          (|toSee|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (#10=#:G344 NIL) (#11=#:G345 NIL))
         (SEQ
          (LETT |lp|
                (SPADCALL (ELT % 16)
                          (SPADCALL (ELT % 67)
                                    (|QCMPACK;removeAssociates| |lp| %)
                                    (QREFELT % 84))
                          (QREFELT % 19)))
          (EXIT
           (COND
            ((OR (SPADCALL (ELT % 85) |lp| (QREFELT % 86)) (NULL |lts|)) NIL)
            ('T
             (SEQ (COND (|b1| (LETT |lts| (SPADCALL |lts| (QREFELT % 81)))))
                  (EXIT
                   (COND
                    (|b2|
                     (SEQ (LETT |lq| NIL)
                          (LETT |toSee|
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT #4# |lts|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |ts| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (VECTOR |lq| |ts|
                                                       (|QCMPACK;squareFreeFactors|
                                                        (SPADCALL |ts|
                                                                  (QREFELT %
                                                                           68))
                                                        %))
                                               #3#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (EXIT
                           (COND ((NULL |lp|) |toSee|)
                                 (#12='T
                                  (SEQ
                                   (SEQ (LETT |p| NIL) (LETT #5# |lp|) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN (LETT |p| (CAR #5#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |lsfp|
                                               (SPADCALL |p| (QREFELT % 13)))
                                         (LETT |branches| NIL) (LETT |lq| NIL)
                                         (SEQ (LETT |f| NIL) (LETT #6# |lsfp|)
                                              G190
                                              (COND
                                               ((OR (ATOM #6#)
                                                    (PROGN
                                                     (LETT |f| (CAR #6#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ (LETT |branch| NIL)
                                                    (LETT #7# |toSee|) G190
                                                    (COND
                                                     ((OR (ATOM #7#)
                                                          (PROGN
                                                           (LETT |branch|
                                                                 (CAR #7#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |leq|
                                                           (QVELT |branch| 0))
                                                     (LETT |ts|
                                                           (QVELT |branch| 1))
                                                     (LETT |lineq|
                                                           (QVELT |branch| 2))
                                                     (LETT |ubf1|
                                                           (SPADCALL |leq| |ts|
                                                                     |lq| NIL
                                                                     NIL 'T 'T
                                                                     'T
                                                                     (QREFELT %
                                                                              97)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |ubf1| 1)
                                                        "leave")
                                                       ('T
                                                        (SEQ
                                                         (LETT |ubf2|
                                                               (SPADCALL
                                                                (LIST |f|) |ts|
                                                                |lineq| NIL NIL
                                                                'T 'T 'T
                                                                (QREFELT %
                                                                         97)))
                                                         (EXIT
                                                          (COND
                                                           ((QEQCAR |ubf2| 1)
                                                            "leave")
                                                           ('T
                                                            (SEQ
                                                             (LETT |leq|
                                                                   (SPADCALL
                                                                    (ELT % 16)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf1|)
                                                                       0)
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf2|)
                                                                       0)
                                                                      (QREFELT
                                                                       % 14))
                                                                     (QREFELT %
                                                                              17))
                                                                    (QREFELT %
                                                                             19)))
                                                             (LETT |lineq|
                                                                   (SPADCALL
                                                                    (ELT % 16)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf1|)
                                                                       2)
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf2|)
                                                                       2)
                                                                      (QREFELT
                                                                       % 14))
                                                                     (QREFELT %
                                                                              17))
                                                                    (QREFELT %
                                                                             19)))
                                                             (LETT |newBranch|
                                                                   (SPADCALL
                                                                    |leq| |ts|
                                                                    |lineq| NIL
                                                                    NIL NIL NIL
                                                                    NIL
                                                                    (QREFELT %
                                                                             97)))
                                                             (EXIT
                                                              (LETT |branches|
                                                                    (CONS
                                                                     (PROG2
                                                                         (LETT
                                                                          #9#
                                                                          |newBranch|)
                                                                         (QCDR
                                                                          #9#)
                                                                       (|check_union2|
                                                                        (QEQCAR
                                                                         #9# 0)
                                                                        (|Record|
                                                                         (|:|
                                                                          |eq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            %
                                                                            9)))
                                                                         (|:|
                                                                          |tower|
                                                                          (QREFELT
                                                                           %
                                                                           10))
                                                                         (|:|
                                                                          |ineq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            %
                                                                            9))))
                                                                        (|Union|
                                                                         (|Record|
                                                                          (|:|
                                                                           |eq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             %
                                                                             9)))
                                                                          (|:|
                                                                           |tower|
                                                                           (QREFELT
                                                                            %
                                                                            10))
                                                                          (|:|
                                                                           |ineq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             %
                                                                             9))))
                                                                         "failed")
                                                                        #9#))
                                                                     |branches|))))))))))))
                                                    (LETT #7# (CDR #7#))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |lq| (CONS |f| |lq|))))
                                              (LETT #6# (CDR #6#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (EXIT (LETT |toSee| |branches|)))
                                        (LETT #5# (CDR #5#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (SPADCALL
                                     (CONS
                                      #'|QCMPACK;prepareDecompose;LL2BL;20!0|
                                      %)
                                     |toSee| (QREFELT % 100)))))))))
                    (#12#
                     (PROGN
                      (LETT #10# NIL)
                      (SEQ (LETT #11# |lts|) G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |ts| (CAR #11#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #10#
                                   (CONS
                                    (VECTOR |lp| |ts|
                                            (|QCMPACK;squareFreeFactors|
                                             (SPADCALL |ts| (QREFELT % 68)) %))
                                    #10#))))
                           (LETT #11# (CDR #11#)) (GO G190) G191
                           (EXIT (NREVERSE #10#)))))))))))))) 

(SDEFUN |QCMPACK;prepareDecompose;LL2BL;20!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (QVELT |x| 1) (QVELT |y| 1) (QREFELT % 37))) 

(DECLAIM (NOTINLINE |QuasiComponentPackage;|)) 

(DEFUN |QuasiComponentPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|QuasiComponentPackage| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 102))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|QuasiComponentPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |QuasiComponentPackage| (&REST #1=#:G346)
  (SPROG NIL
         (PROG (#2=#:G347)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|QuasiComponentPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |QuasiComponentPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|QuasiComponentPackage|)))))))))) 

(MAKEPROP '|QuasiComponentPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 9)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (0 . |squareFreeFactors|) (5 . |concat|) (|Boolean|)
              (11 . |infRittWu?|) (17 . |removeDuplicates|) (|Mapping| 15 9 9)
              (22 . |sort|) (|Void|)
              (|Record| (|:| |left| 10) (|:| |right| 10))
              (|TabulatedComputationPackage| 21 15) (28 . |initTable!|)
              (|String|) (32 . |empty?|) (37 . |printInfo!|)
              (43 . |startStats!|) (48 . |void|) |QCMPACK;startTable!;3SV;2|
              (52 . |makingStats?|) (56 . |printStats!|) (60 . |clearTable!|)
              |QCMPACK;stopTable!;V;3| (|NonNegativeInteger|) (64 . |#|)
              (69 . |members|) |QCMPACK;supDimElseRittWu?;2TSB;4| (|List| 10)
              (74 . |removeDuplicates|) (|Mapping| 15 10 10) (79 . |sort|)
              |QCMPACK;algebraicSort;2L;5| (85 . |empty?|) (90 . |mvar|)
              (95 . |algebraic?|) |QCMPACK;moreAlgebraic?;2TSB;6|
              (101 . |mvar|) (106 . >) (112 . <) (|Union| % '#1="failed")
              (118 . |rest|) |QCMPACK;subTriSet?;2TSB;7| (|Union| 9 '#1#)
              (123 . |first|) (128 . =) (134 . |associates?|)
              |QCMPACK;internalSubPolSet?;2LB;8| |QCMPACK;subPolSet?;2LB;9|
              |QCMPACK;internalInfRittWu?;2LB;11| |QCMPACK;infRittWu?;2LB;10|
              |QCMPACK;subQuasiComponent?;2TSB;14|
              (|Record| (|:| |val| 11) (|:| |tower| 10))
              |QCMPACK;subCase?;2RB;12| (140 . |mdeg|) (145 . |select|)
              (151 . |initiallyReduce|) (157 . |zero?|) (162 . |initials|)
              (167 . |invertible?|) (|Union| 15 '"failed")
              |QCMPACK;internalSubQuasiComponent?;2TSU;13|
              (173 . |extractIfCan|) (178 . |insert!|)
              |QCMPACK;subQuasiComponent?;TSLB;15| (|Mapping| 15 62 62)
              (|List| 62) (184 . |sort|) (190 . |setrest!|)
              |QCMPACK;removeSuperfluousCases;2L;16| (196 . |setrest!|)
              |QCMPACK;removeSuperfluousQuasiComponents;2L;17|
              (202 . |primitivePart|) (|Mapping| 15 9) (207 . |remove|)
              (213 . |ground?|) (218 . |any?|) (224 . |removeRedundantFactors|)
              (|GeneralPolynomialSet| 6 7 8 9) (229 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (234 . |remainder|) (240 . =) (246 . |gcd|) (252 . |exquo|)
              (|Record| (|:| |eq| 11) (|:| |tower| 10) (|:| |ineq| 11))
              (|Union| 95 '"failed") |QCMPACK;branchIfCan;LTSL5BU;19|
              (|Mapping| 15 95 95) (|List| 95) (258 . |sort|)
              |QCMPACK;prepareDecompose;LL2BL;20|)
           '#(|supDimElseRittWu?| 264 |subTriSet?| 270 |subQuasiComponent?| 276
              |subPolSet?| 288 |subCase?| 294 |stopTable!| 300 |startTable!|
              304 |removeSuperfluousQuasiComponents| 311
              |removeSuperfluousCases| 316 |prepareDecompose| 321
              |moreAlgebraic?| 329 |internalSubQuasiComponent?| 335
              |internalSubPolSet?| 341 |internalInfRittWu?| 347 |infRittWu?|
              353 |branchIfCan| 359 |algebraicSort| 371)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|startTable!|
                                 ((|Void|) (|String|) (|String|) (|String|)))
                                T)
                              '((|stopTable!| ((|Void|))) T)
                              '((|supDimElseRittWu?| ((|Boolean|) |#5| |#5|))
                                T)
                              '((|algebraicSort| ((|List| |#5|) (|List| |#5|)))
                                T)
                              '((|moreAlgebraic?| ((|Boolean|) |#5| |#5|)) T)
                              '((|subTriSet?| ((|Boolean|) |#5| |#5|)) T)
                              '((|subPolSet?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalSubPolSet?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalInfRittWu?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|infRittWu?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalSubQuasiComponent?|
                                 ((|Union| (|Boolean|) "failed") |#5| |#5|))
                                T)
                              '((|subQuasiComponent?| ((|Boolean|) |#5| |#5|))
                                T)
                              '((|subQuasiComponent?|
                                 ((|Boolean|) |#5| (|List| |#5|)))
                                T)
                              '((|removeSuperfluousQuasiComponents|
                                 ((|List| |#5|) (|List| |#5|)))
                                T)
                              '((|subCase?|
                                 ((|Boolean|)
                                  (|Record| (|:| |val| (|List| |#4|))
                                            (|:| |tower| |#5|))
                                  (|Record| (|:| |val| (|List| |#4|))
                                            (|:| |tower| |#5|))))
                                T)
                              '((|removeSuperfluousCases|
                                 ((|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))
                                  (|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))))
                                T)
                              '((|prepareDecompose|
                                 ((|List|
                                   (|Record| (|:| |eq| (|List| |#4|))
                                             (|:| |tower| |#5|)
                                             (|:| |ineq| (|List| |#4|))))
                                  (|List| |#4|) (|List| |#5|) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|branchIfCan|
                                 ((|Union|
                                   (|Record| (|:| |eq| (|List| |#4|))
                                             (|:| |tower| |#5|)
                                             (|:| |ineq| (|List| |#4|)))
                                   "failed")
                                  (|List| |#4|) |#5| (|List| |#4|) (|Boolean|)
                                  (|Boolean|) (|Boolean|) (|Boolean|)
                                  (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 101
                                            '(1 12 11 9 13 2 11 0 0 0 14 2 9 15
                                              0 0 16 1 11 0 0 17 2 11 0 18 0 19
                                              0 22 20 23 1 24 15 0 25 2 22 20
                                              24 24 26 1 22 20 24 27 0 20 0 28
                                              0 22 15 30 0 22 20 31 0 22 20 32
                                              1 10 34 0 35 1 10 11 0 36 1 38 0
                                              0 39 2 38 0 40 0 41 1 10 15 0 43
                                              1 9 8 0 44 2 10 15 8 0 45 1 10 8
                                              0 47 2 8 15 0 0 48 2 8 15 0 0 49
                                              1 10 50 0 51 1 10 53 0 54 2 9 15
                                              0 0 55 2 9 15 0 0 56 1 9 34 0 64
                                              2 10 53 0 8 65 2 10 9 9 0 66 1 9
                                              15 0 67 1 10 11 0 68 2 10 15 9 0
                                              69 1 22 70 21 72 2 22 20 21 15 73
                                              2 76 0 75 0 77 2 76 0 0 0 78 2 38
                                              0 0 0 80 1 9 0 0 82 2 11 0 83 0
                                              84 1 9 15 0 85 2 11 15 83 0 86 1
                                              12 11 11 87 1 88 0 11 89 2 88 90
                                              9 0 91 2 8 15 0 0 92 2 9 0 0 0 93
                                              2 9 50 0 0 94 2 99 0 98 0 100 2 0
                                              15 10 10 37 2 0 15 10 10 52 2 0
                                              15 10 10 61 2 0 15 10 38 74 2 0
                                              15 11 11 58 2 0 15 62 62 63 0 0
                                              20 33 3 0 20 24 24 24 29 1 0 38
                                              38 81 1 0 76 76 79 4 0 99 11 38
                                              15 15 101 2 0 15 10 10 46 2 0 70
                                              10 10 71 2 0 15 11 11 57 2 0 15
                                              11 11 59 2 0 15 11 11 60 8 0 96
                                              11 10 11 15 15 15 15 15 97 1 0 38
                                              38 42)))))
           '|lookupComplete|)) 
