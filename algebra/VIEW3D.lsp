
(SDEFUN |VIEW3D;checkViewport| ((|viewport| (%)) (% (|Boolean|)))
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

(SDEFUN |VIEW3D;message_I|
        ((|vp| (%)) (|cmd| (|Integer|)) (|i| (|Integer|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |vp| %)
                   (SEQ (|sockSendInt| |$ViewportServer| |i|)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW3D;message_II|
        ((|vp| (%)) (|cmd| (|Integer|)) (|i1| (|Integer|)) (|i2| (|Integer|))
         (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |vp| %)
                   (SEQ
                    (SEQ (|sockSendInt| |$ViewportServer| |i1|)
                         (EXIT (|sockSendInt| |$ViewportServer| |i2|)))
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW3D;message_F|
        ((|vp| (%)) (|cmd| (|Integer|)) (|f| (|DoubleFloat|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |vp| %)
                   (SEQ (|sockSendFloat| |$ViewportServer| |f|)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW3D;message_FF|
        ((|vp| (%)) (|cmd| (|Integer|)) (|f1| (|DoubleFloat|))
         (|f2| (|DoubleFloat|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |vp| %)
                   (SEQ
                    (SEQ (|sockSendFloat| |$ViewportServer| |f1|)
                         (EXIT (|sockSendFloat| |$ViewportServer| |f2|)))
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW3D;message_FFF|
        ((|vp| (%)) (|cmd| (|Integer|)) (|f1| (|DoubleFloat|))
         (|f2| (|DoubleFloat|)) (|f3| (|DoubleFloat|)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |vp| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| |cmd|)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |vp| %)
                   (SEQ
                    (SEQ (|sockSendFloat| |$ViewportServer| |f1|)
                         (|sockSendFloat| |$ViewportServer| |f2|)
                         (EXIT (|sockSendFloat| |$ViewportServer| |f3|)))
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))))) 

(SDEFUN |VIEW3D;doOptions| ((|v| (|Rep|)) (% (|Void|)))
        (SPROG ((|st| (|String|)))
               (SEQ
                (QSETVELT |v| 2
                          (SPADCALL (QVELT |v| 12) "FriCAS3D" (QREFELT % 30)))
                (LETT |st| (SPADCALL (QVELT |v| 12) "render" (QREFELT % 31)))
                (COND
                 ((OR (EQUAL |st| "shade") (EQUAL |st| "render"))
                  (QSETVELT (QVELT |v| 7) 1 3))
                 ((OR (EQUAL |st| "solid") (EQUAL |st| "opaque"))
                  (QSETVELT (QVELT |v| 7) 1 7))
                 ((EQUAL |st| "contour") (QSETVELT (QVELT |v| 7) 1 24))
                 ((EQUAL |st| "smooth") (QSETVELT (QVELT |v| 7) 1 22))
                 ((EQUAL |st| "wireMesh") (QSETVELT (QVELT |v| 7) 1 9))
                 ('T (QSETVELT (QVELT |v| 7) 1 3)))
                (EXIT
                 (QSETVELT |v| 5
                           (SPADCALL (QVELT |v| 12)
                                     (VECTOR (QREFELT % 18) (QREFELT % 20)
                                             (QREFELT % 21) 1.0 1.0 1.0
                                             (QREFELT % 22) (QREFELT % 23))
                                     (QREFELT % 33))))))) 

(SDEFUN |VIEW3D;viewport3D;%;8| ((% (%)))
        (VECTOR 0 1 "FriCAS3D"
                (CONS (SPADCALL (SPADCALL (QREFELT % 36)) 1 (QREFELT % 38))
                      (SPADCALL (SPADCALL (QREFELT % 36)) 2 (QREFELT % 38)))
                (CONS (SPADCALL (SPADCALL (QREFELT % 40)) 1 (QREFELT % 41))
                      (SPADCALL (SPADCALL (QREFELT % 40)) 2 (QREFELT % 41)))
                (VECTOR (QREFELT % 18) (QREFELT % 20) (QREFELT % 21) 1.0 1.0
                        1.0 (QREFELT % 22) (QREFELT % 23))
                (CONS 0 27) (VECTOR 0 3 1 0 1 0)
                (VECTOR 0.0 0.0 1.0 0.0 0.0 1.0)
                (VECTOR 1 (FLOAT 500 MOST-POSITIVE-DOUBLE-FLOAT)
                        (FLOAT -250 MOST-POSITIVE-DOUBLE-FLOAT))
                (VECTOR 0.0 1.0 0.0 1.0 0.0 1.0 0 1) (SPADCALL (QREFELT % 43))
                NIL)) 

(MAKEPROP '|VIEW3D;subspace;%Ts;9| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 11))) 

(SDEFUN |VIEW3D;subspace;%Ts;9|
        ((|viewport| (%)) (% (|ThreeSpace| (|DoubleFloat|))))
        (QVELT |viewport| 11)) 

(SDEFUN |VIEW3D;subspace;%Ts%;10|
        ((|viewport| (%)) (|space| (|ThreeSpace| (|DoubleFloat|))) (% (%)))
        (SEQ (QSETVELT |viewport| 11 |space|) (EXIT |viewport|))) 

(MAKEPROP '|VIEW3D;options;%L;11| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 12))) 

(SDEFUN |VIEW3D;options;%L;11| ((|viewport| (%)) (% (|List| (|DrawOption|))))
        (QVELT |viewport| 12)) 

(SDEFUN |VIEW3D;options;%L%;12|
        ((|viewport| (%)) (|opts| (|List| (|DrawOption|))) (% (%)))
        (SEQ (QSETVELT |viewport| 12 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW3D;makeViewport3D;2%;13| ((|viewport| (%)) (% (%)))
        (|VIEW3D;makeViewport3D0| (REPLACE (MAKEARR1 13 NIL) |viewport|) %)) 

(SDEFUN |VIEW3D;makeViewport3D;TsS%;14|
        ((|space| (|ThreeSpace| (|DoubleFloat|))) (|Title| (|String|)) (% (%)))
        (SPROG ((|v| (%)))
               (SEQ (LETT |v| (SPADCALL (QREFELT % 44)))
                    (QSETVELT |v| 11 |space|)
                    (QSETVELT |v| 12 (LIST (SPADCALL |Title| (QREFELT % 51))))
                    (EXIT (|VIEW3D;makeViewport3D0| |v| %))))) 

(SDEFUN |VIEW3D;makeViewport3D;TsL%;15|
        ((|space| (|ThreeSpace| (|DoubleFloat|)))
         (|opts| (|List| (|DrawOption|))) (% (%)))
        (SPROG ((|v| (%)))
               (SEQ (LETT |v| (SPADCALL (QREFELT % 44)))
                    (QSETVELT |v| 11 |space|) (QSETVELT |v| 12 |opts|)
                    (EXIT (|VIEW3D;makeViewport3D0| |v| %))))) 

(SDEFUN |VIEW3D;makeViewport3D0| ((|viewport| (%)) (% (%)))
        (SPROG
         ((|transform|
           (|Mapping| #1=(|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|))))
          (|lpts| (|List| (|Point| (|DoubleFloat|))))
          (|lllipts| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|llprops| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|lprops| (|List| (|SubSpaceComponentProperty|)))
          (|s| (|Set| (|PositiveInteger|))) (#2=#:G113 NIL)
          (|n| (|PositiveInteger|)) (|pt| NIL) (#3=#:G114 NIL) (|aPoint| #1#)
          (|onelprops| NIL) (#4=#:G117 NIL) (|oneprop| NIL) (#5=#:G116 NIL)
          (|allipts| NIL) (#6=#:G115 NIL) (|tinyprop| NIL) (#7=#:G119 NIL)
          (|alipts| NIL) (#8=#:G118 NIL) (|oneIndexedPoint| NIL)
          (#9=#:G120 NIL))
         (SEQ (|VIEW3D;doOptions| |viewport| %)
              (SPADCALL "   Transmitting data..." (QREFELT % 56))
              (LETT |transform|
                    (SPADCALL (QVELT |viewport| 12) (ELT % 59) (QREFELT % 61)))
              (SPADCALL (QVELT |viewport| 11) (QREFELT % 62))
              (LETT |lpts| (SPADCALL (QVELT |viewport| 11) (QREFELT % 64)))
              (LETT |lllipts| (SPADCALL (QVELT |viewport| 11) (QREFELT % 66)))
              (LETT |llprops| (SPADCALL (QVELT |viewport| 11) (QREFELT % 68)))
              (LETT |lprops| (SPADCALL (QVELT |viewport| 11) (QREFELT % 70)))
              (LETT |s| (SPADCALL (QREFELT % 72)))
              (SEQ (LETT |pt| NIL) (LETT #2# |lpts|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |pt| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |pt| (QREFELT % 73)) |s|
                               (QREFELT % 74))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((> (SPADCALL |s| (QREFELT % 75)) 1)
                 (|error| "All points should have the same dimension"))
                (#10='T
                 (SEQ (LETT |n| (|SPADfirst| (SPADCALL |s| (QREFELT % 76))))
                      (EXIT
                       (COND
                        ((< |n| 3)
                         (|error|
                          "Dimension of points should be greater than 2"))
                        (#10#
                         (SEQ
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT |viewport| 1))
                          (|sockSendInt| |$ViewportServer| -1)
                          (|sockSendString| |$ViewportServer|
                                            (QVELT |viewport| 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 6))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 7))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 3))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 4))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 5))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 1))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 3)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 3)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 4)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 4)))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 0))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 1))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 2))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 3))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 4))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 5))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 10) 6))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 10) 7))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 6)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 6)))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 1))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 5))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 9) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 9) 1))
                          (|sockSendInt| |$ViewportServer| (LENGTH |lpts|))
                          (SEQ (LETT |pt| NIL) (LETT #3# |lpts|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |pt| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ (LETT |aPoint| (SPADCALL |pt| |transform|))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT % 79)))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT % 80)))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT % 81)))
                                    (EXIT
                                     (COND
                                      ((EQL |n| 3)
                                       (|sockSendFloat| |$ViewportServer|
                                                        (SPADCALL |aPoint|
                                                                  (QREFELT %
                                                                           81))))
                                      ('T
                                       (|sockSendFloat| |$ViewportServer|
                                                        (SPADCALL |aPoint|
                                                                  (QREFELT %
                                                                           82)))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                          (|sockSendInt| |$ViewportServer| (LENGTH |lllipts|))
                          (SEQ (LETT |onelprops| NIL) (LETT #4# |llprops|)
                               (LETT |oneprop| NIL) (LETT #5# |lprops|)
                               (LETT |allipts| NIL) (LETT #6# |lllipts|) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |allipts| (CAR #6#)) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |oneprop| (CAR #5#)) NIL)
                                     (ATOM #4#)
                                     (PROGN (LETT |onelprops| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (|sockSendInt| |$ViewportServer|
                                               (COND
                                                ((SPADCALL |oneprop|
                                                           (QREFELT % 84))
                                                 1)
                                                ('T 0)))
                                (|sockSendInt| |$ViewportServer|
                                               (COND
                                                ((SPADCALL |oneprop|
                                                           (QREFELT % 85))
                                                 1)
                                                ('T 0)))
                                (|sockSendInt| |$ViewportServer|
                                               (LENGTH |allipts|))
                                (EXIT
                                 (SEQ (LETT |tinyprop| NIL)
                                      (LETT #7# |onelprops|)
                                      (LETT |alipts| NIL) (LETT #8# |allipts|)
                                      G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN
                                             (LETT |alipts| (CAR #8#))
                                             NIL)
                                            (ATOM #7#)
                                            (PROGN
                                             (LETT |tinyprop| (CAR #7#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (|sockSendInt| |$ViewportServer|
                                                      (COND
                                                       ((SPADCALL |tinyprop|
                                                                  (QREFELT %
                                                                           84))
                                                        1)
                                                       ('T 0)))
                                       (|sockSendInt| |$ViewportServer|
                                                      (COND
                                                       ((SPADCALL |tinyprop|
                                                                  (QREFELT %
                                                                           85))
                                                        1)
                                                       ('T 0)))
                                       (|sockSendInt| |$ViewportServer|
                                                      (SPADCALL |alipts|
                                                                (QREFELT %
                                                                         86)))
                                       (EXIT
                                        (SEQ (LETT |oneIndexedPoint| NIL)
                                             (LETT #9# |alipts|) G190
                                             (COND
                                              ((OR (ATOM #9#)
                                                   (PROGN
                                                    (LETT |oneIndexedPoint|
                                                          (CAR #9#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (|sockSendInt| |$ViewportServer|
                                                              |oneIndexedPoint|)))
                                             (LETT #9# (CDR #9#)) (GO G190)
                                             G191 (EXIT NIL))))
                                      (LETT #8#
                                            (PROG1 (CDR #8#)
                                              (LETT #7# (CDR #7#))))
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT #6#
                                     (PROG1 (CDR #6#)
                                       (LETT #5#
                                             (PROG1 (CDR #5#)
                                               (LETT #4# (CDR #4#))))))
                               (GO G190) G191 (EXIT NIL))
                          (QSETVELT |viewport| 0
                                    (|sockGetInt| |$ViewportServer|))
                          (EXIT |viewport|)))))))))))) 

(SDEFUN |VIEW3D;viewThetaDefault;F;17| ((% (|Float|)))
        (SPADCALL (QREFELT % 18) (QREFELT % 87))) 

(SDEFUN |VIEW3D;viewThetaDefault;2F;18| ((|t| (|Float|)) (% (|Float|)))
        (SEQ (SETELT % 18 (SPADCALL |t| (QREFELT % 17))) (EXIT |t|))) 

(SDEFUN |VIEW3D;viewPhiDefault;F;19| ((% (|Float|)))
        (SPADCALL (QREFELT % 20) (QREFELT % 87))) 

(SDEFUN |VIEW3D;viewPhiDefault;2F;20| ((|t| (|Float|)) (% (|Float|)))
        (SEQ (SETELT % 20 (SPADCALL |t| (QREFELT % 17))) (EXIT |t|))) 

(SDEFUN |VIEW3D;viewZoomDefault;F;21| ((% (|Float|)))
        (SPADCALL (QREFELT % 21) (QREFELT % 87))) 

(SDEFUN |VIEW3D;viewZoomDefault;2F;22| ((|t| (|Float|)) (% (|Float|)))
        (SEQ (SETELT % 21 (SPADCALL |t| (QREFELT % 17))) (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;F;23| ((% (|Float|)))
        (SPADCALL (QREFELT % 22) (QREFELT % 87))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;2F;24| ((|t| (|Float|)) (% (|Float|)))
        (SEQ (SETELT % 22 (SPADCALL |t| (QREFELT % 17))) (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;F;25| ((% (|Float|)))
        (SPADCALL (QREFELT % 23) (QREFELT % 87))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;2F;26| ((|t| (|Float|)) (% (|Float|)))
        (SEQ (SETELT % 23 (SPADCALL |t| (QREFELT % 17))) (EXIT |t|))) 

(SDEFUN |VIEW3D;lighting;%3FV;27|
        ((|viewport| (%)) (|Xlight| (|Float|)) (|Ylight| (|Float|))
         (|Zlight| (|Float|)) (% (|Void|)))
        (SPROG ((|f1| #1=(|DoubleFloat|)) (|f2| #1#) (|f3| #1#))
               (SEQ (LETT |f1| (SPADCALL |Xlight| (QREFELT % 17)))
                    (LETT |f2| (SPADCALL |Ylight| (QREFELT % 17)))
                    (LETT |f3| (SPADCALL |Zlight| (QREFELT % 17)))
                    (QSETVELT (QVELT |viewport| 8) 0 |f1|)
                    (QSETVELT (QVELT |viewport| 8) 1 |f2|)
                    (QSETVELT (QVELT |viewport| 8) 2 |f3|)
                    (EXIT
                     (|VIEW3D;message_FFF| |viewport| 108 |f1| |f2| |f3| %))))) 

(SDEFUN |VIEW3D;axes;%SV;28| ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 7) 2 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 6 |flag| %))))) 

(SDEFUN |VIEW3D;diagonals;%SV;29|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 7) 3 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 26 |flag| %))))) 

(SDEFUN |VIEW3D;outlineRender;%SV;30|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 7) 4 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 13 |flag| %))))) 

(SDEFUN |VIEW3D;controlPanel;%SV;31|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 7) 0 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 4 |flag| %))))) 

(SDEFUN |VIEW3D;drawStyle;%SV;32|
        ((|viewport| (%)) (|how| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G154 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |how| "shade") (QSETVELT (QVELT |viewport| 7) 1 3))
                   ((EQUAL |how| "solid") (QSETVELT (QVELT |viewport| 7) 1 7))
                   ((EQUAL |how| "contour")
                    (QSETVELT (QVELT |viewport| 7) 1 24))
                   ((EQUAL |how| "smooth")
                    (QSETVELT (QVELT |viewport| 7) 1 22))
                   ('T (QSETVELT (QVELT |viewport| 7) 1 9)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0
                               (QREFELT % 26))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer|
                                                (QVELT (QVELT |viewport| 7) 1))
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| %)
                                    (|sockGetInt| |$ViewportServer|))))))
                      (GO #2=#:G152)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;reset;%V;33| ((|viewport| (%)) (% (|Void|)))
        (|VIEW3D;message_I| |viewport| 100 8 %)) 

(SDEFUN |VIEW3D;close;%V;34| ((|viewport| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0 (QREFELT % 26))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| 5)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |viewport| %)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (QSETVELT |viewport| 0 0)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT % 105)))))) 

(SDEFUN |VIEW3D;viewpoint;%R;35|
        ((|viewport| (%))
         (%
          (|Record| (|:| |theta| (|DoubleFloat|)) (|:| |phi| (|DoubleFloat|))
                    (|:| |scale| (|DoubleFloat|))
                    (|:| |scaleX| (|DoubleFloat|))
                    (|:| |scaleY| (|DoubleFloat|))
                    (|:| |scaleZ| (|DoubleFloat|))
                    (|:| |deltaX| (|DoubleFloat|))
                    (|:| |deltaY| (|DoubleFloat|)))))
        (SPROG
         ((|deltaX_sf| (|DoubleFloat|)) (|deltaY_sf| (|DoubleFloat|))
          (|scale_sf| (|DoubleFloat|)) (|scaleX_sf| (|DoubleFloat|))
          (|scaleY_sf| (|DoubleFloat|)) (|scaleZ_sf| (|DoubleFloat|))
          (|theta_sf| (|DoubleFloat|)) (|phi_sf| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0 (QREFELT % 26))
            (SEQ (|sockSendInt| |$ViewportServer| 1)
                 (|sockSendInt| |$ViewportServer| 117)
                 (EXIT
                  (COND
                   ((|VIEW3D;checkViewport| |viewport| %)
                    (SEQ (LETT |deltaX_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |deltaY_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scale_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleX_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleY_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleZ_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |theta_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |phi_sf| (|sockGetFloat| |$ViewportServer|))
                         (|sockGetInt| |$ViewportServer|)
                         (EXIT
                          (QSETVELT |viewport| 5
                                    (VECTOR |theta_sf| |phi_sf| |scale_sf|
                                            |scaleX_sf| |scaleY_sf| |scaleZ_sf|
                                            |deltaX_sf| |deltaY_sf|)))))
                   (#1='T (QVELT |viewport| 5))))))
           (#1# (QVELT |viewport| 5)))))) 

(SDEFUN |VIEW3D;viewpoint;%RV;36|
        ((|viewport| (%))
         (|viewpt|
          (|Record| (|:| |theta| (|DoubleFloat|)) (|:| |phi| (|DoubleFloat|))
                    (|:| |scale| (|DoubleFloat|))
                    (|:| |scaleX| (|DoubleFloat|))
                    (|:| |scaleY| (|DoubleFloat|))
                    (|:| |scaleZ| (|DoubleFloat|))
                    (|:| |deltaX| (|DoubleFloat|))
                    (|:| |deltaY| (|DoubleFloat|))))
         (% (|Void|)))
        (SPROG ((#1=#:G171 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 |viewpt|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0
                                   (QREFELT % 26))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 118)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           6))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           7))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           2))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           3))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           4))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           5))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           0))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           1))
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G169)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;viewpoint;%5FV;37|
        ((|viewport| (%)) (|Theta| (|Float|)) (|Phi| (|Float|))
         (|Scale| (|Float|)) (|DeltaX| (|Float|)) (|DeltaY| (|Float|))
         (% (|Void|)))
        (QSETVELT |viewport| 5
                  (VECTOR (SPADCALL |Theta| (QREFELT % 17))
                          (SPADCALL |Phi| (QREFELT % 17))
                          (SPADCALL |Scale| (QREFELT % 17)) 1.0 1.0 1.0
                          (SPADCALL |DeltaX| (QREFELT % 17))
                          (SPADCALL |DeltaY| (QREFELT % 17))))) 

(SDEFUN |VIEW3D;viewpoint;%2I3FV;38|
        ((|viewport| (%)) (|Theta| (|Integer|)) (|Phi| (|Integer|))
         (|Scale| (|Float|)) (|DeltaX| (|Float|)) (|DeltaY| (|Float|))
         (% (|Void|)))
        (QSETVELT |viewport| 5
                  (VECTOR
                   (|mul_DF| (FLOAT |Theta| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT % 15))
                   (|mul_DF| (FLOAT |Phi| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT % 15))
                   (SPADCALL |Scale| (QREFELT % 17)) 1.0 1.0 1.0
                   (SPADCALL |DeltaX| (QREFELT % 17))
                   (SPADCALL |DeltaY| (QREFELT % 17))))) 

(SDEFUN |VIEW3D;viewpoint;%2FV;39|
        ((|viewport| (%)) (|Theta| (|Float|)) (|Phi| (|Float|)) (% (|Void|)))
        (SEQ
         (QSETVELT (QVELT |viewport| 5) 0 (SPADCALL |Theta| (QREFELT % 17)))
         (EXIT
          (QSETVELT (QVELT |viewport| 5) 1 (SPADCALL |Phi| (QREFELT % 17)))))) 

(SDEFUN |VIEW3D;viewpoint;%3FV;40|
        ((|viewport| (%)) (X (|Float|)) (Y (|Float|)) (Z (|Float|))
         (% (|Void|)))
        (SPROG ((R (|Float|)) (|Theta| #1=(|Float|)) (|Phi| #1#))
               (SEQ
                (COND
                 ((SPADCALL X (|spadConstant| % 9) (QREFELT % 112))
                  (COND
                   ((SPADCALL Y (|spadConstant| % 9) (QREFELT % 112))
                    (SEQ (LETT |Theta| (|spadConstant| % 9))
                         (EXIT
                          (COND
                           ((SPADCALL Z (|spadConstant| % 9) (QREFELT % 113))
                            (LETT |Phi| (|spadConstant| % 9)))
                           (#2='T (LETT |Phi| (SPADCALL (QREFELT % 8))))))))
                   (#2#
                    (SEQ
                     (LETT |Theta|
                           (SPADCALL
                            (SPADCALL Y
                                      (LETT R
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL X X (QREFELT % 114))
                                              (SPADCALL Y Y (QREFELT % 114))
                                              (QREFELT % 115))
                                             (QREFELT % 116)))
                                      (QREFELT % 13))
                            (QREFELT % 117)))
                     (EXIT
                      (COND
                       ((SPADCALL Z (|spadConstant| % 9) (QREFELT % 112))
                        (LETT |Phi|
                              (SPADCALL (SPADCALL (QREFELT % 8))
                                        (SPADCALL 2 (QREFELT % 118))
                                        (QREFELT % 13))))
                       (#2#
                        (LETT |Phi|
                              (SPADCALL (SPADCALL Z R (QREFELT % 13))
                                        (QREFELT % 119))))))))))
                 (#2#
                  (SEQ
                   (LETT |Theta|
                         (SPADCALL
                          (SPADCALL Y
                                    (LETT R
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL X X (QREFELT % 114))
                                            (SPADCALL Y Y (QREFELT % 114))
                                            (QREFELT % 115))
                                           (QREFELT % 116)))
                                    (QREFELT % 13))
                          (QREFELT % 117)))
                   (EXIT
                    (COND
                     ((SPADCALL Z (|spadConstant| % 9) (QREFELT % 112))
                      (LETT |Phi|
                            (SPADCALL (SPADCALL (QREFELT % 8))
                                      (SPADCALL 2 (QREFELT % 118))
                                      (QREFELT % 13))))
                     (#2#
                      (LETT |Phi|
                            (SPADCALL (SPADCALL Z R (QREFELT % 13))
                                      (QREFELT % 119)))))))))
                (EXIT (SPADCALL |viewport| |Theta| |Phi| (QREFELT % 120)))))) 

(SDEFUN |VIEW3D;title;%SV;41|
        ((|viewport| (%)) (|Title| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G188 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 2 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0
                                   (QREFELT % 26))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G186)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;colorDef;%2CV;42|
        ((|viewport| (%)) (|HueOffset| (|Color|)) (|HueNumber| (|Color|))
         (% (|Void|)))
        (SPROG ((|h| (|Integer|)))
               (SEQ
                (QSETVELT |viewport| 6
                          (CONS
                           (LETT |h| (SPADCALL |HueOffset| (QREFELT % 124)))
                           (- (SPADCALL |HueNumber| (QREFELT % 124)) |h|)))
                (EXIT
                 (|VIEW3D;message_II| |viewport| 101 |h|
                  (SPADCALL |HueNumber| (QREFELT % 124)) %))))) 

(SDEFUN |VIEW3D;dimensions;%2Nni2PiV;43|
        ((|viewport| (%)) (|ViewX| (|NonNegativeInteger|))
         (|ViewY| (|NonNegativeInteger|)) (|ViewWidth| (|PositiveInteger|))
         (|ViewHeight| (|PositiveInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 3 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 4 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW3D;move;%2NniV;44|
        ((|viewport| (%)) (|xLoc| (|NonNegativeInteger|))
         (|yLoc| (|NonNegativeInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 3 (CONS |xLoc| |yLoc|))
             (EXIT (|VIEW3D;message_II| |viewport| 102 |xLoc| |yLoc| %)))) 

(SDEFUN |VIEW3D;resize;%2PiV;45|
        ((|viewport| (%)) (|xSize| (|PositiveInteger|))
         (|ySize| (|PositiveInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 4 (CONS |xSize| |ySize|))
             (EXIT (|VIEW3D;message_II| |viewport| 103 |xSize| |ySize| %)))) 

(SDEFUN |VIEW3D;coerce;%Of;46| ((|viewport| (%)) (% (|OutputForm|)))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT % 24)) 0)
          (SPADCALL
           (LIST
            (SPADCALL "Closed or Undefined ThreeDimensionalViewport: "
                      (QREFELT % 130))
            (SPADCALL (QVELT |viewport| 2) (QREFELT % 131)))
           (QREFELT % 133)))
         ('T
          (SPADCALL
           (LIST (SPADCALL "ThreeDimensionalViewport: " (QREFELT % 130))
                 (SPADCALL (QVELT |viewport| 2) (QREFELT % 131)))
           (QREFELT % 133))))) 

(MAKEPROP '|VIEW3D;key;%I;47| '|SPADreplace|
          '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW3D;key;%I;47| ((|viewport| (%)) (% (|Integer|)))
        (QVELT |viewport| 0)) 

(SDEFUN |VIEW3D;rotate;%2IV;48|
        ((|viewport| (%)) (|Theta| (|Integer|)) (|Phi| (|Integer|))
         (% (|Void|)))
        (SPADCALL |viewport|
                  (SPADCALL (SPADCALL |Theta| (QREFELT % 118)) (QREFELT % 14)
                            (QREFELT % 114))
                  (SPADCALL (SPADCALL |Phi| (QREFELT % 118)) (QREFELT % 14)
                            (QREFELT % 114))
                  (QREFELT % 120))) 

(SDEFUN |VIEW3D;rotate;%2FV;49|
        ((|viewport| (%)) (|Theta| (|Float|)) (|Phi| (|Float|)) (% (|Void|)))
        (SPROG ((|f1| #1=(|DoubleFloat|)) (|f2| #1#))
               (SEQ (LETT |f1| (SPADCALL |Theta| (QREFELT % 17)))
                    (LETT |f2| (SPADCALL |Phi| (QREFELT % 17)))
                    (QSETVELT (QVELT |viewport| 5) 0 |f1|)
                    (QSETVELT (QVELT |viewport| 5) 1 |f2|)
                    (EXIT (|VIEW3D;message_FF| |viewport| 0 |f1| |f2| %))))) 

(SDEFUN |VIEW3D;zoom;%FV;50| ((|vp| (%)) (|f| (|Float|)) (% (|Void|)))
        (SPROG ((|sf| (|DoubleFloat|)))
               (SEQ (LETT |sf| (SPADCALL |f| (QREFELT % 17)))
                    (QSETVELT (QVELT |vp| 5) 2 |sf|)
                    (EXIT (|VIEW3D;message_F| |vp| 1 |sf| %))))) 

(SDEFUN |VIEW3D;zoom;%3FV;51|
        ((|viewport| (%)) (|ScaleX| (|Float|)) (|ScaleY| (|Float|))
         (|ScaleZ| (|Float|)) (% (|Void|)))
        (SPROG ((|f1| #1=(|DoubleFloat|)) (|f2| #1#) (|f3| #1#))
               (SEQ (LETT |f1| (SPADCALL |ScaleX| (QREFELT % 17)))
                    (LETT |f2| (SPADCALL |ScaleY| (QREFELT % 17)))
                    (LETT |f3| (SPADCALL |ScaleZ| (QREFELT % 17)))
                    (QSETVELT (QVELT |viewport| 5) 3 |f1|)
                    (QSETVELT (QVELT |viewport| 5) 4 |f2|)
                    (QSETVELT (QVELT |viewport| 5) 5 |f3|)
                    (EXIT
                     (|VIEW3D;message_FFF| |viewport| 14 |f1| |f2| |f3| %))))) 

(SDEFUN |VIEW3D;translate;%2FV;52|
        ((|viewport| (%)) (|DeltaX| (|Float|)) (|DeltaY| (|Float|))
         (% (|Void|)))
        (SPROG ((|f1| #1=(|DoubleFloat|)) (|f2| #1#))
               (SEQ (LETT |f1| (SPADCALL |DeltaX| (QREFELT % 17)))
                    (LETT |f2| (SPADCALL |DeltaY| (QREFELT % 17)))
                    (QSETVELT (QVELT |viewport| 5) 6 |f1|)
                    (QSETVELT (QVELT |viewport| 5) 7 |f2|)
                    (EXIT (|VIEW3D;message_FF| |viewport| 2 |f1| |f2| %))))) 

(SDEFUN |VIEW3D;intensity;%FV;53|
        ((|viewport| (%)) (|Amount| (|Float|)) (% (|Void|)))
        (SPROG ((|f| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((OR (SPADCALL |Amount| (|spadConstant| % 9) (QREFELT % 139))
                      (SPADCALL |Amount| (|spadConstant| % 77)
                                (QREFELT % 140)))
                  (|error|
                   "The intensity must be a value between 0 and 1, inclusively.")))
                (LETT |f| (SPADCALL |Amount| (QREFELT % 17)))
                (QSETVELT (QVELT |viewport| 8) 5 |f|)
                (EXIT (|VIEW3D;message_F| |viewport| 109 |f| %))))) 

(SDEFUN |VIEW3D;write;%3S;54|
        ((|viewport| (%)) (|Filename| (|String|)) (|aThingToWrite| (|String|))
         (% (|String|)))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT % 143))) 

(SDEFUN |VIEW3D;write;%2S;55|
        ((|viewport| (%)) (|Filename| (|String|)) (% (|String|)))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT % 145))
                  (QREFELT % 143))) 

(SDEFUN |VIEW3D;write;%SLS;56|
        ((|viewport| (%)) (|Filename| (|String|))
         (|thingsToWrite| (|List| (|String|))) (% (|String|)))
        (SPROG
         ((|avail| (|List| (|String|))) (|m| (|Integer|)) (|aTypeOfFile| NIL)
          (#1=#:G232 NIL) (|writeTypeInt| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0 (QREFELT % 26))
            (SEQ (|sockSendInt| |$ViewportServer| 1)
                 (|sockSendInt| |$ViewportServer| 110)
                 (EXIT
                  (COND
                   ((|VIEW3D;checkViewport| |viewport| %)
                    (SEQ (|sockSendString| |$ViewportServer| |Filename|)
                         (LETT |m|
                               (PROGN
                                (LETT |avail| (SPADCALL (QREFELT % 147)))
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
                                       (SPADCALL |aTypeOfFile| (QREFELT % 148))
                                       |avail| (QREFELT % 149))
                                      |m|))
                               (EXIT
                                (COND
                                 ((< |writeTypeInt| 0)
                                  (SPADCALL
                                   (LIST "  > " |aTypeOfFile|
                                         " is not a valid file type for writing a 3D viewport")
                                   (QREFELT % 150)))
                                 ('T
                                  (|sockSendInt| |$ViewportServer|
                                                 (+ |writeTypeInt| 1))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (|sockSendInt| |$ViewportServer| 0)
                         (|sockGetInt| |$ViewportServer|) (EXIT |Filename|)))
                   (#2='T (|error| "write: problem with viewport"))))))
           (#2# (|error| "write: problem contacting viewman")))))) 

(SDEFUN |VIEW3D;perspective;%SV;57|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 9) 0 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 27 |flag| %))))) 

(SDEFUN |VIEW3D;showRegion;%SV;58|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 7) 5 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 12 |flag| %))))) 

(SDEFUN |VIEW3D;showClipRegion;%SV;59|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 10) 6 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 66 |flag| %))))) 

(SDEFUN |VIEW3D;clipSurface;%SV;60|
        ((|vp| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((|flag| (|Integer|)))
               (SEQ (LETT |flag| (COND ((EQUAL |onOff| "on") 1) ('T 0)))
                    (QSETVELT (QVELT |vp| 10) 7 |flag|)
                    (EXIT (|VIEW3D;message_I| |vp| 67 |flag| %))))) 

(SDEFUN |VIEW3D;eyeDistance;%FV;61| ((|vp| (%)) (|f| (|Float|)) (% (|Void|)))
        (SPROG ((|sf| (|DoubleFloat|)))
               (SEQ (LETT |sf| (SPADCALL |f| (QREFELT % 17)))
                    (QSETVELT (QVELT |vp| 9) 1 |sf|)
                    (EXIT (|VIEW3D;message_F| |vp| 111 |sf| %))))) 

(SDEFUN |VIEW3D;hitherPlane;%FV;62| ((|vp| (%)) (|f| (|Float|)) (% (|Void|)))
        (SPROG ((|sf| (|DoubleFloat|)))
               (SEQ (LETT |sf| (SPADCALL |f| (QREFELT % 17)))
                    (QSETVELT (QVELT |vp| 9) 2 |sf|)
                    (EXIT (|VIEW3D;message_F| |vp| 116 |sf| %))))) 

(SDEFUN |VIEW3D;modifyPointData;%NniPV;63|
        ((|viewport| (%)) (|anIndex| (|NonNegativeInteger|))
         (|aPoint| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPROG ((|n| (|PositiveInteger|)) (#1=#:G255 NIL))
               (SEQ (LETT |n| (SPADCALL |aPoint| (QREFELT % 73)))
                    (EXIT
                     (COND
                      ((< |n| 3)
                       (|error|
                        "The point should have dimension of at least 3"))
                      (#2='T
                       (SEQ
                        (EXIT
                         (SEQ
                          (QSETVELT |viewport| 11
                                    (SPADCALL (QVELT |viewport| 11) |anIndex|
                                              |aPoint| (QREFELT % 157)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |viewport| (QREFELT % 24)) 0
                                       (QREFELT % 26))
                             (PROGN
                              (LETT #1#
                                    (SEQ (|sockSendInt| |$ViewportServer| 1)
                                         (|sockSendInt| |$ViewportServer| 114)
                                         (EXIT
                                          (COND
                                           ((|VIEW3D;checkViewport| |viewport|
                                             %)
                                            (SEQ
                                             (|sockSendInt| |$ViewportServer|
                                                            |anIndex|)
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT % 79)))
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT % 80)))
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT % 81)))
                                             (COND
                                              ((EQL |n| 3)
                                               (|sockSendFloat|
                                                |$ViewportServer|
                                                (SPADCALL
                                                 (SPADCALL 5 -1 10
                                                           (QREFELT % 12))
                                                 (QREFELT % 17))))
                                              (#2#
                                               (|sockSendFloat|
                                                |$ViewportServer|
                                                (SPADCALL |aPoint|
                                                          (QREFELT % 82)))))
                                             (EXIT
                                              (|sockGetInt|
                                               |$ViewportServer|))))))))
                              (GO #3=#:G252)))))))
                        #3# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |ThreeDimensionalViewport;|)) 

(DEFUN |ThreeDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ThreeDimensionalViewport|))
          (LETT % (GETREFV 159))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ThreeDimensionalViewport| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |key| (|Integer|)) (|:| |fun| (|Integer|))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |viewpoint|
                                   (|Record| (|:| |theta| (|DoubleFloat|))
                                             (|:| |phi| (|DoubleFloat|))
                                             (|:| |scale| (|DoubleFloat|))
                                             (|:| |scaleX| (|DoubleFloat|))
                                             (|:| |scaleY| (|DoubleFloat|))
                                             (|:| |scaleZ| (|DoubleFloat|))
                                             (|:| |deltaX| (|DoubleFloat|))
                                             (|:| |deltaY| (|DoubleFloat|))))
                              (|:| |colors|
                                   (|Record| (|:| |hueOffset| (|Integer|))
                                             (|:| |hueNumber| (|Integer|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))
                                             (|:| |style| (|Integer|))
                                             (|:| |axesOn| (|Integer|))
                                             (|:| |diagonalsOn| (|Integer|))
                                             (|:| |outlineRenderOn|
                                                  (|Integer|))
                                             (|:| |showRegionField|
                                                  (|Integer|))))
                              (|:| |lighting|
                                   (|Record| (|:| |lightX| (|DoubleFloat|))
                                             (|:| |lightY| (|DoubleFloat|))
                                             (|:| |lightZ| (|DoubleFloat|))
                                             (|:| |lightTheta| (|DoubleFloat|))
                                             (|:| |lightPhi| (|DoubleFloat|))
                                             (|:| |translucence|
                                                  (|DoubleFloat|))))
                              (|:| |perspective|
                                   (|Record|
                                    (|:| |perspectiveField| (|Integer|))
                                    (|:| |eyeDistance| (|DoubleFloat|))
                                    (|:| |hitherPlane| (|DoubleFloat|))))
                              (|:| |volume|
                                   (|Record| (|:| |clipXMin| (|DoubleFloat|))
                                             (|:| |clipXMax| (|DoubleFloat|))
                                             (|:| |clipYMin| (|DoubleFloat|))
                                             (|:| |clipYMax| (|DoubleFloat|))
                                             (|:| |clipZMin| (|DoubleFloat|))
                                             (|:| |clipZMax| (|DoubleFloat|))
                                             (|:| |clipRegionField|
                                                  (|Integer|))
                                             (|:| |clipSurfaceField|
                                                  (|Integer|))))
                              (|:| |space3D| (|ThreeSpace| (|DoubleFloat|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV % 14
                    (SPADCALL (SPADCALL (QREFELT % 8))
                              (SPADCALL 180 0 10 (QREFELT % 12))
                              (QREFELT % 13)))
          (QSETREFV % 15
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 180))
          (QSETREFV % 18
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 8))
                               (SPADCALL 4 0 10 (QREFELT % 12)) (QREFELT % 13))
                     (QREFELT % 17)))
          (QSETREFV % 20
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 8))
                                (SPADCALL 4 0 10 (QREFELT % 12))
                                (QREFELT % 13))
                      (QREFELT % 19))
                     (QREFELT % 17)))
          (QSETREFV % 21
                    (SPADCALL (SPADCALL 12 -1 10 (QREFELT % 12))
                              (QREFELT % 17)))
          (QSETREFV % 22 0.0)
          (QSETREFV % 23 0.0)
          %))) 

(DEFUN |ThreeDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G257)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ThreeDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ThreeDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ThreeDimensionalViewport;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ThreeDimensionalViewport|)))))))))) 

(MAKEPROP '|ThreeDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Float|) (0 . |pi|) (4 . |0|)
              (|Integer|) (|PositiveInteger|) (8 . |float|) (15 . /) '|degrees|
              '|degreesSF| (|DoubleFloat|) (21 . |convert|) '|defaultTheta|
              (26 . -) '|defaultPhi| '|defaultZoom| '|defaultDeltaX|
              '|defaultDeltaY| |VIEW3D;key;%I;47| (|Boolean|) (31 . ~=)
              (|String|) (|List| 50) (|DrawOptionFunctions0|) (37 . |title|)
              (43 . |style|)
              (|Record| (|:| |theta| 16) (|:| |phi| 16) (|:| |scale| 16)
                        (|:| |scaleX| 16) (|:| |scaleY| 16) (|:| |scaleZ| 16)
                        (|:| |deltaX| 16) (|:| |deltaY| 16))
              (49 . |viewpoint|) (|List| 37) (|ViewDefaultsPackage|)
              (55 . |viewPosDefault|) (|NonNegativeInteger|) (59 . |elt|)
              (|List| 11) (65 . |viewSizeDefault|) (69 . |elt|)
              (|ThreeSpace| 16) (75 . |create3Space|) |VIEW3D;viewport3D;%;8|
              |VIEW3D;subspace;%Ts;9| |VIEW3D;subspace;%Ts%;10|
              |VIEW3D;options;%L;11| |VIEW3D;options;%L%;12|
              |VIEW3D;makeViewport3D;2%;13| (|DrawOption|) (79 . |title|)
              |VIEW3D;makeViewport3D;TsS%;14| |VIEW3D;makeViewport3D;TsL%;15|
              (|Void|) (|DisplayPackage|) (84 . |say|) (|Point| 16)
              (|CoordinateSystems| 16) (89 . |cartesian|) (|Mapping| 57 57)
              (94 . |coord|) (100 . |check|) (|List| 57) (105 . |lp|)
              (|List| (|List| 34)) (110 . |lllip|) (|List| 69) (115 . |llprop|)
              (|List| 83) (120 . |lprop|) (|Set| 11) (125 . |empty|)
              (129 . |dimension|) (134 . |insert!|) (140 . |#|) (145 . |parts|)
              (150 . |1|) (|PointPackage| 16) (154 . |xCoord|) (159 . |yCoord|)
              (164 . |zCoord|) (169 . |color|) (|SubSpaceComponentProperty|)
              (174 . |closed?|) (179 . |solid?|) (184 . |#|) (189 . |convert|)
              |VIEW3D;viewThetaDefault;F;17| |VIEW3D;viewThetaDefault;2F;18|
              |VIEW3D;viewPhiDefault;F;19| |VIEW3D;viewPhiDefault;2F;20|
              |VIEW3D;viewZoomDefault;F;21| |VIEW3D;viewZoomDefault;2F;22|
              |VIEW3D;viewDeltaXDefault;F;23| |VIEW3D;viewDeltaXDefault;2F;24|
              |VIEW3D;viewDeltaYDefault;F;25| |VIEW3D;viewDeltaYDefault;2F;26|
              |VIEW3D;lighting;%3FV;27| |VIEW3D;axes;%SV;28|
              |VIEW3D;diagonals;%SV;29| |VIEW3D;outlineRender;%SV;30|
              |VIEW3D;controlPanel;%SV;31| |VIEW3D;drawStyle;%SV;32|
              |VIEW3D;reset;%V;33| (194 . |void|) |VIEW3D;close;%V;34|
              |VIEW3D;viewpoint;%R;35| |VIEW3D;viewpoint;%RV;36|
              |VIEW3D;viewpoint;%5FV;37| |VIEW3D;viewpoint;%2I3FV;38|
              |VIEW3D;viewpoint;%2FV;39| (198 . =) (204 . >=) (210 . *)
              (216 . +) (222 . |sqrt|) (227 . |asin|) (232 . |coerce|)
              (237 . |atan|) |VIEW3D;rotate;%2FV;49| |VIEW3D;viewpoint;%3FV;40|
              |VIEW3D;title;%SV;41| (|Color|) (242 . |hue|)
              |VIEW3D;colorDef;%2CV;42| |VIEW3D;dimensions;%2Nni2PiV;43|
              |VIEW3D;move;%2NniV;44| |VIEW3D;resize;%2PiV;45| (|OutputForm|)
              (247 . |message|) (252 . |coerce|) (|List| %) (257 . |hconcat|)
              |VIEW3D;coerce;%Of;46| |VIEW3D;rotate;%2IV;48|
              |VIEW3D;zoom;%FV;50| |VIEW3D;zoom;%3FV;51|
              |VIEW3D;translate;%2FV;52| (262 . <) (268 . >)
              |VIEW3D;intensity;%FV;53| (|List| 27) |VIEW3D;write;%SLS;56|
              |VIEW3D;write;%3S;54| (274 . |viewWriteDefault|)
              |VIEW3D;write;%2S;55| (278 . |viewWriteAvailable|)
              (282 . |upperCase|) (287 . |position|) (293 . |say|)
              |VIEW3D;perspective;%SV;57| |VIEW3D;showRegion;%SV;58|
              |VIEW3D;showClipRegion;%SV;59| |VIEW3D;clipSurface;%SV;60|
              |VIEW3D;eyeDistance;%FV;61| |VIEW3D;hitherPlane;%FV;62|
              (298 . |modifyPointData|) |VIEW3D;modifyPointData;%NniPV;63|)
           '#(~= 305 |zoom| 311 |write| 325 |viewport3D| 345 |viewpoint| 349
              |viewZoomDefault| 395 |viewThetaDefault| 404 |viewPhiDefault| 413
              |viewDeltaYDefault| 422 |viewDeltaXDefault| 431 |translate| 440
              |title| 447 |subspace| 453 |showRegion| 464 |showClipRegion| 470
              |rotate| 476 |resize| 490 |reset| 497 |perspective| 502
              |outlineRender| 508 |options| 514 |move| 525 |modifyPointData|
              532 |makeViewport3D| 539 |lighting| 556 |latex| 564 |key| 569
              |intensity| 574 |hitherPlane| 580 |eyeDistance| 586 |drawStyle|
              592 |dimensions| 598 |diagonals| 607 |controlPanel| 613
              |colorDef| 619 |coerce| 626 |close| 631 |clipSurface| 636 |axes|
              642 = 648)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 129) (|BasicType|))
                        (|makeByteWordVec2| 158
                                            '(0 7 0 8 0 7 0 9 3 7 0 10 10 11 12
                                              2 7 0 0 0 13 1 7 16 0 17 1 7 0 0
                                              19 2 10 25 0 0 26 2 29 27 28 27
                                              30 2 29 27 28 27 31 2 29 32 28 32
                                              33 0 35 34 36 2 34 37 0 10 38 0
                                              35 39 40 2 39 11 0 10 41 0 42 0
                                              43 1 50 0 27 51 1 55 54 27 56 1
                                              58 57 57 59 2 29 60 28 60 61 1 42
                                              0 0 62 1 42 63 0 64 1 42 65 0 66
                                              1 42 67 0 68 1 42 69 0 70 0 71 0
                                              72 1 57 11 0 73 2 71 0 11 0 74 1
                                              71 37 0 75 1 71 39 0 76 0 7 0 77
                                              1 78 16 57 79 1 78 16 57 80 1 78
                                              16 57 81 1 78 16 57 82 1 83 25 0
                                              84 1 83 25 0 85 1 34 37 0 86 1 7
                                              0 16 87 0 54 0 105 2 7 25 0 0 112
                                              2 7 25 0 0 113 2 7 0 0 0 114 2 7
                                              0 0 0 115 1 7 0 0 116 1 7 0 0 117
                                              1 7 0 10 118 1 7 0 0 119 1 123 10
                                              0 124 1 129 0 27 130 1 27 129 0
                                              131 1 129 0 132 133 2 7 25 0 0
                                              139 2 7 25 0 0 140 0 35 142 145 0
                                              35 142 147 1 27 0 0 148 2 142 10
                                              27 0 149 1 55 54 142 150 3 42 0 0
                                              37 57 157 2 0 25 0 0 1 2 0 54 0 7
                                              136 4 0 54 0 7 7 7 137 3 0 27 0
                                              27 27 144 2 0 27 0 27 146 3 0 27
                                              0 27 142 143 0 0 0 44 6 0 54 0 7
                                              7 7 7 7 109 1 0 32 0 107 6 0 54 0
                                              10 10 7 7 7 110 2 0 54 0 32 108 4
                                              0 54 0 7 7 7 121 3 0 54 0 7 7 111
                                              1 0 7 7 93 0 0 7 92 1 0 7 7 89 0
                                              0 7 88 1 0 7 7 91 0 0 7 90 1 0 7
                                              7 97 0 0 7 96 1 0 7 7 95 0 0 7 94
                                              3 0 54 0 7 7 138 2 0 54 0 27 122
                                              1 0 42 0 45 2 0 0 0 42 46 2 0 54
                                              0 27 152 2 0 54 0 27 153 3 0 54 0
                                              7 7 120 3 0 54 0 10 10 135 3 0 54
                                              0 11 11 128 1 0 54 0 104 2 0 54 0
                                              27 151 2 0 54 0 27 101 1 0 28 0
                                              47 2 0 0 0 28 48 3 0 54 0 37 37
                                              127 3 0 54 0 37 57 158 2 0 0 42
                                              27 52 1 0 0 0 49 2 0 0 42 28 53 4
                                              0 54 0 7 7 7 98 1 0 27 0 1 1 0 10
                                              0 24 2 0 54 0 7 141 2 0 54 0 7
                                              156 2 0 54 0 7 155 2 0 54 0 27
                                              103 5 0 54 0 37 37 11 11 126 2 0
                                              54 0 27 100 2 0 54 0 27 102 3 0
                                              54 0 123 123 125 1 0 129 0 134 1
                                              0 54 0 106 2 0 54 0 27 154 2 0 54
                                              0 27 99 2 0 25 0 0 1)))))
           '|lookupComplete|)) 
