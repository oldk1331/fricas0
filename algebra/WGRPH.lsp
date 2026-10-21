
(SDEFUN |WGRPH;weightedGraph;L%;1| ((|ob| (|List| S)) (% (%)))
        (SPROG
         ((#1=#:G44 NIL) (|x| NIL) (#2=#:G45 NIL)
          (|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |ob|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (VECTOR |x| 0 0 (|spadConstant| % 9))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (CONS |objs| NIL))))) 

(MAKEPROP '|WGRPH;weightedGraph;L%;2| '|SPADreplace|
          '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |WGRPH;weightedGraph;L%;2|
        ((|ob|
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
         (% (%)))
        (CONS |ob| NIL)) 

(MAKEPROP '|WGRPH;weightedGraph;LL%;3| '|SPADreplace| 'CONS) 

(SDEFUN |WGRPH;weightedGraph;LL%;3|
        ((|ob|
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
         (|ar|
          (|List|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (% (%)))
        (CONS |ob| |ar|)) 

(SDEFUN |WGRPH;weightedGraph;LL%;4|
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
        (SPROG
         ((|a| NIL) (#1=#:G73 NIL)
          (|arro|
           #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrs| (|List| #2#)) (|fn| NIL) (#3=#:G75 NIL) (|f| NIL)
          (#4=#:G74 NIL)
          (|fo|
           #5=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|fobs| (|List| #5#)))
         (SEQ (LETT |arrs| NIL)
              (SEQ (LETT |a| NIL) (LETT #1# |ar|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |arro|
                          (VECTOR (QVELT |a| 0) (|spadConstant| % 9)
                                  (QVELT |a| 2) (QVELT |a| 3) (QVELT |a| 4)
                                  (QVELT |a| 5) (QVELT |a| 6)))
                    (EXIT
                     (LETT |arrs| (SPADCALL |arrs| |arro| (QREFELT % 18)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |fobs| NIL)
              (SEQ (LETT |fn| 1) (LETT #3# (LENGTH |ob|)) (LETT |f| NIL)
                   (LETT #4# |ob|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL)
                         (|greater_SI| |fn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |fo|
                          (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                                  (|spadConstant| % 9)))
                    (EXIT (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT % 19)))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |fn| (|inc_SI| |fn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |fobs| |arrs|))))) 

(SDEFUN |WGRPH;weightedGraph;LL%;5|
        ((|obs| (|List| S))
         (|ars|
          (|List|
           (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|)))))
         (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G91 NIL) (|ob| NIL) (#2=#:G90 NIL)
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|arn| NIL) (#3=#:G93 NIL) (|ar| NIL) (#4=#:G92 NIL)
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
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT % 26))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT % 27))))
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT % 28)))))
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
                                     (QREFELT % 29)))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |arn| (|inc_SI| |arn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |nodes| |edges| (QREFELT % 24)))))) 

(SDEFUN |WGRPH;weightedGraph;Fp%;6| ((|poset| (|FinitePoset| S)) (% (%)))
        (SPROG
         ((|obs| (|List| S)) (|mat| (|List| (|List| (|Boolean|)))) (|xn| NIL)
          (#1=#:G103 NIL) (|x| NIL) (#2=#:G102 NIL) (|yn| NIL) (#3=#:G105 NIL)
          (|y| NIL) (#4=#:G104 NIL)
          (|z|
           #5=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))))
          (|ars| (|List| #5#)))
         (SEQ (LETT |obs| (SPADCALL |poset| (QREFELT % 34))) (LETT |ars| NIL)
              (LETT |mat| (SPADCALL |poset| (QREFELT % 36)))
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
                                                    (QREFELT % 37)))))))))
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT |yn| (|inc_SI| |yn|))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |xn| (|inc_SI| |xn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |obs| |ars| (QREFELT % 32)))))) 

(SDEFUN |WGRPH;weightedGraph;LL%;7|
        ((|objs| (|List| S)) (|am| (|List| (|List| (|NonNegativeInteger|))))
         (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G120 NIL) (|ob| (S))
          (|o|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs| (|List| #2#)) (|i| NIL) (#3=#:G121 NIL) (|j| NIL)
          (#4=#:G122 NIL)
          (|a|
           #5=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ar| (|List| #5#)))
         (SEQ (LETT |obs| NIL)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #1#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT % 40)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 26))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 27))
                                      (|spadConstant| % 9)))
                        (EXIT
                         (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 19)))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (LETT |ar| NIL)
              (SEQ (LETT |i| 1) (LETT #3# (LENGTH |am|)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #4#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT % 43))
                                          (QREFELT % 44)))
                          G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT % 43)) |j|
                                         (QREFELT % 45))
                               1)
                              (SEQ
                               (LETT |a|
                                     (VECTOR "a" (|spadConstant| % 9) |i| |j| 0
                                             0 NIL))
                               (EXIT
                                (LETT |ar|
                                      (SPADCALL |ar| |a| (QREFELT % 18)))))))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |WGRPH;addObject!;%S%;8| ((|s| (%)) (|n| (S)) (% (%)))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
         (SEQ (LETT |obs| (QCAR |s|))
              (LETT |obj| (VECTOR |n| 0 0 (|spadConstant| % 9)))
              (COND
               ((SPADCALL |obs| NIL (QREFELT % 48))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT % 19)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |WGRPH;addObject!;%R%;9|
        ((|s| (%))
         (|n|
          (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                    (|:| |posY| #1#)))
         (% (%)))
        (SEQ
         (|error|
          "this form of addObject! not supported in multifunctionGraph")
         (EXIT (CONS NIL NIL)))) 

(SDEFUN |WGRPH;addArrow!;%R%;10|
        ((|s| (%))
         (|ar|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| #1=(|NonNegativeInteger|))
                    (|:| |fromOb| #1#) (|:| |toOb| #1#)
                    (|:| |xOffset| #2=(|Integer|)) (|:| |yOffset| #2#)
                    (|:| |map| (|List| #1#))))
         (% (%)))
        (SPADCALL |s| (QVELT |ar| 0) (QVELT |ar| 2) (QVELT |ar| 3)
                  (|spadConstant| % 9) (QREFELT % 52))) 

(SDEFUN |WGRPH;addArrow!;%S2Nni%;11|
        ((|s| (%)) (|nm| (|String|)) (|n1| #1=(|NonNegativeInteger|))
         (|n2| #1#) (% (%)))
        (SPADCALL |s| |nm| |n1| |n2| (|spadConstant| % 9) (QREFELT % 52))) 

(SDEFUN |WGRPH;addWArrow!;%S2NniW%;12|
        ((|s| (%)) (|nm| (|String|)) (|n1| (|NonNegativeInteger|))
         (|n2| (|NonNegativeInteger|)) (|w| (W)) (% (%)))
        (SPROG
         ((|arrss|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G141 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|))
                (LETT |a| (VECTOR |nm| |w| |n1| |n2| 0 0 NIL))
                (EXIT
                 (COND
                  ((NULL |arrss|)
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #1# |s|) (GO #2=#:G140)))))
                  ('T
                   (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT % 18)))
                        (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                        (EXIT (PROGN (LETT #1# |s|) (GO #2#)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |WGRPH;getVertices;%L;13|
        ((|s| (%))
         (%
          (|List|
           #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))))))
        (SPROG
         ((|soj| NIL) (#2=#:G149 NIL) (|o| #1#)
          (|res|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |soj| NIL) (LETT #2# (QCAR |s|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |soj| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR (QVELT |soj| 0) (QVELT |soj| 1)
                                  (QVELT |soj| 2)))
                    (EXIT (LETT |res| (SPADCALL |res| |o| (QREFELT % 28)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;getArrows;%L;14|
        ((|s| (%))
         (%
          (|List|
           #1=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|a| NIL) (#2=#:G157 NIL) (|aw| #1#)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |arrs| NIL)
              (SEQ (LETT |a| NIL) (LETT #2# (QCDR |s|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |aw|
                          (VECTOR (QVELT |a| 0) 0 (QVELT |a| 2) (QVELT |a| 3)
                                  (QVELT |a| 4) (QVELT |a| 5) (QVELT |a| 6)))
                    (EXIT (LETT |arrs| (SPADCALL |arrs| |aw| (QREFELT % 29)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |arrs|)))) 

(MAKEPROP '|WGRPH;initial;%;15| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |WGRPH;initial;%;15| ((% (%))) (CONS NIL NIL)) 

(SDEFUN |WGRPH;terminal;S%;16| ((|a| (S)) (% (%)))
        (SPROG
         ((|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|ar|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |o| (VECTOR |a| 0 0 (|spadConstant| % 9)))
              (LETT |ar| (VECTOR "loop" (|spadConstant| % 9) 1 1 0 0 NIL))
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |WGRPH;cycleOpen;LS%;17|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G174 NIL) (|ob| (S))
          (|o|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs| (|List| #2#)) (|next| (|NonNegativeInteger|))
          (|a|
           #3=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #1#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT % 40)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 26))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 27))
                                      (|spadConstant| % 9)))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 19)))
                        (LETT |next| (+ |obn| 1))
                        (EXIT
                         (COND
                          ((<= |next| (LENGTH |objs|))
                           (SEQ
                            (LETT |a|
                                  (VECTOR
                                   (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                   (|spadConstant| % 9) |obn| |next| 0 0 NIL))
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 18)))
                            (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;cycleClosed;LS%;18|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G185 NIL) (|ob| (S))
          (|o|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs| (|List| #2#)) (|next| (|NonNegativeInteger|))
          (|a|
           #3=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #1#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT % 40)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 26))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 27))
                                      (|spadConstant| % 9)))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 19)))
                        (LETT |next| (+ |obn| 1))
                        (COND
                         ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| 1)))
                        (EXIT
                         (COND
                          ((<= |next| (LENGTH |objs|))
                           (SEQ
                            (LETT |a|
                                  (VECTOR
                                   (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                   (|spadConstant| % 9) |obn| |next| 0 0 NIL))
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 18)))
                            (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;unit;LS%;19|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G194 NIL) (|ob| (S))
          (|o|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs| (|List| #2#))
          (|a|
           #3=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #3#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #1#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT % 40)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 26))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 27))
                                      (|spadConstant| % 9)))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 19)))
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| % 9) |obn| |obn| 0 0
                                      NIL))
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT % 18)))
                        (EXIT (LETT |arn| (+ |arn| 1))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;kgraph;LS%;20|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (%)))
        (SPROG
         ((|obn| NIL) (#1=#:G207 NIL) (|ob| (S))
          (|o|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs| (|List| #2#)) (|obm| NIL) (#3=#:G208 NIL)
          (|a|
           #4=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|ars| (|List| #4#)) (|arn| (|Integer|)))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #1# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #1#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT % 40)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 26))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT % 27))
                                      (|spadConstant| % 9)))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT % 19)))
                        (EXIT
                         (SEQ (LETT |obm| 1) (LETT #3# (LENGTH |objs|)) G190
                              (COND ((|greater_SI| |obm| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |obn| |obm| (QREFELT % 62))
                                  (SEQ
                                   (LETT |a|
                                         (VECTOR
                                          (STRCONC |arrowName|
                                                   (STRINGIMAGE |arn|))
                                          (|spadConstant| % 9) |obn| |obm| 0 0
                                          NIL))
                                   (LETT |ars|
                                         (SPADCALL |ars| |a| (QREFELT % 18)))
                                   (EXIT (LETT |arn| (+ |arn| 1))))))))
                              (LETT |obm| (|inc_SI| |obm|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;+;3%;21| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|bStart| (|NonNegativeInteger|)) (|ba| NIL) (#1=#:G217 NIL)
          (|arr|
           #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|lb| (|List| #2#))
          (|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT % 64)))
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
                                  (QVELT |ba| 5) (QVELT |ba| 6)))
                    (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT % 18)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT % 65)))
              (EXIT (CONS |lo| |la|))))) 

(SDEFUN |WGRPH;merge;3%;22| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((#1=#:G238 NIL) (|x| NIL) (#2=#:G239 NIL) (|bob| NIL) (#3=#:G240 NIL)
          (|i| (|Integer|))
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|newIndex| #4=(|NonNegativeInteger|)) (#5=#:G228 NIL)
          (|bmap| (|List| (|NonNegativeInteger|))) (|bStart| #4#) (|ba| NIL)
          (#6=#:G241 NIL) (|toI| #7=(|NonNegativeInteger|)) (|fromI| #7#)
          (|arr|
           #8=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|lb| (|List| #8#))
          (|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT % 67)))
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT % 19)))
                        (LETT |newIndex| (+ |newIndex| 1))
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT % 68))))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i|)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT % 68)))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |bStart| (LENGTH (QCAR |a|))) (LETT |lb| NIL)
          (SEQ (LETT |ba| NIL) (LETT #6# (QCDR |b|)) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |ba| (CAR #6#)) NIL)) (GO G191)))
               (SEQ
                (LETT |toI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|)
                                (QREFELT % 45)))
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT % 45)))
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6)))
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT % 18)))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT % 65)))
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |WGRPH;objProd|
        ((|a| (%)) (|b| (%))
         (%
          (|List|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
        (SPROG
         ((|aoi| NIL) (#1=#:G254 NIL) (|ai| (S))
          (|axi| #2=(|NonNegativeInteger|)) (|ayi| #3=(|NonNegativeInteger|))
          (|boi| NIL) (#4=#:G255 NIL) (|bi| (S)) (|bxi| #2#) (|byi| #3#)
          (|x| #5=(|NonNegativeInteger|)) (|y| #5#) (|sp| (|Product| S S))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
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
                                             (SPADCALL |a| (QREFELT % 70)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT % 71)))
                                          |ayi|))
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT % 73)))
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| % 9)))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT % 76)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;indexProd|
        ((|aObj| (%)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G259 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1))
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |WGRPH;*;2%Wg;25|
        ((|a| (%)) (|b| (%)) (% (|WeightedGraph| (|Product| S S) W)))
        (SPROG
         ((|au| NIL) (#1=#:G281 NIL) (|av| NIL) (#2=#:G282 NIL) (|bu| NIL)
          (#3=#:G283 NIL) (|bv| NIL) (#4=#:G284 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                                                      (QREFELT % 77))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT %
                                                                          78))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT %
                                                                          78)))
                                                      (QREFELT % 80)))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| %) |newArrs|
                         (QREFELT % 82)))))) 

(SDEFUN |WGRPH;cartesian;2%Wg;26|
        ((|a| (%)) (|b| (%)) (% (|WeightedGraph| (|Product| S S) W)))
        (SPROG
         ((|au| NIL) (#1=#:G310 NIL) (|av| NIL) (#2=#:G311 NIL) (|bu| NIL)
          (#3=#:G312 NIL) (|bv| NIL) (#4=#:G313 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            77))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              78))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 80)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            78))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 80)))))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT % 77))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              77))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        % 78))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT % 80)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        % 78))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT % 80)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                % 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                %)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                %)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT %
                                                                           18))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            77))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              78))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 80)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            78))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 80)))))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| %) |newArrs|
                         (QREFELT % 82)))))) 

(SDEFUN |WGRPH;closedObjProd|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S))
         (%
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
        (SPROG
         ((|aoi| NIL) (#1=#:G323 NIL) (|ai| (S))
          (|axi| #2=(|NonNegativeInteger|)) (|ayi| #3=(|NonNegativeInteger|))
          (|boi| NIL) (#4=#:G324 NIL) (|bi| (S)) (|bxi| #2#) (|byi| #3#)
          (|x| #5=(|NonNegativeInteger|)) (|y| #5#) (|sp| (S))
          (|ob|
           (|Record| (|:| |value| S) (|:| |posX| #2#) (|:| |posY| #3#)
                     (|:| |weight| W)))
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
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
                                             (SPADCALL |a| (QREFELT % 70)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT % 71)))
                                          |ayi|))
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|))
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| % 9)))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT % 19)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;closedTensor;2%M%;28|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S)) (% (%)))
        (SPROG
         ((|au| NIL) (#1=#:G346 NIL) (|av| NIL) (#2=#:G347 NIL) (|bu| NIL)
          (#3=#:G348 NIL) (|bv| NIL) (#4=#:G349 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                                                      (QREFELT % 77))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT %
                                                                          78))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT %
                                                                          78)))
                                                      (QREFELT % 80)))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| %) |newArrs|
                         (QREFELT % 17)))))) 

(SDEFUN |WGRPH;closedCartesian;2%M%;29|
        ((|a| (%)) (|b| (%)) (|f| (|Mapping| S S S)) (% (%)))
        (SPROG
         ((|au| NIL) (#1=#:G376 NIL) (|av| NIL) (#2=#:G377 NIL) (|bu| NIL)
          (#3=#:G378 NIL) (|bv| NIL) (#4=#:G379 NIL) (|an| (|String|))
          (|arr|
           #5=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            77))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              78))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 80)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            78))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 80)))))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT % 77))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              77))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        % 78))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT % 80)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        % 78))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT % 80)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                % 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                %)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                %)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT %
                                                                           18))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT % 77))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT %
                                                                            77))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT %
                                                                              78))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT % 80)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT %
                                                                              78))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT % 80)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT %
                                                                            78))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT % 80)))))
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| %
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| %)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| %)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT %
                                                                         18)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| %) |newArrs|
                         (QREFELT % 17)))))) 

(SDEFUN |WGRPH;map;%LL2I%;30|
        ((|s| (%)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| #1=(|Integer|)) (|offsetY| #1#) (% (%)))
        (SPROG
         ((#2=#:G396 NIL) (|o| NIL) (#3=#:G397 NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|oi| NIL) (#4=#:G398 NIL) (|i| (|NonNegativeInteger|))
          (#5=#:G385 NIL) (#6=#:G386 NIL) (|oldArrow| NIL) (#7=#:G399 NIL)
          (|newArr|
           #8=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| % 9))
                                    #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (SEQ (LETT |oi| 1) (LETT #4# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #4#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT % 45)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT % 88))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 88))
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
                                                      (QREFELT % 88))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#))
                                (|spadConstant| % 9))
                               (QREFELT % 89))))
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
                                        (QREFELT % 45))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT % 45))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT % 18)))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;mapContra;%LL2I%;31|
        ((|s| (%)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| #1=(|Integer|)) (|offsetY| #1#) (% (%)))
        (SPROG
         ((#2=#:G416 NIL) (|o| NIL) (#3=#:G417 NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|oi| NIL) (#4=#:G418 NIL) (|i| (|NonNegativeInteger|))
          (#5=#:G405 NIL) (#6=#:G406 NIL) (|oldArrow| NIL) (#7=#:G419 NIL)
          (|newArr|
           #8=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
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
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| % 9))
                                    #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (SEQ (LETT |oi| 1) (LETT #4# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #4#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT % 45)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT % 88))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT % 88))
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
                                                      (QREFELT % 88))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#))
                                (|spadConstant| % 9))
                               (QREFELT % 89))))
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
                                        (QREFELT % 45))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT % 45))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT % 18)))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;routeNodeRecursive|
        ((|s| (%)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (|visited| (|List| (|NonNegativeInteger|)))
         (% #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((|arr| NIL) (#2=#:G434 NIL) (|d| #1#)
          (|shortest| (|List| (|NonNegativeInteger|))) (#3=#:G433 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((> (SPADCALL |visited| (QREFELT % 44))
                 (LENGTH (SPADCALL |s| (QREFELT % 55))))
              (PROGN (LETT #3# NIL) (GO #4=#:G432))))
            (LETT |shortest| NIL)
            (COND ((EQL |a| |b|) (PROGN (LETT #3# (LIST |a|)) (GO #4#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT % 77))
              (PROGN (LETT #3# (LIST |a| |b|)) (GO #4#))))
            (SEQ (LETT |arr| NIL) (LETT #2# (SPADCALL |s| (QREFELT % 56))) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT % 77))
                     (SEQ
                      (LETT |d|
                            (|WGRPH;routeNodeRecursive| |s| (QVELT |arr| 2) |b|
                             (SPADCALL |visited| |a| (QREFELT % 68)) %))
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT % 92))
                         (LETT |shortest| |d|))
                        ((SPADCALL |d| NIL (QREFELT % 93))
                         (COND
                          ((SPADCALL
                            (SPADCALL |s| (CONS |a| |d|) (QREFELT % 94))
                            (SPADCALL |s| (CONS |a| |shortest|) (QREFELT % 94))
                            (QREFELT % 95))
                           (LETT |shortest| |d|)))))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT % 92))
              (PROGN (LETT #3# NIL) (GO #4#))))
            (EXIT (CONS |a| |shortest|))))
          #4# (EXIT #3#)))) 

(SDEFUN |WGRPH;routeNodes;%2NniL;33|
        ((|s| (%)) (|a| #1=(|NonNegativeInteger|)) (|b| #1#)
         (% (|List| (|NonNegativeInteger|))))
        (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL %)) 

(SDEFUN |WGRPH;routeArrowRecursive|
        ((|s| (%)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (|visited| (|List| (|NonNegativeInteger|)))
         (% #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((|arrn| (|NonNegativeInteger|))
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| NIL) (#2=#:G453 NIL) (|aa| #3=(|NonNegativeInteger|))
          (|d| #1#) (|fullPath| (|List| (|NonNegativeInteger|)))
          (|shortest| (|List| #3#)) (|shortestFullPath| (|List| #3#))
          (#4=#:G452 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((> (SPADCALL |visited| (QREFELT % 44))
                 (LENGTH (SPADCALL |s| (QREFELT % 55))))
              (PROGN (LETT #4# (LIST 0)) (GO #5=#:G451))))
            (LETT |shortest| (LIST 0))
            (COND ((EQL |a| |b|) (PROGN (LETT #4# NIL) (GO #5#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT % 97)))
            (COND
             ((SPADCALL |arrn| 0 (QREFELT % 62))
              (PROGN (LETT #4# (LIST |arrn|)) (GO #5#))))
            (LETT |aa| 0) (LETT |shortestFullPath| (LIST 0))
            (LETT |arrs| (SPADCALL |s| (QREFELT % 56)))
            (SEQ (LETT |arr| NIL) (LETT #2# |arrs|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT % 77))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT % 97)))
                      (LETT |d|
                            (|WGRPH;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT % 68)) %))
                      (LETT |fullPath| (CONS |aa| |d|))
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT % 92))
                         (SEQ (LETT |shortest| |d|)
                              (EXIT (LETT |shortestFullPath| |fullPath|))))
                        ((SPADCALL |d| (LIST 0) (QREFELT % 93))
                         (COND
                          ((SPADCALL (SPADCALL |s| |fullPath| (QREFELT % 98))
                                     (SPADCALL |s| |shortestFullPath|
                                               (QREFELT % 98))
                                     (QREFELT % 95))
                           (SEQ (LETT |shortest| |d|)
                                (EXIT
                                 (LETT |shortestFullPath|
                                       |fullPath|)))))))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT % 92))
              (PROGN (LETT #4# (LIST 0)) (GO #5#))))
            (EXIT |shortestFullPath|)))
          #5# (EXIT #4#)))) 

(SDEFUN |WGRPH;routeArrows;%2NniL;35|
        ((|s| (%)) (|a| #1=(|NonNegativeInteger|)) (|b| #1#)
         (% (|List| (|NonNegativeInteger|))))
        (|WGRPH;routeArrowRecursive| |s| |a| |b| NIL %)) 

(SDEFUN |WGRPH;distanceWeighted;%2NniU;36|
        ((|s| (%)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Union| W "disjoint")))
        (SPROG ((|r| (|List| (|NonNegativeInteger|))) (#1=#:G465 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |r| (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL %))
                      (COND
                       ((EQL (SPADCALL |r| (QREFELT % 44)) 0)
                        (PROGN (LETT #1# (CONS 1 "disjoint")) (GO #2=#:G464))))
                      (EXIT (CONS 0 (SPADCALL |s| |r| (QREFELT % 94))))))
                #2# (EXIT #1#)))) 

(SDEFUN |WGRPH;getWeightBetween|
        ((|s| (%)) (|i1| (|NonNegativeInteger|)) (|i2| (|NonNegativeInteger|))
         (% (W)))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| NIL) (#1=#:G478 NIL) (|isDisjoint| (|Boolean|)) (|res| (W)))
         (SEQ (LETT |isDisjoint| 'T) (LETT |res| (|spadConstant| % 9))
              (LETT |arrs| (QCDR |s|))
              (SEQ (LETT |arr| NIL) (LETT #1# |arrs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      (|isDisjoint|
                       (COND
                        ((EQL (QVELT |arr| 2) |i1|)
                         (COND
                          ((EQL (QVELT |arr| 3) |i2|)
                           (SEQ (LETT |res| (QVELT |arr| 1))
                                (EXIT (LETT |isDisjoint| NIL))))))))
                      ((EQL (QVELT |arr| 2) |i1|)
                       (COND
                        ((EQL (QVELT |arr| 3) |i2|)
                         (COND
                          ((SPADCALL (QVELT |arr| 1) |res| (QREFELT % 95))
                           (LETT |res| (QVELT |arr| 1))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;routeNodeWeight;%LW;38|
        ((|s| (%)) (|r| (|List| (|NonNegativeInteger|))) (% (W)))
        (SPROG
         ((|i| NIL) (#1=#:G485 NIL) (|w| (W)) (|res| (W)) (|fst| (|Boolean|))
          (|lasti| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| % 9)) (LETT |fst| 'T)
              (LETT |lasti| 0)
              (SEQ (LETT |i| NIL) (LETT #1# |r|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL |fst|)
                      (SEQ
                       (LETT |w| (|WGRPH;getWeightBetween| |s| |lasti| |i| %))
                       (EXIT
                        (LETT |res| (SPADCALL |res| |w| (QREFELT % 102)))))))
                    (LETT |fst| NIL) (EXIT (LETT |lasti| |i|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;routeArrowWeight;%LW;39|
        ((|s| (%)) (|r| (|List| (|NonNegativeInteger|))) (% (W)))
        (SPROG
         ((|i| NIL) (#1=#:G492 NIL)
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|res| (W)))
         (SEQ (LETT |res| (|spadConstant| % 9))
              (SEQ (LETT |i| NIL) (LETT #1# |r|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |a| (SPADCALL (QCDR |s|) |i| (QREFELT % 103)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| (QVELT |a| 1)
                                         (QREFELT % 102)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;weightedDistanceMatrix;%Tda;40|
        ((|s| (%)) (% (|TwoDimensionalArray| (|Union| W #1="disjoint"))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|m| (|TwoDimensionalArray| (|Union| W #1#))) (|u| NIL)
          (#2=#:G507 NIL) (|v| NIL) (#3=#:G508 NIL))
         (SEQ (LETT |n| (LENGTH (SPADCALL |s| (QREFELT % 55))))
              (LETT |m| (MAKE_MATRIX1 |n| |n| (CONS 0 (|spadConstant| % 9))))
              (SEQ (LETT |u| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |u| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |v| 1) (LETT #3# |n|) G190
                          (COND ((|greater_SI| |v| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |m| |u| |v|
                                        (SPADCALL |s| |u| |v| (QREFELT % 101))
                                        1 1)))
                          (LETT |v| (|inc_SI| |v|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |u| (|inc_SI| |u|)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |WGRPH;coerce;Fp%;41| ((|poset| (|FinitePoset| S)) (% (%)))
        (SPADCALL |poset| (QREFELT % 38))) 

(DECLAIM (NOTINLINE |WeightedGraph;|)) 

(DEFUN |WeightedGraph;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|WeightedGraph| DV$1 DV$2))
          (LETT % (GETREFV 116))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|WeightedGraph| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|))
                                     (|:| |weight| |#2|))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |weight| |#2|)
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          %))) 

(DEFUN |WeightedGraph| (&REST #1=#:G510)
  (SPROG NIL
         (PROG (#2=#:G511)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WeightedGraph|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |WeightedGraph;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|WeightedGraph|)))))))))) 

(MAKEPROP '|WeightedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (0 . |0|) (|List| 6) |WGRPH;weightedGraph;L%;1|
              (|Record| (|:| |value| 6) (|:| |posX| 25) (|:| |posY| 25)
                        (|:| |weight| 7))
              (|List| 12) |WGRPH;weightedGraph;L%;2|
              (|Record| (|:| |name| 51) (|:| |weight| 7) (|:| |fromOb| 25)
                        (|:| |toOb| 25) (|:| |xOffset| 39) (|:| |yOffset| 39)
                        (|:| |map| 41))
              (|List| 15) |WGRPH;weightedGraph;LL%;3| (4 . |concat|)
              (10 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 25) (|:| |posY| 25))
              (|List| 20)
              (|Record| (|:| |name| 51) (|:| |arrType| 25) (|:| |fromOb| 25)
                        (|:| |toOb| 25) (|:| |xOffset| 39) (|:| |yOffset| 39)
                        (|:| |map| 41))
              (|List| 22) |WGRPH;weightedGraph;LL%;4| (|NonNegativeInteger|)
              (16 . |createX|) (22 . |createY|) (28 . |concat|) (34 . |concat|)
              (|Record| (|:| |fromOb| 25) (|:| |toOb| 25)) (|List| 30)
              |WGRPH;weightedGraph;LL%;5| (|FinitePoset| 6) (40 . |getVert|)
              (|List| (|List| 47)) (45 . |getArr|) (50 . |concat|)
              |WGRPH;weightedGraph;Fp%;6| (|Integer|) (56 . |elt|) (|List| 25)
              (|List| 41) (62 . |elt|) (68 . |#|) (73 . |elt|)
              |WGRPH;weightedGraph;LL%;7| (|Boolean|) (79 . =)
              |WGRPH;addObject!;%S%;8| |WGRPH;addObject!;%R%;9| (|String|)
              |WGRPH;addWArrow!;%S2NniW%;12| |WGRPH;addArrow!;%R%;10|
              |WGRPH;addArrow!;%S2Nni%;11| |WGRPH;getVertices;%L;13|
              |WGRPH;getArrows;%L;14| |WGRPH;initial;%;15|
              |WGRPH;terminal;S%;16| |WGRPH;cycleOpen;LS%;17|
              |WGRPH;cycleClosed;LS%;18| |WGRPH;unit;LS%;19| (85 . ~=)
              |WGRPH;kgraph;LS%;20| (91 . |concat|) (97 . |concat|)
              |WGRPH;+;3%;21| (103 . |position|) (109 . |concat|)
              |WGRPH;merge;3%;22| (115 . |diagramWidth|)
              (120 . |diagramHeight|) (|Product| 6 6) (125 . |construct|)
              (|Record| (|:| |value| 72) (|:| |posX| 25) (|:| |posY| 25)
                        (|:| |weight| 7))
              (|List| 74) (131 . |concat|) (137 . |isDirectSuccessor?|)
              (144 . |arrowName|) (|List| %) (151 . |concat|)
              (|WeightedGraph| 72 7) (156 . |weightedGraph|) |WGRPH;*;2%Wg;25|
              |WGRPH;cartesian;2%Wg;26| (|Mapping| 6 6 6)
              |WGRPH;closedTensor;2%M%;28| |WGRPH;closedCartesian;2%M%;29|
              (162 . |elt|) (168 . |setelt!|) |WGRPH;map;%LL2I%;30|
              |WGRPH;mapContra;%LL2I%;31| (175 . =) (181 . ~=)
              |WGRPH;routeNodeWeight;%LW;38| (187 . <)
              |WGRPH;routeNodes;%2NniL;33| (193 . |getArrowIndex|)
              |WGRPH;routeArrowWeight;%LW;39| |WGRPH;routeArrows;%2NniL;35|
              (|Union| 7 '"disjoint") |WGRPH;distanceWeighted;%2NniU;36|
              (200 . +) (206 . |elt|) (|TwoDimensionalArray| 100)
              |WGRPH;weightedDistanceMatrix;%Tda;40| |WGRPH;coerce;Fp%;41|
              (|OutputForm|) (|DirectedGraph| %) (|List| 110) (|Tree| 39)
              (|List| (|Loop|)) (|Matrix| 39) (|Matrix| 25) (|Void|)
              (|Scene| (|SCartesian| (NRTEVAL 2))))
           '#(~= 212 |weightedGraph| 218 |weightedDistanceMatrix| 257 |unit|
              262 |terminal| 268 |subdiagramSvg| 273 |spanningTreeNode| 281
              |spanningTreeArrow| 287 |spanningForestNode| 293
              |spanningForestArrow| 298 |routeNodes| 303 |routeNodeWeight| 310
              |routeArrows| 316 |routeArrowWeight| 323 |outDegree| 329
              |nodeToNode| 335 |nodeToArrow| 341 |nodeFromNode| 347
              |nodeFromArrow| 353 |min| 359 |merge| 370 |max| 376 |mapContra|
              387 |map| 396 |looseEquals| 405 |loopsNodes| 411 |loopsAtNode|
              416 |loopsArrows| 422 |latex| 427 |laplacianMatrix| 432 |kgraph|
              437 |isGreaterThan?| 443 |isFunctional?| 450 |isFixPoint?| 455
              |isDirected?| 461 |isDirectSuccessor?| 465 |isAcyclic?| 472
              |initial| 477 |incidenceMatrix| 481 |inDegree| 486 |getVertices|
              492 |getVertexIndex| 497 |getArrows| 503 |getArrowIndex| 508
              |flatten| 515 |distanceWeighted| 520 |distanceMatrix| 527
              |distance| 532 |diagramsSvg| 539 |diagramWidth| 546 |diagramSvg|
              551 |diagramHeight| 558 |deepDiagramSvg| 563 |cycleOpen| 570
              |cycleClosed| 576 |createY| 582 |createX| 588 |createWidth| 594
              |coerce| 599 |closedTensor| 609 |closedCartesian| 616 |cartesian|
              623 |arrowsToNode| 629 |arrowsToArrow| 635 |arrowsFromNode| 641
              |arrowsFromArrow| 647 |arrowName| 653 |adjacencyMatrix| 660
              |addWArrow!| 665 |addObject!| 674 |addArrow!| 686 = 717 + 723 *
              729)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 107) (|BasicType|))
                        (|makeByteWordVec2| 115
                                            '(0 7 0 9 2 16 0 0 15 18 2 13 0 0
                                              12 19 2 0 25 25 25 26 2 0 25 25
                                              25 27 2 21 0 0 20 28 2 23 0 0 22
                                              29 1 33 10 0 34 1 33 35 0 36 2 31
                                              0 0 30 37 2 10 6 0 39 40 2 42 41
                                              0 39 43 1 41 25 0 44 2 41 25 0 39
                                              45 2 13 47 0 0 48 2 25 47 0 0 62
                                              2 13 0 0 0 64 2 16 0 0 0 65 2 13
                                              39 12 0 67 2 41 0 0 25 68 1 0 25
                                              0 70 1 0 25 0 71 2 72 0 6 6 73 2
                                              75 0 0 74 76 3 0 47 0 25 25 77 3
                                              0 51 0 25 25 78 1 51 0 79 80 2 81
                                              0 75 16 82 2 13 12 0 39 88 3 13
                                              12 0 39 12 89 2 41 47 0 0 92 2 41
                                              47 0 0 93 2 7 47 0 0 95 3 0 25 0
                                              25 25 97 2 7 0 0 0 102 2 16 15 0
                                              39 103 2 0 47 0 0 1 1 0 0 10 11 1
                                              0 0 13 14 2 0 0 21 23 24 2 0 0 13
                                              16 17 2 0 0 10 31 32 2 0 0 10 42
                                              46 1 0 0 33 38 1 0 104 0 105 2 0
                                              0 10 51 61 1 0 0 6 58 4 0 114 115
                                              0 47 47 1 2 0 110 0 25 1 2 0 110
                                              0 25 1 1 0 109 0 1 1 0 109 0 1 3
                                              0 41 0 25 25 96 2 0 7 0 41 94 3 0
                                              41 0 25 25 99 2 0 7 0 41 98 2 0
                                              25 0 25 1 2 0 41 0 25 1 2 0 41 0
                                              25 1 2 0 41 0 25 1 2 0 41 0 25 1
                                              1 0 25 0 1 2 0 25 0 41 1 2 0 0 0
                                              0 69 2 0 25 0 41 1 1 0 25 0 1 5 0
                                              0 0 41 10 39 39 91 5 0 0 0 41 10
                                              39 39 90 2 0 47 0 0 1 1 0 111 0 1
                                              2 0 111 0 25 1 1 0 111 0 1 1 0 51
                                              0 1 1 0 112 0 1 2 0 0 10 51 63 3
                                              0 47 0 25 25 1 1 0 47 0 1 2 0 47
                                              0 25 1 0 0 47 1 3 0 47 0 25 25 77
                                              1 0 47 0 1 0 0 0 57 1 0 112 0 1 2
                                              0 25 0 25 1 1 0 21 0 55 2 0 25 0
                                              6 1 1 0 23 0 56 3 0 25 0 25 25 97
                                              1 0 0 108 1 3 0 100 0 25 25 101 1
                                              0 112 0 1 3 0 39 0 25 25 1 3 0
                                              114 51 79 47 1 1 0 25 0 70 3 0
                                              114 51 0 47 1 1 0 25 0 71 3 0 114
                                              51 0 47 1 2 0 0 10 51 59 2 0 0 10
                                              51 60 2 0 25 25 25 27 2 0 25 25
                                              25 26 1 0 25 25 1 1 0 107 0 1 1 0
                                              0 33 106 3 0 0 0 0 85 86 3 0 0 0
                                              0 85 87 2 0 81 0 0 84 2 0 41 0 25
                                              1 2 0 41 0 25 1 2 0 41 0 25 1 2 0
                                              41 0 25 1 3 0 51 0 25 25 78 1 0
                                              113 0 1 5 0 0 0 51 25 25 7 52 2 0
                                              0 0 6 49 2 0 0 0 20 50 4 0 0 0 51
                                              25 25 54 2 0 0 0 22 53 5 0 0 0 51
                                              25 25 41 1 4 0 0 0 51 6 6 1 2 0
                                              47 0 0 1 2 0 0 0 0 66 2 0 81 0 0
                                              83)))))
           '|lookupComplete|)) 
