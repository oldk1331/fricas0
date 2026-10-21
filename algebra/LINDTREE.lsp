
(MAKEPROP '|LINDTREE;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |LINDTREE;rep| ((|x| (%)) (% (|Rep|))) |x|) 

(MAKEPROP '|LINDTREE;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |LINDTREE;per| ((|r| (|Rep|)) (% (%))) |r|) 

(SDEFUN |LINDTREE;setCountingValues;2L;3| ((|lt| (|List| %)) (% (|List| %)))
        (SPROG
         ((#1=#:G29 NIL) (#2=#:G30 NIL)
          (|modlt| (|List| (|Tree| (|NonNegativeInteger|)))) (|i| NIL)
          (#3=#:G31 NIL) (|v| (|NonNegativeInteger|)) (#4=#:G32 NIL) (|t| NIL)
          (#5=#:G33 NIL))
         (SEQ (LETT |v| 0)
              (LETT |modlt|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |t| (QREFELT % 7))
                                             (QREFELT % 8))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |i| 1) (LETT |t| NIL) (LETT #3# |lt|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL (SPADCALL |modlt| |i| (QREFELT % 11)) |v|
                              (QREFELT % 13))
                    (EXIT
                     (LETT |v|
                           (+ |v|
                              (SPADCALL (SPADCALL |t| (QREFELT % 15))
                                        (QREFELT % 16))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #4# NIL)
                (SEQ (LETT |t| NIL) (LETT #5# |modlt|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4# (CONS (SPADCALL |t| (QREFELT % 17)) #4#))))
                     (LETT #5# (CDR #5#)) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |LINDTREE;Delta0|
        ((|n| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G44 NIL) (|i| NIL) (#2=#:G45 NIL) (#3=#:G40 NIL))
               (SEQ
                (SPADCALL (ELT % 23)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |i| 0) (LETT #2# (- |s| 1)) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (PROG1
                                             (LETT #3#
                                                   (SPADCALL (EXPT 2 |n|) |i|
                                                             (QREFELT % 22)))
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         #1#))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          0 (QREFELT % 25))))) 

(SDEFUN |LINDTREE;insert|
        ((|i| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (|lln| (|List| (|List| (|NonNegativeInteger|))))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G53 NIL) (|j| (|NonNegativeInteger|)) (#2=#:G47 NIL)
          (|p| (|NonNegativeInteger|)) (|found?| (|Boolean|))
          (|ln| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |found?| NIL) (LETT |ln| NIL) (LETT |j| 0)
              (SEQ (LETT #1# |lln|) G190
                   (COND
                    ((OR (NULL (NULL |found?|)) (ATOM #1#)
                         (PROGN (LETT |ln| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |j| (+ |j| 1))
                        (LETT |p|
                              (PROG1
                                  (LETT #2# (SPADCALL |i| |ln| (QREFELT % 26)))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#)))
                        (EXIT (LETT |found?| (NULL (ZEROP |p|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ln|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ln| |p| (QREFELT % 27)) |n|
                               (QREFELT % 28))
                     (SPADCALL |ln| |p| (QREFELT % 29)) (QREFELT % 30)))
              (SPADCALL |lln| |j| |ln| (QREFELT % 32)) (EXIT |lln|)))) 

(SDEFUN |LINDTREE;grtrIntern|
        ((|la| (|List| (|NonNegativeInteger|)))
         (|lb| (|List| (|NonNegativeInteger|))) (% (|Boolean|)))
        (COND
         ((> (SPADCALL |la| (QREFELT % 16)) (SPADCALL |lb| (QREFELT % 16))) 'T)
         ((> (SPADCALL |lb| (QREFELT % 16)) (SPADCALL |la| (QREFELT % 16)))
          NIL)
         ('T (SPADCALL |la| |lb| (QREFELT % 34))))) 

(SDEFUN |LINDTREE;grtr;2LB;7|
        ((|lla| (|List| (|List| (|NonNegativeInteger|))))
         (|llb| (|List| (|List| (|NonNegativeInteger|)))) (% (|Boolean|)))
        (SPROG
         ((#1=#:G68 NIL) (#2=#:G69 NIL)
          (|slla| (|List| (|NonNegativeInteger|))) (#3=#:G70 NIL)
          (#4=#:G71 NIL) (|sllb| (|List| (|NonNegativeInteger|))) (|lb| NIL)
          (#5=#:G73 NIL) (|la| NIL) (#6=#:G72 NIL) (|decided?| (|Boolean|))
          (#7=#:G67 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |slla|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |la| NIL) (LETT #2# |lla|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |la| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS (SPADCALL |la| (QREFELT % 16)) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (LETT |sllb|
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |lb| NIL) (LETT #4# |llb|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |lb| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3#
                                (CONS (SPADCALL |lb| (QREFELT % 16)) #3#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #3#)))))
            (EXIT
             (COND ((SPADCALL |slla| |sllb| (QREFELT % 34)) 'T)
                   ((SPADCALL |slla| |sllb| (QREFELT % 35)) NIL)
                   ('T
                    (SEQ (LETT |decided?| NIL)
                         (SEQ (LETT |lb| NIL) (LETT #5# |llb|) (LETT |la| NIL)
                              (LETT #6# |lla|) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |la| (CAR #6#)) NIL)
                                    (ATOM #5#)
                                    (PROGN (LETT |lb| (CAR #5#)) NIL)
                                    (NULL (NULL |decided?|)))
                                (GO G191)))
                              (SEQ
                               (LETT |decided?|
                                     (SPADCALL |la| |lb| (QREFELT % 34)))
                               (COND
                                (|decided?|
                                 (PROGN (LETT #7# 'T) (GO #8=#:G66))))
                               (COND
                                ((NULL |decided?|)
                                 (LETT |decided?|
                                       (SPADCALL |lb| |la| (QREFELT % 34)))))
                               (EXIT
                                (COND
                                 (|decided?|
                                  (PROGN (LETT #7# NIL) (GO #8#))))))
                              (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                              (GO G190) G191 (EXIT NIL))
                         (EXIT |decided?|)))))))
          #8# (EXIT #7#)))) 

(MAKEPROP '|LINDTREE;cyclic?;%B;8| '|SPADreplace| '(XLAM (|t|) NIL)) 

(SDEFUN |LINDTREE;cyclic?;%B;8| ((|t| (%)) (% (|Boolean|))) NIL) 

(SDEFUN |LINDTREE;coerce;%T;9| ((|t| (%)) (% (|Tree| (|NonNegativeInteger|))))
        (|LINDTREE;rep| |t| %)) 

(SDEFUN |LINDTREE;retractIfCan;TU;10|
        ((|t| (|Tree| (|NonNegativeInteger|))) (% (|Union| % "failed")))
        (COND ((NULL (SPADCALL |t| (QREFELT % 38))) (CONS 1 "failed"))
              ('T (CONS 0 (|LINDTREE;per| |t| %))))) 

(SDEFUN |LINDTREE;elt;%Pi%;11| ((|t| (%)) (|p| (|PositiveInteger|)) (% (%)))
        (COND ((SPADCALL |t| (QREFELT % 41)) (|error| "elt: tree is a leaf"))
              ((> |p| (SPADCALL |t| (QREFELT % 42)))
               (|error| "elt: second argument too big"))
              ('T (SPADCALL (SPADCALL |t| (QREFELT % 43)) |p| (QREFELT % 45))))) 

(SDEFUN |LINDTREE;leafIndexingTree;Nni%;12|
        ((|v| (|NonNegativeInteger|)) (% (%)))
        (|LINDTREE;per| (SPADCALL |v| (QREFELT % 48)) %)) 

(SDEFUN |LINDTREE;leafIndexingTree;L%;13| ((|lt| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G96 NIL) (#2=#:G97 NIL)
          (|modlt| (|List| (|Tree| (|NonNegativeInteger|)))) (|i| NIL)
          (|t| NIL) (#3=#:G98 NIL) (|v| (|NonNegativeInteger|)))
         (SEQ (LETT |v| 0)
              (LETT |modlt|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |t| (QREFELT % 8))
                                             (QREFELT % 50))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |i| 1) (LETT |t| NIL) (LETT #3# |lt|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL (SPADCALL |modlt| |i| (QREFELT % 11)) |v|
                              (QREFELT % 13))
                    (EXIT
                     (LETT |v|
                           (+ |v|
                              (SPADCALL (SPADCALL |t| (QREFELT % 15))
                                        (QREFELT % 16))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (|LINDTREE;per| (SPADCALL 0 |modlt| (QREFELT % 51)) %))))) 

(SDEFUN |LINDTREE;leafIndexingTree;NniL%;14|
        ((|w| (|NonNegativeInteger|)) (|lt| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G106 NIL) (#2=#:G107 NIL)
          (|modlt| (|List| (|Tree| (|NonNegativeInteger|)))) (|i| NIL)
          (|t| NIL) (#3=#:G108 NIL) (|v| (|NonNegativeInteger|)))
         (SEQ (LETT |v| 0)
              (LETT |modlt|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |t| NIL) (LETT #2# |lt|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |t| (QREFELT % 8))
                                             (QREFELT % 50))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |i| 1) (LETT |t| NIL) (LETT #3# |lt|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL (SPADCALL |modlt| |i| (QREFELT % 11)) |v|
                              (QREFELT % 13))
                    (EXIT
                     (LETT |v|
                           (+ |v|
                              (SPADCALL (SPADCALL |t| (QREFELT % 15))
                                        (QREFELT % 16))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (|LINDTREE;per| (SPADCALL |w| |modlt| (QREFELT % 51)) %))))) 

(SDEFUN |LINDTREE;setValue;%Nni%;15|
        ((|t| (%)) (|v| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |v| (SPADCALL |t| (QREFELT % 43)) (QREFELT % 53))) 

(SDEFUN |LINDTREE;leafIndexingTree;T%;16|
        ((|t| (|Tree| (|NonNegativeInteger|))) (% (%)))
        (SPROG ((#1=#:G117 NIL) (|ch| NIL) (#2=#:G118 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |t| (QREFELT % 55))
                      (SPADCALL |t| (QREFELT % 41)))
                  (SPADCALL |t| (QREFELT % 17)))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |ch| NIL)
                          (LETT #2# (SPADCALL |t| (QREFELT % 56))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |ch| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |ch| (QREFELT % 57)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT % 19))
                   (QREFELT % 52))))))) 

(SDEFUN |LINDTREE;setchildren!;%L%;17| ((|t| (%)) (|lch| (|List| %)) (% (%)))
        (SPADCALL (SPADCALL |t| (QREFELT % 58)) (SPADCALL |lch| (QREFELT % 19))
                  (QREFELT % 53))) 

(SDEFUN |LINDTREE;copy;2%;18| ((|t| (%)) (% (%)))
        (SPADCALL (SPADCALL |t| (QREFELT % 58)) (SPADCALL |t| (QREFELT % 43))
                  (QREFELT % 53))) 

(SDEFUN |LINDTREE;isLeafIndexingTree?;TB;19|
        ((|t| (|Tree| (|NonNegativeInteger|))) (% (|Boolean|)))
        (SPROG
         ((|lct| (|List| (|Tree| (|NonNegativeInteger|))))
          (|cV| (|List| (|NonNegativeInteger|))) (#1=#:G132 NIL) (|cv| NIL)
          (#2=#:G131 NIL) (|lc| (|NonNegativeInteger|))
          (|vF| (|NonNegativeInteger|)) (|c| NIL) (#3=#:G133 NIL)
          (|valuesFit?| (|Boolean|)))
         (SEQ (LETT |lct| (SPADCALL |t| (QREFELT % 56)))
              (EXIT
               (COND ((OR (NULL |lct|) (SPADCALL |t| (QREFELT % 41))) 'T)
                     ('T
                      (SEQ (LETT |cV| (SPADCALL |t| (QREFELT % 60)))
                           (LETT |valuesFit?| 'T) (LETT |vF| 0)
                           (SEQ (LETT |c| NIL) (LETT #1# |lct|) (LETT |cv| NIL)
                                (LETT #2# |cV|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |cv| (CAR #2#)) NIL)
                                      (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#)) NIL)
                                      (NULL |valuesFit?|))
                                  (GO G191)))
                                (SEQ (LETT |lc| (SPADCALL |c| (QREFELT % 61)))
                                     (LETT |valuesFit?| (EQL |vF| |cv|))
                                     (EXIT (LETT |vF| (+ |vF| |lc|))))
                                (LETT #2#
                                      (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             (|valuesFit?|
                              (SEQ
                               (SEQ (LETT |c| NIL) (LETT #3# |lct|) G190
                                    (COND
                                     ((OR (NULL |valuesFit?|) (ATOM #3#)
                                          (PROGN (LETT |c| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |valuesFit?|
                                            (SPADCALL |c| (QREFELT % 38)))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT |valuesFit?|)))
                             ('T NIL)))))))))) 

(SDEFUN |LINDTREE;childrenValues;%L;20|
        ((|t| (%)) (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G138 NIL) (|c| NIL) (#2=#:G139 NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT % 41)) NIL)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |c| NIL)
                             (LETT #2# (SPADCALL |t| (QREFELT % 43))) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS (SPADCALL |c| (QREFELT % 58))
                                           #1#))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |LINDTREE;numberOfChildren;%Nni;21|
        ((|t| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |t| (QREFELT % 43)) (QREFELT % 62))) 

(SDEFUN |LINDTREE;numberOfLeaves;%Nni;22|
        ((|t| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |t| (QREFELT % 15)) (QREFELT % 16))) 

(SDEFUN |LINDTREE;nextEdge;NniLNni;23|
        ((|r| (|NonNegativeInteger|)) (|lvs| (|List| (|NonNegativeInteger|)))
         (% (|NonNegativeInteger|)))
        (SPROG ((|vs| NIL) (#1=#:G146 NIL) (|p| (|NonNegativeInteger|)))
               (SEQ
                (COND ((EQL |r| 0) 1)
                      ('T
                       (SEQ (LETT |p| 1)
                            (SEQ (LETT |vs| NIL) (LETT #1# (CDR |lvs|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |vs| (CAR #1#)) NIL)
                                       (NULL (<= |vs| |r|)))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |p| (+ |p| 1))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |p|))))))) 

(SDEFUN |LINDTREE;rank;%LNni;24|
        ((|t| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|z| NIL) (#1=#:G152 NIL) (|node| (%)) (|r| (|NonNegativeInteger|)))
         (SEQ (LETT |r| 0) (LETT |node| (SPADCALL |t| (QREFELT % 7)))
              (SEQ (LETT |z| NIL) (LETT #1# |path|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |node|
                          (SPADCALL (SPADCALL |node| (QREFELT % 43)) |z|
                                    (QREFELT % 45)))
                    (EXIT (LETT |r| (+ |r| (SPADCALL |node| (QREFELT % 58))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LINDTREE;unrank;%NniL;25|
        ((|t| (%)) (|r| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|i| NIL) (|z| (|NonNegativeInteger|)) (|node| (%))
          (|finished?| (|Boolean|)) (#1=#:G154 NIL)
          (|path| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((>= |r| (SPADCALL |t| (QREFELT % 61)))
            (|error| "unrank: second argument too large."))
           ('T
            (SEQ (LETT |path| NIL) (LETT |finished?| NIL)
                 (LETT |node| (SPADCALL |t| (QREFELT % 7))) (LETT |z| 0)
                 (SEQ (LETT |i| 1) G190
                      (COND ((NULL (NULL |finished?|)) (GO G191)))
                      (SEQ (LETT |finished?| (SPADCALL |node| (QREFELT % 41)))
                           (EXIT
                            (COND
                             ((NULL |finished?|)
                              (SEQ
                               (LETT |z|
                                     (SPADCALL |r|
                                               (SPADCALL |node| (QREFELT % 60))
                                               (QREFELT % 63)))
                               (LETT |node|
                                     (SPADCALL (SPADCALL |node| (QREFELT % 43))
                                               |z| (QREFELT % 45)))
                               (LETT |finished?|
                                     (SPADCALL |node| (QREFELT % 41)))
                               (COND
                                ((NULL |finished?|)
                                 (LETT |r|
                                       (PROG1
                                           (LETT #1#
                                                 (- |r|
                                                    (SPADCALL |node|
                                                              (QREFELT % 58))))
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #1#)))))
                               (EXIT
                                (LETT |path|
                                      (SPADCALL |path| |z|
                                                (QREFELT % 28)))))))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |path|))))))) 

(SDEFUN |LINDTREE;enumerate;%L;26|
        ((|t| (%)) (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G164 NIL) (|i| NIL) (#2=#:G165 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0)
                      (LETT #2# (- (SPADCALL |t| (QREFELT % 61)) 1)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |t| |i| (QREFELT % 65)) #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |LINDTREE;randomPath;%L;27|
        ((|t| (%)) (% (|List| (|NonNegativeInteger|))))
        (SPROG ((|r| (|NonNegativeInteger|)))
               (SEQ
                (LETT |r|
                      (RANDOM
                       (SPADCALL (SPADCALL |t| (QREFELT % 15))
                                 (QREFELT % 16))))
                (EXIT (SPADCALL |t| |r| (QREFELT % 65)))))) 

(SDEFUN |LINDTREE;isPathToLeaf?;%LB;28|
        ((|t| (%)) (|ln| (|List| (|NonNegativeInteger|))) (% (|Boolean|)))
        (SPROG ((|p| NIL) (#1=#:G174 NIL) (|isChild?| (|Boolean|)) (|nd| (%)))
               (SEQ (LETT |nd| |t|)
                    (EXIT
                     (COND ((NULL |ln|) (SPADCALL |nd| (QREFELT % 41)))
                           ('T
                            (SEQ (LETT |isChild?| 'T)
                                 (SEQ (LETT |p| NIL) (LETT #1# |ln|) G190
                                      (COND
                                       ((OR (NULL |isChild?|) (ATOM #1#)
                                            (PROGN (LETT |p| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |isChild?|
                                             (COND
                                              ((<= 1 |p|)
                                               (<= |p|
                                                   (SPADCALL |nd|
                                                             (QREFELT % 42))))
                                              ('T NIL)))
                                       (EXIT
                                        (COND
                                         (|isChild?|
                                          (LETT |nd|
                                                (SPADCALL
                                                 (SPADCALL |nd| (QREFELT % 43))
                                                 |p| (QREFELT % 45)))))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (SPADCALL |nd| (QREFELT % 41)))))))))) 

(SDEFUN |LINDTREE;logicFunctionTree;2Nni%;29|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G179 NIL) (|t| NIL) (#2=#:G180 NIL) (|treeslevel1| (|List| %)))
         (SEQ
          (LETT |treeslevel1|
                (LIST
                 (SPADCALL 0
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |t| 0)
                                 (LETT #2#
                                       (-
                                        (SPADCALL (EXPT 2 |n|) |k|
                                                  (QREFELT % 22))
                                        1))
                                 G190 (COND ((|greater_SI| |t| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS (SPADCALL |t| (QREFELT % 49))
                                               #1#))))
                                 (LETT |t| (|inc_SI| |t|)) (GO G190) G191
                                 (EXIT (NREVERSE #1#))))
                           (QREFELT % 53))))
          (EXIT (SPADCALL 0 |treeslevel1| (QREFELT % 53)))))) 

(SDEFUN |LINDTREE;logicFunctionTree;Nni%;30|
        ((|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G187 NIL) (|s| NIL) (#2=#:G188 NIL) (#3=#:G189 NIL) (|t| NIL)
          (#4=#:G190 NIL) (|treeslevel1| (|List| %)))
         (SEQ
          (LETT |treeslevel1|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |s| 0) (LETT #2# (SPADCALL 2 |n| (QREFELT % 21)))
                      G190 (COND ((|greater_SI| |s| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (|LINDTREE;Delta0| |n| |s| %)
                                         (PROGN
                                          (LETT #3# NIL)
                                          (SEQ (LETT |t| 0)
                                               (LETT #4#
                                                     (-
                                                      (SPADCALL (EXPT 2 |n|)
                                                                |s|
                                                                (QREFELT % 22))
                                                      1))
                                               G190
                                               (COND
                                                ((|greater_SI| |t| #4#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (SPADCALL |t|
                                                                  (QREFELT %
                                                                           48))
                                                        #3#))))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#))))
                                         (QREFELT % 70))
                               #1#))))
                      (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (SPADCALL 0 |treeslevel1| (QREFELT % 53)))))) 

(SDEFUN |LINDTREE;modify|
        ((|li| (|List| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG ((|mli| (|List| (|Integer|))) (|i| NIL) (#1=#:G196 NIL))
               (SEQ (LETT |mli| NIL)
                    (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |mli| (COND ((ZEROP |i|) -1) ('T |i|))
                                     (QREFELT % 73))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |mli|)))) 

(SDEFUN |LINDTREE;P;3Nni;32|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G197 NIL) (#2=#:G198 NIL) (#3=#:G199 NIL))
               (COND ((> |k| |n|) 0) ((OR (EQL |k| 1) (EQL |k| |n|)) 1)
                     ('T
                      (+
                       (SPADCALL
                        (PROG1 (LETT #1# (- |n| |k|))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |k| (QREFELT % 74))
                       (SPADCALL
                        (PROG1 (LETT #2# (- |n| 1))
                          (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #2#))
                        (PROG1 (LETT #3# (- |k| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#))
                        (QREFELT % 74))))))) 

(SDEFUN |LINDTREE;permutationCyclesTree;2Nni%;33|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G201 NIL) (#2=#:G202 NIL) (|j| NIL) (#3=#:G209 NIL)
          (#4=#:G204 NIL) (|lch| (|List| %)))
         (SEQ
          (COND ((> |k| |n|) (SPADCALL (QREFELT % 75)))
                (#5='T
                 (SEQ
                  (COND
                   ((EQL |k| 0)
                    (COND ((< |k| |n|) (EXIT (SPADCALL 0 (QREFELT % 48)))))))
                  (EXIT
                   (COND ((EQL |k| |n|) (SPADCALL 0 (QREFELT % 48)))
                         (#5#
                          (SEQ
                           (COND
                            ((EQL |k| 1)
                             (COND
                              ((EQL |n| 2)
                               (EXIT (SPADCALL 0 (QREFELT % 48)))))))
                           (LETT |lch| NIL)
                           (COND
                            ((> |k| 1)
                             (LETT |lch|
                                   (LIST
                                    (|LINDTREE;per|
                                     (SPADCALL 0
                                               (SPADCALL
                                                (SPADCALL
                                                 (PROG1 (LETT #1# (- |n| 1))
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (PROG1 (LETT #2# (- |k| 1))
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT % 76))
                                                (QREFELT % 43))
                                               (QREFELT % 70))
                                     %)))))
                           (SEQ (LETT |j| 1) (LETT #3# (- |n| 1)) G190
                                (COND ((|greater_SI| |j| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |lch|
                                        (SPADCALL |lch|
                                                  (|LINDTREE;per|
                                                   (SPADCALL 0
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (PROG1
                                                                   (LETT #4#
                                                                         (- |n|
                                                                            1))
                                                                 (|check_subtype2|
                                                                  (>= #4# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #4#))
                                                               |k|
                                                               (QREFELT % 76))
                                                              (QREFELT % 43))
                                                             (QREFELT % 70))
                                                   %)
                                                  (QREFELT % 77)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (SPADCALL |lch| (QREFELT % 52))))))))))))) 

(SDEFUN |LINDTREE;pathToPermutationCycles;2NniLL;34|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (|lp| (|List| (|NonNegativeInteger|)))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|n'| (|NonNegativeInteger|)) (#1=#:G226 NIL) (#2=#:G211 NIL)
          (#3=#:G212 NIL) (#4=#:G214 NIL) (#5=#:G215 NIL) (#6=#:G217 NIL)
          (|lr| (|List| (|NonNegativeInteger|))) (#7=#:G227 NIL) (|i| NIL)
          (#8=#:G228 NIL) (|s| NIL) (#9=#:G230 NIL) (|p| NIL) (#10=#:G229 NIL)
          (|pc| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |n'| |n|) (LETT |lr| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((> |k| 1)
                       (COND
                        ((EQL |p| 1)
                         (SEQ
                          (LETT |n|
                                (PROG1 (LETT #2# (- |n| 1))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#)))
                          (LETT |k|
                                (PROG1 (LETT #3# (- |k| 1))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#)))
                          (EXIT (LETT |lr| (CONS 0 |lr|)))))
                        ('T
                         (SEQ
                          (LETT |n|
                                (PROG1 (LETT #4# (- |n| 1))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          (EXIT
                           (LETT |lr|
                                 (CONS
                                  (PROG1 (LETT #5# (- |p| 1))
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  |lr|)))))))
                      ((> |n| 2)
                       (SEQ
                        (LETT |n|
                              (PROG1 (LETT #6# (- |n| 1))
                                (|check_subtype2| (>= #6# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #6#)))
                        (EXIT (LETT |lr| (CONS |p| |lr|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |pc| NIL)
              (COND
               ((EQL |n| |k|)
                (LETT |pc|
                      (PROGN
                       (LETT #7# NIL)
                       (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                            (COND ((|greater_SI| |i| #8#) (GO G191)))
                            (SEQ (EXIT (LETT #7# (CONS (LIST |i|) #7#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #7#)))))))
              (COND
               ((EQL |k| 1)
                (COND ((EQL |n| 2) (LETT |pc| (LIST (LIST 1 2)))))))
              (SEQ (LETT |s| (+ |n| 1)) (LETT #9# |n'|) (LETT |p| NIL)
                   (LETT #10# |lr|) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |p| (CAR #10#)) NIL)
                         (> |s| #9#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL |p| 0)
                       (LETT |pc| (SPADCALL |pc| (LIST |s|) (QREFELT % 78))))
                      ('T (LETT |pc| (|LINDTREE;insert| |p| |s| |pc| %))))))
                   (LETT #10# (PROG1 (CDR #10#) (LETT |s| (+ |s| 1))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |pc|)))) 

(SDEFUN |LINDTREE;unorderedSetPartitionTree;2Nni%;35|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G231 NIL) (#2=#:G232 NIL) (|j| NIL) (#3=#:G238 NIL)
          (#4=#:G234 NIL) (|lch| (|List| %)))
         (SEQ
          (COND ((> |k| |n|) (SPADCALL (QREFELT % 75)))
                ((OR (EQL |k| 1) (EQL |k| |n|)) (SPADCALL 0 (QREFELT % 49)))
                ('T
                 (SEQ
                  (LETT |lch|
                        (LIST
                         (SPADCALL 0
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #1# (- |n| 1))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (PROG1 (LETT #2# (- |k| 1))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 80))
                                    (QREFELT % 43))
                                   (QREFELT % 53))))
                  (SEQ (LETT |j| 1) (LETT #3# |k|) G190
                       (COND ((|greater_SI| |j| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |lch|
                               (SPADCALL |lch|
                                         (SPADCALL 0
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #4# (- |n| 1))
                                                       (|check_subtype2|
                                                        (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                                     |k| (QREFELT % 80))
                                                    (QREFELT % 43))
                                                   (QREFELT % 53))
                                         (QREFELT % 77)))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |lch| (QREFELT % 52))))))))) 

(SDEFUN |LINDTREE;pathToUnorderedSetPartition;2NniLL;36|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (|lp| (|List| (|NonNegativeInteger|)))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|n'| (|NonNegativeInteger|)) (#1=#:G265 NIL) (#2=#:G266 NIL)
          (#3=#:G242 NIL) (#4=#:G243 NIL) (#5=#:G245 NIL) (#6=#:G246 NIL)
          (|lr| (|List| (|NonNegativeInteger|))) (#7=#:G267 NIL)
          (#8=#:G268 NIL) (#9=#:G269 NIL) (|i| NIL) (#10=#:G270 NIL) (|s| NIL)
          (#11=#:G272 NIL) (|p| NIL) (#12=#:G271 NIL) (#13=#:G273 NIL)
          (|cli| NIL) (#14=#:G274 NIL)
          (|cl| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |n'| |n|)
              (EXIT
               (COND
                ((NULL |lp|)
                 (LIST
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |i| |n|) G190 (COND ((< |i| 1) (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS |i| #1#))))
                        (LETT |i| (+ |i| -1)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))))
                ('T
                 (SEQ (LETT |lr| NIL)
                      (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((EQL |p| 1)
                              (SEQ
                               (LETT |n|
                                     (PROG1 (LETT #3# (- |n| 1))
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#)))
                               (LETT |k|
                                     (PROG1 (LETT #4# (- |k| 1))
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#)))
                               (EXIT (LETT |lr| (CONS 0 |lr|))))))
                            (EXIT
                             (COND
                              ((>= |p| 2)
                               (SEQ
                                (LETT |n|
                                      (PROG1 (LETT #5# (- |n| 1))
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#)))
                                (EXIT
                                 (LETT |lr|
                                       (CONS
                                        (PROG1 (LETT #6# (- |p| 1))
                                          (|check_subtype2| (>= #6# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #6#))
                                        |lr|))))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |cl| NIL)
                      (COND
                       ((EQL |n| |k|)
                        (LETT |cl|
                              (PROGN
                               (LETT #7# NIL)
                               (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                                    (COND ((|greater_SI| |i| #8#) (GO G191)))
                                    (SEQ
                                     (EXIT (LETT #7# (CONS (LIST |i|) #7#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #7#)))))))
                      (COND
                       ((EQL |k| 1)
                        (LETT |cl|
                              (LIST
                               (PROGN
                                (LETT #9# NIL)
                                (SEQ (LETT |i| 1) (LETT #10# |n|) G190
                                     (COND ((|greater_SI| |i| #10#) (GO G191)))
                                     (SEQ (EXIT (LETT #9# (CONS |i| #9#))))
                                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                     (EXIT (NREVERSE #9#))))))))
                      (SEQ (LETT |s| (+ |n| 1)) (LETT #11# |n'|) (LETT |p| NIL)
                           (LETT #12# |lr|) G190
                           (COND
                            ((OR (ATOM #12#) (PROGN (LETT |p| (CAR #12#)) NIL)
                                 (> |s| #11#))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL |p| 0)
                               (LETT |cl|
                                     (SPADCALL |cl| (LIST |s|)
                                               (QREFELT % 78))))
                              ('T
                               (SPADCALL |cl| |p|
                                         (CONS |s|
                                               (SPADCALL |cl| |p|
                                                         (QREFELT % 81)))
                                         (QREFELT % 32))))))
                           (LETT #12# (PROG1 (CDR #12#) (LETT |s| (+ |s| 1))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |cl|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT |cli| NIL) (LETT #14# |cl|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |cli| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (SPADCALL (ELT % 82) |cli|
                                                     (QREFELT % 84))
                                           #13#))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))
                      (EXIT
                       (SPADCALL (CONS (|function| |LINDTREE;grtrIntern|) %)
                                 |cl| (QREFELT % 86)))))))))) 

(SDEFUN |LINDTREE;unorderedNumberPartitionTree;2Nni%;37|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G281 NIL) (#2=#:G282 NIL) (#3=#:G283 NIL) (#4=#:G294 NIL)
          (#5=#:G295 NIL))
         (COND ((> |k| |n|) (SPADCALL (QREFELT % 75)))
               ((OR (EQL |k| 1) (EQL |k| |n|)) (SPADCALL 0 (QREFELT % 49)))
               (#6='T
                (COND
                 ((>= |n| (+ |k| |k|))
                  (SPADCALL
                   (LIST
                    (SPADCALL
                     (PROG1 (LETT #1# (- |n| |k|))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     |k| (QREFELT % 88))
                    (SPADCALL
                     (PROG1 (LETT #2# (- |n| 1))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     (PROG1 (LETT #3# (- |k| 1))
                       (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #3#))
                     (QREFELT % 88)))
                   (QREFELT % 52)))
                 (#6#
                  (SPADCALL
                   (LIST
                    (SPADCALL
                     (PROG1 (LETT #4# (- |n| 1))
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     (PROG1 (LETT #5# (- |k| 1))
                       (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #5#))
                     (QREFELT % 88)))
                   (QREFELT % 52)))))))) 

(SDEFUN |LINDTREE;pathToUnorderedNumberPartition;2Nni2L;38|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (|lp| (|List| (|NonNegativeInteger|)))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|p| NIL) (#1=#:G316 NIL) (#2=#:G299 NIL) (#3=#:G301 NIL)
          (#4=#:G302 NIL) (#5=#:G304 NIL) (#6=#:G305 NIL)
          (|lr| (|List| (|NonNegativeInteger|))) (|r| NIL) (#7=#:G317 NIL)
          (#8=#:G318 NIL) (|u| NIL) (#9=#:G319 NIL)
          (|unp| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |lr| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((>= |n| (+ |k| |k|))
                       (COND
                        ((EQL |p| 1)
                         (SEQ
                          (LETT |n|
                                (PROG1 (LETT #2# (- |n| |k|))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#)))
                          (EXIT (LETT |lr| (CONS 1 |lr|)))))
                        ('T
                         (SEQ
                          (LETT |n|
                                (PROG1 (LETT #3# (- |n| 1))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#)))
                          (LETT |k|
                                (PROG1 (LETT #4# (- |k| 1))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          (EXIT (LETT |lr| (CONS 0 |lr|)))))))
                      ('T
                       (SEQ
                        (LETT |n|
                              (PROG1 (LETT #5# (- |n| 1))
                                (|check_subtype2| (>= #5# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #5#)))
                        (LETT |k|
                              (PROG1 (LETT #6# (- |k| 1))
                                (|check_subtype2| (>= #6# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #6#)))
                        (EXIT (LETT |lr| (CONS 0 |lr|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |unp| NIL)
              (COND
               ((EQL |n| |k|) (LETT |unp| (SPADCALL |n| 1 (QREFELT % 89)))))
              (COND ((EQL |k| 1) (LETT |unp| (LIST |n|))))
              (SEQ (LETT |r| NIL) (LETT #7# |lr|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |r| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQL |r| 0)
                      (LETT |unp| (SPADCALL |unp| 1 (QREFELT % 28)))))
                    (EXIT
                     (COND
                      ((EQL |r| 1)
                       (LETT |unp|
                             (PROGN
                              (LETT #8# NIL)
                              (SEQ (LETT |u| NIL) (LETT #9# |unp|) G190
                                   (COND
                                    ((OR (ATOM #9#)
                                         (PROGN (LETT |u| (CAR #9#)) NIL))
                                     (GO G191)))
                                   (SEQ (EXIT (LETT #8# (CONS (+ |u| 1) #8#))))
                                   (LETT #9# (CDR #9#)) (GO G190) G191
                                   (EXIT (NREVERSE #8#)))))))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT |unp|)))) 

(SDEFUN |LINDTREE;subsetTree;2Nni%;39|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G340 NIL) (|i| NIL) (#2=#:G341 NIL) (#3=#:G335 NIL)
          (#4=#:G336 NIL) (#5=#:G337 NIL))
         (SEQ
          (COND ((OR (> |k| |n|) (EQL |n| 0)) (SPADCALL (QREFELT % 75)))
                ('T
                 (COND ((EQL |k| 0) (SPADCALL 0 (QREFELT % 49)))
                       ((EQL |k| 1)
                        (SPADCALL
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS (SPADCALL |i| (QREFELT % 49))
                                             #1#))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 52)))
                       ((EQL |k| |n|) (SPADCALL 0 (QREFELT % 49)))
                       ('T
                        (SPADCALL
                         (LIST
                          (SPADCALL
                           (PROG1 (LETT #3# (- |n| 1))
                             (|check_subtype2| (>= #3# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #3#))
                           (PROG1 (LETT #4# (- |k| 1))
                             (|check_subtype2| (>= #4# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #4#))
                           (QREFELT % 91))
                          (SPADCALL
                           (PROG1 (LETT #5# (- |n| 1))
                             (|check_subtype2| (>= #5# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #5#))
                           |k| (QREFELT % 91)))
                         (QREFELT % 52))))))))) 

(SDEFUN |LINDTREE;pathToSubset;2NniLL;40|
        ((|n| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (|lp| (|List| (|NonNegativeInteger|))) (% (|List| (|Integer|))))
        (SPROG
         ((#1=#:G359 NIL) (|j| NIL) (|p| NIL) (#2=#:G360 NIL) (#3=#:G345 NIL)
          (#4=#:G346 NIL) (#5=#:G347 NIL) (#6=#:G361 NIL) (|i| NIL)
          (|ls| (|List| (|Integer|))) (#7=#:G352 NIL) (#8=#:G354 NIL))
         (SEQ (LETT |ls| NIL)
              (EXIT
               (COND
                ((EQL |n| |k|)
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| |n|) G190 (COND ((< |i| 1) (GO G191)))
                       (SEQ (EXIT (LETT #1# (CONS |i| #1#))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191
                       (EXIT (NREVERSE #1#)))))
                ('T
                 (SEQ
                  (SEQ (LETT |j| 1) (LETT |p| NIL) (LETT #2# |lp|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL |k| 1)
                           (LETT |ls|
                                 (SPADCALL |ls|
                                           (PROG1 (LETT #3# (+ (- |n| |p|) 1))
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT % 73))))
                          ((EQL |p| 1)
                           (SEQ (LETT |ls| (SPADCALL |ls| |n| (QREFELT % 73)))
                                (LETT |n|
                                      (PROG1 (LETT #4# (- |n| 1))
                                        (|check_subtype2| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #4#)))
                                (EXIT
                                 (LETT |k|
                                       (PROG1 (LETT #5# (- |k| 1))
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #5#))))))
                          ((EQL |p| 2)
                           (COND
                            ((EQL |j| (SPADCALL |lp| (QREFELT % 16)))
                             (LETT |ls|
                                   (SPADCALL |ls|
                                             (PROGN
                                              (LETT #6# NIL)
                                              (SEQ (LETT |i| |k|) G190
                                                   (COND ((< |i| 1) (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #6#
                                                           (CONS |i| #6#))))
                                                   (LETT |i| (+ |i| -1))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #6#))))
                                             (QREFELT % 92))))
                            ('T
                             (LETT |n|
                                   (PROG1 (LETT #7# (- |n| 1))
                                     (|check_subtype2| (>= #7# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #7#))))))
                          ('T
                           (LETT |n|
                                 (PROG1 (LETT #8# (- |n| 1))
                                   (|check_subtype2| (>= #8# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #8#)))))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |ls|)))))))) 

(DECLAIM (NOTINLINE |LeafIndexingTree;|)) 

(DEFUN |LeafIndexingTree;| ()
  (SPROG ((|dv$| NIL) (% NIL) (#1=#:G365 NIL) (#2=#:G364 NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LeafIndexingTree|))
          (LETT % (GETREFV 102))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|NonNegativeInteger|)
                                                     '(|SetCategory|)))
                                              (AND
                                               (|HasCategory|
                                                (|NonNegativeInteger|)
                                                '(|Evalable|
                                                  (|NonNegativeInteger|)))
                                               #1#)
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|OrderedSet|))
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|BasicType|))
                                              (LETT #2#
                                                    (|HasCategory|
                                                     (|NonNegativeInteger|)
                                                     '(|CoercibleTo|
                                                       (|OutputForm|))))
                                              (OR #2#
                                                  (AND
                                                   (|HasCategory|
                                                    (|NonNegativeInteger|)
                                                    '(|Evalable|
                                                      (|NonNegativeInteger|)))
                                                   #1#))))))
          (|haddProp| |$ConstructorCache| '|LeafIndexingTree| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|finiteAggregate|))
               (|augmentPredVector| % 64))
          (AND (|HasCategory| % '(|finiteAggregate|))
               (|HasCategory| (|NonNegativeInteger|) '(|OrderedSet|))
               (|augmentPredVector| % 128))
          (AND (|HasCategory| % '(|finiteAggregate|))
               (|HasCategory| (|NonNegativeInteger|) '(|BasicType|))
               (|augmentPredVector| % 256))
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 512))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|Tree| (|NonNegativeInteger|)))
          %))) 

(DEFUN |LeafIndexingTree| ()
  (SPROG NIL
         (PROG (#1=#:G367)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LeafIndexingTree|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LeafIndexingTree|
                             (LIST (CONS NIL (CONS 1 (|LeafIndexingTree;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|LeafIndexingTree|)))))))))) 

(MAKEPROP '|LeafIndexingTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Tree| 12) '|Rep| |LINDTREE;copy;2%;18|
              |LINDTREE;coerce;%T;9| (|Integer|) (|List| 5) (0 . |elt|)
              (|NonNegativeInteger|) (6 . |setvalue!|) (|List| 12)
              (12 . |leaves|) (17 . |#|) (22 . |retract|) (|List| %)
              |LINDTREE;setCountingValues;2L;3| (|SingleInteger|) (27 . ^)
              (33 . |binomial|) (39 . +) (|Mapping| 12 12 12) (45 . |reduce|)
              (52 . |position|) (58 . |first|) (64 . |concat|) (70 . |rest|)
              (76 . |concat|) (|List| 14) (82 . |setelt!|) (|Boolean|) (89 . >)
              (95 . <) |LINDTREE;grtr;2LB;7| |LINDTREE;cyclic?;%B;8|
              |LINDTREE;isLeafIndexingTree?;TB;19| (|Union| % '"failed")
              |LINDTREE;retractIfCan;TU;10| (101 . |leaf?|)
              |LINDTREE;numberOfChildren;%Nni;21| (106 . |children|)
              (|List| $$) (111 . |elt|) (|PositiveInteger|)
              |LINDTREE;elt;%Pi%;11| (117 . |tree|)
              |LINDTREE;leafIndexingTree;Nni%;12| (122 . |copy|) (127 . |tree|)
              |LINDTREE;leafIndexingTree;L%;13|
              |LINDTREE;leafIndexingTree;NniL%;14| |LINDTREE;setValue;%Nni%;15|
              (133 . |empty?|) (138 . |children|)
              |LINDTREE;leafIndexingTree;T%;16| (143 . |value|)
              |LINDTREE;setchildren!;%L%;17| |LINDTREE;childrenValues;%L;20|
              |LINDTREE;numberOfLeaves;%Nni;22| (148 . |#|)
              |LINDTREE;nextEdge;NniLNni;23| |LINDTREE;rank;%LNni;24|
              |LINDTREE;unrank;%NniL;25| |LINDTREE;enumerate;%L;26|
              |LINDTREE;randomPath;%L;27| |LINDTREE;isPathToLeaf?;%LB;28|
              |LINDTREE;logicFunctionTree;2Nni%;29| (153 . |tree|)
              |LINDTREE;logicFunctionTree;Nni%;30| (|List| 9) (159 . |concat|)
              |LINDTREE;P;3Nni;32| (165 . |empty|)
              |LINDTREE;permutationCyclesTree;2Nni%;33| (169 . |concat|)
              (175 . |concat|) |LINDTREE;pathToPermutationCycles;2NniLL;34|
              |LINDTREE;unorderedSetPartitionTree;2Nni%;35| (181 . |elt|)
              (187 . >) (|Mapping| 33 12 12) (193 . |sort|)
              (|Mapping| 33 14 14) (199 . |sort|)
              |LINDTREE;pathToUnorderedSetPartition;2NniLL;36|
              |LINDTREE;unorderedNumberPartitionTree;2Nni%;37| (205 . |new|)
              |LINDTREE;pathToUnorderedNumberPartition;2Nni2L;38|
              |LINDTREE;subsetTree;2Nni%;39| (211 . |concat|)
              |LINDTREE;pathToSubset;2NniLL;40| (|Mapping| 12 12) '"value"
              (|HashState|) (|List| 98) (|Equation| 12) (|Mapping| 33 12)
              (|OutputForm|) (|String|))
           '#(~= 217 |value| 223 |unrank| 228 |unorderedSetPartitionTree| 234
              |unorderedNumberPartitionTree| 240 |subsetTree| 246 |size?| 252
              |setvalue!| 258 |setelt!| 264 |setchildren!| 271 |setValue| 277
              |setCountingValues| 283 |sample| 288 |retractIfCan| 292 |retract|
              297 |rank| 302 |randomPath| 308 |permutationCyclesTree| 313
              |pathToUnorderedSetPartition| 319
              |pathToUnorderedNumberPartition| 326 |pathToSubset| 333
              |pathToPermutationCycles| 340 |parts| 347 |numberOfNodes| 352
              |numberOfLeaves| 358 |numberOfChildren| 363 |nodes| 368 |node?|
              373 |nextEdge| 379 |more?| 385 |min| 391 |members| 396 |member?|
              401 |max| 407 |map!| 418 |map| 424 |logicFunctionTree| 430
              |less?| 441 |leaves| 447 |leafIndexingTree| 452 |leaf?| 473
              |latex| 478 |isPathToLeaf?| 483 |isLeafIndexingTree?| 489
              |hashUpdate!| 494 |hash| 500 |grtr| 505 |every?| 511 |eval| 517
              |eq?| 543 |enumerate| 549 |empty?| 554 |empty| 559 |elt| 563
              |distance| 575 |depth| 581 |cyclic?| 586 |count| 591 |copy| 603
              |coerce| 608 |childrenValues| 618 |children| 623 |child?| 628
              |any?| 634 P 640 = 646 |#| 652)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 1 2 0 0 0 6 2 0 0 0 0 0 0))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&|
                     |SetCategory&| |Evalable&| |RetractableFrom&| |Hashable&|
                     |Aggregate&| NIL |InnerEvalable&| NIL NIL NIL NIL
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| 12) (|HomogeneousAggregate| 12)
                      (|SetCategory|) (|Evalable| 12) (|RetractableFrom| 5)
                      (|Hashable|) (|Aggregate|) (|CoercibleTo| 100)
                      (|InnerEvalable| 12 12) (|finiteAggregate|)
                      (|shallowlyMutable|) (|CoercibleTo| 5) (|Eltable| 46 $$)
                      (|BasicType|) (|Type|))
                   (|makeByteWordVec2| 101
                                       '(2 10 5 0 9 11 2 0 12 0 12 13 1 0 14 0
                                         15 1 14 12 0 16 1 0 0 5 17 2 20 0 0 12
                                         21 2 9 0 0 0 22 2 12 0 0 0 23 3 14 12
                                         24 0 12 25 2 14 9 12 0 26 2 14 0 0 12
                                         27 2 14 0 0 12 28 2 14 0 0 12 29 2 14
                                         0 0 0 30 3 31 14 0 9 14 32 2 14 33 0 0
                                         34 2 14 33 0 0 35 1 0 33 0 41 1 0 18 0
                                         43 2 44 2 0 9 45 1 6 0 12 48 1 5 0 0
                                         50 2 5 0 12 18 51 1 0 33 0 55 1 5 18 0
                                         56 1 0 12 0 58 1 44 12 0 62 2 6 0 12
                                         18 70 2 72 0 0 9 73 0 0 0 75 2 44 0 0
                                         2 77 2 31 0 0 14 78 2 31 14 0 9 81 2
                                         12 33 0 0 82 2 14 0 83 0 84 2 31 0 85
                                         0 86 2 14 0 12 12 89 2 72 0 0 0 92 2 0
                                         33 0 0 1 1 0 12 0 58 2 0 14 0 12 65 2
                                         0 0 12 12 80 2 0 0 12 12 88 2 0 0 12
                                         12 91 2 0 33 0 12 1 2 10 12 0 12 13 3
                                         10 12 0 95 12 1 2 10 0 0 18 59 2 0 0 0
                                         12 54 1 0 18 18 19 0 0 0 1 1 0 39 5 40
                                         1 0 0 5 17 2 0 12 0 14 64 1 0 14 0 67
                                         2 0 0 12 12 76 3 0 31 12 12 14 87 3 0
                                         14 12 12 14 90 3 0 72 12 12 14 93 3 0
                                         31 12 12 14 79 1 7 14 0 1 2 0 12 0 12
                                         1 1 0 12 0 61 1 0 12 0 42 1 0 18 0 1 2
                                         4 33 0 0 1 2 0 12 12 14 63 2 0 33 0 12
                                         1 1 8 12 0 1 1 7 14 0 1 2 9 33 12 0 1
                                         1 8 12 0 1 2 7 12 83 0 1 2 10 0 94 0 1
                                         2 0 0 94 0 1 2 0 0 12 12 69 1 0 0 12
                                         71 2 0 33 0 12 1 1 0 14 0 15 1 0 0 12
                                         49 2 0 0 12 18 53 1 0 0 18 52 1 0 0 5
                                         57 1 0 33 0 41 1 1 101 0 1 2 0 33 0 14
                                         68 1 0 33 5 38 2 0 96 96 0 1 1 0 20 0
                                         1 2 0 33 31 31 36 2 7 33 99 0 1 2 2 0
                                         0 97 1 2 2 0 0 98 1 3 2 0 0 14 14 1 3
                                         2 0 0 12 12 1 2 0 33 0 0 1 1 0 31 0 66
                                         1 0 33 0 55 0 0 0 75 2 0 12 0 95 1 2 0
                                         0 0 46 47 2 0 9 0 0 1 1 0 12 0 1 1 0
                                         33 0 37 2 9 12 12 0 1 2 7 12 99 0 1 1
                                         0 0 0 7 1 0 5 0 8 1 5 100 0 1 1 0 14 0
                                         60 1 0 18 0 43 2 4 33 0 0 1 2 7 33 99
                                         0 1 2 0 12 12 12 74 2 0 33 0 0 1 1 7
                                         12 0 1)))))
           '|lookupComplete|)) 
