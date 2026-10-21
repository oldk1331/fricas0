
(SDEFUN |ALGSC;listOfTerms;%L;1|
        ((|x| (%))
         (%
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R)))))
        (SPROG
         ((|i| NIL) (#1=#:G35 NIL) (|c| (R))
          (|res|
           (|List|
            (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R)))))
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
         ((|i| NIL) (#1=#:G41 NIL) (|c| (R)) (|res| (|NonNegativeInteger|)))
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
        (SPROG ((|i| NIL) (#1=#:G50 NIL) (|c| (R)) (#2=#:G49 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                            (EXIT
                             (COND
                              ((SPADCALL |c| (|spadConstant| % 13)
                                         (QREFELT % 15))
                               (PROGN
                                (LETT #2#
                                      (CONS (SPADCALL |i| (QREFELT % 18)) |c|))
                                (GO #3=#:G48))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|error| "can not take leadingTerm of zero element"))))
                #3# (EXIT #2#)))) 

(SDEFUN |ALGSC;linearExtend;M%R;5|
        ((|f| (|Mapping| R (|OrderedVariableList| |ls|))) (|x| (%)) (% (R)))
        (SPROG ((|i| NIL) (#1=#:G57 NIL) (|c| (R)) (|res| (R)))
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
         ((|v| (|Vector| R)) (|i| NIL) (#1=#:G63 NIL) (|c| (R))
          (|first| (|Boolean|)))
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
         ((|v| (|Vector| R)) (|el| NIL) (#1=#:G70 NIL)
          (|i| (|PositiveInteger|)))
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
        (SPROG ((|i| NIL) (#1=#:G77 NIL) (|c| (R)) (|res| (R)))
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
         ((#1=#:G93 NIL) (|m| (|NonNegativeInteger|))
          (|transitionMatrix| (|Matrix| R)) (|i| NIL) (#2=#:G104 NIL)
          (|res| (|Union| (|Vector| R) "failed")))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #1# (SPADCALL |b| (QREFELT % 56)))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 (QREFELT % 7) |m| (|spadConstant| % 13)))
          (SEQ (LETT |i| 1) (LETT #2# |m|) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
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
         ((#1=#:G111 NIL) (|i| NIL) (#2=#:G112 NIL) (#3=#:G110 NIL)
          (#4=#:G107 NIL))
         (SEQ
          (PROGN
           (LETT #1# (GETREFV #5=(QREFELT % 7)))
           (SEQ (LETT |i| 1) (LETT #2# #5#) (LETT #3# 0) G190
                (COND ((|greater_SI| |i| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #1# #3#
                          (SPADCALL
                           (PROG1 (LETT #4# |i|)
                             (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #4#))
                           (QREFELT % 64)))))
                (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #1#)))) 

(SDEFUN |ALGSC;someBasis;V;19| ((% (|Vector| %))) (SPADCALL (QREFELT % 65))) 

(SDEFUN |ALGSC;rank;Pi;20| ((% (|PositiveInteger|))) (QREFELT % 7)) 

(SDEFUN |ALGSC;elt;%IR;21| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (SPADCALL |x| |i| (QREFELT % 68))) 

(SDEFUN |ALGSC;coerce;%Of;22| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|i| NIL) (#1=#:G127 NIL) (|coef| (R)) (|le| (|List| (|OutputForm|)))
          (#2=#:G126 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 69))
            (SPADCALL (|spadConstant| % 13) (QREFELT % 71)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT % 12)))
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |coef| (QREFELT % 72)))
                                (PROGN
                                 (LETT #2#
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
                                 (GO #3=#:G118)))))))
                       #3# (EXIT #2#))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 80) |le| (QREFELT % 83))))))))) 

(SDEFUN |ALGSC;*;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|v| (|Vector| R)) (|k| NIL) (#1=#:G137 NIL) (|i| NIL)
          (#2=#:G138 NIL) (|j| NIL) (#3=#:G139 NIL) (|h| (R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |h| (|spadConstant| % 13))
                        (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |j| 1) (LETT #3# (QREFELT % 7)) G190
                                    (COND ((|greater_SI| |j| #3#) (GO G191)))
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
         ((|i| NIL) (#1=#:G182 NIL) (#2=#:G183 NIL) (#3=#:G184 NIL)
          (#4=#:G185 NIL) (#5=#:G186 NIL) (#6=#:G180 NIL) (|j| NIL)
          (#7=#:G187 NIL) (#8=#:G188 NIL) (#9=#:G189 NIL) (#10=#:G190 NIL)
          (#11=#:G179 NIL) (|k| NIL) (#12=#:G191 NIL) (#13=#:G192 NIL)
          (#14=#:G193 NIL) (#15=#:G178 NIL) (|r| NIL) (#16=#:G194 NIL)
          (|l| NIL) (#17=#:G195 NIL) (|res| (R)) (#18=#:G181 NIL)
          (#19=#:G177 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (SEQ (LETT |j| 1) (LETT #2# (- |i| 1)) G190
                       (COND ((|greater_SI| |j| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| |j|) (LETT #3# (QREFELT % 7)) G190
                              (COND ((> |k| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7)) G190
                                     (COND ((|greater_SI| |r| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #5# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #5#)
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
                                                (LETT #6#
                                                      (PROGN
                                                       (LETT #18# NIL)
                                                       (GO #20=#:G176)))
                                                (GO #21=#:G146)))))))
                                      #21# (EXIT #6#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #7# (QREFELT % 7)) G190
                        (COND ((> |j| #7#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1) (LETT #8# (- |j| 1)) G190
                              (COND ((|greater_SI| |k| #8#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #9# (QREFELT % 7)) G190
                                     (COND ((|greater_SI| |r| #9#) (GO G191)))
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
                                                (LETT #11#
                                                      (PROGN
                                                       (LETT #18# NIL)
                                                       (GO #20#)))
                                                (GO #22=#:G155)))))))
                                      #22# (EXIT #11#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #12# (QREFELT % 7)) G190
                               (COND ((> |k| #12#) (GO G191)))
                               (SEQ
                                (SEQ (LETT |r| 1) (LETT #13# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #13#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #14# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #14#)
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
                                                (LETT #15#
                                                      (PROGN
                                                       (LETT #18# NIL)
                                                       (GO #20#)))
                                                (GO #23=#:G162)))))))
                                      #23# (EXIT #15#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #16# (QREFELT % 7))
                                      G190
                                      (COND
                                       ((|greater_SI| |r| #16#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #17# (QREFELT % 7))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |l| #17#)
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
                                                 (LETT #19#
                                                       (PROGN
                                                        (LETT #18# NIL)
                                                        (GO #20#)))
                                                 (GO #24=#:G167)))))))
                                       #24# (EXIT #19#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #20# (EXIT #18#)))) 

(SDEFUN |ALGSC;associative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G211 NIL) (|j| NIL) (#2=#:G212 NIL) (|k| NIL)
          (#3=#:G213 NIL) (|r| NIL) (#4=#:G214 NIL) (|l| NIL) (#5=#:G215 NIL)
          (|res| (R)) (#6=#:G210 NIL) (#7=#:G209 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G208)))
                                                 (GO #9=#:G202)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;antiAssociative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G231 NIL) (|j| NIL) (#2=#:G232 NIL) (|k| NIL)
          (#3=#:G233 NIL) (|r| NIL) (#4=#:G234 NIL) (|l| NIL) (#5=#:G235 NIL)
          (|res| (R)) (#6=#:G230 NIL) (#7=#:G229 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G228)))
                                                 (GO #9=#:G222)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;commutative?;B;27| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G247 NIL) (|j| NIL) (#2=#:G248 NIL) (|k| NIL)
          (#3=#:G249 NIL) (#4=#:G246 NIL) (#5=#:G245 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (+ |i| 1)) (LETT #2# (QREFELT % 7)) G190
                        (COND ((> |j| #2#) (GO G191)))
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
                                    (LETT #5#
                                          (PROGN
                                           (LETT #4# NIL)
                                           (GO #6=#:G244)))
                                    (GO #7=#:G240))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #5#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |ALGSC;antiCommutative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G261 NIL) (|j| NIL) (#2=#:G262 NIL) (|k| NIL)
          (#3=#:G263 NIL) (#4=#:G260 NIL) (#5=#:G259 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #2# (QREFELT % 7)) G190
                        (COND ((> |j| #2#) (GO G191)))
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
                                    (LETT #5#
                                          (PROGN
                                           (LETT #4# NIL)
                                           (GO #6=#:G258)))
                                    (GO #7=#:G254))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #5#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |ALGSC;leftAlternative?;B;29| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G279 NIL) (|j| NIL) (#2=#:G280 NIL) (|k| NIL)
          (#3=#:G281 NIL) (|r| NIL) (#4=#:G282 NIL) (|l| NIL) (#5=#:G283 NIL)
          (|res| (R)) (#6=#:G278 NIL) (#7=#:G277 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #2# (QREFELT % 7)) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G276)))
                                                 (GO #9=#:G270)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;rightAlternative?;B;30| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G299 NIL) (|j| NIL) (#2=#:G300 NIL) (|k| NIL)
          (#3=#:G301 NIL) (|r| NIL) (#4=#:G302 NIL) (|l| NIL) (#5=#:G303 NIL)
          (|res| (R)) (#6=#:G298 NIL) (#7=#:G297 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #3# (QREFELT % 7)) G190
                               (COND ((> |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G296)))
                                                 (GO #9=#:G290)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;flexible?;B;31| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G319 NIL) (|j| NIL) (#2=#:G320 NIL) (|k| NIL)
          (#3=#:G321 NIL) (|r| NIL) (#4=#:G322 NIL) (|l| NIL) (#5=#:G323 NIL)
          (|res| (R)) (#6=#:G318 NIL) (#7=#:G317 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |i|) (LETT #3# (QREFELT % 7)) G190
                               (COND ((> |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G316)))
                                                 (GO #9=#:G310)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;lieAdmissible?;B;32| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G339 NIL) (|j| NIL) (#2=#:G340 NIL) (|k| NIL)
          (#3=#:G341 NIL) (|r| NIL) (#4=#:G342 NIL) (|l| NIL) (#5=#:G343 NIL)
          (|res| (R)) (#6=#:G338 NIL) (#7=#:G337 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G336)))
                                                 (GO #9=#:G330)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(SDEFUN |ALGSC;jordanAdmissible?;B;33| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G367 NIL) (|j| NIL) (#2=#:G368 NIL) (|k| NIL)
          (#3=#:G369 NIL) (|w| NIL) (#4=#:G370 NIL) (|t| NIL) (#5=#:G371 NIL)
          (|l| NIL) (#6=#:G372 NIL) (|r| NIL) (#7=#:G373 NIL) (|res| (R))
          (#8=#:G366 NIL) (#9=#:G365 NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 98))
                        (QREFELT % 99))
              1)
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |w| 1) (LETT #4# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |w| #4#) (GO G191)))
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
                                                       (LETT #6# (QREFELT % 7))
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #6#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SEQ (LETT |r| 1)
                                                              (LETT #7#
                                                                    (QREFELT %
                                                                             7))
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |r| #7#)
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
                                                      (LETT #9#
                                                            (PROGN
                                                             (LETT #8# NIL)
                                                             (GO #10=#:G364)))
                                                      (GO #11=#:G356)))))))
                                                #11# (EXIT #9#))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |w| (|inc_SI| |w|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #10# (EXIT #8#)))) 

(SDEFUN |ALGSC;jordanAlgebra?;B;34| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G398 NIL) (|j| NIL) (#2=#:G399 NIL) (|k| NIL)
          (#3=#:G400 NIL) (|l| NIL) (#4=#:G401 NIL) (|t| NIL) (#5=#:G402 NIL)
          (|r| NIL) (#6=#:G403 NIL) (|s| NIL) (#7=#:G404 NIL) (|res| (R))
          (#8=#:G397 NIL) (#9=#:G396 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR
              (QEQCAR
               (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 98))
                         (QREFELT % 99))
               1)
              (NULL (SPADCALL (QREFELT % 92))))
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |l| 1) (LETT #4# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |l| #4#) (GO G191)))
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
                                                      (LETT #6# (QREFELT % 7))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |r| #6#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ (LETT |s| 1)
                                                             (LETT #7#
                                                                   (QREFELT %
                                                                            7))
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |s| #7#)
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
                                                                    (LETT #9#
                                                                          (PROGN
                                                                           (LETT
                                                                            #8#
                                                                            NIL)
                                                                           (GO
                                                                            #10=#:G395)))
                                                                    (GO
                                                                     #11=#:G384)))))))
                                                              #11# (EXIT #9#))
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
              (EXIT 'T)))))
          #10# (EXIT #8#)))) 

(SDEFUN |ALGSC;jacobiIdentity?;B;35| ((% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G420 NIL) (|j| NIL) (#2=#:G421 NIL) (|k| NIL)
          (#3=#:G422 NIL) (|r| NIL) (#4=#:G423 NIL) (|s| NIL) (#5=#:G424 NIL)
          (|res| (R)) (#6=#:G419 NIL) (#7=#:G418 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |s| 1)
                                                  (LETT #5# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |s| #5#)
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
                                                 (LETT #7#
                                                       (PROGN
                                                        (LETT #6# NIL)
                                                        (GO #8=#:G417)))
                                                 (GO #9=#:G411)))))))
                                       #9# (EXIT #7#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #6#)))) 

(DECLAIM (NOTINLINE |AlgebraGivenByStructuralConstants;|)) 

(DEFUN |AlgebraGivenByStructuralConstants;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G430 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$|
          (LIST '|AlgebraGivenByStructuralConstants| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 116))
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

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G431)
  (SPROG NIL
         (PROG (#2=#:G432)
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

(MAKEPROP '|AlgebraGivenByStructuralConstants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 7)) 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Integer|) |ALGSC;elt;%IR;21| (0 . |0|) (|Boolean|)
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
              (116 . |coerce|) (121 . |zero?|) (126 . |1|) (130 . =) (|Symbol|)
              (|List| 75) (136 . |elt|) (142 . |coerce|) (147 . *) (153 . +)
              (|Mapping| 70 70 70) (|List| 70) (159 . |reduce|)
              |ALGSC;coerce;%Of;22| (165 . |elt|) (171 . |elt|) |ALGSC;*;3%;23|
              (178 . -) |ALGSC;alternative?;B;24| |ALGSC;associative?;B;25|
              |ALGSC;antiAssociative?;B;26| |ALGSC;commutative?;B;27|
              |ALGSC;antiCommutative?;B;28| |ALGSC;leftAlternative?;B;29|
              |ALGSC;rightAlternative?;B;30| |ALGSC;flexible?;B;31|
              |ALGSC;lieAdmissible?;B;32| (184 . *) (190 . |recip|)
              |ALGSC;jordanAdmissible?;B;33| |ALGSC;jordanAlgebra?;B;34|
              |ALGSC;jacobiIdentity?;B;35| (|String|) (|List| (|Polynomial| 6))
              (|SparseUnivariatePolynomial| 6) (|List| %) (|List| 17)
              (|Mapping| 6 6) (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|InputForm|) (|HashState|) (|SingleInteger|) (|List| 30)
              (|Record| (|:| |particular| %) (|:| |basis| 106))
              (|Union| 114 '"failed"))
           '#(~= 195 |zero?| 201 |unit| 206 |support| 210 |subtractIfCan| 215
              |structuralConstants| 221 |someBasis| 230 |smaller?| 234 |size|
              240 |sample| 244 |rightUnits| 248 |rightUnit| 252
              |rightTraceMatrix| 256 |rightTrace| 265
              |rightRegularRepresentation| 270 |rightRecip| 281
              |rightRankPolynomial| 286 |rightPower| 290 |rightNorm| 296
              |rightMinimalPolynomial| 301 |rightDiscriminant| 306
              |rightCharacteristicPolynomial| 315 |rightAlternative?| 320
              |represents| 324 |reductum| 335 |recip| 340 |rank| 345 |random|
              349 |powerAssociative?| 353 |plenaryPower| 357 |opposite?| 363
              |numberOfMonomials| 369 |noncommutativeJordanAlgebra?| 374
              |monomials| 378 |monomial?| 383 |monomial| 388 |map| 394 |lookup|
              400 |listOfTerms| 405 |linearExtend| 410 |lieAlgebra?| 416
              |lieAdmissible?| 420 |leftUnits| 424 |leftUnit| 428
              |leftTraceMatrix| 432 |leftTrace| 441 |leftRegularRepresentation|
              446 |leftRecip| 457 |leftRankPolynomial| 462 |leftPower| 466
              |leftNorm| 472 |leftMinimalPolynomial| 477 |leftDiscriminant| 482
              |leftCharacteristicPolynomial| 491 |leftAlternative?| 496
              |leadingTerm| 500 |leadingSupport| 505 |leadingMonomial| 510
              |leadingCoefficient| 515 |latex| 520 |jordanAlgebra?| 525
              |jordanAdmissible?| 529 |jacobiIdentity?| 533 |index| 537
              |hashUpdate!| 542 |hash| 548 |flexible?| 553 |enumerate| 557
              |elt| 561 |coordinates| 567 |convert| 589 |constructOrdered| 604
              |construct| 609 |conditionsForIdempotents| 614 |commutator| 623
              |commutative?| 629 |coerce| 633 |coefficients| 643 |coefficient|
              648 |basis| 654 |associatorDependence| 658 |associator| 662
              |associative?| 669 |apply| 673 |antiCommutator| 679
              |antiCommutative?| 685 |antiAssociative?| 689 |alternative?| 693
              ^ 697 = 703 |0| 709 - 713 + 724 * 730)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 7 0 0 7 0 0
                                  0 2 0 3 1 0 0))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |FreeModuleCategory&|
                |NonAssociativeAlgebra&| |Module&| NIL NIL |FramedModule&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| |Finite&|
                NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&| NIL |Magma&|
                |AbelianSemiGroup&| |SetWithZero&| |Hashable&| |SetCategory&|
                NIL NIL NIL |BasicType&|)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|FreeModuleCategory| 6 (|OrderedVariableList| 8))
                 (|NonAssociativeAlgebra| 6) (|Module| 6)
                 (|IndexedDirectProductCategory| 6 (|OrderedVariableList| 8))
                 (|BiModule| 6 6) (|FramedModule| 6)
                 (|IndexedProductCategory| 6 (|OrderedVariableList| 8))
                 (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianProductCategory| 6)
                 (|LeftModule| (|SquareMatrix| 7 6)) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|Finite|) (|CancellationAbelianMonoid|)
                 (|Comparable|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|ComparableRepresentation|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Hashable|) (|SetCategory|)
                 (|ConvertibleTo| 110) (|unitsKnown|) (|CoercibleTo| 70)
                 (|BasicType|))
              (|makeByteWordVec2| 115
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
                                    43 6 0 11 11 86 2 6 0 0 0 88 2 6 0 16 0 98
                                    1 6 39 0 99 2 0 14 0 0 1 1 0 14 0 1 0 1 39
                                    1 1 0 107 0 1 2 0 39 0 0 1 1 0 49 62 1 0 0
                                    49 50 0 0 62 66 2 7 14 0 0 1 0 3 22 1 0 0 0
                                    1 0 1 115 1 0 1 39 1 1 0 43 62 1 0 0 43 1 1
                                    0 6 0 1 2 0 43 0 62 1 1 0 43 0 1 1 1 39 0 1
                                    0 4 109 1 2 0 0 0 16 1 1 0 6 0 1 1 1 105 0
                                    1 1 0 6 62 1 0 0 6 1 1 0 105 0 1 0 0 14 95
                                    2 0 0 30 62 1 1 0 0 30 1 1 6 0 0 33 1 1 39
                                    0 42 0 0 16 67 0 3 0 1 0 0 14 1 2 0 0 0 16
                                    1 2 0 14 0 0 1 1 0 22 0 23 0 0 14 1 1 0 106
                                    0 1 1 0 14 0 24 2 0 0 6 17 38 2 0 0 108 0 1
                                    1 3 16 0 1 1 0 20 0 21 2 5 6 28 0 29 0 0 14
                                    1 0 0 14 97 0 1 115 1 0 1 39 1 1 0 43 62 1
                                    0 0 43 1 1 0 6 0 1 2 0 43 0 62 1 1 0 43 0 1
                                    1 1 39 0 1 0 4 109 1 2 0 0 0 16 1 1 0 6 0 1
                                    1 1 105 0 1 1 0 6 62 1 0 0 6 1 1 0 105 0 1
                                    0 0 14 94 1 6 19 0 25 1 6 17 0 1 1 6 0 0 1
                                    1 6 6 0 1 1 0 103 0 1 0 0 14 101 0 0 14 100
                                    0 0 14 102 1 3 0 16 1 2 2 111 111 0 1 1 2
                                    112 0 1 0 0 14 96 0 3 106 1 2 0 6 0 11 12 2
                                    0 43 62 62 1 2 0 30 0 62 63 1 0 43 62 1 1 0
                                    30 0 54 1 0 0 30 1 1 0 30 0 1 1 3 110 0 1 1
                                    6 0 20 37 1 0 0 20 35 1 0 104 62 1 0 0 104
                                    1 2 0 0 0 0 1 0 0 14 92 1 0 70 0 84 1 0 0
                                    30 48 1 0 51 0 1 2 0 6 0 17 36 0 0 62 65 0
                                    1 113 1 3 0 0 0 0 0 1 0 0 14 90 2 0 0 43 0
                                    46 2 0 0 0 0 1 0 0 14 93 0 0 14 91 0 0 14
                                    89 2 0 0 0 16 1 2 0 14 0 0 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 16 0 1 2
                                    0 0 0 0 87 2 0 0 11 0 1 2 0 0 22 0 1 2 0 0
                                    6 0 1 2 0 0 0 6 1 2 0 0 44 0 47)))))
           '|lookupComplete|)) 
