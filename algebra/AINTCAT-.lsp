
(SDEFUN |AINTCAT-;interval;2RS;1| ((|i| (R)) (|s| (R)) (% (S)))
        (COND
         ((SPADCALL |s| |i| (QREFELT % 9)) (SPADCALL |s| |i| (QREFELT % 10)))
         ('T (SPADCALL |i| |s| (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;*;Pi2S;2| ((|z| (|PositiveInteger|)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |z| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 14))
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 14))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;coerce;SL;3| ((|x| (S)) (% (|List| R)))
        (LIST (SPADCALL |x| (QREFELT % 12)) (SPADCALL |x| (QREFELT % 15)))) 

(SDEFUN |AINTCAT-;coerce;SOf;4| ((|x| (S)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 21))) 

(SDEFUN |AINTCAT-;=;2SB;5| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (SPADCALL |y| (QREFELT % 12))
                    (QREFELT % 23))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15))
                    (QREFELT % 23)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;error?;SB;6| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 9))) 

(SDEFUN |AINTCAT-;contains?;SRB;7| ((|x| (S)) (|r| (R)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) |r| (QREFELT % 26))
          (SPADCALL |r| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 26)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;contains?;2SB;8| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (SPADCALL |y| (QREFELT % 12))
                    (QREFELT % 26))
          (SPADCALL (SPADCALL |y| (QREFELT % 15)) (SPADCALL |x| (QREFELT % 15))
                    (QREFELT % 26)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;sample;S;9| ((% (S))) (|spadConstant| % 29)) 

(SDEFUN |AINTCAT-;zero?;SB;10| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 31))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 31)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;*;Nni2S;11| ((|z| (|NonNegativeInteger|)) (|x| (S)) (% (S)))
        (SPROG ((#1=#:G50 NIL))
               (COND ((ZEROP |z|) (|spadConstant| % 29))
                     ('T
                      (SPADCALL
                       (PROG1 (LETT #1# |z|)
                         (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                           '(|NonNegativeInteger|) #1#))
                       |x| (QREFELT % 33)))))) 

(SDEFUN |AINTCAT-;positive?;SB;12| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL (|spadConstant| % 36) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 9))) 

(SDEFUN |AINTCAT-;negative?;SB;13| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (|spadConstant| % 36)
                  (QREFELT % 9))) 

(SDEFUN |AINTCAT-;+;3S;14| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 39)) |y|)
              ((SPADCALL |y| (QREFELT % 39)) |x|)
              ((SPADCALL |x| |y| (QREFELT % 40))
               (SPADCALL
                (SPADCALL 2 (SPADCALL |x| (QREFELT % 12)) (QREFELT % 14))
                (SPADCALL 2 (SPADCALL |x| (QREFELT % 15)) (QREFELT % 14))
                (QREFELT % 10)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12))
                          (SPADCALL |y| (QREFELT % 12)) (QREFELT % 41))
                (SPADCALL (SPADCALL |x| (QREFELT % 15))
                          (SPADCALL |y| (QREFELT % 15)) (QREFELT % 41))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;+;SRS;15| ((|x| (S)) (|r| (R)) (% (S)))
        (COND ((SPADCALL |r| (QREFELT % 31)) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12)) |r| (QREFELT % 41))
                (SPADCALL (SPADCALL |x| (QREFELT % 15)) |r| (QREFELT % 41))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;opposite?;2SB;16| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 44)) (QREFELT % 39))) 

(SDEFUN |AINTCAT-;-;2S;17| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 46))
                  (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 46))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;width;SR;18| ((|x| (S)) (% (R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 48))) 

(SDEFUN |AINTCAT-;-;3S;19| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 39)) (SPADCALL |y| (QREFELT % 50)))
              ((SPADCALL |y| (QREFELT % 39)) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12))
                          (SPADCALL |y| (QREFELT % 15)) (QREFELT % 48))
                (SPADCALL (SPADCALL |x| (QREFELT % 15))
                          (SPADCALL |y| (QREFELT % 12)) (QREFELT % 48))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;*;I2S;20| ((|z| (|Integer|)) (|x| (S)) (% (S)))
        (COND ((ZEROP |z|) (|spadConstant| % 29))
              ((OR (EQL |z| 1) (SPADCALL |x| (QREFELT % 39))) |x|)
              ('T
               (COND
                ((> |z| 0)
                 (SPADCALL
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 53))
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 53))
                  (QREFELT % 10)))
                ('T
                 (SPADCALL
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 53))
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 53))
                  (QREFELT % 10))))))) 

(SDEFUN |AINTCAT-;abs;2S;21| ((|x| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 55)) |x|)
              ((SPADCALL |x| (QREFELT % 56)) (SPADCALL |x| (QREFELT % 50)))
              ('T
               (SPADCALL (|spadConstant| % 36)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 46))
                          (SPADCALL |x| (QREFELT % 15)) (QREFELT % 57))
                         (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;*;R2S;22| ((|r| (R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 59))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59))
                  (QREFELT % 60))) 

(SDEFUN |AINTCAT-;one?;SB;23| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 62))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 62)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;leftRecip;SU;24| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 64)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;rightRecip;SU;25| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 64)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;^;SPiS;26| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL |x| (|spadConstant| % 36) (QREFELT % 68))
           (COND
            ((EVENP |n|)
             (EXIT
              (SPADCALL (|spadConstant| % 36)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 46))
                          (SPADCALL |x| (QREFELT % 15)) (QREFELT % 57))
                         |n| (QREFELT % 69))
                        (QREFELT % 10)))))))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 69))
                    (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 69))
                    (QREFELT % 60))))) 

(SDEFUN |AINTCAT-;^;SNniS;27| ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((#1=#:G96 NIL))
               (COND
                ((ZEROP |n|)
                 (COND
                  ((SPADCALL |x| (QREFELT % 39))
                   (|error| "cannot compute 0^0"))
                  (#2='T (|spadConstant| % 71))))
                (#2#
                 (SPADCALL |x|
                           (PROG1 (LETT #1# |n|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #1#))
                           (QREFELT % 72)))))) 

(SDEFUN |AINTCAT-;*;3S;28| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|products| (|List| R)) (|sy| (R)) (|iy| (R)) (|sx| (R)) (|ix| (R)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 64)) |y|)
                ((SPADCALL |y| (QREFELT % 64)) |x|)
                ((OR (SPADCALL |x| (QREFELT % 39))
                     (SPADCALL |y| (QREFELT % 39)))
                 (|spadConstant| % 29))
                ('T
                 (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
                      (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
                      (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
                      (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
                      (LETT |products|
                            (SPADCALL
                             (LIST (SPADCALL |ix| |iy| (QREFELT % 59))
                                   (SPADCALL |ix| |sy| (QREFELT % 59))
                                   (SPADCALL |sx| |iy| (QREFELT % 59))
                                   (SPADCALL |sx| |sy| (QREFELT % 59)))
                             (QREFELT % 74)))
                      (EXIT
                       (SPADCALL (|SPADfirst| |products|)
                                 (SPADCALL |products| (QREFELT % 75))
                                 (QREFELT % 10))))))))) 

(SDEFUN |AINTCAT-;unit?;SB;29| ((|x| (S)) (% (|Boolean|)))
        (NULL (SPADCALL |x| (|spadConstant| % 36) (QREFELT % 68)))) 

(SDEFUN |AINTCAT-;inv;2S;30| ((|x| (S)) (% (S)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 36) (QREFELT % 68))
          (|error| "inv: interval contains 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 78))
                    (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 78))
                    (QREFELT % 60))))) 

(SDEFUN |AINTCAT-;/;3S;31| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL |x| (SPADCALL |y| (QREFELT % 80)) (QREFELT % 81))) 

(DECLAIM (NOTINLINE |AIntervalCategory&;|)) 

(DEFUN |AIntervalCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AIntervalCategory&| DV$1 DV$2))
          (LETT % (GETREFV 83))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedRing|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRing|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedMonoid|))
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoid|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 8)
            (PROGN
             (QSETREFV % 30
                       (CONS (|dispatchFunction| |AINTCAT-;sample;S;9|) %))
             (QSETREFV % 32
                       (CONS (|dispatchFunction| |AINTCAT-;zero?;SB;10|) %))
             (QSETREFV % 35
                       (CONS (|dispatchFunction| |AINTCAT-;*;Nni2S;11|) %))
             (QSETREFV % 37
                       (CONS (|dispatchFunction| |AINTCAT-;positive?;SB;12|)
                             %))
             (QSETREFV % 38
                       (CONS (|dispatchFunction| |AINTCAT-;negative?;SB;13|)
                             %))
             (QSETREFV % 42 (CONS (|dispatchFunction| |AINTCAT-;+;3S;14|) %))
             (QSETREFV % 43 (CONS (|dispatchFunction| |AINTCAT-;+;SRS;15|) %))
             (QSETREFV % 45
                       (CONS (|dispatchFunction| |AINTCAT-;opposite?;2SB;16|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV % 47 (CONS (|dispatchFunction| |AINTCAT-;-;2S;17|) %))
             (QSETREFV % 49
                       (CONS (|dispatchFunction| |AINTCAT-;width;SR;18|) %))
             (QSETREFV % 51 (CONS (|dispatchFunction| |AINTCAT-;-;3S;19|) %))
             (QSETREFV % 54 (CONS (|dispatchFunction| |AINTCAT-;*;I2S;20|) %))
             (QSETREFV % 58
                       (CONS (|dispatchFunction| |AINTCAT-;abs;2S;21|) %)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (QSETREFV % 61 (CONS (|dispatchFunction| |AINTCAT-;*;R2S;22|) %))))
          (COND
           ((|testBitVector| |pv$| 4)
            (COND
             ((|testBitVector| |pv$| 3)
              (PROGN
               (QSETREFV % 63
                         (CONS (|dispatchFunction| |AINTCAT-;one?;SB;23|) %))
               (QSETREFV % 66
                         (CONS (|dispatchFunction| |AINTCAT-;leftRecip;SU;24|)
                               %))
               (QSETREFV % 67
                         (CONS (|dispatchFunction| |AINTCAT-;rightRecip;SU;25|)
                               %)))))))
          (COND
           ((|testBitVector| |pv$| 7)
            (COND
             ((|testBitVector| |pv$| 6)
              (COND
               ((|testBitVector| |pv$| 5)
                (QSETREFV % 70
                          (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;26|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 8)
            (COND
             ((|testBitVector| |pv$| 4)
              (COND
               ((|testBitVector| |pv$| 3)
                (QSETREFV % 73
                          (CONS (|dispatchFunction| |AINTCAT-;^;SNniS;27|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 7)
            (COND
             ((|testBitVector| |pv$| 4)
              (COND
               ((|testBitVector| |pv$| 3)
                (QSETREFV % 76
                          (CONS (|dispatchFunction| |AINTCAT-;*;3S;28|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 2)
            (COND
             ((|testBitVector| |pv$| 1)
              (PROGN
               (QSETREFV % 77
                         (CONS (|dispatchFunction| |AINTCAT-;unit?;SB;29|) %))
               (QSETREFV % 79
                         (CONS (|dispatchFunction| |AINTCAT-;inv;2S;30|) %))
               (QSETREFV % 82
                         (CONS (|dispatchFunction| |AINTCAT-;/;3S;31|) %)))))))
          %))) 

(MAKEPROP '|AIntervalCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . <) (6 . |qinterval|) |AINTCAT-;interval;2RS;1| (12 . |inf|)
              (|PositiveInteger|) (17 . *) (23 . |sup|) |AINTCAT-;*;Pi2S;2|
              (|List| 7) |AINTCAT-;coerce;SL;3| (28 . |coerce|) (|OutputForm|)
              (33 . |coerce|) |AINTCAT-;coerce;SOf;4| (38 . =)
              |AINTCAT-;=;2SB;5| |AINTCAT-;error?;SB;6| (44 . <=)
              |AINTCAT-;contains?;SRB;7| |AINTCAT-;contains?;2SB;8|
              (50 . |Zero|) (54 . |sample|) (58 . |zero?|) (63 . |zero?|)
              (68 . *) (|NonNegativeInteger|) (74 . *) (80 . |Zero|)
              (84 . |positive?|) (89 . |negative?|) (94 . |zero?|) (99 . =)
              (105 . +) (111 . +) (117 . +) (123 . +) (129 . |opposite?|)
              (135 . -) (140 . -) (145 . -) (151 . |width|) (156 . -) (161 . -)
              (|Integer|) (167 . *) (173 . *) (179 . |positive?|)
              (184 . |negative?|) (189 . |max|) (195 . |abs|) (200 . *)
              (206 . |interval|) (212 . *) (218 . |one?|) (223 . |one?|)
              (228 . |one?|) (|Union| % '"failed") (233 . |leftRecip|)
              (238 . |rightRecip|) (243 . |contains?|) (249 . ^) (255 . ^)
              (261 . |One|) (265 . ^) (271 . ^) (277 . |sort|) (282 . |last|)
              (287 . *) (293 . |unit?|) (298 . |inv|) (303 . |inv|)
              (308 . |inv|) (313 . *) (319 . /))
           '#(|zero?| 325 |width| 330 |unit?| 335 |sample| 340 |rightRecip| 344
              |positive?| 349 |opposite?| 354 |one?| 360 |negative?| 365
              |leftRecip| 370 |inv| 375 |interval| 380 |error?| 386 |contains?|
              391 |coerce| 403 |abs| 413 ^ 418 = 430 / 436 - 442 + 453 * 465)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|sample| (|#1|)) T)
                                   '((|zero?| ((|Boolean|) |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((|opposite?| ((|Boolean|) |#1| |#1|)) T)
                                   '((^ (|#1| |#1| (|PositiveInteger|))) T)
                                   '((* (|#1| |#1| |#1|)) T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((- (|#1| |#1| |#1|)) T)
                                   '((- (|#1| |#1|)) T)
                                   '((|rightRecip|
                                      ((|Union| |#1| #1="failed") |#1|))
                                     T)
                                   '((|leftRecip| ((|Union| |#1| #1#) |#1|)) T)
                                   '((|one?| ((|Boolean|) |#1|)) T)
                                   '((/ (|#1| |#1| |#1|)) T)
                                   '((|inv| (|#1| |#1|)) T)
                                   '((|unit?| ((|Boolean|) |#1|)) T)
                                   '((^ (|#1| |#1| (|NonNegativeInteger|))) T)
                                   '((* (|#1| |#2| |#1|)) T)
                                   '((|abs| (|#1| |#1|)) T)
                                   '((|width| (|#2| |#1|)) T)
                                   '((|negative?| ((|Boolean|) |#1|)) T)
                                   '((|positive?| ((|Boolean|) |#1|)) T)
                                   '((+ (|#1| |#1| |#2|)) T)
                                   '((|contains?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|contains?| ((|Boolean|) |#1| |#2|)) T)
                                   '((|error?| ((|Boolean|) |#1|)) T)
                                   '((|coerce| ((|List| |#2|) |#1|)) T)
                                   '((|interval| (|#1| |#2| |#2|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T)
                                   '((+ (|#1| |#1| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 82
                                            '(2 7 8 0 0 9 2 6 0 7 7 10 1 6 7 0
                                              12 2 7 0 13 0 14 1 6 7 0 15 1 6
                                              17 0 19 1 17 20 0 21 2 7 8 0 0 23
                                              2 7 8 0 0 26 0 6 0 29 0 0 0 30 1
                                              7 8 0 31 1 0 8 0 32 2 6 0 13 0 33
                                              2 0 0 34 0 35 0 7 0 36 1 0 8 0 37
                                              1 0 8 0 38 1 6 8 0 39 2 6 8 0 0
                                              40 2 7 0 0 0 41 2 0 0 0 0 42 2 0
                                              0 0 7 43 2 6 0 0 0 44 2 0 8 0 0
                                              45 1 7 0 0 46 1 0 0 0 47 2 7 0 0
                                              0 48 1 0 7 0 49 1 6 0 0 50 2 0 0
                                              0 0 51 2 7 0 52 0 53 2 0 0 52 0
                                              54 1 6 8 0 55 1 6 8 0 56 2 7 0 0
                                              0 57 1 0 0 0 58 2 7 0 0 0 59 2 6
                                              0 7 7 60 2 0 0 7 0 61 1 7 8 0 62
                                              1 0 8 0 63 1 6 8 0 64 1 0 65 0 66
                                              1 0 65 0 67 2 6 8 0 7 68 2 7 0 0
                                              13 69 2 0 0 0 13 70 0 6 0 71 2 6
                                              0 0 13 72 2 0 0 0 34 73 1 17 0 0
                                              74 1 17 7 0 75 2 0 0 0 0 76 1 0 8
                                              0 77 1 7 0 0 78 1 0 0 0 79 1 6 0
                                              0 80 2 6 0 0 0 81 2 0 0 0 0 82 1
                                              0 8 0 32 1 0 7 0 49 1 0 8 0 77 0
                                              0 0 30 1 0 65 0 67 1 0 8 0 37 2 0
                                              8 0 0 45 1 0 8 0 63 1 0 8 0 38 1
                                              0 65 0 66 1 0 0 0 79 2 0 0 7 7 11
                                              1 0 8 0 25 2 0 8 0 7 27 2 0 8 0 0
                                              28 1 0 20 0 22 1 0 17 0 18 1 0 0
                                              0 58 2 0 0 0 34 73 2 0 0 0 13 70
                                              2 0 8 0 0 24 2 0 0 0 0 82 2 0 0 0
                                              0 51 1 0 0 0 47 2 0 0 0 0 42 2 0
                                              0 0 7 43 2 0 0 13 0 16 2 0 0 7 0
                                              61 2 0 0 0 0 76 2 0 0 52 0 54 2 0
                                              0 34 0 35)))))
           '|lookupComplete|)) 
