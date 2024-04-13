
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| (|Mapping| (|Boolean|) R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G127 NIL) (#2=#:G128 NIL) (#3=#:G130 NIL) (|j| NIL)
          (#4=#:G129 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15))
                                      |f|)
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'T) (GO #5=#:G126)))
                             (GO #6=#:G122))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| (|Mapping| (|Boolean|) R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G138 NIL) (#2=#:G139 NIL) (#3=#:G141 NIL) (|j| NIL)
          (#4=#:G140 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15))
                                       |f|))
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# NIL) (GO #5=#:G137)))
                             (GO #6=#:G134))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #2#)))) 

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
         ((#1=#:G156 NIL) (|el2| (R)) (|el1| (R)) (#2=#:G158 NIL) (|j| NIL)
          (#3=#:G157 NIL) (|i| NIL) (|maxColIndex| (|Integer|))
          (|mci2| #4=(|Integer|)) (|mci1| #4#) (|minColIndex| #4#)
          (|maxRowIndex| (|Integer|)) (|mri2| #5=(|Integer|)) (|mri1| #5#)
          (|minRowIndex| #5#))
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
                                                           (LETT #2#
                                                                 |maxColIndex|)
                                                           G190
                                                           (COND
                                                            ((> |j| #2#)
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
                                                                (LETT #1# 'T)
                                                                (GO
                                                                 #7=#:G155)))
                                                              ((NULL
                                                                (SPADCALL |el1|
                                                                          |el2|
                                                                          (QREFELT
                                                                           %
                                                                           28)))
                                                               (PROGN
                                                                (LETT #1# NIL)
                                                                (GO #7#))))))
                                                           (LETT |j| (+ |j| 1))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                        (LETT |i| (+ |i| 1))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (EXIT
                                                        NIL)))))))))))))))))))
          #7# (EXIT #1#)))) 

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
         ((|num| (|NonNegativeInteger|)) (#1=#:G174 NIL) (|j| NIL)
          (#2=#:G173 NIL) (|i| NIL))
         (SEQ (LETT |num| 0)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                   (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                          (COND ((> |j| #1#) (GO G191)))
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
         ((|entryList| (|List| R)) (#1=#:G186 NIL) (|j| NIL) (#2=#:G185 NIL)
          (|i| NIL))
         (SEQ (LETT |entryList| NIL)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 12)))
                   (LETT #2# (SPADCALL |m| (QREFELT % 11))) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 14)))
                          (LETT #1# (SPADCALL |m| (QREFELT % 13))) G190
                          (COND ((< |j| #1#) (GO G191)))
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
         ((|ll| (|List| (|List| R))) (|l| (|List| R)) (#1=#:G195 NIL) (|j| NIL)
          (#2=#:G194 NIL) (|i| NIL))
         (SEQ (LETT |ll| NIL)
              (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 12)))
                   (LETT #2# (SPADCALL |x| (QREFELT % 11))) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ (LETT |l| NIL)
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 14)))
                             (LETT #1# (SPADCALL |x| (QREFELT % 13))) G190
                             (COND ((< |j| #1#) (GO G191)))
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
         ((#1=#:G210 NIL) (|j| NIL) (#2=#:G211 NIL) (|l| NIL) (#3=#:G208 NIL)
          (|i| NIL) (#4=#:G209 NIL) (|k| NIL) (|y| (S))
          (|cols| #5=(|NonNegativeInteger|)) (|rows| #5#))
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
                      (SEQ (LETT |k| |i1|) (LETT #4# |i2|)
                           (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                           (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                           (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |l| |j1|) (LETT #2# |j2|)
                                  (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                  (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                                  (COND
                                   ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
         ((#1=#:G224 NIL) (|ej| NIL) (#2=#:G225 NIL) (|j| NIL) (|y| (S))
          (#3=#:G222 NIL) (#4=#:G223 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT % 11)))
                (> |row| (SPADCALL |x| (QREFELT % 12))))
            (|error| "elt: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #4# |colList|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                            (> |ej| (SPADCALL |x| (QREFELT % 14))))
                        (PROGN
                         (LETT #3# (|error| "elt: index out of range"))
                         (GO #5=#:G217))))))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #3#))
             (LETT |y| (SPADCALL 1 (LENGTH |colList|) (QREFELT % 37)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                  (LETT #2# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                  (LETT #1# |colList|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| 1 |j|
                              (SPADCALL |x| |row| |ej| (QREFELT % 15))
                              (QREFELT % 38))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;14|
        ((|x| (S)) (|rowList| (|List| (|Integer|))) (|col| (|Integer|))
         (% (S)))
        (SPROG
         ((#1=#:G238 NIL) (|ei| NIL) (#2=#:G239 NIL) (|i| NIL) (|y| (S))
          (#3=#:G236 NIL) (#4=#:G237 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #4# |rowList|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #3# (|error| "elt: index out of range"))
                      (GO #5=#:G229))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT % 13)))
                (> |col| (SPADCALL |x| (QREFELT % 14))))
            (EXIT (|error| "elt: index out of range"))))
          (LETT |y| (SPADCALL (LENGTH |rowList|) 1 (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #2# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #1# |rowList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL) (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| 1 (SPADCALL |x| |ei| |col| (QREFELT % 15))
                           (QREFELT % 38))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;15|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|colList| (|List| (|Integer|))) (% (S)))
        (SPROG
         ((#1=#:G260 NIL) (|ej| NIL) (#2=#:G261 NIL) (|j| NIL) (#3=#:G258 NIL)
          (|ei| NIL) (#4=#:G259 NIL) (|i| NIL) (|y| (S)) (#5=#:G254 NIL)
          (#6=#:G257 NIL) (#7=#:G255 NIL) (#8=#:G256 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #8# |rowList|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #7# (|error| "elt: index out of range"))
                      (GO #9=#:G243))))))
                 (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #6# |colList|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                         (> |ej| (SPADCALL |x| (QREFELT % 14))))
                     (PROGN
                      (LETT #5# (|error| "elt: index out of range"))
                      (GO #10=#:G247))))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #5#))
          (LETT |y|
                (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                          (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #4# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #3# |rowList|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#)) NIL) (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                      (LETT #2# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                      (LETT #1# |colList|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |ei| |ej| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_seg|
        ((|s| (|Segment| (|Integer|))) (|lb| (|Integer|)) (|ub| (|Integer|))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (|ii| (|Integer|)) (|i2| (|Integer|))
          (|i1| (|Integer|)))
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
                                      (#2# (QUOTIENT2 |cc| |ii|))))))))))
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
                                    (#2# (QUOTIENT2 |cc| |ii|))))))))
                (#2# (|error| "chec_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;SLSS;17|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((#1=#:G281 NIL) (|j| NIL) (#2=#:G282 NIL) (#3=#:G283 NIL) (|l| NIL)
          (#4=#:G279 NIL) (|i| NIL) (#5=#:G280 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT % 46)))
              (LETT |uc| (SPADCALL |sc| (QREFELT % 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT % 45)))
              (LETT |nr| (LENGTH |rowList|))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT % 13))
                     (SPADCALL |x| (QREFELT % 14)) %))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| NIL) (LETT #5# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |k| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SSLS;18|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|colList| (|List| (|Integer|))) (% (S)))
        (SPROG
         ((#1=#:G293 NIL) (|j| NIL) (#2=#:G294 NIL) (|l| NIL) (#3=#:G290 NIL)
          (|i| NIL) (#4=#:G291 NIL) (#5=#:G292 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
              (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
              (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT % 11))
                     (SPADCALL |x| (QREFELT % 12)) %))
              (LETT |nc| (LENGTH |colList|))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT % 37)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #4#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #2# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#) (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2SS;19|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((#1=#:G304 NIL) (|j| NIL) (#2=#:G305 NIL) (#3=#:G306 NIL) (|l| NIL)
          (#4=#:G301 NIL) (|i| NIL) (#5=#:G302 NIL) (#6=#:G303 NIL) (|k| NIL)
          (|y| (S)) (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#)
          (|ic| #8=(|Integer|)) (|ir| #8#) (|uc| #9=(|Integer|))
          (|lc| #10=(|Integer|)) (|ur| #9#) (|lr| #10#))
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
              (SEQ (LETT |k| |lr|) (LETT #6# |ur|) (LETT #5# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #4#)
                         (IF (MINUSP #5#)
                             (< |k| #6#)
                             (> |k| #6#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| (|List| (|Segment| (|Integer|)))) (|lb| (|Integer|))
         (|ub| (|Integer|)) (% (|NonNegativeInteger|)))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G311 NIL) (|s| NIL))
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
         ((|j| (|Integer|)) (#1=#:G321 NIL) (#2=#:G322 NIL) (|l| NIL)
          (#3=#:G320 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT % 13))
                 (SPADCALL |x| (QREFELT % 14)) %))
          (LETT |y| (SPADCALL 1 |nc| (QREFELT % 37)))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                       (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sc| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                                   (LETT #1# (SPADCALL |sc| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| 1 |j|
                                              (SPADCALL |x| |row| |l|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;22|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|)))) (|col| (|Integer|))
         (% (S)))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G332 NIL) (#2=#:G333 NIL) (|k| NIL)
          (#3=#:G331 NIL) (|sr| NIL) (|y| (S)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT % 11))
                 (SPADCALL |x| (QREFELT % 12)) %))
          (LETT |y| (SPADCALL |nr| 1 (QREFELT % 37)))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                       (SEQ (LETT |sr| NIL) (LETT #3# |lsr|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sr| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                                   (LETT #1# (SPADCALL |sr| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| |i| 1
                                              (SPADCALL |x| |k| |col|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SSLS;23|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|lsc| (|List| (|Segment| (|Integer|)))) (% (S)))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G346 NIL) (|i| NIL) (#2=#:G347 NIL)
          (#3=#:G348 NIL) (|k| NIL) (#4=#:G344 NIL) (#5=#:G345 NIL) (|l| NIL)
          (#6=#:G343 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
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
              (SEQ (LETT |sc| NIL) (LETT #6# |lsc|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                          (LETT #5# (SPADCALL |sc| (QREFELT % 47)))
                          (LETT #4# (SPADCALL |sc| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |l| #5#)
                                (> |l| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #2# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                                (LETT #1# (SPADCALL |y| (QREFELT % 12))) G190
                                (COND
                                 ((OR (> |i| #1#)
                                      (IF (MINUSP #2#)
                                          (< |k| #3#)
                                          (> |k| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SLSS;24|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|sc| (|Segment| (|Integer|))) (% (S)))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G361 NIL) (|j| NIL) (#2=#:G362 NIL)
          (#3=#:G363 NIL) (|l| NIL) (#4=#:G359 NIL) (#5=#:G360 NIL) (|k| NIL)
          (#6=#:G358 NIL) (|sr| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
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
              (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                          (LETT #5# (SPADCALL |sr| (QREFELT % 47)))
                          (LETT #4# (SPADCALL |sr| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                                (COND
                                 ((OR (> |j| #1#)
                                      (IF (MINUSP #2#)
                                          (< |l| #3#)
                                          (> |l| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;25|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|lsc| (|List| (|Segment| (|Integer|)))) (% (S)))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G381 NIL) (#2=#:G382 NIL)
          (|l| NIL) (#3=#:G380 NIL) (|sc| NIL) (#4=#:G378 NIL) (#5=#:G379 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G377 NIL) (|sr| NIL) (|y| (S)) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
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
          (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                               (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |sc| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT % 46)))
                                       (LETT #2#
                                             (SPADCALL |sc| (QREFELT % 47)))
                                       (LETT #1#
                                             (SPADCALL |sc| (QREFELT % 45)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |y| |i| |j|
                                                  (SPADCALL |x| |k| |l|
                                                            (QREFELT % 15))
                                                  (QREFELT % 38))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #1#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
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
         ((#1=#:G399 NIL) (|ej| NIL) (#2=#:G400 NIL) (|j| NIL)
          (|rowiy| (|Integer|)) (#3=#:G397 NIL) (#4=#:G398 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT % 11)))
                (> |row| (SPADCALL |x| (QREFELT % 12))))
            (|error| "setelt!: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #4# |colList|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                            (> |ej| (SPADCALL |x| (QREFELT % 14))))
                        (PROGN
                         (LETT #3# (|error| "setelt!: index out of range"))
                         (GO #5=#:G390))))))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #3#))
             (COND
              ((OR (SPADCALL (SPADCALL |y| (QREFELT % 21)) 1 (QREFELT % 61))
                   (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT % 22))
                             (QREFELT % 61)))
               (EXIT (|error| "setelt!: matrix has bad dimensions"))))
             (LETT |rowiy| (SPADCALL |y| (QREFELT % 11)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                  (LETT #2# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                  (LETT #1# |colList|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |row| |ej|
                              (SPADCALL |y| |rowiy| |j| (QREFELT % 15))
                              (QREFELT % 38))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;29|
        ((|x| (S)) (|rowList| (|List| (|Integer|))) (|col| (|Integer|))
         (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G415 NIL) (|ei| NIL) (#2=#:G416 NIL) (|i| NIL)
          (|coliy| (|Integer|)) (#3=#:G413 NIL) (#4=#:G414 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #4# |rowList|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #3# (|error| "setelt!: index out of range"))
                      (GO #5=#:G404))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #3#))
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
               (LETT #2# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #1# |rowList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL) (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |ei| |col|
                           (SPADCALL |y| |i| |coliy| (QREFELT % 15))
                           (QREFELT % 38))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;30|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|colList| (|List| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G439 NIL) (|ej| NIL) (#2=#:G440 NIL) (|j| NIL) (#3=#:G437 NIL)
          (|ei| NIL) (#4=#:G438 NIL) (|i| NIL) (#5=#:G433 NIL) (#6=#:G436 NIL)
          (#7=#:G434 NIL) (#8=#:G435 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #8# |rowList|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT % 11)))
                         (> |ei| (SPADCALL |x| (QREFELT % 12))))
                     (PROGN
                      (LETT #7# (|error| "setelt!: index out of range"))
                      (GO #9=#:G420))))))
                 (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #6# |colList|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT % 13)))
                         (> |ej| (SPADCALL |x| (QREFELT % 14))))
                     (PROGN
                      (LETT #5# (|error| "setelt!: index out of range"))
                      (GO #10=#:G424))))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #5#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT % 21))
                       (QREFELT % 61))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT % 22))
                       (QREFELT % 61)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT % 11)))
               (LETT #4# (SPADCALL |y| (QREFELT % 12))) (LETT |ei| NIL)
               (LETT #3# |rowList|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#)) NIL) (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                      (LETT #2# (SPADCALL |y| (QREFELT % 14))) (LETT |ej| NIL)
                      (LETT #1# |colList|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |ei| |ej|
                                  (SPADCALL |y| |i| |j| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2S2S;31|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G452 NIL) (|j| NIL) (#2=#:G453 NIL) (#3=#:G454 NIL) (|l| NIL)
          (#4=#:G449 NIL) (|i| NIL) (#5=#:G450 NIL) (#6=#:G451 NIL) (|k| NIL)
          (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#) (|ic| #8=(|Integer|))
          (|ir| #8#) (|uc| #9=(|Integer|)) (|lc| #10=(|Integer|)) (|ur| #9#)
          (|lr| #10#))
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
              (SEQ (LETT |k| |lr|) (LETT #6# |ur|) (LETT #5# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #4#)
                         (IF (MINUSP #5#)
                             (< |k| #6#)
                             (> |k| #6#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;32|
        ((|x| (S)) (|rowList| (|List| (|Integer|)))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G465 NIL) (|j| NIL) (#2=#:G466 NIL) (#3=#:G467 NIL) (|l| NIL)
          (#4=#:G463 NIL) (|i| NIL) (#5=#:G464 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
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
              (SEQ (LETT |k| NIL) (LETT #5# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |k| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;33|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|colList| (|List| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G479 NIL) (|j| NIL) (#2=#:G480 NIL) (|l| NIL) (#3=#:G476 NIL)
          (|i| NIL) (#4=#:G477 NIL) (#5=#:G478 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
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
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #4#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #2# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND
                           ((OR (> |j| #1#) (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT % 15))
                                      (QREFELT % 38))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;34|
        ((|x| (S)) (|row| (|Integer|)) (|lsc| (|List| (|Segment| (|Integer|))))
         (|y| (S)) (% (S)))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G492 NIL) (#2=#:G493 NIL) (|l| NIL)
          (#3=#:G491 NIL) (|sc| NIL) (|i| (|Integer|))
          (|nc| (|NonNegativeInteger|)))
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
                       (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sc| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT % 47)))
                                   (LETT #1# (SPADCALL |sc| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |row| |l|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;35|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|)))) (|col| (|Integer|))
         (|y| (S)) (% (S)))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G505 NIL) (#2=#:G506 NIL) (|k| NIL)
          (#3=#:G504 NIL) (|sr| NIL) (|j| (|Integer|))
          (|nr| (|NonNegativeInteger|)))
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
                       (SEQ (LETT |sr| NIL) (LETT #3# |lsr|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sr| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT % 47)))
                                   (LETT #1# (SPADCALL |sr| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |k| |col|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 38))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;36|
        ((|x| (S)) (|sr| (|Segment| (|Integer|)))
         (|lsc| (|List| (|Segment| (|Integer|)))) (|y| (S)) (% (S)))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G521 NIL) (|i| NIL) (#2=#:G522 NIL)
          (#3=#:G523 NIL) (|k| NIL) (#4=#:G519 NIL) (#5=#:G520 NIL) (|l| NIL)
          (#6=#:G518 NIL) (|sc| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
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
              (SEQ (LETT |sc| NIL) (LETT #6# |lsc|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT % 46)))
                          (LETT #5# (SPADCALL |sc| (QREFELT % 47)))
                          (LETT #4# (SPADCALL |sc| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |l| #5#)
                                (> |l| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #2# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                                (LETT #1# (SPADCALL |y| (QREFELT % 12))) G190
                                (COND
                                 ((OR (> |i| #1#)
                                      (IF (MINUSP #2#)
                                          (< |k| #3#)
                                          (> |k| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;37|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|sc| (|Segment| (|Integer|))) (|y| (S)) (% (S)))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G538 NIL) (|j| NIL) (#2=#:G539 NIL)
          (#3=#:G540 NIL) (|l| NIL) (#4=#:G536 NIL) (#5=#:G537 NIL) (|k| NIL)
          (#6=#:G535 NIL) (|sr| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
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
              (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT % 46)))
                          (LETT #5# (SPADCALL |sr| (QREFELT % 47)))
                          (LETT #4# (SPADCALL |sr| (QREFELT % 45))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                                (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                                (COND
                                 ((OR (> |j| #1#)
                                      (IF (MINUSP #2#)
                                          (< |l| #3#)
                                          (> |l| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT % 15))
                                            (QREFELT % 38))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;38|
        ((|x| (S)) (|lsr| (|List| (|Segment| (|Integer|))))
         (|lsc| (|List| (|Segment| (|Integer|)))) (|y| (S)) (% (S)))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G560 NIL) (#2=#:G561 NIL)
          (|l| NIL) (#3=#:G559 NIL) (|sc| NIL) (#4=#:G557 NIL) (#5=#:G558 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G556 NIL) (|sr| NIL) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
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
          (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT % 46)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT % 47)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT % 45)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                               (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |sc| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT % 46)))
                                       (LETT #2#
                                             (SPADCALL |sc| (QREFELT % 47)))
                                       (LETT #1#
                                             (SPADCALL |sc| (QREFELT % 45)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |x| |k| |l|
                                                  (SPADCALL |y| |i| |j|
                                                            (QREFELT % 15))
                                                  (QREFELT % 38))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #1#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;39|
        ((|x| (S)) (|i1| (|Integer|)) (|j1| (|Integer|)) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G574 NIL) (|j| NIL) (#2=#:G575 NIL) (|l| NIL) (#3=#:G572 NIL)
          (|i| NIL) (#4=#:G573 NIL) (|k| NIL) (|j2| #5=(|Integer|)) (|i2| #5#))
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
              (SEQ (LETT |k| |i1|) (LETT #4# |i2|)
                   (LETT |i| (SPADCALL |y| (QREFELT % 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT % 12))) G190
                   (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |j1|) (LETT #2# |j2|)
                          (LETT |j| (SPADCALL |y| (QREFELT % 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT % 14))) G190
                          (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
        (SPROG ((|r| (R)) (#1=#:G586 NIL) (|j| NIL))
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
        (SPROG ((|r| (R)) (#1=#:G597 NIL) (|i| NIL))
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
         ((#1=#:G605 NIL) (|j| NIL) (#2=#:G604 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT % 22))
                          (SPADCALL |x| (QREFELT % 21)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |ans| (QREFELT % 11)))
               (LETT #2# (SPADCALL |ans| (QREFELT % 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |ans| (QREFELT % 13)))
                      (LETT #1# (SPADCALL |ans| (QREFELT % 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
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
         ((#1=#:G614 NIL) (|j| NIL) (#2=#:G613 NIL) (|i| NIL) (|ans| (S))
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT % 21))
               (LETT |cols| (SPADCALL |x| (QREFELT % 22))))
            (|error| "squareTop: number of columns exceeds number of rows"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |cols| |cols| (QREFELT % 37)))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 11)))
                      (LETT #2# (- (+ (SPADCALL |x| (QREFELT % 11)) |cols|) 1))
                      G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 13)))
                             (LETT #1# (SPADCALL |x| (QREFELT % 14))) G190
                             (COND ((> |j| #1#) (GO G191)))
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
         ((|l| (|Integer|)) (#1=#:G633 NIL) (|j| NIL) (#2=#:G632 NIL) (|a| NIL)
          (#3=#:G631 NIL) (|i| NIL) (|ans| (S)) (|nc| (|NonNegativeInteger|))
          (#4=#:G630 NIL) (|nr| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT % 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT % 22)))
                      (SEQ (LETT |a| NIL) (LETT #4# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#)) NIL))
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
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT % 37)))
                      (SEQ (LETT |i| (SPADCALL |a1| (QREFELT % 11)))
                           (LETT #3# (SPADCALL |a1| (QREFELT % 12))) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ (LETT |l| (SPADCALL |ans| (QREFELT % 13)))
                                (EXIT
                                 (SEQ (LETT |a| NIL) (LETT #2# |la|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |a| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |j|
                                               (SPADCALL |a| (QREFELT % 13)))
                                         (LETT #1#
                                               (SPADCALL |a| (QREFELT % 14)))
                                         G190 (COND ((> |j| #1#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |ans| |i| |l|
                                                    (SPADCALL |a| |i| |j|
                                                              (QREFELT % 15))
                                                    (QREFELT % 38))
                                          (EXIT (LETT |l| (+ |l| 1))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;vertConcat;3S;46| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL (LIST |x| |y|) (QREFELT % 85))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;47| ((|la| (|List| S)) (% (S)))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G651 NIL) (|j| NIL) (#2=#:G650 NIL) (|i| NIL)
          (#3=#:G649 NIL) (|a| NIL) (|ans| (S)) (|nr| (|NonNegativeInteger|))
          (#4=#:G648 NIL) (|nc| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT % 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT % 22)))
                      (SEQ (LETT |a| NIL) (LETT #4# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#)) NIL))
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
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT % 37)))
                      (LETT |l| (SPADCALL |ans| (QREFELT % 11)))
                      (SEQ (LETT |a| NIL) (LETT #3# |la|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| (SPADCALL |a| (QREFELT % 11)))
                                  (LETT #2# (SPADCALL |a| (QREFELT % 12))) G190
                                  (COND ((> |i| #2#) (GO G191)))
                                  (SEQ
                                   (SEQ
                                    (LETT |j| (SPADCALL |a| (QREFELT % 13)))
                                    (LETT #1# (SPADCALL |a| (QREFELT % 14)))
                                    G190 (COND ((> |j| #1#) (GO G191)))
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
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;blockConcat;LS;48| ((LLA (|List| (|List| S))) (% (S)))
        (SPROG ((#1=#:G656 NIL) (LA NIL) (#2=#:G655 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT LA NIL) (LETT #1# LLA) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL LA (QREFELT % 82)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 85))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;49|
        ((A (S)) (|r| (|PositiveInteger|)) (% (|List| S)))
        (SPROG
         ((#1=#:G667 NIL) (|i| NIL) (#2=#:G666 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|dr| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dr| (SPADCALL (SPADCALL A (QREFELT % 21)) |r| (QREFELT % 91)))
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
                    (LETT #2# NIL)
                    (SEQ (LETT |i| 0) (LETT #1# (- |r| 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                            (-
                                             (+ |mir|
                                                (* (+ |i| 1) (QCDR |dr|)))
                                             1)
                                            |mic| |mac| (QREFELT % 50))
                                  #2#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;50|
        ((A (S)) (|lr| (|List| (|NonNegativeInteger|))) (% (|List| S)))
        (SPROG
         ((#1=#:G696 NIL) (|i| NIL) (#2=#:G695 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT % 94) |lr| (QREFELT % 97))
                      (SPADCALL A (QREFELT % 21)) (QREFELT % 65))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT % 94) |lr| 1 (QREFELT % 99))))
             (LETT |mir| (- (SPADCALL A (QREFELT % 11)) 1))
             (LETT |mic| (SPADCALL A (QREFELT % 13)))
             (LETT |mac| (SPADCALL A (QREFELT % 14)))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |i| 2) (LETT #1# (SPADCALL |l| (QREFELT % 100))) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT % 101)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT % 101)))
                                        1)
                                       |mic| |mac| (QREFELT % 50))
                             #2#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;51|
        ((A (S)) (|c| (|PositiveInteger|)) (% (|List| S)))
        (SPROG
         ((#1=#:G706 NIL) (|i| NIL) (#2=#:G705 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|dc| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dc| (SPADCALL (SPADCALL A (QREFELT % 22)) |c| (QREFELT % 91)))
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
                    (LETT #2# NIL)
                    (SEQ (LETT |i| 0) (LETT #1# (- |c| 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A |mir| |mar|
                                            (+ |mic| (* |i| (QCDR |dc|)))
                                            (-
                                             (+ |mic|
                                                (* (+ |i| 1) (QCDR |dc|)))
                                             1)
                                            (QREFELT % 50))
                                  #2#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;52|
        ((A (S)) (|lc| (|List| (|NonNegativeInteger|))) (% (|List| S)))
        (SPROG
         ((#1=#:G725 NIL) (|i| NIL) (#2=#:G724 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT % 94) |lc| (QREFELT % 97))
                      (SPADCALL A (QREFELT % 22)) (QREFELT % 65))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT % 94) |lc| 1 (QREFELT % 99))))
             (LETT |mir| (SPADCALL A (QREFELT % 11)))
             (LETT |mar| (SPADCALL A (QREFELT % 12)))
             (LETT |mic| (- (SPADCALL A (QREFELT % 13)) 1))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |i| 2) (LETT #1# (SPADCALL |l| (QREFELT % 100))) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT % 101)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT % 101)))
                                        1)
                                       (QREFELT % 50))
                             #2#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;53|
        ((A (S)) (|nr| (|PositiveInteger|)) (|nc| (|PositiveInteger|))
         (% (|List| (|List| S))))
        (SPROG ((#1=#:G730 NIL) (X NIL) (#2=#:G729 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT X NIL) (LETT #1# (SPADCALL A |nr| (QREFELT % 105)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL X |nc| (QREFELT % 106)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;54|
        ((A (S)) (|lr| (|List| (|NonNegativeInteger|)))
         (|lc| (|List| (|NonNegativeInteger|))) (% (|List| (|List| S))))
        (SPROG ((#1=#:G735 NIL) (X NIL) (#2=#:G734 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT X NIL) (LETT #1# (SPADCALL A |lr| (QREFELT % 108)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL X |lc| (QREFELT % 109)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;55| ((|m| (S)) (% (S)))
        (SPROG
         ((#1=#:G743 NIL) (|j| NIL) (#2=#:G742 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT % 21))
                          (SPADCALL |m| (QREFELT % 22)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
               (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                      (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT % 15))
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;fill!;SRS;56| ((|m| (S)) (|r| (R)) (% (S)))
        (SPROG ((#1=#:G751 NIL) (|j| NIL) (#2=#:G750 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT % 38))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;array2;LS;57| ((|ll| (|List| (|List| R))) (% (S)))
        (SPROG
         ((#1=#:G763 NIL) (|j| NIL) (#2=#:G764 NIL) (|r| NIL) (#3=#:G761 NIL)
          (|i| NIL) (#4=#:G762 NIL) (|l| NIL) (|a2| (S))
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |ll|) (SPADCALL 0 0 (QREFELT % 37)))
                ('T
                 (SEQ (LETT |m| (LENGTH |ll|))
                      (LETT |n| (LENGTH (|SPADfirst| |ll|)))
                      (LETT |a2| (SPADCALL |n| |m| (QREFELT % 37)))
                      (SEQ (LETT |l| NIL) (LETT #4# |ll|)
                           (LETT |i| (SPADCALL |a2| (QREFELT % 11)))
                           (LETT #3# (SPADCALL |a2| (QREFELT % 12))) G190
                           (COND
                            ((OR (> |i| #3#) (ATOM #4#)
                                 (PROGN (LETT |l| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (LENGTH |l|) |n| (QREFELT % 65))
                              (|error| "array2: rows of different lengths")))
                            (EXIT
                             (SEQ (LETT |r| NIL) (LETT #2# |l|)
                                  (LETT |j| (SPADCALL |a2| (QREFELT % 13)))
                                  (LETT #1# (SPADCALL |a2| (QREFELT % 14)))
                                  G190
                                  (COND
                                   ((OR (> |j| #1#) (ATOM #2#)
                                        (PROGN (LETT |r| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |a2| |i| |j| |r|
                                              (QREFELT % 38))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |a2|))))))) 

(SDEFUN |ARR2CAT-;map;M2S;58| ((|f| (|Mapping| R R)) (|m| (S)) (% (S)))
        (SPROG
         ((#1=#:G773 NIL) (|j| NIL) (#2=#:G772 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT % 21))
                          (SPADCALL |m| (QREFELT % 22)) (QREFELT % 37)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
               (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                      (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
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
        (SPROG ((#1=#:G781 NIL) (|j| NIL) (#2=#:G780 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #1#) (GO G191)))
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
         ((#1=#:G792 NIL) (|j| NIL) (#2=#:G791 NIL) (|i| NIL) (|ans| (S)))
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
                  (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                         (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                         (COND ((> |j| #1#) (GO G191)))
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
         ((#1=#:G812 NIL) (|j| NIL) (#2=#:G811 NIL) (|i| NIL) (|ans| (S))
          (|maxCol| #3=(|Integer|)) (|maxRow| #3#))
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
                      (LETT #1# |maxCol|) G190 (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT % 119))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT % 119))
                                   |f|)
                                  (QREFELT % 38))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;62|
        ((|m| (S)) (|i| (|Integer|)) (|v| (|Row|)) (% (S)))
        (SPROG ((#1=#:G819 NIL) (|j| NIL) (#2=#:G820 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT % 11)))
                      (> |i| (SPADCALL |m| (QREFELT % 12))))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 121)))
                        (LETT #2# (SPADCALL |v| (QREFELT % 122)))
                        (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT % 123))
                                    (QREFELT % 38))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;63|
        ((|m| (S)) (|j| (|Integer|)) (|v| (|Col|)) (% (S)))
        (SPROG ((#1=#:G827 NIL) (|i| NIL) (#2=#:G828 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT % 13)))
                      (> |j| (SPADCALL |m| (QREFELT % 14))))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 125)))
                        (LETT #2# (SPADCALL |v| (QREFELT % 126)))
                        (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                        (LETT #1# (SPADCALL |m| (QREFELT % 12))) G190
                        (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT % 127))
                                    (QREFELT % 38))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;64| ((|m| (S)) (|n| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G839 NIL) (#2=#:G840 NIL) (#3=#:G842 NIL) (|j| NIL)
          (#4=#:G841 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT % 129)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT % 21))
                             (SPADCALL |n| (QREFELT % 21)) (QREFELT % 61))
                   (SPADCALL (SPADCALL |m| (QREFELT % 22))
                             (SPADCALL |n| (QREFELT % 22)) (QREFELT % 61)))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                        (LETT #4# (SPADCALL |m| (QREFELT % 12))) G190
                        (COND ((> |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                               (LETT #3# (SPADCALL |m| (QREFELT % 14))) G190
                               (COND ((> |j| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL |m| |i| |j| (QREFELT % 15))
                                     (SPADCALL |n| |i| |j| (QREFELT % 15))
                                     (QREFELT % 28)))
                                   (PROGN
                                    (LETT #1#
                                          (PROGN
                                           (LETT #2# NIL)
                                           (GO #5=#:G838)))
                                    (GO #6=#:G834))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;65| ((|r| (R)) (|m| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G850 NIL) (#2=#:G851 NIL) (#3=#:G853 NIL) (|j| NIL)
          (#4=#:G852 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT % 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT % 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 15)) |r|
                                      (QREFELT % 28))
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'T) (GO #5=#:G849)))
                             (GO #6=#:G846))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;66|
        ((|r| (R)) (|m| (S)) (% (|NonNegativeInteger|)))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;66!0| (VECTOR % |r|))
                         |m| (QREFELT % 132)))) 

(SDEFUN |ARR2CAT-;count;RSNni;66!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT % 28)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;67| ((|m| (S)) (|i| (|Integer|)) (% (|Row|)))
        (SPROG
         ((#1=#:G863 NIL) (|j| NIL) (#2=#:G864 NIL) (|k| NIL) (|v| (|Row|))
          (|mci| (|Integer|)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT % 11)))
                (> |i| (SPADCALL |m| (QREFELT % 12))))
            (|error| "row: index out of range"))
           ('T
            (SEQ (LETT |nc| (SPADCALL |m| (QREFELT % 22)))
                 (EXIT
                  (COND ((EQL |nc| 0) (SPADCALL (QREFELT % 134)))
                        ('T
                         (SEQ (LETT |mci| (SPADCALL |m| (QREFELT % 13)))
                              (LETT |v|
                                    (SPADCALL |nc|
                                              (SPADCALL |m| |i| |mci|
                                                        (QREFELT % 15))
                                              (QREFELT % 135)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 121)))
                                   (LETT #2# (SPADCALL |v| (QREFELT % 122)))
                                   (LETT |j| |mci|)
                                   (LETT #1# (SPADCALL |m| (QREFELT % 14)))
                                   G190
                                   (COND
                                    ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 136))))
                                   (LETT |j|
                                         (PROG1 (+ |j| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;column;SICol;68| ((|m| (S)) (|j| (|Integer|)) (% (|Col|)))
        (SPROG
         ((#1=#:G872 NIL) (|i| NIL) (#2=#:G873 NIL) (|k| NIL) (|v| (|Col|))
          (|mri| (|Integer|)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT % 13)))
                (> |j| (SPADCALL |m| (QREFELT % 14))))
            (|error| "column: index out of range"))
           ('T
            (SEQ (LETT |nr| (SPADCALL |m| (QREFELT % 21)))
                 (EXIT
                  (COND ((EQL |nr| 0) (SPADCALL (QREFELT % 138)))
                        ('T
                         (SEQ (LETT |mri| (SPADCALL |m| (QREFELT % 11)))
                              (LETT |v|
                                    (SPADCALL |nr|
                                              (SPADCALL |m| |mri| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 139)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 125)))
                                   (LETT #2# (SPADCALL |v| (QREFELT % 126)))
                                   (LETT |i| |mri|)
                                   (LETT #1# (SPADCALL |m| (QREFELT % 12)))
                                   G190
                                   (COND
                                    ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 140))))
                                   (LETT |i|
                                         (PROG1 (+ |i| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;hashUpdate!;HsSHs;69|
        ((|s| (|HashState|)) (|m| (S)) (% (|HashState|)))
        (SPROG ((#1=#:G881 NIL) (|j| NIL) (#2=#:G880 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                     (LETT #2# (SPADCALL |m| (QREFELT % 12))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                            (LETT #1# (SPADCALL |m| (QREFELT % 14))) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (SPADCALL |s|
                                              (SPADCALL |m| |i| |j|
                                                        (QREFELT % 15))
                                              (QREFELT % 143)))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |ARR2CAT-;coerce;SOf;70| ((|m| (S)) (% (|OutputForm|)))
        (SPROG
         ((|l| (|List| (|List| (|OutputForm|)))) (#1=#:G891 NIL) (|j| NIL)
          (#2=#:G890 NIL) (#3=#:G889 NIL) (|i| NIL) (#4=#:G888 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 11)))
                      (LETT #3# (SPADCALL |m| (QREFELT % 12))) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 13)))
                                     (LETT #1# (SPADCALL |m| (QREFELT % 14)))
                                     G190 (COND ((> |j| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT % 15))
                                               (QREFELT % 146))
                                              #2#))))
                                     (LETT |j| (+ |j| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (SPADCALL |l| (QREFELT % 147)))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TwoDimensionalArrayCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 149))
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
       (QSETREFV % 130 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;64|) %))
       (QSETREFV % 131 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;65|) %))
       (QSETREFV % 133
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;66|) %)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#3| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV % 137
                  (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;67|) %))))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#4| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV % 141
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;68|) %))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 144
                (CONS (|dispatchFunction| |ARR2CAT-;hashUpdate!;HsSHs;69|)
                      %))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV % 148 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;70|) %))))
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
              |ARR2CAT-;blockConcat;LS;48| (|Union| % '"failed")
              (134 . |exquo|) (|PositiveInteger|) |ARR2CAT-;vertSplit;SPiL;49|
              (140 . +) (|Mapping| 20 20 20) (|List| 20) (146 . |reduce|)
              (|ListFunctions2| 20 20) (152 . |scan|) (159 . |#|) (164 . |elt|)
              |ARR2CAT-;vertSplit;SLL;50| |ARR2CAT-;horizSplit;SPiL;51|
              |ARR2CAT-;horizSplit;SLL;52| (170 . |vertSplit|)
              (176 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;53|
              (182 . |vertSplit|) (188 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;54| |ARR2CAT-;copy;2S;55|
              |ARR2CAT-;fill!;SRS;56| |ARR2CAT-;array2;LS;57| (|Mapping| 7 7)
              |ARR2CAT-;map;M2S;58| |ARR2CAT-;map!;M2S;59| (|Mapping| 7 7 7)
              |ARR2CAT-;map;M3S;60| (194 . |elt|) |ARR2CAT-;map;M2SRS;61|
              (202 . |minIndex|) (207 . |maxIndex|) (212 . |elt|)
              |ARR2CAT-;setRow!;SIRowS;62| (218 . |minIndex|)
              (223 . |maxIndex|) (228 . |elt|) |ARR2CAT-;setColumn!;SIColS;63|
              (234 . |eq?|) (240 . =) (246 . |member?|) (252 . |count|)
              (258 . |count|) (264 . |empty|) (268 . |new|) (274 . |qsetelt!|)
              (281 . |row|) (287 . |empty|) (291 . |new|) (297 . |qsetelt!|)
              (304 . |column|) (|HashState|) (310 . |hashUpdate!|)
              (316 . |hashUpdate!|) (|OutputForm|) (322 . |coerce|)
              (327 . |matrix|) (332 . |coerce|))
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
                        (|makeByteWordVec2| 148
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
                                              90 0 0 91 2 20 0 0 0 94 2 96 20
                                              95 0 97 3 98 96 95 96 20 99 1 96
                                              20 0 100 2 96 20 0 10 101 2 6 81
                                              0 92 105 2 6 81 0 92 106 2 6 81 0
                                              96 108 2 6 81 0 96 109 4 6 7 0 10
                                              10 7 119 1 8 10 0 121 1 8 10 0
                                              122 2 8 7 0 10 123 1 9 10 0 125 1
                                              9 10 0 126 2 9 7 0 10 127 2 6 16
                                              0 0 129 2 0 16 0 0 130 2 0 16 7 0
                                              131 2 6 20 17 0 132 2 0 20 7 0
                                              133 0 8 0 134 2 8 0 20 7 135 3 8
                                              7 0 10 7 136 2 0 8 0 10 137 0 9 0
                                              138 2 9 0 20 7 139 3 9 7 0 10 7
                                              140 2 0 9 0 10 141 2 7 142 142 0
                                              143 2 0 142 142 0 144 1 7 145 0
                                              146 1 145 0 88 147 1 0 145 0 148
                                              2 0 81 0 96 102 2 0 81 0 92 93 1
                                              0 0 81 87 2 0 0 0 0 86 1 0 0 0 79
                                              3 0 0 0 10 10 77 3 0 0 0 10 10 78
                                              5 0 0 0 10 10 10 10 39 1 0 0 0 80
                                              2 0 16 0 0 29 2 0 16 0 20 23 4 0
                                              0 0 10 10 0 76 4 0 0 0 52 52 0 73
                                              4 0 0 0 44 52 0 71 4 0 0 0 52 44
                                              0 72 4 0 0 0 40 44 0 67 4 0 0 0
                                              44 40 0 68 4 0 0 0 40 40 0 64 4 0
                                              0 0 44 44 0 66 4 0 0 0 10 40 0 62
                                              4 0 0 0 40 10 0 63 4 0 0 0 52 10
                                              0 70 4 0 0 0 10 52 0 69 3 0 0 0
                                              10 8 124 3 0 0 0 10 9 128 1 0 44
                                              0 59 2 0 8 0 10 137 1 0 33 0 34 2
                                              0 16 0 20 25 2 0 16 7 0 131 2 0 0
                                              114 0 116 3 0 0 117 0 0 118 4 0 0
                                              117 0 0 7 120 2 0 0 114 0 115 1 0
                                              35 0 36 2 0 16 0 20 24 2 0 81 0
                                              96 104 2 0 81 0 92 103 1 0 0 81
                                              84 2 0 0 0 0 83 2 0 142 142 0 144
                                              2 0 0 0 7 112 2 0 16 17 0 19 3 0
                                              0 0 52 44 56 3 0 0 0 52 52 57 3 0
                                              0 0 44 52 55 3 0 0 0 52 10 54 3 0
                                              0 0 44 40 49 3 0 0 0 10 52 53 3 0
                                              0 0 44 44 51 3 0 0 0 40 44 48 3 0
                                              0 0 40 10 42 3 0 0 0 40 40 43 3 0
                                              0 0 10 40 41 4 0 7 0 10 10 7 31 2
                                              0 20 7 0 133 2 0 20 17 0 32 1 0 0
                                              0 111 2 0 9 0 10 141 1 0 44 0 60
                                              1 0 145 0 148 3 0 88 0 96 96 110
                                              3 0 88 0 92 92 107 1 0 0 88 89 1
                                              0 0 35 113 2 0 16 17 0 18 2 0 16
                                              0 0 130 1 0 20 0 30)))))
           '|lookupComplete|)) 
