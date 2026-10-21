
(SDEFUN |TREE;coerce;%Of;1| ((|t| (%)) (% (|OutputForm|)))
        (SPADCALL |t| (QREFELT % 11))) 

(MAKEPROP '|TREE;empty?;%B;2| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(SDEFUN |TREE;empty?;%B;2| ((|t| (%)) (% (|Boolean|))) (QEQCAR |t| 1)) 

(MAKEPROP '|TREE;empty;%;3| '|SPADreplace| '(XLAM NIL (CONS 1 "empty"))) 

(SDEFUN |TREE;empty;%;3| ((% (%))) (CONS 1 "empty")) 

(SDEFUN |TREE;children;%L;4| ((|t| (%)) (% (|List| %)))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the children of an empty tree"))
         ('T (QCDR (CDR |t|))))) 

(SDEFUN |TREE;setchildren!;%L%;5| ((|t| (%)) (|lt| (|List| %)) (% (%)))
        (SEQ
         (COND
          ((QEQCAR |t| 1) (|error| "cannot set children of an empty tree"))
          ('T (SEQ (PROGN (RPLACD #1=(CDR |t|) |lt|) (QCDR #1#)) (EXIT |t|)))))) 

(SDEFUN |TREE;setvalue!;%2S;6| ((|t| (%)) (|s| (S)) (% (S)))
        (SEQ
         (COND ((QEQCAR |t| 1) (|error| "cannot set value of an empty tree"))
               ('T
                (SEQ (PROGN (RPLACA #1=(CDR |t|) |s|) (QCAR #1#))
                     (EXIT |s|)))))) 

(SDEFUN |TREE;count;S%Nni;7| ((|n| (S)) (|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G41 NIL) (#2=#:G36 #3=(|NonNegativeInteger|))
          (#4=#:G34 #3#) (#5=#:G35 NIL) (|i| #3#))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #1# (SPADCALL |t| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2# (SPADCALL |n| |c| (QREFELT % 21)))
                                 (COND (#5# (LETT #4# (+ #4# #2#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT % 22)) |n|
                               (QREFELT % 23))
                     (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;count;M%Nni;8|
        ((|fn| (|Mapping| (|Boolean|) S)) (|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G49 NIL) (#2=#:G44 #3=(|NonNegativeInteger|))
          (#4=#:G42 #3#) (#5=#:G43 NIL) (|i| #3#))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #1# (SPADCALL |t| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2# (SPADCALL |fn| |c| (QREFELT % 25)))
                                 (COND (#5# (LETT #4# (+ #4# #2#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT % 22)) |fn|) (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;map;M2%;9| ((|fn| (|Mapping| S S)) (|t| (%)) (% (%)))
        (SPROG ((#1=#:G55 NIL) (|c| NIL) (#2=#:G56 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT % 22)) |fn|)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #2# (SPADCALL |t| (QREFELT % 17)))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |c| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |fn| |c|
                                                          (QREFELT % 27))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 28))))))) 

(SDEFUN |TREE;map!;M2%;10| ((|fn| (|Mapping| S S)) (|t| (%)) (% (%)))
        (SPROG ((|c| NIL) (#1=#:G62 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SEQ
                        (SPADCALL |t|
                                  (SPADCALL (SPADCALL |t| (QREFELT % 22)) |fn|)
                                  (QREFELT % 19))
                        (SEQ (LETT |c| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT % 17))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT % 29))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |t|))))))) 

(SDEFUN |TREE;tree;SL%;11| ((|s| (S)) (|lt| (|List| %)) (% (%)))
        (CONS 0 (CONS |s| |lt|))) 

(SDEFUN |TREE;tree;S%;12| ((|s| (S)) (% (%))) (CONS 0 (CONS |s| NIL))) 

(SDEFUN |TREE;tree;L%;13| ((|ls| (|List| S)) (% (%)))
        (SPROG ((#1=#:G69 NIL) (|s| NIL) (#2=#:G70 NIL))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT % 15)))
                      ('T
                       (SPADCALL (|SPADfirst| |ls|)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |s| NIL) (LETT #2# (CDR |ls|))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |s| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |s| (QREFELT % 30))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 28))))))) 

(SDEFUN |TREE;value;%S;14| ((|t| (%)) (% (S)))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the value of an empty tree"))
         ('T (QCAR (CDR |t|))))) 

(SDEFUN |TREE;child?;2%B;15| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |t2| (QREFELT % 14)) NIL)
              ('T
               (SPADCALL |t1| (SPADCALL |t2| (QREFELT % 17)) (QREFELT % 34))))) 

(SDEFUN |TREE;distance1| ((|t1| (%)) (|t2| (%)) (% #1=(|Integer|)))
        (SPROG
         ((#2=#:G83 NIL) (|t| NIL) (#3=#:G84 NIL) (|n| #1#) (|u| (|List| #1#))
          (#4=#:G0 NIL) (#5=#:G85 NIL) (#6=#:G80 #1#) (#7=#:G78 #1#)
          (#8=#:G79 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT % 36)) 0) ((QEQCAR |t2| 1) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #3# (SPADCALL |t2| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |t| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>= (LETT |n| (|TREE;distance1| |t1| |t| %))
                                      0)
                                  (LETT #2# (CONS |n| #2#))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (COND
                    ((> (LENGTH |u|) 0)
                     (+ 1
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT #4# NIL) (LETT #5# |u|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #4# (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# #4#)
                                 (COND (#8# (LETT #7# (MIN #7# #6#)))
                                       ('T
                                        (PROGN
                                         (LETT #7# #6#)
                                         (LETT #8# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#8# #7#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |TREE;distance;2%I;17| ((|t1| (%)) (|t2| (%)) (% (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|TREE;distance1| |t1| |t2| %))
                    (EXIT
                     (COND ((>= |n| 0) |n|)
                           ('T (|TREE;distance1| |t2| |t1| %))))))) 

(SDEFUN |TREE;depth;%Nni;18| ((|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G95 NIL) (|ch| NIL) (#2=#:G96 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |t| (QREFELT % 14))
                      (SPADCALL |t| (QREFELT % 39)))
                  0)
                 ('T
                  (+ 1
                     (SPADCALL
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |ch| NIL)
                            (LETT #2# (SPADCALL |t| (QREFELT % 17))) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |ch| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS (SPADCALL |ch| (QREFELT % 40))
                                          #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      (QREFELT % 42)))))))) 

(SDEFUN |TREE;numberOfNodes;%2Nni;19|
        ((|t| (%)) (|d| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G109 NIL) (|ch| NIL) (#2=#:G110 NIL) (#3=#:G103 NIL))
               (SEQ
                (COND ((OR (SPADCALL |t| (QREFELT % 39)) (ZEROP |d|)) 1)
                      ('T
                       (SPADCALL (ELT % 44)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |ch| NIL)
                                       (LETT #2# (SPADCALL |t| (QREFELT % 17)))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |ch| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |ch|
                                                          (PROG1
                                                              (LETT #3#
                                                                    (- |d| 1))
                                                            (|check_subtype2|
                                                             (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                                          (QREFELT % 43))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 0 (QREFELT % 46))))))) 

(SDEFUN |TREE;node?;2%B;20| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (SPROG NIL
               (COND ((SPADCALL |t1| |t2| (QREFELT % 36)) 'T)
                     ((QEQCAR |t2| 1) NIL)
                     ('T
                      (SPADCALL (CONS #'|TREE;node?;2%B;20!0| (VECTOR % |t1|))
                                (SPADCALL |t2| (QREFELT % 17))
                                (QREFELT % 49)))))) 

(SDEFUN |TREE;node?;2%B;20!0| ((|t| NIL) ($$ NIL))
        (PROG (|t1| %)
          (LETT |t1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT % 47)))))) 

(SDEFUN |TREE;any?;M%B;21|
        ((|fn| (|Mapping| #1=(|Boolean|) S)) (|t| (%)) (% #1#))
        (SPROG ((|c| NIL) (#2=#:G126 NIL) (#3=#:G125 NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) NIL)
                       ((SPADCALL (SPADCALL |t| (QREFELT % 22)) |fn|) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |fn| |c| (QREFELT % 50))
                                  (PROGN (LETT #3# 'T) (GO #4=#:G124))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))
                #4# (EXIT #3#)))) 

(SDEFUN |TREE;every?;M%B;22|
        ((|fn| (|Mapping| #1=(|Boolean|) S)) (|t| (%)) (% #1#))
        (SPROG ((|c| NIL) (#2=#:G135 NIL) (#3=#:G134 NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) 'T)
                       ((NULL (SPADCALL (SPADCALL |t| (QREFELT % 22)) |fn|))
                        NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |fn| |c| (QREFELT % 51)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G133))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))
                #4# (EXIT #3#)))) 

(SDEFUN |TREE;member?;S%B;23| ((|n| (S)) (|t| (%)) (% (|Boolean|)))
        (SPROG NIL
               (COND ((QEQCAR |t| 1) NIL)
                     ((SPADCALL |n| (SPADCALL |t| (QREFELT % 22))
                                (QREFELT % 23))
                      'T)
                     ('T
                      (SPADCALL (CONS #'|TREE;member?;S%B;23!0| (VECTOR % |n|))
                                (SPADCALL |t| (QREFELT % 17))
                                (QREFELT % 49)))))) 

(SDEFUN |TREE;member?;S%B;23!0| ((|c| NIL) ($$ NIL))
        (PROG (|n| %)
          (LETT |n| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |n| |c| (QREFELT % 52)))))) 

(SDEFUN |TREE;parts;%L;24| ((|t| (%)) (% (|List| S)))
        (SPROG
         ((#1=#:G151 NIL) (|c| NIL) (#2=#:G152 NIL)
          (|u| (|List| #3=(|List| S))) (#4=#:G1 NIL) (#5=#:G153 NIL)
          (#6=#:G148 #3#) (#7=#:G146 #3#) (#8=#:G147 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 17))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |c| (QREFELT % 53))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (EXIT
                   (COND
                    ((SPADCALL |u| NIL (QREFELT % 55))
                     (LIST (SPADCALL |t| (QREFELT % 22))))
                    (#9#
                     (CONS (SPADCALL |t| (QREFELT % 22))
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT #4# NIL) (LETT #5# |u|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #4# (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #6# #4#)
                                    (COND
                                     (#8#
                                      (LETT #7#
                                            (SPADCALL #7# #6# (QREFELT % 56))))
                                     ('T
                                      (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#8# #7#) (#9# NIL))))))))))))) 

(SDEFUN |TREE;hashUpdate!;Hs%Hs;25|
        ((|s| (|HashState|)) (|t| (%)) (% (|HashState|)))
        (SPROG ((|ct| NIL) (#1=#:G160 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |s|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL |t| (QREFELT % 22))
                                        (QREFELT % 58)))
                        (SEQ (LETT |ct| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT % 17))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ct| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s| (SPADCALL |s| |ct| (QREFELT % 59)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |TREE;=;2%B;26| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |t1| (QREFELT % 14)) (SPADCALL |t2| (QREFELT % 14)))
              ((SPADCALL (SPADCALL |t1| (QREFELT % 22))
                         (SPADCALL |t2| (QREFELT % 22)) (QREFELT % 23))
               (SPADCALL (SPADCALL |t1| (QREFELT % 17))
                         (SPADCALL |t2| (QREFELT % 17)) (QREFELT % 60)))
              ('T NIL))) 

(SDEFUN |TREE;#;%Nni;27| ((|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G171 NIL) (#2=#:G168 #3=(|NonNegativeInteger|))
          (#4=#:G166 #3#) (#5=#:G167 NIL))
         (SEQ
          (COND ((SPADCALL |t| (QREFELT % 14)) 0)
                (#6='T
                 (+ 1
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |c| NIL)
                          (LETT #1# (SPADCALL |t| (QREFELT % 17))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |c| (QREFELT % 61)))
                             (COND (#5# (LETT #4# (+ #4# #2#)))
                                   ('T
                                    (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#6# 0))))))))) 

(SDEFUN |TREE;copy;2%;28| ((|t| (%)) (% (%)))
        (SPROG ((#1=#:G176 NIL) (|c| NIL) (#2=#:G177 NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT % 14)) (SPADCALL (QREFELT % 15)))
                      ('T
                       (SPADCALL (SPADCALL |t| (QREFELT % 22))
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #2# (SPADCALL |t| (QREFELT % 17)))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |c| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |c| (QREFELT % 62))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 28))))))) 

(DECLAIM (NOTINLINE |Tree;|)) 

(DEFUN |Tree;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G181 NIL) (#2=#:G180 NIL)
    (#3=#:G179 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Tree| DV$1))
    (LETT % (GETREFV 69))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #1#)
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #1#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #1#))))))
    (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 256))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 512))
    (AND #2# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 2048))
    (AND
     (OR (AND #2# (|HasCategory| % '(|finiteAggregate|)))
         (|HasCategory| |#1| '(|Hashable|)) #1#)
     (|augmentPredVector| % 4096))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7
              (|Union|
               (|:| |node|
                    (|Record| (|:| |value| |#1|) (|:| |args| (|List| %))))
               (|:| |empty| "empty")))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 59
                (CONS (|dispatchFunction| |TREE;hashUpdate!;Hs%Hs;25|) %))))
    %))) 

(DEFUN |Tree| (#1=#:G182)
  (SPROG NIL
         (PROG (#2=#:G183)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|)))))))))) 

(MAKEPROP '|Tree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|OutputForm|)
              (|Tree| 6) (|TreeOutput| 6) (0 . |to_output|) |TREE;coerce;%Of;1|
              (|Boolean|) |TREE;empty?;%B;2| |TREE;empty;%;3| (|List| %)
              |TREE;children;%L;4| |TREE;setchildren!;%L%;5|
              |TREE;setvalue!;%2S;6| (|NonNegativeInteger|)
              |TREE;count;S%Nni;7| |TREE;value;%S;14| (5 . =) (|Mapping| 13 6)
              |TREE;count;M%Nni;8| (|Mapping| 6 6) |TREE;map;M2%;9|
              |TREE;tree;SL%;11| |TREE;map!;M2%;10| |TREE;tree;S%;12|
              (|List| 6) |TREE;tree;L%;13| (|List| $$) (11 . |member?|)
              |TREE;child?;2%B;15| |TREE;=;2%B;26| (|Integer|)
              |TREE;distance;2%I;17| (17 . |leaf?|) |TREE;depth;%Nni;18|
              (|List| 20) (22 . |max|) |TREE;numberOfNodes;%2Nni;19| (27 . +)
              (|Mapping| 20 20 20) (33 . |reduce|) |TREE;node?;2%B;20|
              (|Mapping| 13 $$) (40 . |any?|) |TREE;any?;M%B;21|
              |TREE;every?;M%B;22| |TREE;member?;S%B;23| |TREE;parts;%L;24|
              (|List| 31) (46 . =) (52 . |append|) (|HashState|)
              (58 . |hashUpdate!|) (64 . |hashUpdate!|) (70 . =)
              |TREE;#;%Nni;27| |TREE;copy;2%;28| '"value" (|List| 65)
              (|Equation| 6) (|Mapping| 13 6 6) (|SingleInteger|) (|String|))
           '#(~= 76 |value| 82 |tree| 87 |size?| 103 |setvalue!| 109 |setelt!|
              115 |setchildren!| 122 |sample| 128 |parts| 132 |numberOfNodes|
              137 |nodes| 143 |node?| 148 |more?| 154 |min| 160 |members| 165
              |member?| 170 |max| 176 |map!| 187 |map| 193 |less?| 199 |leaves|
              205 |leaf?| 210 |latex| 215 |hashUpdate!| 220 |hash| 226 |every?|
              231 |eval| 237 |eq?| 263 |empty?| 269 |empty| 274 |elt| 278
              |distance| 284 |depth| 290 |cyclic?| 295 |count| 300 |copy| 312
              |coerce| 317 |children| 322 |child?| 327 |any?| 333 = 339 |#|
              345)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 0 3 1 2 0 6 8 2 0 0 0))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Hashable&|
                     |SetCategory&| |Evalable&| |Aggregate&| |BasicType&| NIL
                     |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Hashable|) (|SetCategory|) (|Evalable| 6) (|Aggregate|)
                      (|BasicType|) (|CoercibleTo| 8) (|InnerEvalable| 6 6)
                      (|finiteAggregate|) (|shallowlyMutable|) (|Type|))
                   (|makeByteWordVec2| 68
                                       '(1 10 8 9 11 2 6 13 0 0 23 2 33 13 2 0
                                         34 1 0 13 0 39 1 41 20 0 42 2 20 0 0 0
                                         44 3 41 20 45 0 20 46 2 33 13 48 0 49
                                         2 54 13 0 0 55 2 31 0 0 0 56 2 6 57 57
                                         0 58 2 0 57 57 0 59 2 33 13 0 0 60 2
                                         13 13 0 0 1 1 0 6 0 22 2 0 0 6 16 28 1
                                         0 0 31 32 1 0 0 6 30 2 0 13 0 20 1 2
                                         12 6 0 6 19 3 12 6 0 63 6 1 2 12 0 0
                                         16 18 0 0 0 1 1 9 31 0 53 2 0 20 0 20
                                         43 1 0 16 0 1 2 5 13 0 0 47 2 0 13 0
                                         20 1 1 10 6 0 1 1 9 31 0 1 2 11 13 6 0
                                         52 1 10 6 0 1 2 9 6 66 0 1 2 12 0 26 0
                                         29 2 0 0 26 0 27 2 0 13 0 20 1 1 0 31
                                         0 1 1 0 13 0 39 1 1 68 0 1 2 3 57 57 0
                                         59 1 3 67 0 1 2 9 13 24 0 51 2 2 0 0
                                         64 1 3 2 0 0 6 6 1 2 2 0 0 65 1 3 2 0
                                         0 31 31 1 2 0 13 0 0 1 1 0 13 0 14 0 0
                                         0 15 2 0 6 0 63 1 2 0 37 0 0 38 1 0 20
                                         0 40 1 0 13 0 1 2 11 20 6 0 21 2 9 20
                                         24 0 25 1 0 0 0 62 1 7 8 0 12 1 0 16 0
                                         17 2 5 13 0 0 35 2 9 13 24 0 50 2 13
                                         13 0 0 36 1 9 20 0 61)))))
           '|lookupComplete|)) 
