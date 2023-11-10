
(SDEFUN |COMMONOP;operator;SBo;1| ((|s| (|Symbol|)) (% (|BasicOperator|)))
        (SPROG ((#1=#:G454 NIL) (#2=#:G455 NIL) (#3=#:G456 NIL) (|op| NIL))
               (SEQ
                (EXIT
                 (SEQ (COND ((QREFELT % 6) (|COMMONOP;startUp| NIL %)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |op| NIL) (LETT #3# (QREFELT % 153)) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |op| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |op| |s| (QREFELT % 159))
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2#
                                               (SPADCALL |op| (QREFELT % 160)))
                                         (GO #4=#:G453)))
                                  (GO #5=#:G451))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                       #5# (EXIT #1#))
                      (EXIT (SPADCALL |s| (QREFELT % 43)))))
                #4# (EXIT #2#)))) 

(SDEFUN |COMMONOP;dpi| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL '|%pi| (QREFELT % 163))) 

(SDEFUN |COMMONOP;dfact| ((|x| (|OutputForm|)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '! (QREFELT % 163))
                  (COND ((ATOM |x|) |x|) ('T (SPADCALL |x| (QREFELT % 164))))
                  (QREFELT % 165))) 

(SDEFUN |COMMONOP;dquote| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT % 166)) (CDR |l|)
                  (QREFELT % 168))) 

(SDEFUN |COMMONOP;dgamma| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '|Gamma| (QREFELT % 163)) |l| (QREFELT % 168))) 

(SDEFUN |COMMONOP;dEllipticE2|
        ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '|ellipticE| (QREFELT % 163)) |l| (QREFELT % 168))) 

(SDEFUN |COMMONOP;setDummyVar|
        ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
         (% (|BasicOperator|)))
        (SPADCALL |op| '|%dummyVar| |n| (QREFELT % 170))) 

(SDEFUN |COMMONOP;dexp| ((|x| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG ((|e| (|OutputForm|)))
               (SEQ (LETT |e| (SPADCALL '|%e| (QREFELT % 163)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (SPADCALL 1 (QREFELT % 171))
                                 (QREFELT % 172))
                       |e|)
                      ('T (SPADCALL |e| |x| (QREFELT % 173)))))))) 

(SDEFUN |COMMONOP;inputdefsum| ((|a| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT % 175))
                             (SPADCALL |a| 4 (QREFELT % 178))
                             (SPADCALL |a| 5 (QREFELT % 178)))
                       (QREFELT % 179)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT % 175))
                             (SPADCALL |a| 2 (QREFELT % 178)) |seg|)
                       (QREFELT % 179)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|sum| (QREFELT % 175))
                        (SPADCALL |a| 1 (QREFELT % 178)) |eq|)
                  (QREFELT % 179)))))) 

(SDEFUN |COMMONOP;inputdefprod|
        ((|a| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT % 175))
                             (SPADCALL |a| 4 (QREFELT % 178))
                             (SPADCALL |a| 5 (QREFELT % 178)))
                       (QREFELT % 179)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT % 175))
                             (SPADCALL |a| 2 (QREFELT % 178)) |seg|)
                       (QREFELT % 179)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|product| (QREFELT % 175))
                        (SPADCALL |a| 1 (QREFELT % 178)) |eq|)
                  (QREFELT % 179)))))) 

(SDEFUN |COMMONOP;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((#1=#:G541 NIL) (|op| NIL) (#2=#:G540 NIL) (#3=#:G539 NIL)
          (#4=#:G538 NIL) (#5=#:G537 NIL) (#6=#:G536 NIL) (#7=#:G535 NIL)
          (#8=#:G534 NIL) (#9=#:G533 NIL) (#10=#:G532 NIL) (#11=#:G531 NIL)
          (#12=#:G530 NIL) (#13=#:G529 NIL))
         (SEQ (SETELT % 6 |b|)
              (SPADCALL (QREFELT % 42) (ELT % 164) (QREFELT % 181))
              (SPADCALL (QREFELT % 41) (ELT % 182) (QREFELT % 184))
              (SPADCALL (QREFELT % 13) (CONS (|function| |COMMONOP;dpi|) %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 15) (CONS (|function| |COMMONOP;dexp|) %)
                        (QREFELT % 181))
              (SPADCALL (QREFELT % 58) (CONS (|function| |COMMONOP;dgamma|) %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 58) '|disp_name|
                        (SPADCALL '|Gamma| (QREFELT % 163)) (QREFELT % 170))
              (SPADCALL (QREFELT % 98)
                        (CONS (|function| |COMMONOP;dEllipticE2|) %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 121) (CONS (|function| |COMMONOP;dfact|) %)
                        (QREFELT % 181))
              (SPADCALL (QREFELT % 44) (CONS (|function| |COMMONOP;dquote|) %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 122) (CONS #'|COMMONOP;startUp!0| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 123) (CONS #'|COMMONOP;startUp!1| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 124) (CONS #'|COMMONOP;startUp!2| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 125) (CONS #'|COMMONOP;startUp!3| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 127) (CONS #'|COMMONOP;startUp!4| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 118) (CONS #'|COMMONOP;startUp!5| %)
                        (QREFELT % 184))
              (SPADCALL (QREFELT % 42) (CONS #'|COMMONOP;startUp!6| %)
                        (QREFELT % 201))
              (SPADCALL (QREFELT % 124) (CONS #'|COMMONOP;startUp!7| %)
                        (QREFELT % 201))
              (SPADCALL (QREFELT % 12) (CONS #'|COMMONOP;startUp!8| %)
                        (QREFELT % 201))
              (SPADCALL (QREFELT % 126)
                        (CONS (|function| |COMMONOP;inputdefsum|) %)
                        (QREFELT % 201))
              (SPADCALL (QREFELT % 128)
                        (CONS (|function| |COMMONOP;inputdefprod|) %)
                        (QREFELT % 201))
              (SEQ (LETT |op| NIL) (LETT #13# (QREFELT % 142)) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |op| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|%alg| (QREFELT % 208))))
                   (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #12# (QREFELT % 143)) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|rtrig| (QREFELT % 208))))
                   (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #11# (QREFELT % 144)) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |op| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|htrig| (QREFELT % 208))))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #10# (QREFELT % 147)) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |op| (CAR #10#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|trig| (QREFELT % 208))))
                   (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #9# (QREFELT % 148)) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |op| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|elem| (QREFELT % 208))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #8# (QREFELT % 149)) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |op| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|prim| (QREFELT % 208))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #7# (QREFELT % 150)) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |op| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|comb| (QREFELT % 208))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #6# (QREFELT % 151)) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |op| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|special| (QREFELT % 208))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #5# (QREFELT % 152)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |op| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|any| (QREFELT % 208))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #4# (QREFELT % 154)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |op| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|even| (QREFELT % 208))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #3# (QREFELT % 155)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|odd| (QREFELT % 208))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #2# (QREFELT % 156)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |op| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 1 %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #1# (QREFELT % 157)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |op| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 2 %)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (QREFELT % 42) '|linear| (QREFELT % 208))
              (EXIT (SPADCALL (QREFELT % 210)))))) 

(SDEFUN |COMMONOP;startUp!8| ((|z1| NIL) (% NIL))
        (SPADCALL
         (LIST (SPADCALL '^ (QREFELT % 197)) (SPADCALL |z1| (QREFELT % 202))
               (SPADCALL (|spadConstant| % 205) (SPADCALL |z1| (QREFELT % 206))
                         (QREFELT % 207)))
         (QREFELT % 179))) 

(SDEFUN |COMMONOP;startUp!7| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL (SPADCALL '^ (QREFELT % 197)) |z1| (QREFELT % 199))
                  (QREFELT % 179))) 

(SDEFUN |COMMONOP;startUp!6| ((|z1| NIL) (% NIL))
        (SPADCALL
         (SPADCALL (SPADCALL '|(| (QREFELT % 197))
                   (SPADCALL |z1| (SPADCALL '|)| (QREFELT % 197))
                             (QREFELT % 198))
                   (QREFELT % 199))
         (QREFELT % 179))) 

(SDEFUN |COMMONOP;startUp!5| ((|z1| NIL) (% NIL))
        (SPADCALL
         (SPADCALL (SPADCALL |z1| (QREFELT % 187))
                   (SPADCALL (SPADCALL '|d| (QREFELT % 163))
                             (SPADCALL |z1| (QREFELT % 188)) (QREFELT % 193))
                   (QREFELT % 194))
         (SPADCALL (QREFELT % 195)) (SPADCALL |z1| (QREFELT % 190))
         (QREFELT % 196))) 

(SDEFUN |COMMONOP;startUp!4| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 187))
                  (SPADCALL |z1| (QREFELT % 188))
                  (SPADCALL |z1| (QREFELT % 190)) (QREFELT % 192))) 

(SDEFUN |COMMONOP;startUp!3| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 187))
                  (SPADCALL |z1| (QREFELT % 188))
                  (SPADCALL |z1| (QREFELT % 190)) (QREFELT % 191))) 

(SDEFUN |COMMONOP;startUp!2| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 187))
                  (SPADCALL |z1| (QREFELT % 188)) (QREFELT % 173))) 

(SDEFUN |COMMONOP;startUp!1| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 187))
                  (SPADCALL |z1| (QREFELT % 188)) (QREFELT % 189))) 

(SDEFUN |COMMONOP;startUp!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL 'A (QREFELT % 163)) |z1| (QREFELT % 185))) 

(DECLAIM (NOTINLINE |CommonOperators;|)) 

(DEFUN |CommonOperators| ()
  (SPROG NIL
         (PROG (#1=#:G543)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CommonOperators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CommonOperators|
                             (LIST (CONS NIL (CONS 1 (|CommonOperators;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CommonOperators|)))))))))) 

(DEFUN |CommonOperators;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CommonOperators|))
          (LETT % (GETREFV 211))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CommonOperators| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 'T)
          (QSETREFV % 11 (SPADCALL '|rootOf| 2 (QREFELT % 10)))
          (QSETREFV % 12 (SPADCALL '|nthRoot| 2 (QREFELT % 10)))
          (QSETREFV % 13 (SPADCALL '|pi| 0 (QREFELT % 10)))
          (QSETREFV % 14 (SPADCALL '|log| 1 (QREFELT % 10)))
          (QSETREFV % 15 (SPADCALL '|exp| 1 (QREFELT % 10)))
          (QSETREFV % 16 (SPADCALL '|abs| 1 (QREFELT % 10)))
          (QSETREFV % 17 (SPADCALL '|sin| 1 (QREFELT % 10)))
          (QSETREFV % 18 (SPADCALL '|cos| 1 (QREFELT % 10)))
          (QSETREFV % 19 (SPADCALL '|tan| 1 (QREFELT % 10)))
          (QSETREFV % 20 (SPADCALL '|cot| 1 (QREFELT % 10)))
          (QSETREFV % 21 (SPADCALL '|sec| 1 (QREFELT % 10)))
          (QSETREFV % 22 (SPADCALL '|csc| 1 (QREFELT % 10)))
          (QSETREFV % 23 (SPADCALL '|asin| 1 (QREFELT % 10)))
          (QSETREFV % 24 (SPADCALL '|acos| 1 (QREFELT % 10)))
          (QSETREFV % 25 (SPADCALL '|atan| 1 (QREFELT % 10)))
          (QSETREFV % 26 (SPADCALL '|acot| 1 (QREFELT % 10)))
          (QSETREFV % 27 (SPADCALL '|asec| 1 (QREFELT % 10)))
          (QSETREFV % 28 (SPADCALL '|acsc| 1 (QREFELT % 10)))
          (QSETREFV % 29 (SPADCALL '|sinh| 1 (QREFELT % 10)))
          (QSETREFV % 30 (SPADCALL '|cosh| 1 (QREFELT % 10)))
          (QSETREFV % 31 (SPADCALL '|tanh| 1 (QREFELT % 10)))
          (QSETREFV % 32 (SPADCALL '|coth| 1 (QREFELT % 10)))
          (QSETREFV % 33 (SPADCALL '|sech| 1 (QREFELT % 10)))
          (QSETREFV % 34 (SPADCALL '|csch| 1 (QREFELT % 10)))
          (QSETREFV % 35 (SPADCALL '|asinh| 1 (QREFELT % 10)))
          (QSETREFV % 36 (SPADCALL '|acosh| 1 (QREFELT % 10)))
          (QSETREFV % 37 (SPADCALL '|atanh| 1 (QREFELT % 10)))
          (QSETREFV % 38 (SPADCALL '|acoth| 1 (QREFELT % 10)))
          (QSETREFV % 39 (SPADCALL '|asech| 1 (QREFELT % 10)))
          (QSETREFV % 40 (SPADCALL '|acsch| 1 (QREFELT % 10)))
          (QSETREFV % 41 (SPADCALL '|%box| 1 (QREFELT % 10)))
          (QSETREFV % 42 (SPADCALL '|%paren| 1 (QREFELT % 10)))
          (QSETREFV % 44 (SPADCALL '|%quote| (QREFELT % 43)))
          (QSETREFV % 45 (SPADCALL '|%diff| 3 (QREFELT % 10)))
          (QSETREFV % 46 (SPADCALL '|Si| 1 (QREFELT % 10)))
          (QSETREFV % 47 (SPADCALL '|Ci| 1 (QREFELT % 10)))
          (QSETREFV % 48 (SPADCALL '|Shi| 1 (QREFELT % 10)))
          (QSETREFV % 49 (SPADCALL '|Chi| 1 (QREFELT % 10)))
          (QSETREFV % 50 (SPADCALL '|Ei| 1 (QREFELT % 10)))
          (QSETREFV % 51 (SPADCALL '|li| 1 (QREFELT % 10)))
          (QSETREFV % 52 (SPADCALL '|erf| 1 (QREFELT % 10)))
          (QSETREFV % 53 (SPADCALL '|erfi| 1 (QREFELT % 10)))
          (QSETREFV % 54 (SPADCALL '|dilog| 1 (QREFELT % 10)))
          (QSETREFV % 55 (SPADCALL '|fresnelS| 1 (QREFELT % 10)))
          (QSETREFV % 56 (SPADCALL '|fresnelC| 1 (QREFELT % 10)))
          (QSETREFV % 57 (SPADCALL '|Gamma| 1 (QREFELT % 10)))
          (QSETREFV % 58 (SPADCALL '|Gamma2| 2 (QREFELT % 10)))
          (QSETREFV % 59 (SPADCALL '|Beta| 2 (QREFELT % 10)))
          (QSETREFV % 60 (SPADCALL '|digamma| 1 (QREFELT % 10)))
          (QSETREFV % 61 (SPADCALL '|polygamma| 2 (QREFELT % 10)))
          (QSETREFV % 62 (SPADCALL '|besselJ| 2 (QREFELT % 10)))
          (QSETREFV % 63 (SPADCALL '|besselY| 2 (QREFELT % 10)))
          (QSETREFV % 64 (SPADCALL '|besselI| 2 (QREFELT % 10)))
          (QSETREFV % 65 (SPADCALL '|besselK| 2 (QREFELT % 10)))
          (QSETREFV % 66 (SPADCALL '|airyAi| 1 (QREFELT % 10)))
          (QSETREFV % 67 (SPADCALL '|airyAiPrime| 1 (QREFELT % 10)))
          (QSETREFV % 68 (SPADCALL '|airyBi| 1 (QREFELT % 10)))
          (QSETREFV % 69 (SPADCALL '|airyBiPrime| 1 (QREFELT % 10)))
          (QSETREFV % 70 (SPADCALL '|lambertW| 1 (QREFELT % 10)))
          (QSETREFV % 71 (SPADCALL '|polylog| 2 (QREFELT % 10)))
          (QSETREFV % 72 (SPADCALL '|weierstrassP| 3 (QREFELT % 10)))
          (QSETREFV % 73 (SPADCALL '|weierstrassPPrime| 3 (QREFELT % 10)))
          (QSETREFV % 74 (SPADCALL '|weierstrassSigma| 3 (QREFELT % 10)))
          (QSETREFV % 75 (SPADCALL '|weierstrassZeta| 3 (QREFELT % 10)))
          (QSETREFV % 76 (SPADCALL '|hypergeometricF| (QREFELT % 43)))
          (QSETREFV % 77 (SPADCALL '|meijerG| (QREFELT % 43)))
          (QSETREFV % 78 (SPADCALL '|whittakerM| 3 (QREFELT % 10)))
          (QSETREFV % 79 (SPADCALL '|whittakerW| 3 (QREFELT % 10)))
          (QSETREFV % 80 (SPADCALL '|angerJ| 2 (QREFELT % 10)))
          (QSETREFV % 81 (SPADCALL '|weberE| 2 (QREFELT % 10)))
          (QSETREFV % 82 (SPADCALL '|struveH| 2 (QREFELT % 10)))
          (QSETREFV % 83 (SPADCALL '|struveL| 2 (QREFELT % 10)))
          (QSETREFV % 84 (SPADCALL '|hankelH1| 2 (QREFELT % 10)))
          (QSETREFV % 85 (SPADCALL '|hankelH2| 2 (QREFELT % 10)))
          (QSETREFV % 86 (SPADCALL '|lommelS1| 3 (QREFELT % 10)))
          (QSETREFV % 87 (SPADCALL '|lommelS2| 3 (QREFELT % 10)))
          (QSETREFV % 88 (SPADCALL '|kummerM| 3 (QREFELT % 10)))
          (QSETREFV % 89 (SPADCALL '|kummerU| 3 (QREFELT % 10)))
          (QSETREFV % 90 (SPADCALL '|legendreP| 3 (QREFELT % 10)))
          (QSETREFV % 91 (SPADCALL '|legendreQ| 3 (QREFELT % 10)))
          (QSETREFV % 92 (SPADCALL '|kelvinBei| 2 (QREFELT % 10)))
          (QSETREFV % 93 (SPADCALL '|kelvinBer| 2 (QREFELT % 10)))
          (QSETREFV % 94 (SPADCALL '|kelvinKei| 2 (QREFELT % 10)))
          (QSETREFV % 95 (SPADCALL '|kelvinKer| 2 (QREFELT % 10)))
          (QSETREFV % 96 (SPADCALL '|ellipticK| 1 (QREFELT % 10)))
          (QSETREFV % 97 (SPADCALL '|ellipticE| 1 (QREFELT % 10)))
          (QSETREFV % 98 (SPADCALL '|ellipticE2| 2 (QREFELT % 10)))
          (QSETREFV % 99 (SPADCALL '|ellipticF| 2 (QREFELT % 10)))
          (QSETREFV % 100 (SPADCALL '|ellipticPi| 3 (QREFELT % 10)))
          (QSETREFV % 101 (SPADCALL '|jacobiSn| 2 (QREFELT % 10)))
          (QSETREFV % 102 (SPADCALL '|jacobiCn| 2 (QREFELT % 10)))
          (QSETREFV % 103 (SPADCALL '|jacobiDn| 2 (QREFELT % 10)))
          (QSETREFV % 104 (SPADCALL '|jacobiZeta| 2 (QREFELT % 10)))
          (QSETREFV % 105 (SPADCALL '|jacobiTheta| 2 (QREFELT % 10)))
          (QSETREFV % 106 (SPADCALL '|weierstrassPInverse| 3 (QREFELT % 10)))
          (QSETREFV % 107 (SPADCALL '|lerchPhi| 3 (QREFELT % 10)))
          (QSETREFV % 108 (SPADCALL '|riemannZeta| 1 (QREFELT % 10)))
          (QSETREFV % 109 (SPADCALL '|charlierC| 3 (QREFELT % 10)))
          (QSETREFV % 110 (SPADCALL '|hermiteH| 2 (QREFELT % 10)))
          (QSETREFV % 111 (SPADCALL '|jacobiP| 4 (QREFELT % 10)))
          (QSETREFV % 112 (SPADCALL '|laguerreL| 3 (QREFELT % 10)))
          (QSETREFV % 113 (SPADCALL '|meixnerM| 4 (QREFELT % 10)))
          (QSETREFV % 114 (SPADCALL '|%logGamma| 1 (QREFELT % 10)))
          (QSETREFV % 115 (SPADCALL '|%eis| 1 (QREFELT % 10)))
          (QSETREFV % 116 (SPADCALL '|%erfs| 1 (QREFELT % 10)))
          (QSETREFV % 117 (SPADCALL '|%erfis| 1 (QREFELT % 10)))
          (QSETREFV % 118 (SPADCALL '|integral| 3 (QREFELT % 10)))
          (QSETREFV % 119 (SPADCALL '|%iint| (QREFELT % 43)))
          (QSETREFV % 120 (SPADCALL '|%defint| 5 (QREFELT % 10)))
          (QSETREFV % 121 (SPADCALL '|factorial| 1 (QREFELT % 10)))
          (QSETREFV % 122 (SPADCALL '|permutation| 2 (QREFELT % 10)))
          (QSETREFV % 123 (SPADCALL '|binomial| 2 (QREFELT % 10)))
          (QSETREFV % 124 (SPADCALL '|%power| 2 (QREFELT % 10)))
          (QSETREFV % 125 (SPADCALL '|summation| 3 (QREFELT % 10)))
          (QSETREFV % 126 (SPADCALL '|%defsum| 5 (QREFELT % 10)))
          (QSETREFV % 127 (SPADCALL '|product| 3 (QREFELT % 10)))
          (QSETREFV % 128 (SPADCALL '|%defprod| 5 (QREFELT % 10)))
          (QSETREFV % 129 (SPADCALL '|%root_sum| 3 (QREFELT % 10)))
          (QSETREFV % 130 (SPADCALL '|floor| 1 (QREFELT % 10)))
          (QSETREFV % 131 (SPADCALL '|ceil| 1 (QREFELT % 10)))
          (QSETREFV % 132 (SPADCALL '|fractionPart| 1 (QREFELT % 10)))
          (QSETREFV % 133 (SPADCALL '|real| 1 (QREFELT % 10)))
          (QSETREFV % 134 (SPADCALL '|imag| 1 (QREFELT % 10)))
          (QSETREFV % 135 (SPADCALL '|conjugate| 1 (QREFELT % 10)))
          (QSETREFV % 136 (SPADCALL '|arg| 1 (QREFELT % 10)))
          (QSETREFV % 137 (SPADCALL '|sign| 1 (QREFELT % 10)))
          (QSETREFV % 138 (SPADCALL '|unitStep| 1 (QREFELT % 10)))
          (QSETREFV % 139 (SPADCALL '|diracDelta| 1 (QREFELT % 10)))
          (QSETREFV % 140 (SPADCALL '|max| (QREFELT % 43)))
          (QSETREFV % 141 (SPADCALL '|min| (QREFELT % 43)))
          (QSETREFV % 142 (LIST (QREFELT % 12) (QREFELT % 11)))
          (QSETREFV % 143
                    (LIST (QREFELT % 17) (QREFELT % 18) (QREFELT % 19)
                          (QREFELT % 20) (QREFELT % 21) (QREFELT % 22)
                          (QREFELT % 23) (QREFELT % 24) (QREFELT % 25)
                          (QREFELT % 26) (QREFELT % 27) (QREFELT % 28)))
          (QSETREFV % 144
                    (LIST (QREFELT % 29) (QREFELT % 30) (QREFELT % 31)
                          (QREFELT % 32) (QREFELT % 33) (QREFELT % 34)
                          (QREFELT % 35) (QREFELT % 36) (QREFELT % 37)
                          (QREFELT % 38) (QREFELT % 39) (QREFELT % 40)))
          (QSETREFV % 147
                    (SPADCALL (QREFELT % 143) (QREFELT % 144) (QREFELT % 146)))
          (QSETREFV % 148
                    (SPADCALL (QREFELT % 147)
                              (LIST (QREFELT % 13) (QREFELT % 14)
                                    (QREFELT % 15))
                              (QREFELT % 146)))
          (QSETREFV % 149
                    (LIST (QREFELT % 50) (QREFELT % 51) (QREFELT % 46)
                          (QREFELT % 47) (QREFELT % 48) (QREFELT % 49)
                          (QREFELT % 52) (QREFELT % 53) (QREFELT % 54)
                          (QREFELT % 118) (QREFELT % 120) (QREFELT % 55)
                          (QREFELT % 56) (QREFELT % 119)))
          (QSETREFV % 150
                    (LIST (QREFELT % 121) (QREFELT % 122) (QREFELT % 123)
                          (QREFELT % 124) (QREFELT % 125) (QREFELT % 126)
                          (QREFELT % 127) (QREFELT % 128)))
          (QSETREFV % 151
                    (LIST (QREFELT % 57) (QREFELT % 58) (QREFELT % 59)
                          (QREFELT % 60) (QREFELT % 61) (QREFELT % 16)
                          (QREFELT % 130) (QREFELT % 131) (QREFELT % 133)
                          (QREFELT % 134) (QREFELT % 137) (QREFELT % 140)
                          (QREFELT % 141) (QREFELT % 132) (QREFELT % 138)
                          (QREFELT % 139) (QREFELT % 136) (QREFELT % 135)
                          (QREFELT % 114) (QREFELT % 115) (QREFELT % 116)
                          (QREFELT % 117) (QREFELT % 62) (QREFELT % 63)
                          (QREFELT % 64) (QREFELT % 65) (QREFELT % 66)
                          (QREFELT % 68) (QREFELT % 67) (QREFELT % 69)
                          (QREFELT % 70) (QREFELT % 71) (QREFELT % 72)
                          (QREFELT % 73) (QREFELT % 75) (QREFELT % 74)
                          (QREFELT % 76) (QREFELT % 77) (QREFELT % 78)
                          (QREFELT % 79) (QREFELT % 80) (QREFELT % 81)
                          (QREFELT % 82) (QREFELT % 83) (QREFELT % 84)
                          (QREFELT % 85) (QREFELT % 86) (QREFELT % 87)
                          (QREFELT % 88) (QREFELT % 89) (QREFELT % 90)
                          (QREFELT % 91) (QREFELT % 92) (QREFELT % 93)
                          (QREFELT % 94) (QREFELT % 95) (QREFELT % 96)
                          (QREFELT % 97) (QREFELT % 98) (QREFELT % 99)
                          (QREFELT % 100) (QREFELT % 101) (QREFELT % 102)
                          (QREFELT % 103) (QREFELT % 104) (QREFELT % 105)
                          (QREFELT % 107) (QREFELT % 108) (QREFELT % 109)
                          (QREFELT % 110) (QREFELT % 111) (QREFELT % 112)
                          (QREFELT % 113) (QREFELT % 106)))
          (QSETREFV % 152
                    (LIST (QREFELT % 42) (QREFELT % 45) (QREFELT % 41)
                          (QREFELT % 44)))
          (QSETREFV % 153
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QREFELT % 142) (QREFELT % 148)
                                  (QREFELT % 146))
                        (QREFELT % 149) (QREFELT % 146))
                       (QREFELT % 150) (QREFELT % 146))
                      (QREFELT % 151) (QREFELT % 146))
                     (QREFELT % 152) (QREFELT % 146)))
          (QSETREFV % 154
                    (LIST (QREFELT % 18) (QREFELT % 21) (QREFELT % 30)
                          (QREFELT % 33) (QREFELT % 16) (QREFELT % 139)))
          (QSETREFV % 155
                    (LIST (QREFELT % 17) (QREFELT % 22) (QREFELT % 19)
                          (QREFELT % 20) (QREFELT % 23) (QREFELT % 28)
                          (QREFELT % 25) (QREFELT % 29) (QREFELT % 34)
                          (QREFELT % 31) (QREFELT % 32) (QREFELT % 35)
                          (QREFELT % 40) (QREFELT % 37) (QREFELT % 38)
                          (QREFELT % 46) (QREFELT % 48) (QREFELT % 52)
                          (QREFELT % 53) (QREFELT % 55) (QREFELT % 56)
                          (QREFELT % 137) (QREFELT % 133) (QREFELT % 134)))
          (QSETREFV % 156
                    (LIST (QREFELT % 45) (QREFELT % 11) (QREFELT % 118)
                          (QREFELT % 129) (QREFELT % 125) (QREFELT % 127)))
          (QSETREFV % 157
                    (LIST (QREFELT % 120) (QREFELT % 126) (QREFELT % 128)))
          %))) 

(MAKEPROP '|CommonOperators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|brandNew?| (|Symbol|)
              (|NonNegativeInteger|) (|BasicOperator|) (0 . |operator|)
              '|opalg| '|oproot| '|oppi| '|oplog| '|opexp| '|opabs| '|opsin|
              '|opcos| '|optan| '|opcot| '|opsec| '|opcsc| '|opasin| '|opacos|
              '|opatan| '|opacot| '|opasec| '|opacsc| '|opsinh| '|opcosh|
              '|optanh| '|opcoth| '|opsech| '|opcsch| '|opasinh| '|opacosh|
              '|opatanh| '|opacoth| '|opasech| '|opacsch| '|opbox| '|oppren|
              (6 . |operator|) '|opquote| '|opdiff| '|opsi| '|opci| '|opshi|
              '|opchi| '|opei| '|opli| '|operf| '|operfi| '|opli2| '|opfis|
              '|opfic| '|opGamma| '|opGamma2| '|opBeta| '|opdigamma|
              '|oppolygamma| '|opBesselJ| '|opBesselY| '|opBesselI|
              '|opBesselK| '|opAiryAi| '|opAiryAiPrime| '|opAiryBi|
              '|opAiryBiPrime| '|opLambertW| '|opPolylog| '|opWeierstrassP|
              '|opWeierstrassPPrime| '|opWeierstrassSigma| '|opWeierstrassZeta|
              '|opHypergeometricF| '|opMeijerG| '|opWhittakerM| '|opWhittakerW|
              '|opAngerJ| '|opWeberE| '|opStruveH| '|opStruveL| '|opHankelH1|
              '|opHankelH2| '|opLommelS1| '|opLommelS2| '|opKummerM|
              '|opKummerU| '|opLegendreP| '|opLegendreQ| '|opKelvinBei|
              '|opKelvinBer| '|opKelvinKei| '|opKelvinKer| '|opEllipticK|
              '|opEllipticE| '|opEllipticE2| '|opEllipticF| '|opEllipticPi|
              '|opJacobiSn| '|opJacobiCn| '|opJacobiDn| '|opJacobiZeta|
              '|opJacobiTheta| '|opWeierstrassPInverse| '|opLerchPhi|
              '|opRiemannZeta| '|opCharlierC| '|opHermiteH| '|opJacobiP|
              '|opLaguerreL| '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs|
              '|op_erfis| '|opint| '|opiint| '|opdint| '|opfact| '|opperm|
              '|opbinom| '|oppow| '|opsum| '|opdsum| '|opprod| '|opdprod|
              '|oprootsum| '|opfloor| '|opceil| '|op_fractionPart| '|opreal|
              '|opimag| '|opconjugate| '|oparg| '|opsign| '|op_unitStep|
              '|op_diracDelta| '|opmax| '|opmin| '|algop| '|rtrigop| '|htrigop|
              (|List| 9) (11 . |concat|) '|trigop| '|elemop| '|primop|
              '|combop| '|specop| '|anyop| '|allop| '|evenop| '|oddop|
              '|dummyvarop1| '|dummyvarop2| (|Boolean|) (17 . |is?|)
              (23 . |copy|) |COMMONOP;operator;SBo;1| (|OutputForm|)
              (28 . |coerce|) (33 . |paren|) (38 . |postfix|) (44 . |quote|)
              (|List| %) (49 . |prefix|) (|None|) (55 . |setProperty|)
              (62 . |coerce|) (67 . =) (73 . ^) (|InputForm|) (79 . |convert|)
              (|Integer|) (|List| 174) (84 . |elt|) (90 . |convert|)
              (|Mapping| 162 162) (95 . |display|) (101 . |commaSeparate|)
              (|Mapping| 162 186) (106 . |display|) (112 . |supersub|)
              (|List| 162) (118 . |first|) (123 . |second|) (128 . |binomial|)
              (134 . |third|) (139 . |sum|) (146 . |prod|) (153 . |hconcat|)
              (159 . *) (165 . |empty|) (169 . |int|) (176 . |convert|)
              (181 . |concat|) (187 . |concat|) (|Mapping| 174 177)
              (193 . |input|) (199 . |first|) (204 . |One|) (208 . |One|)
              (212 . |One|) (216 . |second|) (221 . /) (227 . |assert|)
              (|Void|) (233 . |void|))
           '#(|operator| 237) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|operator| ((|BasicOperator|) (|Symbol|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 210
                                            '(2 9 0 7 8 10 1 9 0 7 43 2 145 0 0
                                              0 146 2 9 158 0 7 159 1 9 0 0 160
                                              1 7 162 0 163 1 162 0 0 164 2 162
                                              0 0 0 165 1 162 0 0 166 2 162 0 0
                                              167 168 3 9 0 0 7 169 170 1 8 162
                                              0 171 2 162 158 0 0 172 2 162 0 0
                                              0 173 1 174 0 7 175 2 177 174 0
                                              176 178 1 174 0 167 179 2 9 0 0
                                              180 181 1 162 0 167 182 2 9 0 0
                                              183 184 2 162 0 0 167 185 1 186
                                              162 0 187 1 186 162 0 188 2 162 0
                                              0 0 189 1 186 162 0 190 3 162 0 0
                                              0 0 191 3 162 0 0 0 0 192 2 162 0
                                              0 0 193 2 162 0 0 0 194 0 162 0
                                              195 3 162 0 0 0 0 196 1 7 174 0
                                              197 2 177 0 0 174 198 2 177 0 174
                                              0 199 2 9 0 0 200 201 1 177 174 0
                                              202 0 8 0 203 0 176 0 204 0 174 0
                                              205 1 177 174 0 206 2 174 0 0 0
                                              207 2 9 0 0 7 208 0 209 0 210 1 0
                                              9 7 161)))))
           '|lookupComplete|)) 

(MAKEPROP '|CommonOperators| 'NILADIC T) 
