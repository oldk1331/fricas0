
(SDEFUN |DPOLCAT-;makeVariable;SM;1|
        ((|s| (S)) (% (|Mapping| A (|NonNegativeInteger|))))
        (SPROG NIL (CONS #'|DPOLCAT-;makeVariable;SM;1!0| (VECTOR % |s|)))) 

(SDEFUN |DPOLCAT-;makeVariable;SM;1!0| ((|n| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |s| |n| (QREFELT % 12)) (QREFELT % 13)))))) 

(SDEFUN |DPOLCAT-;differentiate;AMA;2|
        ((|p| (A)) (|d| (|Mapping| R R)) (% (A)))
        (SPROG
         ((|l| (|List| V)) (|u| (|Union| R "failed")) (|t| (A)) (|lc| (R))
          (#1=#:G39 NIL) (|v| NIL) (#2=#:G49 NIL) (#3=#:G43 (A)) (#4=#:G41 (A))
          (#5=#:G42 NIL) (|ans| (A)) (#6=#:G30 NIL))
         (SEQ (LETT |ans| (|spadConstant| % 16))
              (LETT |l| (SPADCALL |p| (QREFELT % 18)))
              (SEQ G190
                   (COND
                    ((NULL (QEQCAR (LETT |u| (SPADCALL |p| (QREFELT % 20))) 1))
                     (GO G191)))
                   (SEQ (LETT |t| (SPADCALL |p| (QREFELT % 21)))
                        (LETT |lc| (SPADCALL |t| (QREFELT % 22)))
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL |ans|
                                         (SPADCALL
                                          (SPADCALL (SPADCALL |lc| |d|)
                                                    (QREFELT % 23))
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |t| |lc|
                                                              (QREFELT % 25)))
                                              (QCDR #1#)
                                            (|check_union2| (QEQCAR #1# 0)
                                                            (QREFELT % 6)
                                                            (|Union|
                                                             (QREFELT % 6)
                                                             "failed")
                                                            #1#))
                                          (QREFELT % 26))
                                         (QREFELT % 27))
                               (PROGN
                                (LETT #5# NIL)
                                (SEQ (LETT |v| NIL) (LETT #2# |l|) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |v| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (SPADCALL
                                               (SPADCALL |t| |v|
                                                         (QREFELT % 28))
                                               (SPADCALL
                                                (SPADCALL |v| (QREFELT % 29))
                                                (QREFELT % 13))
                                               (QREFELT % 26)))
                                        (COND
                                         (#5#
                                          (LETT #4#
                                                (SPADCALL #4# #3#
                                                          (QREFELT % 27))))
                                         ('T
                                          (PROGN
                                           (LETT #4# #3#)
                                           (LETT #5# 'T)))))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#5# #4#) ('T (|spadConstant| % 16))))
                               (QREFELT % 27)))
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 30)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |ans|
                         (SPADCALL
                          (SPADCALL
                           (PROG2 (LETT #6# |u|)
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0) (QREFELT % 7)
                                             (|Union| (QREFELT % 7) "failed")
                                             #6#))
                           |d|)
                          (QREFELT % 23))
                         (QREFELT % 27)))))) 

(SDEFUN |DPOLCAT-;order;ANni;3| ((|p| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|v| NIL) (#1=#:G55 NIL) (#2=#:G52 #3=(|NonNegativeInteger|))
          (#4=#:G50 #3#) (#5=#:G51 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 34)) 0)
                (#6='T
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |v| NIL) (LETT #1# (SPADCALL |p| (QREFELT % 18)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2# (SPADCALL |v| (QREFELT % 35)))
                          (COND (#5# (LETT #4# (MAX #4# #2#)))
                                ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#5# #4#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |DPOLCAT-;order;ASNni;4|
        ((|p| (A)) (|s| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G64 NIL) (|v| NIL) (#2=#:G65 NIL)
          (|vv| (|List| #3=(|NonNegativeInteger|))) (#4=#:G0 NIL)
          (#5=#:G66 NIL) (#6=#:G60 #3#) (#7=#:G58 #3#) (#8=#:G59 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |p| (QREFELT % 34))
                (NULL
                 (LETT |vv|
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |v| NIL)
                             (LETT #2# (SPADCALL |p| (QREFELT % 18))) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |v| (QREFELT % 37)) |s|
                                           (QREFELT % 38))
                                 (LETT #1#
                                       (CONS (SPADCALL |v| (QREFELT % 35))
                                             #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))))
            0)
           ('T
            (PROGN
             (LETT #8# NIL)
             (SEQ (LETT #4# NIL) (LETT #5# |vv|) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT #4# (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #6# #4#)
                     (COND (#8# (LETT #7# (MAX #7# #6#)))
                           ('T (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#8# #7#) ('T (|IdentityError| '|max|))))))))) 

(SDEFUN |DPOLCAT-;degree;ASNni;5|
        ((|p| (A)) (|s| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|lp| NIL) (#1=#:G77 NIL) (#2=#:G78 NIL) (|v| NIL) (#3=#:G79 NIL)
          (|lv| (|List| V)) (#4=#:G1 NIL) (#5=#:G80 NIL)
          (#6=#:G72 #7=(|NonNegativeInteger|)) (#8=#:G70 #7#) (#9=#:G71 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |d| 0)
              (SEQ (LETT |lp| NIL) (LETT #1# (SPADCALL |p| (QREFELT % 41)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |lp| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lv|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |v| NIL)
                                (LETT #3# (SPADCALL |lp| (QREFELT % 18))) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |v| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL (SPADCALL |v| (QREFELT % 37)) |s|
                                              (QREFELT % 38))
                                    (LETT #2# (CONS |v| #2#))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                    (EXIT
                     (COND
                      ((NULL (NULL |lv|))
                       (LETT |d|
                             (MAX |d|
                                  (PROGN
                                   (LETT #9# NIL)
                                   (SEQ (LETT #4# NIL)
                                        (LETT #5#
                                              (SPADCALL |lp| |lv|
                                                        (QREFELT % 43)))
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN (LETT #4# (CAR #5#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #6# #4#)
                                           (COND (#9# (LETT #8# (+ #8# #6#)))
                                                 ('T
                                                  (PROGN
                                                   (LETT #8# #6#)
                                                   (LETT #9# 'T)))))))
                                        (LETT #5# (CDR #5#)) (GO G190) G191
                                        (EXIT NIL))
                                   (COND (#9# #8#) ('T 0)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |d|)))) 

(SDEFUN |DPOLCAT-;weights;AL;6| ((|p| (A)) (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|mp| (|List| A)) (|lp| NIL) (#1=#:G93 NIL) (|lv| (|List| V))
          (|dv| (|List| (|NonNegativeInteger|))) (#2=#:G2 NIL) (#3=#:G95 NIL)
          (|d| NIL) (#4=#:G97 NIL) (|v| NIL) (#5=#:G96 NIL) (#6=#:G94 NIL)
          (#7=#:G86 #8=(|NonNegativeInteger|)) (#9=#:G84 #8#) (#10=#:G85 NIL)
          (|w| #8#) (|ws| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ws| NIL)
              (EXIT
               (COND ((NULL (LETT |mp| (SPADCALL |p| (QREFELT % 41)))) |ws|)
                     ('T
                      (SEQ
                       (SEQ (LETT |lp| NIL) (LETT #1# |mp|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |lp| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ (LETT |lv| (SPADCALL |lp| (QREFELT % 18)))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |lv|))
                                    (SEQ
                                     (LETT |dv|
                                           (SPADCALL |lp| |lv| (QREFELT % 43)))
                                     (LETT |w|
                                           (PROGN
                                            (LETT #10# NIL)
                                            (SEQ (LETT #2# NIL)
                                                 (LETT #6#
                                                       (PROGN
                                                        (LETT #3# NIL)
                                                        (SEQ (LETT |d| NIL)
                                                             (LETT #4# |dv|)
                                                             (LETT |v| NIL)
                                                             (LETT #5# |lv|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT |v|
                                                                          (CAR
                                                                           #5#))
                                                                    NIL)
                                                                   (ATOM #4#)
                                                                   (PROGN
                                                                    (LETT |d|
                                                                          (CAR
                                                                           #4#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #3#
                                                                     (CONS
                                                                      (*
                                                                       (SPADCALL
                                                                        |v|
                                                                        (QREFELT
                                                                         % 45))
                                                                       |d|)
                                                                      #3#))))
                                                             (LETT #5#
                                                                   (PROG1
                                                                       (CDR
                                                                        #5#)
                                                                     (LETT #4#
                                                                           (CDR
                                                                            #4#))))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #3#)))))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #6#)
                                                       (PROGN
                                                        (LETT #2# (CAR #6#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #7# #2#)
                                                    (COND
                                                     (#10#
                                                      (LETT #9# (+ #9# #7#)))
                                                     ('T
                                                      (PROGN
                                                       (LETT #9# #7#)
                                                       (LETT #10# 'T)))))))
                                                 (LETT #6# (CDR #6#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (COND (#10# #9#) ('T 0))))
                                     (EXIT
                                      (LETT |ws|
                                            (SPADCALL |ws| |w|
                                                      (QREFELT % 46)))))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |ws|)))))))) 

(SDEFUN |DPOLCAT-;weight;ANni;7| ((|p| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|ws| (|List| #1=(|NonNegativeInteger|))) (#2=#:G3 NIL)
          (#3=#:G103 NIL) (#4=#:G100 #1#) (#5=#:G98 #1#) (#6=#:G99 NIL))
         (SEQ
          (COND ((NULL (LETT |ws| (SPADCALL |p| (QREFELT % 48)))) 0)
                (#7='T
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT #2# NIL) (LETT #3# |ws|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT #2# (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# #2#)
                          (COND (#6# (LETT #5# (MAX #5# #4#)))
                                ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (COND (#6# #5#) (#7# (|IdentityError| '|max|))))))))) 

(SDEFUN |DPOLCAT-;weights;ASL;8|
        ((|p| (A)) (|s| (S)) (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|mp| (|List| A)) (|lp| NIL) (#1=#:G118 NIL) (#2=#:G119 NIL)
          (#3=#:G120 NIL) (|lv| (|List| V))
          (|dv| (|List| (|NonNegativeInteger|))) (#4=#:G4 NIL) (#5=#:G122 NIL)
          (|d| NIL) (#6=#:G124 NIL) (|v| NIL) (#7=#:G123 NIL) (#8=#:G121 NIL)
          (#9=#:G111 #10=(|NonNegativeInteger|)) (#11=#:G109 #10#)
          (#12=#:G110 NIL) (|w| #10#) (|ws| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ws| NIL)
              (EXIT
               (COND ((NULL (LETT |mp| (SPADCALL |p| (QREFELT % 41)))) |ws|)
                     ('T
                      (SEQ
                       (SEQ (LETT |lp| NIL) (LETT #1# |mp|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |lp| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |lv|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |v| NIL)
                                         (LETT #3#
                                               (SPADCALL |lp| (QREFELT % 18)))
                                         G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |v| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |v| (QREFELT % 37)) |s|
                                              (QREFELT % 38))
                                             (LETT #2# (CONS |v| #2#))))))
                                         (LETT #3# (CDR #3#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#)))))
                             (EXIT
                              (COND
                               ((NULL (NULL |lv|))
                                (SEQ
                                 (LETT |dv|
                                       (SPADCALL |lp| |lv| (QREFELT % 43)))
                                 (LETT |w|
                                       (PROGN
                                        (LETT #12# NIL)
                                        (SEQ (LETT #4# NIL)
                                             (LETT #8#
                                                   (PROGN
                                                    (LETT #5# NIL)
                                                    (SEQ (LETT |d| NIL)
                                                         (LETT #6# |dv|)
                                                         (LETT |v| NIL)
                                                         (LETT #7# |lv|) G190
                                                         (COND
                                                          ((OR (ATOM #7#)
                                                               (PROGN
                                                                (LETT |v|
                                                                      (CAR
                                                                       #7#))
                                                                NIL)
                                                               (ATOM #6#)
                                                               (PROGN
                                                                (LETT |d|
                                                                      (CAR
                                                                       #6#))
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #5#
                                                                 (CONS
                                                                  (*
                                                                   (SPADCALL
                                                                    |v|
                                                                    (QREFELT %
                                                                             45))
                                                                   |d|)
                                                                  #5#))))
                                                         (LETT #7#
                                                               (PROG1 (CDR #7#)
                                                                 (LETT #6#
                                                                       (CDR
                                                                        #6#))))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #5#)))))
                                             G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT #4# (CAR #8#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #9# #4#)
                                                (COND
                                                 (#12#
                                                  (LETT #11# (+ #11# #9#)))
                                                 ('T
                                                  (PROGN
                                                   (LETT #11# #9#)
                                                   (LETT #12# 'T)))))))
                                             (LETT #8# (CDR #8#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (COND (#12# #11#) ('T 0))))
                                 (EXIT
                                  (LETT |ws|
                                        (SPADCALL |ws| |w|
                                                  (QREFELT % 46)))))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |ws|)))))))) 

(SDEFUN |DPOLCAT-;weight;ASNni;9|
        ((|p| (A)) (|s| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|ws| (|List| #1=(|NonNegativeInteger|))) (#2=#:G5 NIL)
          (#3=#:G130 NIL) (#4=#:G127 #1#) (#5=#:G125 #1#) (#6=#:G126 NIL))
         (SEQ
          (COND ((NULL (LETT |ws| (SPADCALL |p| |s| (QREFELT % 51)))) 0)
                (#7='T
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT #2# NIL) (LETT #3# |ws|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT #2# (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# #2#)
                          (COND (#6# (LETT #5# (MAX #5# #4#)))
                                ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (COND (#6# #5#) (#7# (|IdentityError| '|max|))))))))) 

(SDEFUN |DPOLCAT-;isobaric?;AB;10| ((|p| (A)) (% (|Boolean|)))
        (EQL
         (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 48)) (QREFELT % 53))
                   (QREFELT % 54))
         1)) 

(SDEFUN |DPOLCAT-;leader;AV;11| ((|p| (A)) (% (V)))
        (SPROG
         ((|vl| (|List| V)) (#1=#:G6 NIL) (#2=#:G137 NIL) (#3=#:G134 (V))
          (#4=#:G132 (V)) (#5=#:G133 NIL))
         (SEQ (LETT |vl| (SPADCALL |p| (QREFELT % 18)))
              (EXIT
               (COND ((NULL |vl|) (|error| "leader is not defined "))
                     (#6='T
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT #1# NIL) (LETT #2# |vl|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT #1# (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #3# #1#)
                               (COND
                                (#5#
                                 (LETT #4# (SPADCALL #4# #3# (QREFELT % 56))))
                                ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                       (COND (#5# #4#) (#6# (|IdentityError| '|max|)))))))))) 

(SDEFUN |DPOLCAT-;initial;2A;12| ((|p| (A)) (% (A)))
        (SPADCALL (SPADCALL |p| (SPADCALL |p| (QREFELT % 58)) (QREFELT % 60))
                  (QREFELT % 62))) 

(SDEFUN |DPOLCAT-;separant;2A;13| ((|p| (A)) (% (A)))
        (SPADCALL |p| (SPADCALL |p| (QREFELT % 58)) (QREFELT % 28))) 

(SDEFUN |DPOLCAT-;coerce;SA;14| ((|s| (S)) (% (A)))
        (SPADCALL (SPADCALL |s| (QREFELT % 65)) (QREFELT % 13))) 

(SDEFUN |DPOLCAT-;retractIfCan;AU;15| ((|p| (A)) (% (|Union| S "failed")))
        (SPROG ((|v| (|Union| V "failed")))
               (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 68)))
                    (EXIT
                     (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |v|) (QREFELT % 70)))))))) 

(SDEFUN |DPOLCAT-;differentialVariables;AL;16| ((|p| (A)) (% (|List| S)))
        (SPROG ((#1=#:G158 NIL) (|v| NIL) (#2=#:G159 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |v| NIL) (LETT #2# (SPADCALL |p| (QREFELT % 18)))
                       G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1# (CONS (SPADCALL |v| (QREFELT % 37)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 73))))) 

(SDEFUN |DPOLCAT-;makeVariable;AM;17|
        ((|p| (A)) (% (|Mapping| A (|NonNegativeInteger|))))
        (SPROG NIL (CONS #'|DPOLCAT-;makeVariable;AM;17!0| (VECTOR % |p|)))) 

(SDEFUN |DPOLCAT-;makeVariable;AM;17!0| ((|n| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |p| |n| (QREFELT % 75)))))) 

(SDEFUN |DPOLCAT-;eval;ALLA;18|
        ((|p| (A)) (|sl| (|List| S)) (|rl| (|List| R)) (% (A)))
        (SPROG
         ((|ordp| (|NonNegativeInteger|)) (#1=#:G181 NIL) (|s| NIL)
          (#2=#:G182 NIL) (#3=#:G183 NIL) (|j| NIL) (#4=#:G184 NIL)
          (|vl| (|List| V)) (|r| NIL) (#5=#:G185 NIL) (#6=#:G186 NIL) (|i| NIL)
          (#7=#:G187 NIL) (|t| (R)) (|rrl| (|List| R)))
         (SEQ (LETT |ordp| (SPADCALL |p| (QREFELT % 77)))
              (LETT |vl|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |s| NIL) (LETT #2# |sl|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (PROGN
                                     (LETT #3# NIL)
                                     (SEQ (LETT |j| 0) (LETT #4# |ordp|) G190
                                          (COND
                                           ((|greater_SI| |j| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL |s| |j|
                                                             (QREFELT % 12))
                                                   #3#))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT (NREVERSE #3#))))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 78)))
              (LETT |rrl| NIL)
              (SEQ (LETT |r| NIL) (LETT #5# |rl|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |r| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |t| |r|)
                        (EXIT
                         (LETT |rrl|
                               (SPADCALL |rrl|
                                         (CONS |r|
                                               (PROGN
                                                (LETT #6# NIL)
                                                (SEQ (LETT |i| 1)
                                                     (LETT #7# |ordp|) G190
                                                     (COND
                                                      ((|greater_SI| |i| #7#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #6#
                                                             (CONS
                                                              (LETT |t|
                                                                    (SPADCALL
                                                                     |t|
                                                                     (QREFELT %
                                                                              79)))
                                                              #6#))))
                                                     (LETT |i| (|inc_SI| |i|))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #6#)))))
                                         (QREFELT % 81)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |p| |vl| |rrl| (QREFELT % 82)))))) 

(SDEFUN |DPOLCAT-;eval;ALLA;19|
        ((|p| (A)) (|sl| (|List| S)) (|rl| (|List| A)) (% (A)))
        (SPROG
         ((|ordp| (|NonNegativeInteger|)) (#1=#:G207 NIL) (|s| NIL)
          (#2=#:G208 NIL) (#3=#:G209 NIL) (|j| NIL) (#4=#:G210 NIL)
          (|vl| (|List| V)) (|r| NIL) (#5=#:G211 NIL) (#6=#:G212 NIL) (|i| NIL)
          (#7=#:G213 NIL) (|t| (A)) (|rrl| (|List| A)))
         (SEQ (LETT |ordp| (SPADCALL |p| (QREFELT % 77)))
              (LETT |vl|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |s| NIL) (LETT #2# |sl|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (PROGN
                                     (LETT #3# NIL)
                                     (SEQ (LETT |j| 0) (LETT #4# |ordp|) G190
                                          (COND
                                           ((|greater_SI| |j| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL |s| |j|
                                                             (QREFELT % 12))
                                                   #3#))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT (NREVERSE #3#))))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 78)))
              (LETT |rrl| NIL)
              (SEQ (LETT |r| NIL) (LETT #5# |rl|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |r| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |t| |r|)
                        (EXIT
                         (LETT |rrl|
                               (SPADCALL |rrl|
                                         (CONS |r|
                                               (PROGN
                                                (LETT #6# NIL)
                                                (SEQ (LETT |i| 1)
                                                     (LETT #7# |ordp|) G190
                                                     (COND
                                                      ((|greater_SI| |i| #7#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #6#
                                                             (CONS
                                                              (LETT |t|
                                                                    (SPADCALL
                                                                     |t|
                                                                     (QREFELT %
                                                                              84)))
                                                              #6#))))
                                                     (LETT |i| (|inc_SI| |i|))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #6#)))))
                                         (QREFELT % 86)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |p| |vl| |rrl| (QREFELT % 87)))))) 

(SDEFUN |DPOLCAT-;eval;ALA;20|
        ((|p| (A)) (|l| (|List| (|Equation| A))) (% (A)))
        (SPROG
         ((#1=#:G219 NIL) (#2=#:G220 NIL) (#3=#:G221 NIL) (|e| NIL)
          (#4=#:G222 NIL))
         (SEQ
          (SPADCALL |p|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |e| NIL) (LETT #2# |l|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |e| (QREFELT % 90))
                                             (QREFELT % 91))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |e| NIL) (LETT #4# |l|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |e| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (SPADCALL |e| (QREFELT % 92)) #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT % 93))))) 

(DECLAIM (NOTINLINE |DifferentialPolynomialCategory&;|)) 

(DEFUN |DifferentialPolynomialCategory&| (|#1| |#2| |#3| |#4| |#5|)
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
          (LIST '|DifferentialPolynomialCategory&| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 104))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|DifferentialRing|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#2| '(|IntegralDomain|))
      (QSETREFV % 32
                (CONS (|dispatchFunction| |DPOLCAT-;differentiate;AMA;2|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 76
                 (CONS (|dispatchFunction| |DPOLCAT-;makeVariable;AM;17|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |DPOLCAT-;eval;ALLA;18|) %))
       (QSETREFV % 88 (CONS (|dispatchFunction| |DPOLCAT-;eval;ALLA;19|) %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |DPOLCAT-;eval;ALA;20|) %)))))
    %))) 

(MAKEPROP '|DifferentialPolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |makeVariable|) (6 . |coerce|)
              (|Mapping| % 11) |DPOLCAT-;makeVariable;SM;1| (11 . |0|)
              (|List| 9) (15 . |variables|) (|Union| 7 '#1="failed")
              (20 . |retractIfCan|) (25 . |leadingMonomial|)
              (30 . |leadingCoefficient|) (35 . |coerce|) (|Union| % '"failed")
              (40 . |exquo|) (46 . *) (52 . +) (58 . |differentiate|)
              (64 . |differentiate|) (69 . |reductum|) (|Mapping| 7 7)
              (74 . |differentiate|) (|Boolean|) (80 . |ground?|)
              (85 . |order|) |DPOLCAT-;order;ANni;3| (90 . |variable|) (95 . =)
              |DPOLCAT-;order;ASNni;4| (|List| %) (101 . |monomials|)
              (|List| 11) (106 . |degree|) |DPOLCAT-;degree;ASNni;5|
              (112 . |weight|) (117 . |concat|) |DPOLCAT-;weights;AL;6|
              (123 . |weights|) |DPOLCAT-;weight;ANni;7|
              |DPOLCAT-;weights;ASL;8| (128 . |weights|)
              |DPOLCAT-;weight;ASNni;9| (134 . |removeDuplicates|) (139 . |#|)
              |DPOLCAT-;isobaric?;AB;10| (144 . |max|) |DPOLCAT-;leader;AV;11|
              (150 . |leader|) (|SparseUnivariatePolynomial| %)
              (155 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (161 . |leadingCoefficient|) |DPOLCAT-;initial;2A;12|
              |DPOLCAT-;separant;2A;13| (166 . |coerce|)
              |DPOLCAT-;coerce;SA;14| (|Union| 9 '#1#) (171 . |retractIfCan|)
              (|Union| 8 '#1#) (176 . |retractIfCan|)
              |DPOLCAT-;retractIfCan;AU;15| (|List| 8)
              (181 . |removeDuplicates|) |DPOLCAT-;differentialVariables;AL;16|
              (186 . |differentiate|) (192 . |makeVariable|) (197 . |order|)
              (202 . |concat|) (207 . |differentiate|) (|List| 7)
              (212 . |concat|) (218 . |eval|) (225 . |eval|)
              (232 . |differentiate|) (|List| 6) (237 . |concat|)
              (243 . |eval|) (250 . |eval|) (|Equation| 6) (257 . |lhs|)
              (262 . |retract|) (267 . |rhs|) (272 . |eval|) (|List| 103)
              (279 . |eval|) (|OutputForm|) (|Fraction| 102) (|Union| 102 '#1#)
              (|Union| 97 '#1#) (|Symbol|) (|List| 100) (|Integer|)
              (|Equation| %))
           '#(|weights| 285 |weight| 296 |separant| 307 |retractIfCan| 312
              |order| 317 |makeVariable| 328 |leader| 338 |isobaric?| 343
              |initial| 348 |eval| 353 |differentiate| 373
              |differentialVariables| 379 |degree| 384 |coerce| 390)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|eval|
                                 (|#1| |#1| (|List| |#3|) (|List| |#2|)))
                                T)
                              '((|eval| (|#1| |#1| |#3| |#2|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#3|) (|List| |#1|)))
                                T)
                              '((|eval| (|#1| |#1| |#3| |#1|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                T)
                              '((|eval| (|#1| |#1| |#1| |#1|)) T)
                              '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                              '((|eval| (|#1| |#1| (|List| (|Equation| |#1|))))
                                T)
                              '((|makeVariable|
                                 ((|Mapping| |#1| (|NonNegativeInteger|))
                                  |#1|))
                                T)
                              '((|separant| (|#1| |#1|)) T)
                              '((|initial| (|#1| |#1|)) T)
                              '((|leader| (|#4| |#1|)) T)
                              '((|isobaric?| ((|Boolean|) |#1|)) T)
                              '((|weight| ((|NonNegativeInteger|) |#1| |#3|))
                                T)
                              '((|weights|
                                 ((|List| (|NonNegativeInteger|)) |#1| |#3|))
                                T)
                              '((|weight| ((|NonNegativeInteger|) |#1|)) T)
                              '((|weights|
                                 ((|List| (|NonNegativeInteger|)) |#1|))
                                T)
                              '((|degree| ((|NonNegativeInteger|) |#1| |#3|))
                                T)
                              '((|order| ((|NonNegativeInteger|) |#1|)) T)
                              '((|order| ((|NonNegativeInteger|) |#1| |#3|)) T)
                              '((|differentialVariables| ((|List| |#3|) |#1|))
                                T)
                              '((|makeVariable|
                                 ((|Mapping| |#1| (|NonNegativeInteger|))
                                  |#3|))
                                T)
                              '((|coerce| (|#1| |#3|)) T)
                              '((|retractIfCan| ((|Union| |#3| #1#) |#1|)) T)
                              '((|coerce| (|#1| (|Integer|))) T)
                              '((|differentiate|
                                 (|#1| |#1| (|Mapping| |#2| |#2|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|Mapping| |#2| |#2|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|List| (|Symbol|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|Symbol|) (|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|List| (|Symbol|))))
                                T)
                              '((|differentiate| (|#1| |#1| (|Symbol|))) T)
                              '((|differentiate|
                                 (|#1| |#1| (|NonNegativeInteger|)))
                                T)
                              '((|differentiate| (|#1| |#1|)) T)
                              '((|coerce| (|#1| |#4|)) T)
                              '((|retractIfCan| ((|Union| |#4| #1#) |#1|)) T)
                              '((|differentiate| (|#1| |#1| |#4|)) T)
                              '((|differentiate| (|#1| |#1| (|List| |#4|))) T)
                              '((|differentiate|
                                 (|#1| |#1| |#4| (|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|List| |#4|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|coerce| (|#1| |#1|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#4|) (|List| |#1|)))
                                T)
                              '((|eval| (|#1| |#1| |#4| |#1|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#4|) (|List| |#2|)))
                                T)
                              '((|eval| (|#1| |#1| |#4| |#2|)) T)
                              '((|degree|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|List| |#4|)))
                                T)
                              '((|degree| ((|NonNegativeInteger|) |#1| |#4|))
                                T)
                              '((|coerce| (|#1| |#2|)) T)
                              '((|retractIfCan| ((|Union| |#2| #1#) |#1|)) T)
                              '((|retractIfCan|
                                 ((|Union| (|Fraction| (|Integer|)) #1#) |#1|))
                                T)
                              '((|coerce| (|#1| (|Fraction| (|Integer|)))) T)
                              '((|retractIfCan|
                                 ((|Union| (|Integer|) #1#) |#1|))
                                T)
                              '((|degree| (|#5| |#1|)) T)
                              '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 95
                                            '(2 9 0 8 11 12 1 6 0 9 13 0 6 0 16
                                              1 6 17 0 18 1 6 19 0 20 1 6 0 0
                                              21 1 6 7 0 22 1 6 0 7 23 2 6 24 0
                                              7 25 2 6 0 0 0 26 2 6 0 0 0 27 2
                                              6 0 0 9 28 1 9 0 0 29 1 6 0 0 30
                                              2 0 0 0 31 32 1 6 33 0 34 1 9 11
                                              0 35 1 9 8 0 37 2 8 33 0 0 38 1 6
                                              40 0 41 2 6 42 0 17 43 1 9 11 0
                                              45 2 42 0 0 11 46 1 6 42 0 48 2 6
                                              42 0 8 51 1 42 0 0 53 1 42 11 0
                                              54 2 9 0 0 0 56 1 6 9 0 58 2 6 59
                                              0 9 60 1 61 6 0 62 1 9 0 8 65 1 6
                                              67 0 68 1 9 69 0 70 1 72 0 0 73 2
                                              6 0 0 11 75 1 0 14 0 76 1 6 11 0
                                              77 1 17 0 40 78 1 7 0 0 79 2 80 0
                                              0 0 81 3 6 0 0 17 80 82 3 0 0 0
                                              72 80 83 1 6 0 0 84 2 85 0 0 0 86
                                              3 6 0 0 17 40 87 3 0 0 0 72 40 88
                                              1 89 6 0 90 1 6 8 0 91 1 89 6 0
                                              92 3 6 0 0 72 40 93 2 0 0 0 94 95
                                              1 0 42 0 47 2 0 42 0 8 50 1 0 11
                                              0 49 2 0 11 0 8 52 1 0 0 0 64 1 0
                                              69 0 71 2 0 11 0 8 39 1 0 11 0 36
                                              1 0 14 8 15 1 0 14 0 76 1 0 9 0
                                              57 1 0 33 0 55 1 0 0 0 63 2 0 0 0
                                              94 95 3 0 0 0 72 40 88 3 0 0 0 72
                                              80 83 2 0 0 0 31 32 1 0 72 0 74 2
                                              0 11 0 8 44 1 0 0 8 66)))))
           '|lookupComplete|)) 
