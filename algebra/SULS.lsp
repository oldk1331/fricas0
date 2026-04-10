
(SDEFUN |SULS;variable;%S;1| ((|x| (%)) (% (|Symbol|))) (QREFELT % 7)) 

(SDEFUN |SULS;center;%Coef;2| ((|x| (%)) (% (|Coef|))) (QREFELT % 8)) 

(SDEFUN |SULS;coerce;V%;3| ((|v| (|Variable| |var|)) (% (%)))
        (COND
         ((SPADCALL (QREFELT % 8) (QREFELT % 14))
          (SPADCALL (|spadConstant| % 15) 1 (QREFELT % 18)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| % 15) 1 (QREFELT % 18))
                    (SPADCALL (QREFELT % 8) 0 (QREFELT % 18)) (QREFELT % 21))))) 

(SDEFUN |SULS;pole?;%B;4| ((|x| (%)) (% (|Boolean|)))
        (MINUSP (SPADCALL |x| 0 (QREFELT % 24)))) 

(PUT '|SULS;coerce;Suts%;5| '|SPADreplace| '(XLAM (|uts|) |uts|)) 

(SDEFUN |SULS;coerce;Suts%;5|
        ((|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)) (% (%)))
        |uts|) 

(SDEFUN |SULS;taylorIfCan;%U;6|
        ((|uls| (%))
         (%
          (|Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
                   "failed")))
        (COND ((SPADCALL |uls| (QREFELT % 25)) (CONS 1 "failed"))
              ('T (CONS 0 |uls|)))) 

(SDEFUN |SULS;taylor;%Suts;7|
        ((|uls| (%)) (% (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)))
        (SPROG
         ((|uts|
           (|Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
                    "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 29)))
              (EXIT
               (COND
                ((QEQCAR |uts| 1)
                 (|error| "taylor: Laurent series has a pole"))
                ('T (QCDR |uts|))))))) 

(SDEFUN |SULS;retractIfCan;%U;8|
        ((|x| (%))
         (%
          (|Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
                   "failed")))
        (SPADCALL |x| (QREFELT % 29))) 

(SDEFUN |SULS;laurent;ISuts%;9|
        ((|n| (|Integer|))
         (|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)) (% (%)))
        (SPADCALL (SPADCALL (|spadConstant| % 15) |n| (QREFELT % 18))
                  (SPADCALL |uts| (QREFELT % 27)) (QREFELT % 32))) 

(PUT '|SULS;removeZeroes;2%;10| '|SPADreplace| '(XLAM (|uls|) |uls|)) 

(SDEFUN |SULS;removeZeroes;2%;10| ((|uls| (%)) (% (%))) |uls|) 

(PUT '|SULS;removeZeroes;I2%;11| '|SPADreplace| '(XLAM (|n| |uls|) |uls|)) 

(SDEFUN |SULS;removeZeroes;I2%;11| ((|n| (|Integer|)) (|uls| (%)) (% (%)))
        |uls|) 

(SDEFUN |SULS;taylorRep;%Suts;12|
        ((|uls| (%)) (% (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|spadConstant| % 15) (- (SPADCALL |uls| 0 (QREFELT % 24)))
                    (QREFELT % 18))
          |uls| (QREFELT % 32))
         (QREFELT % 30))) 

(SDEFUN |SULS;degree;%I;13| ((|uls| (%)) (% (|Integer|)))
        (SPADCALL |uls| 0 (QREFELT % 24))) 

(SDEFUN |SULS;numer;%Suts;14|
        ((|uls| (%)) (% (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)))
        (SPADCALL |uls| (QREFELT % 36))) 

(SDEFUN |SULS;denom;%Suts;15|
        ((|uls| (%)) (% (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)))
        (SPROG ((#1=#:G41 NIL))
               (SPADCALL (|spadConstant| % 15)
                         (PROG1
                             (LETT #1# (- (SPADCALL |uls| 0 (QREFELT % 24))))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT % 40)))) 

(SDEFUN |SULS;*;Suts2%;16|
        ((|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
         (|uls| (%)) (% (%)))
        (SPADCALL (SPADCALL |uts| (QREFELT % 27)) |uls| (QREFELT % 32))) 

(SDEFUN |SULS;*;%Suts%;17|
        ((|uls| (%))
         (|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)) (% (%)))
        (SPADCALL |uls| (SPADCALL |uts| (QREFELT % 27)) (QREFELT % 32))) 

(SDEFUN |SULS;/;2Suts%;18|
        ((|uts1| #1=(|SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
         (|uts2| #1#) (% (%)))
        (SPADCALL (SPADCALL |uts1| (QREFELT % 27))
                  (SPADCALL |uts2| (QREFELT % 27)) (QREFELT % 44))) 

(SDEFUN |SULS;recip;%U;19| ((|uls| (%)) (% (|Union| % "failed")))
        (SPADCALL (|spadConstant| % 16) |uls| NIL (QREFELT % 47))) 

(SDEFUN |SULS;exquo;2%U;20|
        ((|uls1| (%)) (|uls2| (%)) (% (|Union| % "failed")))
        (SPADCALL |uls1| |uls2| NIL (QREFELT % 47))) 

(SDEFUN |SULS;/;3%;21| ((|uls1| (%)) (|uls2| (%)) (% (%)))
        (SPROG ((|q| (|Union| % "failed")))
               (SEQ (LETT |q| (SPADCALL |uls1| |uls2| (QREFELT % 49)))
                    (EXIT
                     (COND
                      ((QEQCAR |q| 1) (|error| "quotient cannot be computed"))
                      ('T (QCDR |q|))))))) 

(SDEFUN |SULS;differentiate;%V%;22|
        ((|uls| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |uls| (QREFELT % 50))) 

(SDEFUN |SULS;elt;3%;23| ((|uls1| (%)) (|uls2| (%)) (% (%)))
        (SPROG
         ((#1=#:G68 NIL) (|uls3| (%)) (|recipr| (|Union| % "failed"))
          (|ord| (|Integer|)))
         (SEQ
          (COND
           ((< (SPADCALL |uls2| 1 (QREFELT % 24)) 1)
            (|error| "elt: second argument must have positive order"))
           ((MINUSP (LETT |ord| (SPADCALL |uls1| 0 (QREFELT % 24))))
            (SEQ (LETT |recipr| (SPADCALL |uls2| (QREFELT % 48)))
                 (EXIT
                  (COND
                   ((QEQCAR |recipr| 1)
                    (|error| "elt: second argument not invertible"))
                   (#2='T
                    (SEQ
                     (LETT |uls3|
                           (SPADCALL |uls1|
                                     (SPADCALL (|spadConstant| % 15) (- |ord|)
                                               (QREFELT % 18))
                                     (QREFELT % 32)))
                     (EXIT
                      (SPADCALL (SPADCALL |uls3| |uls2| (QREFELT % 52))
                                (SPADCALL (QCDR |recipr|)
                                          (PROG1 (LETT #1# (- |ord|))
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT % 53))
                                (QREFELT % 32)))))))))
           (#2# (SPADCALL |uls1| |uls2| (QREFELT % 52))))))) 

(SDEFUN |SULS;rationalFunction;%IF;24|
        ((|uls| (%)) (|n| (|Integer|)) (% (|Fraction| (|Polynomial| |Coef|))))
        (SPROG
         ((#1=#:G79 NIL) (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#2=#:G78 NIL)
          (|m| (|Integer|)) (#3=#:G75 NIL) (|e| (|Integer|)))
         (SEQ
          (COND
           ((ZEROP (LETT |e| (SPADCALL |uls| 0 (QREFELT % 24))))
            (COND ((MINUSP |n|) (|spadConstant| % 56))
                  (#4='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |uls| (QREFELT % 30))
                              (PROG1 (LETT #3# |n|)
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              (QREFELT % 58))
                    (QREFELT % 59)))))
           ((MINUSP (LETT |m| (- |n| |e|))) (|spadConstant| % 56))
           (#4#
            (SEQ
             (LETT |poly|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 15) (- |e|) (QREFELT % 18))
                       |uls| (QREFELT % 32))
                      (QREFELT % 30))
                     (PROG1 (LETT #2# |m|)
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     (QREFELT % 58))
                    (QREFELT % 59)))
             (LETT |v|
                   (SPADCALL (SPADCALL |uls| (QREFELT % 11)) (QREFELT % 60)))
             (LETT |c|
                   (SPADCALL
                    (SPADCALL (SPADCALL |uls| (QREFELT % 12)) (QREFELT % 61))
                    (QREFELT % 59)))
             (EXIT
              (SPADCALL |poly|
                        (SPADCALL (SPADCALL |v| |c| (QREFELT % 62))
                                  (PROG1 (LETT #1# (- |e|))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT % 63))
                        (QREFELT % 64))))))))) 

(SDEFUN |SULS;rationalFunction;%2IF;25|
        ((|uls| (%)) (|n1| #1=(|Integer|)) (|n2| #1#)
         (% (|Fraction| (|Polynomial| |Coef|))))
        (SPADCALL (SPADCALL |uls| |n1| |n2| (QREFELT % 66)) |n2|
                  (QREFELT % 65))) 

(SDEFUN |SULS;integrate;2%;26| ((|uls| (%)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |uls| -1 (QREFELT % 68)) (QREFELT % 14))
          (|error| "integrate: series has term of order -1"))
         ('T (SPADCALL |uls| (QREFELT % 69))))) 

(SDEFUN |SULS;integrate;%V%;27| ((|uls| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |uls| (QREFELT % 70))) 

(SDEFUN |SULS;^;3%;28| ((|uls1| (%)) (|uls2| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |uls1| (QREFELT % 72)) |uls2| (QREFELT % 32))
         (QREFELT % 73))) 

(SDEFUN |SULS;exp;2%;29| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 76))) 

(SDEFUN |SULS;log;2%;30| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 77))) 

(SDEFUN |SULS;sin;2%;31| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 78))) 

(SDEFUN |SULS;cos;2%;32| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 80))) 

(SDEFUN |SULS;tan;2%;33| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 82))) 

(SDEFUN |SULS;cot;2%;34| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 84))) 

(SDEFUN |SULS;sec;2%;35| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 86))) 

(SDEFUN |SULS;csc;2%;36| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 88))) 

(SDEFUN |SULS;asin;2%;37| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 90))) 

(SDEFUN |SULS;acos;2%;38| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 92))) 

(SDEFUN |SULS;atan;2%;39| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 94))) 

(SDEFUN |SULS;acot;2%;40| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 96))) 

(SDEFUN |SULS;asec;2%;41| ((|uls| (%)) (% (%))) (SPADCALL |uls| (QREFELT % 98))) 

(SDEFUN |SULS;acsc;2%;42| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 100))) 

(SDEFUN |SULS;sinh;2%;43| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 102))) 

(SDEFUN |SULS;cosh;2%;44| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 104))) 

(SDEFUN |SULS;tanh;2%;45| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 106))) 

(SDEFUN |SULS;coth;2%;46| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 108))) 

(SDEFUN |SULS;sech;2%;47| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 110))) 

(SDEFUN |SULS;csch;2%;48| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 112))) 

(SDEFUN |SULS;asinh;2%;49| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 114))) 

(SDEFUN |SULS;acosh;2%;50| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 116))) 

(SDEFUN |SULS;atanh;2%;51| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 118))) 

(SDEFUN |SULS;acoth;2%;52| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 120))) 

(SDEFUN |SULS;asech;2%;53| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 122))) 

(SDEFUN |SULS;acsch;2%;54| ((|uls| (%)) (% (%)))
        (SPADCALL |uls| (QREFELT % 124))) 

(SDEFUN |SULS;^;%F%;55| ((|uls| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |uls| |r| (QREFELT % 127))) 

(SDEFUN |SULS;^;%F%;56| ((|uls| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPROG
         ((|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
          (|utsPow| (%)) (|n| (|Union| (|Integer|) "failed"))
          (|order| #1=(|Integer|)) (|ord0| #1#))
         (SEQ
          (COND
           ((MINUSP (LETT |ord0| (SPADCALL |uls| 0 (QREFELT % 24))))
            (SEQ (LETT |order| |ord0|)
                 (LETT |n|
                       (SPADCALL |order| (SPADCALL |r| (QREFELT % 129))
                                 (QREFELT % 130)))
                 (EXIT
                  (COND
                   ((QEQCAR |n| 1)
                    (|error| "^: rational power does not exist"))
                   (#2='T
                    (SEQ
                     (LETT |uts|
                           (SPADCALL
                            (SPADCALL |uls|
                                      (SPADCALL (|spadConstant| % 15)
                                                (- |order|) (QREFELT % 18))
                                      (QREFELT % 32))
                            (QREFELT % 131)))
                     (LETT |utsPow|
                           (SPADCALL (SPADCALL |uts| |r| (QREFELT % 132))
                                     (QREFELT % 27)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 15)
                                 (* (QCDR |n|) (SPADCALL |r| (QREFELT % 133)))
                                 (QREFELT % 18))
                       |utsPow| (QREFELT % 32)))))))))
           (#2#
            (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 131)))
                 (EXIT
                  (SPADCALL (SPADCALL |uts| |r| (QREFELT % 132))
                            (QREFELT % 27))))))))) 

(SDEFUN |SULS;coerce;%Of;57| ((|uls| (%)) (% (|OutputForm|)))
        (SPROG
         ((|degr| (|Integer|)) (#1=#:G125 NIL) (|count| (|NonNegativeInteger|))
          (|nx| (|Union| (|Integer|) "failed"))
          (|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ (LETT |st| (SPADCALL |uls| (QREFELT % 136)))
              (COND
               ((NULL (SPADCALL |st| (QREFELT % 137)))
                (COND
                 ((NULL (SPADCALL |st| (QREFELT % 138)))
                  (COND
                   ((QEQCAR
                     (LETT |nx|
                           (SPADCALL
                            (SPADCALL (SPADCALL |uls| (QREFELT % 140))
                                      (QREFELT % 142))
                            (QREFELT % 144)))
                     0)
                    (SEQ (LETT |count| |$streamCount|)
                         (LETT |degr|
                               (MIN |count|
                                    (+
                                     (+
                                      (PROG2 (LETT #1# |nx|)
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (|Integer|)
                                                        (|Union| (|Integer|)
                                                                 "failed")
                                                        #1#))
                                      |count|)
                                     1)))
                         (EXIT (SPADCALL |uls| |degr| (QREFELT % 145))))))))))
              (EXIT
               (SPADCALL |st| (SPADCALL |uls| (QREFELT % 140))
                         (SPADCALL |uls| (QREFELT % 11))
                         (SPADCALL |uls| (QREFELT % 12)) (|spadConstant| % 146)
                         (QREFELT % 148)))))) 

(DECLAIM (NOTINLINE |SparseUnivariateLaurentSeries;|)) 

(DEFUN |SparseUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G165 NIL) (#2=#:G166 NIL) (#3=#:G168 NIL) (#4=#:G169 NIL)
    (#5=#:G170 NIL) (#6=#:G171 NIL) (#7=#:G173 NIL) (#8=#:G174 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|SparseUnivariateLaurentSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 192))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicNonZero|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RealConstant|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|SparseUnivariateTaylorSeries|
                                                 |#1| |#2| |#3|)
                                                '(|OrderedIntegralDomain|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         #8#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #7#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|Comparable|)))
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|SparseUnivariateTaylorSeries|
                                                 |#1| |#2| |#3|)
                                                '(|OrderedSet|))))
                                        (OR #8# #5#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|Comparable|)))
                                         #8# #5#)
                                        (LETT #4#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|PolynomialFactorizationExplicit|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #4#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|EuclideanDomain|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|Comparable|)))
                                            #8# #5#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #4#)
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RealConstant|)))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|StepThrough|))))
                                        (AND #3#
                                             (|HasSignature| |#1|
                                                             (LIST '|integrate|
                                                                   (LIST
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    '(|Symbol|))))
                                             (|HasSignature| |#1|
                                                             (LIST '|variables|
                                                                   (LIST
                                                                    '(|List|
                                                                      (|Symbol|))
                                                                    (|devaluate|
                                                                     |#1|)))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR (|HasCategory| |#1| '(|SemiRing|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #7# (|HasCategory| |#1| '(|Field|))
                                            #6# #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND #3#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateLaurentSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| |#1| '(|Field|))
         (|HasCategory| % '(|CharacteristicNonZero|)) #4#
         (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR #3# (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR #1# (AND #7# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 1152921504606846976))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|InnerSparseUnivariatePowerSeries| |#1|))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 45 (CONS (|dispatchFunction| |SULS;/;2Suts%;18|) %))))
    (COND
     ((|testBitVector| |pv$| 24)
      (QSETREFV % 49 (CONS (|dispatchFunction| |SULS;exquo;2%U;20|) %))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 44 (CONS (|dispatchFunction| |SULS;/;3%;21|) %))))
    (COND
     ((|testBitVector| |pv$| 24)
      (PROGN
       (QSETREFV % 65
                 (CONS (|dispatchFunction| |SULS;rationalFunction;%IF;24|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |SULS;rationalFunction;%2IF;25|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 35)
      (PROGN
       (QSETREFV % 70 (CONS (|dispatchFunction| |SULS;integrate;2%;26|) %))
       (QSETREFV % 71 (CONS (|dispatchFunction| |SULS;integrate;%V%;27|) %))
       (QSETREFV % 74 (CONS (|dispatchFunction| |SULS;^;3%;28|) %))
       (QSETREFV % 73 (CONS (|dispatchFunction| |SULS;exp;2%;29|) %))
       (QSETREFV % 72 (CONS (|dispatchFunction| |SULS;log;2%;30|) %))
       (QSETREFV % 79 (CONS (|dispatchFunction| |SULS;sin;2%;31|) %))
       (QSETREFV % 81 (CONS (|dispatchFunction| |SULS;cos;2%;32|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |SULS;tan;2%;33|) %))
       (QSETREFV % 85 (CONS (|dispatchFunction| |SULS;cot;2%;34|) %))
       (QSETREFV % 87 (CONS (|dispatchFunction| |SULS;sec;2%;35|) %))
       (QSETREFV % 89 (CONS (|dispatchFunction| |SULS;csc;2%;36|) %))
       (QSETREFV % 91 (CONS (|dispatchFunction| |SULS;asin;2%;37|) %))
       (QSETREFV % 93 (CONS (|dispatchFunction| |SULS;acos;2%;38|) %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |SULS;atan;2%;39|) %))
       (QSETREFV % 97 (CONS (|dispatchFunction| |SULS;acot;2%;40|) %))
       (QSETREFV % 99 (CONS (|dispatchFunction| |SULS;asec;2%;41|) %))
       (QSETREFV % 101 (CONS (|dispatchFunction| |SULS;acsc;2%;42|) %))
       (QSETREFV % 103 (CONS (|dispatchFunction| |SULS;sinh;2%;43|) %))
       (QSETREFV % 105 (CONS (|dispatchFunction| |SULS;cosh;2%;44|) %))
       (QSETREFV % 107 (CONS (|dispatchFunction| |SULS;tanh;2%;45|) %))
       (QSETREFV % 109 (CONS (|dispatchFunction| |SULS;coth;2%;46|) %))
       (QSETREFV % 111 (CONS (|dispatchFunction| |SULS;sech;2%;47|) %))
       (QSETREFV % 113 (CONS (|dispatchFunction| |SULS;csch;2%;48|) %))
       (QSETREFV % 115 (CONS (|dispatchFunction| |SULS;asinh;2%;49|) %))
       (QSETREFV % 117 (CONS (|dispatchFunction| |SULS;acosh;2%;50|) %))
       (QSETREFV % 119 (CONS (|dispatchFunction| |SULS;atanh;2%;51|) %))
       (QSETREFV % 121 (CONS (|dispatchFunction| |SULS;acoth;2%;52|) %))
       (QSETREFV % 123 (CONS (|dispatchFunction| |SULS;asech;2%;53|) %))
       (QSETREFV % 125 (CONS (|dispatchFunction| |SULS;acsch;2%;54|) %))
       (COND
        ((|testBitVector| |pv$| 20)
         (QSETREFV % 128 (CONS (|dispatchFunction| |SULS;^;%F%;55|) %)))
        ('T (QSETREFV % 128 (CONS (|dispatchFunction| |SULS;^;%F%;56|) %)))))))
    %))) 

(DEFUN |SparseUnivariateLaurentSeries| (&REST #1=#:G175)
  (SPROG NIL
         (PROG (#2=#:G176)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseUnivariateLaurentSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateLaurentSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateLaurentSeries|)))))))))) 

(MAKEPROP '|SparseUnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerSparseUnivariatePowerSeries| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Symbol|)
              |SULS;variable;%S;1| |SULS;center;%Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Integer|)
              (13 . |monomial|) (19 . |Zero|) (23 . |Zero|) (27 . +)
              (|Variable| (NRTEVAL (QREFELT % 7))) |SULS;coerce;V%;3|
              (33 . |order|) |SULS;pole?;%B;4|
              (|SparseUnivariateTaylorSeries| 6 (NRTEVAL (QREFELT % 7))
                                              (NRTEVAL (QREFELT % 8)))
              |SULS;coerce;Suts%;5| (|Union| 26 '"failed")
              |SULS;taylorIfCan;%U;6| |SULS;taylor;%Suts;7|
              |SULS;retractIfCan;%U;8| (39 . *) |SULS;laurent;ISuts%;9|
              |SULS;removeZeroes;2%;10| |SULS;removeZeroes;I2%;11|
              |SULS;taylorRep;%Suts;12| |SULS;degree;%I;13|
              |SULS;numer;%Suts;14| (|NonNegativeInteger|) (45 . |monomial|)
              |SULS;denom;%Suts;15| |SULS;*;Suts2%;16| |SULS;*;%Suts%;17|
              (51 . /) (57 . /) (|Union| % '"failed") (63 . |iExquo|)
              |SULS;recip;%U;19| (70 . |exquo|) (76 . |differentiate|)
              |SULS;differentiate;%V%;22| (81 . |iCompose|) (87 . ^)
              |SULS;elt;3%;23| (|Fraction| 57) (93 . |Zero|) (|Polynomial| 6)
              (97 . |polynomial|) (103 . |coerce|) (108 . |coerce|)
              (113 . |coerce|) (118 . -) (124 . ^) (130 . /)
              (136 . |rationalFunction|) (142 . |truncate|)
              (149 . |rationalFunction|) (156 . |coefficient|)
              (162 . |integrate|) (167 . |integrate|) (172 . |integrate|)
              (178 . |log|) (183 . |exp|) (188 . ^)
              (|ElementaryFunctionsUnivariateLaurentSeries| 6 26 $$)
              (194 . |exp|) (199 . |log|) (204 . |sin|) (209 . |sin|)
              (214 . |cos|) (219 . |cos|) (224 . |tan|) (229 . |tan|)
              (234 . |cot|) (239 . |cot|) (244 . |sec|) (249 . |sec|)
              (254 . |csc|) (259 . |csc|) (264 . |asin|) (269 . |asin|)
              (274 . |acos|) (279 . |acos|) (284 . |atan|) (289 . |atan|)
              (294 . |acot|) (299 . |acot|) (304 . |asec|) (309 . |asec|)
              (314 . |acsc|) (319 . |acsc|) (324 . |sinh|) (329 . |sinh|)
              (334 . |cosh|) (339 . |cosh|) (344 . |tanh|) (349 . |tanh|)
              (354 . |coth|) (359 . |coth|) (364 . |sech|) (369 . |sech|)
              (374 . |csch|) (379 . |csch|) (384 . |asinh|) (389 . |asinh|)
              (394 . |acosh|) (399 . |acosh|) (404 . |atanh|) (409 . |atanh|)
              (414 . |acoth|) (419 . |acoth|) (424 . |asech|) (429 . |asech|)
              (434 . |acsch|) (439 . |acsch|) (|Fraction| 17)
              (444 . |cRationalPower|) (450 . ^) (456 . |denom|)
              (461 . |exquo|) (467 . |retract|) (472 . ^) (478 . |numer|)
              (|Record| (|:| |k| 17) (|:| |c| 6)) (|Stream| 134)
              (483 . |getStream|) (488 . |explicitlyEmpty?|)
              (493 . |explicitEntries?|) (|Reference| 141) (498 . |getRef|)
              (|OrderedCompletion| 17) (503 . |elt|) (|Union| 17 '"failed")
              (508 . |retractIfCan|) (513 . |extend|) (519 . |One|)
              (|OutputForm|) (523 . |seriesToOutputForm|) |SULS;coerce;%Of;57|
              (|String|) (|PositiveInteger|) (|List| 134) (|Mapping| 6 6)
              (|Mapping| 6 17) (|Stream| 6) (|Union| 167 '#1="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| 175) (|Pattern| 17)
              (|List| 162) (|Equation| 26) (|List| 26) (|List| 10)
              (|Matrix| 17)
              (|Record| (|:| |mat| 165) (|:| |vec| (|Vector| 17))) (|Vector| %)
              (|PatternMatchResult| 175 %) (|PatternMatchResult| 17 %)
              (|Factored| 171) (|SparseUnivariatePolynomial| %)
              (|Union| 173 '#1#) (|List| 171) (|DoubleFloat|) (|Float|)
              (|Union| 126 '#2="failed") (|Union| 10 '#2#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 39) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 181 '#3="failed") (|Union| 184 '#3#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 184) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |mat| 190) (|:| |vec| (|Vector| 26)))
              (|Matrix| 26) (|Mapping| 26 26))
           '#(~= 532 |zero?| 538 |wholePart| 543 |variable| 548 |unitNormal|
              553 |unitCanonical| 558 |unit?| 563 |truncate| 568 |terms| 581
              |taylorRep| 586 |taylorIfCan| 591 |taylor| 596 |tanh| 601 |tan|
              606 |subtractIfCan| 611 |squareFreePolynomial| 617
              |squareFreePart| 622 |squareFree| 627 |sqrt| 632
              |solveLinearPolynomialEquation| 637 |smaller?| 643 |sizeLess?|
              649 |sinh| 655 |sin| 660 |sign| 665 |series| 670 |sech| 675 |sec|
              680 |sample| 685 |rightRecip| 689 |rightPower| 694 |retractIfCan|
              706 |retract| 726 |removeZeroes| 746 |rem| 757 |reductum| 763
              |reducedSystem| 768 |recip| 790 |rationalFunction| 795 |quo| 808
              |principalIdeal| 814 |prime?| 819 |positive?| 824 |pole?| 829
              |plenaryPower| 834 |pi| 840 |patternMatch| 844 |order| 858
              |opposite?| 869 |one?| 875 |numerator| 880 |numer| 885 |nthRoot|
              890 |nextItem| 896 |negative?| 901 |multiplyExponents| 906
              |multiplyCoefficients| 912 |multiEuclidean| 918 |monomial?| 924
              |monomial| 929 |min| 935 |max| 941 |map| 947 |log| 959
              |leftRecip| 964 |leftPower| 969 |leadingTerm| 981
              |leadingSupport| 986 |leadingMonomial| 991 |leadingCoefficient|
              996 |lcmCoef| 1001 |lcm| 1007 |laurent| 1018 |latex| 1030 |inv|
              1035 |integrate| 1040 |init| 1057 |gcdPolynomial| 1061 |gcd| 1067
              |fractionPart| 1078 |floor| 1083 |factorSquareFreePolynomial|
              1088 |factorPolynomial| 1093 |factor| 1098 |extendedEuclidean|
              1103 |extend| 1116 |exquo| 1122 |expressIdealMember| 1128 |exp|
              1134 |eval| 1139 |euclideanSize| 1185 |elt| 1190 |divide| 1208
              |differentiate| 1214 |denominator| 1270 |denom| 1275 |degree|
              1280 |csch| 1285 |csc| 1290 |coth| 1295 |cot| 1300 |cosh| 1305
              |cos| 1310 |convert| 1315 |constructOrdered| 1340 |construct|
              1345 |conditionP| 1350 |complete| 1355 |commutator| 1360 |coerce|
              1366 |coefficient| 1406 |charthRoot| 1412 |characteristic| 1417
              |center| 1421 |ceiling| 1426 |atanh| 1431 |atan| 1436
              |associator| 1441 |associates?| 1448 |asinh| 1454 |asin| 1459
              |asech| 1464 |asec| 1469 |approximate| 1474 |antiCommutator| 1480
              |annihilate?| 1486 |acsch| 1492 |acsc| 1497 |acoth| 1502 |acot|
              1507 |acosh| 1512 |acos| 1517 |abs| 1522 ^ 1527 |Zero| 1557 |One|
              1561 D 1565 >= 1615 > 1621 = 1627 <= 1633 < 1639 / 1645 - 1663 +
              1674 * 1680)
           'NIL
           (CONS
            (|makeByteWordVec2| 51
                                '(0 2 0 2 0 32 2 0 2 2 0 7 2 0 26 2 7 25 2 2 42
                                  41 2 8 4 36 26 25 21 45 45 2 36 40 25 21 2 2
                                  36 25 21 0 14 2 2 7 36 44 0 0 0 14 2 45 2 7
                                  36 36 0 0 0 0 0 7 7 51 7 7 40 40 50 2 29 40
                                  49 0 0 18 17 2 10 30 0 0 2 12 9 9 6 3 25 36 0
                                  0 2 16 15 13 12 11 9 9 29 6 6 5 3 44 2 2 26
                                  25 36 36 36 36 36 36 1 0 0 0 0))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |QuotientFieldCategory&| |UnivariateLaurentSeriesCategory&|
                |Field&| NIL |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UnivariatePowerSeriesCategory&|
                |UniqueFactorizationDomain&| NIL |PowerSeriesCategory&| NIL
                |GcdDomain&| |AbelianMonoidRing&| NIL |DifferentialExtension&|
                NIL NIL |DivisionRing&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |OrderedAbelianGroup&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL NIL |OrderedSet&| |MagmaWithUnit&|
                |AbelianMonoid&| NIL |NonAssociativeSemiRng&| NIL NIL
                |FullyEvalableOver&| NIL NIL |AbelianSemiGroup&| |Magma&| NIL
                |Evalable&| |RetractableTo&| |RetractableTo&| NIL
                |RetractableTo&| NIL |TranscendentalFunctionCategory&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |RadicalCategory&|
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|SparseUnivariateTaylorSeries|
                                                                6 7 8))
                 (|QuotientFieldCategory|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 17)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UnivariatePowerSeriesCategory| 6 17)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 17 (|SingletonAsOrderedSet|))
                 (|OrderedIntegralDomain|) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 17) (|IntegralDomain|)
                 (|DifferentialExtension|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|OrderedRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|LeftOreRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 10)
                 (|Algebra| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 126) (|EntireRing|) (|Algebra| $$) (|Algebra| 6)
                 (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeAlgebra| 126) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|FullyLinearlyExplicitOver|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Module| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Module| 126) (|Module| $$) (|Module| 6) (|SemiRng|)
                 (|LinearlyExplicitOver| 17)
                 (|LinearlyExplicitOver|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|BiModule| (|SparseUnivariateTaylorSeries| 6 7 8)
                             (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|OrderedAbelianGroup|) (|BiModule| 126 126)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 17) (|RightModule| 17)
                 (|RightModule| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRng|)
                 (|LeftModule| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 126)
                 (|LeftModule| 126) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|OrderedMonoid|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|) (|OrderedSemiGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|OrderedSet|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 17) (|PatternMatchable| 175)
                 (|FullyEvalableOver| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|Patternable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Evalable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| 17) (|RetractableTo| 126) (|RealConstant|)
                 (|RetractableTo| 10) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|RetractableTo| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Type|) (|ConvertibleTo| 160) (|ConvertibleTo| 159)
                 (|Eltable| (|SparseUnivariateTaylorSeries| 6 7 8) $$)
                 (|InnerEvalable| (|SparseUnivariateTaylorSeries| 6 7 8)
                                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| 10 (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|CoercibleFrom| 17) (|CoercibleFrom| 126) (|PartialOrder|)
                 (|ConvertibleTo| 175) (|ConvertibleTo| 174)
                 (|ConvertibleTo| 158) (|CoercibleFrom| 10) (|unitsKnown|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|RadicalCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 147) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|)
                 (|CoercibleFrom| (|SparseUnivariateTaylorSeries| 6 7 8)))
              (|makeByteWordVec2| 191
                                  '(1 6 13 0 14 0 6 0 15 0 0 0 16 2 0 0 6 17 18
                                    0 6 0 19 0 0 0 20 2 0 0 0 0 21 2 0 17 0 17
                                    24 2 0 0 0 0 32 2 26 0 6 39 40 2 0 0 0 0 44
                                    2 0 0 26 26 45 3 9 46 0 0 13 47 2 0 46 0 0
                                    49 1 0 0 0 50 2 9 0 0 0 52 2 0 0 0 39 53 0
                                    55 0 56 2 26 57 0 39 58 1 55 0 57 59 1 55 0
                                    10 60 1 57 0 6 61 2 55 0 0 0 62 2 55 0 0 17
                                    63 2 55 0 0 0 64 2 0 55 0 17 65 3 0 0 0 17
                                    17 66 3 0 55 0 17 17 67 2 0 6 0 17 68 1 9 0
                                    0 69 1 0 0 0 70 2 0 0 0 22 71 1 0 0 0 72 1
                                    0 0 0 73 2 0 0 0 0 74 1 75 2 2 76 1 75 2 2
                                    77 1 75 2 2 78 1 0 0 0 79 1 75 2 2 80 1 0 0
                                    0 81 1 75 2 2 82 1 0 0 0 83 1 75 2 2 84 1 0
                                    0 0 85 1 75 2 2 86 1 0 0 0 87 1 75 2 2 88 1
                                    0 0 0 89 1 75 2 2 90 1 0 0 0 91 1 75 2 2 92
                                    1 0 0 0 93 1 75 2 2 94 1 0 0 0 95 1 75 2 2
                                    96 1 0 0 0 97 1 75 2 2 98 1 0 0 0 99 1 75 2
                                    2 100 1 0 0 0 101 1 75 2 2 102 1 0 0 0 103
                                    1 75 2 2 104 1 0 0 0 105 1 75 2 2 106 1 0 0
                                    0 107 1 75 2 2 108 1 0 0 0 109 1 75 2 2 110
                                    1 0 0 0 111 1 75 2 2 112 1 0 0 0 113 1 75 2
                                    2 114 1 0 0 0 115 1 75 2 2 116 1 0 0 0 117
                                    1 75 2 2 118 1 0 0 0 119 1 75 2 2 120 1 0 0
                                    0 121 1 75 2 2 122 1 0 0 0 123 1 75 2 2 124
                                    1 0 0 0 125 2 9 0 0 126 127 2 0 0 0 126 128
                                    1 126 17 0 129 2 17 46 0 0 130 1 0 26 0 131
                                    2 26 0 0 126 132 1 126 17 0 133 1 9 135 0
                                    136 1 135 13 0 137 1 135 13 0 138 1 9 139 0
                                    140 1 139 141 0 142 1 141 143 0 144 2 0 0 0
                                    17 145 0 126 0 146 5 9 147 135 139 10 6 126
                                    148 2 0 13 0 0 1 1 59 13 0 1 1 34 26 0 1 1
                                    0 10 0 11 1 54 178 0 1 1 54 0 0 1 1 54 13 0
                                    1 2 0 0 0 17 1 3 0 0 0 17 17 66 1 0 135 0 1
                                    1 0 26 0 36 1 0 28 0 29 1 0 26 0 30 1 35 0
                                    0 107 1 35 0 0 83 2 60 46 0 0 1 1 32 170
                                    171 1 1 2 0 0 1 1 2 180 0 1 1 35 0 0 1 2 32
                                    172 173 171 1 2 27 13 0 0 1 2 2 13 0 0 1 1
                                    35 0 0 103 1 35 0 0 79 1 7 17 0 1 1 0 0 135
                                    1 1 35 0 0 111 1 35 0 0 87 0 59 0 1 1 57 46
                                    0 1 2 0 0 0 151 1 2 57 0 0 39 1 1 0 28 0 31
                                    1 9 143 0 1 1 9 176 0 1 1 3 177 0 1 1 0 26
                                    0 131 1 9 17 0 1 1 9 126 0 1 1 3 10 0 1 1 0
                                    0 0 34 2 0 0 17 0 35 2 2 0 0 0 1 1 19 0 0 1
                                    1 14 165 157 1 2 14 166 157 167 1 2 2 189
                                    157 167 1 1 2 190 157 1 1 57 46 0 48 3 24
                                    55 0 17 17 67 2 24 55 0 17 65 2 2 0 0 0 1 1
                                    2 187 184 1 1 2 13 0 1 1 7 13 0 1 1 0 13 0
                                    25 2 55 0 0 151 1 0 35 0 1 3 17 168 0 159
                                    168 1 3 18 169 0 160 169 1 1 0 17 0 1 2 0
                                    17 0 17 24 2 59 13 0 0 1 1 57 13 0 1 1 2 0
                                    0 1 1 2 26 0 38 2 35 0 0 17 1 1 10 46 0 1 1
                                    7 13 0 1 2 0 0 0 151 1 2 0 0 154 0 1 2 2
                                    183 184 0 1 1 0 13 0 1 2 0 0 6 17 18 2 28 0
                                    0 0 1 2 28 0 0 0 1 2 0 0 153 0 1 2 2 0 191
                                    0 1 1 35 0 0 72 1 57 46 0 1 2 0 0 0 151 1 2
                                    57 0 0 39 1 1 19 134 0 1 1 19 17 0 1 1 0 0
                                    0 1 1 0 6 0 1 2 2 188 0 0 1 1 2 0 184 1 2 2
                                    0 0 0 1 2 0 0 17 155 1 2 0 0 17 26 33 1 0
                                    150 0 1 1 2 0 0 1 2 37 0 0 10 1 1 35 0 0 70
                                    2 35 0 0 22 71 0 10 0 1 2 2 171 171 171 1 1
                                    2 0 184 1 2 2 0 0 0 1 1 34 0 0 1 1 33 26 0
                                    1 1 32 170 171 1 1 32 170 171 1 1 2 180 0 1
                                    3 2 182 0 0 0 1 2 2 185 0 0 1 2 0 0 0 17
                                    145 2 54 46 0 0 49 2 2 183 184 0 1 1 35 0 0
                                    73 2 12 0 0 161 1 3 12 0 0 26 26 1 2 12 0 0
                                    162 1 3 12 0 0 163 163 1 3 11 0 0 164 163 1
                                    3 11 0 0 10 26 1 2 22 155 0 6 1 1 2 39 0 1
                                    2 0 6 0 17 1 2 13 0 0 26 1 2 1 0 0 0 54 2 2
                                    186 0 0 1 2 0 0 0 22 51 2 42 0 0 39 1 1 42
                                    0 0 50 3 41 0 0 10 39 1 3 41 0 0 164 179 1
                                    2 41 0 0 10 1 2 41 0 0 164 1 3 2 0 0 191 39
                                    1 2 2 0 0 191 1 1 2 0 0 1 1 2 26 0 41 1 0
                                    17 0 37 1 35 0 0 113 1 35 0 0 89 1 35 0 0
                                    109 1 35 0 0 85 1 35 0 0 105 1 35 0 0 81 1
                                    5 158 0 1 1 15 159 0 1 1 16 160 0 1 1 6 174
                                    0 1 1 6 175 0 1 1 19 0 152 1 1 0 0 152 1 1
                                    53 156 157 1 1 0 0 0 1 2 58 0 0 0 1 1 0 147
                                    0 149 1 0 0 26 27 1 0 0 22 23 1 52 0 6 1 1
                                    3 0 10 1 1 56 0 0 1 1 58 0 17 1 1 35 0 126
                                    1 2 0 6 0 17 68 1 53 46 0 1 0 58 39 1 1 0 6
                                    0 12 1 33 26 0 1 1 35 0 0 119 1 35 0 0 95 3
                                    58 0 0 0 0 1 2 54 13 0 0 1 1 35 0 0 115 1
                                    35 0 0 91 1 35 0 0 123 1 35 0 0 99 2 23 6 0
                                    17 1 2 0 0 0 0 1 2 58 13 0 0 1 1 35 0 0 125
                                    1 35 0 0 101 1 35 0 0 121 1 35 0 0 97 1 35
                                    0 0 117 1 35 0 0 93 1 7 0 0 1 2 0 0 0 151 1
                                    2 57 0 0 39 53 2 35 0 0 0 74 2 35 0 0 126
                                    128 2 2 0 0 17 1 0 59 0 20 0 57 0 16 2 42 0
                                    0 39 1 1 42 0 0 1 3 41 0 0 164 179 1 3 41 0
                                    0 10 39 1 2 41 0 0 10 1 2 41 0 0 164 1 2 2
                                    0 0 191 1 3 2 0 0 191 39 1 2 28 13 0 0 1 2
                                    28 13 0 0 1 2 0 13 0 0 1 2 28 13 0 0 1 2 28
                                    13 0 0 1 2 2 0 0 6 1 2 2 0 0 0 44 2 2 0 26
                                    26 45 2 61 0 0 0 1 1 61 0 0 1 2 0 0 0 0 21
                                    2 0 0 151 0 1 2 0 0 0 0 32 2 0 0 6 0 1 2 0
                                    0 0 6 1 2 14 0 0 17 1 2 61 0 17 0 1 2 59 0
                                    39 0 1 2 35 0 126 0 1 2 35 0 0 126 1 2 2 0
                                    0 26 43 2 2 0 26 0 42)))))
           '|lookupComplete|)) 
