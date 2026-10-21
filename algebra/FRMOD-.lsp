
(SDEFUN |FRMOD-;convert;SV;1| ((|x| (S)) (% (|Vector| R)))
        (SPADCALL |x| (QREFELT % 9))) 

(SDEFUN |FRMOD-;convert;VS;2| ((|v| (|Vector| R)) (% (S)))
        (SPADCALL |v| (QREFELT % 11))) 

(SDEFUN |FRMOD-;coordinates;VM;3| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((|m| (|Matrix| R)) (|j| NIL) (|i| NIL) (#1=#:G13 NIL))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (SPADCALL (QREFELT % 14))
                                    (|spadConstant| % 15)))
                (SEQ (LETT |j| (PROGN |m| 1))
                     (LETT |i| (SPADCALL |v| (QREFELT % 18)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) (QREFELT % 9))
                                 (QREFELT % 20))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FRMOD-;index;PiS;4| ((|i| (|PositiveInteger|)) (% (S)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|j| NIL) (#1=#:G20 NIL)
          (|#G11|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| #2=(|Integer|))))
          (|ii| (|Integer|)) (|i1| #2#) (|l| (|List| R)))
         (SEQ (LETT |m| (SPADCALL (QREFELT % 24))) (LETT |l| NIL)
              (LETT |ii| (- |i| 1))
              (SEQ (LETT |j| 1) (LETT #1# (SPADCALL (QREFELT % 14))) G190
                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G11| (|divide_INT| |ii| |m|))
                     (LETT |ii| (QCAR |#G11|))
                     (LETT |i1| (QCDR |#G11|))
                     |#G11|)
                    (EXIT
                     (LETT |l|
                           (CONS (SPADCALL (+ |i1| 1) (QREFELT % 25)) |l|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (SPADCALL |l| (QREFELT % 27)) (QREFELT % 11)))))) 

(SDEFUN |FRMOD-;lookup;SPi;5| ((|x| (S)) (% (|PositiveInteger|)))
        (SPROG
         ((|v| (|Vector| R)) (|m| (|NonNegativeInteger|)) (|i| NIL)
          (#1=#:G25 NIL) (|res| (|Integer|)))
         (SEQ (LETT |v| (SPADCALL |x| (QREFELT % 9))) (LETT |res| 0)
              (LETT |m| (SPADCALL (QREFELT % 24)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 14))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (-
                            (+ (* |m| |res|)
                               (SPADCALL (SPADCALL |v| |i| (QREFELT % 29))
                                         (QREFELT % 30)))
                            1))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |res| 1))))) 

(SDEFUN |FRMOD-;size;Nni;6| ((% (|NonNegativeInteger|)))
        (EXPT (SPADCALL (QREFELT % 24)) (SPADCALL (QREFELT % 14)))) 

(SDEFUN |FRMOD-;random;S;7| ((% (S)))
        (SPROG ((#1=#:G31 NIL) (|i| NIL) (#2=#:G32 NIL) (#3=#:G30 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# (GETREFV #4=(SPADCALL (QREFELT % 14))))
                  (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (EXIT (SETELT #1# #3# (SPADCALL (QREFELT % 33)))))
                       (LETT #3#
                             (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  #1#)
                 (QREFELT % 11))))) 

(SDEFUN |FRMOD-;hashUpdate!;HsSHs;8|
        ((|s| (|HashState|)) (|x| (S)) (% (|HashState|)))
        (SPADCALL |s| (SPADCALL |x| (QREFELT % 9)) (QREFELT % 36))) 

(DECLAIM (NOTINLINE |FramedModule&;|)) 

(DEFUN |FramedModule&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FramedModule&| DV$1 DV$2))
          (LETT % (GETREFV 39))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Hashable|))
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 28 (CONS (|dispatchFunction| |FRMOD-;index;PiS;4|) %))
             (QSETREFV % 31
                       (CONS (|dispatchFunction| |FRMOD-;lookup;SPi;5|) %))
             (QSETREFV % 32 (CONS (|dispatchFunction| |FRMOD-;size;Nni;6|) %))
             (QSETREFV % 34
                       (CONS (|dispatchFunction| |FRMOD-;random;S;7|) %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 37
                      (CONS (|dispatchFunction| |FRMOD-;hashUpdate!;HsSHs;8|)
                            %))))
          %))) 

(MAKEPROP '|FramedModule&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Vector| 7) (0 . |coordinates|) |FRMOD-;convert;SV;1|
              (5 . |represents|) |FRMOD-;convert;VS;2| (|PositiveInteger|)
              (10 . |rank|) (14 . |0|) (|Integer|) (|Vector| 6)
              (18 . |minIndex|) (|Matrix| 7) (23 . |setRow!|) (|Vector| %)
              |FRMOD-;coordinates;VM;3| (|NonNegativeInteger|) (30 . |size|)
              (34 . |index|) (|List| 7) (39 . |vector|) (44 . |index|)
              (49 . |elt|) (55 . |lookup|) (60 . |lookup|) (65 . |size|)
              (69 . |random|) (73 . |random|) (|HashState|)
              (77 . |hashUpdate!|) (83 . |hashUpdate!|) (|InputForm|))
           '#(|size| 89 |random| 93 |lookup| 97 |index| 102 |hashUpdate!| 107
              |coordinates| 113 |convert| 118)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|convert| ((|InputForm|) |#1|)) T)
                                   '((|hashUpdate!|
                                      ((|HashState|) (|HashState|) |#1|))
                                     T)
                                   '((|size| ((|NonNegativeInteger|))) T)
                                   '((|index| (|#1| (|PositiveInteger|))) T)
                                   '((|lookup| ((|PositiveInteger|) |#1|)) T)
                                   '((|random| (|#1|)) T)
                                   '((|convert| (|#1| (|Vector| |#2|))) T)
                                   '((|convert| ((|Vector| |#2|) |#1|)) T)
                                   '((|coordinates|
                                      ((|Matrix| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|coordinates| ((|Vector| |#2|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 37
                                            '(1 6 8 0 9 1 6 0 8 11 0 6 13 14 0
                                              7 0 15 1 17 16 0 18 3 19 0 0 16 8
                                              20 0 7 23 24 1 7 0 13 25 1 8 0 26
                                              27 1 0 0 13 28 2 8 7 0 16 29 1 7
                                              13 0 30 1 0 13 0 31 0 0 23 32 0 7
                                              0 33 0 0 0 34 2 8 35 35 0 36 2 0
                                              35 35 0 37 0 0 23 32 0 0 0 34 1 0
                                              13 0 31 1 0 0 13 28 2 0 35 35 0
                                              37 1 0 19 21 22 1 0 8 0 10 1 0 0
                                              8 12)))))
           '|lookupComplete|)) 
