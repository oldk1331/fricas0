
(SDEFUN |PRS;*| ((|r| (R)) (|v| (|Vector| |polR|)) (% (|Vector| |polR|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 12)) |v| (QREFELT % 14))) 

(SDEFUN |PRS;exquo| ((|v| (|Vector| |polR|)) (|r| (R)) (% (|Vector| |polR|)))
        (SPROG NIL
               (SPADCALL (CONS #'|PRS;exquo!0| (VECTOR (QREFELT % 7) % |r|))
                         |v| (QREFELT % 18)))) 

(SDEFUN |PRS;exquo!0| ((|p1| NIL) ($$ NIL))
        (PROG (|r| % |polR|)
          (LETT |r| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |polR| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G173 NIL))
                   (PROG2 (LETT #1# (SPADCALL |p1| |r| (QREFELT % 16)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) |polR|
                                     (|Union| |polR| "failed") #1#))))))) 

(SDEFUN |PRS;divide;2polRR;3|
        ((F (|polR|)) (G (|polR|))
         (% (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|))))
        (SPROG
         ((|lcG| (R)) (|degG| (|NonNegativeInteger|)) (#1=#:G180 NIL)
          (|delta| (|Integer|)) (#2=#:G185 NIL) (#3=#:G187 NIL)
          (|mon| (|polR|)) (|quot| (|polR|)) (#4=#:G194 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lcG| (SPADCALL G (QREFELT % 19)))
                (LETT |degG| (SPADCALL G (QREFELT % 20)))
                (EXIT
                 (COND
                  ((ZEROP |degG|)
                   (SEQ
                    (LETT F
                          (PROG2 (LETT #1# (SPADCALL F |lcG| (QREFELT % 16)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                            (|Union| (QREFELT % 7) "failed")
                                            #1#)))
                    (EXIT
                     (PROGN
                      (LETT #4# (CONS F (|spadConstant| % 22)))
                      (GO #5=#:G193)))))
                  ('T
                   (SEQ (LETT G (SPADCALL G (QREFELT % 23)))
                        (LETT |quot| (|spadConstant| % 22))
                        (SEQ G190
                             (COND
                              ((NULL
                                (>=
                                 (LETT |delta|
                                       (- (SPADCALL F (QREFELT % 20)) |degG|))
                                 0))
                               (GO G191)))
                             (SEQ
                              (LETT |mon|
                                    (SPADCALL
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL
                                                (SPADCALL F (QREFELT % 19))
                                                |lcG| (QREFELT % 24)))
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0)
                                                       (QREFELT % 6)
                                                       (|Union| (QREFELT % 6)
                                                                "failed")
                                                       #2#))
                                     (PROG1 (LETT #3# |delta|)
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (QREFELT % 10)))
                              (LETT |quot|
                                    (SPADCALL |quot| |mon| (QREFELT % 25)))
                              (EXIT
                               (LETT F
                                     (SPADCALL (SPADCALL F (QREFELT % 23))
                                               (SPADCALL |mon| G
                                                         (QREFELT % 26))
                                               (QREFELT % 27)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (PROGN (LETT #4# (CONS |quot| F)) (GO #5#)))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |PRS;resultant_naif| ((P (|polR|)) (Q (|polR|)) (% (R)))
        (SPROG
         ((|#G16| #1=(|NonNegativeInteger|)) (|#G17| #1#) (|degP| #1#)
          (|degQ| #1#) (#2=#:G208 NIL) (U (|polR|)) (#3=#:G201 NIL) (|a| (R))
          (|#G18| (|polR|)) (|#G19| (|polR|)))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (|spadConstant| % 8))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT % 31))
                          (PROGN
                           (LETT #2# (|spadConstant| % 21))
                           (GO #4=#:G207)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G16| (SPADCALL P (QREFELT % 20)))
                            (LETT |#G17| (SPADCALL Q (QREFELT % 20)))
                            (LETT |degP| |#G16|)
                            (LETT |degQ| |#G17|))
                           (COND
                            ((ODDP |degP|)
                             (COND
                              ((ODDP |degQ|)
                               (LETT |a| (SPADCALL |a| (QREFELT % 32)))))))
                           (EXIT
                            (COND
                             ((ZEROP |degQ|)
                              (PROGN
                               (LETT #2#
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (SPADCALL Q (QREFELT % 19))
                                                |degP| (QREFELT % 33))
                                               (QREFELT % 34)))
                               (GO #4#)))
                             ('T
                              (SEQ
                               (LETT U (QCDR (SPADCALL P Q (QREFELT % 29))))
                               (LETT |a|
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (SPADCALL Q (QREFELT % 19))
                                                (PROG1
                                                    (LETT #3#
                                                          (- |degP|
                                                             (SPADCALL U
                                                                       (QREFELT
                                                                        %
                                                                        20))))
                                                  (|check_subtype2| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                (QREFELT % 33))
                                               (QREFELT % 34)))
                               (EXIT
                                (PROGN
                                 (LETT |#G18| Q)
                                 (LETT |#G19| U)
                                 (LETT P |#G18|)
                                 (LETT Q |#G19|))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean_naif|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |resultant| R))))
        (SPROG
         ((|#G22| #1=(|NonNegativeInteger|)) (|#G23| #1#) (|degP| #1#)
          (|degQ| #1#) (#2=#:G215 NIL) (#3=#:G227 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#4=#:G221 NIL) (|a| (R)) (|#G24| (|polR|)) (|#G25| (|polR|))
          (|#G26| (|polR|)) (|#G27| (|polR|)) (|#G28| (|polR|))
          (|#G29| (|polR|)) (|old_cf1| (|polR|)) (|old_cf2| (|polR|))
          (|cf1| (|polR|)) (|cf2| (|polR|)))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (|spadConstant| % 8))
                (LETT |old_cf1| (|spadConstant| % 35))
                (LETT |cf1| (|spadConstant| % 22))
                (LETT |old_cf2| (|spadConstant| % 22))
                (LETT |cf2| (|spadConstant| % 35))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT % 31))
                          (PROGN
                           (LETT #3#
                                 (VECTOR (|spadConstant| % 22)
                                         (|spadConstant| % 22)
                                         (|spadConstant| % 21)))
                           (GO #5=#:G226)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G22| (SPADCALL P (QREFELT % 20)))
                            (LETT |#G23| (SPADCALL Q (QREFELT % 20)))
                            (LETT |degP| |#G22|)
                            (LETT |degQ| |#G23|))
                           (COND
                            ((ODDP |degP|)
                             (COND
                              ((ODDP |degQ|)
                               (LETT |a| (SPADCALL |a| (QREFELT % 32)))))))
                           (COND
                            ((ZEROP |degQ|)
                             (SEQ
                              (LETT |a|
                                    (SPADCALL |a|
                                              (SPADCALL
                                               (SPADCALL Q (QREFELT % 19))
                                               (PROG1 (LETT #2# (- |degP| 1))
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QREFELT % 33))
                                              (QREFELT % 34)))
                              (EXIT
                               (PROGN
                                (LETT #3#
                                      (VECTOR
                                       (SPADCALL |a| |cf1| (QREFELT % 36))
                                       (SPADCALL |a| |cf2| (QREFELT % 36))
                                       (SPADCALL |a|
                                                 (SPADCALL Q (QREFELT % 19))
                                                 (QREFELT % 34))))
                                (GO #5#))))))
                           (LETT |divid| (SPADCALL P Q (QREFELT % 29)))
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT % 19))
                                            (PROG1
                                                (LETT #4#
                                                      (- |degP|
                                                         (SPADCALL
                                                          (QCDR |divid|)
                                                          (QREFELT % 20))))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 33))
                                           (QREFELT % 34)))
                           (PROGN
                            (LETT |#G24| Q)
                            (LETT |#G25| (QCDR |divid|))
                            (LETT P |#G24|)
                            (LETT Q |#G25|))
                           (EXIT
                            (PROGN
                             (LETT |#G26| |cf1|)
                             (LETT |#G27| |cf2|)
                             (LETT |#G28|
                                   (SPADCALL |old_cf1|
                                             (SPADCALL (QCAR |divid|) |cf1|
                                                       (QREFELT % 26))
                                             (QREFELT % 27)))
                             (LETT |#G29|
                                   (SPADCALL |old_cf2|
                                             (SPADCALL (QCAR |divid|) |cf2|
                                                       (QREFELT % 26))
                                             (QREFELT % 27)))
                             (LETT |old_cf1| |#G26|)
                             (LETT |old_cf2| |#G27|)
                             (LETT |cf1| |#G28|)
                             (LETT |cf2| |#G29|))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #3#)))) 

(SDEFUN |PRS;semiResultantEuclidean_naif|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |resultant| R))))
        (SPROG
         ((|#G32| #1=(|NonNegativeInteger|)) (|#G33| #1#) (|degP| #1#)
          (|degQ| #1#) (#2=#:G234 NIL) (#3=#:G246 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#4=#:G240 NIL) (|a| (R)) (|#G34| (|polR|)) (|#G35| (|polR|))
          (|#G36| (|polR|)) (|#G37| (|polR|)) (|old_cf2| (|polR|))
          (|cf2| (|polR|)))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (|spadConstant| % 8))
                (LETT |old_cf2| (|spadConstant| % 22))
                (LETT |cf2| (|spadConstant| % 35))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT % 31))
                          (PROGN
                           (LETT #3#
                                 (CONS (|spadConstant| % 22)
                                       (|spadConstant| % 21)))
                           (GO #5=#:G245)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G32| (SPADCALL P (QREFELT % 20)))
                            (LETT |#G33| (SPADCALL Q (QREFELT % 20)))
                            (LETT |degP| |#G32|)
                            (LETT |degQ| |#G33|))
                           (COND
                            ((ODDP |degP|)
                             (COND
                              ((ODDP |degQ|)
                               (LETT |a| (SPADCALL |a| (QREFELT % 32)))))))
                           (COND
                            ((ZEROP |degQ|)
                             (SEQ
                              (LETT |a|
                                    (SPADCALL |a|
                                              (SPADCALL
                                               (SPADCALL Q (QREFELT % 19))
                                               (PROG1 (LETT #2# (- |degP| 1))
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QREFELT % 33))
                                              (QREFELT % 34)))
                              (EXIT
                               (PROGN
                                (LETT #3#
                                      (CONS (SPADCALL |a| |cf2| (QREFELT % 36))
                                            (SPADCALL |a|
                                                      (SPADCALL Q
                                                                (QREFELT % 19))
                                                      (QREFELT % 34))))
                                (GO #5#))))))
                           (LETT |divid| (SPADCALL P Q (QREFELT % 29)))
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT % 19))
                                            (PROG1
                                                (LETT #4#
                                                      (- |degP|
                                                         (SPADCALL
                                                          (QCDR |divid|)
                                                          (QREFELT % 20))))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 33))
                                           (QREFELT % 34)))
                           (PROGN
                            (LETT |#G34| Q)
                            (LETT |#G35| (QCDR |divid|))
                            (LETT P |#G34|)
                            (LETT Q |#G35|))
                           (EXIT
                            (PROGN
                             (LETT |#G36| |cf2|)
                             (LETT |#G37|
                                   (SPADCALL |old_cf2|
                                             (SPADCALL (QCAR |divid|) |cf2|
                                                       (QREFELT % 26))
                                             (QREFELT % 27)))
                             (LETT |old_cf2| |#G36|)
                             (LETT |cf2| |#G37|))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #3#)))) 

(SDEFUN |PRS;exactQuo| ((|x| (R)) (|y| (R)) (% (R)))
        (SPROG ((|ex| (|Union| R "failed")))
               (SEQ (LETT |ex| (SPADCALL |x| |y| (QREFELT % 24)))
                    (EXIT
                     (COND ((QEQCAR |ex| 0) (QCDR |ex|))
                           ('T (|error| "exactQuo$PRS: bad args"))))))) 

(SDEFUN |PRS;LazardQuotient;2RNniR;8|
        ((|x| (R)) (|y| (R)) (|n| (|NonNegativeInteger|)) (% (R)))
        (SPROG
         ((|b| (|NonNegativeInteger|)) (#1=#:G254 NIL) (#2=#:G263 NIL)
          (|a| (|NonNegativeInteger|)) (|c| (R)) (#3=#:G256 NIL))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|error| "Lazard$PRS : n = 0")) ((EQL |n| 1) |x|)
                 ('T
                  (SEQ (LETT |a| 1)
                       (SEQ G190
                            (COND
                             ((NULL (>= |n| (LETT |b| (* 2 |a|)))) (GO G191)))
                            (SEQ (EXIT (LETT |a| |b|))) NIL (GO G190) G191
                            (EXIT NIL))
                       (LETT |c| |x|)
                       (LETT |n|
                             (PROG1 (LETT #1# (- |n| |a|))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#)))
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL |a| 1)
                                 (PROGN (LETT #2# |c|) (GO #4=#:G262)))
                                ('T
                                 (SEQ (LETT |a| (|quotient_INT| |a| 2))
                                      (LETT |c|
                                            (|PRS;exactQuo|
                                             (SPADCALL |c| |c| (QREFELT % 34))
                                             |y| %))
                                      (EXIT
                                       (COND
                                        ((>= |n| |a|)
                                         (SEQ
                                          (LETT |c|
                                                (|PRS;exactQuo|
                                                 (SPADCALL |c| |x|
                                                           (QREFELT % 34))
                                                 |y| %))
                                          (EXIT
                                           (LETT |n|
                                                 (PROG1 (LETT #3# (- |n| |a|))
                                                   (|check_subtype2| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #3#)))))))))))))
                             NIL (GO G190) G191 (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |PRS;LazardQuotient2;polR2RNnipolR;9|
        ((F (|polR|)) (|x| (R)) (|y| (R)) (|n| (|NonNegativeInteger|))
         (% (|polR|)))
        (SPROG ((#1=#:G264 NIL) (#2=#:G266 NIL) (#3=#:G271 NIL))
               (SEQ
                (EXIT
                 (COND ((ZEROP |n|) (|error| "LazardQuotient2$PRS : n = 0"))
                       ((EQL |n| 1) F)
                       ('T
                        (SEQ
                         (LETT |x|
                               (SPADCALL |x| |y|
                                         (PROG1 (LETT #1# (- |n| 1))
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT % 37)))
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL
                                            (SPADCALL |x| F (QREFELT % 36)) |y|
                                            (QREFELT % 16)))
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0) (QREFELT % 7)
                                                   (|Union| (QREFELT % 7)
                                                            "failed")
                                                   #2#)))
                           (GO #4=#:G270)))))))
                #4# (EXIT #3#)))) 

(SDEFUN |PRS;Lazard3|
        ((V (|Vector| |polR|)) (|x| (R)) (|y| (R)) (|n| (|NonNegativeInteger|))
         (% (|Vector| |polR|)))
        (SPROG ((#1=#:G272 NIL))
               (SEQ
                (COND ((ZEROP |n|) (|error| "Lazard3$prs : n = 0"))
                      ((EQL |n| 1) V)
                      ('T
                       (SEQ
                        (LETT |x|
                              (SPADCALL |x| |y|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT % 37)))
                        (EXIT (|PRS;exquo| (|PRS;*| |x| V %) |y| %)))))))) 

(SDEFUN |PRS;next_sousResultant2;3polRRpolR;11|
        ((P (|polR|)) (Q (|polR|)) (Z (|polR|)) (|s| (R)) (% (|polR|)))
        (SPROG
         ((|#G57| (R)) (|#G58| (R)) (|#G59| (R)) (|lcP| (R)) (|c| (R))
          (|se| (R)) (|#G60| #1=(|NonNegativeInteger|)) (|#G61| #1#) (|d| #1#)
          (|e| #1#) (|#G62| (|polR|)) (|#G63| (|polR|)) (|#G64| (|polR|))
          (|i| NIL) (#2=#:G290 NIL) (H (|polR|)) (#3=#:G278 NIL) (A (|polR|))
          (#4=#:G289 NIL))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G57| (SPADCALL P (QREFELT % 19)))
             (LETT |#G58| (SPADCALL Q (QREFELT % 19)))
             (LETT |#G59| (SPADCALL Z (QREFELT % 19)))
             (LETT |lcP| |#G57|)
             (LETT |c| |#G58|)
             (LETT |se| |#G59|))
            (PROGN
             (LETT |#G60| (SPADCALL P (QREFELT % 20)))
             (LETT |#G61| (SPADCALL Q (QREFELT % 20)))
             (LETT |d| |#G60|)
             (LETT |e| |#G61|))
            (PROGN
             (LETT |#G62| (SPADCALL P (QREFELT % 23)))
             (LETT |#G63| (SPADCALL Q (QREFELT % 23)))
             (LETT |#G64|
                   (SPADCALL (SPADCALL Z (QREFELT % 23)) (QREFELT % 39)))
             (LETT P |#G62|)
             (LETT Q |#G63|)
             (LETT H |#G64|))
            (LETT A
                  (SPADCALL (SPADCALL P |e| (QREFELT % 40)) H (QREFELT % 36)))
            (SEQ (LETT |i| (+ |e| 1)) (LETT #2# (- |d| 1)) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (LETT H
                        (COND
                         ((EQL (SPADCALL H (QREFELT % 20)) (- |e| 1))
                          (SPADCALL
                           (SPADCALL (QREFELT % 11) (SPADCALL H (QREFELT % 23))
                                     (QREFELT % 26))
                           (PROG2
                               (LETT #3#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL H (QREFELT % 19)) Q
                                                (QREFELT % 36))
                                      |c| (QREFELT % 16)))
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                             (|Union| (QREFELT % 7)
                                                      #5="failed")
                                             #3#))
                           (QREFELT % 27)))
                         ('T (SPADCALL (QREFELT % 11) H (QREFELT % 26)))))
                  (EXIT
                   (LETT A
                         (SPADCALL
                          (SPADCALL (SPADCALL P |i| (QREFELT % 40)) H
                                    (QREFELT % 36))
                          A (QREFELT % 25)))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (SEQ G190
                 (COND ((NULL (>= (SPADCALL P (QREFELT % 20)) |e|)) (GO G191)))
                 (SEQ (EXIT (LETT P (SPADCALL P (QREFELT % 23))))) NIL
                 (GO G190) G191 (EXIT NIL))
            (LETT A
                  (SPADCALL A (SPADCALL |se| P (QREFELT % 36)) (QREFELT % 25)))
            (LETT A
                  (PROG2 (LETT #3# (SPADCALL A |lcP| (QREFELT % 16)))
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                    (|Union| (QREFELT % 7) #5#) #3#)))
            (LETT A
                  (COND
                   ((EQL (SPADCALL H (QREFELT % 20)) (- |e| 1))
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (QREFELT % 11)
                                          (SPADCALL H (QREFELT % 23))
                                          (QREFELT % 26))
                                A (QREFELT % 25))
                               (QREFELT % 36))
                     (SPADCALL (SPADCALL H (QREFELT % 19)) Q (QREFELT % 36))
                     (QREFELT % 27)))
                   (#6='T
                    (SPADCALL |c|
                              (SPADCALL
                               (SPADCALL (QREFELT % 11) H (QREFELT % 26)) A
                               (QREFELT % 25))
                              (QREFELT % 36)))))
            (LETT A
                  (PROG2 (LETT #3# (SPADCALL A |s| (QREFELT % 16)))
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                    (|Union| (QREFELT % 7) #5#) #3#)))
            (EXIT
             (PROGN
              (LETT #4#
                    (COND ((ODDP (- |d| |e|)) A)
                          (#6# (SPADCALL A (QREFELT % 39)))))
              (GO #7=#:G288)))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRS;next_sousResultant3|
        ((VP (|Vector| |polR|)) (VQ (|Vector| |polR|)) (|s| (R)) (|ss| (R))
         (% (|Vector| |polR|)))
        (SPROG
         ((|#G70| (|polR|)) (|#G71| (|polR|)) (P (|polR|)) (Q (|polR|))
          (|#G72| (R)) (|#G73| (R)) (|lcP| (R)) (|c| (R))
          (|e| (|NonNegativeInteger|)) (|delta| (|Integer|)) (#1=#:G291 NIL)
          (|#G74| (R)) (|#G75| (R)) (|r| (R)) (|rr| (R))
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (|i| NIL) (#2=#:G306 NIL) (#3=#:G295 NIL) (#4=#:G305 NIL))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G70| (SPADCALL VP 1 (QREFELT % 43)))
             (LETT |#G71| (SPADCALL VQ 1 (QREFELT % 43)))
             (LETT P |#G70|)
             (LETT Q |#G71|))
            (PROGN
             (LETT |#G72| (SPADCALL P (QREFELT % 19)))
             (LETT |#G73| (SPADCALL Q (QREFELT % 19)))
             (LETT |lcP| |#G72|)
             (LETT |c| |#G73|))
            (LETT |e| (SPADCALL Q (QREFELT % 20)))
            (SEQ (LETT |delta| (- (SPADCALL P (QREFELT % 20)) |e|))
                 (EXIT
                  (COND
                   ((EQL |delta| 1)
                    (SEQ
                     (LETT VP
                           (SPADCALL (|PRS;*| |c| VP %)
                                     (|PRS;*| (SPADCALL P |e| (QREFELT % 40))
                                      VQ %)
                                     (QREFELT % 44)))
                     (LETT VP (|PRS;exquo| VP |lcP| %))
                     (LETT VP
                           (SPADCALL
                            (|PRS;*| |c|
                             (SPADCALL VP
                                       (SPADCALL (QREFELT % 11) VQ
                                                 (QREFELT % 14))
                                       (QREFELT % 44))
                             %)
                            (|PRS;*|
                             (SPADCALL Q
                                       (PROG1 (LETT #1# (- |e| 1))
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT % 40))
                             VQ %)
                            (QREFELT % 45)))
                     (EXIT (LETT VP (|PRS;exquo| VP |s| %)))))
                   (#5='T
                    (SEQ
                     (PROGN
                      (LETT |#G74| (SPADCALL |s| |lcP| (QREFELT % 34)))
                      (LETT |#G75| (SPADCALL |ss| |c| (QREFELT % 34)))
                      (LETT |r| |#G74|)
                      (LETT |rr| |#G75|))
                     (LETT |divid|
                           (SPADCALL (SPADCALL |rr| P (QREFELT % 36)) Q
                                     (QREFELT % 29)))
                     (SPADCALL VP 1
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL (QCDR |divid|) |r|
                                                   (QREFELT % 16)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                                 (|Union| (QREFELT % 7)
                                                          #6="failed")
                                                 #3#))
                               (QREFELT % 46))
                     (EXIT
                      (SEQ (LETT |i| 2) (LETT #2# (QVSIZE VP)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (SPADCALL VP |i|
                                      (SPADCALL
                                       (SPADCALL |rr|
                                                 (SPADCALL VP |i|
                                                           (QREFELT % 43))
                                                 (QREFELT % 36))
                                       (SPADCALL
                                        (SPADCALL VQ |i| (QREFELT % 43))
                                        (QCAR |divid|) (QREFELT % 26))
                                       (QREFELT % 27))
                                      (QREFELT % 46))
                            (EXIT
                             (SPADCALL VP |i|
                                       (PROG2
                                           (LETT #3#
                                                 (SPADCALL
                                                  (SPADCALL VP |i|
                                                            (QREFELT % 43))
                                                  |r| (QREFELT % 16)))
                                           (QCDR #3#)
                                         (|check_union2| (QEQCAR #3# 0)
                                                         (QREFELT % 7)
                                                         (|Union| (QREFELT % 7)
                                                                  #6#)
                                                         #3#))
                                       (QREFELT % 46))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT NIL))))))))
            (EXIT
             (PROGN
              (LETT #4#
                    (COND ((ODDP |delta|) VP)
                          (#5# (SPADCALL VP (QREFELT % 47)))))
              (GO #7=#:G304)))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRS;algo_new| ((P (|polR|)) (Q (|polR|)) (% (R)))
        (SPROG
         ((#1=#:G307 NIL) (|#G79| (|polR|)) (|#G80| (|polR|)) (#2=#:G309 NIL)
          (|delta| (|NonNegativeInteger|)) (Z (|polR|)) (#3=#:G316 NIL)
          (|#G81| (|polR|)) (|#G82| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |delta|
                  (PROG1
                      (LETT #1#
                            (- (SPADCALL P (QREFELT % 20))
                               (SPADCALL Q (QREFELT % 20))))
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#)))
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT % 19)) |delta|
                            (QREFELT % 33)))
            (PROGN
             (LETT |#G79| Q)
             (LETT |#G80|
                   (SPADCALL P (SPADCALL Q (QREFELT % 39)) (QREFELT % 48)))
             (LETT P |#G79|)
             (LETT Q |#G80|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT % 31))
                      (PROGN (LETT #3# (|spadConstant| % 21)) (GO #4=#:G315)))
                     ('T
                      (SEQ
                       (LETT |delta|
                             (PROG1
                                 (LETT #2#
                                       (- (SPADCALL P (QREFELT % 20))
                                          (SPADCALL Q (QREFELT % 20))))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#)))
                       (LETT Z
                             (SPADCALL Q (SPADCALL Q (QREFELT % 19)) |s|
                                       |delta| (QREFELT % 38)))
                       (EXIT
                        (COND
                         ((ZEROP (SPADCALL Z (QREFELT % 20)))
                          (PROGN
                           (LETT #3# (SPADCALL Z (QREFELT % 19)))
                           (GO #4#)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G81| Q)
                            (LETT |#G82| (SPADCALL P Q Z |s| (QREFELT % 41)))
                            (LETT P |#G81|)
                            (LETT Q |#G82|))
                           (EXIT
                            (LETT |s| (SPADCALL Z (QREFELT % 19)))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #3#)))) 

(SDEFUN |PRS;resultant;2polRR;14| ((P (|polR|)) (Q (|polR|)) (% (R)))
        (SPROG
         ((|#G85| #1=(|NonNegativeInteger|)) (|#G86| #1#) (|#G87| (|polR|))
          (|#G88| (|polR|)) (|#G89| #1#) (|#G90| #1#) (|degP| #1#)
          (|degQ| #1#))
         (SEQ
          (COND
           ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
            (|spadConstant| % 21))
           ('T
            (SEQ
             (PROGN
              (LETT |#G85| (SPADCALL P (QREFELT % 20)))
              (LETT |#G86| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G85|)
              (LETT |degQ| |#G86|))
             (COND
              ((< |degP| |degQ|)
               (SEQ
                (PROGN
                 (LETT |#G87| Q)
                 (LETT |#G88| P)
                 (LETT P |#G87|)
                 (LETT Q |#G88|))
                (PROGN
                 (LETT |#G89| |degQ|)
                 (LETT |#G90| |degP|)
                 (LETT |degP| |#G89|)
                 (LETT |degQ| |#G90|))
                (EXIT
                 (COND
                  ((ODDP |degP|)
                   (COND
                    ((ODDP |degQ|) (LETT Q (SPADCALL Q (QREFELT % 39)))))))))))
             (EXIT
              (COND
               ((ZEROP |degQ|)
                (SPADCALL (SPADCALL Q (QREFELT % 19)) |degP| (QREFELT % 49)))
               ('T (|PRS;resultant_naif| P Q %)))))))))) 

(SDEFUN |PRS;resultant;2polRR;15| ((P (|polR|)) (Q (|polR|)) (% (R)))
        (SPROG
         ((|#G93| #1=(|NonNegativeInteger|)) (|#G94| #1#) (|#G95| (|polR|))
          (|#G96| (|polR|)) (|#G97| #1#) (|#G98| #1#) (|degP| #1#)
          (|degQ| #1#))
         (SEQ
          (COND
           ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
            (|spadConstant| % 21))
           ('T
            (SEQ
             (PROGN
              (LETT |#G93| (SPADCALL P (QREFELT % 20)))
              (LETT |#G94| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G93|)
              (LETT |degQ| |#G94|))
             (COND
              ((< |degP| |degQ|)
               (SEQ
                (PROGN
                 (LETT |#G95| Q)
                 (LETT |#G96| P)
                 (LETT P |#G95|)
                 (LETT Q |#G96|))
                (PROGN
                 (LETT |#G97| |degQ|)
                 (LETT |#G98| |degP|)
                 (LETT |degP| |#G97|)
                 (LETT |degQ| |#G98|))
                (EXIT
                 (COND
                  ((ODDP |degP|)
                   (COND
                    ((ODDP |degQ|) (LETT Q (SPADCALL Q (QREFELT % 39)))))))))))
             (EXIT
              (COND
               ((ZEROP |degQ|)
                (SPADCALL (SPADCALL Q (QREFELT % 19)) |degP| (QREFELT % 33)))
               ('T (|PRS;algo_new| P Q %)))))))))) 

(SDEFUN |PRS;subResultantEuclidean|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |resultant| R))))
        (SPROG
         ((#1=#:G330 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G101| (|polR|)) (|#G102| (|polR|)) (|degQ| (|NonNegativeInteger|))
          (#2=#:G334 NIL) (|delta| (|NonNegativeInteger|))
          (|l| (|Vector| |polR|)) (#3=#:G342 NIL) (|ss| (R))
          (|#G103| #4=(|Vector| |polR|)) (|#G104| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #4#) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT % 19))
                            (PROG1
                                (LETT #1#
                                      (- (SPADCALL P (QREFELT % 20))
                                         (SPADCALL Q (QREFELT % 20))))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT % 33)))
            (LETT VP (VECTOR Q (|spadConstant| % 22) (|spadConstant| % 35)))
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT % 39)) (QREFELT % 52)))
            (LETT VQ
                  (VECTOR (QVELT |pdiv| 2)
                          (SPADCALL (QVELT |pdiv| 0) (QREFELT % 12))
                          (QVELT |pdiv| 1)))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G101| (SPADCALL VP 1 (QREFELT % 43)))
                    (LETT |#G102| (SPADCALL VQ 1 (QREFELT % 43)))
                    (LETT P |#G101|)
                    (LETT Q |#G102|))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT % 31))
                      (PROGN
                       (LETT #3#
                             (VECTOR (|spadConstant| % 22)
                                     (|spadConstant| % 22)
                                     (|spadConstant| % 21)))
                       (GO #5=#:G341)))
                     ('T
                      (SEQ (LETT |degQ| (SPADCALL Q (QREFELT % 20)))
                           (LETT |delta|
                                 (PROG1
                                     (LETT #2#
                                           (- (SPADCALL P (QREFELT % 20))
                                              |degQ|))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))
                           (EXIT
                            (COND
                             ((ZEROP |degQ|)
                              (SEQ
                               (LETT |l|
                                     (|PRS;Lazard3| VQ
                                      (SPADCALL Q (QREFELT % 19)) |s| |delta|
                                      %))
                               (EXIT
                                (PROGN
                                 (LETT #3#
                                       (VECTOR (SPADCALL |l| 2 (QREFELT % 43))
                                               (SPADCALL |l| 3 (QREFELT % 43))
                                               (SPADCALL
                                                (SPADCALL |l| 1 (QREFELT % 43))
                                                (QREFELT % 19))))
                                 (GO #5#)))))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT % 19)) |s|
                                               |delta| (QREFELT % 37)))
                               (PROGN
                                (LETT |#G103| VQ)
                                (LETT |#G104|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       %))
                                (LETT VP |#G103|)
                                (LETT VQ |#G104|))
                               (EXIT (LETT |s| |ss|)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #3#)))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;17|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |resultant| R))))
        (SPROG
         ((|#G107| #1=(|NonNegativeInteger|)) (|#G108| #1#) (|degP| #1#)
          (|degQ| #1#) (|e| (|Integer|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (#2=#:G349 NIL) (|s| (R)))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT % 31)) (SPADCALL Q (QREFELT % 31)))
            (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                    (|spadConstant| % 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G107| (SPADCALL P (QREFELT % 20)))
              (LETT |#G108| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G107|)
              (LETT |degQ| |#G108|))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP |degP|) (COND ((ODDP |degQ|) -1) (#3='T 1)))
                        (#3# 1)))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT % 53))
                                 (QREFELT % 55)))
                 (EXIT
                  (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT % 53))
                          (QVELT |l| 0) (QVELT |l| 2)))))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "resultantEuclidean$PRS : constant polynomials"))
                 (#3#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT % 19))
                                   (PROG1 (LETT #2# (- |degP| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT % 49)))
                   (EXIT
                    (VECTOR (|spadConstant| % 22) (SPADCALL |s| (QREFELT % 12))
                            (SPADCALL |s| (SPADCALL Q (QREFELT % 19))
                                      (QREFELT % 34))))))))
               (#3# (|PRS;resultantEuclidean_naif| P Q %)))))))))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;18|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |resultant| R))))
        (SPROG
         ((|#G111| #1=(|NonNegativeInteger|)) (|#G112| #1#) (|degP| #1#)
          (|degQ| #1#) (|e| (|Integer|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (#2=#:G361 NIL) (|s| (R)))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT % 31)) (SPADCALL Q (QREFELT % 31)))
            (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                    (|spadConstant| % 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G111| (SPADCALL P (QREFELT % 20)))
              (LETT |#G112| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G111|)
              (LETT |degQ| |#G112|))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP |degP|) (COND ((ODDP |degQ|) -1) (#3='T 1)))
                        (#3# 1)))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT % 53))
                                 (QREFELT % 55)))
                 (EXIT
                  (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT % 53))
                          (QVELT |l| 0) (QVELT |l| 2)))))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "resultantEuclidean$PRS : constant polynomials"))
                 (#3#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT % 19))
                                   (PROG1 (LETT #2# (- |degP| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT % 33)))
                   (EXIT
                    (VECTOR (|spadConstant| % 22) (SPADCALL |s| (QREFELT % 12))
                            (SPADCALL |s| (SPADCALL Q (QREFELT % 19))
                                      (QREFELT % 34))))))))
               (#3# (|PRS;subResultantEuclidean| P Q %)))))))))) 

(SDEFUN |PRS;semiSubResultantEuclidean|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |resultant| R))))
        (SPROG
         ((#1=#:G368 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G115| (|polR|)) (|#G116| (|polR|)) (|degQ| (|NonNegativeInteger|))
          (#2=#:G371 NIL) (|delta| (|NonNegativeInteger|))
          (|l| (|Vector| |polR|)) (#3=#:G379 NIL) (|ss| (R))
          (|#G117| #4=(|Vector| |polR|)) (|#G118| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #4#) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT % 19))
                            (PROG1
                                (LETT #1#
                                      (- (SPADCALL P (QREFELT % 20))
                                         (SPADCALL Q (QREFELT % 20))))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT % 33)))
            (LETT VP (VECTOR Q (|spadConstant| % 35)))
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT % 39)) (QREFELT % 52)))
            (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G115| (SPADCALL VP 1 (QREFELT % 43)))
                    (LETT |#G116| (SPADCALL VQ 1 (QREFELT % 43)))
                    (LETT P |#G115|)
                    (LETT Q |#G116|))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT % 31))
                      (PROGN
                       (LETT #3#
                             (CONS (|spadConstant| % 22)
                                   (|spadConstant| % 21)))
                       (GO #5=#:G378)))
                     ('T
                      (SEQ (LETT |degQ| (SPADCALL Q (QREFELT % 20)))
                           (LETT |delta|
                                 (PROG1
                                     (LETT #2#
                                           (- (SPADCALL P (QREFELT % 20))
                                              |degQ|))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))
                           (COND
                            ((ZEROP |degQ|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT % 19)) |s| |delta|
                                     %))
                              (EXIT
                               (PROGN
                                (LETT #3#
                                      (CONS (SPADCALL |l| 2 (QREFELT % 43))
                                            (SPADCALL
                                             (SPADCALL |l| 1 (QREFELT % 43))
                                             (QREFELT % 19))))
                                (GO #5#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT % 19)) |s|
                                           |delta| (QREFELT % 37)))
                           (PROGN
                            (LETT |#G117| VQ)
                            (LETT |#G118|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| %))
                            (LETT VP |#G117|)
                            (LETT VQ |#G118|))
                           (EXIT (LETT |s| |ss|)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #3#)))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;20|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |resultant| R))))
        (SPROG
         ((|#G121| #1=(|NonNegativeInteger|)) (|#G122| #1#) (|degP| #1#)
          (|degQ| #1#) (#2=#:G382 NIL) (|s| (R)))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT % 31)) (SPADCALL Q (QREFELT % 31)))
            (CONS (|spadConstant| % 22) (|spadConstant| % 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G121| (SPADCALL P (QREFELT % 20)))
              (LETT |#G122| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G121|)
              (LETT |degQ| |#G122|))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (|error| "semiResultantEuclidean2 : bad degrees"))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "semiResultantEuclidean2 : constant polynomials"))
                 (#3='T
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT % 19))
                                   (PROG1 (LETT #2# (- |degP| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT % 49)))
                   (EXIT
                    (CONS (SPADCALL |s| (QREFELT % 12))
                          (SPADCALL |s| (SPADCALL Q (QREFELT % 19))
                                    (QREFELT % 34))))))))
               (#3# (|PRS;semiResultantEuclidean_naif| P Q %)))))))))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;21|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |resultant| R))))
        (SPROG
         ((|#G125| #1=(|NonNegativeInteger|)) (|#G126| #1#) (|degP| #1#)
          (|degQ| #1#) (#2=#:G392 NIL) (|s| (R)))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT % 31)) (SPADCALL Q (QREFELT % 31)))
            (CONS (|spadConstant| % 22) (|spadConstant| % 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G125| (SPADCALL P (QREFELT % 20)))
              (LETT |#G126| (SPADCALL Q (QREFELT % 20)))
              (LETT |degP| |#G125|)
              (LETT |degQ| |#G126|))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (|error| "semiResultantEuclidean2 : bad degrees"))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "semiResultantEuclidean2 : constant polynomials"))
                 (#3='T
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT % 19))
                                   (PROG1 (LETT #2# (- |degP| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT % 33)))
                   (EXIT
                    (CONS (SPADCALL |s| (QREFELT % 12))
                          (SPADCALL |s| (SPADCALL Q (QREFELT % 19))
                                    (QREFELT % 34))))))))
               (#3# (|PRS;semiSubResultantEuclidean| P Q %)))))))))) 

(SDEFUN |PRS;semiResultantEuclidean1;2polRR;22|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef1| |polR|) (|:| |resultant| R))))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R))))
         (SEQ (LETT |result| (SPADCALL P Q (QREFELT % 55)))
              (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;indiceSubResultant;2polRNnipolR;23|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|)) (% (|polR|)))
        (SPROG
         ((|#G132| (|polR|)) (|#G133| (|polR|)) (#1=#:G407 NIL)
          (|delta| (|NonNegativeInteger|)) (#2=#:G409 NIL) (#3=#:G414 NIL)
          (|#G134| (|polR|)) (|#G135| (|polR|))
          (|#G136| #4=(|NonNegativeInteger|)) (|#G137| #4#) (|degP| #4#)
          (|degQ| #4#) (#5=#:G417 NIL) (Z (|polR|)) (#6=#:G425 NIL)
          (|#G138| (|polR|)) (|#G139| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (|spadConstant| % 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (PROGN
                  (LETT |#G132| Q)
                  (LETT |#G133| P)
                  (LETT P |#G132|)
                  (LETT Q |#G133|))
                 (EXIT
                  (COND
                   ((ODDP (- (SPADCALL P (QREFELT % 20)) |i|))
                    (COND
                     ((ODDP (- (SPADCALL Q (QREFELT % 20)) |i|))
                      (LETT Q (SPADCALL Q (QREFELT % 39)))))))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #1#
                                 (- (SPADCALL P (QREFELT % 20))
                                    (SPADCALL Q (QREFELT % 20))))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultant$PRS : bad degrees"))
                   (#7='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT % 19))
                                     (PROG1 (LETT #2# (- |delta| 1))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 33)))
                     (EXIT
                      (PROGN
                       (LETT #6# (SPADCALL |s| Q (QREFELT % 36)))
                       (GO #8=#:G424))))))))))
              (EXIT
               (COND
                ((> |i| (SPADCALL Q (QREFELT % 20))) (|spadConstant| % 22))
                (#7#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT % 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT % 33)))
                  (PROGN
                   (LETT |#G134| Q)
                   (LETT |#G135|
                         (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                   (QREFELT % 48)))
                   (LETT P |#G134|)
                   (LETT Q |#G135|))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G136| (SPADCALL P (QREFELT % 20)))
                          (LETT |#G137| (SPADCALL Q (QREFELT % 20)))
                          (LETT |degP| |#G136|)
                          (LETT |degQ| |#G137|))
                         (EXIT
                          (COND
                           ((EQL |i| (- |degP| 1))
                            (PROGN (LETT #6# Q) (GO #8#)))
                           ((OR (SPADCALL Q (QREFELT % 31)) (> |i| |degQ|))
                            (PROGN (LETT #6# (|spadConstant| % 22)) (GO #8#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT % 19)) |s|
                                             (PROG1
                                                 (LETT #5# (- |degP| |degQ|))
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             (QREFELT % 38)))
                             (EXIT
                              (COND
                               ((EQL |i| |degQ|) (PROGN (LETT #6# Z) (GO #8#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G138| Q)
                                  (LETT |#G139|
                                        (SPADCALL P Q Z |s| (QREFELT % 41)))
                                  (LETT P |#G138|)
                                  (LETT Q |#G139|))
                                 (EXIT
                                  (LETT |s|
                                        (SPADCALL Z (QREFELT % 19)))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #6#)))) 

(SDEFUN |PRS;indiceSubResultantEuclidean;2polRNniR;24|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |subResultant| |polR|))))
        (SPROG
         ((|e| (R))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (#1=#:G434 NIL) (|delta| (|NonNegativeInteger|)) (#2=#:G436 NIL)
          (#3=#:G441 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G147| (|polR|)) (|#G148| (|polR|))
          (|#G149| #4=(|NonNegativeInteger|)) (|#G150| #4#) (|degP| #4#)
          (|degQ| #4#) (#5=#:G444 NIL) (VZ (|Vector| |polR|)) (#6=#:G453 NIL)
          (|ss| (R)) (|#G151| #7=(|Vector| |polR|)) (|#G152| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #7#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                     (|spadConstant| % 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (- (SPADCALL P (QREFELT % 20)) |i|))
                         (COND
                          ((ODDP (- (SPADCALL Q (QREFELT % 20)) |i|))
                           (SPADCALL (|spadConstant| % 8) (QREFELT % 32)))
                          (#8='T (|spadConstant| % 8))))
                        (#8# (|spadConstant| % 8))))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT % 36)) |i|
                                 (QREFELT % 62)))
                 (EXIT
                  (PROGN
                   (LETT #6#
                         (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT % 36))
                                 (QVELT |l| 0) (QVELT |l| 2)))
                   (GO #9=#:G452))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #1#
                                 (- (SPADCALL P (QREFELT % 20))
                                    (SPADCALL Q (QREFELT % 20))))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultantEuclidean$PRS : bad degrees"))
                   (#8#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT % 19))
                                     (PROG1 (LETT #2# (- |delta| 1))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 33)))
                     (EXIT
                      (PROGN
                       (LETT #6#
                             (VECTOR (|spadConstant| % 22)
                                     (SPADCALL |s| (QREFELT % 12))
                                     (SPADCALL |s| Q (QREFELT % 36))))
                       (GO #9#))))))))))
              (EXIT
               (COND
                ((> |i| (SPADCALL Q (QREFELT % 20)))
                 (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                         (|spadConstant| % 22)))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT % 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT % 33)))
                  (LETT VP
                        (VECTOR Q (|spadConstant| % 22) (|spadConstant| % 35)))
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                  (QREFELT % 52)))
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT % 12))
                                (QVELT |pdiv| 1)))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G147| (SPADCALL VP 1 (QREFELT % 43)))
                          (LETT |#G148| (SPADCALL VQ 1 (QREFELT % 43)))
                          (LETT P |#G147|)
                          (LETT Q |#G148|))
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT % 31))
                            (PROGN
                             (LETT #6#
                                   (VECTOR (|spadConstant| % 22)
                                           (|spadConstant| % 22)
                                           (|spadConstant| % 22)))
                             (GO #9#)))
                           ('T
                            (SEQ
                             (PROGN
                              (LETT |#G149| (SPADCALL P (QREFELT % 20)))
                              (LETT |#G150| (SPADCALL Q (QREFELT % 20)))
                              (LETT |degP| |#G149|)
                              (LETT |degQ| |#G150|))
                             (EXIT
                              (COND
                               ((EQL |i| (- |degP| 1))
                                (PROGN
                                 (LETT #6#
                                       (VECTOR (SPADCALL VQ 2 (QREFELT % 43))
                                               (SPADCALL VQ 3 (QREFELT % 43))
                                               (SPADCALL VQ 1 (QREFELT % 43))))
                                 (GO #9#)))
                               ((> |i| |degQ|)
                                (PROGN
                                 (LETT #6#
                                       (VECTOR (|spadConstant| % 22)
                                               (|spadConstant| % 22)
                                               (|spadConstant| % 22)))
                                 (GO #9#)))
                               ('T
                                (SEQ
                                 (LETT VZ
                                       (|PRS;Lazard3| VQ
                                        (SPADCALL Q (QREFELT % 19)) |s|
                                        (PROG1 (LETT #5# (- |degP| |degQ|))
                                          (|check_subtype2| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                        %))
                                 (EXIT
                                  (COND
                                   ((EQL |i| |degQ|)
                                    (PROGN
                                     (LETT #6#
                                           (VECTOR
                                            (SPADCALL VZ 2 (QREFELT % 43))
                                            (SPADCALL VZ 3 (QREFELT % 43))
                                            (SPADCALL VZ 1 (QREFELT % 43))))
                                     (GO #9#)))
                                   ('T
                                    (SEQ
                                     (LETT |ss|
                                           (SPADCALL
                                            (SPADCALL VZ 1 (QREFELT % 43))
                                            (QREFELT % 19)))
                                     (PROGN
                                      (LETT |#G151| VQ)
                                      (LETT |#G152|
                                            (|PRS;next_sousResultant3| VP VQ
                                             |s| |ss| %))
                                      (LETT VP |#G151|)
                                      (LETT VQ |#G152|))
                                     (EXIT (LETT |s| |ss|)))))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #9# (EXIT #6#)))) 

(SDEFUN |PRS;semiIndiceSubResultantEuclidean;2polRNniR;25|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|))))
        (SPROG
         ((#1=#:G457 NIL) (|delta| (|NonNegativeInteger|)) (#2=#:G459 NIL)
          (#3=#:G464 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G156| (|polR|)) (|#G157| (|polR|))
          (|#G158| #4=(|NonNegativeInteger|)) (|#G159| #4#) (|degP| #4#)
          (|degQ| #4#) (#5=#:G467 NIL) (VZ (|Vector| |polR|)) (#6=#:G478 NIL)
          (|ss| (R)) (|#G160| #7=(|Vector| |polR|)) (|#G161| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #7#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (CONS (|spadConstant| % 22) (|spadConstant| % 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
               (|error| "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
              (#8='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #1#
                                   (- (SPADCALL P (QREFELT % 20))
                                      (SPADCALL Q (QREFELT % 20))))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#)))
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
                     (#8#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT % 19))
                                       (PROG1 (LETT #2# (- |delta| 1))
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT % 33)))
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (CONS (SPADCALL |s| (QREFELT % 12))
                                     (SPADCALL |s| Q (QREFELT % 36))))
                         (GO #9=#:G477))))))))))
                (EXIT
                 (COND
                  ((> |i| (SPADCALL Q (QREFELT % 20)))
                   (CONS (|spadConstant| % 22) (|spadConstant| % 22)))
                  (#8#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT % 19))
                                    (PROG1
                                        (LETT #3#
                                              (- (SPADCALL P (QREFELT % 20))
                                                 (SPADCALL Q (QREFELT % 20))))
                                      (|check_subtype2| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                    (QREFELT % 33)))
                    (LETT VP (VECTOR Q (|spadConstant| % 35)))
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                    (QREFELT % 52)))
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G156| (SPADCALL VP 1 (QREFELT % 43)))
                            (LETT |#G157| (SPADCALL VQ 1 (QREFELT % 43)))
                            (LETT P |#G156|)
                            (LETT Q |#G157|))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT % 31))
                              (PROGN
                               (LETT #6#
                                     (CONS (|spadConstant| % 22)
                                           (|spadConstant| % 22)))
                               (GO #9#)))
                             ('T
                              (SEQ
                               (PROGN
                                (LETT |#G158| (SPADCALL P (QREFELT % 20)))
                                (LETT |#G159| (SPADCALL Q (QREFELT % 20)))
                                (LETT |degP| |#G158|)
                                (LETT |degQ| |#G159|))
                               (EXIT
                                (COND
                                 ((EQL |i| (- |degP| 1))
                                  (PROGN
                                   (LETT #6#
                                         (CONS (SPADCALL VQ 2 (QREFELT % 43))
                                               (SPADCALL VQ 1 (QREFELT % 43))))
                                   (GO #9#)))
                                 ((> |i| |degQ|)
                                  (PROGN
                                   (LETT #6#
                                         (CONS (|spadConstant| % 22)
                                               (|spadConstant| % 22)))
                                   (GO #9#)))
                                 ('T
                                  (SEQ
                                   (LETT VZ
                                         (|PRS;Lazard3| VQ
                                          (SPADCALL Q (QREFELT % 19)) |s|
                                          (PROG1 (LETT #5# (- |degP| |degQ|))
                                            (|check_subtype2| (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                          %))
                                   (EXIT
                                    (COND
                                     ((EQL |i| |degQ|)
                                      (PROGN
                                       (LETT #6#
                                             (CONS
                                              (SPADCALL VZ 2 (QREFELT % 43))
                                              (SPADCALL VZ 1 (QREFELT % 43))))
                                       (GO #9#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL VZ 1 (QREFELT % 43))
                                              (QREFELT % 19)))
                                       (PROGN
                                        (LETT |#G160| VQ)
                                        (LETT |#G161|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| %))
                                        (LETT VP |#G160|)
                                        (LETT VQ |#G161|))
                                       (EXIT (LETT |s| |ss|)))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #9# (EXIT #6#)))) 

(SDEFUN |PRS;degreeSubResultant;2polRNnipolR;26|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|)) (% (|polR|)))
        (SPROG
         ((|#G169| (|polR|)) (|#G170| (|polR|)) (#1=#:G482 NIL)
          (|delta| (|NonNegativeInteger|)) (#2=#:G484 NIL) (#3=#:G489 NIL)
          (|#G171| (|polR|)) (|#G172| (|polR|)) (#4=#:G500 NIL) (#5=#:G493 NIL)
          (Z (|polR|)) (|#G173| (|polR|)) (|#G174| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (|spadConstant| % 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (PROGN
                 (LETT |#G169| Q)
                 (LETT |#G170| P)
                 (LETT P |#G169|)
                 (LETT Q |#G170|))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #1#
                                 (- (SPADCALL P (QREFELT % 20))
                                    (SPADCALL Q (QREFELT % 20))))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultant$PRS : bad degrees"))
                   (#6='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT % 19))
                                     (PROG1 (LETT #2# (- |delta| 1))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 33)))
                     (EXIT
                      (PROGN
                       (LETT #4# (SPADCALL |s| Q (QREFELT % 36)))
                       (GO #7=#:G499))))))))))
              (EXIT
               (COND
                ((> |i| (SPADCALL Q (QREFELT % 20))) (|spadConstant| % 22))
                (#6#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT % 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT % 33)))
                  (PROGN
                   (LETT |#G171| Q)
                   (LETT |#G172|
                         (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                   (QREFELT % 48)))
                   (LETT P |#G171|)
                   (LETT Q |#G172|))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((OR (SPADCALL Q (QREFELT % 31))
                                (> |i| (SPADCALL Q (QREFELT % 20))))
                            (PROGN (LETT #4# (|spadConstant| % 22)) (GO #7#)))
                           ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                            (PROGN (LETT #4# Q) (GO #7#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT % 19)) |s|
                                             (PROG1
                                                 (LETT #5#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT %
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT %
                                                                           20))))
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             (QREFELT % 38)))
                             (PROGN
                              (LETT |#G173| Q)
                              (LETT |#G174|
                                    (SPADCALL P Q Z |s| (QREFELT % 41)))
                              (LETT P |#G173|)
                              (LETT Q |#G174|))
                             (EXIT (LETT |s| (SPADCALL Z (QREFELT % 19)))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRS;degreeSubResultantEuclidean;2polRNniR;27|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |subResultant| |polR|))))
        (SPROG
         ((|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (#1=#:G506 NIL) (|delta| (|NonNegativeInteger|)) (#2=#:G508 NIL)
          (#3=#:G513 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G181| (|polR|)) (|#G182| (|polR|)) (#4=#:G525 NIL) (#5=#:G518 NIL)
          (|ss| (R)) (|#G183| #6=(|Vector| |polR|)) (|#G184| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #6#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                     (|spadConstant| % 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (SEQ (LETT |l| (SPADCALL Q P |i| (QREFELT % 66)))
                     (EXIT
                      (PROGN
                       (LETT #4#
                             (VECTOR (QVELT |l| 1) (QVELT |l| 0)
                                     (QVELT |l| 2)))
                       (GO #7=#:G524))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #1#
                                 (- (SPADCALL P (QREFELT % 20))
                                    (SPADCALL Q (QREFELT % 20))))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultantEuclidean$PRS : bad degrees"))
                   (#8='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT % 19))
                                     (PROG1 (LETT #2# (- |delta| 1))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 33)))
                     (EXIT
                      (PROGN
                       (LETT #4#
                             (VECTOR (|spadConstant| % 22)
                                     (SPADCALL |s| (QREFELT % 12))
                                     (SPADCALL |s| Q (QREFELT % 36))))
                       (GO #7#))))))))))
              (EXIT
               (COND
                ((> |i| (SPADCALL Q (QREFELT % 20)))
                 (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                         (|spadConstant| % 22)))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT % 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT % 33)))
                  (LETT VP
                        (VECTOR Q (|spadConstant| % 22) (|spadConstant| % 35)))
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                  (QREFELT % 52)))
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT % 12))
                                (QVELT |pdiv| 1)))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G181| (SPADCALL VP 1 (QREFELT % 43)))
                          (LETT |#G182| (SPADCALL VQ 1 (QREFELT % 43)))
                          (LETT P |#G181|)
                          (LETT Q |#G182|))
                         (COND
                          ((OR (SPADCALL Q (QREFELT % 31))
                               (> |i| (SPADCALL Q (QREFELT % 20))))
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (VECTOR (|spadConstant| % 22)
                                           (|spadConstant| % 22)
                                           (|spadConstant| % 22)))
                             (GO #7#)))))
                         (EXIT
                          (COND
                           ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                            (PROGN
                             (LETT #4#
                                   (VECTOR (SPADCALL VQ 2 (QREFELT % 43))
                                           (SPADCALL VQ 3 (QREFELT % 43))
                                           (SPADCALL VQ 1 (QREFELT % 43))))
                             (GO #7#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL Q (QREFELT % 19)) |s|
                                             (PROG1
                                                 (LETT #5#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT %
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT %
                                                                           20))))
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             (QREFELT % 37)))
                             (PROGN
                              (LETT |#G183| VQ)
                              (LETT |#G184|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     %))
                              (LETT VP |#G183|)
                              (LETT VQ |#G184|))
                             (EXIT (LETT |s| |ss|)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRS;semiDegreeSubResultantEuclidean;2polRNniR;28|
        ((P (|polR|)) (Q (|polR|)) (|i| (|NonNegativeInteger|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|))))
        (SPROG
         ((#1=#:G529 NIL) (|delta| (|NonNegativeInteger|)) (#2=#:G531 NIL)
          (#3=#:G536 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G188| (|polR|)) (|#G189| (|polR|)) (#4=#:G549 NIL) (#5=#:G541 NIL)
          (|ss| (R)) (|#G190| #6=(|Vector| |polR|)) (|#G191| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #6#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (CONS (|spadConstant| % 22) (|spadConstant| % 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
               (|error| "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
              (#7='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #1#
                                   (- (SPADCALL P (QREFELT % 20))
                                      (SPADCALL Q (QREFELT % 20))))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#)))
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
                     (#7#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT % 19))
                                       (PROG1 (LETT #2# (- |delta| 1))
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT % 33)))
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (CONS (SPADCALL |s| (QREFELT % 12))
                                     (SPADCALL |s| Q (QREFELT % 36))))
                         (GO #8=#:G548))))))))))
                (EXIT
                 (COND
                  ((> |i| (SPADCALL Q (QREFELT % 20)))
                   (CONS (|spadConstant| % 22) (|spadConstant| % 22)))
                  (#7#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT % 19))
                                    (PROG1
                                        (LETT #3#
                                              (- (SPADCALL P (QREFELT % 20))
                                                 (SPADCALL Q (QREFELT % 20))))
                                      (|check_subtype2| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                    (QREFELT % 33)))
                    (LETT VP (VECTOR Q (|spadConstant| % 35)))
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                    (QREFELT % 52)))
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G188| (SPADCALL VP 1 (QREFELT % 43)))
                            (LETT |#G189| (SPADCALL VQ 1 (QREFELT % 43)))
                            (LETT P |#G188|)
                            (LETT Q |#G189|))
                           (COND
                            ((OR (SPADCALL Q (QREFELT % 31))
                                 (> |i| (SPADCALL Q (QREFELT % 20))))
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (CONS (|spadConstant| % 22)
                                           (|spadConstant| % 22)))
                               (GO #8#)))))
                           (EXIT
                            (COND
                             ((EQL |i| (SPADCALL Q (QREFELT % 20)))
                              (PROGN
                               (LETT #4#
                                     (CONS (SPADCALL VQ 2 (QREFELT % 43))
                                           (SPADCALL VQ 1 (QREFELT % 43))))
                               (GO #8#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT % 19)) |s|
                                               (PROG1
                                                   (LETT #5#
                                                         (-
                                                          (SPADCALL P
                                                                    (QREFELT %
                                                                             20))
                                                          (SPADCALL Q
                                                                    (QREFELT %
                                                                             20))))
                                                 (|check_subtype2| (>= #5# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #5#))
                                               (QREFELT % 37)))
                               (PROGN
                                (LETT |#G190| VQ)
                                (LETT |#G191|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       %))
                                (LETT VP |#G190|)
                                (LETT VQ |#G191|))
                               (EXIT (LETT |s| |ss|)))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #8# (EXIT #4#)))) 

(SDEFUN |PRS;lastSubResultant;3polR;29|
        ((P (|polR|)) (Q (|polR|)) (% (|polR|)))
        (SPROG
         ((|#G197| (|polR|)) (|#G198| (|polR|)) (#1=#:G554 NIL)
          (|#G199| (|polR|)) (|#G200| (|polR|)) (#2=#:G556 NIL) (Z (|polR|))
          (#3=#:G564 NIL) (|#G201| (|polR|)) (|#G202| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (|spadConstant| % 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (PROGN
                 (LETT |#G197| Q)
                 (LETT |#G198| P)
                 (LETT P |#G197|)
                 (LETT Q |#G198|))))
              (EXIT
               (COND
                ((ZEROP (SPADCALL Q (QREFELT % 20)))
                 (SPADCALL
                  (SPADCALL (SPADCALL Q (QREFELT % 19))
                            (SPADCALL P (QREFELT % 20)) (QREFELT % 33))
                  (QREFELT % 12)))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT % 19))
                                  (PROG1
                                      (LETT #1#
                                            (- (SPADCALL P (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT % 33)))
                  (PROGN
                   (LETT |#G199| Q)
                   (LETT |#G200|
                         (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                   (QREFELT % 48)))
                   (LETT P |#G199|)
                   (LETT Q |#G200|))
                  (LETT Z P)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT % 31))
                            (PROGN (LETT #3# Z) (GO #4=#:G563)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT % 19)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT %
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT %
                                                                           20))))
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT % 38)))
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL Z (QREFELT % 20)))
                                (PROGN (LETT #3# Z) (GO #4#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G201| Q)
                                  (LETT |#G202|
                                        (SPADCALL P Q Z |s| (QREFELT % 41)))
                                  (LETT P |#G201|)
                                  (LETT Q |#G202|))
                                 (EXIT
                                  (LETT |s|
                                        (SPADCALL Z (QREFELT % 19)))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |PRS;lastSubResultantEuclidean;2polRR;30|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |subResultant| |polR|))))
        (SPROG
         ((|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (|degP| (|NonNegativeInteger|)) (#1=#:G571 NIL) (#2=#:G576 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G205| (|polR|)) (|#G206| (|polR|)) (Z (|polR|)) (#3=#:G579 NIL)
          (VZ (|Vector| |polR|)) (#4=#:G586 NIL) (|ss| (R))
          (|#G207| #5=(|Vector| |polR|)) (|#G208| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #5#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                     (|spadConstant| % 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (SEQ (LETT |l| (SPADCALL Q P (QREFELT % 69)))
                     (EXIT
                      (PROGN
                       (LETT #4#
                             (VECTOR (QVELT |l| 1) (QVELT |l| 0)
                                     (QVELT |l| 2)))
                       (GO #6=#:G585))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT % 20)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT % 20)))
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "lastSubResultantEuclidean$PRS : constant polynomials"))
                       ('T
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT % 19))
                                         (PROG1 (LETT #1# (- |degP| 1))
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT % 33)))
                         (EXIT
                          (PROGN
                           (LETT #4#
                                 (VECTOR (|spadConstant| % 22)
                                         (SPADCALL |s| (QREFELT % 12))
                                         (SPADCALL |s| Q (QREFELT % 36))))
                           (GO #6#))))))))))
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT % 19))
                              (PROG1
                                  (LETT #2#
                                        (- (SPADCALL P (QREFELT % 20))
                                           (SPADCALL Q (QREFELT % 20))))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT % 33)))
              (LETT VP (VECTOR Q (|spadConstant| % 22) (|spadConstant| % 35)))
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT % 39)) (QREFELT % 52)))
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT % 12))
                            (QVELT |pdiv| 1)))
              (LETT VZ (SPADCALL VP (QREFELT % 70)))
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G205| (SPADCALL VQ 1 (QREFELT % 43)))
                      (LETT |#G206| (SPADCALL VZ 1 (QREFELT % 43)))
                      (LETT Q |#G205|)
                      (LETT Z |#G206|))
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT % 31))
                        (PROGN
                         (LETT #4#
                               (VECTOR (SPADCALL VZ 2 (QREFELT % 43))
                                       (SPADCALL VZ 3 (QREFELT % 43))
                                       (SPADCALL VZ 1 (QREFELT % 43))))
                         (GO #6#)))
                       ('T
                        (SEQ
                         (LETT VZ
                               (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT % 19))
                                |s|
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL Z (QREFELT % 20))
                                             (SPADCALL Q (QREFELT % 20))))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                %))
                         (EXIT
                          (COND
                           ((ZEROP (SPADCALL Q (QREFELT % 20)))
                            (PROGN
                             (LETT #4#
                                   (VECTOR (SPADCALL VZ 2 (QREFELT % 43))
                                           (SPADCALL VZ 3 (QREFELT % 43))
                                           (SPADCALL VZ 1 (QREFELT % 43))))
                             (GO #6#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL VZ 1 (QREFELT % 43))
                                             (QREFELT % 19)))
                             (PROGN
                              (LETT |#G207| VQ)
                              (LETT |#G208|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     %))
                              (LETT VP |#G207|)
                              (LETT VQ |#G208|))
                             (EXIT (LETT |s| |ss|)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |PRS;semiLastSubResultantEuclidean;2polRR;31|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|))))
        (SPROG
         ((|degP| (|NonNegativeInteger|)) (#1=#:G591 NIL) (#2=#:G596 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G211| (|polR|)) (|#G212| (|polR|)) (Z (|polR|)) (#3=#:G599 NIL)
          (VZ (|Vector| |polR|)) (#4=#:G607 NIL) (|ss| (R))
          (|#G213| #5=(|Vector| |polR|)) (|#G214| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #5#) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31)))
             (CONS (|spadConstant| % 22) (|spadConstant| % 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
               (|error| "semiLastSubResultantEuclidean$PRS : bad degrees"))
              (#6='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT % 20)))
                  (SEQ (LETT |degP| (SPADCALL P (QREFELT % 20)))
                       (EXIT
                        (COND
                         ((ZEROP |degP|)
                          (|error|
                           "semiLastSubResultantEuclidean$PRS : constant polynomials"))
                         (#6#
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT % 19))
                                           (PROG1 (LETT #1# (- |degP| 1))
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT % 33)))
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (CONS (SPADCALL |s| (QREFELT % 12))
                                         (SPADCALL |s| Q (QREFELT % 36))))
                             (GO #7=#:G606))))))))))
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT % 19))
                                (PROG1
                                    (LETT #2#
                                          (- (SPADCALL P (QREFELT % 20))
                                             (SPADCALL Q (QREFELT % 20))))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT % 33)))
                (LETT VP (VECTOR Q (|spadConstant| % 35)))
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT % 39)) (QREFELT % 52)))
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)))
                (LETT VZ (SPADCALL VP (QREFELT % 70)))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G211| (SPADCALL VQ 1 (QREFELT % 43)))
                        (LETT |#G212| (SPADCALL VZ 1 (QREFELT % 43)))
                        (LETT Q |#G211|)
                        (LETT Z |#G212|))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT % 31))
                          (PROGN
                           (LETT #4#
                                 (CONS (SPADCALL VZ 2 (QREFELT % 43))
                                       (SPADCALL VZ 1 (QREFELT % 43))))
                           (GO #7#)))
                         ('T
                          (SEQ
                           (LETT VZ
                                 (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT % 19))
                                  |s|
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL Z (QREFELT % 20))
                                               (SPADCALL Q (QREFELT % 20))))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  %))
                           (EXIT
                            (COND
                             ((ZEROP (SPADCALL Q (QREFELT % 20)))
                              (PROGN
                               (LETT #4#
                                     (CONS (SPADCALL VZ 2 (QREFELT % 43))
                                           (SPADCALL VZ 1 (QREFELT % 43))))
                               (GO #7#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL VZ 1 (QREFELT % 43))
                                               (QREFELT % 19)))
                               (PROGN
                                (LETT |#G213| VQ)
                                (LETT |#G214|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       %))
                                (LETT VP |#G213|)
                                (LETT VQ |#G214|))
                               (EXIT (LETT |s| |ss|)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRS;chainSubResultants;2polRL;32|
        ((P (|polR|)) (Q (|polR|)) (% (|List| |polR|)))
        (SPROG
         ((|#G219| (|polR|)) (|#G220| (|polR|)) (#1=#:G614 NIL)
          (|#G221| (|polR|)) (|#G222| (|polR|)) (#2=#:G616 NIL)
          (|delta| (|NonNegativeInteger|)) (Z (|polR|)) (L (|List| |polR|))
          (#3=#:G624 NIL) (|#G223| (|polR|)) (|#G224| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (SEQ
                 (PROGN
                  (LETT |#G219| Q)
                  (LETT |#G220| P)
                  (LETT P |#G219|)
                  (LETT Q |#G220|))
                 (EXIT
                  (COND
                   ((ODDP (SPADCALL P (QREFELT % 20)))
                    (COND
                     ((ODDP (SPADCALL Q (QREFELT % 20)))
                      (LETT Q (SPADCALL Q (QREFELT % 39)))))))))))
              (LETT L NIL)
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT % 20))) L)
                     ('T
                      (SEQ (LETT L (LIST Q))
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT % 19))
                                           (PROG1
                                               (LETT #1#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT % 20))
                                                      (SPADCALL Q
                                                                (QREFELT %
                                                                         20))))
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT % 33)))
                           (PROGN
                            (LETT |#G221| Q)
                            (LETT |#G222|
                                  (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                            (QREFELT % 48)))
                            (LETT P |#G221|)
                            (LETT Q |#G222|))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT % 31))
                                     (PROGN (LETT #3# L) (GO #4=#:G623)))
                                    ('T
                                     (SEQ (LETT L (CONS Q L))
                                          (LETT |delta|
                                                (PROG1
                                                    (LETT #2#
                                                          (-
                                                           (SPADCALL P
                                                                     (QREFELT %
                                                                              20))
                                                           (SPADCALL Q
                                                                     (QREFELT %
                                                                              20))))
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#)))
                                          (LETT Z
                                                (SPADCALL Q
                                                          (SPADCALL Q
                                                                    (QREFELT %
                                                                             19))
                                                          |s| |delta|
                                                          (QREFELT % 38)))
                                          (COND
                                           ((> |delta| 1) (LETT L (CONS Z L))))
                                          (EXIT
                                           (COND
                                            ((ZEROP
                                              (SPADCALL Z (QREFELT % 20)))
                                             (PROGN (LETT #3# L) (GO #4#)))
                                            ('T
                                             (SEQ
                                              (PROGN
                                               (LETT |#G223| Q)
                                               (LETT |#G224|
                                                     (SPADCALL P Q Z |s|
                                                               (QREFELT % 41)))
                                               (LETT P |#G223|)
                                               (LETT Q |#G224|))
                                              (EXIT
                                               (LETT |s|
                                                     (SPADCALL Z
                                                               (QREFELT %
                                                                        19)))))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |PRS;schema;2polRL;33|
        ((P (|polR|)) (Q (|polR|)) (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|#G227| (|polR|)) (|#G228| (|polR|)) (#1=#:G629 NIL)
          (|#G229| (|polR|)) (|#G230| (|polR|)) (|e| (|NonNegativeInteger|))
          (#2=#:G631 NIL) (|delta| (|NonNegativeInteger|)) (Z (|polR|))
          (L (|List| (|NonNegativeInteger|))) (#3=#:G639 NIL)
          (|#G231| (|polR|)) (|#G232| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT % 31)) (SPADCALL P (QREFELT % 31))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                (PROGN
                 (LETT |#G227| Q)
                 (LETT |#G228| P)
                 (LETT P |#G227|)
                 (LETT Q |#G228|))))
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT % 20))) (LIST 0))
                     ('T
                      (SEQ (LETT L NIL)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT % 19))
                                           (PROG1
                                               (LETT #1#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT % 20))
                                                      (SPADCALL Q
                                                                (QREFELT %
                                                                         20))))
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT % 33)))
                           (PROGN
                            (LETT |#G229| Q)
                            (LETT |#G230| (SPADCALL P Q (QREFELT % 48)))
                            (LETT P |#G229|)
                            (LETT Q |#G230|))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT % 31))
                                     (PROGN (LETT #3# L) (GO #4=#:G638)))
                                    ('T
                                     (SEQ
                                      (LETT |e| (SPADCALL Q (QREFELT % 20)))
                                      (LETT L (CONS |e| L))
                                      (LETT |delta|
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT %
                                                                          20))
                                                       |e|))
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#)))
                                      (LETT Z
                                            (SPADCALL Q
                                                      (SPADCALL Q
                                                                (QREFELT % 19))
                                                      |s| |delta|
                                                      (QREFELT % 38)))
                                      (COND
                                       ((> |delta| 1) (LETT L (CONS |e| L))))
                                      (EXIT
                                       (COND
                                        ((ZEROP |e|)
                                         (PROGN (LETT #3# L) (GO #4#)))
                                        ('T
                                         (SEQ
                                          (PROGN
                                           (LETT |#G231| Q)
                                           (LETT |#G232|
                                                 (SPADCALL P Q Z |s|
                                                           (QREFELT % 41)))
                                           (LETT P |#G231|)
                                           (LETT Q |#G232|))
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL Z
                                                           (QREFELT %
                                                                    19)))))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |PRS;subResultantGcd;3polR;34| ((P (|polR|)) (Q (|polR|)) (% (|polR|)))
        (SPROG
         ((|#G235| (|polR|)) (|#G236| (|polR|)) (#1=#:G644 NIL)
          (|#G237| (|polR|)) (|#G238| (|polR|)) (#2=#:G656 NIL) (#3=#:G646 NIL)
          (Z (|polR|)) (|#G239| (|polR|)) (|#G240| (|polR|)) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT % 31))
              (COND
               ((SPADCALL Q (QREFELT % 31)) (EXIT (|spadConstant| % 22))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT % 31)) Q)
                   ((SPADCALL Q (QREFELT % 31)) P)
                   (#4='T
                    (SEQ
                     (COND
                      ((< (SPADCALL P (QREFELT % 20))
                          (SPADCALL Q (QREFELT % 20)))
                       (PROGN
                        (LETT |#G235| Q)
                        (LETT |#G236| P)
                        (LETT P |#G235|)
                        (LETT Q |#G236|))))
                     (EXIT
                      (COND
                       ((ZEROP (SPADCALL Q (QREFELT % 20)))
                        (|spadConstant| % 35))
                       (#4#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT % 19))
                                         (PROG1
                                             (LETT #1#
                                                   (-
                                                    (SPADCALL P (QREFELT % 20))
                                                    (SPADCALL Q
                                                              (QREFELT % 20))))
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT % 33)))
                         (PROGN
                          (LETT |#G237| Q)
                          (LETT |#G238|
                                (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                          (QREFELT % 48)))
                          (LETT P |#G237|)
                          (LETT Q |#G238|))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL Q (QREFELT % 31))
                                   (PROGN (LETT #2# P) (GO #5=#:G655)))
                                  ((ZEROP (SPADCALL Q (QREFELT % 20)))
                                   (PROGN
                                    (LETT #2# (|spadConstant| % 35))
                                    (GO #5#)))
                                  ('T
                                   (SEQ
                                    (LETT Z
                                          (SPADCALL Q
                                                    (SPADCALL Q (QREFELT % 19))
                                                    |s|
                                                    (PROG1
                                                        (LETT #3#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          %
                                                                          20))
                                                               (SPADCALL Q
                                                                         (QREFELT
                                                                          %
                                                                          20))))
                                                      (|check_subtype2|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                                    (QREFELT % 38)))
                                    (PROGN
                                     (LETT |#G239| Q)
                                     (LETT |#G240|
                                           (SPADCALL P Q Z |s| (QREFELT % 41)))
                                     (LETT P |#G239|)
                                     (LETT Q |#G240|))
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL Z (QREFELT % 19)))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;subResultantGcdEuclidean;2polRR;35|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |gcd| |polR|))))
        (SPROG
         ((|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|)))
          (#1=#:G664 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G243| (|polR|)) (|#G244| (|polR|)) (|e| (|NonNegativeInteger|))
          (#2=#:G677 NIL) (#3=#:G667 NIL) (|ss| (R))
          (|#G245| #4=(|Vector| |polR|)) (|#G246| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #4#) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT % 31))
              (COND
               ((SPADCALL Q (QREFELT % 31))
                (EXIT
                 (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                         (|spadConstant| % 22)))))))
            (EXIT
             (COND
              ((SPADCALL P (QREFELT % 31))
               (VECTOR (|spadConstant| % 22) (|spadConstant| % 35) Q))
              ((SPADCALL Q (QREFELT % 31))
               (VECTOR (|spadConstant| % 35) (|spadConstant| % 22) P))
              (#5='T
               (SEQ
                (COND
                 ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                  (SEQ (LETT |l| (SPADCALL Q P (QREFELT % 78)))
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (VECTOR (QVELT |l| 1) (QVELT |l| 0)
                                       (QVELT |l| 2)))
                         (GO #6=#:G676))))))
                (EXIT
                 (COND
                  ((ZEROP (SPADCALL Q (QREFELT % 20)))
                   (VECTOR (|spadConstant| % 22) (|spadConstant| % 35) Q))
                  (#5#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT % 19))
                                    (PROG1
                                        (LETT #1#
                                              (- (SPADCALL P (QREFELT % 20))
                                                 (SPADCALL Q (QREFELT % 20))))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT % 33)))
                    (LETT VP
                          (VECTOR Q (|spadConstant| % 22)
                                  (|spadConstant| % 35)))
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                    (QREFELT % 52)))
                    (LETT VQ
                          (VECTOR (QVELT |pdiv| 2)
                                  (SPADCALL (QVELT |pdiv| 0) (QREFELT % 12))
                                  (QVELT |pdiv| 1)))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G243| (SPADCALL VP 1 (QREFELT % 43)))
                            (LETT |#G244| (SPADCALL VQ 1 (QREFELT % 43)))
                            (LETT P |#G243|)
                            (LETT Q |#G244|))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT % 31))
                              (PROGN
                               (LETT #2#
                                     (VECTOR (SPADCALL VP 2 (QREFELT % 43))
                                             (SPADCALL VP 3 (QREFELT % 43)) P))
                               (GO #6#)))
                             ('T
                              (SEQ (LETT |e| (SPADCALL Q (QREFELT % 20)))
                                   (EXIT
                                    (COND
                                     ((ZEROP |e|)
                                      (PROGN
                                       (LETT #2#
                                             (VECTOR
                                              (SPADCALL VQ 2 (QREFELT % 43))
                                              (SPADCALL VQ 3 (QREFELT % 43))
                                              Q))
                                       (GO #6#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL Q (QREFELT % 19)) |s|
                                              (PROG1
                                                  (LETT #3#
                                                        (-
                                                         (SPADCALL P
                                                                   (QREFELT %
                                                                            20))
                                                         |e|))
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (QREFELT % 37)))
                                       (PROGN
                                        (LETT |#G245| VQ)
                                        (LETT |#G246|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| %))
                                        (LETT VP |#G245|)
                                        (LETT VQ |#G246|))
                                       (EXIT (LETT |s| |ss|)))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean2;2polRR;36|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |gcd| |polR|))))
        (SPROG
         ((#1=#:G682 NIL)
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (|#G249| (|polR|)) (|#G250| (|polR|)) (|e| (|NonNegativeInteger|))
          (#2=#:G697 NIL) (#3=#:G685 NIL) (|ss| (R))
          (|#G251| #4=(|Vector| |polR|)) (|#G252| (|Vector| |polR|))
          (VP (|Vector| |polR|)) (VQ #4#) (|s| (R)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT % 31))
              (COND
               ((SPADCALL Q (QREFELT % 31))
                (EXIT (CONS (|spadConstant| % 22) (|spadConstant| % 22)))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT % 31)) (CONS (|spadConstant| % 35) Q))
                   ((SPADCALL Q (QREFELT % 31)) (CONS (|spadConstant| % 22) P))
                   ((< (SPADCALL P (QREFELT % 20)) (SPADCALL Q (QREFELT % 20)))
                    (|error|
                     "semiSubResultantGcdEuclidean2$PRS : bad degrees"))
                   ((ZEROP (SPADCALL Q (QREFELT % 20)))
                    (CONS (|spadConstant| % 35) Q))
                   ('T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT % 19))
                                     (PROG1
                                         (LETT #1#
                                               (- (SPADCALL P (QREFELT % 20))
                                                  (SPADCALL Q (QREFELT % 20))))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT % 33)))
                     (LETT VP (VECTOR Q (|spadConstant| % 35)))
                     (LETT |pdiv|
                           (SPADCALL P (SPADCALL Q (QREFELT % 39))
                                     (QREFELT % 52)))
                     (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)))
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (PROGN
                             (LETT |#G249| (SPADCALL VP 1 (QREFELT % 43)))
                             (LETT |#G250| (SPADCALL VQ 1 (QREFELT % 43)))
                             (LETT P |#G249|)
                             (LETT Q |#G250|))
                            (EXIT
                             (COND
                              ((SPADCALL Q (QREFELT % 31))
                               (PROGN
                                (LETT #2#
                                      (CONS (SPADCALL VP 2 (QREFELT % 43)) P))
                                (GO #5=#:G696)))
                              ('T
                               (SEQ (LETT |e| (SPADCALL Q (QREFELT % 20)))
                                    (EXIT
                                     (COND
                                      ((ZEROP |e|)
                                       (PROGN
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL VQ 2 (QREFELT % 43))
                                               Q))
                                        (GO #5#)))
                                      ('T
                                       (SEQ
                                        (LETT |ss|
                                              (SPADCALL
                                               (SPADCALL Q (QREFELT % 19)) |s|
                                               (PROG1
                                                   (LETT #3#
                                                         (-
                                                          (SPADCALL P
                                                                    (QREFELT %
                                                                             20))
                                                          |e|))
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#))
                                               (QREFELT % 37)))
                                        (PROGN
                                         (LETT |#G251| VQ)
                                         (LETT |#G252|
                                               (|PRS;next_sousResultant3| VP VQ
                                                |s| |ss| %))
                                         (LETT VP |#G251|)
                                         (LETT VQ |#G252|))
                                        (EXIT (LETT |s| |ss|)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean1;2polRR;37|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef1| |polR|) (|:| |gcd| |polR|))))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ (LETT |result| (SPADCALL P Q (QREFELT % 78)))
              (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;discriminant;polRR;38| ((P (|polR|)) (% (R)))
        (SPROG
         ((#1=#:G703 NIL) (|a| (|Integer|)) (|dP| (|polR|)) (|r| (R))
          (|d| (|Integer|)) (#2=#:G705 NIL) (#3=#:G709 NIL) (#4=#:G714 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |d| (SPADCALL P (QREFELT % 20)))
                (EXIT
                 (COND
                  ((ZEROP |d|)
                   (|error| "cannot take discriminant of constants"))
                  (#5='T
                   (SEQ (LETT |a| (|quotient_INT| (* |d| (- |d| 1)) 2))
                        (LETT |a|
                              (EXPT -1
                                    (PROG1 (LETT #1# |a|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))))
                        (LETT |dP| (SPADCALL P (QREFELT % 83)))
                        (LETT |r| (SPADCALL P |dP| (QREFELT % 50)))
                        (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT % 20))) 1))
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (COND
                                 ((ZEROP |d|)
                                  (SPADCALL |a|
                                            (PROG2
                                                (LETT #2#
                                                      (SPADCALL |r|
                                                                (SPADCALL P
                                                                          (QREFELT
                                                                           %
                                                                           19))
                                                                (QREFELT %
                                                                         24)))
                                                (QCDR #2#)
                                              (|check_union2| (QEQCAR #2# 0)
                                                              (QREFELT % 6)
                                                              (|Union|
                                                               (QREFELT % 6)
                                                               "failed")
                                                              #2#))
                                            (QREFELT % 84)))
                                 (#5#
                                  (SPADCALL (SPADCALL |a| |r| (QREFELT % 84))
                                            (SPADCALL
                                             (SPADCALL P (QREFELT % 19))
                                             (PROG1 (LETT #3# (- |d| 1))
                                               (|check_subtype2| (>= #3# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #3#))
                                             (QREFELT % 33))
                                            (QREFELT % 34)))))
                          (GO #6=#:G713)))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |PRS;discriminantEuclidean;polRR;39|
        ((P (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |discriminant| R))))
        (SPROG
         ((#1=#:G716 NIL) (|a| (|Integer|)) (|dP| (|polR|))
          (|rE|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|d| (|Integer|)) (#2=#:G718 NIL) (#3=#:G721 NIL) (#4=#:G727 NIL)
          (|c1| (|polR|)) (#5=#:G731 NIL) (|c2| (|polR|)) (#6=#:G734 NIL)
          (|cr| (R)) (#7=#:G741 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |d| (SPADCALL P (QREFELT % 20)))
                (EXIT
                 (COND
                  ((ZEROP |d|)
                   (|error| "cannot take discriminant of constants"))
                  (#8='T
                   (SEQ (LETT |a| (|quotient_INT| (* |d| (- |d| 1)) 2))
                        (LETT |a|
                              (EXPT -1
                                    (PROG1 (LETT #1# |a|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))))
                        (LETT |dP| (SPADCALL P (QREFELT % 83)))
                        (LETT |rE| (SPADCALL P |dP| (QREFELT % 55)))
                        (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT % 20))) 1))
                        (COND
                         ((ZEROP |d|)
                          (SEQ
                           (LETT |c1|
                                 (SPADCALL |a|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL (QVELT |rE| 0)
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          %
                                                                          19))
                                                               (QREFELT % 16)))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (QREFELT % 7)
                                                             (|Union|
                                                              (QREFELT % 7)
                                                              #9="failed")
                                                             #2#))
                                           (QREFELT % 53)))
                           (LETT |c2|
                                 (SPADCALL |a|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL (QVELT |rE| 1)
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          %
                                                                          19))
                                                               (QREFELT % 16)))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (QREFELT % 7)
                                                             (|Union|
                                                              (QREFELT % 7)
                                                              #9#)
                                                             #2#))
                                           (QREFELT % 53)))
                           (EXIT
                            (LETT |cr|
                                  (SPADCALL |a|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL (QVELT |rE| 2)
                                                                (SPADCALL P
                                                                          (QREFELT
                                                                           %
                                                                           19))
                                                                (QREFELT %
                                                                         24)))
                                                (QCDR #3#)
                                              (|check_union2| (QEQCAR #3# 0)
                                                              (QREFELT % 6)
                                                              (|Union|
                                                               (QREFELT % 6)
                                                               "failed")
                                                              #3#))
                                            (QREFELT % 84))))))
                         (#8#
                          (SEQ
                           (LETT |c1|
                                 (SPADCALL
                                  (SPADCALL |a| (QVELT |rE| 0) (QREFELT % 53))
                                  (SPADCALL (SPADCALL P (QREFELT % 19))
                                            (PROG1 (LETT #4# (- |d| 1))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 33))
                                  (QREFELT % 86)))
                           (LETT |c2|
                                 (SPADCALL
                                  (SPADCALL |a| (QVELT |rE| 1) (QREFELT % 53))
                                  (SPADCALL (SPADCALL P (QREFELT % 19))
                                            (PROG1 (LETT #5# (- |d| 1))
                                              (|check_subtype2| (>= #5# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #5#))
                                            (QREFELT % 33))
                                  (QREFELT % 86)))
                           (EXIT
                            (LETT |cr|
                                  (SPADCALL
                                   (SPADCALL |a| (QVELT |rE| 2) (QREFELT % 84))
                                   (SPADCALL (SPADCALL P (QREFELT % 19))
                                             (PROG1 (LETT #6# (- |d| 1))
                                               (|check_subtype2| (>= #6# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #6#))
                                             (QREFELT % 33))
                                   (QREFELT % 34)))))))
                        (EXIT
                         (PROGN
                          (LETT #7# (VECTOR |c1| |c2| |cr|))
                          (GO #10=#:G740)))))))))
          #10# (EXIT #7#)))) 

(SDEFUN |PRS;semiDiscriminantEuclidean;polRR;40|
        ((P (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |discriminant| R))))
        (SPROG
         ((#1=#:G743 NIL) (|a| (|Integer|)) (|dP| (|polR|))
          (|rE| (|Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
          (|d| (|Integer|)) (#2=#:G745 NIL) (#3=#:G748 NIL) (#4=#:G754 NIL)
          (|c2| (|polR|)) (#5=#:G757 NIL) (|cr| (R)) (#6=#:G764 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |d| (SPADCALL P (QREFELT % 20)))
                (EXIT
                 (COND
                  ((ZEROP |d|)
                   (|error| "cannot take discriminant of constants"))
                  (#7='T
                   (SEQ (LETT |a| (|quotient_INT| (* |d| (- |d| 1)) 2))
                        (LETT |a|
                              (EXPT -1
                                    (PROG1 (LETT #1# |a|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))))
                        (LETT |dP| (SPADCALL P (QREFELT % 83)))
                        (LETT |rE| (SPADCALL P |dP| (QREFELT % 57)))
                        (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT % 20))) 1))
                        (COND
                         ((ZEROP |d|)
                          (SEQ
                           (LETT |c2|
                                 (SPADCALL |a|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL (QCAR |rE|)
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          %
                                                                          19))
                                                               (QREFELT % 16)))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (QREFELT % 7)
                                                             (|Union|
                                                              (QREFELT % 7)
                                                              "failed")
                                                             #2#))
                                           (QREFELT % 53)))
                           (EXIT
                            (LETT |cr|
                                  (SPADCALL |a|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL (QCDR |rE|)
                                                                (SPADCALL P
                                                                          (QREFELT
                                                                           %
                                                                           19))
                                                                (QREFELT %
                                                                         24)))
                                                (QCDR #3#)
                                              (|check_union2| (QEQCAR #3# 0)
                                                              (QREFELT % 6)
                                                              (|Union|
                                                               (QREFELT % 6)
                                                               "failed")
                                                              #3#))
                                            (QREFELT % 84))))))
                         (#7#
                          (SEQ
                           (LETT |c2|
                                 (SPADCALL
                                  (SPADCALL |a| (QCAR |rE|) (QREFELT % 53))
                                  (SPADCALL (SPADCALL P (QREFELT % 19))
                                            (PROG1 (LETT #4# (- |d| 1))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 33))
                                  (QREFELT % 86)))
                           (EXIT
                            (LETT |cr|
                                  (SPADCALL
                                   (SPADCALL |a| (QCDR |rE|) (QREFELT % 84))
                                   (SPADCALL (SPADCALL P (QREFELT % 19))
                                             (PROG1 (LETT #5# (- |d| 1))
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             (QREFELT % 33))
                                   (QREFELT % 34)))))))
                        (EXIT
                         (PROGN
                          (LETT #6# (CONS |c2| |cr|))
                          (GO #8=#:G763)))))))))
          #8# (EXIT #6#)))) 

(SDEFUN |PRS;resultantReduit;2polRR;41| ((P (|polR|)) (Q (|polR|)) (% (R)))
        (SPROG
         ((UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|)))
          (|UVs| (|polR|)) (|l| (|List| R)) (#1=#:G767 NIL) (#2=#:G772 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT UV (SPADCALL P Q (QREFELT % 78)))
                (LETT |UVs| (QVELT UV 2))
                (EXIT
                 (COND
                  ((> (SPADCALL |UVs| (QREFELT % 20)) 0) (|spadConstant| % 21))
                  ('T
                   (SEQ
                    (LETT |l|
                          (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT % 92))
                                    (SPADCALL (QVELT UV 1) (QREFELT % 92))
                                    (QREFELT % 93)))
                    (EXIT
                     (PROGN
                      (LETT #2#
                            (PROG2
                                (LETT #1#
                                      (SPADCALL (SPADCALL |UVs| (QREFELT % 19))
                                                (SPADCALL |l| (QREFELT % 95))
                                                (QREFELT % 24)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                              (|Union| (QREFELT % 6) "failed")
                                              #1#)))
                      (GO #3=#:G771)))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |PRS;resultantReduitEuclidean;2polRR;42|
        ((P (|polR|)) (Q (|polR|))
         (%
          (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                    (|:| |resultantReduit| R))))
        (SPROG
         ((UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|)))
          (|UVs| (|polR|)) (|l| (|List| R)) (|gl| (R)) (|c1| (|polR|))
          (#1=#:G776 NIL) (|c2| (|polR|)) (#2=#:G779 NIL) (|rr| (R))
          (#3=#:G785 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT UV (SPADCALL P Q (QREFELT % 78)))
                (LETT |UVs| (QVELT UV 2))
                (EXIT
                 (COND
                  ((> (SPADCALL |UVs| (QREFELT % 20)) 0)
                   (VECTOR (|spadConstant| % 22) (|spadConstant| % 22)
                           (|spadConstant| % 21)))
                  ('T
                   (SEQ
                    (LETT |l|
                          (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT % 92))
                                    (SPADCALL (QVELT UV 1) (QREFELT % 92))
                                    (QREFELT % 93)))
                    (LETT |gl| (SPADCALL |l| (QREFELT % 95)))
                    (LETT |c1|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (QVELT UV 0) |gl|
                                              (QREFELT % 16)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                            (|Union| (QREFELT % 7) #4="failed")
                                            #1#)))
                    (LETT |c2|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (QVELT UV 1) |gl|
                                              (QREFELT % 16)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                            (|Union| (QREFELT % 7) #4#) #1#)))
                    (LETT |rr|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (SPADCALL |UVs| (QREFELT % 19))
                                              |gl| (QREFELT % 24)))
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT % 6)
                                            (|Union| (QREFELT % 6) "failed")
                                            #2#)))
                    (EXIT
                     (PROGN
                      (LETT #3# (VECTOR |c1| |c2| |rr|))
                      (GO #5=#:G784)))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |PRS;semiResultantReduitEuclidean;2polRR;43|
        ((P (|polR|)) (Q (|polR|))
         (% (|Record| (|:| |coef2| |polR|) (|:| |resultantReduit| R))))
        (SPROG
         ((UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|)))
          (|UVs| (|polR|)) (|l| (|List| R)) (|gl| (R)) (#1=#:G789 NIL)
          (|c2| (|polR|)) (#2=#:G792 NIL) (|rr| (R)) (#3=#:G798 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT UV (SPADCALL P Q (QREFELT % 78)))
                (LETT |UVs| (QVELT UV 2))
                (EXIT
                 (COND
                  ((> (SPADCALL |UVs| (QREFELT % 20)) 0)
                   (CONS (|spadConstant| % 22) (|spadConstant| % 21)))
                  ('T
                   (SEQ
                    (LETT |l|
                          (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT % 92))
                                    (SPADCALL (QVELT UV 1) (QREFELT % 92))
                                    (QREFELT % 93)))
                    (LETT |gl| (SPADCALL |l| (QREFELT % 95)))
                    (LETT |c2|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (QVELT UV 1) |gl|
                                              (QREFELT % 16)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                            (|Union| (QREFELT % 7) "failed")
                                            #1#)))
                    (LETT |rr|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (SPADCALL |UVs| (QREFELT % 19))
                                              |gl| (QREFELT % 24)))
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT % 6)
                                            (|Union| (QREFELT % 6) "failed")
                                            #2#)))
                    (EXIT
                     (PROGN (LETT #3# (CONS |c2| |rr|)) (GO #4=#:G797)))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |PRS;gcd_naif| ((P (|polR|)) (Q (|polR|)) (% (|polR|)))
        (SPROG
         ((#1=#:G800 NIL) (#2=#:G809 NIL) (|#G271| (|polR|))
          (|#G272| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL P (QREFELT % 31))
             (PROG2
                 (LETT #1#
                       (SPADCALL Q (SPADCALL Q (QREFELT % 19)) (QREFELT % 16)))
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                               (|Union| (QREFELT % 7) #3="failed") #1#)))
            ('T
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT % 31))
                      (PROGN
                       (LETT #2#
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL P (SPADCALL P (QREFELT % 19))
                                                 (QREFELT % 16)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                               (|Union| (QREFELT % 7) #3#)
                                               #1#)))
                       (GO #4=#:G808)))
                     ((ZEROP (SPADCALL Q (QREFELT % 20)))
                      (PROGN (LETT #2# (|spadConstant| % 35)) (GO #4#)))
                     ('T
                      (PROGN
                       (LETT |#G271| Q)
                       (LETT |#G272| (QCDR (SPADCALL P Q (QREFELT % 29))))
                       (LETT P |#G271|)
                       (LETT Q |#G272|))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |PRS;gcd;3polR;45| ((P (|polR|)) (Q (|polR|)) (% (|polR|)))
        (|PRS;gcd_naif| P Q %)) 

(SDEFUN |PRS;gcd;3polR;46| ((P (|polR|)) (Q (|polR|)) (% (|polR|)))
        (SPROG ((|cP| (R)) (|cQ| (R)) (#1=#:G812 NIL) (G (|polR|)))
               (SEQ
                (COND ((SPADCALL P (QREFELT % 31)) Q)
                      ((SPADCALL Q (QREFELT % 31)) P)
                      ('T
                       (SEQ (LETT |cP| (SPADCALL P (QREFELT % 102)))
                            (LETT |cQ| (SPADCALL Q (QREFELT % 102)))
                            (LETT P
                                  (PROG2
                                      (LETT #1#
                                            (SPADCALL P |cP| (QREFELT % 16)))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT % 7)
                                                    (|Union| (QREFELT % 7)
                                                             #2="failed")
                                                    #1#)))
                            (LETT Q
                                  (PROG2
                                      (LETT #1#
                                            (SPADCALL Q |cQ| (QREFELT % 16)))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT % 7)
                                                    (|Union| (QREFELT % 7) #2#)
                                                    #1#)))
                            (LETT G (SPADCALL P Q (QREFELT % 76)))
                            (EXIT
                             (SPADCALL (SPADCALL |cP| |cQ| (QREFELT % 103))
                                       (SPADCALL G (QREFELT % 104))
                                       (QREFELT % 36))))))))) 

(DECLAIM (NOTINLINE |PseudoRemainderSequence;|)) 

(DEFUN |PseudoRemainderSequence;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PseudoRemainderSequence| DV$1 DV$2))
          (LETT % (GETREFV 105))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))))
          (|haddProp| |$ConstructorCache| '|PseudoRemainderSequence|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL (|spadConstant| % 8) 1 (QREFELT % 10)))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV % 50
                      (CONS (|dispatchFunction| |PRS;resultant;2polRR;14|) %)))
           ('T
            (QSETREFV % 50
                      (CONS (|dispatchFunction| |PRS;resultant;2polRR;15|)
                            %))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV % 55
                      (CONS
                       (|dispatchFunction| |PRS;resultantEuclidean;2polRR;17|)
                       %)))
           ('T
            (QSETREFV % 55
                      (CONS
                       (|dispatchFunction| |PRS;resultantEuclidean;2polRR;18|)
                       %))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV % 57
                      (CONS
                       (|dispatchFunction|
                        |PRS;semiResultantEuclidean2;2polRR;20|)
                       %)))
           ('T
            (QSETREFV % 57
                      (CONS
                       (|dispatchFunction|
                        |PRS;semiResultantEuclidean2;2polRR;21|)
                       %))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 96
                       (CONS
                        (|dispatchFunction| |PRS;resultantReduit;2polRR;41|)
                        %))
             (QSETREFV % 98
                       (CONS
                        (|dispatchFunction|
                         |PRS;resultantReduitEuclidean;2polRR;42|)
                        %))
             (QSETREFV % 100
                       (CONS
                        (|dispatchFunction|
                         |PRS;semiResultantReduitEuclidean;2polRR;43|)
                        %))
             (COND
              ((|HasCategory| |#1| '(|FiniteFieldCategory|))
               (QSETREFV % 101
                         (CONS (|dispatchFunction| |PRS;gcd;3polR;45|) %)))
              ('T
               (QSETREFV % 101
                         (CONS (|dispatchFunction| |PRS;gcd;3polR;46|) %)))))))
          %))) 

(DEFUN |PseudoRemainderSequence| (&REST #1=#:G818)
  (SPROG NIL
         (PROG (#2=#:G819)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PseudoRemainderSequence|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PseudoRemainderSequence;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PseudoRemainderSequence|)))))))))) 

(MAKEPROP '|PseudoRemainderSequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |1|)
              (|NonNegativeInteger|) (4 . |monomial|) 'X (10 . |coerce|)
              (|Vector| 7) (15 . *) (|Union| % '"failed") (21 . |exquo|)
              (|Mapping| 7 7) (27 . |map|) (33 . |leadingCoefficient|)
              (38 . |degree|) (43 . |0|) (47 . |0|) (51 . |reductum|)
              (56 . |exquo|) (62 . +) (68 . *) (74 . -)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;divide;2polRR;3| (|Boolean|) (80 . |zero?|) (85 . -)
              (90 . ^) (96 . *) (102 . |1|) (106 . *)
              |PRS;LazardQuotient;2RNniR;8|
              |PRS;LazardQuotient2;polR2RNnipolR;9| (112 . -)
              (117 . |coefficient|) |PRS;next_sousResultant2;3polRRpolR;11|
              (|Integer|) (123 . |elt|) (129 . -) (135 . +) (141 . |setelt!|)
              (148 . -) (153 . |pseudoRemainder|) (159 . ^) (165 . |resultant|)
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (171 . |pseudoDivide|) (177 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |resultant| 6))
              (183 . |resultantEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultant| 6))
              (189 . |semiResultantEuclidean2|)
              (|Record| (|:| |coef1| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean1;2polRR;22|
              |PRS;indiceSubResultant;2polRNnipolR;23|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;indiceSubResultantEuclidean;2polRNniR;24|
              (|Record| (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;semiIndiceSubResultantEuclidean;2polRNniR;25|
              |PRS;degreeSubResultant;2polRNnipolR;26|
              |PRS;degreeSubResultantEuclidean;2polRNniR;27|
              |PRS;semiDegreeSubResultantEuclidean;2polRNniR;28|
              |PRS;lastSubResultant;3polR;29|
              |PRS;lastSubResultantEuclidean;2polRR;30| (195 . |copy|)
              |PRS;semiLastSubResultantEuclidean;2polRR;31| (|List| 7)
              |PRS;chainSubResultants;2polRL;32| (|List| 9)
              |PRS;schema;2polRL;33| |PRS;subResultantGcd;3polR;34|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;subResultantGcdEuclidean;2polRR;35|
              (|Record| (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean2;2polRR;36|
              (|Record| (|:| |coef1| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean1;2polRR;37|
              (200 . |differentiate|) (205 . *) |PRS;discriminant;polRR;38|
              (211 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;discriminantEuclidean;polRR;39|
              (|Record| (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;semiDiscriminantEuclidean;polRR;40| (|List| 6)
              (217 . |coefficients|) (222 . |concat|) (|List| %) (228 . |gcd|)
              (233 . |resultantReduit|)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7)
                        (|:| |resultantReduit| 6))
              (239 . |resultantReduitEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultantReduit| 6))
              (245 . |semiResultantReduitEuclidean|) (251 . |gcd|)
              (257 . |content|) (262 . |gcd|) (268 . |primitivePart|))
           '#(|subResultantGcdEuclidean| 273 |subResultantGcd| 279
              |semiSubResultantGcdEuclidean2| 285
              |semiSubResultantGcdEuclidean1| 291
              |semiResultantReduitEuclidean| 297 |semiResultantEuclidean2| 303
              |semiResultantEuclidean1| 309 |semiLastSubResultantEuclidean| 315
              |semiIndiceSubResultantEuclidean| 321 |semiDiscriminantEuclidean|
              328 |semiDegreeSubResultantEuclidean| 333 |schema| 340
              |resultantReduitEuclidean| 346 |resultantReduit| 352
              |resultantEuclidean| 358 |resultant| 364 |next_sousResultant2|
              370 |lastSubResultantEuclidean| 378 |lastSubResultant| 384
              |indiceSubResultantEuclidean| 390 |indiceSubResultant| 397 |gcd|
              404 |divide| 410 |discriminantEuclidean| 416 |discriminant| 421
              |degreeSubResultantEuclidean| 426 |degreeSubResultant| 433
              |chainSubResultants| 440 |LazardQuotient2| 446 |LazardQuotient|
              454)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|resultant| (|#1| |#2| |#2|)) T)
                                   '((|resultantEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |resultant| |#1|))
                                       |#2| |#2|))
                                     T)
                                   '((|semiResultantEuclidean2|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |resultant| |#1|))
                                       |#2| |#2|))
                                     T)
                                   '((|semiResultantEuclidean1|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |resultant| |#1|))
                                       |#2| |#2|))
                                     T)
                                   '((|indiceSubResultant|
                                      (|#2| |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|indiceSubResultantEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|semiIndiceSubResultantEuclidean|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|degreeSubResultant|
                                      (|#2| |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|degreeSubResultantEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|semiDegreeSubResultantEuclidean|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2| (|NonNegativeInteger|)))
                                     T)
                                   '((|lastSubResultant| (|#2| |#2| |#2|)) T)
                                   '((|lastSubResultantEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|semiLastSubResultantEuclidean|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |subResultant| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|subResultantGcd| (|#2| |#2| |#2|)) T)
                                   '((|subResultantGcdEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |gcd| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|semiSubResultantGcdEuclidean2|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |gcd| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|semiSubResultantGcdEuclidean1|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |gcd| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|discriminant| (|#1| |#2|)) T)
                                   '((|discriminantEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |discriminant| |#1|))
                                       |#2|))
                                     T)
                                   '((|semiDiscriminantEuclidean|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |discriminant| |#1|))
                                       |#2|))
                                     T)
                                   '((|chainSubResultants|
                                      ((|List| |#2|) |#2| |#2|))
                                     T)
                                   '((|schema|
                                      ((|List| (|NonNegativeInteger|)) |#2|
                                       |#2|))
                                     T)
                                   '((|resultantReduit| (|#1| |#2| |#2|))
                                     (|has| 6 (|GcdDomain|)))
                                   '((|resultantReduitEuclidean|
                                      ((|Record| (|:| |coef1| |#2|)
                                                 (|:| |coef2| |#2|)
                                                 (|:| |resultantReduit| |#1|))
                                       |#2| |#2|))
                                     (|has| 6 (|GcdDomain|)))
                                   '((|semiResultantReduitEuclidean|
                                      ((|Record| (|:| |coef2| |#2|)
                                                 (|:| |resultantReduit| |#1|))
                                       |#2| |#2|))
                                     (|has| 6 (|GcdDomain|)))
                                   '((|gcd| (|#2| |#2| |#2|))
                                     (|has| 6 (|GcdDomain|)))
                                   '((|divide|
                                      ((|Record| (|:| |quotient| |#2|)
                                                 (|:| |remainder| |#2|))
                                       |#2| |#2|))
                                     T)
                                   '((|LazardQuotient|
                                      (|#1| |#1| |#1| (|NonNegativeInteger|)))
                                     T)
                                   '((|LazardQuotient2|
                                      (|#2| |#2| |#1| |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|next_sousResultant2|
                                      (|#2| |#2| |#2| |#2| |#1|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 104
                                            '(0 6 0 8 2 7 0 6 9 10 1 7 0 6 12 2
                                              13 0 7 0 14 2 7 15 0 6 16 2 13 0
                                              17 0 18 1 7 6 0 19 1 7 9 0 20 0 6
                                              0 21 0 7 0 22 1 7 0 0 23 2 6 15 0
                                              0 24 2 7 0 0 0 25 2 7 0 0 0 26 2
                                              7 0 0 0 27 1 7 30 0 31 1 6 0 0 32
                                              2 6 0 0 9 33 2 6 0 0 0 34 0 7 0
                                              35 2 7 0 6 0 36 1 7 0 0 39 2 7 6
                                              0 9 40 2 13 7 0 42 43 2 13 0 0 0
                                              44 2 13 0 0 0 45 3 13 7 0 42 7 46
                                              1 13 0 0 47 2 7 0 0 0 48 2 6 0 0
                                              42 49 2 0 6 7 7 50 2 7 51 0 0 52
                                              2 7 0 42 0 53 2 0 54 7 7 55 2 0
                                              56 7 7 57 1 13 0 0 70 1 7 0 0 83
                                              2 6 0 42 0 84 2 7 0 0 6 86 1 7 91
                                              0 92 2 91 0 0 0 93 1 6 0 94 95 2
                                              0 6 7 7 96 2 0 97 7 7 98 2 0 99 7
                                              7 100 2 0 7 7 7 101 1 7 6 0 102 2
                                              6 0 0 0 103 1 7 0 0 104 2 0 77 7
                                              7 78 2 0 7 7 7 76 2 0 79 7 7 80 2
                                              0 81 7 7 82 2 1 99 7 7 100 2 0 56
                                              7 7 57 2 0 58 7 7 59 2 0 63 7 7
                                              71 3 0 63 7 7 9 64 1 0 89 7 90 3
                                              0 63 7 7 9 67 2 0 74 7 7 75 2 1
                                              97 7 7 98 2 1 6 7 7 96 2 0 54 7 7
                                              55 2 0 6 7 7 50 4 0 7 7 7 7 6 41
                                              2 0 61 7 7 69 2 0 7 7 7 68 3 0 61
                                              7 7 9 62 3 0 7 7 7 9 60 2 1 7 7 7
                                              101 2 0 28 7 7 29 1 0 87 7 88 1 0
                                              6 7 85 3 0 61 7 7 9 66 3 0 7 7 7
                                              9 65 2 0 72 7 7 73 4 0 7 7 6 6 9
                                              38 3 0 6 6 6 9 37)))))
           '|lookupComplete|)) 
