
(SDEFUN |A1AGG-;parts;AL;1| ((|x| (A)) (% (|List| S)))
        (SPROG ((#1=#:G49 NIL) (|i| NIL) (#2=#:G50 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 9)))
                      (LETT #2# (SPADCALL |x| (QREFELT % 10))) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |x| |i| (QREFELT % 11)) #1#))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |A1AGG-;sort!;M2A;2|
        ((|f| (|Mapping| (|Boolean|) S S)) (|a| (A)) (% (A)))
        (SPADCALL |f| |a| (QREFELT % 16))) 

(SDEFUN |A1AGG-;any?;MAB;3|
        ((|f| (|Mapping| (|Boolean|) S)) (|a| (A)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G63 NIL) (#2=#:G62 NIL) (#3=#:G61 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11)) |f|)
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# 'T) (GO #4=#:G60)))
                              (GO #5=#:G57))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;every?;MAB;4|
        ((|f| (|Mapping| (|Boolean|) S)) (|a| (A)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G71 NIL) (#2=#:G70 NIL) (#3=#:G69 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |a| |i| (QREFELT % 11)) |f|))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G68)))
                              (GO #5=#:G66))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;MAI;5|
        ((|f| (|Mapping| (|Boolean|) S)) (|a| (A)) (% (|Integer|)))
        (SPROG ((|i| NIL) (#1=#:G79 NIL) (#2=#:G78 NIL) (#3=#:G77 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11)) |f|)
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# |i|) (GO #4=#:G76)))
                              (GO #5=#:G74))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT (- (SPADCALL |a| (QREFELT % 9)) 1))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;find;MAU;6|
        ((|f| (|Mapping| (|Boolean|) S)) (|a| (A)) (% (|Union| S "failed")))
        (SPROG ((|i| NIL) (#1=#:G93 NIL) (#2=#:G92 NIL) (#3=#:G91 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11)) |f|)
                             (PROGN
                              (LETT #3#
                                    (PROGN
                                     (LETT #2#
                                           (CONS 0
                                                 (SPADCALL |a| |i|
                                                           (QREFELT % 11))))
                                     (GO #4=#:G90)))
                              (GO #5=#:G85))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;count;MANni;7|
        ((|f| (|Mapping| (|Boolean|) S)) (|a| (A)) (% (|NonNegativeInteger|)))
        (SPROG ((|i| NIL) (#1=#:G99 NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| 0)
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11)) |f|)
                             (LETT |n| (+ |n| 1))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |A1AGG-;map!;M2A;8| ((|f| (|Mapping| S S)) (|a| (A)) (% (A)))
        (SPROG ((|i| NIL) (#1=#:G105 NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |a| |i|
                                 (SPADCALL (SPADCALL |a| |i| (QREFELT % 11))
                                           |f|)
                                 (QREFELT % 27))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(SDEFUN |A1AGG-;setelt!;AUs2S;9|
        ((|a| (A)) (|s| (|UniversalSegment| (|Integer|))) (|x| (S)) (% (S)))
        (SPROG ((|l| (|Integer|)) (|h| (|Integer|)) (|k| NIL) (#1=#:G113 NIL))
               (SEQ (LETT |l| (SPADCALL |s| (QREFELT % 31)))
                    (LETT |h|
                          (COND
                           ((SPADCALL |s| (QREFELT % 32))
                            (SPADCALL |s| (QREFELT % 33)))
                           ('T (SPADCALL |a| (QREFELT % 10)))))
                    (COND
                     ((OR (< |l| (SPADCALL |a| (QREFELT % 9)))
                          (> |h| (SPADCALL |a| (QREFELT % 10))))
                      (EXIT (|error| "index out of range"))))
                    (SEQ (LETT |k| |l|) (LETT #1# |h|) G190
                         (COND ((> |k| #1#) (GO G191)))
                         (SEQ (EXIT (SPADCALL |a| |k| |x| (QREFELT % 27))))
                         (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |A1AGG-;reduce;MAS;10| ((|f| (|Mapping| S S S)) (|a| (A)) (% (S)))
        (SPROG ((|m| (|Integer|)) (|k| NIL) (#1=#:G120 NIL) (|r| (S)))
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT % 35))
                  (|error| "cannot reduce an empty aggregate"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL |a| (LETT |m| (SPADCALL |a| (QREFELT % 9)))
                                   (QREFELT % 11)))
                   (SEQ (LETT |k| (+ |m| 1))
                        (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                        (COND ((> |k| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |a| |k| (QREFELT % 11))
                                          |f|))))
                        (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT |r|))))))) 

(SDEFUN |A1AGG-;reduce;MA2S;11|
        ((|f| (|Mapping| S S S)) (|a| (A)) (|identity| (S)) (% (S)))
        (SPROG ((|k| NIL) (#1=#:G125 NIL))
               (SEQ
                (SEQ (LETT |k| (SPADCALL |a| (QREFELT % 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |identity|
                             (SPADCALL |identity|
                                       (SPADCALL |a| |k| (QREFELT % 11))
                                       |f|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;reduce;MA3S;12|
        ((|f| (|Mapping| S S S)) (|a| (A)) (|identity| (S)) (|absorber| (S))
         (% (S)))
        (SPROG ((|k| NIL) (#1=#:G130 NIL))
               (SEQ
                (SEQ (LETT |k| (SPADCALL |a| (QREFELT % 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT % 10))) G190
                     (COND
                      ((OR (> |k| #1#)
                           (NULL
                            (SPADCALL |identity| |absorber| (QREFELT % 39))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |identity|
                             (SPADCALL |identity|
                                       (SPADCALL |a| |k| (QREFELT % 11))
                                       |f|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;stupidnew|
        ((|n| (|NonNegativeInteger|)) (|a| (A)) (|b| (A)) (% (A)))
        (COND ((ZEROP |n|) (SPADCALL (QREFELT % 41)))
              (#1='T
               (SPADCALL |n|
                         (COND
                          ((SPADCALL |a| (QREFELT % 35))
                           (SPADCALL |b| (SPADCALL |b| (QREFELT % 9))
                                     (QREFELT % 11)))
                          (#1#
                           (SPADCALL |a| (SPADCALL |a| (QREFELT % 9))
                                     (QREFELT % 11))))
                         (QREFELT % 42))))) 

(SDEFUN |A1AGG-;stupidget| ((|l| (|List| A)) (% (S)))
        (SPROG ((|a| NIL) (#1=#:G141 NIL) (#2=#:G140 NIL) (#3=#:G139 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |a| (QREFELT % 35)))
                             (PROGN
                              (LETT #3#
                                    (PROGN
                                     (LETT #2# (SPADCALL |a| (QREFELT % 43)))
                                     (GO #4=#:G138)))
                              (GO #5=#:G136))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT (|error| "Should not happen"))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;map;M3A;15|
        ((|f| (|Mapping| S S S)) (|a| (A)) (|b| (A)) (% (A)))
        (SPROG
         ((|m| (|Integer|)) (|n| (|Integer|)) (#1=#:G146 NIL)
          (|l| (|NonNegativeInteger|)) (|c| (A)) (|j| NIL) (#2=#:G151 NIL)
          (|i| NIL))
         (SEQ
          (LETT |m|
                (MAX (SPADCALL |a| (QREFELT % 9))
                     (SPADCALL |b| (QREFELT % 9))))
          (LETT |n|
                (MIN (SPADCALL |a| (QREFELT % 10))
                     (SPADCALL |b| (QREFELT % 10))))
          (LETT |l|
                (PROG1 (LETT #1# (MAX 0 (+ (- |n| |m|) 1)))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |c| (|A1AGG-;stupidnew| |l| |a| |b| %))
          (SEQ (LETT |j| |m|) (LETT #2# |n|)
               (LETT |i| (SPADCALL |c| (QREFELT % 9))) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |c| |i|
                           (SPADCALL (SPADCALL |a| |j| (QREFELT % 11))
                                     (SPADCALL |b| |j| (QREFELT % 11)) |f|)
                           (QREFELT % 27))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |c|)))) 

(SDEFUN |A1AGG-;merge;M3A;16|
        ((|f| (|Mapping| (|Boolean|) S S)) (|a| (A)) (|b| (A)) (% (A)))
        (SPROG
         ((|r| (A)) (|m| #1=(|Integer|)) (|n| #1#) (|i| #2=(|Integer|))
          (#3=#:G165 NIL) (|j| #2#) (#4=#:G166 NIL) (|k| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT % 35)) (SPADCALL |b| (QREFELT % 47)))
                ((SPADCALL |b| (QREFELT % 35)) (SPADCALL |a| (QREFELT % 47)))
                ('T
                 (SEQ
                  (LETT |r|
                        (|A1AGG-;stupidnew|
                         (+ (SPADCALL |a| (QREFELT % 48))
                            (SPADCALL |b| (QREFELT % 48)))
                         |a| |b| %))
                  (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                  (LETT |m| (SPADCALL |a| (QREFELT % 10)))
                  (LETT |j| (SPADCALL |b| (QREFELT % 9)))
                  (LETT |n| (SPADCALL |b| (QREFELT % 10)))
                  (SEQ (LETT |k| (SPADCALL |r| (QREFELT % 9))) G190
                       (COND
                        ((NULL (COND ((<= |i| |m|) (<= |j| |n|)) ('T NIL)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11))
                                     (SPADCALL |b| |j| (QREFELT % 11)) |f|)
                           (SEQ
                            (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT % 11))
                                      (QREFELT % 27))
                            (EXIT (LETT |i| (+ |i| 1)))))
                          ('T
                           (SEQ
                            (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT % 11))
                                      (QREFELT % 27))
                            (EXIT (LETT |j| (+ |j| 1))))))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| |i|) (LETT #3# |m|) (LETT |k| |k|) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT % 49))
                                   (QREFELT % 27))))
                       (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |j| |j|) (LETT #4# |n|) (LETT |k| |k|) G190
                       (COND ((> |j| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT % 49))
                                   (QREFELT % 27))))
                       (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |r|))))))) 

(SDEFUN |A1AGG-;elt;AUsA;17|
        ((|x| (A)) (|seg| (|UniversalSegment| (|Integer|))) (% (A)))
        (SPROG
         ((|step| (|Integer|)) (|mn| (|Integer|)) (|mx| #1=(|Integer|))
          (|lo| (|Integer|)) (|bound| #1#) (|hi| #1#) (|n| (|Integer|))
          (#2=#:G171 NIL) (|z| (A)) (|j| NIL) (|i| NIL) (#3=#:G179 NIL)
          (#4=#:G178 NIL))
         (SEQ (LETT |step| (SPADCALL |seg| (QREFELT % 51)))
              (EXIT
               (COND ((ZEROP |step|) (|error| "zero step size"))
                     (#5='T
                      (SEQ (LETT |mn| (SPADCALL |x| (QREFELT % 9)))
                           (LETT |mx| (SPADCALL |x| (QREFELT % 10)))
                           (LETT |lo| (SPADCALL |seg| (QREFELT % 31)))
                           (LETT |bound| (COND ((< |step| 0) |mn|) (#5# |mx|)))
                           (LETT |hi|
                                 (COND
                                  ((SPADCALL |seg| (QREFELT % 32))
                                   (SPADCALL |seg| (QREFELT % 33)))
                                  (#5# |bound|)))
                           (LETT |n|
                                 (* (SPADCALL |step| (QREFELT % 52))
                                    (- |hi| |lo|)))
                           (EXIT
                            (COND ((< |n| 0) (SPADCALL (QREFELT % 41)))
                                  (#5#
                                   (SEQ
                                    (LETT |n|
                                          (+ 1
                                             (|quotient_INT| |n|
                                                             (ABS |step|))))
                                    (COND
                                     ((> |step| 0)
                                      (COND
                                       ((OR (< |lo| |mn|)
                                            (> (+ |lo| (* (- |n| 1) |step|))
                                               |mx|))
                                        (|error| "index out of range"))))
                                     ((> |lo| |mx|)
                                      (|error| #6="index out of range"))
                                     (#5#
                                      (COND
                                       ((< (+ |lo| (* (- |n| 1) |step|)) |mn|)
                                        (|error| #6#)))))
                                    (LETT |z|
                                          (SPADCALL
                                           (PROG1 (LETT #2# |n|)
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (SPADCALL |x| |mn| (QREFELT % 11))
                                           (QREFELT % 42)))
                                    (SEQ (LETT |j| |mn|) (LETT |i| |lo|)
                                         (LETT #3# |hi|) (LETT #4# |step|) G190
                                         (COND
                                          ((IF (MINUSP #4#)
                                               (< |i| #3#)
                                               (> |i| #3#))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SPADCALL |z| |j|
                                                     (SPADCALL |x| |i|
                                                               (QREFELT % 11))
                                                     (QREFELT % 27))))
                                         (LETT |i|
                                               (PROG1 (+ |i| #4#)
                                                 (LETT |j| (+ |j| 1))))
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT |z|)))))))))))) 

(SDEFUN |A1AGG-;insert;2AIA;18| ((|a| (A)) (|b| (A)) (|i| (|Integer|)) (% (A)))
        (SPROG
         ((|m| (|Integer|)) (|n| (|Integer|)) (|y| (A)) (#1=#:G188 NIL)
          (#2=#:G189 NIL) (|j| NIL) (#3=#:G190 NIL) (|k| NIL))
         (SEQ (LETT |m| (SPADCALL |b| (QREFELT % 9)))
              (LETT |n| (SPADCALL |b| (QREFELT % 10)))
              (COND
               ((OR (< |i| |m|) (> |i| |n|))
                (EXIT (|error| "index out of range"))))
              (LETT |y|
                    (|A1AGG-;stupidnew|
                     (+ (SPADCALL |a| (QREFELT % 48))
                        (SPADCALL |b| (QREFELT % 48)))
                     |a| |b| %))
              (SEQ (LETT |j| |m|) (LETT #1# (- |i| 1))
                   (LETT |k| (SPADCALL |y| (QREFELT % 9))) G190
                   (COND ((> |j| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT % 11))
                               (QREFELT % 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (SEQ (LETT |j| (SPADCALL |a| (QREFELT % 9)))
                   (LETT #2# (SPADCALL |a| (QREFELT % 10))) (LETT |k| |k|) G190
                   (COND ((> |j| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |a| |j| (QREFELT % 11))
                               (QREFELT % 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (SEQ (LETT |j| |i|) (LETT #3# |n|) (LETT |k| |k|) G190
                   (COND ((> |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT % 11))
                               (QREFELT % 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |A1AGG-;copy;2A;19| ((|x| (A)) (% (A)))
        (SPROG ((|y| (A)) (|j| NIL) (|i| NIL) (#1=#:G195 NIL))
               (SEQ
                (LETT |y|
                      (|A1AGG-;stupidnew| (SPADCALL |x| (QREFELT % 48)) |x| |x|
                       %))
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 9)))
                     (LETT |i| (SPADCALL |x| (QREFELT % 9)))
                     (LETT #1# (SPADCALL |x| (QREFELT % 10))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT % 11))
                                 (QREFELT % 27))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |y|)))) 

(SDEFUN |A1AGG-;copyInto!;2AIA;20|
        ((|y| (A)) (|x| (A)) (|s| (|Integer|)) (% (A)))
        (SPROG ((|j| NIL) (|i| NIL) (#1=#:G202 NIL))
               (SEQ
                (COND
                 ((OR (< |s| (SPADCALL |y| (QREFELT % 9)))
                      (> (+ |s| (SPADCALL |x| (QREFELT % 48)))
                         (+ (SPADCALL |y| (QREFELT % 10)) 1)))
                  (|error| "index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |j| |s|) (LETT |i| (SPADCALL |x| (QREFELT % 9)))
                        (LETT #1# (SPADCALL |x| (QREFELT % 10))) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT % 11))
                                    (QREFELT % 27))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |y|))))))) 

(SDEFUN |A1AGG-;construct;LA;21| ((|l| (|List| S)) (% (A)))
        (SPROG ((|a| (A)) (|x| NIL) (#1=#:G208 NIL) (|i| NIL))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT % 41)))
                      ('T
                       (SEQ
                        (LETT |a|
                              (SPADCALL (LENGTH |l|) (|SPADfirst| |l|)
                                        (QREFELT % 42)))
                        (SEQ (LETT |x| NIL) (LETT #1# |l|)
                             (LETT |i| (SPADCALL |a| (QREFELT % 9))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT % 27))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))) 

(SDEFUN |A1AGG-;delete;AUsA;22|
        ((|a| (A)) (|s| (|UniversalSegment| (|Integer|))) (% (A)))
        (SPROG
         ((|l| (|Integer|)) (|h| (|Integer|)) (#1=#:G212 NIL) (|r| (A))
          (#2=#:G220 NIL) (|i| NIL) (#3=#:G221 NIL) (|k| NIL))
         (SEQ (LETT |l| (SPADCALL |s| (QREFELT % 31)))
              (LETT |h|
                    (COND
                     ((SPADCALL |s| (QREFELT % 32))
                      (SPADCALL |s| (QREFELT % 33)))
                     (#4='T (SPADCALL |a| (QREFELT % 10)))))
              (COND
               ((OR (< |l| (SPADCALL |a| (QREFELT % 9)))
                    (> |h| (SPADCALL |a| (QREFELT % 10))))
                (EXIT (|error| "index out of range"))))
              (EXIT
               (COND ((< |h| |l|) (SPADCALL |a| (QREFELT % 47)))
                     (#4#
                      (SEQ
                       (LETT |r|
                             (|A1AGG-;stupidnew|
                              (PROG1
                                  (LETT #1#
                                        (-
                                         (+
                                          (- (SPADCALL |a| (QREFELT % 48)) |h|)
                                          |l|)
                                         1))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              |a| |a| %))
                       (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                            (LETT #2# (- |l| 1))
                            (LETT |k| (SPADCALL |r| (QREFELT % 9))) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |r| |k|
                                        (SPADCALL |a| |i| (QREFELT % 11))
                                        (QREFELT % 27))))
                            (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |i| (+ |h| 1))
                            (LETT #3# (SPADCALL |a| (QREFELT % 10)))
                            (LETT |k| |k|) G190 (COND ((> |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |r| |k|
                                        (SPADCALL |a| |i| (QREFELT % 11))
                                        (QREFELT % 27))))
                            (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |r|)))))))) 

(SDEFUN |A1AGG-;delete;AIA;23| ((|x| (A)) (|i| (|Integer|)) (% (A)))
        (SPROG
         ((#1=#:G224 NIL) (|y| (A)) (#2=#:G231 NIL) (|j| NIL) (#3=#:G232 NIL))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |x| (QREFELT % 9)))
                (> |i| (SPADCALL |x| (QREFELT % 10))))
            (|error| "index out of range"))
           ('T
            (SEQ
             (LETT |y|
                   (|A1AGG-;stupidnew|
                    (PROG1 (LETT #1# (- (SPADCALL |x| (QREFELT % 48)) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    |x| |x| %))
             (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 9))) (LETT #2# (- |i| 1))
                  (LETT |i| (SPADCALL |y| (QREFELT % 9))) G190
                  (COND ((> |j| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT % 11))
                              (QREFELT % 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (SEQ (LETT |j| (+ |i| 1)) (LETT #3# (SPADCALL |x| (QREFELT % 10)))
                  (LETT |i| |i|) G190 (COND ((> |j| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT % 11))
                              (QREFELT % 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |A1AGG-;reverse!;2A;24| ((|x| (A)) (% (A)))
        (SPROG ((|m| (|Integer|)) (|n| (|Integer|)) (|i| NIL) (#1=#:G237 NIL))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT % 9)))
                    (LETT |n| (SPADCALL |x| (QREFELT % 10)))
                    (SEQ (LETT |i| 0) (LETT #1# (|quotient_INT| (- |n| |m|) 2))
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |x| (+ |m| |i|) (- |n| |i|)
                                     (QREFELT % 61))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |A1AGG-;concat;LA;25| ((|l| (|List| A)) (% (A)))
        (SPROG
         ((#1=#:G248 NIL) (#2=#:G240 #3=(|NonNegativeInteger|)) (#4=#:G238 #3#)
          (#5=#:G239 NIL) (|n| #3#) (|r| (A)) (|a| NIL) (#6=#:G249 NIL)
          (|i| (|Integer|)))
         (SEQ
          (COND ((NULL |l|) (SPADCALL (QREFELT % 41)))
                (#7='T
                 (SEQ
                  (LETT |n|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2# (SPADCALL |a| (QREFELT % 48)))
                                 (COND (#5# (LETT #4# (+ #4# #2#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#7# 0))))
                  (EXIT
                   (COND ((EQL |n| 0) (SPADCALL (QREFELT % 41)))
                         (#7#
                          (SEQ
                           (LETT |i|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL |n|
                                                  (|A1AGG-;stupidget| |l| %)
                                                  (QREFELT % 42)))
                                  (QREFELT % 9)))
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ (SPADCALL |r| |a| |i| (QREFELT % 63))
                                     (EXIT
                                      (LETT |i|
                                            (+ |i|
                                               (SPADCALL |a|
                                                         (QREFELT % 48))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |r|))))))))))) 

(SDEFUN |A1AGG-;sorted?;MAB;26|
        ((|f| (|Mapping| (|Boolean|) S S)) (|a| (A)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G257 NIL) (#2=#:G256 NIL) (#3=#:G255 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                         (LETT #1# (- (SPADCALL |a| (QREFELT % 10)) 1)) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |a| |i| (QREFELT % 11))
                                        (SPADCALL |a| (+ |i| 1) (QREFELT % 11))
                                        |f|))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G254)))
                              (GO #5=#:G252))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;concat;3A;27| ((|x| (A)) (|y| (A)) (% (A)))
        (SPROG ((|z| (A)) (|i| (|Integer|)))
               (SEQ
                (LETT |z|
                      (|A1AGG-;stupidnew|
                       (+ (SPADCALL |x| (QREFELT % 48))
                          (SPADCALL |y| (QREFELT % 48)))
                       |x| |y| %))
                (SPADCALL |z| |x| (LETT |i| (SPADCALL |z| (QREFELT % 9)))
                          (QREFELT % 63))
                (SPADCALL |z| |y| (+ |i| (SPADCALL |x| (QREFELT % 48)))
                          (QREFELT % 63))
                (EXIT |z|)))) 

(SDEFUN |A1AGG-;coerce;AOf;28| ((|r| (A)) (% (|OutputForm|)))
        (SPROG ((#1=#:G263 NIL) (|k| NIL) (#2=#:G264 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |k| (SPADCALL |r| (QREFELT % 9)))
                       (LETT #2# (SPADCALL |r| (QREFELT % 10))) G190
                       (COND ((> |k| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (SPADCALL (SPADCALL |r| |k| (QREFELT % 11))
                                          (QREFELT % 69))
                                #1#))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 70))))) 

(SDEFUN |A1AGG-;=;2AB;29| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G273 NIL) (#2=#:G272 NIL) (#3=#:G271 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT % 48))
                             (SPADCALL |y| (QREFELT % 48)) (QREFELT % 72))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 9)))
                           (LETT #1# (SPADCALL |x| (QREFELT % 10))) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| (QREFELT % 11))
                                          (SPADCALL |y| |i| (QREFELT % 11))
                                          (QREFELT % 73)))
                               (PROGN
                                (LETT #3#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G270)))
                                (GO #5=#:G267))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #3#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;SA2I;30|
        ((|x| (S)) (|t| (A)) (|s| (|Integer|)) (% (|Integer|)))
        (SPROG
         ((|n| (|Integer|)) (|k| NIL) (#1=#:G282 NIL) (#2=#:G281 NIL)
          (#3=#:G280 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |t| (QREFELT % 10)))
                (COND
                 ((OR (< |s| (SPADCALL |t| (QREFELT % 9))) (> |s| |n|))
                  (EXIT (|error| "index out of range"))))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| |s|) (LETT #1# |n|) G190
                       (COND ((> |k| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |t| |k| (QREFELT % 11)) |x|
                                     (QREFELT % 73))
                           (PROGN
                            (LETT #3# (PROGN (LETT #2# |k|) (GO #4=#:G279)))
                            (GO #5=#:G277))))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #3#))
                (EXIT (- (SPADCALL |t| (QREFELT % 9)) 1))))
          #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;merge_unique;M3A;31|
        ((|f| (|Mapping| (|Boolean|) S S)) (|a| (A)) (|b| (A)) (% (A)))
        (SPROG
         ((|r| (A)) (|m| #1=(|Integer|)) (|n| #1#) (|a1| (S)) (|b1| (S))
          (#2=#:G302 NIL) (|j| #3=(|Integer|)) (#4=#:G303 NIL) (|k| NIL)
          (#5=#:G294 NIL) (|res| (A)) (|i| #3#) (#6=#:G304 NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT % 35)) (SPADCALL |b| (QREFELT % 47)))
                ((SPADCALL |b| (QREFELT % 35)) (SPADCALL |a| (QREFELT % 47)))
                (#7='T
                 (SEQ
                  (LETT |r|
                        (|A1AGG-;stupidnew|
                         (+ (SPADCALL |a| (QREFELT % 48))
                            (SPADCALL |b| (QREFELT % 48)))
                         |a| |b| %))
                  (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                  (LETT |m| (SPADCALL |a| (QREFELT % 10)))
                  (LETT |j| (SPADCALL |b| (QREFELT % 9)))
                  (LETT |n| (SPADCALL |b| (QREFELT % 10)))
                  (SEQ (LETT |k| (SPADCALL |r| (QREFELT % 9))) G190
                       (COND
                        ((NULL (COND ((<= |i| |m|) (<= |j| |n|)) ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |a1| (SPADCALL |a| |i| (QREFELT % 11)))
                            (LETT |b1| (SPADCALL |b| |j| (QREFELT % 11)))
                            (EXIT
                             (COND
                              ((SPADCALL |a1| |b1| (QREFELT % 73))
                               (SEQ (SPADCALL |r| |k| |a1| (QREFELT % 27))
                                    (LETT |i| (+ |i| 1))
                                    (EXIT (LETT |j| (+ |j| 1)))))
                              ((SPADCALL |a1| |b1| |f|)
                               (SEQ (SPADCALL |r| |k| |a1| (QREFELT % 27))
                                    (EXIT (LETT |i| (+ |i| 1)))))
                              ('T
                               (SEQ (SPADCALL |r| |k| |b1| (QREFELT % 27))
                                    (EXIT (LETT |j| (+ |j| 1))))))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| |i|) (LETT #2# |m|) (LETT |k| |k|) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT % 49))
                                   (QREFELT % 27))))
                       (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |j| |j|) (LETT #4# |n|) (LETT |k| |k|) G190
                       (COND ((> |j| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT % 49))
                                   (QREFELT % 27))))
                       (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL (- |k| 1) (SPADCALL |r| (QREFELT % 10))) |r|)
                         (#7#
                          (SEQ
                           (LETT |res|
                                 (|A1AGG-;stupidnew|
                                  (PROG1
                                      (LETT #5#
                                            (- |k|
                                               (SPADCALL |r| (QREFELT % 9))))
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  |a| |b| %))
                           (SEQ (LETT |i| (SPADCALL |r| (QREFELT % 9)))
                                (LETT #6# (- |k| 1)) G190
                                (COND ((> |i| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |res| |i|
                                            (SPADCALL |r| |i| (QREFELT % 49))
                                            (QREFELT % 27))))
                                (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|))))))))))) 

(SDEFUN |A1AGG-;<;2AB;32| ((|a| (A)) (|b| (A)) (% (|Boolean|)))
        (SPROG
         ((|j| NIL) (#1=#:G313 NIL) (|i| NIL) (#2=#:G312 NIL) (#3=#:G311 NIL)
          (#4=#:G310 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |j| (SPADCALL |b| (QREFELT % 9)))
                   (LETT #1# (SPADCALL |b| (QREFELT % 10)))
                   (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                   (LETT #2# (SPADCALL |a| (QREFELT % 10))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11))
                                 (SPADCALL |b| |j| (QREFELT % 11))
                                 (QREFELT % 39))
                       (PROGN
                        (LETT #4#
                              (PROGN
                               (LETT #3#
                                     (SPADCALL
                                      (SPADCALL |a| |i| (QREFELT % 49))
                                      (SPADCALL |b| |j| (QREFELT % 49))
                                      (QREFELT % 77)))
                               (GO #5=#:G309)))
                        (GO #6=#:G307))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL)))
             #6# (EXIT #4#))
            (EXIT
             (< (SPADCALL |a| (QREFELT % 48)) (SPADCALL |b| (QREFELT % 48))))))
          #5# (EXIT #3#)))) 

(SDEFUN |A1AGG-;smaller?;2AB;33| ((|a| (A)) (|b| (A)) (% (|Boolean|)))
        (SPROG
         ((|j| NIL) (#1=#:G322 NIL) (|i| NIL) (#2=#:G321 NIL) (#3=#:G320 NIL)
          (#4=#:G319 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |j| (SPADCALL |b| (QREFELT % 9)))
                   (LETT #1# (SPADCALL |b| (QREFELT % 10)))
                   (LETT |i| (SPADCALL |a| (QREFELT % 9)))
                   (LETT #2# (SPADCALL |a| (QREFELT % 10))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |a| |i| (QREFELT % 11))
                                 (SPADCALL |b| |j| (QREFELT % 11))
                                 (QREFELT % 39))
                       (PROGN
                        (LETT #4#
                              (PROGN
                               (LETT #3#
                                     (SPADCALL
                                      (SPADCALL |a| |i| (QREFELT % 11))
                                      (SPADCALL |b| |j| (QREFELT % 11))
                                      (QREFELT % 79)))
                               (GO #5=#:G318)))
                        (GO #6=#:G316))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL)))
             #6# (EXIT #4#))
            (EXIT
             (< (SPADCALL |a| (QREFELT % 48)) (SPADCALL |b| (QREFELT % 48))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |OneDimensionalArrayAggregate&;|)) 

(DEFUN |OneDimensionalArrayAggregate&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OneDimensionalArrayAggregate&| DV$1 DV$2))
          (LETT % (GETREFV 81))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (QSETREFV % 40
                      (CONS (|dispatchFunction| |A1AGG-;reduce;MA3S;12|) %))))
          (COND
           ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
            (QSETREFV % 71
                      (CONS (|dispatchFunction| |A1AGG-;coerce;AOf;28|) %))))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (PROGN
             (QSETREFV % 74 (CONS (|dispatchFunction| |A1AGG-;=;2AB;29|) %))
             (QSETREFV % 75
                       (CONS (|dispatchFunction| |A1AGG-;position;SA2I;30|) %))
             (QSETREFV % 76
                       (CONS (|dispatchFunction| |A1AGG-;merge_unique;M3A;31|)
                             %)))))
          (COND
           ((|HasCategory| |#2| '(|OrderedSet|))
            (QSETREFV % 78 (CONS (|dispatchFunction| |A1AGG-;<;2AB;32|) %))))
          (COND
           ((|HasCategory| |#2| '(|Comparable|))
            (QSETREFV % 80
                      (CONS (|dispatchFunction| |A1AGG-;smaller?;2AB;33|) %))))
          %))) 

(MAKEPROP '|OneDimensionalArrayAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (10 . |qelt|) (|List| 7)
              |A1AGG-;parts;AL;1| (|Mapping| 18 7 7)
              (|FiniteLinearAggregateSort| 7 6) (16 . |quickSort|)
              |A1AGG-;sort!;M2A;2| (|Boolean|) (|Mapping| 18 7)
              |A1AGG-;any?;MAB;3| |A1AGG-;every?;MAB;4| |A1AGG-;position;MAI;5|
              (|Union| 7 '#1="failed") |A1AGG-;find;MAU;6|
              (|NonNegativeInteger|) |A1AGG-;count;MANni;7| (22 . |qsetelt!|)
              (|Mapping| 7 7) |A1AGG-;map!;M2A;8| (|UniversalSegment| 8)
              (29 . |low|) (34 . |hasHi|) (39 . |high|)
              |A1AGG-;setelt!;AUs2S;9| (44 . |empty?|) (|Mapping| 7 7 7)
              |A1AGG-;reduce;MAS;10| |A1AGG-;reduce;MA2S;11| (49 . ~=)
              (55 . |reduce|) (63 . |empty|) (67 . |new|) (73 . |first|)
              (78 . |0|) (82 . |0|) |A1AGG-;map;M3A;15| (86 . |copy|)
              (91 . |#|) (96 . |elt|) |A1AGG-;merge;M3A;16| (102 . |incr|)
              (107 . |sign|) |A1AGG-;elt;AUsA;17| |A1AGG-;insert;2AIA;18|
              |A1AGG-;copy;2A;19| |A1AGG-;copyInto!;2AIA;20|
              |A1AGG-;construct;LA;21| |A1AGG-;delete;AUsA;22|
              |A1AGG-;delete;AIA;23| (|Void|) (112 . |swap!|)
              |A1AGG-;reverse!;2A;24| (119 . |copyInto!|) (|List| %)
              |A1AGG-;concat;LA;25| |A1AGG-;sorted?;MAB;26|
              |A1AGG-;concat;3A;27| (|OutputForm|) (126 . |coerce|)
              (131 . |bracket|) (136 . |coerce|) (141 . ~=) (147 . =) (153 . =)
              (159 . |position|) (166 . |merge_unique|) (173 . <) (179 . <)
              (185 . |smaller?|) (191 . |smaller?|))
           '#(|sorted?| 197 |sort!| 203 |smaller?| 209 |setelt!| 215 |reverse!|
              222 |reduce| 227 |position| 248 |parts| 261 |merge_unique| 266
              |merge| 273 |map!| 280 |map| 286 |insert| 293 |find| 300 |every?|
              306 |elt| 312 |delete| 318 |count| 330 |copyInto!| 336 |copy| 343
              |construct| 348 |concat| 353 |coerce| 364 |any?| 369 = 375 < 381)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((|sort!| (|#1| |#1|)) T)
                                   '((|sort!|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1|))
                                     T)
                                   '((|reverse!| (|#1| |#1|)) T)
                                   '((|copyInto!| (|#1| |#1| |#1| (|Integer|)))
                                     T)
                                   '((|sorted?| ((|Boolean|) |#1|)) T)
                                   '((|merge| (|#1| |#1| |#1|)) T)
                                   '((|merge_unique|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1| |#1|))
                                     T)
                                   '((|position|
                                      ((|Integer|) |#2| |#1| (|Integer|)))
                                     T)
                                   '((|position| ((|Integer|) |#2| |#1|)) T)
                                   '((|position|
                                      ((|Integer|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|sorted?|
                                      ((|Boolean|)
                                       (|Mapping| (|Boolean|) |#2| |#2|) |#1|))
                                     T)
                                   '((|merge|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1| |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#2| |#1|
                                       (|UniversalSegment| (|Integer|)) |#2|))
                                     T)
                                   '((|insert| (|#1| |#1| |#1| (|Integer|))) T)
                                   '((|insert| (|#1| |#2| |#1| (|Integer|))) T)
                                   '((|delete|
                                      (|#1| |#1|
                                       (|UniversalSegment| (|Integer|))))
                                     T)
                                   '((|delete| (|#1| |#1| (|Integer|))) T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1|))
                                     T)
                                   '((|concat| (|#1| (|List| |#1|))) T)
                                   '((|concat| (|#1| |#1| |#1|)) T)
                                   '((|concat| (|#1| |#2| |#1|)) T)
                                   '((|concat| (|#1| |#1| |#2|)) T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|UniversalSegment| (|Integer|))))
                                     T)
                                   '((|construct| (|#1| (|List| |#2|))) T)
                                   '((|find|
                                      ((|Union| |#2| #1#)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2| |#2|))
                                     T)
                                   '((|elt| (|#2| |#1| (|Integer|))) T)
                                   '((|elt| (|#2| |#1| (|Integer|) |#2|)) T)
                                   '((|setelt!| (|#2| |#1| (|Integer|) |#2|))
                                     T)
                                   '((|count|
                                      ((|NonNegativeInteger|) |#2| |#1|))
                                     T)
                                   '((|parts| ((|List| |#2|) |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|every?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|any?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|map!| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|copy| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 80
                                            '(1 6 8 0 9 1 6 8 0 10 2 6 7 0 8 11
                                              2 15 6 14 6 16 3 6 7 0 8 7 27 1
                                              30 8 0 31 1 30 18 0 32 1 30 8 0
                                              33 1 6 18 0 35 2 7 18 0 0 39 4 0
                                              7 36 0 7 7 40 0 6 0 41 2 6 0 25 7
                                              42 1 6 7 0 43 0 25 0 44 0 8 0 45
                                              1 6 0 0 47 1 6 25 0 48 2 6 7 0 8
                                              49 1 30 8 0 51 1 8 8 0 52 3 6 60
                                              0 8 8 61 3 6 0 0 0 8 63 1 7 68 0
                                              69 1 68 0 64 70 1 0 68 0 71 2 8
                                              18 0 0 72 2 7 18 0 0 73 2 0 18 0
                                              0 74 3 0 8 7 0 8 75 3 0 0 14 0 0
                                              76 2 7 18 0 0 77 2 0 18 0 0 78 2
                                              7 18 0 0 79 2 0 18 0 0 80 2 0 18
                                              14 0 66 2 0 0 14 0 17 2 0 18 0 0
                                              80 3 0 7 0 30 7 34 1 0 0 0 62 3 0
                                              7 36 0 7 38 4 0 7 36 0 7 7 40 2 0
                                              7 36 0 37 2 0 8 19 0 22 3 0 8 7 0
                                              8 75 1 0 12 0 13 3 0 0 14 0 0 76
                                              3 0 0 14 0 0 50 2 0 0 28 0 29 3 0
                                              0 36 0 0 46 3 0 0 0 0 8 54 2 0 23
                                              19 0 24 2 0 18 19 0 21 2 0 0 0 30
                                              53 2 0 0 0 30 58 2 0 0 0 8 59 2 0
                                              25 19 0 26 3 0 0 0 0 8 56 1 0 0 0
                                              55 1 0 0 12 57 2 0 0 0 0 67 1 0 0
                                              64 65 1 0 68 0 71 2 0 18 19 0 20
                                              2 0 18 0 0 74 2 0 18 0 0 78)))))
           '|lookupComplete|)) 
