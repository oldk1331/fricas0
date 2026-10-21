
(SDEFUN |SPACE3;convertSpace| ((|space| (%)) (% (%)))
        (SPROG
         ((|component| NIL) (#1=#:G45 NIL)
          (|lprop| (|List| (|SubSpaceComponentProperty|))) (|curve| NIL)
          (#2=#:G46 NIL) (|tmplprop| (|List| (|SubSpaceComponentProperty|)))
          (|point| NIL) (#3=#:G47 NIL)
          (|tmplipt| (|List| (|NonNegativeInteger|)))
          (|tmpllipt| (|List| (|List| (|NonNegativeInteger|))))
          (|llprop| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|lllipt| (|List| (|List| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((QVELT |space| 3) |space|)
                ('T
                 (SEQ (QSETVELT |space| 3 'T) (LETT |lllipt| NIL)
                      (LETT |llprop| NIL) (LETT |lprop| NIL)
                      (SEQ (LETT |component| NIL)
                           (LETT #1#
                                 (SPADCALL (QVELT |space| 0) (QREFELT % 10)))
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |component| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lprop|
                                  (CONS (SPADCALL |component| (QREFELT % 12))
                                        |lprop|))
                            (LETT |tmpllipt| NIL) (LETT |tmplprop| NIL)
                            (SEQ (LETT |curve| NIL)
                                 (LETT #2#
                                       (SPADCALL |component| (QREFELT % 10)))
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |curve| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |tmplprop|
                                        (CONS (SPADCALL |curve| (QREFELT % 12))
                                              |tmplprop|))
                                  (LETT |tmplipt| NIL)
                                  (SEQ (LETT |point| NIL)
                                       (LETT #3#
                                             (SPADCALL |curve| (QREFELT % 10)))
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |point| (CAR #3#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |tmplipt|
                                               (CONS
                                                (SPADCALL |point|
                                                          (QREFELT % 14))
                                                |tmplipt|))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (LETT |tmpllipt|
                                         (CONS (NREVERSE |tmplipt|)
                                               |tmpllipt|))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |llprop|
                                  (CONS (NREVERSE |tmplprop|) |llprop|))
                            (EXIT
                             (LETT |lllipt|
                                   (CONS (NREVERSE |tmpllipt|) |lllipt|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (QSETVELT |space| 1
                                (VECTOR
                                 (SPADCALL (QVELT |space| 0) (QREFELT % 16))
                                 (NREVERSE |lllipt|) (NREVERSE |llprop|)
                                 (NREVERSE |lprop|)))
                      (EXIT |space|))))))) 

(SDEFUN |SPACE3;polygon;%L%;2|
        ((|space| (%)) (|points| (|List| (|Point| R))) (% (%)))
        (SPROG ((|pt| (|SubSpace| 3 R)) (|p| NIL) (#1=#:G53 NIL))
               (SEQ
                (COND
                 ((< (LENGTH |points|) 3)
                  (|error| "You need at least 3 points to define a polygon"))
                 ('T
                  (SEQ
                   (LETT |pt|
                         (SPADCALL (QVELT |space| 0) (|SPADfirst| |points|)
                                   (QREFELT % 18)))
                   (LETT |points| (CDR |points|))
                   (SPADCALL (QVELT |space| 0) |pt| (|SPADfirst| |points|) 1
                             (QREFELT % 19))
                   (SEQ (LETT |p| NIL) (LETT #1# (CDR |points|)) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL (QVELT |space| 0) |pt| |p| 2
                                    (QREFELT % 19))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (QSETVELT |space| 3 NIL) (EXIT |space|))))))) 

(SDEFUN |SPACE3;create3Space;%;3| ((% (%)))
        (VECTOR (SPADCALL (QREFELT % 21)) (VECTOR NIL NIL NIL NIL)
                (VECTOR 0 0 0 0) NIL)) 

(SDEFUN |SPACE3;create3Space;Ss%;4| ((|s| (|SubSpace| 3 R)) (% (%)))
        (VECTOR |s| (VECTOR NIL NIL NIL NIL) (VECTOR 0 0 0 0) NIL)) 

(SDEFUN |SPACE3;numberOfComponents;%Nni;5|
        ((|space| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT % 10)))) 

(SDEFUN |SPACE3;merge;L%;6| ((|listOfThreeSpaces| (|List| %)) (% (%)))
        (SPROG ((#1=#:G65 NIL) (|ts| NIL) (#2=#:G66 NIL) (|newspace| (%)))
               (SEQ
                (LETT |newspace|
                      (SPADCALL
                       (SPADCALL
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |ts| NIL) (LETT #2# |listOfThreeSpaces|)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |ts| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #1# (CONS (QVELT |ts| 0) #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))
                        (QREFELT % 26))
                       (QREFELT % 24)))
                (EXIT |newspace|)))) 

(SDEFUN |SPACE3;merge;3%;7| ((|s1| (%)) (|s2| (%)) (% (%)))
        (SPADCALL (LIST |s1| |s2|) (QREFELT % 27))) 

(SDEFUN |SPACE3;components;%L;8| ((|space| (%)) (% (|List| %)))
        (SPROG ((#1=#:G71 NIL) (|s| NIL) (#2=#:G72 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |s| NIL)
                      (LETT #2# (SPADCALL (QVELT |space| 0) (QREFELT % 29)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |s| (QREFELT % 24)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SPACE3;copy;2%;9| ((|space| (%)) (% (%)))
        (SPROG ((|spc| (%)))
               (SEQ
                (LETT |spc|
                      (SPADCALL (SPADCALL (QVELT |space| 0) (QREFELT % 31))
                                (QREFELT % 24)))
                (EXIT |spc|)))) 

(SDEFUN |SPACE3;enterPointData;%LNni;10|
        ((|space| (%)) (|listOfPoints| (|List| (|Point| R)))
         (% (|NonNegativeInteger|)))
        (SPROG ((|p| NIL) (#1=#:G79 NIL))
               (SEQ
                (SEQ (LETT |p| NIL) (LETT #1# |listOfPoints|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (SPADCALL (QVELT |space| 0) |p| (QREFELT % 33))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT % 16))))))) 

(SDEFUN |SPACE3;modifyPointData;%NniP%;11|
        ((|space| (%)) (|i| (|NonNegativeInteger|)) (|p| (|Point| R)) (% (%)))
        (SEQ (SPADCALL (QVELT |space| 0) |i| |p| (QREFELT % 35))
             (EXIT |space|))) 

(SDEFUN |SPACE3;point?;%B;12| ((|space| (%)) (% (|Boolean|)))
        (SPROG ((|c| #1=(|List| (|SubSpace| 3 R))) (|kid| #1#))
               (COND
                ((>
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT % 10))))
                  1)
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT % 10))))
                  1)
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT % 10)))
                      1))
                ('T NIL)))) 

(SDEFUN |SPACE3;point;%P;13| ((|space| (%)) (% (|Point| R)))
        (COND
         ((SPADCALL |space| (QREFELT % 38))
          (SPADCALL (SPADCALL (QVELT |space| 0) (LIST 1 1 1) (QREFELT % 40))
                    (QREFELT % 41)))
         ('T
          (|error|
           "This ThreeSpace holds something other than a single point - try the objects() command")))) 

(SDEFUN |SPACE3;point;P%;14| ((|aPoint| (|Point| R)) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |aPoint| (QREFELT % 43))) 

(SDEFUN |SPACE3;point;%P%;15| ((|space| (%)) (|aPoint| (|Point| R)) (% (%)))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |aPoint| (QREFELT % 45))
             (QSETVELT |space| 3 NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;point;%L%;16| ((|space| (%)) (|l| (|List| R)) (% (%)))
        (SPROG ((|pt| (|Point| R)))
               (SEQ (LETT |pt| (SPADCALL |l| (QREFELT % 47)))
                    (EXIT (SPADCALL |space| |pt| (QREFELT % 43)))))) 

(SDEFUN |SPACE3;point;%Nni%;17|
        ((|space| (%)) (|i| (|NonNegativeInteger|)) (% (%)))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |i| (QREFELT % 49))
             (QSETVELT |space| 3 NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;curve?;%B;18| ((|space| (%)) (% (|Boolean|)))
        (SPROG ((|c| (|List| (|SubSpace| 3 R))))
               (COND
                ((>
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT % 10))))
                  1)
                 (|error| "This ThreeSpace has more than one component"))
                ('T
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |c|) (QREFELT % 10)))
                      1))))) 

(SDEFUN |SPACE3;curve;%L;19| ((|space| (%)) (% (|List| (|Point| R))))
        (SPROG
         ((|spc| (|SubSpace| 3 R)) (#1=#:G103 NIL) (|s| NIL) (#2=#:G104 NIL))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT % 51))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT % 10)))
                     (QREFELT % 10))))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |s| NIL) (LETT #2# (SPADCALL |spc| (QREFELT % 10)))
                    G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1# (CONS (SPADCALL |s| (QREFELT % 41)) #1#))))
                    (LETT #2# (CDR #2#)) (GO G190) G191
                    (EXIT (NREVERSE #1#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;curve;L%;20| ((|points| (|List| (|Point| R))) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |points| (QREFELT % 53))) 

(SDEFUN |SPACE3;curve;%L%;21|
        ((|space| (%)) (|points| (|List| (|Point| R))) (% (%)))
        (SPROG
         ((|path| (|List| (|NonNegativeInteger|))) (|p| NIL) (#1=#:G110 NIL))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT % 45))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT % 10))) 1))
          (SEQ (LETT |p| NIL) (LETT #1# (CDR |points|)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT % 45))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 3 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;curve;%L%;22|
        ((|space| (%)) (|points| (|List| (|List| R))) (% (%)))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ (LETT |pts| (SPADCALL (ELT % 47) |points| (QREFELT % 58)))
                    (EXIT (SPADCALL |space| |pts| (QREFELT % 53)))))) 

(SDEFUN |SPACE3;closedCurve?;%B;23| ((|space| (%)) (% (|Boolean|)))
        (SPROG ((|c| #1=(|List| (|SubSpace| 3 R))) (|kid| #1#))
               (COND
                ((>
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT % 10))))
                  1)
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT % 10))))
                  1)
                 (SPADCALL (|SPADfirst| |kid|) (QREFELT % 60)))
                ('T NIL)))) 

(SDEFUN |SPACE3;closedCurve;%L;24| ((|space| (%)) (% (|List| (|Point| R))))
        (SPROG
         ((|spc| (|SubSpace| 3 R)) (#1=#:G125 NIL) (|s| NIL) (#2=#:G126 NIL))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT % 61))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT % 10)))
                     (QREFELT % 10))))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |s| NIL) (LETT #2# (SPADCALL |spc| (QREFELT % 10)))
                    G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1# (CONS (SPADCALL |s| (QREFELT % 41)) #1#))))
                    (LETT #2# (CDR #2#)) (GO G190) G191
                    (EXIT (NREVERSE #1#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;closedCurve;L%;25| ((|points| (|List| (|Point| R))) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |points| (QREFELT % 63))) 

(SDEFUN |SPACE3;closedCurve;%L%;26|
        ((|space| (%)) (|points| (|List| (|Point| R))) (% (%)))
        (SPROG
         ((|path| (|List| (|NonNegativeInteger|))) (|p| NIL) (#1=#:G132 NIL))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT % 45))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT % 10))) 1))
          (SPADCALL (QVELT |space| 0) |path| 'T (QREFELT % 65))
          (SEQ (LETT |p| NIL) (LETT #1# (CDR |points|)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT % 45))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 3 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;closedCurve;%L%;27|
        ((|space| (%)) (|points| (|List| (|List| R))) (% (%)))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ (LETT |pts| (SPADCALL (ELT % 47) |points| (QREFELT % 58)))
                    (EXIT (SPADCALL |space| |pts| (QREFELT % 63)))))) 

(SDEFUN |SPACE3;polygon?;%B;28| ((|space| (%)) (% (|Boolean|)))
        (SPROG ((|c| #1=(|List| (|SubSpace| 3 R))) (|kid| #1#))
               (COND
                ((>
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT % 10))))
                  1)
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT % 10))))
                  2)
                 (COND
                  ((EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT % 10)))
                        1)
                   (>
                    (LENGTH
                     (SPADCALL (SPADCALL |kid| (QREFELT % 68)) (QREFELT % 10)))
                    2))
                  (#2='T NIL)))
                (#2# NIL)))) 

(SDEFUN |SPACE3;polygon;%L;29| ((|space| (%)) (% (|List| (|Point| R))))
        (SPROG
         ((|cs| (|List| (|SubSpace| 3 R))) (#1=#:G147 NIL) (|s| NIL)
          (#2=#:G148 NIL))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT % 69))
            (SEQ
             (LETT |cs|
                   (SPADCALL
                    (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT % 10)))
                    (QREFELT % 10)))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |s| NIL)
                    (LETT #2#
                          (SPADCALL (SPADCALL |cs| (QREFELT % 68))
                                    (QREFELT % 10)))
                    G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1# (CONS (SPADCALL |s| (QREFELT % 41)) #1#))))
                    (LETT #2# (CDR #2#)) (GO G190) G191
                    (EXIT (NREVERSE #1#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a polygon - try the objects() command")))))) 

(SDEFUN |SPACE3;polygon;L%;30| ((|points| (|List| (|Point| R))) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |points| (QREFELT % 20))) 

(SDEFUN |SPACE3;polygon;%L%;31|
        ((|space| (%)) (|points| (|List| (|List| R))) (% (%)))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ (LETT |pts| (SPADCALL (ELT % 47) |points| (QREFELT % 58)))
                    (EXIT (SPADCALL |space| |pts| (QREFELT % 20)))))) 

(SDEFUN |SPACE3;mesh?;%B;32| ((|space| (%)) (% (|Boolean|)))
        (SPROG
         ((|c| #1=(|List| (|SubSpace| 3 R))) (|kid| #1#)
          (|whatSizes| (|Set| (|NonNegativeInteger|))) (|eachCurve| NIL)
          (#2=#:G161 NIL))
         (SEQ
          (COND
           ((> (LENGTH (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT % 10))))
               1)
            (|error| "This ThreeSpace has more than one component"))
           ((>
             (LENGTH (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT % 10))))
             1)
            (SEQ (LETT |whatSizes| (SPADCALL (QREFELT % 74)))
                 (SEQ (LETT |eachCurve| NIL) (LETT #2# |kid|) G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |eachCurve| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL
                         (LENGTH (SPADCALL |eachCurve| (QREFELT % 10)))
                         |whatSizes| (QREFELT % 75))))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((> (SPADCALL |whatSizes| (QREFELT % 76)) 1)
                    (|error| "Mesh defined with curves of different sizes"))
                   ((< (|SPADfirst| (SPADCALL |whatSizes| (QREFELT % 77))) 2)
                    (|error|
                     "Mesh defined with single point curves (use curve())"))
                   (#3='T 'T)))))
           (#3# NIL))))) 

(SDEFUN |SPACE3;mesh;%L;33| ((|space| (%)) (% (|List| (|List| (|Point| R)))))
        (SPROG
         ((|lpSpace| NIL) (#1=#:G169 NIL) (#2=#:G170 NIL) (|s| NIL)
          (#3=#:G171 NIL) (|llp| (|List| (|List| (|Point| R)))))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT % 78))
            (SEQ (LETT |llp| NIL)
                 (SEQ (LETT |lpSpace| NIL)
                      (LETT #1#
                            (SPADCALL
                             (|SPADfirst|
                              (SPADCALL (QVELT |space| 0) (QREFELT % 10)))
                             (QREFELT % 10)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |lpSpace| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |llp|
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |s| NIL)
                                     (LETT #3#
                                           (SPADCALL |lpSpace| (QREFELT % 10)))
                                     G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN (LETT |s| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| (QREFELT % 41))
                                              #2#))))
                                     (LETT #3# (CDR #3#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               |llp|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT |llp|)))
           ('T
            (|error|
             "This ThreeSpace holds something other than a mesh - try the objects() command")))))) 

(SDEFUN |SPACE3;mesh;L%;34| ((|points| (|List| (|List| (|Point| R)))) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |points| NIL NIL (QREFELT % 81))) 

(SDEFUN |SPACE3;mesh;L2B%;35|
        ((|points| (|List| (|List| (|Point| R)))) (|prop1| #1=(|Boolean|))
         (|prop2| #1#) (% (%)))
        (SPADCALL (SPADCALL (QREFELT % 23)) |points| |prop1| |prop2|
                  (QREFELT % 81))) 

(SDEFUN |SPACE3;mesh;%LLSscp%;36|
        ((|space| (%)) (|llpoints| (|List| (|List| (|List| R))))
         (|lprops| (|List| #1=(|SubSpaceComponentProperty|))) (|prop| #1#)
         (% (%)))
        (SPROG
         ((#2=#:G180 NIL) (|points| NIL) (#3=#:G181 NIL)
          (|pts| (|List| (|List| (|Point| R)))))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |points| NIL) (LETT #3# |llpoints|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |points| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (ELT % 47) |points| (QREFELT % 58))
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |space| |pts| |lprops| |prop| (QREFELT % 85)))))) 

(SDEFUN |SPACE3;mesh;%LLSscp%;37|
        ((|space| (%)) (|llp| (|List| (|List| (|Point| R))))
         (|lprops| (|List| #1=(|SubSpaceComponentProperty|))) (|prop| #1#)
         (% (%)))
        (SPROG
         ((#2=#:G191 NIL) (|count| NIL) (|aProp| NIL) (#3=#:G193 NIL)
          (|lp| NIL) (#4=#:G192 NIL) (|path| (|List| (|NonNegativeInteger|)))
          (|p| NIL) (#5=#:G194 NIL))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                    (QREFELT % 45))
          (SPADCALL (QVELT |space| 0)
                    (LETT |path|
                          (LIST
                           (LENGTH
                            (SPADCALL (QVELT |space| 0) (QREFELT % 10)))))
                    |prop| (QREFELT % 88))
          (LETT |path| (SPADCALL |path| (LIST 1) (QREFELT % 89)))
          (SPADCALL (QVELT |space| 0) |path| (|SPADfirst| |lprops|)
                    (QREFELT % 88))
          (SEQ (LETT |p| NIL) (LETT #2# (CDR (|SPADfirst| |llp|))) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT % 45))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |count| 2) (LETT |aProp| NIL) (LETT #3# (CDR |lprops|))
               (LETT |lp| NIL) (LETT #4# (CDR |llp|)) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |lp| (CAR #4#)) NIL) (ATOM #3#)
                     (PROGN (LETT |aProp| (CAR #3#)) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL (QVELT |space| 0)
                          (LETT |path| (LIST (|SPADfirst| |path|)))
                          (|SPADfirst| |lp|) (QREFELT % 45))
                (LETT |path| (SPADCALL |path| (LIST |count|) (QREFELT % 89)))
                (SPADCALL (QVELT |space| 0) |path| |aProp| (QREFELT % 88))
                (EXIT
                 (SEQ (LETT |p| NIL) (LETT #5# (CDR |lp|)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |space| 0) |path| |p|
                                  (QREFELT % 45))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4#
                     (PROG1 (CDR #4#)
                       (LETT #3#
                             (PROG1 (CDR #3#)
                               (LETT |count| (|inc_SI| |count|))))))
               (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 3 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;mesh;%L2B%;38|
        ((|space| (%)) (|llpoints| (|List| (|List| (|List| R))))
         (|prop1| #1=(|Boolean|)) (|prop2| #1#) (% (%)))
        (SPROG
         ((#2=#:G201 NIL) (|points| NIL) (#3=#:G202 NIL)
          (|pts| (|List| (|List| (|Point| R)))))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |points| NIL) (LETT #3# |llpoints|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |points| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (ELT % 47) |points| (QREFELT % 58))
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |space| |pts| |prop1| |prop2| (QREFELT % 81)))))) 

(SDEFUN |SPACE3;mesh;%L2B%;39|
        ((|space| (%)) (|llp| (|List| (|List| (|Point| R))))
         (|prop1| #1=(|Boolean|)) (|prop2| #1#) (% (%)))
        (SPROG
         ((|propA| #2=(|SubSpaceComponentProperty|)) (|propB| #2#)
          (#3=#:G212 NIL) (|count| NIL) (|lp| NIL) (#4=#:G213 NIL)
          (|path| (|List| (|NonNegativeInteger|))) (|p| NIL) (#5=#:G214 NIL))
         (SEQ (LETT |propA| (SPADCALL |prop1| NIL (QREFELT % 91)))
              (LETT |propB| (SPADCALL |prop2| NIL (QREFELT % 91)))
              (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                        (QREFELT % 45))
              (SPADCALL (QVELT |space| 0)
                        (LETT |path|
                              (LIST
                               (LENGTH
                                (SPADCALL (QVELT |space| 0) (QREFELT % 10)))))
                        |propB| (QREFELT % 88))
              (LETT |path| (SPADCALL |path| (LIST 1) (QREFELT % 89)))
              (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT % 88))
              (SEQ (LETT |p| NIL) (LETT #3# (CDR (|SPADfirst| |llp|))) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT % 45))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |count| 2) (LETT |lp| NIL) (LETT #4# (CDR |llp|)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |lp| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL (QVELT |space| 0)
                              (LETT |path| (LIST (|SPADfirst| |path|)))
                              (|SPADfirst| |lp|) (QREFELT % 45))
                    (LETT |path|
                          (SPADCALL |path| (LIST |count|) (QREFELT % 89)))
                    (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT % 88))
                    (EXIT
                     (SEQ (LETT |p| NIL) (LETT #5# (CDR |lp|)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL (QVELT |space| 0) |path| |p|
                                      (QREFELT % 45))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4#
                         (PROG1 (CDR #4#) (LETT |count| (|inc_SI| |count|))))
                   (GO G190) G191 (EXIT NIL))
              (QSETVELT |space| 3 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;lp;%L;40| ((|space| (%)) (% (|List| (|Point| R))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 3))
           (LETT |space| (|SPACE3;convertSpace| |space| %))))
         (EXIT (QVELT (QVELT |space| 1) 0)))) 

(SDEFUN |SPACE3;lllip;%L;41|
        ((|space| (%)) (% (|List| (|List| (|List| (|NonNegativeInteger|))))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 3))
           (LETT |space| (|SPACE3;convertSpace| |space| %))))
         (EXIT (QVELT (QVELT |space| 1) 1)))) 

(SDEFUN |SPACE3;llprop;%L;42|
        ((|space| (%)) (% (|List| (|List| (|SubSpaceComponentProperty|)))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 3))
           (LETT |space| (|SPACE3;convertSpace| |space| %))))
         (EXIT (QVELT (QVELT |space| 1) 2)))) 

(SDEFUN |SPACE3;lprop;%L;43|
        ((|space| (%)) (% (|List| (|SubSpaceComponentProperty|))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 3))
           (LETT |space| (|SPACE3;convertSpace| |space| %))))
         (EXIT (QVELT (QVELT |space| 1) 3)))) 

(SDEFUN |SPACE3;objects;%R;44|
        ((|space| (%))
         (%
          (|Record| (|:| |points| #1=(|NonNegativeInteger|)) (|:| |curves| #1#)
                    (|:| |polygons| #1#) (|:| |constructs| #1#))))
        (SPROG
         ((|component| NIL) (#2=#:G245 NIL) (|kid| (|List| (|SubSpace| 3 R)))
          (|numPts| #3=(|NonNegativeInteger|)) (|numCurves| #3#)
          (|numPolys| #3#) (|numConstructs| #3#))
         (SEQ
          (COND
           ((NULL (QVELT |space| 3))
            (LETT |space| (|SPACE3;convertSpace| |space| %))))
          (LETT |numPts| 0) (LETT |numCurves| 0) (LETT |numPolys| 0)
          (LETT |numConstructs| 0)
          (SEQ (LETT |component| NIL)
               (LETT #2# (SPADCALL (QVELT |space| 0) (QREFELT % 10))) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |component| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL
                    (LENGTH (LETT |kid| (SPADCALL |component| (QREFELT % 10))))
                    1)
                   (COND
                    ((EQL
                      (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT % 10))) 1)
                     (LETT |numPts| (+ |numPts| 1)))
                    ('T (LETT |numCurves| (+ |numCurves| 1)))))
                  ('T
                   (SEQ
                    (COND
                     ((EQL (LENGTH |kid|) 2)
                      (COND
                       ((EQL
                         (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT % 10)))
                         1)
                        (COND
                         ((SPADCALL
                           (LENGTH
                            (SPADCALL (|SPADfirst| (CDR |kid|))
                                      (QREFELT % 10)))
                           1 (QREFELT % 99))
                          (EXIT (LETT |numPolys| (+ |numPolys| 1)))))))))
                    (EXIT (LETT |numConstructs| (+ |numConstructs| 1))))))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |numPts| |numCurves| |numPolys| |numConstructs|))))) 

(SDEFUN |SPACE3;check;2%;45| ((|s| (%)) (% (%)))
        (COND ((NULL (QVELT |s| 3)) (|SPACE3;convertSpace| |s| %)) ('T |s|))) 

(MAKEPROP '|SPACE3;subspace;%Ss;46| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SPACE3;subspace;%Ss;46| ((|s| (%)) (% (|SubSpace| 3 R))) (QVELT |s| 0)) 

(SDEFUN |SPACE3;coerce;%Of;47| ((|s| (%)) (% (|OutputForm|)))
        (SPROG ((|sizo| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((NULL (QVELT |s| 3))
                  (LETT |s| (|SPACE3;convertSpace| |s| %))))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL "3-Space with " (QREFELT % 106))
                        (SPADCALL
                         (LETT |sizo| (LENGTH (QVELT (QVELT |s| 1) 1)))
                         (QREFELT % 107))
                        (SPADCALL
                         (COND ((EQL |sizo| 1) " component")
                               ('T " components"))
                         (QREFELT % 106)))
                  (QREFELT % 108)))))) 

(DECLAIM (NOTINLINE |ThreeSpace;|)) 

(DEFUN |ThreeSpace;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ThreeSpace| DV$1))
          (LETT % (GETREFV 111))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ThreeSpace| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |subspaceField| (|SubSpace| 3 |#1|))
                              (|:| |rep3DField|
                                   (|Record| (|:| |lp| (|List| (|Point| |#1|)))
                                             (|:| |llliPt|
                                                  (|List|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|)))))
                                             (|:| |llProp|
                                                  (|List|
                                                   (|List|
                                                    (|SubSpaceComponentProperty|))))
                                             (|:| |lProp|
                                                  (|List|
                                                   (|SubSpaceComponentProperty|)))))
                              (|:| |objectsField|
                                   (|Record|
                                    (|:| |points| (|NonNegativeInteger|))
                                    (|:| |curves| (|NonNegativeInteger|))
                                    (|:| |polygons| (|NonNegativeInteger|))
                                    (|:| |constructs| (|NonNegativeInteger|))))
                              (|:| |converted| (|Boolean|))))
          %))) 

(DEFUN |ThreeSpace| (#1=#:G254)
  (SPROG NIL
         (PROG (#2=#:G255)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ThreeSpace|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|ThreeSpace;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ThreeSpace|)))))))))) 

(MAKEPROP '|ThreeSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| %)
              (|SubSpace| (NRTEVAL 3) 6) (0 . |children|)
              (|SubSpaceComponentProperty|) (5 . |extractProperty|)
              (|NonNegativeInteger|) (10 . |extractIndex|) (|List| 17)
              (15 . |pointData|) (|Point| 6) (20 . |addPoint2|)
              (26 . |addPointLast|) |SPACE3;polygon;%L%;2| (34 . |new|)
              (38 . |0|) |SPACE3;create3Space;%;3| |SPACE3;create3Space;Ss%;4|
              |SPACE3;numberOfComponents;%Nni;5| (42 . |merge|)
              |SPACE3;merge;L%;6| |SPACE3;merge;3%;7| (47 . |separate|)
              |SPACE3;components;%L;8| (52 . |deepCopy|) |SPACE3;copy;2%;9|
              (57 . |addPoint|) |SPACE3;enterPointData;%LNni;10|
              (63 . |modifyPoint|) |SPACE3;modifyPointData;%NniP%;11|
              (|Boolean|) |SPACE3;point?;%B;12| (|List| 13) (70 . |traverse|)
              (76 . |extractPoint|) |SPACE3;point;%P;13| |SPACE3;point;%P%;15|
              |SPACE3;point;P%;14| (81 . |addPoint|) (|List| 6) (88 . |point|)
              |SPACE3;point;%L%;16| (93 . |addPoint|) |SPACE3;point;%Nni%;17|
              |SPACE3;curve?;%B;18| |SPACE3;curve;%L;19| |SPACE3;curve;%L%;21|
              |SPACE3;curve;L%;20| (|Mapping| 17 46) (|List| 46)
              (|ListFunctions2| 46 17) (100 . |map|) |SPACE3;curve;%L%;22|
              (106 . |extractClosed|) |SPACE3;closedCurve?;%B;23|
              |SPACE3;closedCurve;%L;24| |SPACE3;closedCurve;%L%;26|
              |SPACE3;closedCurve;L%;25| (111 . |closeComponent|)
              |SPACE3;closedCurve;%L%;27| (|List| 9) (118 . |second|)
              |SPACE3;polygon?;%B;28| |SPACE3;polygon;%L;29|
              |SPACE3;polygon;L%;30| |SPACE3;polygon;%L%;31| (|Set| 13)
              (123 . |empty|) (127 . |insert!|) (133 . |#|) (138 . |parts|)
              |SPACE3;mesh?;%B;32| (|List| 15) |SPACE3;mesh;%L;33|
              |SPACE3;mesh;%L2B%;39| |SPACE3;mesh;L%;34| |SPACE3;mesh;L2B%;35|
              (|List| 11) |SPACE3;mesh;%LLSscp%;37| (|List| 56)
              |SPACE3;mesh;%LLSscp%;36| (143 . |defineProperty|)
              (150 . |append|) |SPACE3;mesh;%L2B%;38| (156 . |new|)
              |SPACE3;lp;%L;40| (|List| (|List| 39)) |SPACE3;lllip;%L;41|
              (|List| 84) |SPACE3;llprop;%L;42| |SPACE3;lprop;%L;43|
              (162 . |1|) (166 . ~=)
              (|Record| (|:| |points| 13) (|:| |curves| 13) (|:| |polygons| 13)
                        (|:| |constructs| 13))
              |SPACE3;objects;%R;44| |SPACE3;check;2%;45|
              |SPACE3;subspace;%Ss;46| (|String|) (|OutputForm|)
              (172 . |message|) (177 . |coerce|) (182 . |hconcat|)
              |SPACE3;coerce;%Of;47| (|List| 79))
           '#(~= 187 |subspace| 193 |polygon?| 198 |polygon| 203 |point?| 225
              |point| 230 |objects| 258 |numberOfComponents| 263
              |modifyPointData| 268 |mesh?| 275 |mesh| 280 |merge| 329 |lprop|
              340 |lp| 345 |llprop| 350 |lllp| 355 |lllip| 360 |latex| 365
              |enterPointData| 370 |curve?| 376 |curve| 381 |create3Space| 403
              |copy| 412 |components| 417 |coerce| 422 |closedCurve?| 427
              |closedCurve| 432 |check| 454 = 459)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|ThreeSpaceCategory| 6) (|SetCategory|)
                           (|CoercibleTo| 105) (|BasicType|))
                        (|makeByteWordVec2| 110
                                            '(1 9 8 0 10 1 9 11 0 12 1 9 13 0
                                              14 1 9 15 0 16 2 9 0 0 17 18 4 9
                                              0 0 0 17 13 19 0 9 0 21 0 6 0 22
                                              1 9 0 8 26 1 9 8 0 29 1 9 0 0 31
                                              2 9 13 0 17 33 3 9 0 0 13 17 35 2
                                              9 0 0 39 40 1 9 17 0 41 3 9 0 0
                                              39 17 45 1 17 0 46 47 3 9 0 0 39
                                              13 49 2 57 15 55 56 58 1 9 37 0
                                              60 3 9 0 0 39 37 65 1 67 9 0 68 0
                                              73 0 74 2 73 0 13 0 75 1 73 13 0
                                              76 1 73 39 0 77 3 9 0 0 39 11 88
                                              2 39 0 0 0 89 2 11 0 37 37 91 0 6
                                              0 98 2 13 37 0 0 99 1 105 0 104
                                              106 1 13 105 0 107 1 105 0 8 108
                                              2 0 37 0 0 1 1 0 9 0 103 1 0 37 0
                                              69 2 0 0 0 56 72 2 0 0 0 15 20 1
                                              0 0 15 71 1 0 15 0 70 1 0 37 0 38
                                              2 0 0 0 46 48 2 0 0 0 17 43 2 0 0
                                              0 13 50 1 0 17 0 42 1 0 0 17 44 1
                                              0 100 0 101 1 0 13 0 25 3 0 0 0
                                              13 17 36 1 0 37 0 78 4 0 0 0 79
                                              84 11 85 4 0 0 0 79 37 37 81 4 0
                                              0 0 86 84 11 87 4 0 0 0 86 37 37
                                              90 3 0 0 79 37 37 83 1 0 0 79 82
                                              1 0 79 0 80 2 0 0 0 0 28 1 0 0 8
                                              27 1 0 84 0 97 1 0 15 0 92 1 0 95
                                              0 96 1 0 110 0 1 1 0 93 0 94 1 0
                                              104 0 1 2 0 13 0 15 34 1 0 37 0
                                              51 2 0 0 0 56 59 2 0 0 0 15 53 1
                                              0 0 15 54 1 0 15 0 52 1 0 0 9 24
                                              0 0 0 23 1 0 0 0 32 1 0 8 0 30 1
                                              0 105 0 109 1 0 37 0 61 2 0 0 0
                                              15 63 1 0 0 15 64 2 0 0 0 56 66 1
                                              0 15 0 62 1 0 0 0 102 2 0 37 0 0
                                              1)))))
           '|lookupComplete|)) 
