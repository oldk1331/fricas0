
(SDEFUN |LWORD;lyndon?;FmB;1| ((|w| (|FreeMonoid| |VarSet|)) (% (|Boolean|)))
        (SPROG ((#1=#:G19 NIL) (|f| (|FreeMonoid| |VarSet|)))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |w| (|spadConstant| % 9) (QREFELT % 11)) NIL)
                       ('T
                        (SEQ (LETT |f| (SPADCALL |w| (QREFELT % 12)))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (SPADCALL |f| (|spadConstant| % 9)
                                               (QREFELT % 13)))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL (SPADCALL |w| |f| (QREFELT % 14)))
                                      (PROGN (LETT #1# NIL) (GO #2=#:G18)))
                                     ('T
                                      (LETT |f|
                                            (SPADCALL |f| (QREFELT % 12)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT 'T)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LWORD;lyndonIfCan;FmU;2|
        ((|w| (|FreeMonoid| |VarSet|)) (% (|Union| % "failed")))
        (SPROG ((|l| (|List| %)))
               (SEQ (LETT |l| (SPADCALL |w| (QREFELT % 17)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |l| (QREFELT % 20)) 1)
                       (CONS 0 (SPADCALL |l| (QREFELT % 21))))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |LWORD;lyndon;Fm%;3| ((|w| (|FreeMonoid| |VarSet|)) (% (%)))
        (SPROG ((|l| (|List| %)))
               (SEQ (LETT |l| (SPADCALL |w| (QREFELT % 17)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |l| (QREFELT % 20)) 1)
                       (SPADCALL |l| (QREFELT % 21)))
                      ('T (|error| "This word is not a Lyndon word"))))))) 

(SDEFUN |LWORD;LetterList|
        ((|w| (|FreeMonoid| |VarSet|)) (% (|List| |VarSet|)))
        (COND ((SPADCALL |w| (|spadConstant| % 9) (QREFELT % 11)) NIL)
              ('T
               (CONS (SPADCALL |w| (QREFELT % 25))
                     (|LWORD;LetterList| (SPADCALL |w| (QREFELT % 12)) %))))) 

(SDEFUN |LWORD;factor1|
        ((|gauche| #1=(|List| %)) (|x| (%)) (|droite| #2=(|List| %))
         (% (|List| %)))
        (SPROG ((|d| #2#) (|g| #1#) (#3=#:G40 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |g| |gauche|) (LETT |d| |droite|)
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |g| (QREFELT % 26))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |g| '|first| (QREFELT % 28))
                                         |x| (QREFELT % 29))
                               (SEQ
                                (LETT |x|
                                      (SPADCALL
                                       (SPADCALL |g| '|first| (QREFELT % 28))
                                       |x| (QREFELT % 30)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |d| (QREFELT % 26))
                                   (LETT |g| (SPADCALL |g| (QREFELT % 31))))
                                  ('T
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL |x|
                                                    (SPADCALL |g|
                                                              (QREFELT % 31))
                                                    (QREFELT % 32)))
                                    (LETT |x| (SPADCALL |d| (QREFELT % 21)))
                                    (EXIT
                                     (LETT |d|
                                           (SPADCALL |d|
                                                     (QREFELT % 31))))))))))
                              ('T
                               (SEQ
                                (LETT |d| (SPADCALL |x| |d| (QREFELT % 32)))
                                (LETT |x| (SPADCALL |g| (QREFELT % 21)))
                                (EXIT
                                 (LETT |g| (SPADCALL |g| (QREFELT % 31)))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #3# (SPADCALL |x| |d| (QREFELT % 32)))
                        (GO #4=#:G39)))))
                #4# (EXIT #3#)))) 

(SDEFUN |LWORD;factor;FmL;6| ((|w| (|FreeMonoid| |VarSet|)) (% (|List| %)))
        (SPROG ((#1=#:G45 NIL) (|u| NIL) (#2=#:G46 NIL) (|l| (|List| %)))
               (SEQ
                (COND ((SPADCALL |w| (|spadConstant| % 9) (QREFELT % 11)) NIL)
                      ('T
                       (SEQ
                        (LETT |l|
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |u| NIL)
                                     (LETT #2# (|LWORD;LetterList| |w| %)) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |u| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #1#
                                             (CONS
                                              (SPADCALL |u| (QREFELT % 33))
                                              #1#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #1#))))
                               (QREFELT % 34)))
                        (EXIT
                         (|LWORD;factor1| (SPADCALL |l| (QREFELT % 31))
                          (SPADCALL |l| (QREFELT % 21)) NIL %)))))))) 

(SDEFUN |LWORD;<;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|lx| #1=(|PositiveInteger|)) (|ly| #1#))
               (SEQ (LETT |lx| (SPADCALL |x| (QREFELT % 36)))
                    (LETT |ly| (SPADCALL |y| (QREFELT % 36)))
                    (EXIT
                     (COND ((EQL |lx| |ly|) (SPADCALL |x| |y| (QREFELT % 29)))
                           ('T (< |lx| |ly|))))))) 

(SDEFUN |LWORD;coerce;%Of;8| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 38)) (QREFELT % 40))
                  (QREFELT % 41))) 

(MAKEPROP '|LWORD;coerce;%Fm;9| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |LWORD;coerce;%Fm;9| ((|x| (%)) (% (|FreeMagma| |VarSet|))) |x|) 

(SDEFUN |LWORD;LyndonWordsList1;LPiOda;10|
        ((|vl| (|List| |VarSet|)) (|n| (|PositiveInteger|))
         (% (|OneDimensionalArray| (|List| %))))
        (SPROG
         ((#1=#:G52 NIL) (|base| (|OneDimensionalArray| (|List| %)))
          (#2=#:G79 NIL) (|w| NIL) (#3=#:G80 NIL) (|ll| NIL) (#4=#:G81 NIL)
          (#5=#:G82 NIL) (#6=#:G83 NIL) (|i| NIL) (#7=#:G84 NIL) (|a| NIL)
          (#8=#:G85 NIL) (|b| NIL) (#9=#:G86 NIL) (|lbase1| (|List| %))
          (#10=#:G78 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |vl|) (|error| "empty list"))
                 ('T
                  (SEQ
                   (LETT |base|
                         (SPADCALL
                          (PROG1 (LETT #1# |n|)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          NIL (QREFELT % 45)))
                   (LETT |lbase1|
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |w| NIL)
                               (LETT #3# (SPADCALL |vl| (QREFELT % 47))) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |w| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |w| (QREFELT % 33))
                                             #2#))))
                               (LETT #3# (CDR #3#)) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))
                   (SPADCALL |base| 1 |lbase1| (QREFELT % 49))
                   (SEQ (LETT |ll| 2) (LETT #4# |n|) G190
                        (COND ((|greater_SI| |ll| #4#) (GO G191)))
                        (SEQ (LETT |lbase1| NIL)
                             (SEQ (LETT |a| NIL)
                                  (LETT #5# (SPADCALL |base| 1 (QREFELT % 50)))
                                  G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |a| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |b| NIL)
                                         (LETT #6#
                                               (SPADCALL |base| (- |ll| 1)
                                                         (QREFELT % 50)))
                                         G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT |b| (CAR #6#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL |a| |b| (QREFELT % 29))
                                             (LETT |lbase1|
                                                   (SPADCALL
                                                    (SPADCALL |a| |b|
                                                              (QREFELT % 30))
                                                    |lbase1|
                                                    (QREFELT % 32)))))))
                                         (LETT #6# (CDR #6#)) (GO G190) G191
                                         (EXIT NIL))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (SEQ (LETT |i| 2) (LETT #7# (- |ll| 1)) G190
                                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |a| NIL)
                                         (LETT #8#
                                               (SPADCALL |base| |i|
                                                         (QREFELT % 50)))
                                         G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |a| (CAR #8#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |b| NIL)
                                                (LETT #9#
                                                      (SPADCALL |base|
                                                                (- |ll| |i|)
                                                                (QREFELT %
                                                                         50)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |b| (CAR #9#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |a| |b|
                                                              (QREFELT % 29))
                                                    (COND
                                                     ((OR
                                                       (SPADCALL |b|
                                                                 (SPADCALL |a|
                                                                           (QREFELT
                                                                            %
                                                                            51))
                                                                 (QREFELT %
                                                                          29))
                                                       (SPADCALL |b|
                                                                 (SPADCALL |a|
                                                                           (QREFELT
                                                                            %
                                                                            51))
                                                                 (QREFELT %
                                                                          52)))
                                                      (LETT |lbase1|
                                                            (SPADCALL
                                                             (SPADCALL |a| |b|
                                                                       (QREFELT
                                                                        % 30))
                                                             |lbase1|
                                                             (QREFELT %
                                                                      32)))))))))
                                                (LETT #9# (CDR #9#)) (GO G190)
                                                G191 (EXIT NIL))))
                                         (LETT #8# (CDR #8#)) (GO G190) G191
                                         (EXIT NIL))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (SPADCALL |base| |ll|
                                        (SPADCALL (ELT % 29) |lbase1|
                                                  (QREFELT % 54))
                                        (QREFELT % 49))))
                        (LETT |ll| (|inc_SI| |ll|)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #10# |base|) (GO #11=#:G77)))))))
          #11# (EXIT #10#)))) 

(SDEFUN |LWORD;LyndonWordsList;LPiL;11|
        ((|vl| (|List| |VarSet|)) (|n| (|PositiveInteger|)) (% (|List| %)))
        (SPROG
         ((|v| (|OneDimensionalArray| (|List| %))) (|i| NIL) (#1=#:G92 NIL)
          (#2=#:G89 #3=(|List| %)) (#4=#:G87 #3#) (#5=#:G88 NIL))
         (SEQ (LETT |v| (SPADCALL |vl| |n| (QREFELT % 56)))
              (EXIT
               (PROGN
                (LETT #5# NIL)
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #2# (SPADCALL |v| |i| (QREFELT % 50)))
                        (COND
                         (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 57))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND (#5# #4#) ('T NIL))))))) 

(DECLAIM (NOTINLINE |LyndonWord;|)) 

(DEFUN |LyndonWord;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|LyndonWord| DV$1))
          (LETT % (GETREFV 61))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LyndonWord| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|FreeMagma| |#1|))
          %))) 

(DEFUN |LyndonWord| (#1=#:G96)
  (SPROG NIL
         (PROG (#2=#:G97)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LyndonWord|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|LyndonWord;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LyndonWord|)))))))))) 

(MAKEPROP '|LyndonWord| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeMagma| 6) (|local| |#1|) '|Rep|
              (|FreeMonoid| 6) (0 . |1|) (|Boolean|) (4 . =) (10 . |rest|)
              (15 . ~=) (21 . |lexico|) |LWORD;lyndon?;FmB;1| (|List| %)
              |LWORD;factor;FmL;6| (|NonNegativeInteger|) (|List| $$)
              (27 . |#|) (32 . |first|) (|Union| % '"failed")
              |LWORD;lyndonIfCan;FmU;2| |LWORD;lyndon;Fm%;3| (37 . |first|)
              (42 . |empty?|) '"first" (47 . |elt|) (53 . |lexico|) (59 . *)
              (65 . |rest|) (70 . |cons|) (76 . |coerce|) (81 . |reverse|)
              (|PositiveInteger|) (86 . |length|) |LWORD;<;2%B;7|
              (91 . |coerce|) (|OutputForm|) (96 . |coerce|) (101 . |bracket|)
              |LWORD;coerce;%Of;8| |LWORD;coerce;%Fm;9|
              (|OneDimensionalArray| 19) (106 . |new|) (|List| 6)
              (112 . |sort|) (|Integer|) (117 . |setelt!|) (124 . |elt|)
              (130 . |right|) (135 . =) (|Mapping| 10 $$ $$) (141 . |sort!|)
              (|OneDimensionalArray| 16) |LWORD;LyndonWordsList1;LPiOda;10|
              (147 . |append|) |LWORD;LyndonWordsList;LPiL;11| (|String|)
              (|Union| 6 '"failed"))
           '#(~= 153 |varList| 159 |smaller?| 164 |sign| 170 |right| 175
              |retractable?| 180 |retractIfCan| 185 |retract| 190 |positive?|
              195 |negative?| 200 |min| 205 |max| 211 |lyndonIfCan| 217
              |lyndon?| 222 |lyndon| 227 |lexico| 232 |length| 238 |left| 243
              |latex| 248 |factor| 253 |coerce| 258 |LyndonWordsList1| 278
              |LyndonWordsList| 284 >= 290 > 296 = 302 <= 308 < 314)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |RetractableTo&| |SetCategory&| NIL
                     |PartialOrder&| NIL |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|RetractableTo| 6)
                      (|SetCategory|) (|CoercibleTo| 39) (|PartialOrder|)
                      (|CoercibleFrom| 6) (|BasicType|))
                   (|makeByteWordVec2| 60
                                       '(0 8 0 9 2 8 10 0 0 11 1 8 0 0 12 2 8
                                         10 0 0 13 2 8 10 0 0 14 1 19 18 0 20 1
                                         19 2 0 21 1 8 6 0 25 1 19 10 0 26 2 19
                                         2 0 27 28 2 0 10 0 0 29 2 7 0 0 0 30 1
                                         19 0 0 31 2 19 0 2 0 32 1 0 0 6 33 1
                                         19 0 0 34 1 0 35 0 36 1 0 8 0 38 1 8
                                         39 0 40 1 39 0 0 41 2 44 0 18 19 45 1
                                         46 0 0 47 3 44 19 0 48 19 49 2 44 19 0
                                         48 50 1 0 0 0 51 2 0 10 0 0 52 2 19 0
                                         53 0 54 2 19 0 0 0 57 2 0 10 0 0 1 1 0
                                         46 0 1 2 0 10 0 0 1 1 1 48 0 1 1 0 0 0
                                         51 1 0 10 0 1 1 0 60 0 1 1 0 6 0 1 1 1
                                         10 0 1 1 1 10 0 1 2 0 0 0 0 1 2 0 0 0
                                         0 1 1 0 22 8 23 1 0 10 8 15 1 0 0 8 24
                                         2 0 10 0 0 29 1 0 35 0 36 1 0 0 0 1 1
                                         0 59 0 1 1 0 16 8 17 1 0 39 0 42 1 0 0
                                         6 33 1 0 5 0 43 1 0 8 0 38 2 0 55 46
                                         35 56 2 0 16 46 35 58 2 0 10 0 0 1 2 0
                                         10 0 0 1 2 0 10 0 0 52 2 0 10 0 0 1 2
                                         0 10 0 0 37)))))
           '|lookupComplete|)) 
