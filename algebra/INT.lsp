
(SDEFUN |INT;writeOMInt| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT % 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT % 10))
                (SPADCALL |dev| (- |x|) (QREFELT % 12))
                (EXIT (SPADCALL |dev| (QREFELT % 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT % 12)))))) 

(SDEFUN |INT;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 14))))
             (|INT;writeOMInt| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 15))))))) 

(MAKEPROP '|INT;zero?;%B;3| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;%B;3| ((|x| (%)) (% (|Boolean|))) (ZEROP |x|)) 

(MAKEPROP '|INT;one?;%B;4| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;%B;4| ((|x| (%)) (% (|Boolean|))) (EQL |x| 1)) 

(MAKEPROP '|INT;0;%;5| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;0;%;5| ((% (%))) 0) 

(MAKEPROP '|INT;1;%;6| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;1;%;6| ((% (%))) 1) 

(MAKEPROP '|INT;base;%;7| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;%;7| ((% (%))) 2) 

(MAKEPROP '|INT;copy;2%;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2%;8| ((|x| (%)) (% (%))) |x|) 

(MAKEPROP '|INT;inc;2%;9| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2%;9| ((|x| (%)) (% (%))) (+ |x| 1)) 

(MAKEPROP '|INT;dec;2%;10| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2%;10| ((|x| (%)) (% (%))) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs%Hs;11| ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(MAKEPROP '|INT;negative?;%B;12| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;%B;12| ((|x| (%)) (% (|Boolean|))) (MINUSP |x|)) 

(MAKEPROP '|INT;positive?;%B;13| '|SPADreplace| 'PLUSP) 

(SDEFUN |INT;positive?;%B;13| ((|x| (%)) (% (|Boolean|))) (PLUSP |x|)) 

(SDEFUN |INT;coerce;%Of;14| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 31))) 

(MAKEPROP '|INT;coerce;2%;15| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2%;15| ((|m| (|Integer|)) (% (%))) |m|) 

(MAKEPROP '|INT;convert;2%;16| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2%;16| ((|x| (%)) (% (|Integer|))) |x|) 

(MAKEPROP '|INT;length;2%;17| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2%;17| ((|a| (%)) (% (%))) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4%;18| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (+ |a| |b|))
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4%;19| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (- |a| |b|))
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4%;20| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;%F;21| ((|x| (%)) (% (|Float|)))
        (SPADCALL |x| (QREFELT % 40))) 

(MAKEPROP '|INT;convert;%Df;22| '|SPADreplace|
          '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;%Df;22| ((|x| (%)) (% (|DoubleFloat|)))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;%If;23| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 45))) 

(MAKEPROP '|INT;convert;%S;24| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;%S;24| ((|x| (%)) (% (|String|))) (STRINGIMAGE |x|)) 

(SDEFUN |INT;positiveRemainder;3%;25| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (COND
                ((MINUSP (LETT |r| (REM |a| |b|)))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(MAKEPROP '|INT;reducedSystem;2M;26| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;26|
        ((|m| (|Matrix| %)) (% (|Matrix| (|Integer|)))) |m|) 

(MAKEPROP '|INT;reducedSystem;MVR;27| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;27|
        ((|m| (|Matrix| %)) (|vec| (|Vector| %))
         (%
          (|Record| (|:| |mat| (|Matrix| (|Integer|)))
                    (|:| |vec| (|Vector| (|Integer|))))))
        (CONS |m| |vec|)) 

(MAKEPROP '|INT;abs;2%;28| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2%;28| ((|x| (%)) (% (%))) (ABS |x|)) 

(MAKEPROP '|INT;random;2%;29| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2%;29| ((|x| (%)) (% (%))) (RANDOM |x|)) 

(MAKEPROP '|INT;seedRandom;V;30| '|SPADreplace| 'SEEDRANDOM) 

(SDEFUN |INT;seedRandom;V;30| ((% (|Void|))) (SEEDRANDOM)) 

(MAKEPROP '|INT;=;2%B;31| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2%B;31| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQL |x| |y|)) 

(MAKEPROP '|INT;<;2%B;32| '|SPADreplace| '<) 

(SDEFUN |INT;<;2%B;32| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (< |x| |y|)) 

(MAKEPROP '|INT;>;2%B;33| '|SPADreplace| '>) 

(SDEFUN |INT;>;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (> |x| |y|)) 

(MAKEPROP '|INT;>=;2%B;34| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2%B;34| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (>= |x| |y|)) 

(MAKEPROP '|INT;<=;2%B;35| '|SPADreplace| '<=) 

(SDEFUN |INT;<=;2%B;35| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (<= |x| |y|)) 

(MAKEPROP '|INT;-;2%;36| '|SPADreplace| '-) 

(SDEFUN |INT;-;2%;36| ((|x| (%)) (% (%))) (- |x|)) 

(MAKEPROP '|INT;+;3%;37| '|SPADreplace| '+) 

(SDEFUN |INT;+;3%;37| ((|x| (%)) (|y| (%)) (% (%))) (+ |x| |y|)) 

(MAKEPROP '|INT;-;3%;38| '|SPADreplace| '-) 

(SDEFUN |INT;-;3%;38| ((|x| (%)) (|y| (%)) (% (%))) (- |x| |y|)) 

(MAKEPROP '|INT;*;3%;39| '|SPADreplace| '*) 

(SDEFUN |INT;*;3%;39| ((|x| (%)) (|y| (%)) (% (%))) (* |x| |y|)) 

(MAKEPROP '|INT;*;Pi2%;40| '|SPADreplace| '*) 

(SDEFUN |INT;*;Pi2%;40| ((|m| (|PositiveInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(MAKEPROP '|INT;*;Nni2%;41| '|SPADreplace| '*) 

(SDEFUN |INT;*;Nni2%;41| ((|m| (|NonNegativeInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(MAKEPROP '|INT;^;%Nni%;42| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Nni%;42| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(MAKEPROP '|INT;^;%Pi%;43| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Pi%;43| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(MAKEPROP '|INT;odd?;%B;44| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;%B;44| ((|x| (%)) (% (|Boolean|))) (ODDP |x|)) 

(MAKEPROP '|INT;even?;%B;45| '|SPADreplace| 'EVENP) 

(SDEFUN |INT;even?;%B;45| ((|x| (%)) (% (|Boolean|))) (EVENP |x|)) 

(MAKEPROP '|INT;max;3%;46| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3%;46| ((|x| (%)) (|y| (%)) (% (%))) (MAX |x| |y|)) 

(MAKEPROP '|INT;min;3%;47| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3%;47| ((|x| (%)) (|y| (%)) (% (%))) (MIN |x| |y|)) 

(MAKEPROP '|INT;divide;2%R;48| '|SPADreplace| '|divide_INT|) 

(SDEFUN |INT;divide;2%R;48|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (|divide_INT| |x| |y|)) 

(MAKEPROP '|INT;quo;3%;49| '|SPADreplace| '|quotient_INT|) 

(SDEFUN |INT;quo;3%;49| ((|x| (%)) (|y| (%)) (% (%))) (|quotient_INT| |x| |y|)) 

(MAKEPROP '|INT;rem;3%;50| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3%;50| ((|x| (%)) (|y| (%)) (% (%))) (REM |x| |y|)) 

(MAKEPROP '|INT;shift;3%;51| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3%;51| ((|x| (%)) (|y| (%)) (% (%))) (ASH |x| |y|)) 

(MAKEPROP '|INT;exquo;2%U;52| '|SPADreplace| '|exquo_INT|) 

(SDEFUN |INT;exquo;2%U;52| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (|exquo_INT| |x| |y|)) 

(SDEFUN |INT;recip;%U;53| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(MAKEPROP '|INT;gcd;3%;54| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3%;54| ((|x| (%)) (|y| (%)) (% (%))) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;%R;55|
        ((|x| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(MAKEPROP '|INT;unitCanonical;2%;56| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2%;56| ((|x| (%)) (% (%))) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;57|
        ((|lp| (|List| #1=(|SparseUnivariatePolynomial| %))) (|p| #1#)
         (% (|Union| (|List| (|SparseUnivariatePolynomial| %)) "failed")))
        (SPADCALL |lp| |p| (QREFELT % 93))) 

(SDEFUN |INT;squareFreePolynomial;SupF;58|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 101))) 

(SDEFUN |INT;factorPolynomial;SupF;59|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPROG ((|pp| (|SparseUnivariatePolynomial| %)) (#1=#:G107 NIL))
               (SEQ (LETT |pp| (SPADCALL |p| (QREFELT % 104)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pp| (QREFELT % 105))
                            (SPADCALL |p| (QREFELT % 105)))
                       (SPADCALL |p| (QREFELT % 107)))
                      ('T
                       (SPADCALL (SPADCALL |pp| (QREFELT % 107))
                                 (SPADCALL (ELT % 108)
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (|exquo_INT|
                                                       (SPADCALL |p|
                                                                 (QREFELT %
                                                                          105))
                                                       (SPADCALL |pp|
                                                                 (QREFELT %
                                                                          105))))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0) %
                                                              (|Union| %
                                                                       "failed")
                                                              #1#))
                                            (QREFELT % 110))
                                           (QREFELT % 114))
                                 (QREFELT % 115)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;60|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 117))) 

(SDEFUN |INT;gcdPolynomial;3Sup;61|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (COND ((SPADCALL |p| (QREFELT % 119)) (SPADCALL |q| (QREFELT % 120)))
              ((SPADCALL |q| (QREFELT % 119)) (SPADCALL |p| (QREFELT % 120)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT % 123))))) 

(SDEFUN |INT;opposite?;2%B;62| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2%B;63| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(SDEFUN |INT;powmod;4%;64| ((|x| (%)) (|n| (%)) (|p| (%)) (% (%)))
        (SPROG ((|y| (%)) (#1=#:G128 NIL) (|z| (%)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((MINUSP |x|) (LETT |x| (SPADCALL |x| |p| (QREFELT % 48)))))
                  (EXIT
                   (COND ((ZEROP |n|) 1) ((ZEROP |x|) 0)
                         ('T
                          (SEQ (LETT |y| 1) (LETT |z| |x|)
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (COND
                                       ((ODDP |n|)
                                        (LETT |y|
                                              (SPADCALL |y| |z| |p|
                                                        (QREFELT % 38)))))
                                      (EXIT
                                       (COND
                                        ((ZEROP (LETT |n| (ASH |n| -1)))
                                         (PROGN (LETT #1# |y|) (GO #2=#:G127)))
                                        ('T
                                         (LETT |z|
                                               (SPADCALL |z| |z| |p|
                                                         (QREFELT % 38)))))))
                                     NIL (GO G190) G191 (EXIT NIL)))))))))
                #2# (EXIT #1#)))) 

(SDEFUN |INT;symmetricRemainder;3%;65| ((|x| (%)) (|n| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ (LETT |r| (REM |x| |n|))
                    (EXIT
                     (COND ((EQL |r| 0) 0)
                           (#1='T
                            (SEQ (COND ((< |n| 0) (LETT |n| (- |n|))))
                                 (EXIT
                                  (COND
                                   ((> |r| 0)
                                    (COND ((> (* 2 |r|) |n|) (- |r| |n|))
                                          (#1# |r|)))
                                   ((<= (+ (* 2 |r|) |n|) 0) (+ |r| |n|))
                                   (#1# |r|)))))))))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|))
          (LETT % (GETREFV 143))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 2))
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|augmentPredVector| % 4))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G154)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Integer|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Integer|
                             (LIST (CONS NIL (CONS 1 (|Integer;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|)))))))))) 

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |INT;OMwrite;Omd%BV;2|
              |INT;zero?;%B;3| |INT;one?;%B;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;0;%;5|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;1;%;6|) %))
              |INT;base;%;7| |INT;copy;2%;8| |INT;inc;2%;9| |INT;dec;2%;10|
              (|HashState|) |INT;hashUpdate!;Hs%Hs;11| |INT;negative?;%B;12|
              |INT;positive?;%B;13| (|OutputForm|) (33 . |outputForm|)
              |INT;coerce;%Of;14| |INT;coerce;2%;15| |INT;convert;2%;16|
              |INT;length;2%;17| |INT;addmod;4%;18| |INT;submod;4%;19|
              |INT;mulmod;4%;20| (|Float|) (38 . |coerce|) |INT;convert;%F;21|
              (|DoubleFloat|) |INT;convert;%Df;22| (|InputForm|)
              (43 . |convert|) |INT;convert;%If;23| |INT;convert;%S;24|
              |INT;positiveRemainder;3%;25| (|Matrix| 11) (|Matrix| %)
              |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 11))) (|Vector| %)
              |INT;reducedSystem;MVR;27| |INT;abs;2%;28| |INT;random;2%;29|
              |INT;seedRandom;V;30| |INT;=;2%B;31| |INT;<;2%B;32|
              |INT;>;2%B;33| |INT;>=;2%B;34| |INT;<=;2%B;35| |INT;-;2%;36|
              |INT;+;3%;37| |INT;-;3%;38| |INT;*;3%;39| (|PositiveInteger|)
              |INT;*;Pi2%;40| (|NonNegativeInteger|) |INT;*;Nni2%;41|
              |INT;^;%Nni%;42| |INT;^;%Pi%;43| |INT;odd?;%B;44|
              |INT;even?;%B;45| |INT;max;3%;46| |INT;min;3%;47|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |INT;divide;2%R;48| |INT;quo;3%;49| |INT;rem;3%;50|
              |INT;shift;3%;51| (|Union| % '"failed") |INT;exquo;2%U;52|
              |INT;recip;%U;53| |INT;gcd;3%;54|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              |INT;unitNormal;%R;55| |INT;unitCanonical;2%;56|
              (|Union| 90 '"failed") (|List| 91)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (48 . |solveLinearPolynomialEquation|) (|Union| 95 '"failed")
              (|List| 96) (|SparseUnivariatePolynomial| %)
              |INT;solveLinearPolynomialEquation;LSupU;57| (|Factored| 99)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 99) (54 . |squareFree|)
              (|Factored| 96) |INT;squareFreePolynomial;SupF;58|
              (59 . |primitivePart|) (64 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 99) (69 . |factor|) (74 . |coerce|)
              (|Factored| %) (79 . |factor|) (|Mapping| 99 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 99) (84 . |map|) (90 . |mergeFactors|)
              |INT;factorPolynomial;SupF;59| (96 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;60| (101 . |zero?|)
              (106 . |unitCanonical|) (|List| 99) (|HeuGcd| 99) (111 . |gcd|)
              |INT;gcdPolynomial;3Sup;61| |INT;opposite?;2%B;62|
              |INT;annihilate?;2%B;63| |INT;powmod;4%;64|
              |INT;symmetricRemainder;3%;65|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 131 '#1="failed") (|Union| 130 '#1#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef| 130) (|:| |generator| %))
              (|Union| 11 '"failed") (|PatternMatchResult| 11 %) (|Pattern| 11)
              (|Union| 140 '"failed") (|Fraction| 11) (|SingleInteger|)
              (|Union| 53 '"failed"))
           '#(~= 116 |zero?| 122 |unitNormal| 127 |unitCanonical| 132 |unit?|
              137 |symmetricRemainder| 142 |subtractIfCan| 148 |submod| 154
              |squareFreePolynomial| 161 |squareFreePart| 166 |squareFree| 171
              |solveLinearPolynomialEquation| 176 |smaller?| 182 |sizeLess?|
              188 |sign| 194 |shift| 199 |seedRandom| 205 |sample| 209
              |rightRecip| 213 |rightPower| 218 |retractIfCan| 230 |retract|
              235 |rem| 240 |reducedSystem| 246 |recip| 257 |rationalIfCan| 262
              |rational?| 267 |rational| 272 |random| 277 |quo| 282
              |principalIdeal| 288 |prime?| 293 |powmod| 298
              |positiveRemainder| 305 |positive?| 311 |plenaryPower| 316
              |permutation| 322 |patternMatch| 328 |opposite?| 335 |one?| 341
              |odd?| 346 |nextItem| 351 |negative?| 356 |multiEuclidean| 361
              |mulmod| 367 |min| 374 |max| 380 |mask| 386 |length| 391
              |leftRecip| 396 |leftPower| 401 |lcmCoef| 413 |lcm| 419 |latex|
              430 |invmod| 435 |init| 441 |inc| 445 |hashUpdate!| 450 |hash|
              456 |gcdPolynomial| 461 |gcd| 467 |factorial| 478
              |factorSquareFreePolynomial| 483 |factorPolynomial| 488 |factor|
              493 |extendedEuclidean| 498 |exquo| 511 |expressIdealMember| 517
              |even?| 523 |euclideanSize| 528 |divide| 533 |differentiate| 539
              |dec| 550 |copy| 555 |convert| 560 |conditionP| 590 |commutator|
              595 |coerce| 601 |charthRoot| 616 |characteristic| 621 |bit?| 625
              |binomial| 631 |base| 637 |associator| 641 |associates?| 648
              |antiCommutator| 654 |annihilate?| 660 |addmod| 666 |abs| 673 ^
              678 |OMwrite| 690 D 714 >= 725 > 731 = 737 <= 743 < 749 |1| 755
              |0| 759 - 763 + 774 * 780)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL NIL
                |Algebra&| |EntireRing&| NIL |DifferentialRing&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |Module&| |NonAssociativeRing&|
                NIL NIL NIL |NonAssociativeRng&| NIL NIL |AbelianGroup&|
                |OrderedAbelianSemiGroup&| NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| NIL NIL NIL
                |SetCategory&| NIL |RetractableTo&| NIL |Hashable&| NIL
                |BasicType&| NIL NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |OpenMath&| NIL NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|Algebra| $$)
                 (|EntireRing|) (|OrderedRing|) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|Module| $$) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|LinearlyExplicitOver| 11) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|RightModule| 11)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                 (|OrderedMagmaWithZero|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|Comparable|) (|MagmaWithZero|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|ComparableRepresentation|) (|PatternMatchable| 11)
                 (|StepThrough|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 11) (|RealConstant|) (|Hashable|)
                 (|CoercibleTo| 30) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|CharacteristicZero|) (|ConvertibleTo| 11)
                 (|CoercibleFrom| 11) (|ConvertibleTo| 44)
                 (|ConvertibleTo| 138) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 42) (|ConvertibleTo| 39)
                 (|canonicalUnitNormal|) (|multiplicativeValuation|)
                 (|ConvertibleTo| 9) (|OpenMath|) (|Canonical|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 142
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 30 0 11 31 1
                                    39 0 11 40 1 44 0 11 45 2 92 89 90 91 93 1
                                    100 98 99 101 1 99 0 0 104 1 99 2 0 105 1
                                    106 98 99 107 1 99 0 2 108 1 0 109 0 110 2
                                    113 98 111 112 114 2 98 0 0 0 115 1 106 98
                                    99 117 1 99 16 0 119 1 99 0 0 120 1 122 99
                                    121 123 2 0 16 0 0 1 1 0 16 0 18 1 0 86 0
                                    87 1 0 0 0 88 1 0 16 0 1 2 0 0 0 0 128 2 0
                                    82 0 0 1 3 0 0 0 0 0 37 1 0 102 96 103 1 0
                                    0 0 1 1 0 109 0 1 2 0 94 95 96 97 2 0 16 0
                                    0 1 2 0 16 0 0 1 1 1 11 0 1 2 0 0 0 0 81 0
                                    0 6 57 0 0 0 1 1 0 82 0 1 2 0 0 0 67 1 2 0
                                    0 0 69 1 1 0 136 0 1 1 0 11 0 1 2 0 0 0 0
                                    80 1 0 49 50 51 2 0 52 50 53 54 1 0 82 0 84
                                    1 0 139 0 1 1 0 16 0 1 1 0 140 0 1 1 0 0 0
                                    56 2 0 0 0 0 79 1 0 135 130 1 1 0 16 0 1 3
                                    0 0 0 0 0 127 2 0 0 0 0 48 1 1 16 0 29 2 0
                                    0 0 67 1 2 0 0 0 0 1 3 0 137 0 138 137 1 2
                                    0 16 0 0 125 1 0 16 0 19 1 0 16 0 73 1 0 82
                                    0 1 1 1 16 0 28 2 0 133 130 0 1 3 0 0 0 0 0
                                    38 2 0 0 0 0 76 2 0 0 0 0 75 1 0 0 0 1 1 0
                                    0 0 35 1 0 82 0 1 2 0 0 0 67 1 2 0 0 0 69 1
                                    2 0 129 0 0 1 2 0 0 0 0 1 1 0 0 130 1 1 0 9
                                    0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 0 24 2 0 26
                                    26 0 27 1 0 141 0 1 2 0 96 96 96 124 2 0 0
                                    0 0 85 1 0 0 130 1 1 0 0 0 1 1 0 102 96 118
                                    1 0 102 96 116 1 0 109 0 110 3 0 132 0 0 0
                                    1 2 0 134 0 0 1 2 0 82 0 0 83 2 0 133 130 0
                                    1 1 0 16 0 74 1 0 69 0 1 2 0 77 0 0 78 2 0
                                    0 0 69 1 1 0 0 0 1 1 0 0 0 25 1 0 0 0 23 1
                                    0 11 0 34 1 0 44 0 46 1 0 138 0 1 1 0 39 0
                                    41 1 0 42 0 43 1 0 9 0 47 1 3 142 50 1 2 0
                                    0 0 0 1 1 0 30 0 32 1 0 0 11 33 1 0 0 0 1 1
                                    3 82 0 1 0 0 69 1 2 0 16 0 0 1 2 0 0 0 0 1
                                    0 0 0 22 3 0 0 0 0 0 1 2 0 16 0 0 1 2 0 0 0
                                    0 1 2 0 16 0 0 126 3 0 0 0 0 0 36 1 2 0 0
                                    55 2 0 0 0 67 72 2 0 0 0 69 71 2 0 9 0 16 1
                                    1 0 9 0 1 3 0 6 7 0 16 17 2 0 6 7 0 1 2 0 0
                                    0 69 1 1 0 0 0 1 2 0 16 0 0 61 2 0 16 0 0
                                    60 2 0 16 0 0 58 2 0 16 0 0 62 2 0 16 0 0
                                    59 0 0 0 21 0 0 0 20 1 0 0 0 63 2 0 0 0 0
                                    65 2 0 0 0 0 64 2 0 0 67 0 68 2 0 0 0 0 66
                                    2 0 0 11 0 1 2 0 0 69 0 70 2 0 0 0 11
                                    1)))))
           '|lookupComplete|)) 
