
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

(SDEFUN |AINTCAT-;0;S;9| ((% (S)))
        (SPADCALL (|spadConstant| % 30) (|spadConstant| % 30) (QREFELT % 10))) 

(SDEFUN |AINTCAT-;sample;S;10| ((% (S))) (|spadConstant| % 29)) 

(SDEFUN |AINTCAT-;zero?;SB;11| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 33))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 33)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;positive?;SB;12| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL (|spadConstant| % 30) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 9))) 

(SDEFUN |AINTCAT-;negative?;SB;13| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (|spadConstant| % 30)
                  (QREFELT % 9))) 

(SDEFUN |AINTCAT-;1;S;14| ((% (S)))
        (SPADCALL (|spadConstant| % 37) (|spadConstant| % 37) (QREFELT % 10))) 

(SDEFUN |AINTCAT-;*;Nni2S;15| ((|z| (|NonNegativeInteger|)) (|x| (S)) (% (S)))
        (SPROG ((#1=#:G55 NIL))
               (COND ((ZEROP |z|) (|spadConstant| % 29))
                     ('T
                      (SPADCALL
                       (PROG1 (LETT #1# |z|)
                         (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                           '(|NonNegativeInteger|) #1#))
                       |x| (QREFELT % 39)))))) 

(SDEFUN |AINTCAT-;+;3S;16| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 42)) |y|)
              ((SPADCALL |y| (QREFELT % 42)) |x|)
              ((SPADCALL |x| |y| (QREFELT % 43))
               (SPADCALL
                (SPADCALL 2 (SPADCALL |x| (QREFELT % 12)) (QREFELT % 14))
                (SPADCALL 2 (SPADCALL |x| (QREFELT % 15)) (QREFELT % 14))
                (QREFELT % 10)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12))
                          (SPADCALL |y| (QREFELT % 12)) (QREFELT % 44))
                (SPADCALL (SPADCALL |x| (QREFELT % 15))
                          (SPADCALL |y| (QREFELT % 15)) (QREFELT % 44))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;+;SRS;17| ((|x| (S)) (|r| (R)) (% (S)))
        (COND ((SPADCALL |r| (QREFELT % 33)) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12)) |r| (QREFELT % 44))
                (SPADCALL (SPADCALL |x| (QREFELT % 15)) |r| (QREFELT % 44))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;opposite?;2SB;18| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 47)) (QREFELT % 42))) 

(SDEFUN |AINTCAT-;-;2S;19| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 49))
                  (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 49))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;width;SR;20| ((|x| (S)) (% (R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |x| (QREFELT % 12))
                  (QREFELT % 51))) 

(SDEFUN |AINTCAT-;-;3S;21| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 42)) (SPADCALL |y| (QREFELT % 53)))
              ((SPADCALL |y| (QREFELT % 42)) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 12))
                          (SPADCALL |y| (QREFELT % 15)) (QREFELT % 51))
                (SPADCALL (SPADCALL |x| (QREFELT % 15))
                          (SPADCALL |y| (QREFELT % 12)) (QREFELT % 51))
                (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;*;I2S;22| ((|z| (|Integer|)) (|x| (S)) (% (S)))
        (COND ((ZEROP |z|) (|spadConstant| % 29))
              ((OR (EQL |z| 1) (SPADCALL |x| (QREFELT % 42))) |x|)
              ('T
               (COND
                ((> |z| 0)
                 (SPADCALL
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 56))
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 56))
                  (QREFELT % 10)))
                ('T
                 (SPADCALL
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 56))
                  (SPADCALL |z| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 56))
                  (QREFELT % 10))))))) 

(SDEFUN |AINTCAT-;abs;2S;23| ((|x| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 58)) |x|)
              ((SPADCALL |x| (QREFELT % 59)) (SPADCALL |x| (QREFELT % 53)))
              ('T
               (SPADCALL (|spadConstant| % 30)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 49))
                          (SPADCALL |x| (QREFELT % 15)) (QREFELT % 60))
                         (QREFELT % 10))))) 

(SDEFUN |AINTCAT-;*;R2S;24| ((|r| (R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 62))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 62))
                  (QREFELT % 63))) 

(SDEFUN |AINTCAT-;one?;SB;25| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 65))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 65)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;leftRecip;SU;26| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 67)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;rightRecip;SU;27| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 67)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;^;SNniS;28| ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((#1=#:G94 NIL))
               (COND ((ZEROP |n|) (|spadConstant| % 71))
                     ('T
                      (SPADCALL |x|
                                (PROG1 (LETT #1# |n|)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT % 72)))))) 

(SDEFUN |AINTCAT-;*;R2S;29| ((|r| (R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT % 12)) (QREFELT % 62))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 62))
                  (QREFELT % 63))) 

(SDEFUN |AINTCAT-;one?;SB;30| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 65))
          (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 65)))
         ('T NIL))) 

(SDEFUN |AINTCAT-;leftRecip;SU;31| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 67)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;rightRecip;SU;32| ((|x| (S)) (% (|Union| S "failed")))
        (COND ((SPADCALL |x| (QREFELT % 67)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |AINTCAT-;^;SNniS;33| ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((#1=#:G111 NIL))
               (COND ((ZEROP |n|) (|spadConstant| % 71))
                     ('T
                      (SPADCALL |x|
                                (PROG1 (LETT #1# |n|)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT % 72)))))) 

(SDEFUN |AINTCAT-;^;SPiS;34| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL |x| (|spadConstant| % 30) (QREFELT % 74))
           (COND
            ((EVENP |n|)
             (EXIT
              (SPADCALL (|spadConstant| % 30)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                    (QREFELT % 49))
                          (SPADCALL |x| (QREFELT % 15)) (QREFELT % 60))
                         |n| (QREFELT % 75))
                        (QREFELT % 10)))))))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                    (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                    (QREFELT % 63))))) 

(SDEFUN |AINTCAT-;^;SPiS;35| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL |x| (|spadConstant| % 30) (QREFELT % 74))
           (COND
            ((EVENP |n|)
             (EXIT
              (SPADCALL (|spadConstant| % 30)
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n|
                                   (QREFELT % 75))
                         (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n|
                                   (QREFELT % 75))
                         (QREFELT % 60))
                        (QREFELT % 10)))))))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                    (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                    (QREFELT % 63))))) 

(SDEFUN |AINTCAT-;^;SPiS;36| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;^;SPiS;37| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL |x| (|spadConstant| % 30) (QREFELT % 74))
           (COND
            ((EVENP |n|)
             (EXIT
              (SPADCALL (|spadConstant| % 30)
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n|
                                   (QREFELT % 75))
                         (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n|
                                   (QREFELT % 75))
                         (QREFELT % 60))
                        (QREFELT % 10)))))))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                    (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                    (QREFELT % 63))))) 

(SDEFUN |AINTCAT-;^;SPiS;38| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;^;SPiS;39| ((|x| (S)) (|n| (|PositiveInteger|)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) |n| (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n| (QREFELT % 75))
                  (QREFELT % 10))) 

(SDEFUN |AINTCAT-;*;3S;40| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ix| (R)) (|sx| (R)) (|iy| (R)) (|sy| (R)) (|products| (|List| R)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 67)) |y|)
                ((SPADCALL |y| (QREFELT % 67)) |x|)
                ((OR (SPADCALL |x| (QREFELT % 42))
                     (SPADCALL |y| (QREFELT % 42)))
                 (|spadConstant| % 29))
                ('T
                 (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
                      (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
                      (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
                      (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
                      (LETT |products|
                            (SPADCALL
                             (LIST (SPADCALL |ix| |iy| (QREFELT % 62))
                                   (SPADCALL |ix| |sy| (QREFELT % 62))
                                   (SPADCALL |sx| |iy| (QREFELT % 62))
                                   (SPADCALL |sx| |sy| (QREFELT % 62)))
                             (QREFELT % 77)))
                      (EXIT
                       (SPADCALL (|SPADfirst| |products|)
                                 (SPADCALL |products| (QREFELT % 78))
                                 (QREFELT % 10))))))))) 

(SDEFUN |AINTCAT-;*;3S;41| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ix| (R)) (|sx| (R)) (|iy| (R)) (|sy| (R)) (|products| (|List| R)))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
              (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
              (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
              (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
              (LETT |products|
                    (SPADCALL
                     (LIST (SPADCALL |ix| |iy| (QREFELT % 62))
                           (SPADCALL |ix| |sy| (QREFELT % 62))
                           (SPADCALL |sx| |iy| (QREFELT % 62))
                           (SPADCALL |sx| |sy| (QREFELT % 62)))
                     (QREFELT % 77)))
              (EXIT
               (SPADCALL (|SPADfirst| |products|)
                         (SPADCALL |products| (QREFELT % 78))
                         (QREFELT % 10)))))) 

(SDEFUN |AINTCAT-;*;3S;42| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ix| (R)) (|sx| (R)) (|iy| (R)) (|sy| (R)) (|products| (|List| R)))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
              (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
              (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
              (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
              (LETT |products|
                    (SPADCALL
                     (LIST (SPADCALL |ix| |iy| (QREFELT % 62))
                           (SPADCALL |ix| |sy| (QREFELT % 62))
                           (SPADCALL |sx| |iy| (QREFELT % 62))
                           (SPADCALL |sx| |sy| (QREFELT % 62)))
                     (QREFELT % 77)))
              (EXIT
               (SPADCALL (|SPADfirst| |products|)
                         (SPADCALL |products| (QREFELT % 78))
                         (QREFELT % 10)))))) 

(SDEFUN |AINTCAT-;*;3S;43| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ix| (R)) (|sx| (R)) (|iy| (R)) (|sy| (R)) (|products| (|List| R)))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
              (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
              (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
              (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
              (LETT |products|
                    (SPADCALL
                     (LIST (SPADCALL |ix| |iy| (QREFELT % 62))
                           (SPADCALL |ix| |sy| (QREFELT % 62))
                           (SPADCALL |sx| |iy| (QREFELT % 62))
                           (SPADCALL |sx| |sy| (QREFELT % 62)))
                     (QREFELT % 77)))
              (EXIT
               (SPADCALL (|SPADfirst| |products|)
                         (SPADCALL |products| (QREFELT % 78))
                         (QREFELT % 10)))))) 

(SDEFUN |AINTCAT-;*;3S;44| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ix| (R)) (|sx| (R)) (|iy| (R)) (|sy| (R)) (|products| (|List| R)))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 12)))
              (LETT |sx| (SPADCALL |x| (QREFELT % 15)))
              (LETT |iy| (SPADCALL |y| (QREFELT % 12)))
              (LETT |sy| (SPADCALL |y| (QREFELT % 15)))
              (LETT |products|
                    (SPADCALL
                     (LIST (SPADCALL |ix| |iy| (QREFELT % 62))
                           (SPADCALL |ix| |sy| (QREFELT % 62))
                           (SPADCALL |sx| |iy| (QREFELT % 62))
                           (SPADCALL |sx| |sy| (QREFELT % 62)))
                     (QREFELT % 77)))
              (EXIT
               (SPADCALL (|SPADfirst| |products|)
                         (SPADCALL |products| (QREFELT % 78))
                         (QREFELT % 10)))))) 

(SDEFUN |AINTCAT-;unit?;SB;45| ((|x| (S)) (% (|Boolean|)))
        (NULL (SPADCALL |x| (|spadConstant| % 30) (QREFELT % 74)))) 

(SDEFUN |AINTCAT-;inv;2S;46| ((|x| (S)) (% (S)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 30) (QREFELT % 74))
          (|error| "inv: interval contains 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 81))
                    (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 81))
                    (QREFELT % 63))))) 

(SDEFUN |AINTCAT-;/;3S;47| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL |x| (SPADCALL |y| (QREFELT % 83)) (QREFELT % 84))) 

(DECLAIM (NOTINLINE |AIntervalCategory&;|)) 

(DEFUN |AIntervalCategory&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AIntervalCategory&| DV$1 DV$2))
          (LETT % (GETREFV 86))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedRing|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedMagmaWithZero|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRing|))
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|MagmaWithUnit|))
                                              (|HasCategory| |#2|
                                                             '(|MagmaWithZero|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedMagma|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|SetWithZero|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV % 31 (CONS (|dispatchFunction| |AINTCAT-;0;S;9|) %))
             (QSETREFV % 32
                       (CONS (|dispatchFunction| |AINTCAT-;sample;S;10|) %))
             (QSETREFV % 34
                       (CONS (|dispatchFunction| |AINTCAT-;zero?;SB;11|) %))
             (QSETREFV % 35
                       (CONS (|dispatchFunction| |AINTCAT-;positive?;SB;12|)
                             %))
             (QSETREFV % 36
                       (CONS (|dispatchFunction| |AINTCAT-;negative?;SB;13|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 8)
            (QSETREFV % 38 (CONS (|dispatchFunction| |AINTCAT-;1;S;14|) %))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV % 41
                       (CONS (|dispatchFunction| |AINTCAT-;*;Nni2S;15|) %))
             (QSETREFV % 45 (CONS (|dispatchFunction| |AINTCAT-;+;3S;16|) %))
             (QSETREFV % 46 (CONS (|dispatchFunction| |AINTCAT-;+;SRS;17|) %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |AINTCAT-;opposite?;2SB;18|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 11)
            (PROGN
             (QSETREFV % 50 (CONS (|dispatchFunction| |AINTCAT-;-;2S;19|) %))
             (QSETREFV % 52
                       (CONS (|dispatchFunction| |AINTCAT-;width;SR;20|) %))
             (QSETREFV % 54 (CONS (|dispatchFunction| |AINTCAT-;-;3S;21|) %))
             (QSETREFV % 57 (CONS (|dispatchFunction| |AINTCAT-;*;I2S;22|) %))
             (QSETREFV % 61
                       (CONS (|dispatchFunction| |AINTCAT-;abs;2S;23|) %)))))
          (COND
           ((|testBitVector| |pv$| 10)
            (PROGN
             (QSETREFV % 64 (CONS (|dispatchFunction| |AINTCAT-;*;R2S;24|) %))
             (COND
              ((|testBitVector| |pv$| 4)
               (PROGN
                (QSETREFV % 66
                          (CONS (|dispatchFunction| |AINTCAT-;one?;SB;25|) %))
                (QSETREFV % 69
                          (CONS (|dispatchFunction| |AINTCAT-;leftRecip;SU;26|)
                                %))
                (QSETREFV % 70
                          (CONS
                           (|dispatchFunction| |AINTCAT-;rightRecip;SU;27|)
                           %)))))
             (COND
              ((|testBitVector| |pv$| 8)
               (QSETREFV % 73
                         (CONS (|dispatchFunction| |AINTCAT-;^;SNniS;28|)
                               %))))))
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV % 64 (CONS (|dispatchFunction| |AINTCAT-;*;R2S;29|) %))
             (COND
              ((|testBitVector| |pv$| 4)
               (PROGN
                (QSETREFV % 66
                          (CONS (|dispatchFunction| |AINTCAT-;one?;SB;30|) %))
                (QSETREFV % 69
                          (CONS (|dispatchFunction| |AINTCAT-;leftRecip;SU;31|)
                                %))
                (QSETREFV % 70
                          (CONS
                           (|dispatchFunction| |AINTCAT-;rightRecip;SU;32|)
                           %)))))
             (COND
              ((|testBitVector| |pv$| 8)
               (QSETREFV % 73
                         (CONS (|dispatchFunction| |AINTCAT-;^;SNniS;33|)
                               %)))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (COND
             ((|testBitVector| |pv$| 11)
              (COND
               ((|HasCategory| |#2| '(|NonAssociativeSemiRng|))
                (QSETREFV % 76
                          (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;34|) %)))
               ((|testBitVector| |pv$| 3)
                (QSETREFV % 76
                          (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;35|) %)))
               ((|testBitVector| |pv$| 10)
                (QSETREFV % 76
                          (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;36|)
                                %)))))
             ((|testBitVector| |pv$| 3)
              (QSETREFV % 76
                        (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;37|) %)))
             ((|testBitVector| |pv$| 10)
              (QSETREFV % 76
                        (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;38|) %)))))
           ((|testBitVector| |pv$| 10)
            (QSETREFV % 76
                      (CONS (|dispatchFunction| |AINTCAT-;^;SPiS;39|) %))))
          (COND
           ((|testBitVector| |pv$| 8)
            (COND
             ((|testBitVector| |pv$| 3)
              (QSETREFV % 79 (CONS (|dispatchFunction| |AINTCAT-;*;3S;40|) %)))
             ((|testBitVector| |pv$| 10)
              (QSETREFV % 79 (CONS (|dispatchFunction| |AINTCAT-;*;3S;41|) %)))
             ((|testBitVector| |pv$| 3)
              (QSETREFV % 79
                        (CONS (|dispatchFunction| |AINTCAT-;*;3S;42|) %)))))
           ((|testBitVector| |pv$| 10)
            (QSETREFV % 79 (CONS (|dispatchFunction| |AINTCAT-;*;3S;43|) %)))
           ((|testBitVector| |pv$| 3)
            (QSETREFV % 79 (CONS (|dispatchFunction| |AINTCAT-;*;3S;44|) %))))
          (COND
           ((|testBitVector| |pv$| 2)
            (COND
             ((|testBitVector| |pv$| 1)
              (PROGN
               (QSETREFV % 80
                         (CONS (|dispatchFunction| |AINTCAT-;unit?;SB;45|) %))
               (QSETREFV % 82
                         (CONS (|dispatchFunction| |AINTCAT-;inv;2S;46|) %))
               (QSETREFV % 85
                         (CONS (|dispatchFunction| |AINTCAT-;/;3S;47|) %)))))))
          %))) 

(MAKEPROP '|AIntervalCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . <) (6 . |qinterval|) |AINTCAT-;interval;2RS;1| (12 . |inf|)
              (|PositiveInteger|) (17 . *) (23 . |sup|) |AINTCAT-;*;Pi2S;2|
              (|List| 7) |AINTCAT-;coerce;SL;3| (28 . |coerce|) (|OutputForm|)
              (33 . |coerce|) |AINTCAT-;coerce;SOf;4| (38 . =)
              |AINTCAT-;=;2SB;5| |AINTCAT-;error?;SB;6| (44 . <=)
              |AINTCAT-;contains?;SRB;7| |AINTCAT-;contains?;2SB;8| (50 . |0|)
              (54 . |0|) (58 . |0|) (62 . |sample|) (66 . |zero?|)
              (71 . |zero?|) (76 . |positive?|) (81 . |negative?|) (86 . |1|)
              (90 . |1|) (94 . *) (|NonNegativeInteger|) (100 . *)
              (106 . |zero?|) (111 . =) (117 . +) (123 . +) (129 . +) (135 . +)
              (141 . |opposite?|) (147 . -) (152 . -) (157 . -) (163 . |width|)
              (168 . -) (173 . -) (|Integer|) (179 . *) (185 . *)
              (191 . |positive?|) (196 . |negative?|) (201 . |max|)
              (207 . |abs|) (212 . *) (218 . |interval|) (224 . *)
              (230 . |one?|) (235 . |one?|) (240 . |one?|)
              (|Union| % '"failed") (245 . |leftRecip|) (250 . |rightRecip|)
              (255 . |1|) (259 . ^) (265 . ^) (271 . |contains?|) (277 . ^)
              (283 . ^) (289 . |sort|) (294 . |last|) (299 . *) (305 . |unit?|)
              (310 . |inv|) (315 . |inv|) (320 . |inv|) (325 . *) (331 . /))
           '#(|zero?| 337 |width| 342 |unit?| 347 |sample| 352 |rightRecip| 356
              |positive?| 361 |opposite?| 366 |one?| 372 |negative?| 377
              |leftRecip| 382 |inv| 387 |interval| 392 |error?| 398 |contains?|
              403 |coerce| 415 |abs| 425 ^ 430 = 442 |1| 448 |0| 452 / 456 -
              462 + 473 * 485)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|zero?| ((|Boolean|) |#1|)) T)
                                   '((|sample| (|#1|)) T) '((|0| (|#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((|opposite?| ((|Boolean|) |#1| |#1|)) T)
                                   '((* (|#1| |#1| |#1|)) T)
                                   '((^ (|#1| |#1| (|PositiveInteger|))) T)
                                   '((|1| (|#1|)) T)
                                   '((|one?| ((|Boolean|) |#1|)) T)
                                   '((^ (|#1| |#1| (|NonNegativeInteger|))) T)
                                   '((|leftRecip|
                                      ((|Union| |#1| #1="failed") |#1|))
                                     T)
                                   '((|rightRecip| ((|Union| |#1| #1#) |#1|))
                                     T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((- (|#1| |#1| |#1|)) T)
                                   '((- (|#1| |#1|)) T)
                                   '((/ (|#1| |#1| |#1|)) T)
                                   '((|inv| (|#1| |#1|)) T)
                                   '((|unit?| ((|Boolean|) |#1|)) T)
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
                        (|makeByteWordVec2| 85
                                            '(2 7 8 0 0 9 2 6 0 7 7 10 1 6 7 0
                                              12 2 7 0 13 0 14 1 6 7 0 15 1 6
                                              17 0 19 1 17 20 0 21 2 7 8 0 0 23
                                              2 7 8 0 0 26 0 6 0 29 0 7 0 30 0
                                              0 0 31 0 0 0 32 1 7 8 0 33 1 0 8
                                              0 34 1 0 8 0 35 1 0 8 0 36 0 7 0
                                              37 0 0 0 38 2 6 0 13 0 39 2 0 0
                                              40 0 41 1 6 8 0 42 2 6 8 0 0 43 2
                                              7 0 0 0 44 2 0 0 0 0 45 2 0 0 0 7
                                              46 2 6 0 0 0 47 2 0 8 0 0 48 1 7
                                              0 0 49 1 0 0 0 50 2 7 0 0 0 51 1
                                              0 7 0 52 1 6 0 0 53 2 0 0 0 0 54
                                              2 7 0 55 0 56 2 0 0 55 0 57 1 6 8
                                              0 58 1 6 8 0 59 2 7 0 0 0 60 1 0
                                              0 0 61 2 7 0 0 0 62 2 6 0 7 7 63
                                              2 0 0 7 0 64 1 7 8 0 65 1 0 8 0
                                              66 1 6 8 0 67 1 0 68 0 69 1 0 68
                                              0 70 0 6 0 71 2 6 0 0 13 72 2 0 0
                                              0 40 73 2 6 8 0 7 74 2 7 0 0 13
                                              75 2 0 0 0 13 76 1 17 0 0 77 1 17
                                              7 0 78 2 0 0 0 0 79 1 0 8 0 80 1
                                              7 0 0 81 1 0 0 0 82 1 6 0 0 83 2
                                              6 0 0 0 84 2 0 0 0 0 85 1 0 8 0
                                              34 1 0 7 0 52 1 0 8 0 80 0 0 0 32
                                              1 0 68 0 70 1 0 8 0 35 2 0 8 0 0
                                              48 1 0 8 0 66 1 0 8 0 36 1 0 68 0
                                              69 1 0 0 0 82 2 0 0 7 7 11 1 0 8
                                              0 25 2 0 8 0 0 28 2 0 8 0 7 27 1
                                              0 20 0 22 1 0 17 0 18 1 0 0 0 61
                                              2 0 0 0 40 73 2 0 0 0 13 76 2 0 8
                                              0 0 24 0 0 0 38 0 0 0 31 2 0 0 0
                                              0 85 1 0 0 0 50 2 0 0 0 0 54 2 0
                                              0 0 0 45 2 0 0 0 7 46 2 0 0 13 0
                                              16 2 0 0 7 0 64 2 0 0 55 0 57 2 0
                                              0 0 0 79 2 0 0 40 0 41)))))
           '|lookupComplete|)) 
