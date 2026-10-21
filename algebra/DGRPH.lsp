
(SDEFUN |DGRPH;directedGraph;L%;1| ((|objs| (|List| S)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G33 NIL) (|ob| NIL) (#2=#:G32 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| NIL)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (EXIT (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| NIL))))) 

(MAKEPROP '|DGRPH;directedGraph;L%;2| '|SPADreplace|
          '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |DGRPH;directedGraph;L%;2|
        ((|ob|
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)))))
         (% (%)))
        (CONS |ob| NIL)) 

(MAKEPROP '|DGRPH;directedGraph;LL%;3| '|SPADreplace| 'CONS) 

(SDEFUN |DGRPH;directedGraph;LL%;3|
        ((|ob|
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)))))
         (|ar|
          (|List|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (% (%)))
        (CONS |ob| |ar|)) 

(SDEFUN |DGRPH;directedGraph;LL%;4|
        ((|obs| (|List| S))
         (|ars|
          (|List|
           (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|)))))
         (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G54 NIL) (|ob| NIL) (#2=#:G53 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|arn| NIL) (#3=#:G56 NIL) (|ar| NIL) (#4=#:G55 NIL)
          (|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |nodes| NIL)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |obs|)) (LETT |ob| NIL)
                   (LETT #2# |obs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |obs|) |obn| (QREFELT % 9))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT % 10))))
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT % 13)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |edges| NIL)
              (SEQ (LETT |arn| 1) (LETT #3# (LENGTH |ars|)) (LETT |ar| NIL)
                   (LETT #4# |ars|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ar| (CAR #4#)) NIL)
                         (|greater_SI| |arn| #3#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |edges|
                           (SPADCALL |edges|
                                     (VECTOR (STRCONC "a" (STRINGIMAGE |arn|))
                                             0 (QCAR |ar|) (QCDR |ar|) 0 0 NIL)
                                     (QREFELT % 20)))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |arn| (|inc_SI| |arn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |nodes| |edges|))))) 

(SDEFUN |DGRPH;directedGraph;Fp%;5| ((|poset| (|FinitePoset| S)) (% (%)))
        (SPROG
         ((|obs| (|List| S)) (|mat| (|List| (|List| (|Boolean|)))) (|xn| NIL)
          (#1=#:G66 NIL) (|x| NIL) (#2=#:G65 NIL) (|yn| NIL) (#3=#:G68 NIL)
          (|y| NIL) (#4=#:G67 NIL)
          (|z|
           #5=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))))
          (|ars| (|List| #5#)))
         (SEQ (LETT |obs| (SPADCALL |poset| (QREFELT % 25))) (LETT |ars| NIL)
              (LETT |mat| (SPADCALL |poset| (QREFELT % 27)))
              (SEQ (LETT |xn| 1) (LETT #1# (LENGTH |mat|)) (LETT |x| NIL)
                   (LETT #2# |mat|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                         (|greater_SI| |xn| #1#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |yn| 1) (LETT #3# (LENGTH |x|)) (LETT |y| NIL)
                          (LETT #4# |x|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |y| (CAR #4#)) NIL)
                                (|greater_SI| |yn| #3#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             (|y|
                              (SEQ (LETT |z| (CONS |xn| |yn|))
                                   (EXIT
                                    (LETT |ars|
                                          (SPADCALL |ars| |z|
                                                    (QREFELT % 28)))))))))
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT |yn| (|inc_SI| |yn|))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |xn| (|inc_SI| |xn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |obs| |ars| (QREFELT % 23)))))) 

(SDEFUN |DGRPH;directedGraph;LL%;6|
        ((|objs| (|List| S)) (|am| (|List| (|List| (|NonNegativeInteger|))))
         (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G83 NIL) (|ob| NIL) (#2=#:G82 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| NIL) (#3=#:G84 NIL) (|j| NIL) (#4=#:G85 NIL)
          (|a|
           #5=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ar| (|List| #5#)))
         (SEQ (LETT |obs| NIL)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (EXIT (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |ar| NIL)
              (SEQ (LETT |i| 1) (LETT #3# (LENGTH |am|)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #4#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT % 33))
                                          (QREFELT % 34)))
                          G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT % 33)) |j|
                                         (QREFELT % 35))
                               1)
                              (SEQ (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL))
                                   (EXIT
                                    (LETT |ar|
                                          (SPADCALL |ar| |a|
                                                    (QREFELT % 20)))))))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |DGRPH;directedGraph;L%;7|
        ((|perms| (|List| (|Permutation| S))) (% (%)))
        (SPROG
         ((|px| NIL) (#1=#:G321 NIL) (#2=#:G320 NIL) (|v| NIL) (#3=#:G322 NIL)
          (|obs| (|List| S)) (#4=#:G323 NIL) (|b| NIL) (#5=#:G324 NIL)
          (#6=#:G325 NIL) (#7=#:G326 NIL)
          (|tab| (|List| (|List| (|NonNegativeInteger|)))) (|pi| NIL)
          (#8=#:G328 NIL) (|perm| NIL) (#9=#:G327 NIL)
          (|lr|
           (|Record| (|:| |preimage| #10=(|List| S))
                     (|:| |image| #11=(|List| S))))
          (|im| #11#) (|preim| #10#) (|pt| NIL) (#12=#:G329 NIL)
          (|pin| #13=(|Integer|)) (|pout| #13#) (#14=#:G305 NIL)
          (#15=#:G306 NIL) (|i| NIL) (#16=#:G331 NIL) (|vert| NIL)
          (#17=#:G330 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|verts|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|arrNum| NIL) (#18=#:G332 NIL)
          (|a|
           #19=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #19#)))
         (SEQ (LETT |obs| NIL)
              (SEQ (LETT |px| 1) (LETT #1# (LENGTH |perms|)) (LETT |perm| NIL)
                   (LETT #2# |perms|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |perm| (CAR #2#)) NIL)
                         (|greater_SI| |px| #1#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT % 39)))
                        (LETT |im| (QCDR |lr|))
                        (EXIT
                         (COND ((EQL |px| 1) (LETT |obs| |im|))
                               ('T
                                (SEQ (LETT |v| NIL) (LETT #3# |im|) G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN (LETT |v| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((< (SPADCALL |v| |obs| (QREFELT % 41))
                                            1)
                                         (LETT |obs|
                                               (SPADCALL |obs| |v|
                                                         (QREFELT % 42)))))))
                                     (LETT #3# (CDR #3#)) (GO G190) G191
                                     (EXIT NIL))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |px| (|inc_SI| |px|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |tab|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |b| 1) (LETT #5# (LENGTH |obs|)) G190
                          (COND ((|greater_SI| |b| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (PROGN
                                    (LETT #6# NIL)
                                    (SEQ (LETT |a| 1)
                                         (LETT #7# (LENGTH |perms|)) G190
                                         (COND
                                          ((|greater_SI| |a| #7#) (GO G191)))
                                         (SEQ (EXIT (LETT #6# (CONS |b| #6#))))
                                         (LETT |a| (|inc_SI| |a|)) (GO G190)
                                         G191 (EXIT (NREVERSE #6#))))
                                   #4#))))
                          (LETT |b| (|inc_SI| |b|)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (SEQ (LETT |pi| 1) (LETT #8# (LENGTH |perms|)) (LETT |perm| NIL)
                   (LETT #9# |perms|) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |perm| (CAR #9#)) NIL)
                         (|greater_SI| |pi| #8#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT % 39)))
                        (LETT |im| (QCDR |lr|)) (LETT |preim| (QCAR |lr|))
                        (EXIT
                         (SEQ (LETT |pt| 1) (LETT #12# (LENGTH |im|)) G190
                              (COND ((|greater_SI| |pt| #12#) (GO G191)))
                              (SEQ
                               (LETT |pin|
                                     (SPADCALL
                                      (SPADCALL |im| |pt| (QREFELT % 43)) |obs|
                                      (QREFELT % 41)))
                               (LETT |pout|
                                     (SPADCALL
                                      (SPADCALL |preim| |pt| (QREFELT % 43))
                                      |obs| (QREFELT % 41)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |tab|
                                           (PROG1 (LETT #14# |pin|)
                                             (|check_subtype2| (>= #14# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #14#))
                                           (QREFELT % 33))
                                 |pi|
                                 (PROG1 (LETT #15# |pout|)
                                   (|check_subtype2| (>= #15# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #15#))
                                 (QREFELT % 44))))
                              (LETT |pt| (|inc_SI| |pt|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #9# (PROG1 (CDR #9#) (LETT |pi| (|inc_SI| |pi|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |verts| NIL) (LETT |ars| NIL)
              (SEQ (LETT |i| 1) (LETT #16# (LENGTH |obs|)) (LETT |vert| NIL)
                   (LETT #17# |obs|) G190
                   (COND
                    ((OR (ATOM #17#) (PROGN (LETT |vert| (CAR #17#)) NIL)
                         (|greater_SI| |i| #16#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |vert|
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT % 9))
                                  (SPADCALL (LENGTH |obs|) |i|
                                            (QREFELT % 10))))
                    (LETT |verts| (SPADCALL |verts| |o| (QREFELT % 13)))
                    (EXIT
                     (SEQ (LETT |arrNum| NIL)
                          (LETT #18# (SPADCALL |tab| |i| (QREFELT % 33))) G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |arrNum| (CAR #18#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |a| (VECTOR "a" 0 |i| |arrNum| 0 0 NIL))
                               (EXIT
                                (LETT |ars|
                                      (SPADCALL |ars| |a| (QREFELT % 20)))))
                          (LETT #18# (CDR #18#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #17# (PROG1 (CDR #17#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |verts| |ars|))))) 

(SDEFUN |DGRPH;addObject!;%S%;8| ((|s| (%)) (|n| (S)) (% (%)))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)))))
         (SEQ (LETT |obs| (QCAR |s|)) (LETT |obj| (VECTOR |n| 0 0))
              (COND
               ((SPADCALL |obs| NIL (QREFELT % 48))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT % 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addObject!;%R%;9|
        ((|s| (%))
         (|n|
          (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                    (|:| |posY| #1#)))
         (% (%)))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|))
              (COND
               ((SPADCALL |obs| NIL (QREFELT % 48))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT % 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addArrow!;%R%;10|
        ((|s| (%))
         (|ar|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| #1=(|NonNegativeInteger|))
                    (|:| |fromOb| #1#) (|:| |toOb| #1#)
                    (|:| |xOffset| #2=(|Integer|)) (|:| |yOffset| #2#)
                    (|:| |map| (|List| #1#))))
         (% (%)))
        (SEQ
         (PROGN
          (RPLACD |s| (SPADCALL (QCDR |s|) |ar| (QREFELT % 20)))
          (QCDR |s|))
         (EXIT |s|))) 

(SDEFUN |DGRPH;addArrow!;%S2Nni%;11|
        ((|s| (%)) (|nm| (|String|)) (|n1| #1=(|NonNegativeInteger|))
         (|n2| #1#) (% (%)))
        (SPROG
         ((|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL))
              (EXIT (SPADCALL |s| |a| (QREFELT % 51)))))) 

(SDEFUN |DGRPH;addArrow!;%S2NniL%;12|
        ((|s| (%)) (|nm| (|String|)) (|n1| #1=(|NonNegativeInteger|))
         (|n2| #1#) (|mp| (|List| #1#)) (% (%)))
        (SPROG
         ((|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|))
              (EXIT (SPADCALL |s| |a| (QREFELT % 51)))))) 

(MAKEPROP '|DGRPH;getVertices;%L;13| '|SPADreplace| 'QCAR) 

(SDEFUN |DGRPH;getVertices;%L;13|
        ((|s| (%))
         (%
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))))
        (QCAR |s|)) 

(MAKEPROP '|DGRPH;getArrows;%L;14| '|SPADreplace| 'QCDR) 

(SDEFUN |DGRPH;getArrows;%L;14|
        ((|s| (%))
         (%
          (|List|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))))
        (QCDR |s|)) 

(SDEFUN |DGRPH;flatten;Dg%;15| ((|n| (|DirectedGraph| %)) (% (%)))
        (SPROG
         ((|v|
           (|List|
            (|Record| (|:| |value| %) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|v2| NIL) (#1=#:G379 NIL) (|v3| (%))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob| NIL) (#2=#:G380 NIL) (|px| #3=(|NonNegativeInteger|))
          (|py| #3#)
          (|ob2|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs2|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|innerValues|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ina|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|innerArrows|
           (|List|
            (|List|
             #4=(|Record| (|:| |name| #5=(|String|))
                          (|:| |arrType| #6=(|NonNegativeInteger|))
                          (|:| |fromOb| (|NonNegativeInteger|))
                          (|:| |toOb| (|NonNegativeInteger|))
                          (|:| |xOffset| #7=(|Integer|))
                          (|:| |yOffset| #8=(|Integer|))
                          (|:| |map| #9=(|List| (|NonNegativeInteger|)))))))
          (|offsets| (|List| (|NonNegativeInteger|)))
          (|offset| (|NonNegativeInteger|))
          (|iv|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|a2n| NIL) (#10=#:G382 NIL) (|a2| NIL) (#11=#:G381 NIL) (|a3| NIL)
          (#12=#:G383 NIL) (|name2| #5#) (|arrType2| #6#) (|fromOb2| #3#)
          (|toOb2| #3#) (|xOffset2| #7#) (|yOffset2| #8#) (|map2| #9#)
          (|outerArrows|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|oa3| NIL) (#13=#:G384 NIL) (|name3| #5#) (|arrType3| #6#)
          (|xOffset3| #7#) (|yOffset3| #8#) (|map3| #9#) (|starti| NIL)
          (#14=#:G386 NIL) (|endi| NIL) (#15=#:G385 NIL) (|fromOb3| #3#)
          (|toOb3| #3#) (|arr| #4#)
          (|a|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |v| (SPADCALL |n| (QREFELT % 60))) (LETT |innerValues| NIL)
              (LETT |offset| 0) (LETT |offsets| NIL) (LETT |innerArrows| NIL)
              (SEQ (LETT |v2| NIL) (LETT #1# |v|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v2| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |v3| (QVELT |v2| 0))
                        (LETT |obs| (SPADCALL |v3| (QREFELT % 55)))
                        (LETT |obs2| NIL)
                        (SEQ (LETT |ob| NIL) (LETT #2# |obs|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ob| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |px|
                                    (+ (QVELT |ob| 1) (* 4 (QVELT |v2| 1))))
                              (LETT |py|
                                    (+ (QVELT |ob| 2) (* 4 (QVELT |v2| 2))))
                              (LETT |ob2| (VECTOR (QVELT |ob| 0) |px| |py|))
                              (EXIT
                               (LETT |obs2|
                                     (SPADCALL |obs2| |ob2| (QREFELT % 13)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (LETT |innerValues|
                              (SPADCALL |innerValues| |obs2| (QREFELT % 61)))
                        (LETT |ina| (SPADCALL |v3| (QREFELT % 56)))
                        (LETT |innerArrows|
                              (SPADCALL |innerArrows| |ina| (QREFELT % 63)))
                        (LETT |offsets|
                              (SPADCALL |offsets| |offset| (QREFELT % 64)))
                        (EXIT (LETT |offset| (+ |offset| (LENGTH |obs|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |iv| |innerValues|) (LETT |a| NIL)
              (SEQ (LETT |a2n| 1) (LETT #10# (LENGTH |innerArrows|))
                   (LETT |a2| NIL) (LETT #11# |innerArrows|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |a2| (CAR #11#)) NIL)
                         (|greater_SI| |a2n| #10#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |a3| NIL) (LETT #12# |a2|) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |a3| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |name2| (QVELT |a3| 0))
                               (LETT |arrType2| (QVELT |a3| 1))
                               (LETT |fromOb2|
                                     (+ (QVELT |a3| 2)
                                        (SPADCALL |offsets| |a2n|
                                                  (QREFELT % 35))))
                               (LETT |toOb2|
                                     (+ (QVELT |a3| 3)
                                        (SPADCALL |offsets| |a2n|
                                                  (QREFELT % 35))))
                               (LETT |xOffset2| (QVELT |a3| 4))
                               (LETT |yOffset2| (QVELT |a3| 5))
                               (LETT |map2| (QVELT |a3| 6))
                               (LETT |arr|
                                     (VECTOR |name2| |arrType2| |fromOb2|
                                             |toOb2| |xOffset2| |yOffset2|
                                             |map2|))
                               (EXIT
                                (LETT |a|
                                      (SPADCALL |a| |arr| (QREFELT % 20)))))
                          (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT |a2n| (|inc_SI| |a2n|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |outerArrows| (SPADCALL |n| (QREFELT % 65)))
              (SEQ (LETT |oa3| NIL) (LETT #13# |outerArrows|) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |oa3| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |name3| (QVELT |oa3| 0))
                        (LETT |arrType3| (QVELT |oa3| 1))
                        (LETT |fromOb3|
                              (+
                               (SPADCALL |offsets| (QVELT |oa3| 2)
                                         (QREFELT % 35))
                               1))
                        (LETT |toOb3|
                              (+
                               (SPADCALL |offsets| (QVELT |oa3| 3)
                                         (QREFELT % 35))
                               1))
                        (LETT |xOffset3| (QVELT |oa3| 4))
                        (LETT |yOffset3| (QVELT |oa3| 5))
                        (LETT |map3| (QVELT |oa3| 6))
                        (EXIT
                         (SEQ (LETT |starti| 1)
                              (LETT #14# (SPADCALL |map3| (QREFELT % 34)))
                              (LETT |endi| NIL) (LETT #15# |map3|) G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |endi| (CAR #15#)) NIL)
                                    (|greater_SI| |starti| #14#))
                                (GO G191)))
                              (SEQ
                               (LETT |fromOb3|
                                     (+
                                      (SPADCALL |offsets| (QVELT |oa3| 2)
                                                (QREFELT % 35))
                                      |starti|))
                               (LETT |toOb3|
                                     (+
                                      (SPADCALL |offsets| (QVELT |oa3| 3)
                                                (QREFELT % 35))
                                      |endi|))
                               (LETT |arr|
                                     (VECTOR |name3| |arrType3| |fromOb3|
                                             |toOb3| |xOffset3| |yOffset3|
                                             NIL))
                               (EXIT
                                (LETT |a|
                                      (SPADCALL |a| |arr| (QREFELT % 20)))))
                              (LETT #15#
                                    (PROG1 (CDR #15#)
                                      (LETT |starti| (|inc_SI| |starti|))))
                              (GO G190) G191 (EXIT NIL))))
                   (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |iv| |a|))))) 

(MAKEPROP '|DGRPH;initial;%;16| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |DGRPH;initial;%;16| ((% (%))) (CONS NIL NIL)) 

(SDEFUN |DGRPH;terminal;S%;17| ((|a| (S)) (% (%)))
        (SPROG
         ((|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|ar|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |o| (VECTOR |a| 0 0))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL))
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |DGRPH;cycleOpen;LS%;18|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G402 NIL) (|ob| NIL) (#2=#:G401 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|next| (|NonNegativeInteger|))
          (|a|
           #3=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))
                    (LETT |next| (+ |obn| 1))
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| |obn|)))
                    (EXIT
                     (COND
                      ((<= |next| (LENGTH |objs|))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL))
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 20)))
                        (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;cycleClosed;LS%;19|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G413 NIL) (|ob| NIL) (#2=#:G412 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|next| (|NonNegativeInteger|))
          (|a|
           #3=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))
                    (LETT |next| (+ |obn| 1))
                    (COND ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| 1)))
                    (EXIT
                     (COND
                      ((<= |next| (LENGTH |objs|))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL))
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 20)))
                        (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;unit;LS%;20|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G421 NIL) (|ob| NIL) (#2=#:G420 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|a|
           #3=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL))
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 20)))
                    (EXIT (LETT |arn| (+ |arn| 1))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;kgraph;LS%;21|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G433 NIL) (|ob| NIL) (#2=#:G432 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|obm| NIL) (#3=#:G434 NIL)
          (|a|
           #4=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #4#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) (LETT |ob| NIL)
                   (LETT #2# |objs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT % 10))))
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))
                    (EXIT
                     (SEQ (LETT |obm| 1) (LETT #3# (LENGTH |objs|)) G190
                          (COND ((|greater_SI| |obm| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT % 73))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL))
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 20)))
                               (EXIT (LETT |arn| (+ |arn| 1))))))))
                          (LETT |obm| (|inc_SI| |obm|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;+;3%;22| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|bStart| (|NonNegativeInteger|)) (|ba| NIL) (#1=#:G442 NIL)
          (|arr|
           #2=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|lb| (|List| #2#))
          (|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT % 61)))
              (LETT |bStart| (LENGTH (QCAR |a|))) (LETT |lb| NIL)
              (SEQ (LETT |ba| NIL) (LETT #1# (QCDR |b|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |arr|
                          (VECTOR (QVELT |ba| 0) (QVELT |ba| 1)
                                  (+ (QVELT |ba| 2) |bStart|)
                                  (+ (QVELT |ba| 3) |bStart|) (QVELT |ba| 4)
                                  (QVELT |ba| 5) NIL))
                    (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT % 20)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT % 75)))
              (EXIT (CONS |lo| |la|))))) 

(SDEFUN |DGRPH;merge;3%;23| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((#1=#:G462 NIL) (|x| NIL) (#2=#:G463 NIL) (|bob| NIL) (#3=#:G464 NIL)
          (|i| (|Integer|))
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|newIndex| #4=(|NonNegativeInteger|)) (#5=#:G452 NIL)
          (|bmap| (|List| (|NonNegativeInteger|))) (|bStart| #4#) (|ba| NIL)
          (#6=#:G465 NIL) (|toI| #7=(|NonNegativeInteger|)) (|fromI| #7#)
          (|arr|
           #8=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|lb| (|List| #8#))
          (|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| 1) (LETT #2# (LENGTH (QCAR |a|))) G190
                      (COND ((|greater_SI| |x| #2#) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS |x| #1#))))
                      (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |newIndex| (LENGTH (QCAR |a|)))
          (LETT |mergedObjects| (QCAR |a|))
          (SEQ (LETT |bob| NIL) (LETT #3# (QCAR |b|)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |bob| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT % 77)))
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT % 13)))
                        (LETT |newIndex| (+ |newIndex| 1))
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT % 64))))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i|)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT % 64)))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |bStart| (LENGTH (QCAR |a|))) (LETT |lb| NIL)
          (SEQ (LETT |ba| NIL) (LETT #6# (QCDR |b|)) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |ba| (CAR #6#)) NIL)) (GO G191)))
               (SEQ
                (LETT |toI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|)
                                (QREFELT % 35)))
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT % 35)))
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6)))
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT % 20)))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT % 75)))
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |DGRPH;objProd|
        ((|a| (%)) (|b| (%))
         (%
          (|List|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))))
        (SPROG
         ((|aoi| NIL) (#1=#:G477 NIL) (|ai| (S))
          (|axi| #2=(|NonNegativeInteger|)) (|ayi| #3=(|NonNegativeInteger|))
          (|boi| NIL) (#4=#:G478 NIL) (|bi| (S)) (|bxi| #2#) (|byi| #3#)
          (|x| #5=(|NonNegativeInteger|)) (|y| #5#) (|sp| (|Product| S S))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |newObjs| NIL)
              (SEQ (LETT |aoi| NIL) (LETT #1# (QCAR |a|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |aoi| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0))
                        (LETT |axi| (QVELT |aoi| 1))
                        (LETT |ayi| (QVELT |aoi| 2))
                        (EXIT
                         (SEQ (LETT |boi| NIL) (LETT #4# (QCAR |b|)) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0))
                                   (LETT |bxi| (QVELT |boi| 1))
                                   (LETT |byi| (QVELT |boi| 2))
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT % 79)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT % 80)))
                                          |ayi|))
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT % 82)))
                                   (LETT |ob| (VECTOR |sp| |x| |y|))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT % 85)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;indexProd|
        ((|aObj| (%)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G481 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1))
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |DGRPH;*;2%Dg;26|
        ((|a| (%)) (|b| (%)) (% (|DirectedGraph| (|Product| S S))))
        (SPROG
         ((|au| NIL) (#1=#:G502 NIL) (|av| NIL) (#2=#:G503 NIL) (|bu| NIL)
          (#3=#:G504 NIL) (|bv| NIL) (#4=#:G505 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #5#)))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #1# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #2# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #4# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT % 86))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT %
                                                                          87))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT %
                                                                          87)))
                                                      (QREFELT % 89)))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| %) |newArrs|
                         (QREFELT % 91)))))) 

(SDEFUN |DGRPH;cartesian;2%Dg;27|
        ((|a| (%)) (|b| (%)) (% (|DirectedGraph| (|Product| S S))))
        (SPROG
         ((|au| NIL) (#1=#:G530 NIL) (|av| NIL) (#2=#:G531 NIL) (|bu| NIL)
          (#3=#:G532 NIL) (|bv| NIL) (#4=#:G533 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #5#)))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #1# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #2# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #4# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            86))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              87))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 89)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            87))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 89)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT % 86))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              86))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        % 87))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT % 89)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        % 87))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT % 89)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                %)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                %)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT %
                                                                           20))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            86))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              87))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 89)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            87))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 89)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| %) |newArrs|
                         (QREFELT % 91)))))) 

(SDEFUN |DGRPH;closedObjProd|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S))
         (%
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))))
        (SPROG
         ((|aoi| NIL) (#1=#:G542 NIL) (|ai| (S))
          (|axi| #2=(|NonNegativeInteger|)) (|ayi| #3=(|NonNegativeInteger|))
          (|boi| NIL) (#4=#:G543 NIL) (|bi| (S)) (|bxi| #2#) (|byi| #3#)
          (|x| #5=(|NonNegativeInteger|)) (|y| #5#) (|sp| (S))
          (|ob| (|Record| (|:| |value| S) (|:| |posX| #2#) (|:| |posY| #3#)))
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |newObjs| NIL)
              (SEQ (LETT |aoi| NIL) (LETT #1# (QCAR |a|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |aoi| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0))
                        (LETT |axi| (QVELT |aoi| 1))
                        (LETT |ayi| (QVELT |aoi| 2))
                        (EXIT
                         (SEQ (LETT |boi| NIL) (LETT #4# (QCAR |b|)) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0))
                                   (LETT |bxi| (QVELT |boi| 1))
                                   (LETT |byi| (QVELT |boi| 2))
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT % 79)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT % 80)))
                                          |ayi|))
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|))
                                   (LETT |ob| (VECTOR |sp| |x| |y|))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT % 13)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;closedTensor;2%M%;29|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S)) (% (%)))
        (SPROG
         ((|au| NIL) (#1=#:G565 NIL) (|av| NIL) (#2=#:G566 NIL) (|bu| NIL)
          (#3=#:G567 NIL) (|bv| NIL) (#4=#:G568 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #5#)))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #1# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #2# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #4# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT % 86))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT %
                                                                          87))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT %
                                                                          87)))
                                                      (QREFELT % 89)))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| %) |newArrs|
                         (QREFELT % 19)))))) 

(SDEFUN |DGRPH;closedCartesian;2%M%;30|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S)) (% (%)))
        (SPROG
         ((|au| NIL) (#1=#:G595 NIL) (|av| NIL) (#2=#:G596 NIL) (|bu| NIL)
          (#3=#:G597 NIL) (|bv| NIL) (#4=#:G598 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #5#)))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #1# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #2# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #4# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            86))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              87))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 89)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            87))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 89)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT % 86))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              86))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        % 87))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT % 89)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        % 87))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT % 89)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                %)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                %)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT %
                                                                           20))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 86))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            86))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              87))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 89)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              87))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 89)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            87))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 89)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         20)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| %) |newArrs|
                         (QREFELT % 19)))))) 

(SDEFUN |DGRPH;~;2%;31| ((|s| (%)) (% (%)))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ars|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|i| NIL) (#1=#:G610 NIL) (|j| NIL) (#2=#:G611 NIL)
          (|newArr|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |obs| (QCAR |s|)) (LETT |ars| (QCDR |s|))
              (LETT |newArrs| NIL)
              (SEQ (LETT |i| 1) (LETT #1# (LENGTH |obs|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# (LENGTH |obs|)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |s| |i| |j| (QREFELT % 86)))
                              (SEQ
                               (LETT |newArr|
                                     (VECTOR
                                      (STRCONC (STRINGIMAGE |i|)
                                               (STRINGIMAGE |j|))
                                      0 |i| |j| 0 0 NIL))
                               (EXIT
                                (LETT |newArrs|
                                      (SPADCALL |newArrs| |newArr|
                                                (QREFELT % 20)))))))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |newArrs|))))) 

(SDEFUN |DGRPH;map;%LL2I%;32|
        ((|s| (%)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| #1=(|Integer|)) (|offsetY| #1#) (% (%)))
        (SPROG
         ((#2=#:G628 NIL) (|o| NIL) (#3=#:G629 NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|oi| NIL) (#4=#:G630 NIL) (|i| (|NonNegativeInteger|))
          (#5=#:G617 NIL) (#6=#:G618 NIL) (|oldArrow| NIL) (#7=#:G631 NIL)
          (|newArr|
           #8=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #8#)))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |o| NIL) (LETT #3# |newOb|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |o| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |o| 0 0) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (SEQ (LETT |oi| 1) (LETT #4# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #4#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT % 35)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT % 98))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 98))
                                            1)
                                           |offsetX|))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #6#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 98))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#)))
                               (QREFELT % 99))))
               (LETT |oi| (|inc_SI| |oi|)) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL)
          (SEQ (LETT |oldArrow| NIL) (LETT #7# (QCDR |s|)) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |oldArrow| (CAR #7#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT % 35))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT % 35))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT % 20)))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;mapContra;%LL2I%;33|
        ((|s| (%)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| #1=(|Integer|)) (|offsetY| #1#) (% (%)))
        (SPROG
         ((#2=#:G648 NIL) (|o| NIL) (#3=#:G649 NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|oi| NIL) (#4=#:G650 NIL) (|i| (|NonNegativeInteger|))
          (#5=#:G637 NIL) (#6=#:G638 NIL) (|oldArrow| NIL) (#7=#:G651 NIL)
          (|newArr|
           #8=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newArrs| (|List| #8#)))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |o| NIL) (LETT #3# |newOb|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |o| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |o| 0 0) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (SEQ (LETT |oi| 1) (LETT #4# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #4#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT % 35)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT % 98))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 98))
                                            1)
                                           |offsetX|))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #6#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 98))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#)))
                               (QREFELT % 99))))
               (LETT |oi| (|inc_SI| |oi|)) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL)
          (SEQ (LETT |oldArrow| NIL) (LETT #7# (QCDR |s|)) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |oldArrow| (CAR #7#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT % 35))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT % 35))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT % 20)))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;coerce;Pg%;34| ((|pg| (|PermutationGroup| S)) (% (%)))
        (SPADCALL (SPADCALL |pg| (QREFELT % 103)) (QREFELT % 46))) 

(SDEFUN |DGRPH;coerce;Fp%;35| ((|poset| (|FinitePoset| S)) (% (%)))
        (SPADCALL |poset| (QREFELT % 29))) 

(SDEFUN |DGRPH;coerce;L%;36| ((|lst| (|List| S)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G662 NIL) (|ob| NIL) (#2=#:G661 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|next| (|NonNegativeInteger|))
          (|a|
           #3=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |lst|)) (LETT |ob| NIL)
                   (LETT #2# |lst|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#)) NIL)
                         (|greater_SI| |obn| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |lst|) |obn| (QREFELT % 9))
                                  (SPADCALL (LENGTH |lst|) |obn|
                                            (QREFELT % 10))))
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 13)))
                    (LETT |next| (+ |obn| 1))
                    (EXIT
                     (COND
                      ((<= |next| (LENGTH |lst|))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC "a" (STRINGIMAGE |arn|)) 0 |obn|
                                      |next| 0 0 NIL))
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 20)))
                        (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(DECLAIM (NOTINLINE |DirectedGraph;|)) 

(DEFUN |DirectedGraph;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|DirectedGraph| DV$1))
          (LETT % (GETREFV 115))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DirectedGraph| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|)))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |arrType| (|NonNegativeInteger|))
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          %))) 

(DEFUN |DirectedGraph| (#1=#:G663)
  (SPROG NIL
         (PROG (#2=#:G664)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DirectedGraph|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DirectedGraph;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectedGraph|)))))))))) 

(MAKEPROP '|DirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |createX|) (6 . |createY|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 11) (12 . |concat|) (|List| 6) |DGRPH;directedGraph;L%;1|
              |DGRPH;directedGraph;L%;2|
              (|Record| (|:| |name| 52) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 31) (|:| |yOffset| 31)
                        (|:| |map| 30))
              (|List| 17) |DGRPH;directedGraph;LL%;3| (18 . |concat|)
              (|Record| (|:| |fromOb| 8) (|:| |toOb| 8)) (|List| 21)
              |DGRPH;directedGraph;LL%;4| (|FinitePoset| 6) (24 . |getVert|)
              (|List| (|List| 47)) (29 . |getArr|) (34 . |concat|)
              |DGRPH;directedGraph;Fp%;5| (|List| 8) (|Integer|) (|List| 30)
              (40 . |elt|) (46 . |#|) (51 . |elt|) |DGRPH;directedGraph;LL%;6|
              (|Record| (|:| |preimage| 14) (|:| |image| 14)) (|Permutation| 6)
              (57 . |listRepresentation|) (62 . |1|) (66 . |position|)
              (72 . |concat|) (78 . |elt|) (84 . |setelt!|) (|List| 38)
              |DGRPH;directedGraph;L%;7| (|Boolean|) (91 . =)
              |DGRPH;addObject!;%S%;8| |DGRPH;addObject!;%R%;9|
              |DGRPH;addArrow!;%R%;10| (|String|) |DGRPH;addArrow!;%S2Nni%;11|
              |DGRPH;addArrow!;%S2NniL%;12| |DGRPH;getVertices;%L;13|
              |DGRPH;getArrows;%L;14|
              (|Record| (|:| |value| $$) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 57) (|DirectedGraph| $$) (97 . |getVertices|)
              (102 . |concat|) (|List| 18) (108 . |concat|) (114 . |concat|)
              (120 . |getArrows|) (|DirectedGraph| %) |DGRPH;flatten;Dg%;15|
              |DGRPH;initial;%;16| |DGRPH;terminal;S%;17|
              |DGRPH;cycleOpen;LS%;18| |DGRPH;cycleClosed;LS%;19|
              |DGRPH;unit;LS%;20| (125 . ~=) |DGRPH;kgraph;LS%;21|
              (131 . |concat|) |DGRPH;+;3%;22| (137 . |position|)
              |DGRPH;merge;3%;23| (143 . |diagramWidth|)
              (148 . |diagramHeight|) (|Product| 6 6) (153 . |construct|)
              (|Record| (|:| |value| 81) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 83) (159 . |concat|) (165 . |isDirectSuccessor?|)
              (172 . |arrowName|) (|List| %) (179 . |concat|)
              (|DirectedGraph| 81) (184 . |directedGraph|) |DGRPH;*;2%Dg;26|
              |DGRPH;cartesian;2%Dg;27| (|Mapping| 6 6 6)
              |DGRPH;closedTensor;2%M%;29| |DGRPH;closedCartesian;2%M%;30|
              |DGRPH;~;2%;31| (190 . |elt|) (196 . |setelt!|)
              |DGRPH;map;%LL2I%;32| |DGRPH;mapContra;%LL2I%;33|
              (|PermutationGroup| 6) (203 . |coerce|) |DGRPH;coerce;Pg%;34|
              |DGRPH;coerce;Fp%;35| |DGRPH;coerce;L%;36| (|OutputForm|)
              (|Tree| 31) (|List| 108) (|List| (|Loop|)) (|Matrix| 8)
              (|Matrix| 31) (|Void|) (|Scene| (|SCartesian| (NRTEVAL 2))))
           '#(~= 208 ~ 214 |unit| 219 |terminal| 225 |subdiagramSvg| 230
              |spanningTreeNode| 238 |spanningTreeArrow| 244
              |spanningForestNode| 250 |spanningForestArrow| 255 |routeNodes|
              260 |routeArrows| 267 |outDegree| 274 |nodeToNode| 280
              |nodeToArrow| 286 |nodeFromNode| 292 |nodeFromArrow| 298 |min|
              304 |merge| 315 |max| 321 |mapContra| 332 |map| 341 |looseEquals|
              350 |loopsNodes| 356 |loopsAtNode| 361 |loopsArrows| 367 |latex|
              372 |laplacianMatrix| 377 |kgraph| 382 |isGreaterThan?| 388
              |isFunctional?| 395 |isFixPoint?| 400 |isDirected?| 406
              |isDirectSuccessor?| 410 |isAcyclic?| 417 |initial| 422
              |incidenceMatrix| 426 |inDegree| 431 |getVertices| 437
              |getVertexIndex| 442 |getArrows| 448 |getArrowIndex| 453
              |flatten| 460 |distanceMatrix| 465 |distance| 470 |directedGraph|
              477 |diagramsSvg| 515 |diagramWidth| 522 |diagramSvg| 527
              |diagramHeight| 534 |deepDiagramSvg| 539 |cycleOpen| 546
              |cycleClosed| 552 |createY| 558 |createX| 564 |createWidth| 570
              |coerce| 575 |closedTensor| 595 |closedCartesian| 602 |cartesian|
              609 |arrowsToNode| 615 |arrowsToArrow| 621 |arrowsFromNode| 627
              |arrowsFromArrow| 633 |arrowName| 639 |adjacencyMatrix| 646
              |addObject!| 651 |addArrow!| 663 = 694 + 700 * 706)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 107) (|BasicType|))
                        (|makeByteWordVec2| 114
                                            '(2 0 8 8 8 9 2 0 8 8 8 10 2 12 0 0
                                              11 13 2 18 0 0 17 20 1 24 14 0 25
                                              1 24 26 0 27 2 22 0 0 21 28 2 32
                                              30 0 31 33 1 30 8 0 34 2 30 8 0
                                              31 35 1 38 37 0 39 0 38 0 40 2 14
                                              31 6 0 41 2 14 0 0 6 42 2 14 6 0
                                              31 43 3 30 8 0 31 8 44 2 12 47 0
                                              0 48 1 59 58 0 60 2 12 0 0 0 61 2
                                              62 0 0 18 63 2 30 0 0 8 64 1 59
                                              18 0 65 2 8 47 0 0 73 2 18 0 0 0
                                              75 2 12 31 11 0 77 1 0 8 0 79 1 0
                                              8 0 80 2 81 0 6 6 82 2 84 0 0 83
                                              85 3 0 47 0 8 8 86 3 0 52 0 8 8
                                              87 1 52 0 88 89 2 90 0 84 18 91 2
                                              12 11 0 31 98 3 12 11 0 31 11 99
                                              1 102 45 0 103 2 0 47 0 0 1 1 0 0
                                              0 97 2 0 0 14 52 72 1 0 0 6 69 4
                                              0 113 114 0 47 47 1 2 0 108 0 8 1
                                              2 0 108 0 8 1 1 0 109 0 1 1 0 109
                                              0 1 3 0 30 0 8 8 1 3 0 30 0 8 8 1
                                              2 0 8 0 8 1 2 0 30 0 8 1 2 0 30 0
                                              8 1 2 0 30 0 8 1 2 0 30 0 8 1 1 0
                                              8 0 1 2 0 8 0 30 1 2 0 0 0 0 78 2
                                              0 8 0 30 1 1 0 8 0 1 5 0 0 0 30
                                              14 31 31 101 5 0 0 0 30 14 31 31
                                              100 2 0 47 0 0 1 1 0 110 0 1 2 0
                                              110 0 8 1 1 0 110 0 1 1 0 52 0 1
                                              1 0 112 0 1 2 0 0 14 52 74 3 0 47
                                              0 8 8 1 1 0 47 0 1 2 0 47 0 8 1 0
                                              0 47 1 3 0 47 0 8 8 86 1 0 47 0 1
                                              0 0 0 68 1 0 112 0 1 2 0 8 0 8 1
                                              1 0 12 0 55 2 0 8 0 6 1 1 0 18 0
                                              56 3 0 8 0 8 8 1 1 0 0 66 67 1 0
                                              112 0 1 3 0 31 0 8 8 1 1 0 0 12
                                              16 1 0 0 14 15 2 0 0 12 18 19 2 0
                                              0 14 32 36 2 0 0 14 22 23 1 0 0
                                              24 29 1 0 0 45 46 3 0 113 52 88
                                              47 1 1 0 8 0 79 3 0 113 52 0 47 1
                                              1 0 8 0 80 3 0 113 52 0 47 1 2 0
                                              0 14 52 70 2 0 0 14 52 71 2 0 8 8
                                              8 10 2 0 8 8 8 9 1 0 8 8 1 1 0
                                              107 0 1 1 0 0 102 104 1 0 0 14
                                              106 1 0 0 24 105 3 0 0 0 0 94 95
                                              3 0 0 0 0 94 96 2 0 90 0 0 93 2 0
                                              30 0 8 1 2 0 30 0 8 1 2 0 30 0 8
                                              1 2 0 30 0 8 1 3 0 52 0 8 8 87 1
                                              0 111 0 1 2 0 0 0 6 49 2 0 0 0 11
                                              50 4 0 0 0 52 8 8 53 2 0 0 0 17
                                              51 5 0 0 0 52 8 8 30 54 4 0 0 0
                                              52 6 6 1 2 0 47 0 0 1 2 0 0 0 0
                                              76 2 0 90 0 0 92)))))
           '|lookupComplete|)) 
