
(SDEFUN |SUBSPACE;leaf?;%B;1| ((|space| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |space| (QREFELT % 11)) (QREFELT % 14))) 

(SDEFUN |SUBSPACE;root?;%B;2| ((|space| (%)) (% (|Boolean|)))
        (EQL (QVELT |space| 5) 0)) 

(SDEFUN |SUBSPACE;internal?;%B;3| ((|space| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL |space| (QREFELT % 16))
          (NULL (SPADCALL |space| (QREFELT % 15))))
         ('T 'T))) 

(SDEFUN |SUBSPACE;new;%;4| ((% (%)))
        (VECTOR (SPADCALL NIL (QREFELT % 20)) 0
                (SPADCALL NIL NIL (QREFELT % 22)) NIL NIL 0 NIL NIL 0 0 NIL)) 

(SDEFUN |SUBSPACE;subspace;%;5| ((% (%))) (SPADCALL (QREFELT % 23))) 

(SDEFUN |SUBSPACE;birth;2%;6| ((|momma| (%)) (% (%)))
        (SPROG ((|baby| (%)) (|lastKid| (|List| %)))
               (SEQ (LETT |baby| (SPADCALL (QREFELT % 23)))
                    (QSETVELT |baby| 5 (+ (QVELT |momma| 5) 1))
                    (QSETVELT |baby| 10 (LIST |momma|))
                    (COND
                     ((NULL
                       (SPADCALL (LETT |lastKid| (QVELT |momma| 4))
                                 (QREFELT % 14)))
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |lastKid| (QREFELT % 25))
                                   (QREFELT % 14)))
                        (EXIT (|error| (QREFELT % 9)))))))
                    (COND
                     ((SPADCALL |lastKid| (QREFELT % 14))
                      (SEQ (QSETVELT |momma| 3 (LIST |baby|))
                           (QSETVELT |momma| 4 (QVELT |momma| 3))
                           (EXIT (QSETVELT |momma| 9 1))))
                     ('T
                      (SEQ (SPADCALL |lastKid| (LIST |baby|) (QREFELT % 26))
                           (QSETVELT |momma| 4
                                     (SPADCALL |lastKid| (QREFELT % 25)))
                           (EXIT
                            (QSETVELT |momma| 9 (+ (QVELT |momma| 9) 1))))))
                    (EXIT |baby|)))) 

(SDEFUN |SUBSPACE;child;%Nni%;7|
        ((|space| (%)) (|num| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL (QVELT |space| 3) |num| (QREFELT % 29))) 

(MAKEPROP '|SUBSPACE;children;%L;8| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 3))) 

(SDEFUN |SUBSPACE;children;%L;8| ((|space| (%)) (% (|List| %)))
        (QVELT |space| 3)) 

(MAKEPROP '|SUBSPACE;numberOfChildren;%Nni;9| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 9))) 

(SDEFUN |SUBSPACE;numberOfChildren;%Nni;9|
        ((|space| (%)) (% (|NonNegativeInteger|))) (QVELT |space| 9)) 

(SDEFUN |SUBSPACE;shallowCopy;2%;10| ((|space| (%)) (% (%)))
        (SPROG ((|node| (%)))
               (SEQ (LETT |node| (SPADCALL (QREFELT % 23)))
                    (QSETVELT |node| 0 (QVELT |space| 0))
                    (QSETVELT |node| 1 (QVELT |space| 1))
                    (QSETVELT |node| 2
                              (SPADCALL (QVELT |space| 2) (QREFELT % 33)))
                    (QSETVELT |node| 5 (QVELT |space| 5))
                    (QSETVELT |node| 10 NIL)
                    (COND
                     ((SPADCALL |space| (QREFELT % 16))
                      (SEQ
                       (QSETVELT |node| 6
                                 (SPADCALL (QVELT |space| 6) (QREFELT % 35)))
                       (QSETVELT |node| 7
                                 (SPADCALL (QVELT |node| 6) (QREFELT % 36)))
                       (EXIT (QSETVELT |node| 8 (QVELT |space| 8))))))
                    (EXIT |node|)))) 

(SDEFUN |SUBSPACE;deepCopy;2%;11| ((|space| (%)) (% (%)))
        (SPROG ((|node| (%)) (|c| NIL) (#1=#:G54 NIL) (|cc| (%)))
               (SEQ (LETT |node| (SPADCALL |space| (QREFELT % 37)))
                    (EXIT
                     (COND ((SPADCALL |space| (QREFELT % 15)) |node|)
                           ('T
                            (SEQ
                             (SEQ (LETT |c| NIL)
                                  (LETT #1# (SPADCALL |space| (QREFELT % 11)))
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |cc| (SPADCALL |c| (QREFELT % 38)))
                                   (QSETVELT |cc| 10 (LIST |node|))
                                   (EXIT
                                    (QSETVELT |node| 3
                                              (SPADCALL |cc| (QVELT |node| 3)
                                                        (QREFELT % 39)))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))
                             (QSETVELT |node| 3
                                       (SPADCALL (QVELT |node| 3)
                                                 (QREFELT % 40)))
                             (QSETVELT |node| 4
                                       (SPADCALL (QVELT |node| 3)
                                                 (QREFELT % 41)))
                             (EXIT |node|)))))))) 

(SDEFUN |SUBSPACE;merge;3%;12| ((|s1| (%)) (|s2| (%)) (% (%)))
        (SPROG ((|n1| (|Rep|)) (|n2| (|Rep|)))
               (SEQ (LETT |n1| (SPADCALL |s1| (QREFELT % 38)))
                    (LETT |n2| (SPADCALL |s2| (QREFELT % 38)))
                    (QSETVELT |n1| 3
                              (SPADCALL (SPADCALL |n1| (QREFELT % 11))
                                        (SPADCALL |n2| (QREFELT % 11))
                                        (QREFELT % 42)))
                    (EXIT |n1|)))) 

(SDEFUN |SUBSPACE;merge;L%;13| ((|listOfSpaces| (|List| %)) (% (%)))
        (SPROG
         ((|space| (%)) (|s| NIL) (#1=#:G64 NIL) (#2=#:G65 NIL) (|c| NIL)
          (#3=#:G66 NIL))
         (SEQ
          (COND
           ((SPADCALL |listOfSpaces| (QREFELT % 14))
            (|error| "empty list passed as argument to merge"))
           ('T
            (SEQ
             (LETT |space|
                   (SPADCALL (SPADCALL |listOfSpaces| (QREFELT % 44))
                             (QREFELT % 38)))
             (SEQ (LETT |s| NIL)
                  (LETT #1# (SPADCALL |listOfSpaces| (QREFELT % 25))) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETVELT |space| 3
                              (SPADCALL (QVELT |space| 3)
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |c| NIL)
                                              (LETT #3# (QVELT |s| 3)) G190
                                              (COND
                                               ((OR (ATOM #3#)
                                                    (PROGN
                                                     (LETT |c| (CAR #3#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |c|
                                                                 (QREFELT %
                                                                          38))
                                                       #2#))))
                                              (LETT #3# (CDR #3#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        (QREFELT % 42)))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (EXIT |space|))))))) 

(SDEFUN |SUBSPACE;separate;%L;14| ((|space| (%)) (% (|List| %)))
        (SPROG ((|s| NIL) (#1=#:G72 NIL) (|spc| (%)) (|spaceList| (|List| %)))
               (SEQ (LETT |spaceList| NIL)
                    (SEQ (LETT |s| NIL) (LETT #1# (QVELT |space| 3)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |spc| (SPADCALL |space| (QREFELT % 37)))
                              (QSETVELT |spc| 3
                                        (LIST (SPADCALL |s| (QREFELT % 38))))
                              (EXIT
                               (LETT |spaceList|
                                     (SPADCALL |spc| |spaceList|
                                               (QREFELT % 39)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |spaceList|)))) 

(SDEFUN |SUBSPACE;add_point1|
        ((|space| (%)) (|point| (|Point| R)) (% (|NonNegativeInteger|)))
        (SPROG ((|lastPt| (|List| (|Point| R))))
               (SEQ
                (COND
                 ((NULL (NULL (LETT |lastPt| (QVELT |space| 7))))
                  (COND
                   ((NULL (NULL (CDR |lastPt|)))
                    (EXIT (|error| (QREFELT % 9)))))))
                (COND
                 ((NULL |lastPt|)
                  (SEQ (QSETVELT |space| 6 (LIST |point|))
                       (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
                 ('T
                  (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT % 47))
                       (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
                (EXIT (QSETVELT |space| 8 (+ (QVELT |space| 8) 1)))))) 

(SDEFUN |SUBSPACE;add_point2|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|point| (|Point| R)) (|which| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|i| NIL) (#1=#:G87 NIL) (|depth| (|NonNegativeInteger|))
          (|more| NIL) (#2=#:G88 NIL) (|node| (%)))
         (SEQ (LETT |node| |space|) (LETT |depth| 0)
              (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |node| (SPADCALL |node| |i| (QREFELT % 31)))
                        (EXIT (LETT |depth| (+ |depth| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |more| |depth|) (LETT #2# (- (QREFELT % 6) 1)) G190
                   (COND ((> |more| #2#) (GO G191)))
                   (SEQ (EXIT (LETT |node| (SPADCALL |node| (QREFELT % 27)))))
                   (LETT |more| (+ |more| 1)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
              (EXIT |space|)))) 

(SDEFUN |SUBSPACE;addPoint;%LP%;17|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|point| (|Point| R)) (% (%)))
        (SPROG ((|which| (|NonNegativeInteger|)))
               (SEQ (LETT |which| (|SUBSPACE;add_point1| |space| |point| %))
                    (EXIT
                     (|SUBSPACE;add_point2| |space| |path| |point| |which|
                      %))))) 

(SDEFUN |SUBSPACE;addPoint2;%P%;18|
        ((|space| (%)) (|point| (|Point| R)) (% (%)))
        (SPROG
         ((|which| (|NonNegativeInteger|)) (|first| (%)) (|more| NIL)
          (#1=#:G95 NIL) (|node| (%)))
         (SEQ (LETT |which| (|SUBSPACE;add_point1| |space| |point| %))
              (LETT |node| |space|)
              (LETT |node| (SPADCALL |node| (QREFELT % 27)))
              (LETT |first| |node|)
              (SEQ (LETT |more| 1) (LETT #1# (- (QREFELT % 6) 1)) G190
                   (COND ((|greater_SI| |more| #1#) (GO G191)))
                   (SEQ (EXIT (LETT |node| (SPADCALL |node| (QREFELT % 27)))))
                   (LETT |more| (|inc_SI| |more|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
              (EXIT |first|)))) 

(SDEFUN |SUBSPACE;addPointLast;2%PNni%;19|
        ((|space| (%)) (|node| (%)) (|point| (|Point| R))
         (|depth| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|which| (|NonNegativeInteger|)) (|more| NIL) (#1=#:G100 NIL))
               (SEQ (LETT |which| (|SUBSPACE;add_point1| |space| |point| %))
                    (COND
                     ((EQL |depth| 2)
                      (LETT |node| (SPADCALL |node| 2 (QREFELT % 31)))))
                    (SEQ (LETT |more| |depth|) (LETT #1# (- (QREFELT % 6) 1))
                         G190 (COND ((> |more| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| (QREFELT % 27)))))
                         (LETT |more| (+ |more| 1)) (GO G190) G191 (EXIT NIL))
                    (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
                    (EXIT |node|)))) 

(SDEFUN |SUBSPACE;addPoint;%LNni%;20|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|which| (|NonNegativeInteger|)) (% (%)))
        (|SUBSPACE;add_point2| |space| |path|
         (SPADCALL (QVELT |space| 6) |which| (QREFELT % 52)) |which| %)) 

(SDEFUN |SUBSPACE;addPoint;%PNni;21|
        ((|space| (%)) (|point| (|Point| R)) (% (|NonNegativeInteger|)))
        (COND
         ((SPADCALL |space| (QREFELT % 16))
          (|SUBSPACE;add_point1| |space| |point| %))
         ('T
          (|error|
           "You need to pass a top level SubSpace (level should be zero)")))) 

(SDEFUN |SUBSPACE;modifyPoint;%LP%;22|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|point| (|Point| R)) (% (%)))
        (SPROG
         ((|lastPt| (|List| (|Point| R))) (|which| (|NonNegativeInteger|))
          (|i| NIL) (#1=#:G114 NIL) (|node| (%)))
         (SEQ
          (COND
           ((NULL (NULL (LETT |lastPt| (QVELT |space| 7))))
            (COND
             ((NULL (NULL (CDR |lastPt|))) (EXIT (|error| (QREFELT % 9)))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT % 47))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8)) (LETT |node| |space|)
          (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (EXIT (LETT |node| (SPADCALL |node| |i| (QREFELT % 31)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;%LNni%;23|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|which| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G120 NIL) (|node| (%)))
               (SEQ (LETT |node| |space|)
                    (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| |i| (QREFELT % 31)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (QSETVELT |node| 0
                              (SPADCALL (QVELT |space| 6) |which|
                                        (QREFELT % 52)))
                    (QSETVELT |node| 1 |which|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;%NniP%;24|
        ((|space| (%)) (|which| (|NonNegativeInteger|)) (|point| (|Point| R))
         (% (%)))
        (SEQ
         (COND
          ((SPADCALL |space| (QREFELT % 16))
           (SEQ (SPADCALL (QVELT |space| 6) |which| |point| (QREFELT % 57))
                (EXIT |space|)))
          ('T
           (|error|
            "You need to pass a top level SubSpace (level should be zero)"))))) 

(SDEFUN |SUBSPACE;closeComponent;%LB%;25|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|val| (|Boolean|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G129 NIL) (|node| (%)))
               (SEQ (LETT |node| |space|)
                    (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| |i| (QREFELT % 31)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (QSETVELT |node| 2
                              (SPADCALL |val|
                                        (SPADCALL (QVELT |node| 2)
                                                  (QREFELT % 59))
                                        (QREFELT % 22)))
                    (EXIT |space|)))) 

(SDEFUN |SUBSPACE;defineProperty;%LSscp%;26|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|)))
         (|prop| (|SubSpaceComponentProperty|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G134 NIL) (|node| (%)))
               (SEQ (LETT |node| |space|)
                    (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| |i| (QREFELT % 31)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (QSETVELT |node| 2 |prop|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;traverse;%L%;27|
        ((|space| (%)) (|path| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G139 NIL))
               (SEQ
                (SEQ (LETT |i| NIL) (LETT #1# |path|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |space| (SPADCALL |space| |i| (QREFELT % 31)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |space|)))) 

(SDEFUN |SUBSPACE;extractPoint;%P;28| ((|space| (%)) (% (|Point| R)))
        (SPROG ((|node| (%)))
               (SEQ (LETT |node| |space|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |node| (QREFELT % 16))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| (QREFELT % 63)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (QVELT |node| 6) (QVELT |space| 1)
                               (QREFELT % 52)))))) 

(MAKEPROP '|SUBSPACE;extractIndex;%Nni;29| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 1))) 

(SDEFUN |SUBSPACE;extractIndex;%Nni;29|
        ((|space| (%)) (% (|NonNegativeInteger|))) (QVELT |space| 1)) 

(SDEFUN |SUBSPACE;extractClosed;%B;30| ((|space| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |space| 2) (QREFELT % 66))) 

(MAKEPROP '|SUBSPACE;extractProperty;%Sscp;31| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 2))) 

(SDEFUN |SUBSPACE;extractProperty;%Sscp;31|
        ((|space| (%)) (% (|SubSpaceComponentProperty|))) (QVELT |space| 2)) 

(SDEFUN |SUBSPACE;parent;2%;32| ((|space| (%)) (% (%)))
        (COND
         ((SPADCALL (QVELT |space| 10) (QREFELT % 14))
          (|error| "This is a top level SubSpace - it does not have a parent"))
         ('T (SPADCALL (QVELT |space| 10) (QREFELT % 44))))) 

(MAKEPROP '|SUBSPACE;pointData;%L;33| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 6))) 

(SDEFUN |SUBSPACE;pointData;%L;33| ((|space| (%)) (% (|List| (|Point| R))))
        (QVELT |space| 6)) 

(MAKEPROP '|SUBSPACE;level;%Nni;34| '|SPADreplace|
          '(XLAM (|space|) (QVELT |space| 5))) 

(SDEFUN |SUBSPACE;level;%Nni;34| ((|space| (%)) (% (|NonNegativeInteger|)))
        (QVELT |space| 5)) 

(SDEFUN |SUBSPACE;=;2%B;35| ((|s1| (%)) (|s2| (%)) (% (|Boolean|)))
        (SPROG
         ((|c2| NIL) (#1=#:G166 NIL) (|c1| NIL) (#2=#:G165 NIL)
          (#3=#:G160 #4=(|Boolean|)) (#5=#:G158 #4#) (#6=#:G159 NIL))
         (SEQ
          (COND
           ((SPADCALL |s1| (QREFELT % 15))
            (COND
             ((SPADCALL |s2| (QREFELT % 15))
              (EXIT
               (COND
                ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT % 71))
                 (COND
                  ((SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT % 72))
                   (EQL (QVELT |s1| 5) (QVELT |s2| 5)))
                  (#7='T NIL)))
                (#7# NIL)))))))
          (EXIT
           (COND
            ((OR
              (OR
               (SPADCALL (SPADCALL (QVELT |s1| 3) (QREFELT % 73))
                         (SPADCALL (QVELT |s2| 3) (QREFELT % 73))
                         (QREFELT % 74))
               (NULL
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |c2| NIL) (LETT #1# (QVELT |s2| 3)) (LETT |c1| NIL)
                      (LETT #2# (QVELT |s1| 3)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |c1| (CAR #2#)) NIL)
                            (ATOM #1#) (PROGN (LETT |c2| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# (SPADCALL |c1| |c2| (QREFELT % 75)))
                         (COND (#6# (LETT #5# (COND (#5# #3#) ('T NIL))))
                               ('T (PROGN (LETT #5# #3#) (LETT #6# 'T)))))))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                      (GO G190) G191 (EXIT NIL))
                 (COND (#6# #5#) (#7# 'T)))))
              (NULL (SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT % 72))))
             NIL)
            ('T (EQL (QVELT |s1| 5) (QVELT |s2| 5)))))))) 

(SDEFUN |SUBSPACE;coerce;%Of;36| ((|space| (%)) (% (|OutputForm|)))
        (SPROG ((|s| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL (QREFELT % 6) (QREFELT % 78))
                      (SPADCALL "-Space with depth of " (QREFELT % 80))
                      (SPADCALL (- (QREFELT % 6) (QVELT |space| 5))
                                (QREFELT % 81))
                      (SPADCALL " and " (QREFELT % 80))
                      (SPADCALL
                       (LETT |s| (SPADCALL (QVELT |space| 3) (QREFELT % 73)))
                       (QREFELT % 82))
                      (SPADCALL
                       (COND ((EQL |s| 1) " component") ('T " components"))
                       (QREFELT % 80)))
                (QREFELT % 83)))) 

(DECLAIM (NOTINLINE |SubSpace;|)) 

(DEFUN |SubSpace;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SubSpace| DV$1 DV$2))
          (LETT % (GETREFV 85))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SubSpace| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |pt| (|Point| |#2|))
                              (|:| |index| (|NonNegativeInteger|))
                              (|:| |property| (|SubSpaceComponentProperty|))
                              (|:| |childrenField| (|List| %))
                              (|:| |lastChild| (|List| %))
                              (|:| |levelField| (|NonNegativeInteger|))
                              (|:| |pointDataField| (|List| (|Point| |#2|)))
                              (|:| |lastPoint| (|List| (|Point| |#2|)))
                              (|:| |noPoints| (|NonNegativeInteger|))
                              (|:| |noChildren| (|NonNegativeInteger|))
                              (|:| |parentField| (|List| %))))
          (QSETREFV % 9 "Non-null list: Please inform Stephen Watt")
          %))) 

(DEFUN |SubSpace| (&REST #1=#:G168)
  (SPROG NIL
         (PROG (#2=#:G169)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|SubSpace|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubSpace;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|SubSpace|)))))))))) 

(MAKEPROP '|SubSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              'TELLWATT (|List| %) |SUBSPACE;children;%L;8| (|Boolean|)
              (|List| $$) (0 . |empty?|) |SUBSPACE;leaf?;%B;1|
              |SUBSPACE;root?;%B;2| |SUBSPACE;internal?;%B;3| (|List| 7)
              (|Point| 7) (5 . |point|) (|SubSpaceComponentProperty|)
              (10 . |new|) |SUBSPACE;new;%;4| |SUBSPACE;subspace;%;5|
              (16 . |rest|) (21 . |setrest!|) |SUBSPACE;birth;2%;6| (|Integer|)
              (27 . |elt|) (|NonNegativeInteger|) |SUBSPACE;child;%Nni%;7|
              |SUBSPACE;numberOfChildren;%Nni;9| (33 . |copy|) (|List| 19)
              (38 . |copy|) (43 . |tail|) |SUBSPACE;shallowCopy;2%;10|
              |SUBSPACE;deepCopy;2%;11| (48 . |cons|) (54 . |reverse!|)
              (59 . |tail|) (64 . |append|) |SUBSPACE;merge;3%;12|
              (70 . |first|) |SUBSPACE;merge;L%;13| |SUBSPACE;separate;%L;14|
              (75 . |setrest!|) (|List| 30) |SUBSPACE;addPoint;%LP%;17|
              |SUBSPACE;addPoint2;%P%;18| |SUBSPACE;addPointLast;2%PNni%;19|
              (81 . |elt|) |SUBSPACE;addPoint;%LNni%;20|
              |SUBSPACE;addPoint;%PNni;21| |SUBSPACE;modifyPoint;%LP%;22|
              |SUBSPACE;modifyPoint;%LNni%;23| (87 . |setelt!|)
              |SUBSPACE;modifyPoint;%NniP%;24| (94 . |solid?|)
              |SUBSPACE;closeComponent;%LB%;25|
              |SUBSPACE;defineProperty;%LSscp%;26| |SUBSPACE;traverse;%L%;27|
              |SUBSPACE;parent;2%;32| |SUBSPACE;extractPoint;%P;28|
              |SUBSPACE;extractIndex;%Nni;29| (99 . |closed?|)
              |SUBSPACE;extractClosed;%B;30|
              |SUBSPACE;extractProperty;%Sscp;31| |SUBSPACE;pointData;%L;33|
              |SUBSPACE;level;%Nni;34| (104 . =) (110 . =) (116 . |#|)
              (121 . ~=) |SUBSPACE;=;2%B;35| (|OutputForm|) (|PositiveInteger|)
              (127 . |coerce|) (|String|) (132 . |message|) (137 . |coerce|)
              (142 . |coerce|) (147 . |hconcat|) |SUBSPACE;coerce;%Of;36|)
           '#(~= 152 |traverse| 158 |subspace| 164 |shallowCopy| 168 |separate|
              173 |root?| 178 |pointData| 183 |parent| 188 |numberOfChildren|
              193 |new| 198 |modifyPoint| 202 |merge| 223 |level| 234 |leaf?|
              239 |latex| 244 |internal?| 249 |extractProperty| 254
              |extractPoint| 259 |extractIndex| 264 |extractClosed| 269
              |defineProperty| 274 |deepCopy| 281 |coerce| 286 |closeComponent|
              291 |children| 298 |child| 303 |birth| 309 |addPointLast| 314
              |addPoint2| 322 |addPoint| 328 = 348)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 76) (|BasicType|))
                        (|makeByteWordVec2| 84
                                            '(1 13 12 0 14 1 19 0 18 20 2 21 0
                                              12 12 22 1 13 0 0 25 2 13 0 0 0
                                              26 2 13 2 0 28 29 1 21 0 0 33 1
                                              34 0 0 35 1 34 0 0 36 2 13 0 2 0
                                              39 1 13 0 0 40 1 13 0 0 41 2 13 0
                                              0 0 42 1 13 2 0 44 2 34 0 0 0 47
                                              2 34 19 0 28 52 3 34 19 0 28 19
                                              57 1 21 12 0 59 1 21 12 0 66 2 19
                                              12 0 0 71 2 21 12 0 0 72 1 13 30
                                              0 73 2 30 12 0 0 74 1 77 76 0 78
                                              1 76 0 79 80 1 28 76 0 81 1 30 76
                                              0 82 1 76 0 10 83 2 0 12 0 0 1 2
                                              0 0 0 48 62 0 0 0 24 1 0 0 0 37 1
                                              0 10 0 46 1 0 12 0 16 1 0 34 0 69
                                              1 0 0 0 63 1 0 30 0 32 0 0 0 23 3
                                              0 0 0 48 19 55 3 0 0 0 48 30 56 3
                                              0 0 0 30 19 58 2 0 0 0 0 43 1 0 0
                                              10 45 1 0 30 0 70 1 0 12 0 15 1 0
                                              79 0 1 1 0 12 0 17 1 0 21 0 68 1
                                              0 19 0 64 1 0 30 0 65 1 0 12 0 67
                                              3 0 0 0 48 21 61 1 0 0 0 38 1 0
                                              76 0 84 3 0 0 0 48 12 60 1 0 10 0
                                              11 2 0 0 0 30 31 1 0 0 0 27 4 0 0
                                              0 0 19 30 51 2 0 0 0 19 50 3 0 0
                                              0 48 19 49 3 0 0 0 48 30 53 2 0
                                              30 0 19 54 2 0 12 0 0 75)))))
           '|lookupComplete|)) 
