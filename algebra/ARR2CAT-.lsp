
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| (|Mapping| (|Boolean|) R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G118 NIL) (|j| NIL) (#2=#:G119 NIL) (#3=#:G117 NIL)
          (#4=#:G116 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15))
                                      |f|)
                            (PROGN
                             (LETT #4# (PROGN (LETT #3# 'T) (GO #5=#:G115)))
                             (GO #6=#:G111))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #4#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #3#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| (|Mapping| (|Boolean|) R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G129 NIL) (|j| NIL) (#2=#:G130 NIL) (#3=#:G128 NIL)
          (#4=#:G127 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15))
                                       |f|))
                            (PROGN
                             (LETT #4# (PROGN (LETT #3# NIL) (GO #5=#:G126)))
                             (GO #6=#:G123))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #4#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #3#)))) 

(SDEFUN |ARR2CAT-;size?;SNniB;3|
        ((|m| (S)) (|n| (|NonNegativeInteger|)) (% (|Boolean|)))
        (EQL (* (SPADCALL |m| (QREFELT % 21)) (SPADCALL |m| (QREFELT % 22)))
             |n|)) 

(SDEFUN |ARR2CAT-;less?;SNniB;4|
        ((|m| (S)) (|n| (|NonNegativeInteger|)) (% (|Boolean|)))
        (< (* (SPADCALL |m| (QREFELT % 21)) (SPADCALL |m| (QREFELT % 22))) |n|)) 

(SDEFUN |ARR2CAT-;more?;SNniB;5|
        ((|m| (S)) (|n| (|NonNegativeInteger|)) (% (|Boolean|)))
        (> (* (SPADCALL |m| (QREFELT % 21)) (SPADCALL |m| (QREFELT % 22))) |n|)) 

(SDEFUN |ARR2CAT-;smaller?;2SB;6| ((|m1| (S)) (|m2| (S)) (% (|Boolean|)))
        (SPROG
         ((|minRowIndex| #1=(|Integer|)) (|mri1| #1#) (|mri2| #1#)
          (|maxRowIndex| (|Integer|)) (|minColIndex| #2=(|Integer|))
          (|mci1| #2#) (|mci2| #2#) (|maxColIndex| (|Integer|)) (|i| NIL)
          (#3=#:G146 NIL) (|j| NIL) (#4=#:G147 NIL) (|el1| (R)) (|el2| (R))
          (#5=#:G145 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |mri1| (SPADCALL |m1| (QREFELT % 11)))
                (LETT |mri2| (SPADCALL |m2| (QREFELT % 11)))
                (EXIT
                 (COND ((< |mri1| |mri2|) 'T) ((< |mri2| |mri1|) NIL)
                       (#6='T
                        (SEQ (LETT |minRowIndex| |mri1|)
                             (LETT |mri1| (SPADCALL |m1| (QREFELT % 12)))
                             (LETT |mri2| (SPADCALL |m2| (QREFELT % 12)))
                             (EXIT
                              (COND ((< |mri1| |mri2|) 'T)
                                    ((< |mri2| |mri1|) NIL)
                                    (#6#
                                     (SEQ (LETT |maxRowIndex| |mri1|)
                                          (LETT |mci1|
                                                (SPADCALL |m1| (QREFELT % 13)))
                                          (LETT |mci2|
                                                (SPADCALL |m2| (QREFELT % 13)))
                                          (EXIT
                                           (COND ((< |mci1| |mci2|) 'T)
                                                 ((< |mci2| |mci1|) NIL)
                                                 (#6#
                                                  (SEQ
                                                   (LETT |minColIndex| |mci1|)
                                                   (LETT |mci1|
                                                         (SPADCALL |m1|
                                                                   (QREFELT %
                                                                            14)))
                                                   (LETT |mci2|
                                                         (SPADCALL |m2|
                                                                   (QREFELT %
                                                                            14)))
                                                   (EXIT
                                                    (COND
                                                     ((< |mci1| |mci2|) 'T)
                                                     ((< |mci2| |mci1|) NIL)
                                                     (#6#
                                                      (SEQ
                                                       (LETT |maxColIndex|
                                                             |mci1|)
                                                       (SEQ
                                                        (LETT |i|
                                                              |minRowIndex|)
                                                        (LETT #3#
                                                              |maxRowIndex|)
                                                        G190
                                                        (COND
                                                         ((> |i| #3#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ
                                                           (LETT |j|
                                                                 |minColIndex|)
                                                           (LETT #4#
                                                                 |maxColIndex|)
                                                           G190
                                                           (COND
                                                            ((> |j| #4#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |el1|
                                                                  (SPADCALL
                                                                   |m1| |i| |j|
                                                                   (QREFELT %
                                                                            26)))
                                                            (LETT |el2|
                                                                  (SPADCALL
                                                                   |m2| |i| |j|
                                                                   (QREFELT %
                                                                            26)))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |el1|
                                                                         |el2|
                                                                         (QREFELT
                                                                          %
                                                                          27))
                                                               (PROGN
                                                                (LETT #5# 'T)
                                                                (GO
                                                                 #7=#:G144)))
                                                              ((NULL
                                                                (SPADCALL |el1|
                                                                          |el2|
                                                                          (QREFELT
                                                                           %
                                                                           28)))
                                                               (PROGN
                                                                (LETT #5# NIL)
                                                                (GO #7#))))))
                                                           (LETT |j| (+ |j| 1))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                        (LETT |i| (+ |i| 1))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (EXIT
                                                        NIL)))))))))))))))))))
          #7# (EXIT #5#)))) 

(SDEFUN |ARR2CAT-;#;SNni;7| ((|m| (S)) (% (|NonNegativeInteger|)))
        (* (SPADCALL |m| (QREFELT % 21)) (SPADCALL |m| (QREFELT % 22)))) 

(SDEFUN |ARR2CAT-;elt;S2I2R;8|
        ((|m| (S)) (|i| (|Integer|)) (|j| (|Integer|)) (|r| (R)) (% (R)))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT % 11)))
              (> |i| (SPADCALL |m| (QREFELT % 12))))
          |r|)
         ((OR (< |j| (SPADCALL |m| (QREFELT % 13)))
              (> |j| (SPADCALL |m| (QREFELT % 14))))
          |r|)
         ('T (SPADCALL |m| |i| |j| (QREFELT % 15))))) 

(SDEFUN |ARR2CAT-;count;MSNni;9|
        ((|f| (|Mapping| (|Boolean|) R)) (|m| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|i| NIL) (#1=#:G162 NIL) (|j| NIL) (#2=#:G163 NIL)
          (|num| (|NonNegativeInteger|)))
         (SEQ (LETT |num| 0)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                   (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                          (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                          (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15))
                                        |f|)
                              (LETT |num| (+ |num| 1))))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |num|)))) 

(SDEFUN |ARR2CAT-;parts;SL;10| ((|m| (S)) (% (|List| R)))
        (SPROG
         ((|i| NIL) (#1=#:G170 NIL) (|j| NIL) (#2=#:G171 NIL)
          (|entryList| (|List| R)))
         (SEQ (LETT |entryList| NIL)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 12)))
                   (LETT #1# (SPADCALL |m| (QREFELT % 11))) G190
                   (COND ((< |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 14)))
                          (LETT #2# (SPADCALL |m| (QREFELT % 13))) G190
                          (COND ((< |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |entryList|
                                  (CONS (SPADCALL |m| |i| |j| (QREFELT % 15))
                                        |entryList|))))
                          (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |entryList|)))) 

(SDEFUN |ARR2CAT-;listOfLists;SL;11| ((|x| (S)) (% (|List| (|List| R))))
        (SPROG
         ((|i| NIL) (#1=#:G179 NIL) (|j| NIL) (#2=#:G180 NIL) (|l| (|List| R))
          (|ll| (|List| (|List| R))))
         (SEQ (LETT |ll| NIL)
              (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 12)))
                   (LETT #1# (SPADCALL |x| (QREFELT % 11))) G190
                   (COND ((< |i| #1#) (GO G191)))
                   (SEQ (LETT |l| NIL)
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 14)))
                             (LETT #2# (SPADCALL |x| (QREFELT % 13))) G190
                             (COND ((< |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |l|
                                     (CONS
                                      (SPADCALL |x| |i| |j| (QREFELT % 15))
                                      |l|))))
                             (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |ll| (CONS |l| |ll|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |ll|)))) 

(SDEFUN |ARR2CAT-;subMatrix;S4IS;12|
        ((|x| (S)) (|i1| (|Integer|)) (|i2| (|Integer|)) (|j1| (|Integer|))
         (|j2| (|Integer|)) (% (S)))
        (SPROG
         ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|y| (S)) (|k| NIL)
          (#2=#:G194 NIL) (|i| NIL) (#3=#:G193 NIL) (|l| NIL) (#4=#:G196 NIL)
          (|j| NIL) (#5=#:G195 NIL))
         (SEQ
          (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
                ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
                ('T
                 (SEQ (LETT |rows| (+ (- |i2| |i1|) 1))
                      (LETT |cols| (+ (- |j2| |j1|) 1))
                      (LETT |y| (SPADCALL |rows| |cols| (QREFELT % 37)))
                      (COND ((OR (EQL |rows| 0) (EQL |cols| 0)) (EXIT |y|)))
                      (COND
                       ((OR (< |i1| (SPADCALL |x| (QREFELT % 11)))
                            (> |i2| (SPADCALL |x| (QREFELT % 12))))
                        (EXIT (|error| "subMatrix: index out of range"))))
                      (COND
                       ((OR (< |j1| (SPADCALL |x| (QREFELT % 13)))
                            (> |j2| (SPADCALL |x| (QREFELT % 14))))
                        (EXIT (|error| "subMatrix: index out of range"))))
                      (SEQ (LETT |k| |i1|) (LETT #2# |i2|)
                           (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                           (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                           (COND ((OR (> |i| #3#) (> |k| #2#)) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |l| |j1|) (LETT #4# |j2|)
                                  (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                  (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                                  (COND
                                   ((OR (> |j| #5#) (> |l| #4#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |y| |i| |j|
                                              (SPADCALL |x| |k| |l|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SILS;13|
        ((|x| (S)) (|row| (|Integer|)) (|colList| (|List| (|Integer|)))
         (% (S)))
        (SPROG
         ((#1=#:G208 NIL) (#2=#:G207 NIL) (|y| (S)) (|j| NIL) (#3=#:G210 NIL)
          (|ej| NIL) (#4=#:G209 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT % 11)))
                (> |row| (SPADCALL |x| (QREFELT % 12))))
            (|error| "elt: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #1# |colList|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                            (> |ej| (SPADCALL |x| (QREFELT % 14))))
                        (PROGN
                         (LETT #2# (|error| "elt: index out of range"))
                         (GO #5=#:G202))))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #2#))
             (LETT |y| (SPADCALL 1 (LENGTH |colList|) (QREFELT % 37)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                  (LETT #3# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                  (LETT #4# |colList|) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL)
                        (> |j| #3#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| 1 |j|
                              (SPADCALL |x| |row| |ej| (QREFELT % 15))
                              (QREFELT % 38))))
                  (LETT #4# (PROG1 (CDR #4#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;14|
        ((|x| (S)) (|rowList| (|List| (|Integer|))) (|col| (|Integer|))
         (% (S)))
        (SPROG
         ((#1=#:G222 NIL) (#2=#:G221 NIL) (|y| (S)) (|i| NIL) (#3=#:G224 NIL)
          (|ei| NIL) (#4=#:G223 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #1# |rowList|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #2# (|error| "elt: index out of range"))
                      (GO #5=#:G214))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #2#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT % 13)))
                (> |col| (SPADCALL |x| (QREFELT % 14))))
            (EXIT (|error| "elt: index out of range"))))
          (LETT |y| (SPADCALL (LENGTH |rowList|) 1 (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #3# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #4# |rowList|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL) (> |i| #3#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| 1 (SPADCALL |x| |ei| |col| (QREFELT % 15))
                           (QREFELT % 38))))
               (LETT #4# (PROG1 (CDR #4#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;15|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|colList| (|List| (|Integer|))) (% (S)))
        (SPROG
         ((#1=#:G241 NIL) (#2=#:G240 NIL) (#3=#:G242 NIL) (#4=#:G239 NIL)
          (|y| (S)) (|i| NIL) (#5=#:G244 NIL) (|ei| NIL) (#6=#:G243 NIL)
          (|j| NIL) (#7=#:G246 NIL) (|ej| NIL) (#8=#:G245 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #1# |rowList|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #2# (|error| "elt: index out of range"))
                      (GO #9=#:G228))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #2#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #3# |colList|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |ej| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                         (> |ej| (SPADCALL |x| (QREFELT % 14))))
                     (PROGN
                      (LETT #4# (|error| "elt: index out of range"))
                      (GO #10=#:G232))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #4#))
          (LETT |y|
                (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                          (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #5# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #6# |rowList|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |ei| (CAR #6#)) NIL) (> |i| #5#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                      (LETT #7# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                      (LETT #8# |colList|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |ej| (CAR #8#)) NIL)
                            (> |j| #7#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |ei| |ej| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT #8# (PROG1 (CDR #8#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #6# (PROG1 (CDR #6#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_seg|
        ((|s| (|Segment| (|Integer|))) (|lb| (|Integer|)) (|ub| (|Integer|))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|i1| (|Integer|)) (|i2| (|Integer|)) (|ii| (|Integer|))
          (|cc| (|NonNegativeInteger|)))
         (SEQ (LETT |ii| (SPADCALL |s| (QREFELT % 45)))
              (LETT |i1| (SPADCALL |s| (QREFELT % 46)))
              (LETT |i2| (SPADCALL |s| (QREFELT % 47)))
              (COND
               ((> |ii| 0)
                (COND
                 ((< (+ |i2| 1) |i1|)
                  (EXIT (|error| #1="check_seg: bad indices")))
                 ((< |ii| 0)
                  (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #1#)))))))
               ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #1#))))))
              (COND
               ((> |i1| |i2|)
                (COND ((> |ii| 0) (EXIT 0))
                      ((> |i2| |i1|) (COND ((< |ii| 0) (EXIT 0))))))
               ((> |i2| |i1|) (COND ((< |ii| 0) (EXIT 0)))))
              (EXIT
               (COND
                ((< 0 |ii|)
                 (COND
                  ((< (+ |i2| 1) |i1|)
                   (|error| "check_seg: index out of range"))
                  (#2='T
                   (SEQ (LETT |cc| (+ (- |i2| |i1|) |ii|))
                        (EXIT
                         (COND ((< |cc| |ii|) |cc|)
                               ((OR (< |i1| |lb|) (< |ub| |i2|))
                                (|error| "check_seg: index out of range"))
                               (#3='T
                                (COND ((EQL |ii| 1) |cc|)
                                      (#2# (|quotient_INT| |cc| |ii|))))))))))
                ((< |ii| 0)
                 (SEQ (LETT |ii| (- |ii|))
                      (COND
                       ((OR (OR (< (+ |i1| 1) |i2|) (< |i2| |lb|))
                            (< |ub| |i1|))
                        (EXIT (|error| "check_seg: index out of range"))))
                      (LETT |cc| (+ (- |i1| |i2|) |ii|))
                      (EXIT
                       (COND ((< |cc| |ii|) |cc|)
                             ((OR (< |i2| |lb|) (< |ub| |i1|))
                              (|error| "check_seg: index out of range"))
                             (#3#
                              (COND ((EQL |ii| 1) |cc|)
                                    (#2# (|quotient_INT| |cc| |ii|))))))))
                (#2# (|error| "check_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;SLSS;17|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((|lc| (|Integer|)) (|uc| (|Integer|)) (|ic| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|y| (S))
          (|k| NIL) (#1=#:G265 NIL) (|i| NIL) (#2=#:G264 NIL) (|l| NIL)
          (#3=#:G268 NIL) (#4=#:G267 NIL) (|j| NIL) (#5=#:G266 NIL))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr| (LENGTH |rowList|))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| NIL) (LETT #1# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #2# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #2#) (ATOM #1#)
                         (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #4# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #5#)
                                (IF (MINUSP #4#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #4#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SSLS;18|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|colList| (|List| (|Integer|))) (% (S)))
        (SPROG
         ((|lr| (|Integer|)) (|ur| (|Integer|)) (|ir| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|y| (S))
          (|k| NIL) (#1=#:G277 NIL) (#2=#:G276 NIL) (|i| NIL) (#3=#:G275 NIL)
          (|l| NIL) (#4=#:G279 NIL) (|j| NIL) (#5=#:G278 NIL))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc| (LENGTH |colList|))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #1# |ur|) (LETT #2# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #2#)
                             (< |k| #1#)
                             (> |k| #1#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #4# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #5#) (ATOM #4#)
                                (PROGN (LETT |l| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2SS;19|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((|lr| #1=(|Integer|)) (|ur| #2=(|Integer|)) (|lc| #1#) (|uc| #2#)
          (|ir| #3=(|Integer|)) (|ic| #3#) (|nr| #4=(|NonNegativeInteger|))
          (|nc| #4#) (|y| (S)) (|k| NIL) (#5=#:G288 NIL) (#6=#:G287 NIL)
          (|i| NIL) (#7=#:G286 NIL) (|l| NIL) (#8=#:G291 NIL) (#9=#:G290 NIL)
          (|j| NIL) (#10=#:G289 NIL))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (COND
               ((EQL |ir| 1)
                (COND
                 ((EQL |ic| 1)
                  (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT % 50)))))))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #6# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #7# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #7#)
                         (IF (MINUSP #6#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #8# |uc|) (LETT #9# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #10# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #10#)
                                (IF (MINUSP #9#)
                                    (< |l| #8#)
                                    (> |l| #8#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #9#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #6#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| (|List| (|Segment| (|Integer|)))) (|lb| (|Integer|))
         (|ub| (|Integer|)) (% (|NonNegativeInteger|)))
        (SPROG ((|s| NIL) (#1=#:G296 NIL) (|res| (|NonNegativeInteger|)))
               (SEQ (LETT |res| 0)
                    (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (+ |res|
                                    (|ARR2CAT-;check_seg| |s| |lb| |ub| %)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ARR2CAT-;elt;SILS;21|
        ((|x| (S)) (|row| (|Integer|)) (|lsc| (|List| (|Segment| (|Integer|))))
         (% (S)))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|y| (S)) (|sc| NIL) (#1=#:G305 NIL)
          (|l| NIL) (#2=#:G307 NIL) (#3=#:G306 NIL) (|j| (|Integer|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                 (SPADCALL |x| (QREFELT % 14)) %))
          (LETT |y| (SPADCALL 1 |nc| (QREFELT % 37)))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                       (SEQ (LETT |sc| NIL) (LETT #1# |lsc|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |sc| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                                   (LETT #3# (SPADCALL |sc| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #3#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| 1 |j|
                                              (SPADCALL |x| |row| |l|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #3#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;22|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|)))) (|col| (|Integer|))
         (% (S)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|y| (S)) (|sr| NIL) (#1=#:G316 NIL)
          (|k| NIL) (#2=#:G318 NIL) (#3=#:G317 NIL) (|i| (|Integer|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                 (SPADCALL |x| (QREFELT % 12)) %))
          (LETT |y| (SPADCALL |nr| 1 (QREFELT % 37)))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                       (SEQ (LETT |sr| NIL) (LETT #1# |lsr|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                                   (LETT #3# (SPADCALL |sr| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #3#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| |i| 1
                                              (SPADCALL |x| |k| |col|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #3#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SSLS;23|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|lsc| (|List| (|Segment| (|Integer|)))) (% (S)))
        (SPROG
         ((|lr| (|Integer|)) (|ur| (|Integer|)) (|ir| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|y| (S))
          (|sc| NIL) (#1=#:G328 NIL) (|l| NIL) (#2=#:G330 NIL) (#3=#:G329 NIL)
          (|k| NIL) (#4=#:G333 NIL) (#5=#:G332 NIL) (|i| NIL) (#6=#:G331 NIL)
          (|j| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |j| (SPADCALL |y| (QREFELT % 13)))
              (SEQ (LETT |sc| NIL) (LETT #1# |lsc|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sc| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                          (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                          (LETT #3# (SPADCALL |sc| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #3#)
                                (< |l| #2#)
                                (> |l| #2#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #4# |ur|) (LETT #5# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                                (LETT #6# (SPADCALL |y| (QREFELT % 12))) G190
                                (COND
                                 ((OR (> |i| #6#)
                                      (IF (MINUSP #5#)
                                          (< |k| #4#)
                                          (> |k| #4#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SLSS;24|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((|lc| (|Integer|)) (|uc| (|Integer|)) (|ic| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|y| (S))
          (|sr| NIL) (#1=#:G343 NIL) (|k| NIL) (#2=#:G345 NIL) (#3=#:G344 NIL)
          (|l| NIL) (#4=#:G348 NIL) (#5=#:G347 NIL) (|j| NIL) (#6=#:G346 NIL)
          (|i| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |i| (SPADCALL |y| (QREFELT % 11)))
              (SEQ (LETT |sr| NIL) (LETT #1# |lsr|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                          (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                          (LETT #3# (SPADCALL |sr| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #3#)
                                (< |k| #2#)
                                (> |k| #2#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #4# |uc|) (LETT #5# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                (LETT #6# (SPADCALL |y| (QREFELT % 14))) G190
                                (COND
                                 ((OR (> |j| #6#)
                                      (IF (MINUSP #5#)
                                          (< |l| #4#)
                                          (> |l| #4#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #5#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;25|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|lsc| (|List| (|Segment| (|Integer|)))) (% (S)))
        (SPROG
         ((|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|y| (S)) (|sr| NIL)
          (#2=#:G362 NIL) (|lr| (|Integer|)) (|ur| (|Integer|))
          (|ir| (|Integer|)) (|k| NIL) (#3=#:G364 NIL) (#4=#:G363 NIL)
          (|sc| NIL) (#5=#:G365 NIL) (|l| NIL) (#6=#:G367 NIL) (#7=#:G366 NIL)
          (|j| (|Integer|)) (|i| (|Integer|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                 (SPADCALL |x| (QREFELT % 12)) %))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                 (SPADCALL |x| (QREFELT % 14)) %))
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT % 11)))
          (SEQ (LETT |sr| NIL) (LETT #2# |lsr|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sr| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #3#)
                                (> |k| #3#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                               (SEQ (LETT |sc| NIL) (LETT #5# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |sc| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT % 46)))
                                       (LETT #6#
                                             (SPADCALL |sc| (QREFELT % 47)))
                                       (LETT #7#
                                             (SPADCALL |sc| (QREFELT % 45)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #7#)
                                             (< |l| #6#)
                                             (> |l| #6#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |y| |i| |j|
                                                  (SPADCALL |x| |k| |l|
                                                            (QREFELT % 15))
                                                  (QREFELT % 38))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #7#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;rowSlice;SS;26| ((|x| (S)) (% (|Segment| (|Integer|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 58))) 

(SDEFUN |ARR2CAT-;colSlice;SS;27| ((|x| (S)) (% (|Segment| (|Integer|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |x| (QREFELT % 14))
                  (QREFELT % 58))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;28|
        ((|x| (S)) (|row| (|Integer|)) (|colList| (|List| (|Integer|)))
         (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G383 NIL) (#2=#:G382 NIL) (|rowiy| (|Integer|)) (|j| NIL)
          (#3=#:G385 NIL) (|ej| NIL) (#4=#:G384 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT % 11)))
                (> |row| (SPADCALL |x| (QREFELT % 12))))
            (|error| "setelt!: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #1# |colList|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                            (> |ej| (SPADCALL |x| (QREFELT % 14))))
                        (PROGN
                         (LETT #2# (|error| "setelt!: index out of range"))
                         (GO #5=#:G375))))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #2#))
             (COND
              ((OR (SPADCALL (SPADCALL |y| (QREFELT % 21)) 1 (QREFELT % 61))
                   (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT % 22))
                             (QREFELT % 61)))
               (EXIT (|error| "setelt!: matrix has bad dimensions"))))
             (LETT |rowiy| (SPADCALL |y| (QREFELT % 11)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                  (LETT #3# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                  (LETT #4# |colList|) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL)
                        (> |j| #3#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |row| |ej|
                              (SPADCALL |y| |rowiy| |j| (QREFELT % 15))
                              (QREFELT % 38))))
                  (LETT #4# (PROG1 (CDR #4#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;29|
        ((|x| (S)) (|rowList| (|List| (|Integer|))) (|col| (|Integer|))
         (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G399 NIL) (#2=#:G398 NIL) (|coliy| (|Integer|)) (|i| NIL)
          (#3=#:G401 NIL) (|ei| NIL) (#4=#:G400 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #1# |rowList|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #2# (|error| "setelt!: index out of range"))
                      (GO #5=#:G389))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #2#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT % 13)))
                (> |col| (SPADCALL |x| (QREFELT % 14))))
            (EXIT (|error| "setelt!: index out of range"))))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT % 21))
                       (QREFELT % 61))
             (SPADCALL (SPADCALL |y| (QREFELT % 22)) 1 (QREFELT % 61)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (LETT |coliy| (SPADCALL |y| (QREFELT % 13)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #3# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #4# |rowList|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL) (> |i| #3#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |ei| |col|
                           (SPADCALL |y| |i| |coliy| (QREFELT % 15))
                           (QREFELT % 38))))
               (LETT #4# (PROG1 (CDR #4#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;30|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|colList| (|List| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G420 NIL) (#2=#:G419 NIL) (#3=#:G421 NIL) (#4=#:G418 NIL)
          (|i| NIL) (#5=#:G423 NIL) (|ei| NIL) (#6=#:G422 NIL) (|j| NIL)
          (#7=#:G425 NIL) (|ej| NIL) (#8=#:G424 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #1# |rowList|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #2# (|error| "setelt!: index out of range"))
                      (GO #9=#:G405))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #2#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #3# |colList|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |ej| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                         (> |ej| (SPADCALL |x| (QREFELT % 14))))
                     (PROGN
                      (LETT #4# (|error| "setelt!: index out of range"))
                      (GO #10=#:G409))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #4#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT % 21))
                       (QREFELT % 61))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT % 22))
                       (QREFELT % 61)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #5# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #6# |rowList|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |ei| (CAR #6#)) NIL) (> |i| #5#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                      (LETT #7# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                      (LETT #8# |colList|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |ej| (CAR #8#)) NIL)
                            (> |j| #7#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |ei| |ej|
                                  (SPADCALL |y| |i| |j| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT #8# (PROG1 (CDR #8#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #6# (PROG1 (CDR #6#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2S2S;31|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((|lr| #1=(|Integer|)) (|ur| #2=(|Integer|)) (|lc| #1#) (|uc| #2#)
          (|ir| #3=(|Integer|)) (|ic| #3#) (|nr| #4=(|NonNegativeInteger|))
          (|nc| #4#) (|k| NIL) (#5=#:G436 NIL) (#6=#:G435 NIL) (|i| NIL)
          (#7=#:G434 NIL) (|l| NIL) (#8=#:G439 NIL) (#9=#:G438 NIL) (|j| NIL)
          (#10=#:G437 NIL))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                 (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #6# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #7# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #7#)
                         (IF (MINUSP #6#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #8# |uc|) (LETT #9# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #10# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #10#)
                                (IF (MINUSP #9#)
                                    (< |l| #8#)
                                    (> |l| #8#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #9#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #6#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;32|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((|lc| (|Integer|)) (|uc| (|Integer|)) (|ic| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|k| NIL)
          (#1=#:G449 NIL) (|i| NIL) (#2=#:G448 NIL) (|l| NIL) (#3=#:G452 NIL)
          (#4=#:G451 NIL) (|j| NIL) (#5=#:G450 NIL))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr| (LENGTH |rowList|))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                 (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| NIL) (LETT #1# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #2# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #2#) (ATOM #1#)
                         (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #4# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #5#)
                                (IF (MINUSP #4#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #4#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;33|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|colList| (|List| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((|lr| (|Integer|)) (|ur| (|Integer|)) (|ir| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|k| NIL)
          (#1=#:G463 NIL) (#2=#:G462 NIL) (|i| NIL) (#3=#:G461 NIL) (|l| NIL)
          (#4=#:G465 NIL) (|j| NIL) (#5=#:G464 NIL))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc| (LENGTH |colList|))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                 (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #1# |ur|) (LETT #2# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #2#)
                             (< |k| #1#)
                             (> |k| #1#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #4# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #5#) (ATOM #4#)
                                (PROGN (LETT |l| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;34|
        ((|x| (S)) (|row| (|Integer|)) (|lsc| (|List| (|Segment| (|Integer|))))
         (|y| (S)) (% (S)))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|i| (|Integer|)) (|sc| NIL)
          (#1=#:G476 NIL) (|l| NIL) (#2=#:G478 NIL) (#3=#:G477 NIL)
          (|j| (|Integer|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                 (SPADCALL |x| (QREFELT % 14)) %))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT % 21)) 1 (QREFELT % 65))
                (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                       (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                       (SEQ (LETT |sc| NIL) (LETT #1# |lsc|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |sc| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                                   (LETT #3# (SPADCALL |sc| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #3#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |row| |l|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #3#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;35|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|)))) (|col| (|Integer|))
         (|y| (S)) (% (S)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|j| (|Integer|)) (|sr| NIL)
          (#1=#:G489 NIL) (|k| NIL) (#2=#:G491 NIL) (#3=#:G490 NIL)
          (|i| (|Integer|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                 (SPADCALL |x| (QREFELT % 12)) %))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                (SPADCALL (SPADCALL |y| (QREFELT % 22)) 1 (QREFELT % 65)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                       (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                       (SEQ (LETT |sr| NIL) (LETT #1# |lsr|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                                   (LETT #3# (SPADCALL |sr| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #3#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |k| |col|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #3#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;36|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|lsc| (|List| (|Segment| (|Integer|)))) (|y| (S)) (% (S)))
        (SPROG
         ((|lr| (|Integer|)) (|ur| (|Integer|)) (|ir| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (|sc| NIL) (#1=#:G503 NIL) (|l| NIL) (#2=#:G505 NIL) (#3=#:G504 NIL)
          (|k| NIL) (#4=#:G508 NIL) (#5=#:G507 NIL) (|i| NIL) (#6=#:G506 NIL)
          (|j| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                 (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |j| (SPADCALL |y| (QREFELT % 13)))
              (SEQ (LETT |sc| NIL) (LETT #1# |lsc|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sc| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                          (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                          (LETT #3# (SPADCALL |sc| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #3#)
                                (< |l| #2#)
                                (> |l| #2#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #4# |ur|) (LETT #5# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                                (LETT #6# (SPADCALL |y| (QREFELT % 12))) G190
                                (COND
                                 ((OR (> |i| #6#)
                                      (IF (MINUSP #5#)
                                          (< |k| #4#)
                                          (> |k| #4#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;37|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((|lc| (|Integer|)) (|uc| (|Integer|)) (|ic| (|Integer|))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (|sr| NIL) (#1=#:G520 NIL) (|k| NIL) (#2=#:G522 NIL) (#3=#:G521 NIL)
          (|l| NIL) (#4=#:G525 NIL) (#5=#:G524 NIL) (|j| NIL) (#6=#:G523 NIL)
          (|i| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                 (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |i| (SPADCALL |y| (QREFELT % 11)))
              (SEQ (LETT |sr| NIL) (LETT #1# |lsr|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                          (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                          (LETT #3# (SPADCALL |sr| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #3#)
                                (< |k| #2#)
                                (> |k| #2#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #4# |uc|) (LETT #5# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                (LETT #6# (SPADCALL |y| (QREFELT % 14))) G190
                                (COND
                                 ((OR (> |j| #6#)
                                      (IF (MINUSP #5#)
                                          (< |l| #4#)
                                          (> |l| #4#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #5#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;38|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|lsc| (|List| (|Segment| (|Integer|)))) (|y| (S)) (% (S)))
        (SPROG
         ((|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|sr| NIL)
          (#2=#:G541 NIL) (|lr| (|Integer|)) (|ur| (|Integer|))
          (|ir| (|Integer|)) (|k| NIL) (#3=#:G543 NIL) (#4=#:G542 NIL)
          (|sc| NIL) (#5=#:G544 NIL) (|l| NIL) (#6=#:G546 NIL) (#7=#:G545 NIL)
          (|j| (|Integer|)) (|i| (|Integer|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                 (SPADCALL |x| (QREFELT % 12)) %))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                 (SPADCALL |x| (QREFELT % 14)) %))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT % 21)) |nr| (QREFELT % 65))
                (SPADCALL (SPADCALL |y| (QREFELT % 22)) |nc| (QREFELT % 65)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT % 11)))
          (SEQ (LETT |sr| NIL) (LETT #2# |lsr|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sr| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #3#)
                                (> |k| #3#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                               (SEQ (LETT |sc| NIL) (LETT #5# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |sc| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT % 46)))
                                       (LETT #6#
                                             (SPADCALL |sc| (QREFELT % 47)))
                                       (LETT #7#
                                             (SPADCALL |sc| (QREFELT % 45)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #7#)
                                             (< |l| #6#)
                                             (> |l| #6#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |x| |k| |l|
                                                  (SPADCALL |y| |i| |j|
                                                            (QREFELT % 15))
                                                  (QREFELT % 38))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #7#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;39|
        ((|x| (S)) (|i1| (|Integer|)) (|j1| (|Integer|)) (|y| (S)) (% (S)))
        (SPROG
         ((|i2| #1=(|Integer|)) (|j2| #1#) (|k| NIL) (#2=#:G559 NIL) (|i| NIL)
          (#3=#:G558 NIL) (|l| NIL) (#4=#:G561 NIL) (|j| NIL) (#5=#:G560 NIL))
         (SEQ (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT % 21))) 1))
              (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT % 22))) 1))
              (COND
               ((OR (< |i1| (SPADCALL |x| (QREFELT % 11)))
                    (> |i2| (SPADCALL |x| (QREFELT % 12))))
                (EXIT
                 (|error|
                  (SPADCALL "setsubMatrix!: inserted matrix too big, "
                            "use subMatrix to restrict it" (QREFELT % 75))))))
              (COND
               ((OR (< |j1| (SPADCALL |x| (QREFELT % 13)))
                    (> |j2| (SPADCALL |x| (QREFELT % 14))))
                (EXIT
                 (|error|
                  (SPADCALL "setsubMatrix!: inserted matrix too big, "
                            "use subMatrix to restrict it" (QREFELT % 75))))))
              (SEQ (LETT |k| |i1|) (LETT #2# |i2|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND ((OR (> |i| #3#) (> |k| #2#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |j1|) (LETT #4# |j2|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #5# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND ((OR (> |j| #5#) (> |l| #4#)) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |x|)))) 

(SDEFUN |ARR2CAT-;swapRows!;S2IS;40|
        ((|x| (S)) (|i1| (|Integer|)) (|i2| (|Integer|)) (% (S)))
        (SPROG ((|j| NIL) (#1=#:G572 NIL) (|r| (R)))
               (SEQ
                (COND
                 ((OR (< |i1| (SPADCALL |x| (QREFELT % 11)))
                      (OR (> |i1| (SPADCALL |x| (QREFELT % 12)))
                          (OR (< |i2| (SPADCALL |x| (QREFELT % 11)))
                              (> |i2| (SPADCALL |x| (QREFELT % 12))))))
                  (|error| "swapRows!: index out of range"))
                 ('T
                  (COND ((EQL |i1| |i2|) |x|)
                        ('T
                         (SEQ
                          (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 13)))
                               (LETT #1# (SPADCALL |x| (QREFELT % 14))) G190
                               (COND ((> |j| #1#) (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL |x| |i1| |j| (QREFELT % 15)))
                                (SPADCALL |x| |i1| |j|
                                          (SPADCALL |x| |i2| |j|
                                                    (QREFELT % 15))
                                          (QREFELT % 38))
                                (EXIT
                                 (SPADCALL |x| |i2| |j| |r| (QREFELT % 38))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;swapColumns!;S2IS;41|
        ((|x| (S)) (|j1| (|Integer|)) (|j2| (|Integer|)) (% (S)))
        (SPROG ((|i| NIL) (#1=#:G583 NIL) (|r| (R)))
               (SEQ
                (COND
                 ((OR (< |j1| (SPADCALL |x| (QREFELT % 13)))
                      (OR (> |j1| (SPADCALL |x| (QREFELT % 14)))
                          (OR (< |j2| (SPADCALL |x| (QREFELT % 13)))
                              (> |j2| (SPADCALL |x| (QREFELT % 14))))))
                  (|error| "swapColumns!: index out of range"))
                 ('T
                  (COND ((EQL |j1| |j2|) |x|)
                        ('T
                         (SEQ
                          (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 11)))
                               (LETT #1# (SPADCALL |x| (QREFELT % 12))) G190
                               (COND ((> |i| #1#) (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL |x| |i| |j1| (QREFELT % 15)))
                                (SPADCALL |x| |i| |j1|
                                          (SPADCALL |x| |i| |j2|
                                                    (QREFELT % 15))
                                          (QREFELT % 38))
                                (EXIT
                                 (SPADCALL |x| |i| |j2| |r| (QREFELT % 38))))
                               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;transpose;2S;42| ((|x| (S)) (% (S)))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G590 NIL) (|j| NIL) (#2=#:G591 NIL))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT % 22))
                          (SPADCALL |x| (QREFELT % 21)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |ans| (QREFELT % 11)))
               (LETT #1# (SPADCALL |ans| (QREFELT % 12))) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |ans| (QREFELT % 13)))
                      (LETT #2# (SPADCALL |ans| (QREFELT % 14))) G190
                      (COND ((> |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |x| |j| |i| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;squareTop;2S;43| ((|x| (S)) (% (S)))
        (SPROG
         ((|cols| (|NonNegativeInteger|)) (|ans| (S)) (|i| NIL) (#1=#:G599 NIL)
          (|j| NIL) (#2=#:G600 NIL))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT % 21))
               (LETT |cols| (SPADCALL |x| (QREFELT % 22))))
            (|error| "squareTop: number of columns exceeds number of rows"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |cols| |cols| (QREFELT % 37)))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 11)))
                      (LETT #1# (- (+ (SPADCALL |x| (QREFELT % 11)) |cols|) 1))
                      G190 (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 13)))
                             (LETT #2# (SPADCALL |x| (QREFELT % 14))) G190
                             (COND ((> |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL |x| |i| |j| (QREFELT % 15))
                                         (QREFELT % 38))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;horizConcat;3S;44| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL (LIST |x| |y|) (QREFELT % 82))) 

(SDEFUN |ARR2CAT-;horizConcat;LS;45| ((|la| (|List| S)) (% (S)))
        (SPROG
         ((|a1| (S)) (|nr| (|NonNegativeInteger|)) (#1=#:G616 NIL)
          (|nc| (|NonNegativeInteger|)) (|ans| (S)) (|i| NIL) (#2=#:G617 NIL)
          (|a| NIL) (#3=#:G618 NIL) (|j| NIL) (#4=#:G619 NIL)
          (|l| (|Integer|)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT % 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT % 22)))
                      (SEQ (LETT |a| NIL) (LETT #1# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |nr| (SPADCALL |a| (QREFELT % 21))
                                         (QREFELT % 65))
                               (|error|
                                "horizConcat: array must have same number of rows"))
                              ('T
                               (LETT |nc|
                                     (+ |nc|
                                        (SPADCALL |a| (QREFELT % 22))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT % 37)))
                      (SEQ (LETT |i| (SPADCALL |a1| (QREFELT % 11)))
                           (LETT #2# (SPADCALL |a1| (QREFELT % 12))) G190
                           (COND ((> |i| #2#) (GO G191)))
                           (SEQ (LETT |l| (SPADCALL |ans| (QREFELT % 13)))
                                (EXIT
                                 (SEQ (LETT |a| NIL) (LETT #3# |la|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |a| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |j|
                                               (SPADCALL |a| (QREFELT % 13)))
                                         (LETT #4#
                                               (SPADCALL |a| (QREFELT % 14)))
                                         G190 (COND ((> |j| #4#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |ans| |i| |l|
                                                    (SPADCALL |a| |i| |j|
                                                              (QREFELT % 15))
                                                    (QREFELT % 38))
                                          (EXIT (LETT |l| (+ |l| 1))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT NIL))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;vertConcat;3S;46| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL (LIST |x| |y|) (QREFELT % 85))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;47| ((|la| (|List| S)) (% (S)))
        (SPROG
         ((|a1| (S)) (|nc| (|NonNegativeInteger|)) (#1=#:G634 NIL)
          (|nr| (|NonNegativeInteger|)) (|ans| (S)) (|a| NIL) (#2=#:G635 NIL)
          (|i| NIL) (#3=#:G636 NIL) (|j| NIL) (#4=#:G637 NIL)
          (|l| (|Integer|)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT % 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT % 22)))
                      (SEQ (LETT |a| NIL) (LETT #1# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |nc| (SPADCALL |a| (QREFELT % 22))
                                         (QREFELT % 65))
                               (|error|
                                "vertConcat: array must have same number of columns"))
                              ('T
                               (LETT |nr|
                                     (+ |nr|
                                        (SPADCALL |a| (QREFELT % 21))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT % 37)))
                      (LETT |l| (SPADCALL |ans| (QREFELT % 11)))
                      (SEQ (LETT |a| NIL) (LETT #2# |la|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 11)))
                                  (LETT #3# (SPADCALL |a| (QREFELT % 12))) G190
                                  (COND ((> |i| #3#) (GO G191)))
                                  (SEQ
                                   (SEQ
                                    (LETT |j| (SPADCALL |a| (QREFELT % 13)))
                                    (LETT #4# (SPADCALL |a| (QREFELT % 14)))
                                    G190 (COND ((> |j| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |ans| |l| |j|
                                                (SPADCALL |a| |i| |j|
                                                          (QREFELT % 15))
                                                (QREFELT % 38))))
                                    (LETT |j| (+ |j| 1)) (GO G190) G191
                                    (EXIT NIL))
                                   (EXIT (LETT |l| (+ |l| 1))))
                                  (LETT |i| (+ |i| 1)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;blockConcat;LS;48| ((LLA (|List| (|List| S))) (% (S)))
        (SPROG ((#1=#:G641 NIL) (LA NIL) (#2=#:G642 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT LA NIL) (LETT #2# LLA) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT LA (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1# (CONS (SPADCALL LA (QREFELT % 82)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 85))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;49|
        ((A (S)) (|r| (|PositiveInteger|)) (% (|List| S)))
        (SPROG
         ((|dr| (|Union| (|NonNegativeInteger|) "failed")) (|mir| (|Integer|))
          (|mic| (|Integer|)) (|mac| (|Integer|)) (#1=#:G651 NIL) (|i| NIL)
          (#2=#:G652 NIL))
         (SEQ (LETT |dr| (|exquo_INT| (SPADCALL A (QREFELT % 21)) |r|))
              (EXIT
               (COND
                ((QEQCAR |dr| 1)
                 (|error| "split does not result in an equal division"))
                ('T
                 (SEQ (LETT |mir| (SPADCALL A (QREFELT % 11)))
                      (LETT |mic| (SPADCALL A (QREFELT % 13)))
                      (LETT |mac| (SPADCALL A (QREFELT % 14)))
                      (EXIT
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |i| 0) (LETT #2# (- |r| 1)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                                (-
                                                 (+ |mir|
                                                    (* (+ |i| 1) (QCDR |dr|)))
                                                 1)
                                                |mic| |mac| (QREFELT % 50))
                                      #1#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;50|
        ((A (S)) (|lr| (|List| (|NonNegativeInteger|))) (% (|List| S)))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|))) (|mir| (|Integer|))
          (|mic| (|Integer|)) (|mac| (|Integer|)) (#1=#:G671 NIL) (|i| NIL)
          (#2=#:G672 NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT % 92) |lr| (QREFELT % 95))
                      (SPADCALL A (QREFELT % 21)) (QREFELT % 65))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT % 92) |lr| 1 (QREFELT % 97))))
             (LETT |mir| (- (SPADCALL A (QREFELT % 11)) 1))
             (LETT |mic| (SPADCALL A (QREFELT % 13)))
             (LETT |mac| (SPADCALL A (QREFELT % 14)))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |i| 2) (LETT #2# (SPADCALL |l| (QREFELT % 98))) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT % 99)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT % 99)))
                                        1)
                                       |mic| |mac| (QREFELT % 50))
                             #1#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #1#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;51|
        ((A (S)) (|c| (|PositiveInteger|)) (% (|List| S)))
        (SPROG
         ((|dc| (|Union| (|NonNegativeInteger|) "failed")) (|mir| (|Integer|))
          (|mar| (|Integer|)) (|mic| (|Integer|)) (#1=#:G681 NIL) (|i| NIL)
          (#2=#:G682 NIL))
         (SEQ (LETT |dc| (|exquo_INT| (SPADCALL A (QREFELT % 22)) |c|))
              (EXIT
               (COND
                ((QEQCAR |dc| 1)
                 (|error| "split does not result in an equal division"))
                ('T
                 (SEQ (LETT |mir| (SPADCALL A (QREFELT % 11)))
                      (LETT |mar| (SPADCALL A (QREFELT % 12)))
                      (LETT |mic| (SPADCALL A (QREFELT % 13)))
                      (EXIT
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |i| 0) (LETT #2# (- |c| 1)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (SPADCALL A |mir| |mar|
                                                (+ |mic| (* |i| (QCDR |dc|)))
                                                (-
                                                 (+ |mic|
                                                    (* (+ |i| 1) (QCDR |dc|)))
                                                 1)
                                                (QREFELT % 50))
                                      #1#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;52|
        ((A (S)) (|lc| (|List| (|NonNegativeInteger|))) (% (|List| S)))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|))) (|mir| (|Integer|))
          (|mar| (|Integer|)) (|mic| (|Integer|)) (#1=#:G700 NIL) (|i| NIL)
          (#2=#:G701 NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT % 92) |lc| (QREFELT % 95))
                      (SPADCALL A (QREFELT % 22)) (QREFELT % 65))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT % 92) |lc| 1 (QREFELT % 97))))
             (LETT |mir| (SPADCALL A (QREFELT % 11)))
             (LETT |mar| (SPADCALL A (QREFELT % 12)))
             (LETT |mic| (- (SPADCALL A (QREFELT % 13)) 1))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |i| 2) (LETT #2# (SPADCALL |l| (QREFELT % 98))) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT % 99)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT % 99)))
                                        1)
                                       (QREFELT % 50))
                             #1#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #1#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;53|
        ((A (S)) (|nr| (|PositiveInteger|)) (|nc| (|PositiveInteger|))
         (% (|List| (|List| S))))
        (SPROG ((#1=#:G705 NIL) (X NIL) (#2=#:G706 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT X NIL) (LETT #2# (SPADCALL A |nr| (QREFELT % 103)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT X (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL X |nc| (QREFELT % 104)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;54|
        ((A (S)) (|lr| (|List| (|NonNegativeInteger|)))
         (|lc| (|List| (|NonNegativeInteger|))) (% (|List| (|List| S))))
        (SPROG ((#1=#:G710 NIL) (X NIL) (#2=#:G711 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT X NIL) (LETT #2# (SPADCALL A |lr| (QREFELT % 106)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT X (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL X |lc| (QREFELT % 107)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;55| ((|m| (S)) (% (S)))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G718 NIL) (|j| NIL) (#2=#:G719 NIL))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT % 21))
                          (SPADCALL |m| (QREFELT % 22)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
               (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                      (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                      (COND ((> |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;fill!;SRS;56| ((|m| (S)) (|r| (R)) (% (S)))
        (SPROG ((|i| NIL) (#1=#:G726 NIL) (|j| NIL) (#2=#:G727 NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT % 38))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;array2;LS;57| ((|ll| (|List| (|List| R))) (% (S)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)) (|a2| (S))
          (|l| NIL) (#1=#:G738 NIL) (|i| NIL) (#2=#:G737 NIL) (|r| NIL)
          (#3=#:G740 NIL) (|j| NIL) (#4=#:G739 NIL))
         (SEQ
          (COND ((NULL |ll|) (SPADCALL 0 0 (QREFELT % 37)))
                ('T
                 (SEQ (LETT |m| (LENGTH |ll|))
                      (LETT |n| (LENGTH (|SPADfirst| |ll|)))
                      (LETT |a2| (SPADCALL |m| |n| (QREFELT % 37)))
                      (SEQ (LETT |l| NIL) (LETT #1# |ll|)
                           (LETT |i| (SPADCALL |a2| (QREFELT % 11)))
                           (LETT #2# (SPADCALL |a2| (QREFELT % 12))) G190
                           (COND
                            ((OR (> |i| #2#) (ATOM #1#)
                                 (PROGN (LETT |l| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (LENGTH |l|) |n| (QREFELT % 65))
                              (|error| "array2: rows of different lengths")))
                            (EXIT
                             (SEQ (LETT |r| NIL) (LETT #3# |l|)
                                  (LETT |j| (SPADCALL |a2| (QREFELT % 13)))
                                  (LETT #4# (SPADCALL |a2| (QREFELT % 14)))
                                  G190
                                  (COND
                                   ((OR (> |j| #4#) (ATOM #3#)
                                        (PROGN (LETT |r| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |a2| |i| |j| |r|
                                              (QREFELT % 38))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |a2|))))))) 

(SDEFUN |ARR2CAT-;map;M2S;58| ((|f| (|Mapping| R R)) (|m| (S)) (% (S)))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G748 NIL) (|j| NIL) (#2=#:G749 NIL))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT % 21))
                          (SPADCALL |m| (QREFELT % 22)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
               (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                      (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                      (COND ((> |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT % 15)) |f|)
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;map!;M2S;59| ((|f| (|Mapping| R R)) (|m| (S)) (% (S)))
        (SPROG ((|i| NIL) (#1=#:G756 NIL) (|j| NIL) (#2=#:G757 NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |m| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |m| |i| |j| (QREFELT % 15))
                                         |f|)
                                        (QREFELT % 38))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M3S;60|
        ((|f| (|Mapping| R R R)) (|m| (S)) (|n| (S)) (% (S)))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G767 NIL) (|j| NIL) (#2=#:G768 NIL))
         (SEQ
          (COND
           ((OR
             (SPADCALL (SPADCALL |m| (QREFELT % 21))
                       (SPADCALL |n| (QREFELT % 21)) (QREFELT % 61))
             (SPADCALL (SPADCALL |m| (QREFELT % 22))
                       (SPADCALL |n| (QREFELT % 22)) (QREFELT % 61)))
            (|error| "map: arguments must have same dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |m| (QREFELT % 21))
                             (SPADCALL |m| (QREFELT % 22)) (QREFELT % 37)))
             (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                  (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                  (COND ((> |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                         (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                         (COND ((> |j| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT % 15))
                                      (SPADCALL |n| |i| |j| (QREFELT % 15))
                                      |f|)
                                     (QREFELT % 38))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;map;M2SRS;61|
        ((|f| (|Mapping| R R R)) (|m| (S)) (|n| (S)) (|r| (R)) (% (S)))
        (SPROG
         ((|maxRow| #1=(|Integer|)) (|maxCol| #1#) (|ans| (S)) (|i| NIL)
          (#2=#:G787 NIL) (|j| NIL) (#3=#:G788 NIL))
         (SEQ
          (LETT |maxRow|
                (MAX (SPADCALL |m| (QREFELT % 12))
                     (SPADCALL |n| (QREFELT % 12))))
          (LETT |maxCol|
                (MAX (SPADCALL |m| (QREFELT % 14))
                     (SPADCALL |n| (QREFELT % 14))))
          (LETT |ans|
                (SPADCALL
                 (MAX (SPADCALL |m| (QREFELT % 21))
                      (SPADCALL |n| (QREFELT % 21)))
                 (MAX (SPADCALL |m| (QREFELT % 22))
                      (SPADCALL |n| (QREFELT % 22)))
                 (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11))) (LETT #2# |maxRow|)
               G190 (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                      (LETT #3# |maxCol|) G190 (COND ((> |j| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT % 117))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT % 117))
                                   |f|)
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;62|
        ((|m| (S)) (|i| (|Integer|)) (|v| (|Row|)) (% (S)))
        (SPROG ((|k| NIL) (#1=#:G796 NIL) (|j| NIL) (#2=#:G795 NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT % 11)))
                      (> |i| (SPADCALL |m| (QREFELT % 12))))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 119)))
                        (LETT #1# (SPADCALL |v| (QREFELT % 120)))
                        (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((OR (> |j| #2#) (> |k| #1#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT % 121))
                                    (QREFELT % 38))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;63|
        ((|m| (S)) (|j| (|Integer|)) (|v| (|Col|)) (% (S)))
        (SPROG ((|k| NIL) (#1=#:G804 NIL) (|i| NIL) (#2=#:G803 NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT % 13)))
                      (> |j| (SPADCALL |m| (QREFELT % 14))))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 123)))
                        (LETT #1# (SPADCALL |v| (QREFELT % 124)))
                        (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                        (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                        (COND ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT % 125))
                                    (QREFELT % 38))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;64| ((|m| (S)) (|n| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G817 NIL) (|j| NIL) (#2=#:G818 NIL) (#3=#:G816 NIL)
          (#4=#:G815 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT % 127)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT % 21))
                             (SPADCALL |n| (QREFELT % 21)) (QREFELT % 61))
                   (SPADCALL (SPADCALL |m| (QREFELT % 22))
                             (SPADCALL |n| (QREFELT % 22)) (QREFELT % 61)))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                        (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                               (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                               (COND ((> |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL |m| |i| |j| (QREFELT % 15))
                                     (SPADCALL |n| |i| |j| (QREFELT % 15))
                                     (QREFELT % 128)))
                                   (PROGN
                                    (LETT #4#
                                          (PROGN
                                           (LETT #3# NIL)
                                           (GO #5=#:G814)))
                                    (GO #6=#:G810))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #4#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #3#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;65| ((|r| (R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G828 NIL) (|j| NIL) (#2=#:G829 NIL) (#3=#:G827 NIL)
          (#4=#:G826 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15)) |r|
                                      (QREFELT % 128))
                            (PROGN
                             (LETT #4# (PROGN (LETT #3# 'T) (GO #5=#:G825)))
                             (GO #6=#:G822))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #4#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #3#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;66|
        ((|r| (R)) (|m| (S)) (% (|NonNegativeInteger|)))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;66!0| (VECTOR % |r|))
                         |m| (QREFELT % 131)))) 

(SDEFUN |ARR2CAT-;count;RSNni;66!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT % 128)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;67| ((|m| (S)) (|i| (|Integer|)) (% (|Row|)))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|mci| (|Integer|)) (|v| (|Row|))
          (|k| NIL) (#1=#:G840 NIL) (|j| NIL) (#2=#:G839 NIL))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT % 11)))
                (> |i| (SPADCALL |m| (QREFELT % 12))))
            (|error| "row: index out of range"))
           ('T
            (SEQ (LETT |nc| (SPADCALL |m| (QREFELT % 22)))
                 (EXIT
                  (COND ((EQL |nc| 0) (SPADCALL (QREFELT % 133)))
                        ('T
                         (SEQ (LETT |mci| (SPADCALL |m| (QREFELT % 13)))
                              (LETT |v|
                                    (SPADCALL |nc|
                                              (SPADCALL |m| |i| |mci|
                                                        (QREFELT % 15))
                                              (QREFELT % 134)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 119)))
                                   (LETT #1# (SPADCALL |v| (QREFELT % 120)))
                                   (LETT |j| |mci|)
                                   (LETT #2# (SPADCALL |m| (QREFELT % 14)))
                                   G190
                                   (COND
                                    ((OR (> |j| #2#) (> |k| #1#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 135))))
                                   (LETT |j|
                                         (PROG1 (+ |j| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;column;SICol;68| ((|m| (S)) (|j| (|Integer|)) (% (|Col|)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|mri| (|Integer|)) (|v| (|Col|))
          (|k| NIL) (#1=#:G849 NIL) (|i| NIL) (#2=#:G848 NIL))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT % 13)))
                (> |j| (SPADCALL |m| (QREFELT % 14))))
            (|error| "column: index out of range"))
           ('T
            (SEQ (LETT |nr| (SPADCALL |m| (QREFELT % 21)))
                 (EXIT
                  (COND ((EQL |nr| 0) (SPADCALL (QREFELT % 137)))
                        ('T
                         (SEQ (LETT |mri| (SPADCALL |m| (QREFELT % 11)))
                              (LETT |v|
                                    (SPADCALL |nr|
                                              (SPADCALL |m| |mri| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 138)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 123)))
                                   (LETT #1# (SPADCALL |v| (QREFELT % 124)))
                                   (LETT |i| |mri|)
                                   (LETT #2# (SPADCALL |m| (QREFELT % 12)))
                                   G190
                                   (COND
                                    ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 139))))
                                   (LETT |i|
                                         (PROG1 (+ |i| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;hashUpdate!;HsSHs;69|
        ((|s| (|HashState|)) (|m| (S)) (% (|HashState|)))
        (SPROG ((|i| NIL) (#1=#:G856 NIL) (|j| NIL) (#2=#:G857 NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #2# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (SPADCALL |s|
                                              (SPADCALL |m| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 142)))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |ARR2CAT-;coerce;SOf;70| ((|m| (S)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G864 NIL) (|i| NIL) (#2=#:G865 NIL) (#3=#:G866 NIL) (|j| NIL)
          (#4=#:G867 NIL) (|l| (|List| (|List| (|OutputForm|)))))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                      (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                                     (LETT #4# (SPADCALL |m| (QREFELT % 14)))
                                     G190 (COND ((> |j| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 145))
                                              #3#))))
                                     (LETT |j| (+ |j| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               #1#))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (SPADCALL |l| (QREFELT % 146)))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TwoDimensionalArrayCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 148))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2| '(|Hashable|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 29 (CONS (|dispatchFunction| |ARR2CAT-;smaller?;2SB;6|) %))))
    (COND
     ((|HasSignature| |#2|
                      (LIST '=
                            (LIST '(|Boolean|) (|devaluate| |#2|)
                                  (|devaluate| |#2|))))
      (PROGN
       (QSETREFV % 129 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;64|) %))
       (QSETREFV % 130 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;65|) %))
       (QSETREFV % 132
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;66|) %)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#3| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV % 136
                  (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;67|) %))))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#4| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV % 140
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;68|) %))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 143
                (CONS (|dispatchFunction| |ARR2CAT-;hashUpdate!;HsSHs;69|)
                      %))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV % 147 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;70|) %))))
    %))) 

(MAKEPROP '|TwoDimensionalArrayCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (10 . |minColIndex|) (15 . |maxColIndex|)
              (20 . |qelt|) (|Boolean|) (|Mapping| 16 7) |ARR2CAT-;any?;MSB;1|
              |ARR2CAT-;every?;MSB;2| (|NonNegativeInteger|) (27 . |nrows|)
              (32 . |ncols|) |ARR2CAT-;size?;SNniB;3| |ARR2CAT-;less?;SNniB;4|
              |ARR2CAT-;more?;SNniB;5| (37 . |elt|) (44 . |smaller?|) (50 . =)
              (56 . |smaller?|) |ARR2CAT-;#;SNni;7| |ARR2CAT-;elt;S2I2R;8|
              |ARR2CAT-;count;MSNni;9| (|List| 7) |ARR2CAT-;parts;SL;10|
              (|List| 33) |ARR2CAT-;listOfLists;SL;11| (62 . |qnew|)
              (68 . |qsetelt!|) |ARR2CAT-;subMatrix;S4IS;12| (|List| 10)
              |ARR2CAT-;elt;SILS;13| |ARR2CAT-;elt;SLIS;14|
              |ARR2CAT-;elt;S2LS;15| (|Segment| 10) (76 . |incr|) (81 . |low|)
              (86 . |high|) |ARR2CAT-;elt;SLSS;17| |ARR2CAT-;elt;SSLS;18|
              (91 . |subMatrix|) |ARR2CAT-;elt;S2SS;19| (|List| 44)
              |ARR2CAT-;elt;SILS;21| |ARR2CAT-;elt;SLIS;22|
              |ARR2CAT-;elt;SSLS;23| |ARR2CAT-;elt;SLSS;24|
              |ARR2CAT-;elt;S2LS;25| (100 . SEGMENT) |ARR2CAT-;rowSlice;SS;26|
              |ARR2CAT-;colSlice;SS;27| (106 . ~=) |ARR2CAT-;setelt!;SIL2S;28|
              |ARR2CAT-;setelt!;SLI2S;29| |ARR2CAT-;setelt!;S2L2S;30|
              (112 . ~=) |ARR2CAT-;setelt!;S2S2S;31|
              |ARR2CAT-;setelt!;SLS2S;32| |ARR2CAT-;setelt!;SSL2S;33|
              |ARR2CAT-;setelt!;SIL2S;34| |ARR2CAT-;setelt!;SLI2S;35|
              |ARR2CAT-;setelt!;SSL2S;36| |ARR2CAT-;setelt!;SLS2S;37|
              |ARR2CAT-;setelt!;S2L2S;38| (|String|) (118 . |elt|)
              |ARR2CAT-;setsubMatrix!;S2I2S;39| |ARR2CAT-;swapRows!;S2IS;40|
              |ARR2CAT-;swapColumns!;S2IS;41| |ARR2CAT-;transpose;2S;42|
              |ARR2CAT-;squareTop;2S;43| (|List| %) (124 . |horizConcat|)
              |ARR2CAT-;horizConcat;3S;44| |ARR2CAT-;horizConcat;LS;45|
              (129 . |vertConcat|) |ARR2CAT-;vertConcat;3S;46|
              |ARR2CAT-;vertConcat;LS;47| (|List| 81)
              |ARR2CAT-;blockConcat;LS;48| (|PositiveInteger|)
              |ARR2CAT-;vertSplit;SPiL;49| (134 . +) (|Mapping| 20 20 20)
              (|List| 20) (140 . |reduce|) (|ListFunctions2| 20 20)
              (146 . |scan|) (153 . |#|) (158 . |elt|)
              |ARR2CAT-;vertSplit;SLL;50| |ARR2CAT-;horizSplit;SPiL;51|
              |ARR2CAT-;horizSplit;SLL;52| (164 . |vertSplit|)
              (170 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;53|
              (176 . |vertSplit|) (182 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;54| |ARR2CAT-;copy;2S;55|
              |ARR2CAT-;fill!;SRS;56| |ARR2CAT-;array2;LS;57| (|Mapping| 7 7)
              |ARR2CAT-;map;M2S;58| |ARR2CAT-;map!;M2S;59| (|Mapping| 7 7 7)
              |ARR2CAT-;map;M3S;60| (188 . |elt|) |ARR2CAT-;map;M2SRS;61|
              (196 . |minIndex|) (201 . |maxIndex|) (206 . |elt|)
              |ARR2CAT-;setRow!;SIRowS;62| (212 . |minIndex|)
              (217 . |maxIndex|) (222 . |elt|) |ARR2CAT-;setColumn!;SIColS;63|
              (228 . |eq?|) (234 . =) (240 . =) (246 . |member?|)
              (252 . |count|) (258 . |count|) (264 . |empty|) (268 . |new|)
              (274 . |qsetelt!|) (281 . |row|) (287 . |empty|) (291 . |new|)
              (297 . |qsetelt!|) (304 . |column|) (|HashState|)
              (310 . |hashUpdate!|) (316 . |hashUpdate!|) (|OutputForm|)
              (322 . |coerce|) (327 . |matrix|) (332 . |coerce|))
           '#(|vertSplit| 337 |vertConcat| 349 |transpose| 360 |swapRows!| 365
              |swapColumns!| 372 |subMatrix| 379 |squareTop| 388 |smaller?| 393
              |size?| 399 |setsubMatrix!| 405 |setelt!| 413 |setRow!| 501
              |setColumn!| 508 |rowSlice| 515 |row| 520 |parts| 526 |more?| 531
              |member?| 537 |map!| 543 |map| 549 |listOfLists| 570 |less?| 575
              |horizSplit| 581 |horizConcat| 593 |hashUpdate!| 604 |fill!| 610
              |every?| 616 |elt| 622 |count| 707 |copy| 719 |column| 724
              |colSlice| 730 |coerce| 735 |blockSplit| 740 |blockConcat| 754
              |array2| 759 |any?| 764 = 770 |#| 776)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((|hashUpdate!|
                                      ((|HashState|) (|HashState|) |#1|))
                                     T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1| |#2|))
                                     T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1|))
                                     T)
                                   '((|map!| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|blockSplit|
                                      ((|List| (|List| |#1|)) |#1|
                                       (|List| (|NonNegativeInteger|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|blockSplit|
                                      ((|List| (|List| |#1|)) |#1|
                                       (|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|horizSplit|
                                      ((|List| |#1|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|horizSplit|
                                      ((|List| |#1|) |#1| (|PositiveInteger|)))
                                     T)
                                   '((|vertSplit|
                                      ((|List| |#1|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|vertSplit|
                                      ((|List| |#1|) |#1| (|PositiveInteger|)))
                                     T)
                                   '((|blockConcat|
                                      (|#1| (|List| (|List| |#1|))))
                                     T)
                                   '((|vertConcat| (|#1| (|List| |#1|))) T)
                                   '((|vertConcat| (|#1| |#1| |#1|)) T)
                                   '((|horizConcat| (|#1| (|List| |#1|))) T)
                                   '((|horizConcat| (|#1| |#1| |#1|)) T)
                                   '((|squareTop| (|#1| |#1|)) T)
                                   '((|transpose| (|#1| |#1|)) T)
                                   '((|swapColumns!|
                                      (|#1| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|swapRows!|
                                      (|#1| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|setsubMatrix!|
                                      (|#1| |#1| (|Integer|) (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setColumn!|
                                      (|#1| |#1| (|Integer|) |#4|))
                                     T)
                                   '((|setRow!| (|#1| |#1| (|Integer|) |#3|))
                                     T)
                                   '((|setelt!|
                                      (|#2| |#1| (|Integer|) (|Integer|) |#2|))
                                     T)
                                   '((|colSlice|
                                      ((|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|rowSlice|
                                      ((|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Integer|)))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|List| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Integer|)))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Integer|))))
                                     T)
                                   '((|subMatrix|
                                      (|#1| |#1| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|)))
                                     T)
                                   '((|listOfLists|
                                      ((|List| (|List| |#2|)) |#1|))
                                     T)
                                   '((|parts| ((|List| |#2|) |#1|)) T)
                                   '((|column| (|#4| |#1| (|Integer|))) T)
                                   '((|row| (|#3| |#1| (|Integer|))) T)
                                   '((|elt|
                                      (|#2| |#1| (|Integer|) (|Integer|) |#2|))
                                     T)
                                   '((|elt|
                                      (|#2| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|array2| (|#1| (|List| (|List| |#2|))))
                                     T)
                                   '((|fill!| (|#1| |#1| |#2|)) T)
                                   '((|member?| ((|Boolean|) |#2| |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|) |#2| |#1|))
                                     T)
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
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|#| ((|NonNegativeInteger|) |#1|)) T)
                                   '((|size?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|more?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|less?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|copy| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 147
                                            '(1 6 10 0 11 1 6 10 0 12 1 6 10 0
                                              13 1 6 10 0 14 3 6 7 0 10 10 15 1
                                              6 20 0 21 1 6 20 0 22 3 6 7 0 10
                                              10 26 2 7 16 0 0 27 2 7 16 0 0 28
                                              2 0 16 0 0 29 2 6 0 20 20 37 4 6
                                              7 0 10 10 7 38 1 44 10 0 45 1 44
                                              10 0 46 1 44 10 0 47 5 6 0 0 10
                                              10 10 10 50 2 44 0 10 10 58 2 10
                                              16 0 0 61 2 20 16 0 0 65 2 74 0 0
                                              0 75 1 6 0 81 82 1 6 0 81 85 2 20
                                              0 0 0 92 2 94 20 93 0 95 3 96 94
                                              93 94 20 97 1 94 20 0 98 2 94 20
                                              0 10 99 2 6 81 0 90 103 2 6 81 0
                                              90 104 2 6 81 0 94 106 2 6 81 0
                                              94 107 4 6 7 0 10 10 7 117 1 8 10
                                              0 119 1 8 10 0 120 2 8 7 0 10 121
                                              1 9 10 0 123 1 9 10 0 124 2 9 7 0
                                              10 125 2 6 16 0 0 127 2 7 16 0 0
                                              128 2 0 16 0 0 129 2 0 16 7 0 130
                                              2 6 20 17 0 131 2 0 20 7 0 132 0
                                              8 0 133 2 8 0 20 7 134 3 8 7 0 10
                                              7 135 2 0 8 0 10 136 0 9 0 137 2
                                              9 0 20 7 138 3 9 7 0 10 7 139 2 0
                                              9 0 10 140 2 7 141 141 0 142 2 0
                                              141 141 0 143 1 7 144 0 145 1 144
                                              0 88 146 1 0 144 0 147 2 0 81 0
                                              90 91 2 0 81 0 94 100 2 0 0 0 0
                                              86 1 0 0 81 87 1 0 0 0 79 3 0 0 0
                                              10 10 77 3 0 0 0 10 10 78 5 0 0 0
                                              10 10 10 10 39 1 0 0 0 80 2 0 16
                                              0 0 29 2 0 16 0 20 23 4 0 0 0 10
                                              10 0 76 4 0 0 0 10 52 0 69 4 0 0
                                              0 52 10 0 70 4 0 0 0 40 10 0 63 4
                                              0 0 0 10 40 0 62 4 0 0 0 44 44 0
                                              66 4 0 0 0 40 40 0 64 4 0 0 0 44
                                              40 0 68 4 0 0 0 40 44 0 67 4 0 0
                                              0 52 44 0 72 4 0 0 0 44 52 0 71 4
                                              0 0 0 52 52 0 73 3 0 0 0 10 8 122
                                              3 0 0 0 10 9 126 1 0 44 0 59 2 0
                                              8 0 10 136 1 0 33 0 34 2 0 16 0
                                              20 25 2 0 16 7 0 130 2 0 0 112 0
                                              114 2 0 0 112 0 113 4 0 0 115 0 0
                                              7 118 3 0 0 115 0 0 116 1 0 35 0
                                              36 2 0 16 0 20 24 2 0 81 0 90 101
                                              2 0 81 0 94 102 2 0 0 0 0 83 1 0
                                              0 81 84 2 0 141 141 0 143 2 0 0 0
                                              7 110 2 0 16 17 0 19 4 0 7 0 10
                                              10 7 31 3 0 0 0 10 40 41 3 0 0 0
                                              40 40 43 3 0 0 0 40 10 42 3 0 0 0
                                              40 44 48 3 0 0 0 44 44 51 3 0 0 0
                                              10 52 53 3 0 0 0 44 40 49 3 0 0 0
                                              52 10 54 3 0 0 0 44 52 55 3 0 0 0
                                              52 52 57 3 0 0 0 52 44 56 2 0 20
                                              17 0 32 2 0 20 7 0 132 1 0 0 0
                                              109 2 0 9 0 10 140 1 0 44 0 60 1
                                              0 144 0 147 3 0 88 0 90 90 105 3
                                              0 88 0 94 94 108 1 0 0 88 89 1 0
                                              0 35 111 2 0 16 17 0 18 2 0 16 0
                                              0 129 1 0 20 0 30)))))
           '|lookupComplete|)) 
