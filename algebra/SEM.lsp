
(SDEFUN |SEM;greater|
        ((|r1|
          (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (|r2|
          (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (% (|Boolean|)))
        (COND ((NULL (QCAR |r1|)) NIL) ((NULL (QCAR |r2|)) 'T)
              ('T
               (SPADCALL (|SPADfirst| (QCAR |r2|)) (|SPADfirst| (QCAR |r1|))
                         (QREFELT % 16))))) 

(MAKEPROP '|SEM;ncols;%Nni;2| '|SPADreplace| '(XLAM (A) (QVELT A 0))) 

(SDEFUN |SEM;ncols;%Nni;2| ((A (%)) (% (|NonNegativeInteger|))) (QVELT A 0)) 

(MAKEPROP '|SEM;nrows;%Nni;3| '|SPADreplace| '(XLAM (A) (QVELT A 1))) 

(SDEFUN |SEM;nrows;%Nni;3| ((A (%)) (% (|NonNegativeInteger|))) (QVELT A 1)) 

(SDEFUN |SEM;allIndices;%L;4| ((A (%)) (% (|List| C)))
        (SPADCALL (QVELT A 2) (QREFELT % 22))) 

(SDEFUN |SEM;row;%IR;5|
        ((A (%)) (|i| (|Integer|))
         (% (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
        (QAREF1O (QVELT A 3) |i| 1)) 

(SDEFUN |SEM;setRow!;%IRV;6|
        ((A (%)) (|i| (|Integer|))
         (|r| (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (% (|Void|)))
        (SEQ (QSETAREF1O (QVELT A 3) |i| |r| 1)
             (EXIT (SPADCALL (QREFELT % 28))))) 

(SDEFUN |SEM;setRow!;%ILLV;7|
        ((A (%)) (|i| (|Integer|)) (|inds| (|List| C)) (|ents| (|List| D))
         (% (|Void|)))
        (SEQ (QSETAREF1O (QVELT A 3) |i| (CONS |inds| |ents|) 1)
             (EXIT (SPADCALL (QREFELT % 28))))) 

(SDEFUN |SEM;new;LI%;8| ((|inds| (|List| C)) (|n| (|Integer|)) (% (%)))
        (SPROG
         ((#1=#:G87 NIL) (#2=#:G92 NIL) (|i| NIL) (#3=#:G93 NIL)
          (#4=#:G91 NIL))
         (SEQ
          (VECTOR (LENGTH |inds|)
                  (PROG1 (LETT #1# |n|)
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#))
                  |inds|
                  (PROGN
                   (LETT #2# (GETREFV |n|))
                   (SEQ (LETT |i| 1) (LETT #3# |n|) (LETT #4# 0) G190
                        (COND ((|greater_SI| |i| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #2# #4#
                                  (CONS (CAR (QREFELT % 11))
                                        (CDR (QREFELT % 11))))))
                        (LETT #4#
                              (PROG1 (|inc_SI| #4#) (LETT |i| (|inc_SI| |i|))))
                        (GO G190) G191 (EXIT NIL))
                   #2#))))) 

(SDEFUN |SEM;elt;%ICD;9| ((A (%)) (|i| (|Integer|)) (|c| (C)) (% (D)))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|pos| (|Integer|)))
         (SEQ (LETT |r| (SPADCALL A |i| (QREFELT % 26)))
              (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT % 33)))
              (EXIT
               (COND ((< |pos| (QREFELT % 8)) (|spadConstant| % 34))
                     ('T (SPADCALL (QCDR |r|) |pos| (QREFELT % 35)))))))) 

(SDEFUN |SEM;setelt!;%ICDV;10|
        ((A (%)) (|i| (|Integer|)) (|c| (C)) (|d| (D)) (% (|Void|)))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|pos| (|Integer|)) (|ind| NIL) (#1=#:G102 NIL) (|j| (|Integer|)))
         (SEQ (LETT |r| (SPADCALL A |i| (QREFELT % 26)))
              (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT % 33)))
              (COND
               ((>= |pos| (QREFELT % 8))
                (SPADCALL (QCDR |r|) |pos| |d| (QREFELT % 37)))
               ('T
                (SEQ (LETT |j| (QREFELT % 8))
                     (SEQ (LETT |ind| NIL) (LETT #1# (QCAR |r|)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#)) NIL)
                                (NULL (SPADCALL |c| |ind| (QREFELT % 16))))
                            (GO G191)))
                          (SEQ (EXIT (LETT |j| (+ |j| 1))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (PROGN
                      (RPLACA |r| (SPADCALL |c| (QCAR |r|) |j| (QREFELT % 38)))
                      (QCAR |r|))
                     (EXIT
                      (PROGN
                       (RPLACD |r|
                               (SPADCALL |d| (QCDR |r|) |j| (QREFELT % 39)))
                       (QCDR |r|))))))
              (QSETAREF1O (QVELT A 3) |i| |r| 1)
              (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;coerce;%M;11| ((A (%)) (% (|Matrix| D)))
        (SPROG
         ((AA (|Matrix| D)) (|i| NIL) (|r| NIL) (#1=#:G116 NIL) (|j| NIL)
          (|ind| NIL) (#2=#:G117 NIL) (|inds| (|List| C)) (|ents| (|List| D)))
         (SEQ
          (COND
           ((ZEROP (QVELT A 0))
            (|error| "cannot coerce matrix with zero columns"))
           ('T
            (SEQ
             (LETT AA
                   (MAKE_MATRIX1 (QVELT A 1) (QVELT A 0)
                                 (|spadConstant| % 34)))
             (SEQ (LETT |i| (PROGN AA 1)) (LETT |r| NIL)
                  (LETT #1# (SPADCALL (QVELT A 3) (QREFELT % 43))) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ (LETT |inds| (QCAR |r|)) (LETT |ents| (QCDR |r|))
                       (EXIT
                        (SEQ (LETT |j| (PROGN AA 1)) (LETT |ind| NIL)
                             (LETT #2# (QVELT A 2)) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ind| (CAR #2#)) NIL)
                                   (NULL (NULL (NULL |inds|))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |ind| (|SPADfirst| |inds|)
                                           (QREFELT % 44))
                                 (SEQ
                                  (QSETAREF2O AA |i| |j| (|SPADfirst| |ents|) 1
                                              1)
                                  (LETT |inds| (CDR |inds|))
                                  (EXIT (LETT |ents| (CDR |ents|))))))))
                             (LETT #2# (PROG1 (CDR #2#) (LETT |j| (+ |j| 1))))
                             (GO G190) G191 (EXIT NIL))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT AA))))))) 

(SDEFUN |SEM;coerce;%Of;12| ((A (%)) (% (|OutputForm|)))
        (COND
         ((ZEROP (QVELT A 0)) (SPADCALL (|spadConstant| % 34) (QREFELT % 48)))
         ('T (SPADCALL (SPADCALL A (QREFELT % 46)) (QREFELT % 49))))) 

(SDEFUN |SEM;copy;2%;13| ((A (%)) (% (%)))
        (SPROG
         ((|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|l| NIL) (#1=#:G126 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ (LETT |resRows| (MAKEARR1 (QVELT A 1) (QREFELT % 11)))
              (SEQ (LETT |l| 1) (LETT #1# (QVELT A 1)) G190
                   (COND ((|greater_SI| |l| #1#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1))
                        (EXIT
                         (QSETAREF1O |resRows| |l|
                                     (CONS (SPADCALL (QCAR |r|) (QREFELT % 22))
                                           (SPADCALL (QCDR |r|)
                                                     (QREFELT % 51)))
                                     1)))
                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (QVELT A 0) (QVELT A 1)
                       (SPADCALL (QVELT A 2) (QREFELT % 22)) |resRows|))))) 

(SDEFUN |SEM;elimZeroCols!;%V;14| ((A (%)) (% (|Void|)))
        (SPROG ((|r| NIL) (#1=#:G133 NIL) (|newInds| (|List| C)))
               (SEQ (LETT |newInds| NIL)
                    (SEQ (LETT |r| NIL)
                         (LETT #1# (SPADCALL (QVELT A 3) (QREFELT % 43))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |newInds|
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS #'|SEM;elimZeroCols!;%V;14!0| %)
                                   |newInds| (QCAR |r|) (QREFELT % 54))
                                  (QREFELT % 55)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (QSETVELT A 2 |newInds|) (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;elimZeroCols!;%V;14!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;purge!;%MV;15|
        ((A (%)) (|crit| (|Mapping| (|Boolean|) C)) (% (|Void|)))
        (SPROG
         ((#1=#:G150 NIL) (|l| NIL) (#2=#:G151 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|e| NIL) (#3=#:G153 NIL) (|c| NIL) (#4=#:G152 NIL)
          (|newInds| (|List| C)) (|newEnts| (|List| D)))
         (SEQ (LETT |newInds| NIL)
              (SEQ (LETT |c| NIL) (LETT #1# (QVELT A 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |c| |crit|))
                       (LETT |newInds| (CONS |c| |newInds|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |newInds| (NREVERSE |newInds|))
              (COND
               ((SPADCALL (LENGTH |newInds|) (LENGTH (QVELT A 2))
                          (QREFELT % 57))
                (SEQ (QSETVELT A 2 |newInds|)
                     (EXIT
                      (SEQ (LETT |l| 1) (LETT #2# (QVELT A 1)) G190
                           (COND ((|greater_SI| |l| #2#) (GO G191)))
                           (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1))
                                (LETT |newInds| NIL) (LETT |newEnts| NIL)
                                (SEQ (LETT |e| NIL) (LETT #3# (QCDR |r|))
                                     (LETT |c| NIL) (LETT #4# (QCAR |r|)) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |c| (CAR #4#)) NIL)
                                           (ATOM #3#)
                                           (PROGN (LETT |e| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |c| |crit|))
                                         (SEQ
                                          (LETT |newInds| (CONS |c| |newInds|))
                                          (EXIT
                                           (LETT |newEnts|
                                                 (CONS |e| |newEnts|))))))))
                                     (LETT #4#
                                           (PROG1 (CDR #4#)
                                             (LETT #3# (CDR #3#))))
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (QSETAREF1O (QVELT A 3) |l|
                                             (CONS (NREVERSE |newInds|)
                                                   (NREVERSE |newEnts|))
                                             1)))
                           (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                           (EXIT NIL))))))
              (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;sortedPurge!;%MV;16|
        ((A (%)) (|crit| (|Mapping| (|Boolean|) C)) (% (|Void|)))
        (SPROG
         ((|l| NIL) (#1=#:G169 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ
          (COND
           ((SPADCALL (|SPADfirst| (QVELT A 2)) |crit|)
            (SEQ
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL (QVELT A 2)) NIL)
                           ('T (SPADCALL (|SPADfirst| (QVELT A 2)) |crit|))))
                    (GO G191)))
                  (SEQ (EXIT (QSETVELT A 2 (CDR (QVELT A 2))))) NIL (GO G190)
                  G191 (EXIT NIL))
             (EXIT
              (SEQ (LETT |l| 1) (LETT #1# (QVELT A 1)) G190
                   (COND ((|greater_SI| |l| #1#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL (QCAR |r|)) NIL)
                                      ('T
                                       (SPADCALL (|SPADfirst| (QCAR |r|))
                                                 |crit|))))
                               (GO G191)))
                             (SEQ
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT
                               (PROGN
                                (RPLACD |r| (CDR (QCDR |r|)))
                                (QCDR |r|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (QSETAREF1O (QVELT A 3) |l| |r| 1)))
                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;deleteRow!;%IV;17| ((A (%)) (|i| (|Integer|)) (% (|Void|)))
        (SPROG
         ((#1=#:G170 NIL) (|nr| (|NonNegativeInteger|))
          (|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (#2=#:G180 NIL) (|l| NIL) (#3=#:G181 NIL))
         (SEQ
          (COND ((> |i| (QVELT A 1)) A)
                ('T
                 (SEQ
                  (LETT |nr|
                        (PROG1 (LETT #1# (- (QVELT A 1) 1))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#)))
                  (LETT |resRows| (MAKEARR1 |nr| (QREFELT % 11)))
                  (SEQ (LETT |l| 1) (LETT #2# (- |i| 1)) G190
                       (COND ((|greater_SI| |l| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1O |resRows| |l| (QAREF1O (QVELT A 3) |l| 1)
                                     1)))
                       (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |l| (+ |i| 1)) (LETT #3# (QVELT A 1)) G190
                       (COND ((> |l| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1O |resRows| (- |l| 1)
                                     (QAREF1O (QVELT A 3) |l| 1) 1)))
                       (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))
                  (QSETVELT A 1 |nr|) (QSETVELT A 3 |resRows|)
                  (EXIT (SPADCALL (QREFELT % 28))))))))) 

(SDEFUN |SEM;consRow!;%RV;18|
        ((A (%))
         (|r| (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (% (|Void|)))
        (SPROG
         ((|newRows|
           (|List|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|newInds| (|List| C)))
         (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
              (LETT |newRows| (CONS |r| (SPADCALL (QVELT A 3) (QREFELT % 43))))
              (QSETVELT A 3 (SPADCALL |newRows| (QREFELT % 62)))
              (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT % 63)))
              (COND
               ((NULL (NULL |newInds|))
                (QSETVELT A 2
                          (SPADCALL (CONS #'|SEM;consRow!;%RV;18!0| %)
                                    (QVELT A 2)
                                    (SPADCALL
                                     (CONS #'|SEM;consRow!;%RV;18!1| %)
                                     |newInds| (QREFELT % 64))
                                    (QREFELT % 65)))))
              (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;consRow!;%RV;18!1| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;consRow!;%RV;18!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;appendRow!;%RV;19|
        ((A (%))
         (|r| (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (% (|Void|)))
        (SPROG
         ((|newRows|
           (|List|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|newInds| (|List| C)))
         (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
              (LETT |newRows|
                    (SPADCALL (SPADCALL (QVELT A 3) (QREFELT % 43)) |r|
                              (QREFELT % 67)))
              (QSETVELT A 3 (SPADCALL |newRows| (QREFELT % 62)))
              (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT % 63)))
              (COND
               ((NULL (NULL |newInds|))
                (QSETVELT A 2
                          (SPADCALL (CONS #'|SEM;appendRow!;%RV;19!0| %)
                                    (QVELT A 2)
                                    (SPADCALL
                                     (CONS #'|SEM;appendRow!;%RV;19!1| %)
                                     |newInds| (QREFELT % 64))
                                    (QREFELT % 65)))))
              (EXIT (SPADCALL (QREFELT % 28)))))) 

(SDEFUN |SEM;appendRow!;%RV;19!1| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;appendRow!;%RV;19!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;extract;%2I%;20|
        ((A (%)) (|i1| (|Integer|)) (|i2| (|Integer|)) (% (%)))
        (SPROG
         ((#1=#:G192 NIL) (|nr| (|NonNegativeInteger|))
          (|resRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (|i| NIL) (#2=#:G200 NIL) (|newInds| (|List| C)))
         (SEQ
          (LETT |nr|
                (PROG1 (LETT #1# (+ (- |i2| |i1|) 1))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |resRows| (MAKEARR1 |nr| (QREFELT % 11))) (LETT |newInds| NIL)
          (SEQ (LETT |i| |i1|) (LETT #2# |i2|) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (QSETAREF1O |resRows| (+ (- |i| |i1|) 1)
                            (SPADCALL A |i| (QREFELT % 26)) 1)
                (EXIT
                 (LETT |newInds|
                       (SPADCALL
                        (SPADCALL (CONS #'|SEM;extract;%2I%;20!0| %) |newInds|
                                  (QCAR (SPADCALL A |i| (QREFELT % 26)))
                                  (QREFELT % 65))
                        (QREFELT % 55)))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (QVELT A 0) |nr| |newInds| |resRows|))))) 

(SDEFUN |SEM;extract;%2I%;20!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;join;3%;21| ((A1 (%)) (A2 (%)) (% (%)))
        (SPROG
         ((|newInds| (|List| C)) (|newNRows| (|NonNegativeInteger|))
          (|newRows|
           (|Vector|
            (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
          (#1=#:G215 NIL) (|l| NIL) (#2=#:G216 NIL))
         (SEQ
          (LETT |newInds|
                (SPADCALL
                 (SPADCALL (CONS #'|SEM;join;3%;21!0| %) (QVELT A1 2)
                           (QVELT A2 2) (QREFELT % 65))
                 (QREFELT % 55)))
          (LETT |newNRows| (+ (QVELT A1 1) (QVELT A2 1)))
          (LETT |newRows| (MAKEARR1 |newNRows| (QREFELT % 11)))
          (SEQ (LETT |l| 1) (LETT #1# (QVELT A1 1)) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |newRows| |l| (QAREF1O (QVELT A1 3) |l| 1) 1)))
               (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |l| 1) (LETT #2# (QVELT A2 1)) G190
               (COND ((|greater_SI| |l| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |newRows| (+ (QVELT A1 1) |l|)
                             (QAREF1O (QVELT A2 3) |l| 1) 1)))
               (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (LENGTH |newInds|) |newNRows| |newInds| |newRows|))))) 

(SDEFUN |SEM;join;3%;21!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL |y| |x| (QREFELT % 16))) 

(SDEFUN |SEM;horizJoin;3%;22| ((A1 (%)) (A2 (%)) (% (%)))
        (SPROG
         ((|newInds| (|List| C)) (|res| (%)) (|i| NIL) (#1=#:G223 NIL)
          (|r1|
           #2=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|r2| #2#))
         (SEQ
          (COND
           ((SPADCALL (QVELT A1 1) (QVELT A2 1) (QREFELT % 57))
            (|error| "incompatible dimensions in horizJoin"))
           ('T
            (SEQ
             (LETT |newInds|
                   (SPADCALL (QVELT A1 2) (QVELT A2 2) (QREFELT % 71)))
             (LETT |res| (SPADCALL |newInds| (QVELT A1 1) (QREFELT % 32)))
             (SEQ (LETT |i| 1) (LETT #1# (QVELT A1 1)) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |r1| (SPADCALL A1 |i| (QREFELT % 26)))
                       (LETT |r2| (SPADCALL A2 |i| (QREFELT % 26)))
                       (EXIT
                        (SPADCALL |res| |i|
                                  (SPADCALL (QCAR |r1|) (QCAR |r2|)
                                            (QREFELT % 71))
                                  (SPADCALL (QCDR |r1|) (QCDR |r2|)
                                            (QREFELT % 72))
                                  (QREFELT % 31))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |res|))))))) 

(SDEFUN |SEM;horizSplit;%CR;23|
        ((A (%)) (|c| (C)) (% (|Record| (|:| |Left| %) (|:| |Right| %))))
        (SPROG
         ((|rinds| (|List| C)) (|linds| (|List| C)) (LA (%)) (RA (%)) (|i| NIL)
          (#1=#:G243 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|ri| (|List| C)) (|re| (|List| D)) (|li| (|List| C))
          (|le| (|List| D)))
         (SEQ (LETT |rinds| (SPADCALL A (QREFELT % 23))) (LETT |linds| NIL)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |rinds|) NIL)
                            ('T
                             (SPADCALL (|SPADfirst| |rinds|) |c|
                                       (QREFELT % 74)))))
                     (GO G191)))
                   (SEQ (LETT |linds| (CONS (|SPADfirst| |rinds|) |linds|))
                        (EXIT (LETT |rinds| (CDR |rinds|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |linds|)
                 (CONS (SPADCALL |linds| (QVELT A 1) (QREFELT % 32)) A))
                (#2='T
                 (SEQ (LETT |linds| (NREVERSE |linds|))
                      (EXIT
                       (COND
                        ((NULL |rinds|)
                         (CONS A
                               (SPADCALL |rinds| (QVELT A 1) (QREFELT % 32))))
                        (#2#
                         (SEQ
                          (LETT LA
                                (SPADCALL |linds| (QVELT A 1) (QREFELT % 32)))
                          (LETT RA
                                (SPADCALL |rinds| (QVELT A 1) (QREFELT % 32)))
                          (SEQ (LETT |i| 1) (LETT #1# (QVELT A 1)) G190
                               (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ (LETT |r| (SPADCALL A |i| (QREFELT % 26)))
                                    (LETT |ri| (QCAR |r|))
                                    (LETT |re| (QCDR |r|)) (LETT |li| NIL)
                                    (LETT |le| NIL)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |ri|) NIL)
                                                  ('T
                                                   (SPADCALL (|SPADfirst| |ri|)
                                                             |c|
                                                             (QREFELT % 74)))))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |li|
                                                (CONS (|SPADfirst| |ri|) |li|))
                                          (LETT |le|
                                                (CONS (|SPADfirst| |re|) |le|))
                                          (LETT |ri| (CDR |ri|))
                                          (EXIT (LETT |re| (CDR |re|))))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (COND
                                     ((NULL (NULL |li|))
                                      (SEQ (LETT |li| (NREVERSE |li|))
                                           (LETT |le| (NREVERSE |le|))
                                           (EXIT
                                            (SPADCALL LA |i| |li| |le|
                                                      (QREFELT % 31))))))
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |ri|))
                                       (SPADCALL RA |i| |ri| |re|
                                                 (QREFELT % 31))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (CONS LA RA))))))))))))) 

(SDEFUN |SEM;addRows|
        ((|d1| (D))
         (|r1|
          (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (|d2| (D))
         (|r2|
          (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (% (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
        (SPROG
         ((#1=#:G283 NIL) (#2=#:G284 NIL) (#3=#:G285 NIL) (#4=#:G286 NIL)
          (#5=#:G287 NIL) (#6=#:G288 NIL) (|lent1| (|List| D)) (#7=#:G289 NIL)
          (|e2| NIL) (#8=#:G290 NIL) (|e1| NIL) (#9=#:G292 NIL) (|c1| NIL)
          (#10=#:G291 NIL) (|sum| (D)) (|lind2| (|List| C))
          (|lent2| (|List| D)) (|resI| (|List| C)) (|resE| (|List| D)))
         (SEQ
          (COND
           ((NULL (QCAR |r1|))
            (COND ((SPADCALL |d2| (QREFELT % 77)) |r2|)
                  (#11='T
                   (CONS (QCAR |r2|)
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |e2| NIL) (LETT #2# (QCDR |r2|)) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |e2| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS
                                        (SPADCALL |d2| |e2| (QREFELT % 78))
                                        #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))))))
           ((NULL (QCAR |r2|))
            (COND ((SPADCALL |d1| (QREFELT % 77)) |r1|)
                  (#11#
                   (CONS (QCAR |r1|)
                         (PROGN
                          (LETT #3# NIL)
                          (SEQ (LETT |e1| NIL) (LETT #4# (QCDR |r1|)) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |e1| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SPADCALL |d1| |e1| (QREFELT % 78))
                                        #3#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #3#))))))))
           (#11#
            (SEQ (LETT |resI| NIL) (LETT |resE| NIL)
                 (COND
                  ((OR (QREFELT % 12) (NULL (SPADCALL |d1| (QREFELT % 77))))
                   (LETT |lent1|
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |e1| NIL) (LETT #6# (QCDR |r1|)) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |e1| (CAR #6#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (SPADCALL |d1| |e1| (QREFELT % 78))
                                        #5#))))
                               (LETT #6# (CDR #6#)) (GO G190) G191
                               (EXIT (NREVERSE #5#))))))
                  ('T (LETT |lent1| (QCDR |r1|))))
                 (COND
                  ((OR (QREFELT % 12) (NULL (SPADCALL |d2| (QREFELT % 77))))
                   (LETT |lent2|
                         (PROGN
                          (LETT #7# NIL)
                          (SEQ (LETT |e2| NIL) (LETT #8# (QCDR |r2|)) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |e2| (CAR #8#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #7#
                                       (CONS
                                        (SPADCALL |d2| |e2| (QREFELT % 78))
                                        #7#))))
                               (LETT #8# (CDR #8#)) (GO G190) G191
                               (EXIT (NREVERSE #7#))))))
                  ('T (LETT |lent2| (SPADCALL (QCDR |r2|) (QREFELT % 51)))))
                 (LETT |lind2| (SPADCALL (QCAR |r2|) (QREFELT % 22)))
                 (SEQ (LETT |e1| NIL) (LETT #9# |lent1|) (LETT |c1| NIL)
                      (LETT #10# (QCAR |r1|)) G190
                      (COND
                       ((OR (ATOM #10#) (PROGN (LETT |c1| (CAR #10#)) NIL)
                            (ATOM #9#) (PROGN (LETT |e1| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |lind2|) NIL)
                                     ('T
                                      (SPADCALL |c1| (|SPADfirst| |lind2|)
                                                (QREFELT % 16)))))
                              (GO G191)))
                            (SEQ
                             (LETT |resI| (CONS (|SPADfirst| |lind2|) |resI|))
                             (LETT |resE| (CONS (|SPADfirst| |lent2|) |resE|))
                             (LETT |lind2| (CDR |lind2|))
                             (EXIT (LETT |lent2| (CDR |lent2|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((OR (NULL |lind2|)
                              (NULL
                               (SPADCALL (|SPADfirst| |lind2|) |c1|
                                         (QREFELT % 44))))
                          (SEQ (LETT |resI| (CONS |c1| |resI|))
                               (EXIT (LETT |resE| (CONS |e1| |resE|)))))
                         ('T
                          (SEQ
                           (LETT |sum|
                                 (SPADCALL |e1| (|SPADfirst| |lent2|)
                                           (QREFELT % 79)))
                           (COND
                            ((OR (QREFELT % 12)
                                 (NULL (SPADCALL |sum| (QREFELT % 80))))
                             (SEQ (LETT |resI| (CONS |c1| |resI|))
                                  (EXIT (LETT |resE| (CONS |sum| |resE|))))))
                           (LETT |lind2| (CDR |lind2|))
                           (EXIT (LETT |lent2| (CDR |lent2|))))))))
                      (LETT #10# (PROG1 (CDR #10#) (LETT #9# (CDR #9#))))
                      (GO G190) G191 (EXIT NIL))
                 (LETT |resI|
                       (SPADCALL (NREVERSE |resI|) |lind2| (QREFELT % 81)))
                 (LETT |resE|
                       (SPADCALL (NREVERSE |resE|) |lent2| (QREFELT % 82)))
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |resE|) NIL)
                               ('T
                                (SPADCALL (|SPADfirst| |resE|)
                                          (QREFELT % 80)))))
                        (GO G191)))
                      (SEQ (LETT |resI| (CDR |resI|))
                           (EXIT (LETT |resE| (CDR |resE|))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS |resI| |resE|)))))))) 

(SDEFUN |SEM;pivot;%IR;25|
        ((A (%)) (|i| (|Integer|))
         (% (|Record| (|:| |Index| C) (|:| |Entry| D))))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ (LETT |r| (SPADCALL A |i| (QREFELT % 26)))
              (EXIT
               (COND ((NULL (QCAR |r|)) (|error| "empty row"))
                     ('T
                      (CONS (|SPADfirst| (QCAR |r|))
                            (|SPADfirst| (QCDR |r|))))))))) 

(SDEFUN |SEM;pivots;%R;26|
        ((A (%))
         (% (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
        (SPROG
         ((|r| NIL) (#1=#:G303 NIL) (|resI| (|List| C)) (|resE| (|List| D)))
         (SEQ (LETT |resI| NIL) (LETT |resE| NIL)
              (SEQ (LETT |r| NIL)
                   (LETT #1# (SPADCALL (QVELT A 3) (QREFELT % 43))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL (QCAR |r|)))
                       (SEQ
                        (LETT |resI| (CONS (|SPADfirst| (QCAR |r|)) |resI|))
                        (EXIT
                         (LETT |resE|
                               (CONS (|SPADfirst| (QCDR |r|)) |resE|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resI|) (NREVERSE |resE|)))))) 

(SDEFUN |SEM;rowEchelon;%R;27|
        ((AA (%))
         (%
          (|Record| (|:| |Ech| %) (|:| |Lt| (|Matrix| D))
                    (|:| |Pivots| (|List| D))
                    (|:| |Rank| (|NonNegativeInteger|)))))
        (SPROG
         ((A (%)) (#1=#:G359 NIL) (#2=#:G360 NIL) (#3=#:G358 NIL)
          (|LTr| (|Matrix| D)) (#4=#:G361 NIL) (|changed?| #5=(|Boolean|))
          (#6=#:G362 NIL) (#7=#:G363 NIL)
          (|newr|
           #8=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|sorted?| #5#) (|oldr| #8#) (#9=#:G365 NIL) (|i| NIL)
          (#10=#:G364 NIL) (|finished?| #5#) (#11=#:G325 NIL) (|pivind| (C))
          (#12=#:G366 NIL) (|len| #13=(|NonNegativeInteger|)) (|k| (|Integer|))
          (|pivlen| #13#) (|pivrow| (|NonNegativeInteger|)) (|piv| (D))
          (|Pivs| (|List| D)) (|pr| #8#) (|j| NIL) (#14=#:G367 NIL) (|c| (D))
          (|r| #8#) (#15=#:G368 NIL) (|f| (D)) (#16=#:G369 NIL) (|l| NIL)
          (#17=#:G370 NIL) (|rk| (|NonNegativeInteger|)))
         (SEQ (LETT A (SPADCALL AA (QREFELT % 52)))
              (LETT |LTr|
                    (SPADCALL
                     (PROGN
                      (LETT #1# (GETREFV #18=(QVELT A 1)))
                      (SEQ (LETT |i| 1) (LETT #2# #18#) (LETT #3# 0) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ (EXIT (SETELT #1# #3# (|spadConstant| % 9))))
                           (LETT #3#
                                 (PROG1 (|inc_SI| #3#)
                                   (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))
                      #1#)
                     (QREFELT % 87)))
              (LETT |Pivs| NIL)
              (SEQ (LETT |i| 1) (LETT #4# (QVELT A 1)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                        (LETT |changed?| NIL)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL (QCDR |r|)) NIL)
                                      ('T
                                       (SPADCALL (|SPADfirst| (QCDR |r|))
                                                 (QREFELT % 80)))))
                               (GO G191)))
                             (SEQ
                              (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT (LETT |changed?| 'T)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |sorted?| NIL)
              (SEQ (LETT #6# NIL) G190 (COND (#6# (GO G191)))
                   (SEQ (LETT |sorted?| 'T)
                        (LETT |oldr| (QAREF1O (QVELT A 3) 1 1))
                        (EXIT
                         (SEQ (LETT |i| 2) (LETT #7# (QVELT A 1)) G190
                              (COND ((|greater_SI| |i| #7#) (GO G191)))
                              (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1))
                                   (EXIT
                                    (COND
                                     ((|SEM;greater| |newr| |oldr| %)
                                      (SEQ
                                       (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                       (QSETAREF1O (QVELT A 3) (- |i| 1) |newr|
                                                   1)
                                       (SPADCALL |LTr| (- |i| 1) |i|
                                                 (QREFELT % 88))
                                       (EXIT (LETT |sorted?| NIL))))
                                     ('T (LETT |oldr| |newr|)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #6# |sorted?|) (GO G190) G191 (EXIT NIL))
              (LETT |finished?| NIL)
              (SEQ (LETT #9# NIL) (LETT |i| 1) (LETT #10# (QVELT A 1)) G190
                   (COND ((OR (|greater_SI| |i| #10#) #9#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                        (LETT |finished?| (NULL (QCAR |r|)))
                        (EXIT
                         (COND
                          (|finished?|
                           (LETT |rk|
                                 (PROG1 (LETT #11# (- |i| 1))
                                   (|check_subtype2| (>= #11# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #11#))))
                          ('T
                           (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)))
                                (LETT |pivlen| (LENGTH (QCAR |r|)))
                                (LETT |pivrow| |i|) (LETT |k| 0)
                                (SEQ (LETT |j| (+ |i| 1))
                                     (LETT #12# (QVELT A 1)) G190
                                     (COND
                                      ((OR (> |j| #12#)
                                           (NULL
                                            (COND
                                             ((NULL
                                               (QCAR
                                                (QAREF1O (QVELT A 3) |j| 1)))
                                              NIL)
                                             ('T
                                              (SPADCALL |pivind|
                                                        (|SPADfirst|
                                                         (QCAR
                                                          (QAREF1O (QVELT A 3)
                                                                   |j| 1)))
                                                        (QREFELT % 44))))))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |len|
                                            (LENGTH
                                             (QCAR
                                              (QAREF1O (QVELT A 3) |j| 1))))
                                      (LETT |k| (+ |k| 1))
                                      (EXIT
                                       (COND
                                        ((< |len| |pivlen|)
                                         (SEQ (LETT |pivlen| |len|)
                                              (EXIT (LETT |pivrow| |j|)))))))
                                     (LETT |j| (+ |j| 1)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |piv|
                                      (|SPADfirst|
                                       (QCDR
                                        (QAREF1O (QVELT A 3) |pivrow| 1))))
                                (LETT |Pivs| (CONS |piv| |Pivs|))
                                (EXIT
                                 (COND
                                  ((> |k| 0)
                                   (SEQ
                                    (COND
                                     ((SPADCALL |pivrow| |i| (QREFELT % 57))
                                      (SEQ
                                       (LETT |pr|
                                             (QAREF1O (QVELT A 3) |pivrow| 1))
                                       (QSETAREF1O (QVELT A 3) |pivrow|
                                                   (QAREF1O (QVELT A 3) |i| 1)
                                                   1)
                                       (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                                       (EXIT
                                        (SPADCALL |LTr| |i| |pivrow|
                                                  (QREFELT % 88))))))
                                    (LETT |pr|
                                          (CONS
                                           (CAR (QAREF1O (QVELT A 3) |i| 1))
                                           (CDR (QAREF1O (QVELT A 3) |i| 1))))
                                    (PROGN
                                     (RPLACA |pr| (CDR (QCAR |pr|)))
                                     (QCAR |pr|))
                                    (PROGN
                                     (RPLACD |pr| (CDR (QCDR |pr|)))
                                     (QCDR |pr|))
                                    (EXIT
                                     (SEQ (LETT |j| (+ |i| 1))
                                          (LETT #14# (+ |i| |k|)) G190
                                          (COND ((> |j| #14#) (GO G191)))
                                          (SEQ
                                           (LETT |r|
                                                 (CONS
                                                  (CAR
                                                   (QAREF1O (QVELT A 3)
                                                            (+ |i| 1) 1))
                                                  (CDR
                                                   (QAREF1O (QVELT A 3)
                                                            (+ |i| 1) 1))))
                                           (LETT |c| (|SPADfirst| (QCDR |r|)))
                                           (PROGN
                                            (RPLACA |r| (CDR (QCAR |r|)))
                                            (QCAR |r|))
                                           (PROGN
                                            (RPLACD |r| (CDR (QCDR |r|)))
                                            (QCDR |r|))
                                           (LETT |r|
                                                 (|SEM;addRows| |piv| |r|
                                                  (SPADCALL |c| (QREFELT % 89))
                                                  |pr| %))
                                           (SEQ (LETT |l| 1)
                                                (LETT #15# (QVELT A 1)) G190
                                                (COND
                                                 ((|greater_SI| |l| #15#)
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |f|
                                                       (SPADCALL
                                                        (SPADCALL |piv|
                                                                  (QAREF2O
                                                                   |LTr|
                                                                   (+ |i| 1)
                                                                   |l| 1 1)
                                                                  (QREFELT %
                                                                           78))
                                                        (SPADCALL |c|
                                                                  (QAREF2O
                                                                   |LTr| |i|
                                                                   |l| 1 1)
                                                                  (QREFELT %
                                                                           78))
                                                        (QREFELT % 90)))
                                                 (EXIT
                                                  (QSETAREF2O |LTr| (+ |i| 1)
                                                              |l| |f| 1 1)))
                                                (LETT |l| (|inc_SI| |l|))
                                                (GO G190) G191 (EXIT NIL))
                                           (SEQ (LETT |l| (+ |i| 2))
                                                (LETT #16#
                                                      (-
                                                       (+ (+ (* 2 |i|) |k|) 1)
                                                       |j|))
                                                G190
                                                (COND ((> |l| #16#) (GO G191)))
                                                (SEQ
                                                 (QSETAREF1O (QVELT A 3)
                                                             (- |l| 1)
                                                             (QAREF1O
                                                              (QVELT A 3) |l|
                                                              1)
                                                             1)
                                                 (EXIT
                                                  (SPADCALL |LTr| (- |l| 1) |l|
                                                            (QREFELT % 88))))
                                                (LETT |l| (+ |l| 1)) (GO G190)
                                                G191 (EXIT NIL))
                                           (SEQ
                                            (LETT |l|
                                                  (- (+ (+ (* 2 |i|) |k|) 2)
                                                     |j|))
                                            (LETT #17# (QVELT A 1)) G190
                                            (COND
                                             ((OR (> |l| #17#)
                                                  (NULL
                                                   (|SEM;greater|
                                                    (QAREF1O (QVELT A 3) |l| 1)
                                                    |r| %)))
                                              (GO G191)))
                                            (SEQ
                                             (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                         (QAREF1O (QVELT A 3)
                                                                  |l| 1)
                                                         1)
                                             (EXIT
                                              (SPADCALL |LTr| (- |l| 1) |l|
                                                        (QREFELT % 88))))
                                            (LETT |l| (+ |l| 1)) (GO G190) G191
                                            (EXIT NIL))
                                           (EXIT
                                            (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                        |r| 1)))
                                          (LETT |j| (+ |j| 1)) (GO G190) G191
                                          (EXIT NIL))))))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# |finished?|)))
                   (GO G190) G191 (EXIT NIL))
              (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1))))
              (EXIT (VECTOR A |LTr| |Pivs| |rk|))))) 

(SDEFUN |SEM;setGcdMode;2S;28| ((|s| (|Symbol|)) (% (|Symbol|)))
        (SPROG ((|tmp| (|Symbol|)))
               (SEQ (LETT |tmp| (QREFELT % 14))
                    (COND
                     ((OR (EQUAL |s| '|iterated|) (EQUAL |s| '|random|))
                      (EXIT (SEQ (SETELT % 14 |s|) (EXIT |tmp|)))))
                    (EXIT (|error| "unknown gcd mode"))))) 

(SDEFUN |SEM;randomGCD| ((|le| (|List| D)) (% (D)))
        (SPROG
         ((|f| (D)) (#1=#:G395 NIL) (|g| (D)) (|h| (D)) (|e| NIL)
          (#2=#:G396 NIL) (|tmp| (|Union| D "failed")) (|l| (|List| D)))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |le|) 2)
             (SPADCALL (|SPADfirst| |le|) (SPADCALL |le| (QREFELT % 95))
                       (QREFELT % 96)))
            (#3='T
             (SEQ (LETT |f| (|SPADfirst| |le|))
                  (LETT |g| (SPADCALL |le| (QREFELT % 95)))
                  (LETT |l| (CDR (CDR |le|)))
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (|SPADfirst| |l|) (QREFELT % 77))
                           (PROGN
                            (LETT #1# (|spadConstant| % 9))
                            (GO #4=#:G394)))
                          ('T
                           (SEQ
                            (LETT |f|
                                  (SPADCALL |f|
                                            (SPADCALL (+ 1 (RANDOM 113))
                                                      (|SPADfirst| |l|)
                                                      (QREFELT % 97))
                                            (QREFELT % 79)))
                            (LETT |l| (CDR |l|))
                            (EXIT
                             (COND
                              ((NULL (NULL |l|))
                               (COND
                                ((SPADCALL (|SPADfirst| |l|) (QREFELT % 77))
                                 (PROGN
                                  (LETT #1# (|spadConstant| % 9))
                                  (GO #4#)))
                                ('T
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |g|
                                                  (SPADCALL (+ 1 (RANDOM 113))
                                                            (|SPADfirst| |l|)
                                                            (QREFELT % 97))
                                                  (QREFELT % 79)))
                                  (EXIT (LETT |l| (CDR |l|))))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |h| (SPADCALL |f| |g| (QREFELT % 96)))
                  (LETT |l| (LIST |h|))
                  (SEQ (LETT |e| NIL) (LETT #2# |le|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |tmp| (SPADCALL |e| |h| (QREFELT % 99)))
                            (EXIT
                             (COND
                              ((QEQCAR |tmp| 1) (LETT |l| (CONS |e| |l|))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL (LENGTH |l|) 1) |h|)
                         (#3# (|SEM;randomGCD| |l| %))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SEM;iteratedGCD| ((|le| (|List| D)) (% (D)))
        (SPROG ((|res| (D)) (|l| (|List| D)))
               (SEQ
                (LETT |res|
                      (SPADCALL (|SPADfirst| |le|)
                                (SPADCALL |le| (QREFELT % 95)) (QREFELT % 96)))
                (LETT |l| (CDR (CDR |le|)))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |l|) NIL)
                              ('T (NULL (SPADCALL |res| (QREFELT % 77))))))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (SPADCALL |res| (|SPADfirst| |l|) (QREFELT % 96)))
                      (EXIT (LETT |l| (CDR |l|))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |SEM;makePrimitive|
        ((|r| (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
         (%
          (|Record| (|:| GCD D)
                    (|:| |Row|
                         (|Record| (|:| |Indices| (|List| C))
                                   (|:| |Entries| (|List| D)))))))
        (SPROG
         ((|g| (D)) (#1=#:G415 NIL) (|e| NIL) (#2=#:G416 NIL) (#3=#:G408 NIL)
          (|le| (|List| D)))
         (SEQ (LETT |le| (QCDR |r|))
              (EXIT
               (COND
                ((EQL (LENGTH |le|) 1)
                 (CONS (|SPADfirst| |le|)
                       (CONS (QCAR |r|) (LIST (|spadConstant| % 9)))))
                (#4='T
                 (SEQ
                  (COND
                   ((EQUAL (QREFELT % 14) '|iterated|)
                    (LETT |g| (|SEM;iteratedGCD| |le| %)))
                   (#4# (LETT |g| (|SEM;randomGCD| |le| %))))
                  (EXIT
                   (COND
                    ((SPADCALL |g| (QREFELT % 77))
                     (CONS (|spadConstant| % 9) |r|))
                    (#4#
                     (SEQ
                      (LETT |le|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |e| NIL) (LETT #2# |le|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |e| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (PROG2
                                               (LETT #3#
                                                     (SPADCALL |e| |g|
                                                               (QREFELT % 99)))
                                               (QCDR #3#)
                                             (|check_union2| (QEQCAR #3# 0)
                                                             (QREFELT % 7)
                                                             (|Union|
                                                              (QREFELT % 7)
                                                              "failed")
                                                             #3#))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (CONS |g| (CONS (QCAR |r|) |le|)))))))))))))) 

(SDEFUN |SEM;primitiveRowEchelon;%R;32|
        ((AA (%))
         (%
          (|Record| (|:| |Ech| %) (|:| |Lt| (|Matrix| (|Fraction| D)))
                    (|:| |Pivots| (|List| D))
                    (|:| |Rank| (|NonNegativeInteger|)))))
        (SPROG
         ((A (%)) (#1=#:G478 NIL) (#2=#:G479 NIL) (#3=#:G477 NIL)
          (|LTr| (|Matrix| (|Fraction| D))) (#4=#:G480 NIL)
          (|changed?| #5=(|Boolean|)) (#6=#:G481 NIL) (#7=#:G482 NIL)
          (|newr|
           #8=(|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D))))
          (|sorted?| #5#) (|oldr| #8#) (#9=#:G484 NIL) (|i| NIL)
          (#10=#:G483 NIL) (|finished?| #5#) (#11=#:G438 NIL) (|pivind| (C))
          (#12=#:G485 NIL) (|len| #13=(|NonNegativeInteger|)) (|k| (|Integer|))
          (|pivlen| #13#) (|pivrow| (|NonNegativeInteger|))
          (|tmp|
           (|Record| (|:| GCD D)
                     (|:| |Row|
                          (|Record| (|:| |Indices| (|List| C))
                                    (|:| |Entries| (|List| D))))))
          (|q| (|Fraction| D)) (#14=#:G486 NIL) (|piv| (D)) (|Pivs| (|List| D))
          (|pr| #8#) (|j| NIL) (#15=#:G487 NIL) (|c| (D)) (|r| #8#)
          (#16=#:G488 NIL) (|fd| (|Fraction| D)) (#17=#:G489 NIL) (|l| NIL)
          (#18=#:G490 NIL) (|rk| (|NonNegativeInteger|)))
         (SEQ (LETT A (SPADCALL AA (QREFELT % 52)))
              (LETT |LTr|
                    (SPADCALL
                     (PROGN
                      (LETT #1# (GETREFV #19=(QVELT A 1)))
                      (SEQ (LETT |i| 1) (LETT #2# #19#) (LETT #3# 0) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ (EXIT (SETELT #1# #3# (|spadConstant| % 101))))
                           (LETT #3#
                                 (PROG1 (|inc_SI| #3#)
                                   (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))
                      #1#)
                     (QREFELT % 104)))
              (LETT |Pivs| NIL)
              (SEQ (LETT |i| 1) (LETT #4# (QVELT A 1)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                        (LETT |changed?| NIL)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL (QCDR |r|)) NIL)
                                      ('T
                                       (SPADCALL (|SPADfirst| (QCDR |r|))
                                                 (QREFELT % 80)))))
                               (GO G191)))
                             (SEQ
                              (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT (LETT |changed?| 'T)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |sorted?| NIL)
              (SEQ (LETT #6# NIL) G190 (COND (#6# (GO G191)))
                   (SEQ (LETT |sorted?| 'T)
                        (LETT |oldr| (QAREF1O (QVELT A 3) 1 1))
                        (EXIT
                         (SEQ (LETT |i| 2) (LETT #7# (QVELT A 1)) G190
                              (COND ((|greater_SI| |i| #7#) (GO G191)))
                              (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1))
                                   (EXIT
                                    (COND
                                     ((|SEM;greater| |newr| |oldr| %)
                                      (SEQ
                                       (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                       (QSETAREF1O (QVELT A 3) (- |i| 1) |newr|
                                                   1)
                                       (SPADCALL |LTr| (- |i| 1) |i|
                                                 (QREFELT % 105))
                                       (EXIT (LETT |sorted?| NIL))))
                                     ('T (LETT |oldr| |newr|)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #6# |sorted?|) (GO G190) G191 (EXIT NIL))
              (LETT |finished?| NIL)
              (SEQ (LETT #9# NIL) (LETT |i| 1) (LETT #10# (QVELT A 1)) G190
                   (COND ((OR (|greater_SI| |i| #10#) #9#) (GO G191)))
                   (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                        (LETT |finished?| (NULL (QCAR |r|)))
                        (EXIT
                         (COND
                          (|finished?|
                           (LETT |rk|
                                 (PROG1 (LETT #11# (- |i| 1))
                                   (|check_subtype2| (>= #11# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #11#))))
                          ('T
                           (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)))
                                (LETT |pivlen| (LENGTH (QCAR |r|)))
                                (LETT |pivrow| |i|) (LETT |k| 0)
                                (SEQ (LETT |j| (+ |i| 1))
                                     (LETT #12# (QVELT A 1)) G190
                                     (COND
                                      ((OR (> |j| #12#)
                                           (NULL
                                            (COND
                                             ((NULL
                                               (QCAR
                                                (QAREF1O (QVELT A 3) |j| 1)))
                                              NIL)
                                             ('T
                                              (SPADCALL |pivind|
                                                        (|SPADfirst|
                                                         (QCAR
                                                          (QAREF1O (QVELT A 3)
                                                                   |j| 1)))
                                                        (QREFELT % 44))))))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |len|
                                            (LENGTH
                                             (QCAR
                                              (QAREF1O (QVELT A 3) |j| 1))))
                                      (LETT |k| (+ |k| 1))
                                      (EXIT
                                       (COND
                                        ((< |len| |pivlen|)
                                         (SEQ (LETT |pivlen| |len|)
                                              (EXIT (LETT |pivrow| |j|)))))))
                                     (LETT |j| (+ |j| 1)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |tmp|
                                      (|SEM;makePrimitive|
                                       (QAREF1O (QVELT A 3) |pivrow| 1) %))
                                (COND
                                 ((NULL (SPADCALL (QCAR |tmp|) (QREFELT % 77)))
                                  (SEQ
                                   (QSETAREF1O (QVELT A 3) |pivrow|
                                               (QCDR |tmp|) 1)
                                   (LETT |q|
                                         (SPADCALL (|spadConstant| % 9)
                                                   (QCAR |tmp|)
                                                   (QREFELT % 106)))
                                   (EXIT
                                    (SEQ (LETT |l| 1) (LETT #14# (QVELT A 1))
                                         G190
                                         (COND
                                          ((|greater_SI| |l| #14#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL
                                               (QAREF2O |LTr| |pivrow| |l| 1 1)
                                               (QREFELT % 107)))
                                             (QSETAREF2O |LTr| |pivrow| |l|
                                                         (SPADCALL |q|
                                                                   (QAREF2O
                                                                    |LTr|
                                                                    |pivrow|
                                                                    |l| 1 1)
                                                                   (QREFELT %
                                                                            108))
                                                         1 1)))))
                                         (LETT |l| (|inc_SI| |l|)) (GO G190)
                                         G191 (EXIT NIL))))))
                                (LETT |piv|
                                      (|SPADfirst|
                                       (QCDR
                                        (QAREF1O (QVELT A 3) |pivrow| 1))))
                                (LETT |Pivs| (CONS |piv| |Pivs|))
                                (EXIT
                                 (COND
                                  ((> |k| 0)
                                   (SEQ
                                    (COND
                                     ((SPADCALL |pivrow| |i| (QREFELT % 57))
                                      (SEQ
                                       (LETT |pr|
                                             (QAREF1O (QVELT A 3) |pivrow| 1))
                                       (QSETAREF1O (QVELT A 3) |pivrow|
                                                   (QAREF1O (QVELT A 3) |i| 1)
                                                   1)
                                       (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                                       (EXIT
                                        (SPADCALL |LTr| |i| |pivrow|
                                                  (QREFELT % 105))))))
                                    (LETT |pr|
                                          (CONS (CAR (QCDR |tmp|))
                                                (CDR (QCDR |tmp|))))
                                    (PROGN
                                     (RPLACA |pr| (CDR (QCAR |pr|)))
                                     (QCAR |pr|))
                                    (PROGN
                                     (RPLACD |pr| (CDR (QCDR |pr|)))
                                     (QCDR |pr|))
                                    (EXIT
                                     (SEQ (LETT |j| (+ |i| 1))
                                          (LETT #15# (+ |i| |k|)) G190
                                          (COND ((> |j| #15#) (GO G191)))
                                          (SEQ
                                           (LETT |r|
                                                 (CONS
                                                  (CAR
                                                   (QAREF1O (QVELT A 3)
                                                            (+ |i| 1) 1))
                                                  (CDR
                                                   (QAREF1O (QVELT A 3)
                                                            (+ |i| 1) 1))))
                                           (LETT |c| (|SPADfirst| (QCDR |r|)))
                                           (PROGN
                                            (RPLACA |r| (CDR (QCAR |r|)))
                                            (QCAR |r|))
                                           (PROGN
                                            (RPLACD |r| (CDR (QCDR |r|)))
                                            (QCDR |r|))
                                           (LETT |r|
                                                 (|SEM;addRows| |piv| |r|
                                                  (SPADCALL |c| (QREFELT % 89))
                                                  |pr| %))
                                           (SEQ (LETT |l| 1)
                                                (LETT #16# (QVELT A 1)) G190
                                                (COND
                                                 ((|greater_SI| |l| #16#)
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |fd|
                                                       (SPADCALL
                                                        (SPADCALL |piv|
                                                                  (QAREF2O
                                                                   |LTr|
                                                                   (+ |i| 1)
                                                                   |l| 1 1)
                                                                  (QREFELT %
                                                                           109))
                                                        (SPADCALL |c|
                                                                  (QAREF2O
                                                                   |LTr| |i|
                                                                   |l| 1 1)
                                                                  (QREFELT %
                                                                           109))
                                                        (QREFELT % 110)))
                                                 (EXIT
                                                  (QSETAREF2O |LTr| (+ |i| 1)
                                                              |l| |fd| 1 1)))
                                                (LETT |l| (|inc_SI| |l|))
                                                (GO G190) G191 (EXIT NIL))
                                           (SEQ (LETT |l| (+ |i| 2))
                                                (LETT #17#
                                                      (-
                                                       (+ (+ (* 2 |i|) |k|) 1)
                                                       |j|))
                                                G190
                                                (COND ((> |l| #17#) (GO G191)))
                                                (SEQ
                                                 (QSETAREF1O (QVELT A 3)
                                                             (- |l| 1)
                                                             (QAREF1O
                                                              (QVELT A 3) |l|
                                                              1)
                                                             1)
                                                 (EXIT
                                                  (SPADCALL |LTr| (- |l| 1) |l|
                                                            (QREFELT % 105))))
                                                (LETT |l| (+ |l| 1)) (GO G190)
                                                G191 (EXIT NIL))
                                           (SEQ
                                            (LETT |l|
                                                  (- (+ (+ (* 2 |i|) |k|) 2)
                                                     |j|))
                                            (LETT #18# (QVELT A 1)) G190
                                            (COND
                                             ((OR (> |l| #18#)
                                                  (NULL
                                                   (|SEM;greater|
                                                    (QAREF1O (QVELT A 3) |l| 1)
                                                    |r| %)))
                                              (GO G191)))
                                            (SEQ
                                             (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                         (QAREF1O (QVELT A 3)
                                                                  |l| 1)
                                                         1)
                                             (EXIT
                                              (SPADCALL |LTr| (- |l| 1) |l|
                                                        (QREFELT % 105))))
                                            (LETT |l| (+ |l| 1)) (GO G190) G191
                                            (EXIT NIL))
                                           (EXIT
                                            (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                        |r| 1)))
                                          (LETT |j| (+ |j| 1)) (GO G190) G191
                                          (EXIT NIL))))))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# |finished?|)))
                   (GO G190) G191 (EXIT NIL))
              (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1))))
              (EXIT (VECTOR A |LTr| |Pivs| |rk|))))) 

(SDEFUN |SEM;*;M2%;33| ((LM (|Matrix| D)) (AA (%)) (% (%)))
        (SPROG
         ((A (%)) (|rlen| (|NonNegativeInteger|)) (|res| (%)) (|c| NIL)
          (#1=#:G515 NIL) (|tmp| (|Vector| D)) (|i| NIL) (#2=#:G516 NIL)
          (|inds| (|List| C)) (#3=#:G517 NIL) (#4=#:G518 NIL) (|k| NIL)
          (#5=#:G519 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ
          (COND
           ((SPADCALL (ANCOLS LM) (QVELT AA 1) (QREFELT % 57))
            (|error| "improper matrix dimensions"))
           ('T
            (SEQ (LETT A (SPADCALL AA (QREFELT % 52)))
                 (LETT |rlen| (ANROWS LM))
                 (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT % 32)))
                 (SEQ (LETT |c| NIL) (LETT #1# (QVELT A 2)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| % 34)))
                           (SEQ (LETT |i| 1) (LETT #2# (QVELT A 1)) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                                     (LETT |inds| (QCAR |r|))
                                     (EXIT
                                      (COND
                                       ((NULL (NULL |inds|))
                                        (COND
                                         ((SPADCALL (|SPADfirst| |inds|) |c|
                                                    (QREFELT % 44))
                                          (SEQ
                                           (SEQ (LETT |k| 1) (LETT #3# |rlen|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |k| #3#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (QAREF2O LM |k| |i| 1 1)
                                                      (QREFELT % 80)))
                                                    (QSETAREF1O |tmp| |k|
                                                                (SPADCALL
                                                                 (QAREF1O |tmp|
                                                                          |k|
                                                                          1)
                                                                 (SPADCALL
                                                                  (QAREF2O LM
                                                                           |k|
                                                                           |i|
                                                                           1 1)
                                                                  (|SPADfirst|
                                                                   (QCDR |r|))
                                                                  (QREFELT %
                                                                           78))
                                                                 (QREFELT %
                                                                          79))
                                                                1)))))
                                                (LETT |k| (|inc_SI| |k|))
                                                (GO G190) G191 (EXIT NIL))
                                           (PROGN
                                            (RPLACD |r| (CDR (QCDR |r|)))
                                            (QCDR |r|))
                                           (PROGN
                                            (RPLACA |r| (CDR |inds|))
                                            (QCAR |r|))
                                           (EXIT
                                            (QSETAREF1O (QVELT A 3) |i| |r|
                                                        1)))))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #4# |rlen|) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL (QAREF1O |tmp| |k| 1)
                                                (QREFELT % 80)))
                                     (SEQ
                                      (LETT |r|
                                            (QAREF1O (QVELT |res| 3) |k| 1))
                                      (PROGN
                                       (RPLACA |r| (CONS |c| (QCAR |r|)))
                                       (QCAR |r|))
                                      (PROGN
                                       (RPLACD |r|
                                               (CONS (QAREF1O |tmp| |k| 1)
                                                     (QCDR |r|)))
                                       (QCDR |r|))
                                      (EXIT
                                       (QSETAREF1O (QVELT |res| 3) |k| |r|
                                                   1)))))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1) (LETT #5# |rlen|) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1))
                           (PROGN
                            (RPLACA |r| (NREVERSE (QCAR |r|)))
                            (QCAR |r|))
                           (PROGN
                            (RPLACD |r| (NREVERSE (QCDR |r|)))
                            (QCDR |r|))
                           (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |SEM;mult| ((|f| (|Fraction| D)) (|d| (D)) (% (D)))
        (SPROG ((|res| (D)) (|tmp| (|Union| D "failed")))
               (SEQ
                (LETT |res|
                      (SPADCALL (SPADCALL |f| (QREFELT % 114)) |d|
                                (QREFELT % 78)))
                (LETT |tmp|
                      (SPADCALL |res| (SPADCALL |f| (QREFELT % 115))
                                (QREFELT % 99)))
                (EXIT
                 (COND ((QEQCAR |tmp| 1) (|error| "cannot divide in mult"))
                       ('T (QCDR |tmp|))))))) 

(SDEFUN |SEM;*;M2%;35| ((LM (|Matrix| (|Fraction| D))) (AA (%)) (% (%)))
        (SPROG
         ((A (%)) (|rlen| (|NonNegativeInteger|)) (|res| (%)) (|c| NIL)
          (#1=#:G556 NIL) (|tmp| (|Vector| (|Fraction| D))) (|i| NIL)
          (#2=#:G557 NIL) (|inds| (|List| C)) (#3=#:G558 NIL) (#4=#:G559 NIL)
          (|d| (|Union| D "failed")) (|k| NIL) (#5=#:G560 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| C)) (|:| |Entries| (|List| D)))))
         (SEQ
          (COND
           ((SPADCALL (ANCOLS LM) (QVELT AA 1) (QREFELT % 57))
            (|error| "improper matrix dimensions"))
           ('T
            (SEQ (LETT A (SPADCALL AA (QREFELT % 52)))
                 (LETT |rlen| (ANROWS LM))
                 (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT % 32)))
                 (SEQ (LETT |c| NIL) (LETT #1# (QVELT A 2)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| % 116)))
                       (SEQ (LETT |i| 1) (LETT #2# (QVELT A 1)) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1))
                                 (LETT |inds| (QCAR |r|))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |inds|))
                                    (COND
                                     ((SPADCALL (|SPADfirst| |inds|) |c|
                                                (QREFELT % 44))
                                      (SEQ
                                       (SEQ (LETT |k| 1) (LETT #3# |rlen|) G190
                                            (COND
                                             ((|greater_SI| |k| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (QAREF2O LM |k| |i| 1 1)
                                                  (QREFELT % 107)))
                                                (QSETAREF1O |tmp| |k|
                                                            (SPADCALL
                                                             (QAREF1O |tmp| |k|
                                                                      1)
                                                             (SPADCALL
                                                              (QAREF2O LM |k|
                                                                       |i| 1 1)
                                                              (|SPADfirst|
                                                               (QCDR |r|))
                                                              (QREFELT % 117))
                                                             (QREFELT % 118))
                                                            1)))))
                                            (LETT |k| (|inc_SI| |k|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (PROGN
                                        (RPLACA |r| (CDR |inds|))
                                        (QCAR |r|))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) |i| |r|
                                                    1)))))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #4# |rlen|) G190
                             (COND ((|greater_SI| |k| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QAREF1O |tmp| |k| 1)
                                            (QREFELT % 107)))
                                 (SEQ
                                  (LETT |d|
                                        (SPADCALL (QAREF1O |tmp| |k| 1)
                                                  (QREFELT % 120)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |d| 1)
                                     (|error| "cannot divide in *"))
                                    ('T
                                     (SEQ
                                      (LETT |r|
                                            (QAREF1O (QVELT |res| 3) |k| 1))
                                      (PROGN
                                       (RPLACA |r| (CONS |c| (QCAR |r|)))
                                       (QCAR |r|))
                                      (PROGN
                                       (RPLACD |r|
                                               (CONS (QCDR |d|) (QCDR |r|)))
                                       (QCDR |r|))
                                      (EXIT
                                       (QSETAREF1O (QVELT |res| 3) |k| |r|
                                                   1)))))))))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |k| 1) (LETT #5# |rlen|) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1))
                           (PROGN
                            (RPLACA |r| (NREVERSE (QCAR |r|)))
                            (QCAR |r|))
                           (PROGN
                            (RPLACD |r| (NREVERSE (QCDR |r|)))
                            (QCDR |r|))
                           (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |SparseEchelonMatrix;|)) 

(DEFUN |SparseEchelonMatrix;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G561 NIL)
    (|i| NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT |dv$| (LIST '|SparseEchelonMatrix| DV$1 DV$2))
     (LETT % (GETREFV 122))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#2| '(|GcdDomain|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))))))
     (|haddProp| |$ConstructorCache| '|SparseEchelonMatrix| (LIST DV$1 DV$2)
                 (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 8
               (PROGN
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 1) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS |i| #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                1))
     (QSETREFV % 10 (- (QREFELT % 8) 1))
     (QSETREFV % 11 (CONS NIL NIL))
     (QSETREFV % 12 (|HasCategory| |#2| '(|lazyRepresentation|)))
     (QSETREFV % 13 113)
     (QSETREFV % 14 '|iterated|)
     (QSETREFV % 17
               (|Record| (|:| |NCols| (|NonNegativeInteger|))
                         (|:| |NRows| (|NonNegativeInteger|))
                         (|:| |AllInds| (|List| |#1|))
                         (|:| |Rows|
                              (|Vector|
                               (|Record| (|:| |Indices| (|List| |#1|))
                                         (|:| |Entries| (|List| |#2|)))))))
     (COND
      ((|testBitVector| |pv$| 1)
       (PROGN
        (QSETREFV % 94 (CONS (|dispatchFunction| |SEM;setGcdMode;2S;28|) %))
        (QSETREFV % 112
                  (CONS (|dispatchFunction| |SEM;primitiveRowEchelon;%R;32|)
                        %)))))
     (COND
      ((|testBitVector| |pv$| 2)
       (PROGN (QSETREFV % 121 (CONS (|dispatchFunction| |SEM;*;M2%;35|) %)))))
     %)))) 

(DEFUN |SparseEchelonMatrix| (&REST #1=#:G562)
  (SPROG NIL
         (PROG (#2=#:G563)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseEchelonMatrix|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SparseEchelonMatrix;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SparseEchelonMatrix|)))))))))) 

(MAKEPROP '|SparseEchelonMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|minInd|
              (0 . |1|) '|offset| '|emptyRec| '|noChecks?| '|seed| '|GCDmode|
              (|Boolean|) (4 . <) '|Rep| (|NonNegativeInteger|)
              |SEM;ncols;%Nni;2| |SEM;nrows;%Nni;3| (|List| 6) (10 . |copy|)
              |SEM;allIndices;%L;4|
              (|Record| (|:| |Indices| 21) (|:| |Entries| 30)) (|Integer|)
              |SEM;row;%IR;5| (|Void|) (15 . |void|) |SEM;setRow!;%IRV;6|
              (|List| 7) |SEM;setRow!;%ILLV;7| |SEM;new;LI%;8|
              (19 . |position|) (25 . |0|) (29 . |qelt|) |SEM;elt;%ICD;9|
              (35 . |qsetelt!|) (42 . |insert!|) (49 . |insert!|)
              |SEM;setelt!;%ICDV;10| (|List| 24) (|Vector| 24) (56 . |entries|)
              (61 . =) (|Matrix| 7) |SEM;coerce;%M;11| (|OutputForm|)
              (67 . |coerce|) (72 . |coerce|) |SEM;coerce;%Of;12| (77 . |copy|)
              |SEM;copy;2%;13| (|Mapping| 15 6 6) (82 . |merge!|)
              (89 . |removeDuplicates!|) |SEM;elimZeroCols!;%V;14| (94 . ~=)
              (|Mapping| 15 6) |SEM;purge!;%MV;15| |SEM;sortedPurge!;%MV;16|
              |SEM;deleteRow!;%IV;17| (100 . |construct|)
              (105 . |setDifference|) (111 . |sort!|) (117 . |merge|)
              |SEM;consRow!;%RV;18| (124 . |concat|) |SEM;appendRow!;%RV;19|
              |SEM;extract;%2I%;20| |SEM;join;3%;21| (130 . |append|)
              (136 . |append|) |SEM;horizJoin;3%;22| (142 . >)
              (|Record| (|:| |Left| %) (|:| |Right| %)) |SEM;horizSplit;%CR;23|
              (148 . |one?|) (153 . *) (159 . +) (165 . |zero?|)
              (170 . |concat!|) (176 . |concat!|)
              (|Record| (|:| |Index| 6) (|:| |Entry| 7)) |SEM;pivot;%IR;25|
              |SEM;pivots;%R;26| (|Vector| 7) (182 . |diagonalMatrix|)
              (187 . |swapRows!|) (194 . -) (199 . -)
              (|Record| (|:| |Ech| %) (|:| |Lt| 45) (|:| |Pivots| 30)
                        (|:| |Rank| 18))
              |SEM;rowEchelon;%R;27| (|Symbol|) (205 . |setGcdMode|)
              (210 . |second|) (215 . |gcd|) (221 . *) (|Union| % '"failed")
              (227 . |exquo|) (|Fraction| 7) (233 . |1|) (|Vector| 100)
              (|Matrix| 100) (237 . |diagonalMatrix|) (242 . |swapRows!|)
              (249 . /) (255 . |zero?|) (260 . *) (266 . *) (272 . -)
              (|Record| (|:| |Ech| %) (|:| |Lt| 103) (|:| |Pivots| 30)
                        (|:| |Rank| 18))
              (278 . |primitiveRowEchelon|) |SEM;*;M2%;33| (283 . |numer|)
              (288 . |denom|) (293 . |0|) (297 . *) (303 . +)
              (|Union| 7 '"failed") (309 . |retractIfCan|) (314 . *))
           '#(|sortedPurge!| 320 |setelt!| 326 |setRow!| 334 |setGcdMode| 349
              |rowEchelon| 354 |row| 359 |purge!| 365 |primitiveRowEchelon| 371
              |pivots| 376 |pivot| 381 |nrows| 387 |new| 392 |ncols| 398 |join|
              403 |horizSplit| 409 |horizJoin| 415 |extract| 421 |elt| 428
              |elimZeroCols!| 435 |deleteRow!| 440 |copy| 446 |consRow!| 451
              |coerce| 457 |appendRow!| 467 |allIndices| 473 * 478)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL NIL NIL NIL)
                       (CONS
                        '#((|CoercibleTo| (|Matrix| 7)) (|shallowlyMutable|)
                           (|finiteAggregate|) (|CoercibleTo| 47))
                        (|makeByteWordVec2| 121
                                            '(0 7 0 9 2 6 15 0 0 16 1 21 0 0 22
                                              0 27 0 28 2 21 25 6 0 33 0 7 0 34
                                              2 30 7 0 25 35 3 30 7 0 25 7 37 3
                                              21 0 6 0 25 38 3 30 0 7 0 25 39 1
                                              42 41 0 43 2 6 15 0 0 44 1 7 47 0
                                              48 1 45 47 0 49 1 30 0 0 51 3 21
                                              0 53 0 0 54 1 21 0 0 55 2 18 15 0
                                              0 57 1 42 0 41 62 2 21 0 0 0 63 2
                                              21 0 53 0 64 3 21 0 53 0 0 65 2
                                              41 0 0 24 67 2 21 0 0 0 71 2 30 0
                                              0 0 72 2 6 15 0 0 74 1 7 15 0 77
                                              2 7 0 0 0 78 2 7 0 0 0 79 1 7 15
                                              0 80 2 21 0 0 0 81 2 30 0 0 0 82
                                              1 45 0 86 87 3 45 0 0 25 25 88 1
                                              7 0 0 89 2 7 0 0 0 90 1 0 93 93
                                              94 1 30 7 0 95 2 7 0 0 0 96 2 7 0
                                              25 0 97 2 7 98 0 0 99 0 100 0 101
                                              1 103 0 102 104 3 103 0 0 25 25
                                              105 2 100 0 7 7 106 1 100 15 0
                                              107 2 100 0 0 0 108 2 100 0 7 0
                                              109 2 100 0 0 0 110 1 0 111 0 112
                                              1 100 7 0 114 1 100 7 0 115 0 100
                                              0 116 2 100 0 0 7 117 2 100 0 0 0
                                              118 1 100 119 0 120 2 0 0 103 0
                                              121 2 0 27 0 58 60 4 0 27 0 25 6
                                              7 40 3 0 27 0 25 24 29 4 0 27 0
                                              25 21 30 31 1 1 93 93 94 1 0 91 0
                                              92 2 0 24 0 25 26 2 0 27 0 58 59
                                              1 1 111 0 112 1 0 24 0 85 2 0 83
                                              0 25 84 1 0 18 0 20 2 0 0 21 25
                                              32 1 0 18 0 19 2 0 0 0 0 70 2 0
                                              75 0 6 76 2 0 0 0 0 73 3 0 0 0 25
                                              25 69 3 0 7 0 25 6 36 1 0 27 0 56
                                              2 0 27 0 25 61 1 0 0 0 52 2 0 27
                                              0 24 66 1 0 45 0 46 1 0 47 0 50 2
                                              0 27 0 24 68 1 0 21 0 23 2 0 0 45
                                              0 113 2 2 0 103 0 121)))))
           '|lookupComplete|)) 
