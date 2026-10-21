
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

(MAKEPROP '|SULS;coerce;Suts%;5| '|SPADreplace| '(XLAM (|uts|) |uts|)) 

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

(MAKEPROP '|SULS;removeZeroes;2%;10| '|SPADreplace| '(XLAM (|uls|) |uls|)) 

(SDEFUN |SULS;removeZeroes;2%;10| ((|uls| (%)) (% (%))) |uls|) 

(MAKEPROP '|SULS;removeZeroes;I2%;11| '|SPADreplace| '(XLAM (|n| |uls|) |uls|)) 

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
         ((|ord| (|Integer|)) (|recipr| (|Union| % "failed")) (|uls3| (%))
          (#1=#:G71 NIL))
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
         ((|e| (|Integer|)) (#1=#:G78 NIL) (|m| (|Integer|)) (#2=#:G81 NIL)
          (|poly| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|c| (|Fraction| (|Polynomial| |Coef|))) (#3=#:G82 NIL))
         (SEQ
          (COND
           ((ZEROP (LETT |e| (SPADCALL |uls| 0 (QREFELT % 24))))
            (COND ((MINUSP |n|) (|spadConstant| % 56))
                  (#4='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |uls| (QREFELT % 30))
                              (PROG1 (LETT #1# |n|)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
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
                                  (PROG1 (LETT #3# (- |e|))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
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
         ((|ord0| #1=(|Integer|)) (|order| #1#)
          (|n| (|Union| (|Integer|) "failed")) (|utsPow| (%))
          (|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)))
         (SEQ
          (COND
           ((MINUSP (LETT |ord0| (SPADCALL |uls| 0 (QREFELT % 24))))
            (SEQ (LETT |order| |ord0|)
                 (LETT |n|
                       (|exquo_INT| |order| (SPADCALL |r| (QREFELT % 129))))
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
                            (QREFELT % 130)))
                     (LETT |utsPow|
                           (SPADCALL (SPADCALL |uts| |r| (QREFELT % 131))
                                     (QREFELT % 27)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 15)
                                 (* (QCDR |n|) (SPADCALL |r| (QREFELT % 132)))
                                 (QREFELT % 18))
                       |utsPow| (QREFELT % 32)))))))))
           (#2#
            (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 130)))
                 (EXIT
                  (SPADCALL (SPADCALL |uts| |r| (QREFELT % 131))
                            (QREFELT % 27))))))))) 

(SDEFUN |SULS;coerce;%Of;57| ((|uls| (%)) (% (|OutputForm|)))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|nx| (|Union| (|Integer|) "failed"))
          (|count| (|NonNegativeInteger|)) (#1=#:G132 NIL)
          (|degr| (|Integer|)))
         (SEQ (LETT |st| (SPADCALL |uls| (QREFELT % 135)))
              (COND
               ((NULL (SPADCALL |st| (QREFELT % 136)))
                (COND
                 ((NULL (SPADCALL |st| (QREFELT % 137)))
                  (COND
                   ((QEQCAR
                     (LETT |nx|
                           (SPADCALL
                            (SPADCALL (SPADCALL |uls| (QREFELT % 139))
                                      (QREFELT % 141))
                            (QREFELT % 143)))
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
                         (EXIT (SPADCALL |uls| |degr| (QREFELT % 144))))))))))
              (EXIT
               (SPADCALL |st| (SPADCALL |uls| (QREFELT % 139))
                         (SPADCALL |uls| (QREFELT % 11))
                         (SPADCALL |uls| (QREFELT % 12)) (|spadConstant| % 145)
                         (QREFELT % 147)))))) 

(DECLAIM (NOTINLINE |SparseUnivariateLaurentSeries;|)) 

(DEFUN |SparseUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G184 NIL)
    (#2=#:G182 NIL) (#3=#:G181 NIL) (#4=#:G179 NIL) (#5=#:G180 NIL)
    (#6=#:G178 NIL) (#7=#:G176 NIL) (#8=#:G175 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|SparseUnivariateLaurentSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 191))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
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
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #1#
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
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #1# (|HasCategory| |#1| '(|Field|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|RetractableTo| (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #3#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ComparableRepresentation|)))
                                        (LETT #4#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|OrderedRing|)))
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|SparseUnivariateTaylorSeries|
                                                 |#1| |#2| |#3|)
                                                '(|OrderedRing|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         #5#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         #5#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|ComparableRepresentation|)))
                                         #5#)
                                        (LETT #6#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|PolynomialFactorizationExplicit|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #6#)
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
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|SemiRing|))
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
                                        (LETT #7#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #7#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1# (|HasCategory| |#1| '(|Field|))
                                         #2# #7#
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
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #8# #1#)
                                         (AND #8#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #8# #2#) (AND #8# #7#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                         (AND #8#
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              #4#)
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
    (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|)))
         (AND (|HasCategory| |#1| '(|Field|)) #3#))
     (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#1| '(|Field|)) (|HasCategory| % '(|AbelianGroup|))
         #4# (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| |#1| '(|Field|)) (|HasCategory| % '(|SetWithZero|)) #4#
         (|augmentPredVector| % 36028797018963968))
    (AND (|HasCategory| |#1| '(|Field|))
         (|HasCategory| % '(|CharacteristicNonZero|)) #6#
         (|augmentPredVector| % 72057594037927936))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2305843009213693952))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #7#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4611686018427387904))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 9223372036854775808))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 18446744073709551616))
    (AND
     (OR #8# (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 36893488147419103232))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|InnerSparseUnivariatePowerSeries| |#1|))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 45 (CONS (|dispatchFunction| |SULS;/;2Suts%;18|) %))))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV % 49 (CONS (|dispatchFunction| |SULS;exquo;2%U;20|) %))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 44 (CONS (|dispatchFunction| |SULS;/;3%;21|) %))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV % 65
                 (CONS (|dispatchFunction| |SULS;rationalFunction;%IF;24|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |SULS;rationalFunction;%2IF;25|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 2)
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
        ((|testBitVector| |pv$| 18)
         (QSETREFV % 128 (CONS (|dispatchFunction| |SULS;^;%F%;55|) %)))
        ('T (QSETREFV % 128 (CONS (|dispatchFunction| |SULS;^;%F%;56|) %)))))))
    %))) 

(DEFUN |SparseUnivariateLaurentSeries| (&REST #1=#:G185)
  (SPROG NIL
         (PROG (#2=#:G186)
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
              (0 . |zero?|) (5 . |1|) (9 . |1|) (|Integer|) (13 . |monomial|)
              (19 . |0|) (23 . |0|) (27 . +)
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
              |SULS;elt;3%;23| (|Fraction| 57) (93 . |0|) (|Polynomial| 6)
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
              (461 . |retract|) (466 . ^) (472 . |numer|)
              (|Record| (|:| |k| 17) (|:| |c| 6)) (|Stream| 133)
              (477 . |getStream|) (482 . |explicitlyEmpty?|)
              (487 . |explicitEntries?|) (|Reference| 140) (492 . |getRef|)
              (|OrderedCompletion| 17) (497 . |elt|) (|Union| 17 '"failed")
              (502 . |retractIfCan|) (507 . |extend|) (513 . |1|)
              (|OutputForm|) (517 . |seriesToOutputForm|) |SULS;coerce;%Of;57|
              (|String|) (|PositiveInteger|) (|List| 133) (|Mapping| 6 6)
              (|Mapping| 6 17) (|Stream| 6) (|Union| 165 '#1="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| 174) (|Pattern| 17)
              (|Equation| 26) (|List| 160) (|List| 26) (|List| 10)
              (|Record| (|:| |mat| 166) (|:| |vec| (|Vector| 17))) (|Vector| %)
              (|Matrix| 17) (|PatternMatchResult| 174 %)
              (|PatternMatchResult| 17 %) (|Factored| 170)
              (|SparseUnivariatePolynomial| %) (|Union| 172 '#1#) (|List| 170)
              (|DoubleFloat|) (|Float|) (|Union| 126 '#2="failed")
              (|Union| 10 '#2#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 39) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 180 '#3="failed") (|Union| 183 '#3#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 183) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Matrix| 26)
              (|Record| (|:| |mat| 188) (|:| |vec| (|Vector| 26)))
              (|Mapping| 26 26))
           '#(~= 526 |zero?| 532 |wholePart| 537 |variable| 542 |unitNormal|
              547 |unitCanonical| 552 |unit?| 557 |truncate| 562 |terms| 575
              |taylorRep| 580 |taylorIfCan| 585 |taylor| 590 |tanh| 595 |tan|
              600 |subtractIfCan| 605 |squareFreePolynomial| 611
              |squareFreePart| 616 |squareFree| 621 |sqrt| 626
              |solveLinearPolynomialEquation| 631 |smaller?| 637 |sizeLess?|
              643 |sinh| 649 |sin| 654 |sign| 659 |series| 664 |sech| 669 |sec|
              674 |sample| 679 |rightRecip| 683 |rightPower| 688 |retractIfCan|
              700 |retract| 720 |removeZeroes| 740 |rem| 751 |reductum| 757
              |reducedSystem| 762 |recip| 784 |rationalFunction| 789 |quo| 802
              |principalIdeal| 808 |prime?| 813 |positive?| 818 |pole?| 823
              |plenaryPower| 828 |pi| 834 |patternMatch| 838 |order| 852
              |opposite?| 863 |one?| 869 |numerator| 874 |numer| 879 |nthRoot|
              884 |nextItem| 890 |negative?| 895 |multiplyExponents| 900
              |multiplyCoefficients| 906 |multiEuclidean| 912 |monomial?| 918
              |monomial| 923 |min| 929 |max| 935 |map| 941 |log| 953
              |leftRecip| 958 |leftPower| 963 |leadingTerm| 975
              |leadingSupport| 980 |leadingMonomial| 985 |leadingCoefficient|
              990 |lcmCoef| 995 |lcm| 1001 |laurent| 1012 |latex| 1024 |inv|
              1029 |integrate| 1034 |init| 1051 |gcdPolynomial| 1055 |gcd| 1061
              |fractionPart| 1072 |floor| 1077 |factorSquareFreePolynomial|
              1082 |factorPolynomial| 1087 |factor| 1092 |extendedEuclidean|
              1097 |extend| 1110 |exquo| 1116 |expressIdealMember| 1122 |exp|
              1128 |eval| 1133 |euclideanSize| 1179 |elt| 1184 |divide| 1202
              |differentiate| 1208 |denominator| 1264 |denom| 1269 |degree|
              1274 |csch| 1279 |csc| 1284 |coth| 1289 |cot| 1294 |cosh| 1299
              |cos| 1304 |convert| 1309 |constructOrdered| 1334 |construct|
              1339 |conditionP| 1344 |complete| 1349 |commutator| 1354 |coerce|
              1360 |coefficient| 1400 |charthRoot| 1406 |characteristic| 1411
              |center| 1415 |ceiling| 1420 |atanh| 1425 |atan| 1430
              |associator| 1435 |associates?| 1442 |asinh| 1448 |asin| 1453
              |asech| 1458 |asec| 1463 |approximate| 1468 |antiCommutator| 1474
              |annihilate?| 1480 |acsch| 1486 |acsc| 1491 |acoth| 1496 |acot|
              1501 |acosh| 1506 |acos| 1511 |abs| 1516 ^ 1521 D 1551 >= 1601 >
              1607 = 1613 <= 1619 < 1625 |1| 1631 |0| 1635 / 1639 - 1657 + 1668
              * 1674)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 3 0 3 0 35 3 0 3 3 0 3 0 25 3 24 3 3 42 41
                                  3 30 31 25 24 19 45 45 3 40 31 24 19 3 3 31
                                  24 19 0 12 3 3 44 31 0 0 0 12 3 45 3 31 31 0
                                  0 0 0 0 30 30 51 30 40 40 50 3 30 30 40 49 0
                                  0 16 15 3 8 33 52 0 0 3 10 27 27 7 4 24 2 0 0
                                  3 14 13 11 10 9 27 27 30 7 7 6 32 5 4 44 3 3
                                  25 24 2 2 2 2 2 2 1 0 0 0 0))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |QuotientFieldCategory&| |UnivariateLaurentSeriesCategory&|
                |Field&| NIL |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UnivariatePowerSeriesCategory&|
                |UniqueFactorizationDomain&| NIL |PowerSeriesCategory&|
                |GcdDomain&| |AbelianMonoidRing&| NIL |DifferentialExtension&|
                NIL |DivisionRing&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL |OrderedAbelianSemiGroup&| |AbelianGroup&| |OrderedSet&|
                NIL NIL NIL NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&| NIL
                |NonAssociativeSemiRng&| NIL NIL |FullyEvalableOver&| NIL NIL
                |SetWithZero&| |AbelianSemiGroup&| |Magma&| NIL |Evalable&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&| NIL
                |TranscendentalFunctionCategory&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |RadicalCategory&|
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
                 (|GcdDomain|) (|AbelianMonoidRing| 6 17) (|IntegralDomain|)
                 (|DifferentialExtension|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|CommutativeRing|) (|DivisionRing|) (|LeftOreRing|)
                 (|DifferentialRing|) (|PartialDifferentialRing| 10)
                 (|Algebra| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|OrderedRing|) (|Algebra| 126) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|SemiRing|) (|NonAssociativeAlgebra| 126)
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
                 (|NonAssociativeRing|) (|BiModule| 126 126) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 17)
                 (|RightModule| 17)
                 (|RightModule| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRng|)
                 (|LeftModule| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RightModule| 126) (|LeftModule| 126) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|OrderedMagmaWithZero|)
                 (|OrderedAbelianSemiGroup|) (|AbelianGroup|) (|OrderedSet|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|MagmaWithZero|) (|Comparable|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 17) (|PatternMatchable| 174)
                 (|FullyEvalableOver| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|StepThrough|) (|ComparableRepresentation|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|Magma|)
                 (|Patternable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Evalable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| 17) (|RetractableTo| 126) (|RealConstant|)
                 (|RetractableTo| 10) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|RetractableTo| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Type|) (|ConvertibleTo| 159) (|ConvertibleTo| 158)
                 (|Eltable| (|SparseUnivariateTaylorSeries| 6 7 8) $$)
                 (|InnerEvalable| (|SparseUnivariateTaylorSeries| 6 7 8)
                                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| 10 (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|CoercibleFrom| 17) (|CoercibleFrom| 126) (|PartialOrder|)
                 (|ConvertibleTo| 174) (|ConvertibleTo| 173)
                 (|ConvertibleTo| 157) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|CoercibleFrom| 10) (|unitsKnown|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|RadicalCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 146) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|)
                 (|CoercibleFrom| (|SparseUnivariateTaylorSeries| 6 7 8)))
              (|makeByteWordVec2| 190
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
                                    1 126 17 0 129 1 0 26 0 130 2 26 0 0 126
                                    131 1 126 17 0 132 1 9 134 0 135 1 134 13 0
                                    136 1 134 13 0 137 1 9 138 0 139 1 138 140
                                    0 141 1 140 142 0 143 2 0 0 0 17 144 0 126
                                    0 145 5 9 146 134 138 10 6 126 147 2 0 13 0
                                    0 1 1 64 13 0 1 1 37 26 0 1 1 0 10 0 11 1
                                    59 177 0 1 1 59 0 0 1 1 59 13 0 1 2 0 0 0
                                    17 1 3 0 0 0 17 17 66 1 0 134 0 1 1 0 26 0
                                    36 1 0 28 0 29 1 0 26 0 30 1 2 0 0 107 1 2
                                    0 0 83 2 65 46 0 0 1 1 35 169 170 1 1 3 0 0
                                    1 1 3 179 0 1 1 2 0 0 1 2 35 171 172 170 1
                                    2 28 13 0 0 1 2 3 13 0 0 1 1 2 0 0 103 1 2
                                    0 0 79 1 56 17 0 1 1 0 0 134 1 1 2 0 0 111
                                    1 2 0 0 87 0 64 0 1 1 62 46 0 1 2 0 0 0 150
                                    1 2 62 0 0 39 1 1 0 28 0 31 1 27 142 0 1 1
                                    27 175 0 1 1 4 176 0 1 1 0 26 0 130 1 27 17
                                    0 1 1 27 126 0 1 1 4 10 0 1 1 0 0 0 34 2 0
                                    0 17 0 35 2 3 0 0 0 1 1 17 0 0 1 2 12 164
                                    156 165 1 1 12 166 156 1 1 3 188 156 1 2 3
                                    189 156 165 1 1 62 46 0 48 3 23 55 0 17 17
                                    67 2 23 55 0 17 65 2 3 0 0 0 1 1 3 186 183
                                    1 1 3 13 0 1 1 56 13 0 1 1 0 13 0 25 2 60 0
                                    0 150 1 0 2 0 1 3 15 167 0 158 167 1 3 16
                                    168 0 159 168 1 1 0 17 0 1 2 0 17 0 17 24 2
                                    64 13 0 0 1 1 62 13 0 1 1 3 0 0 1 1 3 26 0
                                    38 2 2 0 0 17 1 1 8 46 0 1 1 56 13 0 1 2 0
                                    0 0 150 1 2 0 0 153 0 1 2 3 182 183 0 1 1 0
                                    13 0 1 2 0 0 6 17 18 2 30 0 0 0 1 2 30 0 0
                                    0 1 2 0 0 152 0 1 2 3 0 190 0 1 1 2 0 0 72
                                    1 62 46 0 1 2 0 0 0 150 1 2 62 0 0 39 1 1
                                    17 133 0 1 1 17 17 0 1 1 0 0 0 1 1 0 6 0 1
                                    2 3 187 0 0 1 1 3 0 183 1 2 3 0 0 0 1 2 0 0
                                    17 154 1 2 0 0 17 26 33 1 0 149 0 1 1 3 0 0
                                    1 2 22 0 0 10 1 1 2 0 0 70 2 2 0 0 22 71 0
                                    8 0 1 2 3 170 170 170 1 1 3 0 183 1 2 3 0 0
                                    0 1 1 37 0 0 1 1 36 26 0 1 1 35 169 170 1 1
                                    35 169 170 1 1 3 179 0 1 3 3 181 0 0 0 1 2
                                    3 184 0 0 1 2 0 0 0 17 144 2 59 46 0 0 49 2
                                    3 182 183 0 1 1 2 0 0 73 2 10 0 0 160 1 2
                                    10 0 0 161 1 3 10 0 0 162 162 1 3 10 0 0 26
                                    26 1 3 9 0 0 10 26 1 3 9 0 0 163 162 1 2 20
                                    154 0 6 1 1 3 39 0 1 2 0 6 0 17 1 2 11 0 0
                                    26 1 2 1 0 0 0 54 2 3 185 0 0 1 2 0 0 0 22
                                    51 2 42 0 0 39 1 1 42 0 0 50 3 41 0 0 163
                                    178 1 2 41 0 0 163 1 3 41 0 0 10 39 1 2 41
                                    0 0 10 1 2 3 0 0 190 1 3 3 0 0 190 39 1 1 3
                                    0 0 1 1 3 26 0 41 1 0 17 0 37 1 2 0 0 113 1
                                    2 0 0 89 1 2 0 0 109 1 2 0 0 85 1 2 0 0 105
                                    1 2 0 0 81 1 6 157 0 1 1 13 158 0 1 1 14
                                    159 0 1 1 7 173 0 1 1 7 174 0 1 1 17 0 151
                                    1 1 0 0 151 1 1 57 155 156 1 1 0 0 0 1 2 63
                                    0 0 0 1 1 0 146 0 148 1 0 0 26 27 1 0 0 22
                                    23 1 53 0 6 1 1 4 0 10 1 1 54 0 126 1 1 61
                                    0 0 1 1 63 0 17 1 2 0 6 0 17 68 1 57 46 0 1
                                    0 63 39 1 1 0 6 0 12 1 36 26 0 1 1 2 0 0
                                    119 1 2 0 0 95 3 63 0 0 0 0 1 2 59 13 0 0 1
                                    1 2 0 0 115 1 2 0 0 91 1 2 0 0 123 1 2 0 0
                                    99 2 21 6 0 17 1 2 0 0 0 0 1 2 63 13 0 0 1
                                    1 2 0 0 125 1 2 0 0 101 1 2 0 0 121 1 2 0 0
                                    97 1 2 0 0 117 1 2 0 0 93 1 55 0 0 1 2 0 0
                                    0 150 1 2 62 0 0 39 53 2 2 0 0 0 74 2 2 0 0
                                    126 128 2 3 0 0 17 1 2 42 0 0 39 1 1 42 0 0
                                    1 3 41 0 0 163 178 1 2 41 0 0 163 1 3 41 0
                                    0 10 39 1 2 41 0 0 10 1 3 3 0 0 190 39 1 2
                                    3 0 0 190 1 2 30 13 0 0 1 2 30 13 0 0 1 2 0
                                    13 0 0 1 2 30 13 0 0 1 2 30 13 0 0 1 0 62 0
                                    16 0 64 0 20 2 3 0 0 6 1 2 3 0 0 0 44 2 3 0
                                    26 26 45 2 66 0 0 0 1 1 66 0 0 1 2 0 0 0 0
                                    21 2 0 0 150 0 1 2 0 0 0 0 32 2 0 0 6 0 1 2
                                    0 0 0 6 1 2 12 0 0 17 1 2 58 0 126 0 1 2 58
                                    0 0 126 1 2 66 0 17 0 1 2 64 0 39 0 1 2 3 0
                                    26 0 42 2 3 0 0 26 43)))))
           '|lookupComplete|)) 
