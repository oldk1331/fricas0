
(SDEFUN |VIEW2D;checkViewport| ((|viewport| (%)) (% (|Boolean|)))
        (SPROG ((|i| (|Integer|)))
               (SEQ (|sockSendInt| |$ViewportServer| (QVELT |viewport| 0))
                    (LETT |i| (|sockGetInt| |$ViewportServer|))
                    (EXIT
                     (COND
                      ((< |i| 0)
                       (SEQ (QSETVELT |viewport| 0 0)
                            (EXIT
                             (|error|
                              "This viewport has already been closed!"))))
                      ('T 'T)))))) 

(SDEFUN |VIEW2D;message_I|
        ((|vp| (%)) (|cmd| (|Integer|)) (|i| (|Integer|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 13)) 0 (QREFELT % 15))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |vp| %)
                   (SEQ (|sockSendInt| |$ViewportServer| |i|)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW2D;message_II|
        ((|vp| (%)) (|cmd| (|Integer|)) (|i1| (|Integer|)) (|i2| (|Integer|))
         (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 13)) 0 (QREFELT % 15))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |vp| %)
                   (SEQ
                    (SEQ (|sockSendInt| |$ViewportServer| |i1|)
                         (EXIT (|sockSendInt| |$ViewportServer| |i2|)))
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW2D;message_IFF|
        ((|vp| (%)) (|cmd| (|Integer|)) (|i| (|Integer|))
         (|f1| (|DoubleFloat|)) (|f2| (|DoubleFloat|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 13)) 0 (QREFELT % 15))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |vp| %)
                   (SEQ
                    (SEQ (|sockSendInt| |$ViewportServer| |i|)
                         (|sockSendFloat| |$ViewportServer| |f1|)
                         (EXIT (|sockSendFloat| |$ViewportServer| |f2|)))
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW2D;doOptions| ((|v| (|Rep|)) (% (|Void|)))
        (QSETVELT |v| 3 (SPADCALL (QVELT |v| 7) "FriCAS2D" (QREFELT % 19)))) 

(MAKEPROP '|VIEW2D;options;%L;6| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 7))) 

(SDEFUN |VIEW2D;options;%L;6| ((|viewport| (%)) (% (|List| (|DrawOption|))))
        (QVELT |viewport| 7)) 

(SDEFUN |VIEW2D;options;%L%;7|
        ((|viewport| (%)) (|opts| (|List| (|DrawOption|))) (% (%)))
        (SEQ (QSETVELT |viewport| 7 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW2D;putGraph;%GiPiV;8|
        ((|viewport| (%)) (|aGraph| (|GraphImage|))
         (|which| (|PositiveInteger|)) (% (|Void|)))
        (SEQ
         (COND
          ((OR (> |which| 9) (< |which| 1))
           (|error|
            "Trying to put a graph with a negative index or too big an index")))
         (EXIT
          (SPADCALL (QVELT |viewport| 1) |which| (CONS 0 |aGraph|)
                    (QREFELT % 24))))) 

(SDEFUN |VIEW2D;getGraph;%PiGi;9|
        ((|viewport| (%)) (|which| (|PositiveInteger|)) (% (|GraphImage|)))
        (SPROG ((#1=#:G57 NIL))
               (SEQ
                (COND
                 ((OR (> |which| 9) (< |which| 1))
                  (|error|
                   "Trying to get a graph with a negative index or too big an index")))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (QVELT |viewport| 1) |which| (QREFELT % 29)) 1)
                   (|error| "Graph is undefined!"))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (QVELT |viewport| 1) |which|
                                       (QREFELT % 29)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (|GraphImage|)
                                     (|Union| (|GraphImage|) "undefined")
                                     #1#)))))))) 

(MAKEPROP '|VIEW2D;graphStates;%V;10| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 2))) 

(SDEFUN |VIEW2D;graphStates;%V;10|
        ((|viewport| (%))
         (%
          (|Vector|
           (|Record| (|:| |scaleX| (|DoubleFloat|))
                     (|:| |scaleY| (|DoubleFloat|))
                     (|:| |deltaX| (|DoubleFloat|))
                     (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                     (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                     (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                     (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                     (|:| |showing| (|Integer|))))))
        (QVELT |viewport| 2)) 

(MAKEPROP '|VIEW2D;graphs;%V;11| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 1))) 

(SDEFUN |VIEW2D;graphs;%V;11|
        ((|viewport| (%)) (% (|Vector| (|Union| (|GraphImage|) "undefined"))))
        (QVELT |viewport| 1)) 

(MAKEPROP '|VIEW2D;key;%I;12| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW2D;key;%I;12| ((|viewport| (%)) (% (|Integer|)))
        (QVELT |viewport| 0)) 

(SDEFUN |VIEW2D;dimensions;%2Nni2PiV;13|
        ((|viewport| (%)) (|ViewX| (|NonNegativeInteger|))
         (|ViewY| (|NonNegativeInteger|)) (|ViewWidth| (|PositiveInteger|))
         (|ViewHeight| (|PositiveInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 4 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 5 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW2D;move;%2NniV;14|
        ((|viewport| (%)) (|xLoc| (|NonNegativeInteger|))
         (|yLoc| (|NonNegativeInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 4 (CONS |xLoc| |yLoc|))
             (EXIT (|VIEW2D;message_II| |viewport| 102 |xLoc| |yLoc| %)))) 

(SDEFUN |VIEW2D;update;%GiPiV;15|
        ((|viewport| (%)) (|graph| (|GraphImage|)) (|slot| (|PositiveInteger|))
         (% (|Void|)))
        (|VIEW2D;message_II| |viewport| 106 (SPADCALL |graph| (QREFELT % 38))
         |slot| %)) 

(SDEFUN |VIEW2D;resize;%2PiV;16|
        ((|viewport| (%)) (|xSize| (|PositiveInteger|))
         (|ySize| (|PositiveInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 5 (CONS |xSize| |ySize|))
             (EXIT (|VIEW2D;message_II| |viewport| 103 |xSize| |ySize| %)))) 

(SDEFUN |VIEW2D;translate;%Pi2FV;17|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|xTranslateF| (|Float|)) (|yTranslateF| (|Float|)) (% (|Void|)))
        (SPROG ((|xTranslate| #1=(|DoubleFloat|)) (|yTranslate| #1#))
               (SEQ (LETT |xTranslate| (SPADCALL |xTranslateF| (QREFELT % 43)))
                    (LETT |yTranslate| (SPADCALL |yTranslateF| (QREFELT % 43)))
                    (COND
                     ((> |graphIndex| 9)
                      (|error| "Referring to a graph with too big an index")))
                    (QSETVELT
                     (SPADCALL (QVELT |viewport| 2) |graphIndex|
                               (QREFELT % 44))
                     2 |xTranslate|)
                    (QSETVELT
                     (SPADCALL (QVELT |viewport| 2) |graphIndex|
                               (QREFELT % 44))
                     3 |yTranslate|)
                    (EXIT
                     (|VIEW2D;message_IFF| |viewport| 0 |graphIndex|
                      |xTranslate| |yTranslate| %))))) 

(SDEFUN |VIEW2D;scale;%Pi2FV;18|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|xScaleF| (|Float|)) (|yScaleF| (|Float|)) (% (|Void|)))
        (SPROG ((|xScale| #1=(|DoubleFloat|)) (|yScale| #1#))
               (SEQ (LETT |xScale| (SPADCALL |xScaleF| (QREFELT % 43)))
                    (LETT |yScale| (SPADCALL |yScaleF| (QREFELT % 43)))
                    (COND
                     ((> |graphIndex| 9)
                      (|error| "Referring to a graph with too big an index")))
                    (QSETVELT
                     (SPADCALL (QVELT |viewport| 2) |graphIndex|
                               (QREFELT % 44))
                     0 |xScale|)
                    (QSETVELT
                     (SPADCALL (QVELT |viewport| 2) |graphIndex|
                               (QREFELT % 44))
                     1 |yScale|)
                    (EXIT
                     (|VIEW2D;message_IFF| |viewport| 1 |graphIndex| |xScale|
                      |yScale| %))))) 

(SDEFUN |VIEW2D;viewport2D;%;19| ((% (%)))
        (VECTOR 0 (MAKEARR1 9 (CONS 1 "undefined"))
                (MAKEARR1 9 (REPLACE (MAKEARR1 12 NIL) (QREFELT % 11)))
                "FriCAS2D"
                (CONS (SPADCALL (SPADCALL (QREFELT % 48)) 1 (QREFELT % 49))
                      (SPADCALL (SPADCALL (QREFELT % 48)) 2 (QREFELT % 49)))
                (CONS (SPADCALL (SPADCALL (QREFELT % 51)) 1 (QREFELT % 52))
                      (SPADCALL (SPADCALL (QREFELT % 51)) 2 (QREFELT % 52)))
                (LIST 0) NIL)) 

(SDEFUN |VIEW2D;makeViewport2D;GiL%;20|
        ((|g| (|GraphImage|)) (|opts| (|List| (|DrawOption|))) (% (%)))
        (SPROG ((|viewport| (%)))
               (SEQ (LETT |viewport| (SPADCALL (QREFELT % 53)))
                    (SPADCALL (QVELT |viewport| 1) 1 (CONS 0 |g|)
                              (QREFELT % 24))
                    (QSETVELT |viewport| 7 |opts|)
                    (COND
                     ((NULL (NULL (SPADCALL |opts| NIL (QREFELT % 55))))
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) 1 (QREFELT % 44)) 9 1)))
                    (EXIT (|VIEW2D;makeViewport2D0| |viewport| %))))) 

(SDEFUN |VIEW2D;makeViewport2D;2%;21| ((|viewport| (%)) (% (%)))
        (|VIEW2D;makeViewport2D0| (REPLACE (MAKEARR1 8 NIL) |viewport|) %)) 

(SDEFUN |VIEW2D;send_graphs|
        ((|vg| (|Vector| (|Union| (|GraphImage|) #1="undefined")))
         (% (|Void|)))
        (SPROG
         ((|i| NIL) (#2=#:G115 NIL) (|gu| (|Union| (|GraphImage|) #1#))
          (#3=#:G114 NIL) (|g| (|GraphImage|)))
         (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |vg|)) G190
              (COND ((|greater_SI| |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |gu| (SPADCALL |vg| |i| (QREFELT % 29)))
                     (EXIT
                      (COND
                       ((QEQCAR |gu| 1)
                        (PROGN (LETT #3# |$NoValue|) (GO #4=#:G105)))
                       ('T
                        (SEQ (LETT |g| (QCDR |gu|))
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |g| (QREFELT % 38)) 0)
                                (SPADCALL |g| (QREFELT % 58)))))))))))
               #4# (EXIT #3#))
              (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |VIEW2D;makeViewport2D0| ((|viewportDollar| (%)) (% (%)))
        (SPROG
         ((|viewport| (|Rep|)) (|i| NIL)
          (|g| (|Union| (|GraphImage|) "undefined"))
          (|gs|
           (|Record| (|:| |scaleX| (|DoubleFloat|))
                     (|:| |scaleY| (|DoubleFloat|))
                     (|:| |deltaX| (|DoubleFloat|))
                     (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                     (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                     (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                     (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                     (|:| |showing| (|Integer|))))
          (|hueShade| (|Integer|)))
         (SEQ (LETT |viewport| |viewportDollar|)
              (|VIEW2D;send_graphs| (QVELT |viewport| 1) %)
              (|VIEW2D;doOptions| |viewport| %)
              (SPADCALL
               "   FriCAS2D data being transmitted to the viewport manager..."
               (QREFELT % 60))
              (|sockSendInt| |$ViewportServer| 3)
              (|sockSendInt| |$ViewportServer| -1)
              (|sockSendString| |$ViewportServer| (QVELT |viewport| 3))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 4)))
              (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 4)))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 5)))
              (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 5)))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 6)))
              (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 9) (GO G191)))
                   (SEQ
                    (LETT |g|
                          (SPADCALL (SPADCALL |viewport| (QREFELT % 34)) |i|
                                    (QREFELT % 29)))
                    (EXIT
                     (COND ((QEQCAR |g| 1) (|sockSendInt| |$ViewportServer| 0))
                           ('T
                            (SEQ
                             (|sockSendInt| |$ViewportServer|
                                            (SPADCALL (QCDR |g|)
                                                      (QREFELT % 38)))
                             (LETT |gs|
                                   (SPADCALL
                                    (SPADCALL |viewport| (QREFELT % 33)) |i|
                                    (QREFELT % 44)))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 0))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 1))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 2))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 3))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 4))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 5))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 6))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 7))
                             (LETT |hueShade|
                                   (+
                                    (SPADCALL
                                     (SPADCALL (QVELT |gs| 8) (QREFELT % 62))
                                     (QREFELT % 63))
                                    (* (SPADCALL (QVELT |gs| 8) (QREFELT % 64))
                                       (SPADCALL (QREFELT % 65)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 9))
                             (LETT |hueShade|
                                   (+
                                    (SPADCALL
                                     (SPADCALL (QVELT |gs| 10) (QREFELT % 62))
                                     (QREFELT % 63))
                                    (*
                                     (SPADCALL (QVELT |gs| 10) (QREFELT % 64))
                                     (SPADCALL (QREFELT % 65)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (EXIT
                              (|sockSendInt| |$ViewportServer|
                                             (QVELT |gs| 11))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |viewport| 0 (|sockGetInt| |$ViewportServer|))
              (EXIT |viewport|)))) 

(SDEFUN |VIEW2D;graphState;%Pi4Df4IPIPIV;24|
        ((|viewport| (%)) (|num| (|PositiveInteger|)) (|sX| (|DoubleFloat|))
         (|sY| (|DoubleFloat|)) (|dX| (|DoubleFloat|)) (|dY| (|DoubleFloat|))
         (|Points| (|Integer|)) (|Lines| (|Integer|)) (|Spline| (|Integer|))
         (|Axes| (|Integer|)) (|AxesColor| (|Palette|)) (|Units| (|Integer|))
         (|UnitsColor| (|Palette|)) (|Showing| (|Integer|)) (% (|Void|)))
        (SPADCALL (QVELT |viewport| 2) |num|
                  (VECTOR |sX| |sY| |dX| |dY| |Points| |Lines| |Spline| |Axes|
                          |AxesColor| |Units| |UnitsColor| |Showing|)
                  (QREFELT % 66))) 

(SDEFUN |VIEW2D;title;%SV;25|
        ((|viewport| (%)) (|Title| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G136 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 13)) 0
                                   (QREFELT % 15))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G134)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;reset;%V;26| ((|viewport| (%)) (% (|Void|)))
        (|VIEW2D;message_I| |viewport| 100 5 %)) 

(SDEFUN |VIEW2D;axes;%PiSV;27|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          7 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 8 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;axes;%PiPV;28|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|color| (|Palette|)) (% (|Void|)))
        (SPROG ((|hueShade| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 44)) 8
                 |color|)
                (LETT |hueShade|
                      (+
                       (SPADCALL (SPADCALL |color| (QREFELT % 62))
                                 (QREFELT % 63))
                       (* (SPADCALL |color| (QREFELT % 64))
                          (SPADCALL (QREFELT % 65)))))
                (EXIT
                 (|VIEW2D;message_II| |viewport| 112 |graphIndex| |hueShade|
                  %))))) 

(SDEFUN |VIEW2D;units;%PiSV;29|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          9 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 9 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;units;%PiPV;30|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|color| (|Palette|)) (% (|Void|)))
        (SPROG ((|hueShade| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 44)) 10
                 |color|)
                (LETT |hueShade|
                      (+
                       (SPADCALL (SPADCALL |color| (QREFELT % 62))
                                 (QREFELT % 63))
                       (* (SPADCALL |color| (QREFELT % 64))
                          (SPADCALL (QREFELT % 65)))))
                (EXIT
                 (|VIEW2D;message_II| |viewport| 113 |graphIndex| |hueShade|
                  %))))) 

(SDEFUN |VIEW2D;connect;%PiSV;31|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          5 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 3 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;points;%PiSV;32|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          4 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 2 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;region;%PiSV;33|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          6 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 4 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;show;%PiSV;34|
        ((|vp| (%)) (|graphIndex| (|PositiveInteger|)) (|onOff| (|String|))
         (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                (QSETVELT (SPADCALL (QVELT |vp| 2) |graphIndex| (QREFELT % 44))
                          11 |flag|)
                (EXIT (|VIEW2D;message_II| |vp| 105 |graphIndex| |flag| %))))) 

(SDEFUN |VIEW2D;controlPanel;%SV;35|
        ((|viewport| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|status| (|Integer|)))
               (SEQ (LETT |status| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (PROGN
                     (RPLACA #1=(QVELT |viewport| 6) |status|)
                     (QCAR #1#))
                    (EXIT (|VIEW2D;message_I| |viewport| 6 |status| %))))) 

(SDEFUN |VIEW2D;close;%V;36| ((|viewport| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT % 13)) 0 (QREFELT % 15))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 7)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| %)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (QSETVELT |viewport| 0 0)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT % 79)))))) 

(SDEFUN |VIEW2D;coerce;%Of;37| ((|viewport| (%)) (% (|OutputForm|)))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT % 13)) 0)
          (SPADCALL
           (LIST
            (SPADCALL "Closed or Undefined TwoDimensionalViewport: "
                      (QREFELT % 82))
            (SPADCALL (QVELT |viewport| 3) (QREFELT % 83)))
           (QREFELT % 85)))
         ('T
          (SPADCALL
           (LIST (SPADCALL "TwoDimensionalViewport: " (QREFELT % 82))
                 (SPADCALL (QVELT |viewport| 3) (QREFELT % 83)))
           (QREFELT % 85))))) 

(SDEFUN |VIEW2D;write;%3S;38|
        ((|viewport| (%)) (|Filename| (|String|)) (|aThingToWrite| (|String|))
         (% (|String|)))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT % 88))) 

(SDEFUN |VIEW2D;write;%2S;39|
        ((|viewport| (%)) (|Filename| (|String|)) (% (|String|)))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT % 90))
                  (QREFELT % 88))) 

(SDEFUN |VIEW2D;write;%SLS;40|
        ((|viewport| (%)) (|Filename| (|String|))
         (|thingsToWrite| (|List| (|String|))) (% (|String|)))
        (SPROG
         ((|avail| (|List| (|String|))) (|m| (|Integer|)) (|aTypeOfFile| NIL)
          (#1=#:G185 NIL) (|writeTypeInt| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT % 13)) 0 (QREFELT % 15))
            (SEQ (|sockSendInt| |$ViewportServer| 3)
                 (|sockSendInt| |$ViewportServer| 110)
                 (EXIT
                  (COND
                   ((|VIEW2D;checkViewport| |viewport| %)
                    (SEQ (|sockSendString| |$ViewportServer| |Filename|)
                         (LETT |m|
                               (PROGN
                                (LETT |avail| (SPADCALL (QREFELT % 92)))
                                1))
                         (SEQ (LETT |aTypeOfFile| NIL)
                              (LETT #1# |thingsToWrite|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |aTypeOfFile| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |writeTypeInt|
                                     (-
                                      (SPADCALL
                                       (SPADCALL |aTypeOfFile| (QREFELT % 93))
                                       |avail| (QREFELT % 94))
                                      |m|))
                               (EXIT
                                (COND
                                 ((< |writeTypeInt| 0)
                                  (SPADCALL
                                   (LIST "  > " |aTypeOfFile|
                                         " is not a valid file type for writing a 2D viewport")
                                   (QREFELT % 95)))
                                 ('T
                                  (|sockSendInt| |$ViewportServer|
                                                 (+ |writeTypeInt| 1))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (|sockSendInt| |$ViewportServer| 0)
                         (|sockGetInt| |$ViewportServer|)
                         (EXIT |Filename|))))))))))) 

(DECLAIM (NOTINLINE |TwoDimensionalViewport;|)) 

(DEFUN |TwoDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TwoDimensionalViewport|))
          (LETT % (GETREFV 97))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TwoDimensionalViewport| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |graphsField|
                                   (|Vector|
                                    (|Union| (|GraphImage|) "undefined")))
                              (|:| |graphStatesField|
                                   (|Vector|
                                    (|Record| (|:| |scaleX| (|DoubleFloat|))
                                              (|:| |scaleY| (|DoubleFloat|))
                                              (|:| |deltaX| (|DoubleFloat|))
                                              (|:| |deltaY| (|DoubleFloat|))
                                              (|:| |points| (|Integer|))
                                              (|:| |connect| (|Integer|))
                                              (|:| |spline| (|Integer|))
                                              (|:| |axes| (|Integer|))
                                              (|:| |axesColor| (|Palette|))
                                              (|:| |units| (|Integer|))
                                              (|:| |unitsColor| (|Palette|))
                                              (|:| |showing| (|Integer|)))))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV % 11
                    (VECTOR (|mk_DF| 9 -1) (|mk_DF| 9 -1) 0.0 0.0 1 1 0 1
                            (SPADCALL (QREFELT % 9)) 0
                            (SPADCALL (QREFELT % 10)) 1))
          %))) 

(DEFUN |TwoDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G187)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TwoDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TwoDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|TwoDimensionalViewport;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|TwoDimensionalViewport|)))))))))) 

(MAKEPROP '|TwoDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Palette|)
              (|ViewDefaultsPackage|) (0 . |axesColorDefault|)
              (4 . |unitsColorDefault|) '|defaultGS| (|Integer|)
              |VIEW2D;key;%I;12| (|Boolean|) (8 . ~=) (|String|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|) (14 . |title|)
              |VIEW2D;options;%L;6| |VIEW2D;options;%L%;7|
              (|Union| 26 '"undefined") (|Vector| 22) (20 . |setelt!|) (|Void|)
              (|GraphImage|) (|PositiveInteger|) |VIEW2D;putGraph;%GiPiV;8|
              (27 . |elt|) |VIEW2D;getGraph;%PiGi;9|
              (|Record| (|:| |scaleX| 41) (|:| |scaleY| 41) (|:| |deltaX| 41)
                        (|:| |deltaY| 41) (|:| |points| 12) (|:| |connect| 12)
                        (|:| |spline| 12) (|:| |axes| 12) (|:| |axesColor| 7)
                        (|:| |units| 12) (|:| |unitsColor| 7)
                        (|:| |showing| 12))
              (|Vector| 31) |VIEW2D;graphStates;%V;10| |VIEW2D;graphs;%V;11|
              (|NonNegativeInteger|) |VIEW2D;dimensions;%2Nni2PiV;13|
              |VIEW2D;move;%2NniV;14| (33 . |key|) |VIEW2D;update;%GiPiV;15|
              |VIEW2D;resize;%2PiV;16| (|DoubleFloat|) (|Float|)
              (38 . |convert|) (43 . |elt|) |VIEW2D;translate;%Pi2FV;17|
              |VIEW2D;scale;%Pi2FV;18| (|List| 35) (49 . |viewPosDefault|)
              (53 . |elt|) (|List| 27) (59 . |viewSizeDefault|) (63 . |elt|)
              |VIEW2D;viewport2D;%;19| (|List| 42) (69 . |units|)
              |VIEW2D;makeViewport2D;GiL%;20| |VIEW2D;makeViewport2D;2%;21|
              (75 . |sendGraphImage|) (|DisplayPackage|) (80 . |say|) (|Color|)
              (85 . |hue|) (90 . |hue|) (95 . |shade|) (100 . |numberOfHues|)
              (104 . |setelt!|) |VIEW2D;graphState;%Pi4Df4IPIPIV;24|
              |VIEW2D;title;%SV;25| |VIEW2D;reset;%V;26| |VIEW2D;axes;%PiSV;27|
              |VIEW2D;axes;%PiPV;28| |VIEW2D;units;%PiSV;29|
              |VIEW2D;units;%PiPV;30| |VIEW2D;connect;%PiSV;31|
              |VIEW2D;points;%PiSV;32| |VIEW2D;region;%PiSV;33|
              |VIEW2D;show;%PiSV;34| |VIEW2D;controlPanel;%SV;35|
              (111 . |void|) |VIEW2D;close;%V;36| (|OutputForm|)
              (115 . |message|) (120 . |coerce|) (|List| %) (125 . |hconcat|)
              |VIEW2D;coerce;%Of;37| (|List| 16) |VIEW2D;write;%SLS;40|
              |VIEW2D;write;%3S;38| (130 . |viewWriteDefault|)
              |VIEW2D;write;%2S;39| (134 . |viewWriteAvailable|)
              (138 . |upperCase|) (143 . |position|) (149 . |say|)
              (|List| (|Point| 41)))
           '#(~= 154 |write| 160 |viewport2D| 180 |update| 184 |units| 191
              |translate| 205 |title| 213 |show| 219 |scale| 226 |resize| 234
              |reset| 241 |region| 246 |putGraph| 253 |points| 260 |options|
              267 |move| 278 |makeViewport2D| 285 |latex| 296 |key| 301
              |graphs| 306 |graphStates| 311 |graphState| 316 |getPickedPoints|
              334 |getGraph| 339 |dimensions| 345 |controlPanel| 354 |connect|
              360 |coerce| 367 |close| 372 |axes| 377 = 391)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 81) (|BasicType|))
                        (|makeByteWordVec2| 96
                                            '(0 8 7 9 0 8 7 10 2 12 14 0 0 15 2
                                              18 16 17 16 19 3 23 22 0 12 22 24
                                              2 23 22 0 12 29 1 26 12 0 38 1 42
                                              41 0 43 2 32 31 0 12 44 0 8 47 48
                                              2 47 35 0 12 49 0 8 50 51 2 50 27
                                              0 12 52 2 18 54 17 54 55 1 26 25
                                              0 58 1 59 25 16 60 1 7 61 0 62 1
                                              61 12 0 63 1 7 12 0 64 0 61 27 65
                                              3 32 31 0 12 31 66 0 25 0 79 1 81
                                              0 16 82 1 16 81 0 83 1 81 0 84 85
                                              0 8 87 90 0 8 87 92 1 16 0 0 93 2
                                              87 12 16 0 94 1 59 25 87 95 2 0
                                              14 0 0 1 2 0 16 0 16 91 3 0 16 0
                                              16 87 88 3 0 16 0 16 16 89 0 0 0
                                              53 3 0 25 0 26 27 39 3 0 25 0 27
                                              16 72 3 0 25 0 27 7 73 4 0 25 0
                                              27 42 42 45 2 0 25 0 16 68 3 0 25
                                              0 27 16 77 4 0 25 0 27 42 42 46 3
                                              0 25 0 27 27 40 1 0 25 0 69 3 0
                                              25 0 27 16 76 3 0 25 0 26 27 28 3
                                              0 25 0 27 16 75 1 0 17 0 20 2 0 0
                                              0 17 21 3 0 25 0 35 35 37 1 0 0 0
                                              57 2 0 0 26 17 56 1 0 16 0 1 1 0
                                              12 0 13 1 0 23 0 34 1 0 32 0 33
                                              14 0 25 0 27 41 41 41 41 12 12 12
                                              12 7 12 7 12 67 1 0 96 0 1 2 0 26
                                              0 27 30 5 0 25 0 35 35 27 27 36 2
                                              0 25 0 16 78 3 0 25 0 27 16 74 1
                                              0 81 0 86 1 0 25 0 80 3 0 25 0 27
                                              16 70 3 0 25 0 27 7 71 2 0 14 0 0
                                              1)))))
           '|lookupComplete|)) 
