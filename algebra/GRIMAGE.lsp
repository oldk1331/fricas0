
(SDEFUN |GRIMAGE;doOptions| ((|g| (|Rep|)) (% (|Void|)))
        (SPROG
         ((|lr| (|List| (|Segment| (|Float|)))) (|lu| (|List| (|Float|))))
         (SEQ
          (LETT |lr|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT % 8))
                          (QREFELT % 11)))
          (COND
           ((> (LENGTH |lr|) 1)
            (QSETVELT |g| 1
                      (LIST
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT % 14))
                                   (QREFELT % 16))
                         (QREFELT % 18))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT % 14))
                                   (QREFELT % 19))
                         (QREFELT % 18))
                        (QREFELT % 21))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT % 14))
                                   (QREFELT % 16))
                         (QREFELT % 18))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT % 14))
                                   (QREFELT % 19))
                         (QREFELT % 18))
                        (QREFELT % 21)))))
           (#1='T (QSETVELT |g| 1 NIL)))
          (LETT |lu|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT % 23))
                          (QREFELT % 24)))
          (EXIT
           (COND
            ((> (LENGTH |lu|) 1)
             (QSETVELT |g| 2
                       (LIST
                        (SPADCALL (SPADCALL |lu| 1 (QREFELT % 25))
                                  (QREFELT % 18))
                        (SPADCALL (SPADCALL |lu| 2 (QREFELT % 25))
                                  (QREFELT % 18)))))
            (#1# (QSETVELT |g| 2 NIL))))))) 

(SDEFUN |GRIMAGE;putColorInfo;LLL;2|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|listOfPalettes| (|List| (|Palette|)))
         (% (|List| (|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|pal| NIL) (#1=#:G30 NIL) (|lp| NIL) (#2=#:G29 NIL)
          (|daHue| (|DoubleFloat|)) (|daShade| (|DoubleFloat|)) (#3=#:G31 NIL)
          (|d| (|PositiveInteger|)) (|p| (|Point| (|DoubleFloat|)))
          (|lp2| (|List| (|Point| (|DoubleFloat|))))
          (|llp2| (|List| (|List| (|Point| (|DoubleFloat|))))))
         (SEQ (LETT |llp2| NIL)
              (SEQ (LETT |pal| NIL) (LETT #1# |listOfPalettes|) (LETT |lp| NIL)
                   (LETT #2# |llp|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lp| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |pal| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lp2| NIL)
                        (LETT |daHue|
                              (FLOAT
                               (SPADCALL (SPADCALL |pal| (QREFELT % 28))
                                         (QREFELT % 29))
                               MOST-POSITIVE-DOUBLE-FLOAT))
                        (LETT |daShade|
                              (FLOAT (SPADCALL |pal| (QREFELT % 30))
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                        (SEQ (LETT #3# |lp|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 33)))
                                   (EXIT
                                    (COND
                                     ((< |d| 3)
                                      (LETT |p|
                                            (SPADCALL |p|
                                                      (LIST |daHue| |daShade|)
                                                      (QREFELT % 35))))
                                     ('T
                                      (SEQ
                                       (SPADCALL |p| 3 |daHue| (QREFELT % 36))
                                       (EXIT
                                        (COND
                                         ((< |d| 4)
                                          (LETT |p|
                                                (SPADCALL |p| (LIST |daShade|)
                                                          (QREFELT % 35))))
                                         ('T
                                          (SPADCALL |p| 4 |daShade|
                                                    (QREFELT % 36))))))))))
                              (EXIT (LETT |lp2| (CONS |p| |lp2|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |llp2| (CONS (NREVERSE |lp2|) |llp2|))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (NREVERSE |llp2|))))) 

(SDEFUN |GRIMAGE;graph| ((|demRanges| (|List| (|Segment| (|Float|)))) (% (%)))
        (SPROG ((|demRangesSF| (|List| (|Segment| (|DoubleFloat|)))))
               (SEQ
                (COND
                 ((NULL |demRanges|) (VECTOR 0 NIL NIL NIL NIL NIL NIL NIL))
                 ('T
                  (SEQ
                   (LETT |demRangesSF|
                         (LIST
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 14))
                                      (QREFELT % 16))
                            (QREFELT % 18))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 14))
                                      (QREFELT % 19))
                            (QREFELT % 18))
                           (QREFELT % 21))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 14))
                                      (QREFELT % 16))
                            (QREFELT % 18))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 14))
                                      (QREFELT % 19))
                            (QREFELT % 18))
                           (QREFELT % 21))))
                   (EXIT (VECTOR 0 |demRangesSF| NIL NIL NIL NIL NIL NIL)))))))) 

(SDEFUN |GRIMAGE;scaleStep|
        ((|range_seg| (|Segment| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPROG
         ((|adjust| (|NonNegativeInteger|)) (|range| (|DoubleFloat|))
          (|tryStep| (|DoubleFloat|)) (|numerals| (|String|))
          (|scaleDown| (|DoubleFloat|)))
         (SEQ
          (LETT |range|
                (|sub_DF| (SPADCALL |range_seg| (QREFELT % 40))
                          (SPADCALL |range_seg| (QREFELT % 41))))
          (LETT |adjust| 0)
          (SEQ G190
               (COND ((NULL (|less_DF| |range| (|mk_DF| 100 0))) (GO G191)))
               (SEQ (LETT |adjust| (+ |adjust| 1))
                    (EXIT (LETT |range| (|mul_DF| |range| (|mk_DF| 10 0)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |tryStep| (|div_DF| |range| (|mk_DF| 10 0)))
          (LETT |numerals|
                (STRINGIMAGE
                 (SPADCALL (SPADCALL |tryStep| (QREFELT % 42))
                           (QREFELT % 43))))
          (LETT |scaleDown|
                (FLOAT (EXPT 10 (- (QCSIZE |numerals|) 1))
                       MOST-POSITIVE-DOUBLE-FLOAT))
          (EXIT
           (|div_DF|
            (|mul_DF| |scaleDown|
                      (SPADCALL
                       (|sub_DF| (|div_DF| |tryStep| |scaleDown|)
                                 (|mk_DF| 5 -1))
                       (QREFELT % 42)))
            (FLOAT (EXPT 10 |adjust|) MOST-POSITIVE-DOUBLE-FLOAT)))))) 

(SDEFUN |GRIMAGE;figureUnits|
        ((|ranges| (|List| (|Segment| (|DoubleFloat|))))
         (% (|List| (|DoubleFloat|))))
        (LIST (|GRIMAGE;scaleStep| (|SPADfirst| |ranges|) %)
              (|GRIMAGE;scaleStep| (SPADCALL |ranges| (QREFELT % 45)) %))) 

(SDEFUN |GRIMAGE;roundRange|
        ((|range| (|Segment| (|DoubleFloat|))) (% (|Segment| (|DoubleFloat|))))
        (SPROG
         ((|single_eps| (|DoubleFloat|)) (|low| (|DoubleFloat|))
          (|high| (|DoubleFloat|)))
         (SEQ (LETT |single_eps| (|expt_DF_I| (|mk_DF| 2 0) -19))
              (LETT |low| (SPADCALL |range| (QREFELT % 41)))
              (LETT |low|
                    (COND
                     ((|less_DF| (|abs_DF| |low|) 1.0)
                      (|sub_DF| |low| |single_eps|))
                     ((|less_DF| |low| 0.0)
                      (|mul_DF| (|add_DF| (|mk_DF| 1 0) |single_eps|) |low|))
                     (#1='T
                      (|mul_DF| (|sub_DF| (|mk_DF| 1 0) |single_eps|) |low|))))
              (LETT |high| (SPADCALL |range| (QREFELT % 40)))
              (LETT |high|
                    (COND
                     ((|less_DF| (|abs_DF| |high|) 1.0)
                      (|add_DF| |high| |single_eps|))
                     ((|less_DF| |high| 0.0)
                      (|mul_DF| (|sub_DF| (|mk_DF| 1 0) |single_eps|) |high|))
                     (#1#
                      (|mul_DF| (|add_DF| (|mk_DF| 1 0) |single_eps|)
                                |high|))))
              (EXIT (SPADCALL |low| |high| (QREFELT % 46)))))) 

(SDEFUN |GRIMAGE;roundRanges|
        ((|ranges| (|List| (|Segment| (|DoubleFloat|))))
         (% (|List| (|Segment| (|DoubleFloat|)))))
        (LIST (|GRIMAGE;roundRange| (|SPADfirst| |ranges|) %)
              (|GRIMAGE;roundRange| (SPADCALL |ranges| (QREFELT % 45)) %))) 

(SDEFUN |GRIMAGE;plotLists|
        ((|graf| (|Rep|))
         (|listOfListsOfPoints| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|listOfPointColors| (|List| (|Palette|)))
         (|listOfLineColors| (|List| (|Palette|)))
         (|listOfPointSizes| (|List| (|PositiveInteger|))) (% (%)))
        (SPROG
         ((#1=#:G85 NIL) (|l| NIL) (#2=#:G86 NIL)
          (|len| #3=(|NonNegativeInteger|)) (#4=#:G61 NIL) (#5=#:G71 NIL)
          (|givenLen| #3#) (#6=#:G81 NIL))
         (SEQ (LETT |givenLen| (LENGTH |listOfListsOfPoints|))
              (LETT |listOfListsOfPoints|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |l| NIL) (LETT #2# |listOfListsOfPoints|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (NULL |l|)) (LETT #1# (CONS |l| #1#))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (COND
               ((NULL |listOfListsOfPoints|)
                (|error|
                 "GraphImage was given a list that contained no valid point lists")))
              (COND
               ((SPADCALL (LETT |len| (LENGTH |listOfListsOfPoints|))
                          |givenLen| (QREFELT % 49))
                (SPADCALL "   Warning: Ignoring pointless point list"
                          (QREFELT % 53))))
              (QSETVELT |graf| 3 |listOfListsOfPoints|)
              (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #4# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            1)
                                           (SPADCALL (QREFELT % 55))
                                           (QREFELT % 56))
                                          (QREFELT % 57))))
                     (#7='T
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors| |len|
                                          (QREFELT % 58)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #5# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #5# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #5#))
                                            1)
                                           (SPADCALL (QREFELT % 59))
                                           (QREFELT % 56))
                                          (QREFELT % 57))))
                     (#7#
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors| |len|
                                          (QREFELT % 58)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #6# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            1)
                                           (SPADCALL (QREFELT % 60))
                                           (QREFELT % 62))
                                          (QREFELT % 63))))
                     (#7#
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes| |len|
                                          (QREFELT % 64)))))))
              (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;sendGraphImage;%V;9| ((|graf| (%)) (% (|Void|)))
        (SPROG
         ((|s| (|NonNegativeInteger|))
          (|transform|
           (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|))))
          (#1=#:G107 NIL) (#2=#:G108 NIL)
          (|pl| (|List| (|Point| (|DoubleFloat|))))
          (|pll| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|tonto| (|List| (|Segment| (|DoubleFloat|)))) (#3=#:G112 NIL)
          (|lColor| NIL) (#4=#:G111 NIL) (|pColor| NIL) (#5=#:G110 NIL)
          (|aList| NIL) (#6=#:G109 NIL) (|p| NIL) (#7=#:G113 NIL)
          (|hueShade| (|Integer|)))
         (SEQ (|GRIMAGE;doOptions| |graf| %)
              (LETT |s| (LENGTH (QVELT |graf| 3)))
              (EXIT
               (COND
                ((EQL |s| 0)
                 (|error| "You are trying to make a graph with no points"))
                ((SPADCALL (SPADCALL |graf| (QREFELT % 65)) 0 (QREFELT % 66))
                 (|error| "You are trying to draw over an existing graph"))
                ('T
                 (SEQ
                  (LETT |transform|
                        (SPADCALL (QVELT |graf| 7) (ELT % 68) (QREFELT % 70)))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT % 8)))
                    (QSETVELT |graf| 1
                              (SPADCALL (QVELT |graf| 3) (QREFELT % 72)))))
                  (QSETVELT |graf| 1
                            (|GRIMAGE;roundRanges| (QVELT |graf| 1) %))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT % 23)))
                    (QSETVELT |graf| 2
                              (|GRIMAGE;figureUnits| (QVELT |graf| 1) %))))
                  (LETT |pll| NIL)
                  (SEQ (LETT |aList| NIL) (LETT #1# (QVELT |graf| 3)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |aList| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |pl| NIL)
                            (SEQ (LETT |p| NIL) (LETT #2# |aList|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |p| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |pl|
                                         (CONS (SPADCALL |p| |transform|)
                                               |pl|))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |pll| (CONS (NREVERSE |pl|) |pll|))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (LETT |pll| (NREVERSE |pll|))
                  (LETT |pll| (SPADCALL |pll| (QVELT |graf| 4) (QREFELT % 39)))
                  (SPADCALL
                   "   Graph data being transmitted to the viewport manager..."
                   (QREFELT % 53))
                  (|sockSendInt| |$ViewportServer| 2)
                  (|sockSendInt| |$ViewportServer| -1)
                  (LETT |tonto| (QVELT |graf| 1))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT % 41)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT % 40)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT % 45))
                                             (QREFELT % 41)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT % 45))
                                             (QREFELT % 40)))
                  (|sockSendFloat| |$ViewportServer|
                                   (|SPADfirst| (QVELT |graf| 2)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (QVELT |graf| 2) (QREFELT % 73)))
                  (|sockSendInt| |$ViewportServer| |s|)
                  (SEQ (LETT #3# (QVELT |graf| 6)) (LETT |lColor| NIL)
                       (LETT #4# (QVELT |graf| 5)) (LETT |pColor| NIL)
                       (LETT #5# (QVELT |graf| 4)) (LETT |aList| NIL)
                       (LETT #6# |pll|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |aList| (CAR #6#)) NIL)
                             (ATOM #5#) (PROGN (LETT |pColor| (CAR #5#)) NIL)
                             (ATOM #4#) (PROGN (LETT |lColor| (CAR #4#)) NIL)
                             (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (|sockSendInt| |$ViewportServer| (LENGTH |aList|))
                            (SEQ (LETT |p| NIL) (LETT #7# |aList|) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |p| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT % 75)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT % 76)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT % 77)))
                                  (EXIT
                                   (|sockSendFloat| |$ViewportServer|
                                                    (SPADCALL |p|
                                                              (QREFELT %
                                                                       78)))))
                                 (LETT #7# (CDR #7#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL (SPADCALL |pColor| (QREFELT % 28))
                                             (QREFELT % 29))
                                   (* (SPADCALL |pColor| (QREFELT % 30))
                                      (SPADCALL (QREFELT % 79)))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL
                                    (-
                                     (SPADCALL
                                      (SPADCALL |lColor| (QREFELT % 28))
                                      (QREFELT % 29))
                                     1)
                                    5 (QREFELT % 81))
                                   (SPADCALL |lColor| (QREFELT % 30))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (EXIT (|sockSendInt| |$ViewportServer| |s|)))
                       (LETT #6#
                             (PROG1 (CDR #6#)
                               (LETT #5#
                                     (PROG1 (CDR #5#)
                                       (LETT #4#
                                             (PROG1 (CDR #4#)
                                               (LETT #3# (CDR #3#))))))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (QSETVELT |graf| 0 (|sockGetInt| |$ViewportServer|)))))))))) 

(MAKEPROP '|GRIMAGE;key;%I;10| '|SPADreplace| '(XLAM (|graf|) (QVELT |graf| 0))) 

(SDEFUN |GRIMAGE;key;%I;10| ((|graf| (%)) (% (|Integer|))) (QVELT |graf| 0)) 

(MAKEPROP '|GRIMAGE;pointLists;%L;11| '|SPADreplace|
          '(XLAM (|graf|) (QVELT |graf| 3))) 

(SDEFUN |GRIMAGE;pointLists;%L;11|
        ((|graf| (%)) (% (|List| (|List| (|Point| (|DoubleFloat|))))))
        (QVELT |graf| 3)) 

(SDEFUN |GRIMAGE;ranges;%L;12|
        ((|graf| (%)) (% (|List| (|Segment| (|Float|)))))
        (COND ((NULL (QVELT |graf| 1)) NIL)
              ('T
               (LIST
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT % 84))
                            (QREFELT % 41))
                  (QREFELT % 85))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT % 84))
                            (QREFELT % 40))
                  (QREFELT % 85))
                 (QREFELT % 86))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT % 84))
                            (QREFELT % 41))
                  (QREFELT % 85))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT % 84))
                            (QREFELT % 40))
                  (QREFELT % 85))
                 (QREFELT % 86)))))) 

(SDEFUN |GRIMAGE;ranges;%2L;13|
        ((|graf| (%)) (|rangesList| (|List| (|Segment| (|Float|))))
         (% (|List| (|Segment| (|Float|)))))
        (SEQ
         (QSETVELT |graf| 1
                   (LIST
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT % 14))
                                (QREFELT % 16))
                      (QREFELT % 18))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT % 14))
                                (QREFELT % 19))
                      (QREFELT % 18))
                     (QREFELT % 21))
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT % 14))
                                (QREFELT % 16))
                      (QREFELT % 18))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT % 14))
                                (QREFELT % 19))
                      (QREFELT % 18))
                     (QREFELT % 21))))
         (EXIT |rangesList|))) 

(SDEFUN |GRIMAGE;units;%L;14| ((|graf| (%)) (% (|List| (|Float|))))
        (COND ((NULL (QVELT |graf| 2)) NIL)
              ('T
               (LIST
                (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT % 88))
                          (QREFELT % 85))
                (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT % 88))
                          (QREFELT % 85)))))) 

(SDEFUN |GRIMAGE;units;%2L;15|
        ((|graf| (%)) (|unitsToBe| (|List| (|Float|))) (% (|List| (|Float|))))
        (SEQ
         (QSETVELT |graf| 2
                   (LIST
                    (SPADCALL (SPADCALL |unitsToBe| 1 (QREFELT % 25))
                              (QREFELT % 18))
                    (SPADCALL (SPADCALL |unitsToBe| 2 (QREFELT % 25))
                              (QREFELT % 18))))
         (EXIT |unitsToBe|))) 

(SDEFUN |GRIMAGE;graphImage;%;16| ((% (%))) (|GRIMAGE;graph| NIL %)) 

(SDEFUN |GRIMAGE;makeGraphImage;L%;17|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (% (%)))
        (SPROG
         ((#1=#:G133 NIL) (|l| (|Integer|)) (#2=#:G134 NIL) (#3=#:G135 NIL)
          (#4=#:G136 NIL) (#5=#:G137 NIL) (|i| NIL) (#6=#:G138 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT % 55)) #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |l|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL (QREFELT % 59)) #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #6# |l|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT % 60)) #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT % 92))))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LL%;18|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|lpc| (|List| (|Palette|))) (|llc| (|List| (|Palette|)))
         (|lps| (|List| (|PositiveInteger|))) (% (%)))
        (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT % 94))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LLL%;19|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|lpc| (|List| (|Palette|))) (|llc| (|List| (|Palette|)))
         (|lps| (|List| (|PositiveInteger|))) (|opts| (|List| (|DrawOption|)))
         (% (%)))
        (SPROG ((|graf| (%)))
               (SEQ
                (LETT |graf|
                      (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT % 11)) %))
                (QSETVELT |graf| 7 |opts|)
                (EXIT (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| %))))) 

(SDEFUN |GRIMAGE;component;%L2PPiV;20|
        ((|graf| (%)) (|ListOfPoints| (|List| (|Point| (|DoubleFloat|))))
         (|PointColor| (|Palette|)) (|LineColor| (|Palette|))
         (|PointSize| (|PositiveInteger|)) (% (|Void|)))
        (SEQ
         (QSETVELT |graf| 3
                   (SPADCALL (QVELT |graf| 3) (LIST |ListOfPoints|)
                             (QREFELT % 95)))
         (QSETVELT |graf| 4
                   (SPADCALL (QVELT |graf| 4) (LIST |PointColor|)
                             (QREFELT % 96)))
         (QSETVELT |graf| 5
                   (SPADCALL (QVELT |graf| 5) (LIST |LineColor|)
                             (QREFELT % 96)))
         (EXIT
          (QSETVELT |graf| 6
                    (SPADCALL (QVELT |graf| 6) (LIST |PointSize|)
                              (QREFELT % 97)))))) 

(SDEFUN |GRIMAGE;component;%PV;21|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT % 55))
                  (SPADCALL (QREFELT % 59)) (SPADCALL (QREFELT % 60))
                  (QREFELT % 100))) 

(SDEFUN |GRIMAGE;component;%P2PPiV;22|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|)))
         (|PointColor| (|Palette|)) (|LineColor| (|Palette|))
         (|PointSize| (|PositiveInteger|)) (% (|Void|)))
        (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
                  (QREFELT % 99))) 

(SDEFUN |GRIMAGE;appendPoint;%PV;23|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPROG ((|num| (|Integer|)))
               (SEQ (LETT |num| (LENGTH (QVELT |graf| 3)))
                    (EXIT
                     (COND
                      ((<= |num| 0) (|error| "No point lists to append to!"))
                      ('T
                       (SPADCALL (QVELT |graf| 3) |num|
                                 (SPADCALL
                                  (SPADCALL (QVELT |graf| 3) |num|
                                            (QREFELT % 102))
                                  (LIST |aPoint|) (QREFELT % 103))
                                 (QREFELT % 104)))))))) 

(SDEFUN |GRIMAGE;point;%PPV;24|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|)))
         (|PointColor| (|Palette|)) (% (|Void|)))
        (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT % 59))
                  (SPADCALL (QREFELT % 60)) (QREFELT % 100))) 

(SDEFUN |GRIMAGE;coerce;L%;25|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (% (%)))
        (SPROG
         ((#1=#:G157 NIL) (|l| (|Integer|)) (#2=#:G158 NIL) (#3=#:G159 NIL)
          (#4=#:G160 NIL) (#5=#:G161 NIL) (|i| NIL) (#6=#:G162 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT % 55)) #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |l|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL (QREFELT % 59)) #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #6# |l|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT % 60)) #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT % 92))))) 

(SDEFUN |GRIMAGE;coerce;%Of;26| ((|graf| (%)) (% (|OutputForm|)))
        (SPROG ((|p| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL "Graph with " (QREFELT % 109))
                      (SPADCALL
                       (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT % 83))))
                       (QREFELT % 110))
                      (SPADCALL
                       (COND ((EQL |p| 1) " point list") ('T " point lists"))
                       (QREFELT % 109)))
                (QREFELT % 112)))) 

(DECLAIM (NOTINLINE |GraphImage;|)) 

(DEFUN |GraphImage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GraphImage|))
          (LETT % (GETREFV 114))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GraphImage| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |rangesField|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |unitsField| (|List| (|DoubleFloat|)))
                              (|:| |llPoints|
                                   (|List| (|List| (|Point| (|DoubleFloat|)))))
                              (|:| |pointColors| (|List| (|Palette|)))
                              (|:| |lineColors| (|List| (|Palette|)))
                              (|:| |pointSizes| (|List| (|PositiveInteger|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          %))) 

(DEFUN |GraphImage| ()
  (SPROG NIL
         (PROG (#1=#:G165)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GraphImage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GraphImage|
                             (LIST (CONS NIL (CONS 1 (|GraphImage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|GraphImage|)))))))))) 

(MAKEPROP '|GraphImage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 12) |GRIMAGE;ranges;%L;12|
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|) (0 . |ranges|)
              (|Segment| 15) (|Integer|) (6 . |elt|) (|Float|) (12 . |low|)
              (|DoubleFloat|) (17 . |convert|) (22 . |high|) (|Segment| 17)
              (27 . |segment|) (|List| 15) |GRIMAGE;units;%L;14| (33 . |units|)
              (39 . |elt|) (|Color|) (|Palette|) (45 . |hue|) (50 . |hue|)
              (55 . |shade|) (|PositiveInteger|) (|Point| 17)
              (60 . |dimension|) (|List| 17) (65 . |extend|) (71 . |setelt!|)
              (|List| 98) (|List| 27) |GRIMAGE;putColorInfo;LLL;2|
              (78 . |high|) (83 . |low|) (88 . |ceiling|) (93 . |retract|)
              (|List| 20) (98 . |second|) (103 . SEGMENT) (|Boolean|)
              (|NonNegativeInteger|) (109 . ~=) (|Void|) (|String|)
              (|DisplayPackage|) (115 . |say|) (|ViewDefaultsPackage|)
              (120 . |pointColorDefault|) (124 . |new|) (130 . |concat|)
              (136 . |first|) (142 . |lineColorDefault|)
              (146 . |pointSizeDefault|) (|List| 31) (150 . |new|)
              (156 . |concat|) (162 . |first|) |GRIMAGE;key;%I;10| (168 . ~=)
              (|CoordinateSystems| 17) (174 . |cartesian|) (|Mapping| 32 32)
              (179 . |coord|) (|PlotTools|) (185 . |calcRanges|)
              (190 . |second|) (|PointPackage| 17) (195 . |xCoord|)
              (200 . |yCoord|) (205 . |hue|) (210 . |shade|)
              (215 . |numberOfHues|) (|SingleInteger|) (219 . *)
              |GRIMAGE;sendGraphImage;%V;9| |GRIMAGE;pointLists;%L;11|
              (225 . |elt|) (231 . |convert|) (236 . |segment|)
              |GRIMAGE;ranges;%2L;13| (242 . |elt|) (248 . |1|)
              |GRIMAGE;units;%2L;15| |GRIMAGE;graphImage;%;16|
              |GRIMAGE;makeGraphImage;L2LL%;18| |GRIMAGE;makeGraphImage;L%;17|
              |GRIMAGE;makeGraphImage;L2LLL%;19| (252 . |append|)
              (258 . |append|) (264 . |append|) (|List| 32)
              |GRIMAGE;component;%L2PPiV;20| |GRIMAGE;component;%P2PPiV;22|
              |GRIMAGE;component;%PV;21| (270 . |elt|) (276 . |append|)
              (282 . |setelt!|) |GRIMAGE;appendPoint;%PV;23|
              |GRIMAGE;point;%PPV;24| |GRIMAGE;coerce;L%;25| (|OutputForm|)
              (289 . |message|) (294 . |coerce|) (|List| %) (299 . |hconcat|)
              |GRIMAGE;coerce;%Of;26|)
           '#(~= 304 |units| 310 |sendGraphImage| 321 |ranges| 326
              |putColorInfo| 337 |pointLists| 343 |point| 348 |makeGraphImage|
              355 |latex| 377 |key| 382 |graphImage| 387 |component| 391
              |coerce| 415 |appendPoint| 425 = 431)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 108) (|BasicType|))
                        (|makeByteWordVec2| 113
                                            '(2 10 7 9 7 11 2 7 12 0 13 14 1 12
                                              15 0 16 1 15 17 0 18 1 12 15 0 19
                                              2 20 0 17 17 21 2 10 22 9 22 24 2
                                              22 15 0 13 25 1 27 26 0 28 1 26
                                              13 0 29 1 27 13 0 30 1 32 31 0 33
                                              2 32 0 0 34 35 3 32 17 0 13 17 36
                                              1 20 17 0 40 1 20 17 0 41 1 17 0
                                              0 42 1 17 13 0 43 1 44 20 0 45 2
                                              20 0 17 17 46 2 48 47 0 0 49 1 52
                                              50 51 53 0 54 27 55 2 38 0 48 27
                                              56 2 38 0 0 0 57 2 38 0 0 48 58 0
                                              54 27 59 0 54 31 60 2 61 0 48 31
                                              62 2 61 0 0 0 63 2 61 0 0 48 64 2
                                              13 47 0 0 66 1 67 32 32 68 2 10
                                              69 9 69 70 1 71 44 37 72 1 34 17
                                              0 73 1 74 17 32 75 1 74 17 32 76
                                              1 74 17 32 77 1 74 17 32 78 0 26
                                              31 79 2 80 0 13 0 81 2 44 20 0 13
                                              84 1 17 15 0 85 2 12 0 15 15 86 2
                                              34 17 0 13 88 0 15 0 89 2 37 0 0
                                              0 95 2 38 0 0 0 96 2 61 0 0 0 97
                                              2 37 98 0 13 102 2 98 0 0 0 103 3
                                              37 98 0 13 98 104 1 108 0 51 109
                                              1 48 108 0 110 1 108 0 111 112 2
                                              0 47 0 0 1 1 0 22 0 23 2 0 22 0
                                              22 90 1 0 50 0 82 2 0 7 0 7 87 1
                                              0 7 0 8 2 0 37 37 38 39 1 0 37 0
                                              83 3 0 50 0 32 27 106 4 0 0 37 38
                                              38 61 92 1 0 0 37 93 5 0 0 37 38
                                              38 61 9 94 1 0 51 0 1 1 0 13 0 65
                                              0 0 0 91 5 0 50 0 98 27 27 31 99
                                              2 0 50 0 32 101 5 0 50 0 32 27 27
                                              31 100 1 0 108 0 113 1 0 0 37 107
                                              2 0 50 0 32 105 2 0 47 0 0 1)))))
           '|lookupComplete|)) 
