
(SDEFUN |ALGSC;listOfTerms;%L;1|
        ((|x| (%))
         (%
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
          (|c| (R)) (#1=#:G50 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (LETT |res|
                                 (CONS (CONS (SPADCALL |i| (QREFELT % 18)) |c|)
                                       |res|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |ALGSC;numberOfMonomials;%Nni;2| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|c| (R)) (#1=#:G56 NIL) (|i| NIL))
         (SEQ (LETT |res| 0)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (LETT |res| (+ |res| 1))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGSC;monomial?;%B;3| ((X (%)) (% (|Boolean|)))
        (EQL (SPADCALL |x| (QREFELT % 23)) 1)) 

(SDEFUN |ALGSC;leadingTerm;%R;4|
        ((|x| (%))
         (% (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
        (SPROG ((#1=#:G64 NIL) (|c| (R)) (#2=#:G65 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                            (EXIT
                             (COND
                              ((SPADCALL |c| (|spadConstant| % 13)
                                         (QREFELT % 15))
                               (PROGN
                                (LETT #1#
                                      (CONS (SPADCALL |i| (QREFELT % 18)) |c|))
                                (GO #3=#:G63))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|error| "can not take leadingTerm of zero element"))))
                #3# (EXIT #1#)))) 

(SDEFUN |ALGSC;linearExtend;M%R;5|
        ((|f| (|Mapping| R (|OrderedVariableList| |ls|))) (|x| (%)) (% (R)))
        (SPROG ((|res| (R)) (|c| (R)) (#1=#:G72 NIL) (|i| NIL))
               (SEQ (LETT |res| (|spadConstant| % 13))
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                              (EXIT
                               (COND
                                ((SPADCALL |c| (|spadConstant| % 13)
                                           (QREFELT % 15))
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |c|
                                                           (SPADCALL
                                                            (SPADCALL |i|
                                                                      (QREFELT
                                                                       % 18))
                                                            |f|)
                                                           (QREFELT % 26))
                                                 (QREFELT % 27)))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ALGSC;reductum;2%;6| ((|x| (%)) (% (%)))
        (SPROG
         ((|first| (|Boolean|)) (|c| (R)) (#1=#:G78 NIL) (|i| NIL)
          (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (LETT |first| 'T)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (COND (|first| (LETT |first| NIL))
                                 ('T
                                  (SPADCALL |v| |i|
                                            (SPADCALL |x| |i| (QREFELT % 12))
                                            (QREFELT % 31))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;construct;L%;7|
        ((|l|
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
         (% (%)))
        (SPROG
         ((|i| (|PositiveInteger|)) (#1=#:G85 NIL) (|el| NIL)
          (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i| (SPADCALL (QCAR |el|) (QREFELT % 34)))
                        (EXIT (SPADCALL |v| |i| (QCDR |el|) (QREFELT % 31))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;coefficient;%OvlR;8|
        ((|x| (%)) (|v| (|OrderedVariableList| |ls|)) (% (R)))
        (SPADCALL |x| (SPADCALL |v| (QREFELT % 34)) (QREFELT % 12))) 

(SDEFUN |ALGSC;linearExtend;M%R;9|
        ((|f| (|Mapping| R (|OrderedVariableList| |ls|))) (|x| (%)) (% (R)))
        (SPROG ((|res| (R)) (|c| (R)) (#1=#:G92 NIL) (|i| NIL))
               (SEQ (LETT |res| (|spadConstant| % 13))
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                              (EXIT
                               (COND
                                ((SPADCALL |c| (|spadConstant| % 13)
                                           (QREFELT % 15))
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |c|
                                                           (SPADCALL
                                                            (SPADCALL |i|
                                                                      (QREFELT
                                                                       % 18))
                                                            |f|)
                                                           (QREFELT % 26))
                                                 (QREFELT % 27)))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ALGSC;constructOrdered;L%;10|
        ((|l|
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
         (% (%)))
        (SPADCALL |l| (QREFELT % 35))) 

(SDEFUN |ALGSC;monomial;ROvl%;11|
        ((|c| (R)) (|s| (|OrderedVariableList| |ls|)) (% (%)))
        (SPROG ((|v| (|Vector| R)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
                    (SPADCALL |v| (SPADCALL |s| (QREFELT % 34)) |c|
                              (QREFELT % 31))
                    (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;recip;%U;12| ((|x| (%)) (% (|Union| % "failed")))
        (SPADCALL |x| (QREFELT % 41))) 

(SDEFUN |ALGSC;*;Sm2%;13| ((|m| (|SquareMatrix| |n| R)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |m| (QREFELT % 45)) |x| (QREFELT % 46))) 

(SDEFUN |ALGSC;coerce;V%;14| ((|v| (|Vector| R)) (% (%)))
        (SPADCALL |v| (QREFELT % 32))) 

(SDEFUN |ALGSC;structuralConstants;V;15| ((% (|Vector| (|Matrix| R))))
        (QREFELT % 9)) 

(SDEFUN |ALGSC;coordinates;%V;16| ((|x| (%)) (% (|Vector| R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 52)) (QREFELT % 53))) 

(SDEFUN |ALGSC;coordinates;%VV;17|
        ((|x| (%)) (|b| (|Vector| %)) (% (|Vector| R)))
        (SPROG
         ((|res| (|Union| (|Vector| R) "failed")) (#1=#:G113 NIL) (|i| NIL)
          (|transitionMatrix| (|Matrix| R)) (|m| (|NonNegativeInteger|))
          (#2=#:G105 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #2# (SPADCALL |b| (QREFELT % 56)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 (QREFELT % 7) |m| (|spadConstant| % 13)))
          (SEQ (LETT |i| 1) (LETT #1# |m|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |transitionMatrix| |i|
                           (SPADCALL (SPADCALL |b| |i| (QREFELT % 57))
                                     (QREFELT % 54))
                           (QREFELT % 58))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |transitionMatrix| (SPADCALL |x| (QREFELT % 54))
                          (QREFELT % 61)))
          (EXIT
           (COND
            ((QEQCAR |res| 1) (|error| "coordinates: solveUniquely failed"))
            ('T (QCDR |res|))))))) 

(SDEFUN |ALGSC;basis;V;18| ((% (|Vector| %)))
        (SPROG
         ((#1=#:G116 NIL) (#2=#:G119 NIL) (#3=#:G121 NIL) (|i| NIL)
          (#4=#:G120 NIL))
         (SEQ
          (PROGN
           (LETT #4# (GETREFV #5=(QREFELT % 7)))
           (SEQ (LETT |i| 1) (LETT #3# #5#) (LETT #2# 0) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #4# #2#
                          (SPADCALL
                           (PROG1 (LETT #1# |i|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #1#))
                           (QREFELT % 64)))))
                (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #4#)))) 

(SDEFUN |ALGSC;someBasis;V;19| ((% (|Vector| %))) (SPADCALL (QREFELT % 65))) 

(SDEFUN |ALGSC;rank;Pi;20| ((% (|PositiveInteger|))) (QREFELT % 7)) 

(SDEFUN |ALGSC;elt;%IR;21| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (SPADCALL |x| |i| (QREFELT % 68))) 

(SDEFUN |ALGSC;coerce;%Of;22| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G146 NIL) (|le| (|List| (|OutputForm|))) (|coef| (R))
          (#2=#:G147 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 69))
            (SPADCALL (|spadConstant| % 13) (QREFELT % 71)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT % 12)))
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |coef| (QREFELT % 72)))
                                (PROGN
                                 (LETT #1#
                                       (COND
                                        ((SPADCALL |coef| (|spadConstant| % 73)
                                                   (QREFELT % 74))
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 8) |i|
                                                           (QREFELT % 77))
                                                 (QREFELT % 78))
                                                |le|)))
                                        ('T
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |coef|
                                                           (QREFELT % 71))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 8) |i|
                                                            (QREFELT % 77))
                                                  (QREFELT % 78))
                                                 (QREFELT % 79))
                                                |le|)))))
                                 (GO #3=#:G139)))))))
                       #3# (EXIT #1#))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 80) |le| (QREFELT % 83))))))))) 

(SDEFUN |ALGSC;*;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|h| (R)) (#1=#:G159 NIL) (|j| NIL) (#2=#:G158 NIL) (|i| NIL)
          (#3=#:G157 NIL) (|k| NIL) (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |h| (|spadConstant| % 13))
                        (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |j| 1) (LETT #1# (QREFELT % 7)) G190
                                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |h|
                                            (SPADCALL |h|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |x| |i|
                                                                  (QREFELT %
                                                                           12))
                                                        (SPADCALL |y| |j|
                                                                  (QREFELT %
                                                                           12))
                                                        (QREFELT % 26))
                                                       (SPADCALL
                                                        (SPADCALL (QREFELT % 9)
                                                                  |k|
                                                                  (QREFELT %
                                                                           85))
                                                        |i| |j| (QREFELT % 86))
                                                       (QREFELT % 26))
                                                      (QREFELT % 27)))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (SPADCALL |v| |k| |h| (QREFELT % 31))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;alternative?;B;24| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G201 NIL) (#2=#:G205 NIL) (|res| (R)) (#3=#:G219 NIL) (|l| NIL)
          (#4=#:G218 NIL) (|r| NIL) (#5=#:G202 NIL) (#6=#:G217 NIL)
          (#7=#:G216 NIL) (#8=#:G215 NIL) (|k| NIL) (#9=#:G203 NIL)
          (#10=#:G214 NIL) (#11=#:G213 NIL) (#12=#:G212 NIL) (#13=#:G211 NIL)
          (|j| NIL) (#14=#:G204 NIL) (#15=#:G210 NIL) (#16=#:G209 NIL)
          (#17=#:G208 NIL) (#18=#:G207 NIL) (#19=#:G206 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #19# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #19#) (GO G191)))
                 (SEQ
                  (SEQ (LETT |j| 1) (LETT #18# (- |i| 1)) G190
                       (COND ((|greater_SI| |j| #18#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| |j|) (LETT #17# (QREFELT % 7)) G190
                              (COND ((> |k| #17#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #16# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #16#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #15# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #15#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |k| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             88))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |j|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |l| |k|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |l| |j|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 27)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #14#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not right alternative"
                                                        (QREFELT % 91))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20=#:G200)))))
                                                (GO #21=#:G167)))))))
                                      #21# (EXIT #14#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #13# (QREFELT % 7)) G190
                        (COND ((> |j| #13#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1) (LETT #12# (- |j| 1)) G190
                              (COND ((|greater_SI| |k| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #11# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #11#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #10# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #10#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             27))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |j| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 88)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #9#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not left alternative"
                                                        (QREFELT % 91))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20#)))))
                                                (GO #22=#:G177)))))))
                                      #22# (EXIT #9#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #8# (QREFELT % 7)) G190
                               (COND ((> |k| #8#) (GO G191)))
                               (SEQ
                                (SEQ (LETT |r| 1) (LETT #7# (QREFELT % 7)) G190
                                     (COND ((|greater_SI| |r| #7#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #6# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             27))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |j| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 88)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #5#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not left alternative"
                                                        (QREFELT % 91))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20#)))))
                                                (GO #23=#:G185)))))))
                                      #23# (EXIT #5#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              88))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not right alternative"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #20#)))))
                                                 (GO #24=#:G191)))))))
                                       #24# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL
             "algebra satisfies 2*associator(a,b,b) = 0 = 2*associator(a,a,b) = 0"
             (QREFELT % 91))
            (EXIT 'T)))
          #20# (EXIT #2#)))) 

(SDEFUN |ALGSC;associative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G234 NIL) (#2=#:G235 NIL) (|res| (R)) (#3=#:G240 NIL) (|l| NIL)
          (#4=#:G239 NIL) (|r| NIL) (#5=#:G238 NIL) (|k| NIL) (#6=#:G237 NIL)
          (|j| NIL) (#7=#:G236 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not associative"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G233)))))
                                                 (GO #9=#:G227)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is associative" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiAssociative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G255 NIL) (#2=#:G256 NIL) (|res| (R)) (#3=#:G261 NIL) (|l| NIL)
          (#4=#:G260 NIL) (|r| NIL) (#5=#:G259 NIL) (|k| NIL) (#6=#:G258 NIL)
          (|j| NIL) (#7=#:G257 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not anti-associative"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G254)))))
                                                 (GO #9=#:G248)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is anti-associative" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;commutative?;B;27| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G272 NIL) (#2=#:G273 NIL) (#3=#:G276 NIL) (|k| NIL)
          (#4=#:G275 NIL) (|j| NIL) (#5=#:G274 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (+ |i| 1)) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 85))
                                      |i| |j| (QREFELT % 86))
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 85))
                                      |j| |i| (QREFELT % 86))
                                     (QREFELT % 74)))
                                   (PROGN
                                    (LETT #1#
                                          (SEQ
                                           (SPADCALL
                                            "algebra is not commutative"
                                            (QREFELT % 91))
                                           (EXIT
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #6=#:G271)))))
                                    (GO #7=#:G267))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is commutative" (QREFELT % 91)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiCommutative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G287 NIL) (#2=#:G288 NIL) (#3=#:G291 NIL) (|k| NIL)
          (#4=#:G290 NIL) (|j| NIL) (#5=#:G289 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (COND
                                      ((EQL |i| |j|)
                                       (SPADCALL
                                        (SPADCALL (QREFELT % 9) |k|
                                                  (QREFELT % 85))
                                        |i| |i| (QREFELT % 86)))
                                      ('T
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 85))
                                         |i| |j| (QREFELT % 86))
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 85))
                                         |j| |i| (QREFELT % 86))
                                        (QREFELT % 27))))
                                     (QREFELT % 72)))
                                   (PROGN
                                    (LETT #1#
                                          (SEQ
                                           (SPADCALL
                                            "algebra is not anti-commutative"
                                            (QREFELT % 91))
                                           (EXIT
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #6=#:G286)))))
                                    (GO #7=#:G282))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is anti-commutative" (QREFELT % 91)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;leftAlternative?;B;29| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G306 NIL) (#2=#:G307 NIL) (|res| (R)) (#3=#:G312 NIL) (|l| NIL)
          (#4=#:G311 NIL) (|r| NIL) (#5=#:G310 NIL) (|k| NIL) (#6=#:G309 NIL)
          (|j| NIL) (#7=#:G308 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #6# (QREFELT % 7)) G190
                        (COND ((> |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |i|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |j| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |i| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |j| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not left alternative"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G305)))))
                                                 (GO #9=#:G299)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is left alternative" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;rightAlternative?;B;30| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G327 NIL) (#2=#:G328 NIL) (|res| (R)) (#3=#:G333 NIL) (|l| NIL)
          (#4=#:G332 NIL) (|r| NIL) (#5=#:G331 NIL) (|k| NIL) (#6=#:G330 NIL)
          (|j| NIL) (#7=#:G329 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              88))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not right alternative"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G326)))))
                                                 (GO #9=#:G320)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is right alternative" (QREFELT % 91))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;flexible?;B;31| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G348 NIL) (#2=#:G349 NIL) (|res| (R)) (#3=#:G354 NIL) (|l| NIL)
          (#4=#:G353 NIL) (|r| NIL) (#5=#:G352 NIL) (|k| NIL) (#6=#:G351 NIL)
          (|j| NIL) (#7=#:G350 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |i|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |res|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        % 27))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |j| |k|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |i| |l|
                                                               (QREFELT % 86))
                                                              (QREFELT % 26))
                                                             (QREFELT % 88))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |k| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |i|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |i|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |k| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not flexible"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G347)))))
                                                 (GO #9=#:G341)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is flexible" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;lieAdmissible?;B;32| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G369 NIL) (#2=#:G370 NIL) (|res| (R)) (#3=#:G375 NIL) (|l| NIL)
          (#4=#:G374 NIL) (|r| NIL) (#5=#:G373 NIL) (|k| NIL) (#6=#:G372 NIL)
          (|j| NIL) (#7=#:G371 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |j|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 88))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |k|
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 88))
                                                                       (QREFELT
                                                                        % 26))
                                                                      (QREFELT
                                                                       % 27))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |j| |k|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |k| |j|
                                                               (QREFELT % 86))
                                                              (QREFELT % 88))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |l| |i|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |i| |l|
                                                               (QREFELT % 86))
                                                              (QREFELT % 88))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |k| |i|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 88))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |j| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 88))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not Lie admissible"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G368)))))
                                                 (GO #9=#:G362)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is Lie admissible" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAdmissible?;B;33| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G399 NIL) (#2=#:G400 NIL) (|res| (R)) (#3=#:G407 NIL) (|r| NIL)
          (#4=#:G406 NIL) (|l| NIL) (#5=#:G405 NIL) (|t| NIL) (#6=#:G404 NIL)
          (|w| NIL) (#7=#:G403 NIL) (|k| NIL) (#8=#:G402 NIL) (|j| NIL)
          (#9=#:G401 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 101))
                        (QREFELT % 102))
              1)
             (SEQ
              (SPADCALL
               "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
               (QREFELT % 91))
              (EXIT NIL)))
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |w| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |w| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |res|
                                                        (|spadConstant| % 13))
                                                  (SEQ (LETT |l| 1)
                                                       (LETT #4# (QREFELT % 7))
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #4#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SEQ (LETT |r| 1)
                                                              (LETT #3#
                                                                    (QREFELT %
                                                                             7))
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |r| #3#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |i|
                                                                                |j|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |j|
                                                                                |i|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (QREFELT
                                                                                %
                                                                                27))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |w|
                                                                                |k|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |k|
                                                                                |w|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (QREFELT
                                                                                %
                                                                                27))
                                                                              (QREFELT
                                                                               %
                                                                               26))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |l|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |r|
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |w|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |k|
                                                                               |w|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |j|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |r|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |i|
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |l|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (QREFELT
                                                                            %
                                                                            88))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |w|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |j|
                                                                              |w|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |k|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |i|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |l|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |r|
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |j|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |r|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |w|
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |l|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (QREFELT
                                                                          %
                                                                          88))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |k|
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |j|
                                                                            |k|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |i|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |w|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |l|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |r|
                                                                           |l|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (QREFELT
                                                                         % 27))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |i|
                                                                           |w|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |w|
                                                                           |i|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |j|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |r|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |k|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |l|
                                                                          |k|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          27))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        %
                                                                        88)))))
                                                              (LETT |r|
                                                                    (|inc_SI|
                                                                     |r|))
                                                              (GO G190) G191
                                                              (EXIT NIL))))
                                                       (LETT |l|
                                                             (|inc_SI| |l|))
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |res|
                                                                (QREFELT %
                                                                         72)))
                                                     (PROGN
                                                      (LETT #1#
                                                            (SEQ
                                                             (SPADCALL
                                                              "algebra is not Jordan admissible"
                                                              (QREFELT % 91))
                                                             (EXIT
                                                              (PROGN
                                                               (LETT #2# NIL)
                                                               (GO
                                                                #10=#:G398)))))
                                                      (GO #11=#:G390)))))))
                                                #11# (EXIT #1#))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |w| (|inc_SI| |w|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL "algebra is Jordan admissible" (QREFELT % 91))
              (EXIT 'T)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAlgebra?;B;34| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G433 NIL) (#2=#:G434 NIL) (|res| (R)) (#3=#:G441 NIL) (|s| NIL)
          (#4=#:G440 NIL) (|r| NIL) (#5=#:G439 NIL) (|t| NIL) (#6=#:G438 NIL)
          (|l| NIL) (#7=#:G437 NIL) (|k| NIL) (#8=#:G436 NIL) (|j| NIL)
          (#9=#:G435 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 101))
                        (QREFELT % 102))
              1)
             (SEQ
              (SPADCALL
               "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
               (QREFELT % 91))
              (EXIT NIL)))
            ((SPADCALL (QREFELT % 95))
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |l| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |l| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |res|
                                                      (|spadConstant| % 13))
                                                (EXIT
                                                 (SEQ (LETT |r| 1)
                                                      (LETT #4# (QREFELT % 7))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |r| #4#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ (LETT |s| 1)
                                                             (LETT #3#
                                                                   (QREFELT %
                                                                            7))
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |s| #3#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |i|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |s|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |l|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               26))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |r|
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |l|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |s|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |j|
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |i|
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (QREFELT
                                                                            %
                                                                            88))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |l|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |k|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |r|
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |k|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |j|
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |l|
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (QREFELT
                                                                          %
                                                                          88))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |k|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |i|
                                                                           |k|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |r|
                                                                          |s|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (QREFELT
                                                                         % 27))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |i|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |j|
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |k|
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        % 88)))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    (SPADCALL
                                                                     |res|
                                                                     (QREFELT %
                                                                              72)))
                                                                   (PROGN
                                                                    (LETT #1#
                                                                          (SEQ
                                                                           (SPADCALL
                                                                            "this is not a Jordan algebra"
                                                                            (QREFELT
                                                                             %
                                                                             91))
                                                                           (EXIT
                                                                            (PROGN
                                                                             (LETT
                                                                              #2#
                                                                              NIL)
                                                                             (GO
                                                                              #10=#:G432)))))
                                                                    (GO
                                                                     #11=#:G420)))))))
                                                              #11# (EXIT #1#))
                                                             (LETT |s|
                                                                   (|inc_SI|
                                                                    |s|))
                                                             (GO G190) G191
                                                             (EXIT NIL))))
                                                      (LETT |r| (|inc_SI| |r|))
                                                      (GO G190) G191
                                                      (EXIT NIL))))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |l| (|inc_SI| |l|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL "this is a Jordan algebra" (QREFELT % 91)) (EXIT 'T)))
            ('T
             (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT % 91))
                  (EXIT NIL)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jacobiIdentity?;B;35| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G456 NIL) (#2=#:G457 NIL) (|res| (R)) (#3=#:G462 NIL) (|s| NIL)
          (#4=#:G461 NIL) (|r| NIL) (#5=#:G460 NIL) (|k| NIL) (#6=#:G459 NIL)
          (|j| NIL) (#7=#:G458 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |s| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |s| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |s| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 26))
                                                                      (QREFELT
                                                                       % 27))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |s|
                                                               (QREFELT % 85))
                                                              |j| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |s| |i|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |s|
                                                              (QREFELT % 85))
                                                             |k| |i|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |s| |j|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |s| (|inc_SI| |s|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "Jacobi identity does not hold"
                                                         (QREFELT % 91))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G455)))))
                                                 (GO #9=#:G449)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "Jacobi identity holds" (QREFELT % 91)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |AlgebraGivenByStructuralConstants;|)) 

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G473)
  (SPROG NIL
         (PROG (#2=#:G474)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL NIL))
                     (HGET |$ConstructorCache|
                           '|AlgebraGivenByStructuralConstants|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |AlgebraGivenByStructuralConstants;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraGivenByStructuralConstants|)))))))))) 

(DEFUN |AlgebraGivenByStructuralConstants;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G472 NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$|
          (LIST '|AlgebraGivenByStructuralConstants| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 118))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|OrderedVariableList| |#3|)
                                               '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #1#)
                                         (|HasCategory| |#1| '(|Finite|)))))))
    (|haddProp| |$ConstructorCache| '|AlgebraGivenByStructuralConstants|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|DirectProduct| |#2| |#1|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 63
                 (CONS (|dispatchFunction| |ALGSC;coordinates;%VV;17|) %)))))
    %))) 

(MAKEPROP '|AlgebraGivenByStructuralConstants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 7)) 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Integer|) |ALGSC;elt;%IR;21| (0 . |Zero|) (|Boolean|)
              (4 . ~=) (|PositiveInteger|)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 8))) (10 . |index|)
              (|Record| (|:| |k| 17) (|:| |c| 6)) (|List| 19)
              |ALGSC;listOfTerms;%L;1| (|NonNegativeInteger|)
              |ALGSC;numberOfMonomials;%Nni;2| |ALGSC;monomial?;%B;3|
              |ALGSC;leadingTerm;%R;4| (15 . *) (21 . +) (|Mapping| 6 17)
              |ALGSC;linearExtend;M%R;9| (|Vector| 6) (27 . |setelt!|)
              (34 . |directProduct|) |ALGSC;reductum;2%;6| (39 . |lookup|)
              |ALGSC;construct;L%;7| |ALGSC;coefficient;%OvlR;8|
              |ALGSC;constructOrdered;L%;10| |ALGSC;monomial;ROvl%;11|
              (|Union| % '"failed") (|FiniteRankNonAssociativeAlgebra&| $$ 6)
              (44 . |recip|) |ALGSC;recip;%U;12| (|Matrix| 6)
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 6) (49 . |coerce|)
              (54 . |apply|) |ALGSC;*;Sm2%;13| |ALGSC;coerce;V%;14|
              (|Vector| 43) |ALGSC;structuralConstants;V;15| (|List| 6)
              (60 . |entries|) (65 . |vector|) |ALGSC;coordinates;%V;16|
              (|Vector| $$) (70 . |maxIndex|) (75 . |elt|) (81 . |setColumn!|)
              (|Union| 30 '"failed") (|LinearSystemMatrixPackage2| 6)
              (88 . |solveUniquely|) (|Vector| %) (94 . |coordinates|)
              (100 . |unitVector|) |ALGSC;basis;V;18| |ALGSC;someBasis;V;19|
              |ALGSC;rank;Pi;20| (105 . |elt|) (111 . |zero?|) (|OutputForm|)
              (116 . |coerce|) (121 . |zero?|) (126 . |One|) (130 . =)
              (|Symbol|) (|List| 75) (136 . |elt|) (142 . |coerce|) (147 . *)
              (153 . +) (|Mapping| 70 70 70) (|List| 70) (159 . |reduce|)
              |ALGSC;coerce;%Of;22| (165 . |elt|) (171 . |elt|) |ALGSC;*;3%;23|
              (178 . -) (|Void|) (|String|) (184 . |messagePrint|)
              |ALGSC;alternative?;B;24| |ALGSC;associative?;B;25|
              |ALGSC;antiAssociative?;B;26| |ALGSC;commutative?;B;27|
              |ALGSC;antiCommutative?;B;28| |ALGSC;leftAlternative?;B;29|
              |ALGSC;rightAlternative?;B;30| |ALGSC;flexible?;B;31|
              |ALGSC;lieAdmissible?;B;32| (189 . *) (195 . |recip|)
              |ALGSC;jordanAdmissible?;B;33| |ALGSC;jordanAlgebra?;B;34|
              |ALGSC;jacobiIdentity?;B;35|
              (|SparseUnivariatePolynomial| (|Polynomial| 6)) (|List| %)
              (|InputForm|) (|SingleInteger|) (|HashState|)
              (|Record| (|:| |particular| %) (|:| |basis| 107))
              (|Union| 111 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 30) (|Mapping| 6 6) (|List| 17)
              (|List| (|Polynomial| 6)))
           '#(~= 200 |zero?| 206 |unit| 211 |support| 215 |subtractIfCan| 220
              |structuralConstants| 226 |someBasis| 235 |smaller?| 239 |size|
              245 |sample| 249 |rightUnits| 253 |rightUnit| 257
              |rightTraceMatrix| 261 |rightTrace| 270
              |rightRegularRepresentation| 275 |rightRecip| 286
              |rightRankPolynomial| 291 |rightPower| 295 |rightNorm| 301
              |rightMinimalPolynomial| 306 |rightDiscriminant| 311
              |rightCharacteristicPolynomial| 320 |rightAlternative?| 325
              |represents| 329 |reductum| 340 |recip| 345 |rank| 350 |random|
              354 |powerAssociative?| 358 |plenaryPower| 362 |opposite?| 368
              |numberOfMonomials| 374 |noncommutativeJordanAlgebra?| 379
              |monomials| 383 |monomial?| 388 |monomial| 393 |map| 399 |lookup|
              405 |listOfTerms| 410 |linearExtend| 415 |lieAlgebra?| 421
              |lieAdmissible?| 425 |leftUnits| 429 |leftUnit| 433
              |leftTraceMatrix| 437 |leftTrace| 446 |leftRegularRepresentation|
              451 |leftRecip| 462 |leftRankPolynomial| 467 |leftPower| 471
              |leftNorm| 477 |leftMinimalPolynomial| 482 |leftDiscriminant| 487
              |leftCharacteristicPolynomial| 496 |leftAlternative?| 501
              |leadingTerm| 505 |leadingSupport| 510 |leadingMonomial| 515
              |leadingCoefficient| 520 |latex| 525 |jordanAlgebra?| 530
              |jordanAdmissible?| 534 |jacobiIdentity?| 538 |index| 542
              |hashUpdate!| 547 |hash| 553 |flexible?| 558 |enumerate| 562
              |elt| 566 |coordinates| 572 |convert| 594 |constructOrdered| 609
              |construct| 614 |conditionsForIdempotents| 619 |commutator| 628
              |commutative?| 634 |coerce| 638 |coefficients| 648 |coefficient|
              653 |basis| 659 |associatorDependence| 663 |associator| 667
              |associative?| 674 |apply| 678 |antiCommutator| 684
              |antiCommutative?| 690 |antiAssociative?| 694 |alternative?| 698
              ^ 702 |Zero| 708 = 712 - 718 + 729 * 735)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 7 0
                                  2 0 0 1 3))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FreeModuleCategory&| NIL |Module&| NIL |FramedModule&| NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&|
                |AbelianSemiGroup&| |Magma&| NIL |SetCategory&| |Hashable&|
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6)
                 (|FreeModuleCategory| 6 (|OrderedVariableList| 8))
                 (|IndexedDirectProductCategory| 6 (|OrderedVariableList| 8))
                 (|Module| 6)
                 (|IndexedProductCategory| 6 (|OrderedVariableList| 8))
                 (|FramedModule| 6) (|BiModule| 6 6) (|NonAssociativeRng|)
                 (|LeftModule| (|SquareMatrix| 7 6))
                 (|AbelianProductCategory| 6) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|SetCategory|) (|Hashable|) (|BasicType|)
                 (|CoercibleTo| 70) (|unitsKnown|) (|ConvertibleTo| 108))
              (|makeByteWordVec2| 117
                                  '(0 6 0 13 2 6 14 0 0 15 1 17 0 16 18 2 6 0 0
                                    0 26 2 6 0 0 0 27 3 30 6 0 11 6 31 1 10 0
                                    30 32 1 17 16 0 34 1 40 39 0 41 1 44 43 0
                                    45 2 0 0 43 0 46 1 10 51 0 52 1 30 0 51 53
                                    1 55 11 0 56 2 55 2 0 11 57 3 43 0 0 11 30
                                    58 2 60 59 43 30 61 2 0 30 0 62 63 1 10 0
                                    16 64 2 10 6 0 11 68 1 10 14 0 69 1 6 70 0
                                    71 1 6 14 0 72 0 6 0 73 2 6 14 0 0 74 2 76
                                    75 0 11 77 1 75 70 0 78 2 70 0 0 0 79 2 70
                                    0 0 0 80 2 82 70 81 0 83 2 49 43 0 11 85 3
                                    43 6 0 11 11 86 2 6 0 0 0 88 1 70 89 90 91
                                    2 6 0 16 0 101 1 6 39 0 102 2 0 14 0 0 1 1
                                    0 14 0 1 0 1 39 1 1 0 116 0 1 2 0 39 0 0 1
                                    0 0 49 50 1 0 49 62 1 0 0 62 66 2 7 14 0 0
                                    1 0 3 22 1 0 0 0 1 0 1 112 1 0 1 39 1 0 0
                                    43 1 1 0 43 62 1 1 0 6 0 1 1 0 43 0 1 2 0
                                    43 0 62 1 1 1 39 0 1 0 4 106 1 2 0 0 0 16 1
                                    1 0 6 0 1 1 1 113 0 1 0 0 6 1 1 0 6 62 1 1
                                    0 113 0 1 0 0 14 98 1 0 0 30 1 2 0 0 30 62
                                    1 1 6 0 0 33 1 1 39 0 42 0 0 16 67 0 3 0 1
                                    0 0 14 1 2 0 0 0 16 1 2 0 14 0 0 1 1 0 22 0
                                    23 0 0 14 1 1 0 107 0 1 1 0 14 0 24 2 0 0 6
                                    17 38 2 0 0 115 0 1 1 3 16 0 1 1 0 20 0 21
                                    2 5 6 28 0 29 0 0 14 1 0 0 14 100 0 1 112 1
                                    0 1 39 1 0 0 43 1 1 0 43 62 1 1 0 6 0 1 1 0
                                    43 0 1 2 0 43 0 62 1 1 1 39 0 1 0 4 106 1 2
                                    0 0 0 16 1 1 0 6 0 1 1 1 113 0 1 0 0 6 1 1
                                    0 6 62 1 1 0 113 0 1 0 0 14 97 1 6 19 0 25
                                    1 6 17 0 1 1 6 0 0 1 1 6 6 0 1 1 0 90 0 1 0
                                    0 14 104 0 0 14 103 0 0 14 105 1 3 0 16 1 2
                                    2 110 110 0 1 1 2 109 0 1 0 0 14 99 0 3 107
                                    1 2 0 6 0 11 12 1 0 30 0 54 1 0 43 62 1 2 0
                                    30 0 62 63 2 0 43 62 62 1 1 3 108 0 1 1 0
                                    30 0 1 1 0 0 30 1 1 6 0 20 37 1 0 0 20 35 0
                                    0 117 1 1 0 117 62 1 2 0 0 0 0 1 0 0 14 95
                                    1 0 0 30 48 1 0 70 0 84 1 0 51 0 1 2 0 6 0
                                    17 36 0 0 62 65 0 1 114 1 3 0 0 0 0 0 1 0 0
                                    14 93 2 0 0 43 0 46 2 0 0 0 0 1 0 0 14 96 0
                                    0 14 94 0 0 14 92 2 0 0 0 16 1 0 0 0 1 2 0
                                    14 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 44 0 47 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0
                                    22 0 1 2 0 0 11 0 1 2 0 0 0 0 87 2 0 0 16 0
                                    1)))))
           '|lookupComplete|)) 
