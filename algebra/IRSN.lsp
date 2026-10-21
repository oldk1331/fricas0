
(SDEFUN |IRSN;aIdInverse| ((% (|Void|)))
        (SPROG
         ((#1=#:G138 NIL) (#2=#:G137 NIL) (|idperm| (|List| (|Integer|)))
          (#3=#:G139 NIL) (|l| NIL) (#4=#:G140 NIL) (|j| NIL) (#5=#:G29 NIL)
          (#6=#:G45 NIL) (|k| NIL) (#7=#:G141 NIL) (|i| NIL) (#8=#:G59 NIL)
          (#9=#:G82 NIL) (#10=#:G130 NIL))
         (SEQ
          (EXIT
           (SEQ (SETELT % 13 (MAKE_MATRIX1 (QREFELT % 7) (QREFELT % 7) 0))
                (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 7)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL (QREFELT % 13) |k| |k| 1 (QREFELT % 16))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< (QREFELT % 10) 5)
                  (PROGN (LETT #2# (QREFELT % 13)) (GO #11=#:G136))))
                (LETT |idperm| NIL)
                (SEQ (LETT |k| (QREFELT % 10)) G190
                     (COND ((< |k| 1) (GO G191)))
                     (SEQ (EXIT (LETT |idperm| (CONS |k| |idperm|))))
                     (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| 1) (LETT #3# (- (QREFELT % 7) 1)) G190
                     (COND ((|greater_SI| |k| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| (+ |k| 1)) (LETT #4# (QREFELT % 7)) G190
                            (COND ((> |l| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT % 13) |k| |l|
                                        (|IRSN;signum| |k| |l| |idperm| %)
                                        (QREFELT % 16))))
                            (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SEQ (LETT |j| (QREFELT % 7)) G190
                      (COND ((< |j| 2) (GO G191)))
                      (SEQ
                       (SEQ (LETT |i| (- |j| 1)) G190
                            (COND ((< |i| 1) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT % 13)
                                        (PROG1 (LETT #5# |i|)
                                          (|check_subtype2| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                        |j|
                                        (-
                                         (SPADCALL (QREFELT % 13)
                                                   (PROG1 (LETT #6# |i|)
                                                     (|check_subtype2|
                                                      (>= #6# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #6#))
                                                   |j| (QREFELT % 17)))
                                        (QREFELT % 16))))
                            (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |k| (+ |j| 1)) (LETT #7# (QREFELT % 7)) G190
                             (COND ((> |k| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |i| (- |j| 1)) G190
                                    (COND ((< |i| 1) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL (QREFELT % 13)
                                                (PROG1 (LETT #8# |i|)
                                                  (|check_subtype2| (>= #8# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #8#))
                                                |k|
                                                (+
                                                 (SPADCALL (QREFELT % 13)
                                                           (PROG1
                                                               (LETT #9# |i|)
                                                             (|check_subtype2|
                                                              (>= #9# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #9#))
                                                           |k| (QREFELT % 17))
                                                 (*
                                                  (SPADCALL (QREFELT % 13)
                                                            (PROG1
                                                                (LETT #10# |i|)
                                                              (|check_subtype2|
                                                               (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                                            |j| (QREFELT % 17))
                                                  (SPADCALL (QREFELT % 13) |j|
                                                            |k|
                                                            (QREFELT % 17))))
                                                (QREFELT % 16))))
                                    (LETT |i| (+ |i| -1)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                      (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL)))))
          #11# (EXIT #2#)))) 

(SDEFUN |IRSN;alreadyComputed?|
        ((|lambda| (|List| #1=(|Integer|))) (% (|Void|)))
        (SPROG
         ((#2=#:G142 NIL) (#3=#:G143 NIL) (#4=#:G0 NIL) (#5=#:G153 NIL)
          (#6=#:G149 #1#) (#7=#:G147 #1#) (#8=#:G148 NIL) (#9=#:G150 NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |lambda| (QREFELT % 6) (QREFELT % 20)))
            (SEQ (SETELT % 6 |lambda|)
                 (SETELT % 9 (SPADCALL |lambda| (QREFELT % 22)))
                 (SETELT % 11
                         (PROG1 (LETT #2# (|SPADfirst| (QREFELT % 9)))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#)))
                 (SETELT % 12
                         (PROG1 (LETT #3# (|SPADfirst| |lambda|))
                           (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #3#)))
                 (SETELT % 10
                         (PROG1
                             (LETT #9#
                                   (PROGN
                                    (LETT #8# NIL)
                                    (SEQ (LETT #4# NIL) (LETT #5# |lambda|)
                                         G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT #4# (CAR #5#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #6# #4#)
                                            (COND (#8# (LETT #7# (+ #7# #6#)))
                                                  ('T
                                                   (PROGN
                                                    (LETT #7# #6#)
                                                    (LETT #8# 'T)))))))
                                         (LETT #5# (CDR #5#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#8# #7#) ('T 0))))
                           (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #9#)))
                 (SETELT % 8 (SPADCALL |lambda| (QREFELT % 25)))
                 (SETELT % 7 (LENGTH (QREFELT % 8)))
                 (EXIT (|IRSN;aIdInverse| %)))))))) 

(SDEFUN |IRSN;listPermutation|
        ((|pi| (|Permutation| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG ((|k| NIL) (|li| (|List| (|Integer|))))
               (SEQ (LETT |li| NIL)
                    (SEQ (LETT |k| (QREFELT % 10)) G190
                         (COND ((< |k| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |li|
                                 (CONS (SPADCALL |pi| |k| (QREFELT % 27))
                                       |li|))))
                         (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |li|)))) 

(SDEFUN |IRSN;signum|
        ((|numberOfRowTableau| (|NonNegativeInteger|))
         (|numberOfColumnTableau| (|NonNegativeInteger|))
         (|pi| (|List| (|Integer|))) (% (|Integer|)))
        (SPROG
         ((|rowtab| #1=(|Matrix| (|Integer|))) (|columntab| #1#)
          (|s| #2=(|NonNegativeInteger|)) (|ctrl| #3=(|Boolean|)) (|endk| #3#)
          (|swap| (|Integer|)) (|z| #2#) (|sign| (|Integer|)) (|end| #3#)
          (|l| #2#) (|k| #2#))
         (SEQ
          (LETT |rowtab|
                (SPADCALL
                 (SPADCALL (QREFELT % 8) |numberOfRowTableau| (QREFELT % 28))
                 (QREFELT % 29)))
          (LETT |columntab|
                (SPADCALL
                 (SPADCALL (QREFELT % 8) |numberOfColumnTableau|
                           (QREFELT % 28))
                 (QREFELT % 29)))
          (LETT |sign| 1) (LETT |end| NIL) (LETT |k| 1)
          (SEQ G190
               (COND
                ((NULL (COND ((<= |k| (QREFELT % 11)) (NULL |end|)) ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |l| 1)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((<= |l|
                                  (SPADCALL (QREFELT % 6) |k| (QREFELT % 30)))
                              (NULL |end|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |z| |l|) (LETT |endk| NIL)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((<= |z|
                                            (SPADCALL (QREFELT % 6) |k|
                                                      (QREFELT % 30)))
                                        (NULL |endk|))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ (LETT |s| |k|) (LETT |ctrl| 'T)
                                        (SEQ G190
                                             (COND ((NULL |ctrl|) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((<= |s|
                                                     (SPADCALL (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 30)))
                                                 (COND
                                                  ((EQL
                                                    (+ 1
                                                       (SPADCALL |rowtab| |k|
                                                                 |z|
                                                                 (QREFELT %
                                                                          17)))
                                                    (SPADCALL |pi|
                                                              (+ 1
                                                                 (SPADCALL
                                                                  |columntab|
                                                                  |s| |l|
                                                                  (QREFELT %
                                                                           17)))
                                                              (QREFELT % 30)))
                                                   (LETT |ctrl| NIL))
                                                  ('T (LETT |s| (+ |s| 1)))))
                                                ('T (LETT |ctrl| NIL)))))
                                             NIL (GO G190) G191 (EXIT NIL))
                                        (LETT |endk|
                                              (<= |s|
                                                  (SPADCALL (QREFELT % 9) |l|
                                                            (QREFELT % 30))))
                                        (EXIT
                                         (COND
                                          (|endk|
                                           (SEQ
                                            (COND
                                             ((< |k| |s|)
                                              (SEQ (LETT |sign| (- |sign|))
                                                   (LETT |swap|
                                                         (SPADCALL |columntab|
                                                                   |s| |l|
                                                                   (QREFELT %
                                                                            17)))
                                                   (SPADCALL |columntab| |s|
                                                             |l|
                                                             (SPADCALL
                                                              |columntab| |k|
                                                              |l|
                                                              (QREFELT % 17))
                                                             (QREFELT % 16))
                                                   (EXIT
                                                    (SPADCALL |columntab| |k|
                                                              |l| |swap|
                                                              (QREFELT %
                                                                       16))))))
                                            (EXIT
                                             (COND
                                              ((< |l| |z|)
                                               (SEQ
                                                (LETT |swap|
                                                      (SPADCALL |rowtab| |k|
                                                                |z|
                                                                (QREFELT %
                                                                         17)))
                                                (SPADCALL |rowtab| |k| |z|
                                                          (SPADCALL |rowtab|
                                                                    |k| |l|
                                                                    (QREFELT %
                                                                             17))
                                                          (QREFELT % 16))
                                                (EXIT
                                                 (SPADCALL |rowtab| |k| |l|
                                                           |swap|
                                                           (QREFELT %
                                                                    16)))))))))
                                          ('T (LETT |z| (+ |z| 1))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (COND
                               ((> |z|
                                   (SPADCALL (QREFELT % 6) |k| (QREFELT % 30)))
                                (SEQ (LETT |sign| 0) (EXIT (LETT |end| 'T)))))
                              (EXIT (LETT |l| (+ |l| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |k| (+ |k| 1))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |sign|)))) 

(SDEFUN |IRSN;sumPartition|
        ((|lambda| (|List| (|Integer|))) (% (|NonNegativeInteger|)))
        (SPROG
         ((|x| NIL) (#1=#:G186 NIL) (|sum| (|Integer|)) (|ok| (|Boolean|))
          (|prev| (|Integer|)) (#2=#:G183 NIL))
         (SEQ (LETT |ok| 'T) (LETT |prev| (|SPADfirst| |lambda|))
              (LETT |sum| 0)
              (SEQ (LETT |x| NIL) (LETT #1# |lambda|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |sum| (+ |sum| |x|))
                        (LETT |ok| (COND (|ok| (>= |prev| |x|)) ('T NIL)))
                        (EXIT (LETT |prev| |x|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND ((NULL |ok|) (|error| "No proper partition ")))
              (EXIT
               (PROG1 (LETT #2# |sum|)
                 (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #2#)))))) 

(SDEFUN |IRSN;testPermutation|
        ((|pi| (|List| (|Integer|))) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G199 NIL) (|ok| (|Boolean|)) (#2=#:G192 NIL)
          (|test| (|Vector| (|Boolean|))) (|i| NIL) (#3=#:G200 NIL)
          (#4=#:G196 NIL))
         (SEQ (LETT |ok| 'T) (SETELT % 10 0)
              (SEQ (LETT |i| NIL) (LETT #1# |pi|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (COND ((> |i| (QREFELT % 10)) (SETELT % 10 |i|)))
                        (EXIT (COND ((< |i| 1) (LETT |ok| NIL)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((EQL (QREFELT % 10) (LENGTH |pi|))
                (COND ((NULL |ok|) (|error| #5="No permutation of 1,2,..,n"))))
               ('T (|error| #5#)))
              (LETT |test|
                    (MAKEARR1
                     (PROG1 (LETT #2# (QREFELT % 10))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     NIL))
              (SEQ (LETT |i| NIL) (LETT #3# |pi|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |test| |i| 'T (QREFELT % 32))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL NIL |test| (QREFELT % 33))
                (|error| "No permutation")))
              (EXIT
               (PROG1 (LETT #4# (QREFELT % 10))
                 (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #4#)))))) 

(SDEFUN |IRSN;dimensionOfIrreducibleRepresentation;LNni;7|
        ((|lambda| (|List| (|Integer|))) (% (|NonNegativeInteger|)))
        (SPROG
         ((|nn| (|Integer|)) (|lambdaprime| (|List| (|Integer|))) (|i| NIL)
          (#1=#:G208 NIL) (|j| NIL) (#2=#:G209 NIL) (|dd| (|Integer|))
          (#3=#:G205 NIL))
         (SEQ (LETT |nn| (|IRSN;sumPartition| |lambda| %)) (LETT |dd| 1)
              (LETT |lambdaprime| (SPADCALL |lambda| (QREFELT % 22)))
              (SEQ (LETT |i| 1)
                   (LETT #1# (SPADCALL |lambdaprime| 1 (QREFELT % 30))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #2# (SPADCALL |lambda| |i| (QREFELT % 30)))
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |dd|
                                  (* |dd|
                                     (+
                                      (-
                                       (-
                                        (+
                                         (SPADCALL |lambda| |i| (QREFELT % 30))
                                         (SPADCALL |lambdaprime| |j|
                                                   (QREFELT % 30)))
                                        |i|)
                                       |j|)
                                      1)))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1
                   (LETT #3#
                         (|quotient_INT| (SPADCALL |nn| (QREFELT % 35)) |dd|))
                 (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #3#)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LPM;8|
        ((|lambda| (|List| (|Integer|))) (|pi| (|Permutation| (|Integer|)))
         (% (|Matrix| (|Integer|))))
        (SPROG
         ((|nn| (|NonNegativeInteger|)) (|piList| (|List| (|Integer|)))
          (|aPi| (|Matrix| (|Integer|))) (|k| NIL) (#1=#:G217 NIL) (|l| NIL)
          (#2=#:G218 NIL))
         (SEQ (LETT |nn| (|IRSN;sumPartition| |lambda| %))
              (|IRSN;alreadyComputed?| |lambda| %)
              (LETT |piList| (|IRSN;listPermutation| |pi| %))
              (COND
               ((NULL (EQL |nn| (|IRSN;testPermutation| |piList| %)))
                (|error| "Partition and permutation are not consistent")))
              (LETT |aPi| (MAKE_MATRIX1 (QREFELT % 7) (QREFELT % 7) 0))
              (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| 1) (LETT #2# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |l| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |aPi| |k| |l|
                                      (|IRSN;signum| |k| |l| |piList| %)
                                      (QREFELT % 16))))
                          (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT % 13) |aPi| (QREFELT % 38)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LL;9|
        ((|lambda| (|List| (|Integer|))) (% (|List| (|Matrix| (|Integer|)))))
        (SPROG
         ((|k| NIL) (|li| (|List| (|Integer|)))
          (|listperm| (|List| (|Permutation| (|Integer|)))))
         (SEQ (LETT |listperm| NIL) (LETT |li| NIL)
              (|IRSN;sumPartition| |lambda| %)
              (|IRSN;alreadyComputed?| |lambda| %)
              (LETT |listperm|
                    (COND
                     ((EQL (QREFELT % 10) 1)
                      (CONS (|spadConstant| % 40) |listperm|))
                     ((EQL (QREFELT % 10) 2)
                      (CONS (SPADCALL (LIST 1 2) (QREFELT % 41)) |listperm|))
                     ('T
                      (SEQ
                       (SEQ (LETT |k| (QREFELT % 10)) G190
                            (COND ((< |k| 1) (GO G191)))
                            (SEQ (EXIT (LETT |li| (CONS |k| |li|))))
                            (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                       (LETT |listperm|
                             (CONS (SPADCALL |li| (QREFELT % 41)) |listperm|))
                       (EXIT
                        (CONS (SPADCALL (LIST 1 2) (QREFELT % 41))
                              |listperm|))))))
              (EXIT (SPADCALL |lambda| |listperm| (QREFELT % 43)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LLL;10|
        ((|lambda| (|List| (|Integer|)))
         (|listperm| (|List| (|Permutation| (|Integer|))))
         (% (|List| (|Matrix| (|Integer|)))))
        (SPROG ((#1=#:G228 NIL) (|pi| NIL) (#2=#:G229 NIL))
               (SEQ (|IRSN;sumPartition| |lambda| %)
                    (|IRSN;alreadyComputed?| |lambda| %)
                    (EXIT
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |pi| NIL) (LETT #2# |listperm|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |pi| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |lambda| |pi| (QREFELT % 39))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#)))))))) 

(DECLAIM (NOTINLINE |IrrRepSymNatPackage;|)) 

(DEFUN |IrrRepSymNatPackage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IrrRepSymNatPackage|))
          (LETT % (GETREFV 45))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IrrRepSymNatPackage| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 NIL)
          (QSETREFV % 7 0)
          (QSETREFV % 8 NIL)
          (QSETREFV % 9 NIL)
          (QSETREFV % 10 0)
          (QSETREFV % 11 0)
          (QSETREFV % 12 0)
          (QSETREFV % 13 (MAKE_MATRIX1 1 1 0))
          %))) 

(DEFUN |IrrRepSymNatPackage| ()
  (SPROG NIL
         (PROG (#1=#:G231)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IrrRepSymNatPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IrrRepSymNatPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|IrrRepSymNatPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|IrrRepSymNatPackage|)))))))))) 

(MAKEPROP '|IrrRepSymNatPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|oldlambda| '|flambda| '|younglist|
              '|lprime| '|n| '|rows| '|columns| '|aId| (|Integer|)
              (|Matrix| 14) (0 . |setelt!|) (8 . |elt|) (|Boolean|) (|List| 14)
              (15 . =) (|PartitionsAndPermutations|) (21 . |conjugate|)
              (|List| 15) (|SymmetricGroupCombinatoricFunctions|)
              (26 . |listYoungTableaus|) (|Permutation| 14) (31 . |eval|)
              (37 . |elt|) (43 . |copy|) (48 . |elt|) (|Vector| 18)
              (54 . |setelt!|) (61 . |member?|)
              (|IntegerCombinatoricFunctions| 14) (67 . |factorial|)
              (|NonNegativeInteger|)
              |IRSN;dimensionOfIrreducibleRepresentation;LNni;7| (72 . *)
              |IRSN;irreducibleRepresentation;LPM;8| (78 . |1|) (82 . |cycle|)
              (|List| 26) |IRSN;irreducibleRepresentation;LLL;10|
              |IRSN;irreducibleRepresentation;LL;9|)
           '#(|irreducibleRepresentation| 87
              |dimensionOfIrreducibleRepresentation| 104)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|dimensionOfIrreducibleRepresentation|
                                 ((|NonNegativeInteger|) (|List| (|Integer|))))
                                T)
                              '((|irreducibleRepresentation|
                                 ((|Matrix| (|Integer|)) (|List| (|Integer|))
                                  (|Permutation| (|Integer|))))
                                T)
                              '((|irreducibleRepresentation|
                                 ((|List| (|Matrix| (|Integer|)))
                                  (|List| (|Integer|))))
                                T)
                              '((|irreducibleRepresentation|
                                 ((|List| (|Matrix| (|Integer|)))
                                  (|List| (|Integer|))
                                  (|List| (|Permutation| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 44
                                            '(4 15 14 0 14 14 14 16 3 15 14 0
                                              14 14 17 2 19 18 0 0 20 1 21 19
                                              19 22 1 24 23 19 25 2 26 14 0 14
                                              27 2 23 15 0 14 28 1 15 0 0 29 2
                                              19 14 0 14 30 3 31 18 0 14 18 32
                                              2 31 18 18 0 33 1 34 14 14 35 2
                                              15 0 0 0 38 0 26 0 40 1 26 0 19
                                              41 1 0 23 19 44 2 0 23 19 42 43 2
                                              0 15 19 26 39 1 0 36 19 37)))))
           '|lookupComplete|)) 
