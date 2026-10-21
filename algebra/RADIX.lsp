
(MAKEPROP '|RADIX;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |RADIX;characteristic;Nni;1| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |RADIX;differentiate;2%;2| ((|a| (%)) (% (%))) (|spadConstant| % 10)) 

(MAKEPROP '|RADIX;0;%;3| '|SPADreplace| '(XLAM NIL (VECTOR 1 NIL NIL NIL))) 

(SDEFUN |RADIX;0;%;3| ((% (%))) (VECTOR 1 NIL NIL NIL)) 

(SDEFUN |RADIX;1;%;4| ((% (%))) (VECTOR 1 (LIST 1) NIL NIL)) 

(SDEFUN |RADIX;-;2%;5| ((|a| (%)) (% (%)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 10) (QREFELT % 14))
          (|spadConstant| % 10))
         ('T
          (VECTOR (- (QVELT |a| 0)) (QVELT |a| 1) (QVELT |a| 2)
                  (QVELT |a| 3))))) 

(SDEFUN |RADIX;+;3%;6| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 18))
         (QREFELT % 19))) 

(SDEFUN |RADIX;-;3%;7| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 21))
         (QREFELT % 19))) 

(SDEFUN |RADIX;*;I2%;8| ((|n| (|Integer|)) (|a| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (SPADCALL |a| (QREFELT % 17)) (QREFELT % 24))
                  (QREFELT % 19))) 

(SDEFUN |RADIX;*;3%;9| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 26))
         (QREFELT % 19))) 

(SDEFUN |RADIX;/;3%;10| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 28))
         (QREFELT % 19))) 

(SDEFUN |RADIX;/;2I%;11| ((|i| #1=(|Integer|)) (|j| #1#) (% (%)))
        (SPADCALL (SPADCALL |i| |j| (QREFELT % 30)) (QREFELT % 19))) 

(SDEFUN |RADIX;<;2%B;12| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                  (QREFELT % 32))) 

(SDEFUN |RADIX;=;2%B;13| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((EQL (QVELT |a| 0) (QVELT |b| 0))
          (COND
           ((SPADCALL (QVELT |a| 1) (QVELT |b| 1) (QREFELT % 35))
            (COND
             ((SPADCALL (QVELT |a| 2) (QVELT |b| 2) (QREFELT % 35))
              (SPADCALL (QVELT |a| 3) (QVELT |b| 3) (QREFELT % 35)))
             (#1='T NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |RADIX;numer;%I;14| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 36))) 

(SDEFUN |RADIX;denom;%I;15| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 38))) 

(SDEFUN |RADIX;coerce;%F;16| ((|a| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT % 40)) (QREFELT % 41))
                  (SPADCALL |a| (QREFELT % 42)) (QREFELT % 18))) 

(SDEFUN |RADIX;coerce;I%;17| ((|n| (|Integer|)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 41)) (QREFELT % 19))) 

(SDEFUN |RADIX;coerce;F%;18| ((|q| (|Fraction| (|Integer|))) (% (%)))
        (SPROG
         ((|s| (|Integer|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|whole| (|List| (|Integer|)))
          (|fractn|
           (|Record| (|:| |pfx| (|List| (|Integer|)))
                     (|:| |cyc| #1=(|List| (|Integer|)))))
          (|cycle| #1#))
         (SEQ (LETT |s| 1)
              (COND
               ((SPADCALL |q| (|spadConstant| % 44) (QREFELT % 32))
                (SEQ (LETT |s| -1)
                     (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 45)))))))
              (LETT |qr|
                    (|divide_INT| (SPADCALL |q| (QREFELT % 36))
                                  (SPADCALL |q| (QREFELT % 38))))
              (LETT |whole| (|RADIX;radixInt| (QCAR |qr|) (QREFELT % 6) %))
              (LETT |fractn|
                    (|RADIX;radixFrac| (QCDR |qr|)
                     (SPADCALL |q| (QREFELT % 38)) (QREFELT % 6) %))
              (LETT |cycle|
                    (COND
                     ((SPADCALL (QCDR |fractn|) (LIST 0) (QREFELT % 35)) NIL)
                     ('T (QCDR |fractn|))))
              (EXIT (VECTOR |s| |whole| (QCAR |fractn|) |cycle|))))) 

(SDEFUN |RADIX;retractIfCan;%U;19|
        ((|a| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 0 (SPADCALL |a| (QREFELT % 17)))) 

(SDEFUN |RADIX;retractIfCan;%U;20|
        ((|a| (%)) (% (|Union| (|Integer|) "failed")))
        (SEQ
         (COND
          ((NULL (QVELT |a| 2))
           (COND
            ((NULL (QVELT |a| 3))
             (EXIT (CONS 0 (SPADCALL |a| (QREFELT % 40))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADIX;ceiling;%I;21| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 50))) 

(SDEFUN |RADIX;floor;%I;22| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 52))) 

(SDEFUN |RADIX;wholePart;%I;23| ((|a| (%)) (% (|Integer|)))
        (SPROG ((|r| NIL) (#1=#:G81 NIL) (|n0| (|Integer|)))
               (SEQ (LETT |n0| 0)
                    (SEQ (LETT |r| NIL) (LETT #1# (QVELT |a| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT |n0| (+ (* (QREFELT % 6) |n0|) |r|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (* (QVELT |a| 0) |n0|))))) 

(SDEFUN |RADIX;fractionPart;%F;24| ((|a| (%)) (% (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G89 NIL) (|n0| (|Integer|)) (|r| NIL) (#2=#:G90 NIL)
          (|n1| (|Integer|)) (|n| (|Integer|)) (|d| (|Integer|)))
         (SEQ (LETT |n0| 0)
              (SEQ (LETT |r| NIL) (LETT #1# (QVELT |a| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |n0| (+ (* (QREFELT % 6) |n0|) |r|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL (QVELT |a| 3))
                 (SPADCALL (* (QVELT |a| 0) |n0|)
                           (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 2)))
                           (QREFELT % 30)))
                ('T
                 (SEQ (LETT |n1| |n0|)
                      (SEQ (LETT |r| NIL) (LETT #2# (QVELT |a| 3)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT (LETT |n1| (+ (* (QREFELT % 6) |n1|) |r|))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |n| (- |n1| |n0|))
                      (LETT |d|
                            (*
                             (- (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 3))) 1)
                             (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 2)))))
                      (EXIT
                       (SPADCALL (* (QVELT |a| 0) |n|) |d|
                                 (QREFELT % 30)))))))))) 

(MAKEPROP '|RADIX;wholeRagits;%L;25| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 1))) 

(SDEFUN |RADIX;wholeRagits;%L;25| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 1)) 

(SDEFUN |RADIX;fractRagits;%S;26| ((|a| (%)) (% (|Stream| (|Integer|))))
        (SPADCALL (SPADCALL (QVELT |a| 2) (QREFELT % 56))
                  (SPADCALL (QVELT |a| 3) (QREFELT % 57)) (QREFELT % 58))) 

(MAKEPROP '|RADIX;prefixRagits;%L;27| '|SPADreplace|
          '(XLAM (|a|) (QVELT |a| 2))) 

(SDEFUN |RADIX;prefixRagits;%L;27| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 2)) 

(MAKEPROP '|RADIX;cycleRagits;%L;28| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 3))) 

(SDEFUN |RADIX;cycleRagits;%L;28| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 3)) 

(SDEFUN |RADIX;wholeRadix;L%;29| ((|li| (|List| (|Integer|))) (% (%)))
        (SEQ (|RADIX;checkRagits| |li| %) (EXIT (VECTOR 1 |li| NIL NIL)))) 

(SDEFUN |RADIX;fractRadix;2L%;30|
        ((|lpfx| (|List| (|Integer|))) (|lcyc| (|List| (|Integer|))) (% (%)))
        (SEQ (|RADIX;checkRagits| |lpfx| %) (|RADIX;checkRagits| |lcyc| %)
             (EXIT (VECTOR 1 NIL |lpfx| |lcyc|)))) 

(SDEFUN |RADIX;intToExpr| ((|i| (|Integer|)) (% (|OutputForm|)))
        (COND ((< |i| 10) (SPADCALL |i| (QREFELT % 66)))
              ('T
               (SPADCALL
                (SPADCALL (QREFELT % 64)
                          (+ (- |i| 10)
                             (SPADCALL (QREFELT % 64) (QREFELT % 68)))
                          (QREFELT % 70))
                (QREFELT % 71))))) 

(SDEFUN |RADIX;exprgroup| ((|le| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (COND ((NULL |le|) (|error| "exprgroup needs non-null list"))
              ((NULL (CDR |le|)) (|SPADfirst| |le|))
              ((<= (ABS (QREFELT % 6)) 36) (SPADCALL |le| (QREFELT % 73)))
              ('T (SPADCALL |le| (QREFELT % 74))))) 

(SDEFUN |RADIX;intgroup| ((|li| (|List| (|Integer|))) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G117 NIL) (#2=#:G118 NIL) (#3=#:G119 NIL) (#4=#:G120 NIL)
          (#5=#:G121 NIL) (|i| NIL) (#6=#:G122 NIL))
         (SEQ
          (COND ((NULL |li|) (|error| "intgroup needs non-null list"))
                ((NULL (CDR |li|))
                 (COND
                  ((<= (ABS (QREFELT % 6)) 36)
                   (|RADIX;intToExpr| (|SPADfirst| |li|) %))
                  (#7='T (SPADCALL (|SPADfirst| |li|) (QREFELT % 66)))))
                ((<= (ABS (QREFELT % 6)) 10)
                 (SPADCALL
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |i| NIL) (LETT #2# |li|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1# (CONS (SPADCALL |i| (QREFELT % 66)) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (QREFELT % 73)))
                ((<= (ABS (QREFELT % 6)) 36)
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |i| NIL) (LETT #4# |li|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (|RADIX;intToExpr| |i| %) #3#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT % 73)))
                (#7#
                 (SPADCALL
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |i| NIL) (LETT #6# |li|) G190
                        (COND
                         ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5# (CONS (SPADCALL |i| (QREFELT % 66)) #5#))))
                        (LETT #6# (CDR #6#)) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  (QREFELT % 74))))))) 

(SDEFUN |RADIX;overBar| ((|li| (|List| (|Integer|))) (% (|OutputForm|)))
        (SPADCALL (|RADIX;intgroup| |li| %) (QREFELT % 75))) 

(SDEFUN |RADIX;coerce;%Of;35| ((|a| (%)) (% (|OutputForm|)))
        (SPROG ((|le| (|List| (|OutputForm|))) (|rex| (|OutputForm|)))
               (SEQ (LETT |le| NIL)
                    (COND
                     ((NULL (NULL (QVELT |a| 3)))
                      (LETT |le|
                            (CONS (|RADIX;overBar| (QVELT |a| 3) %) |le|))))
                    (COND
                     ((NULL (NULL (QVELT |a| 2)))
                      (LETT |le|
                            (CONS (|RADIX;intgroup| (QVELT |a| 2) %) |le|))))
                    (COND
                     ((NULL (NULL |le|))
                      (LETT |le| (CONS (SPADCALL "." (QREFELT % 76)) |le|))))
                    (COND
                     ((NULL (QVELT |a| 1))
                      (LETT |le| (CONS (SPADCALL 0 (QREFELT % 66)) |le|)))
                     (#1='T
                      (LETT |le|
                            (CONS (|RADIX;intgroup| (QVELT |a| 1) %) |le|))))
                    (LETT |rex| (|RADIX;exprgroup| |le| %))
                    (EXIT
                     (COND
                      ((< (QVELT |a| 0) 0) (SPADCALL |rex| (QREFELT % 77)))
                      (#1# |rex|)))))) 

(SDEFUN |RADIX;checkRagits| ((|li| (|List| (|Integer|))) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G134 NIL))
               (SEQ
                (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (< |i| 0) (>= |i| (QREFELT % 6)))
                         (|error|
                          "Each ragit (digit) must be between 0 and base-1")))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))) 

(SDEFUN |RADIX;radixInt|
        ((|n| (|Integer|)) (|bas| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|rits| (|List| (|Integer|))))
         (SEQ (LETT |rits| NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL (ABS |n|) 0 (QREFELT % 79))) (GO G191)))
                   (SEQ (LETT |qr| (|divide_INT| |n| |bas|))
                        (LETT |n| (QCAR |qr|))
                        (EXIT (LETT |rits| (CONS (QCDR |qr|) |rits|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |rits|)))) 

(SDEFUN |RADIX;radixFrac|
        ((|num| (|Integer|)) (|den| (|Integer|)) (|bas| (|Integer|))
         (%
          (|Record| (|:| |pfx| (|List| (|Integer|)))
                    (|:| |cyc| (|List| (|Integer|))))))
        (SPROG
         ((|qr|
           #1=(|Record| (|:| |quotient| (|Integer|))
                        (|:| |remainder| (|Integer|))))
          (#2=#:G167 NIL) (|qr1i| #1#) (|qrt| #1#) (|qr2i| #1#)
          (|n| #3=(|Integer|)) (#4=#:G168 NIL)
          (|ritsi|
           #5=(|List|
               (|Record| (|:| |quotient| (|Integer|))
                         (|:| |remainder| (|Integer|)))))
          (|p| #3#) (#6=#:G169 NIL)
          (|rn|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (#7=#:G170 NIL) (|ritsn| #5#) (|cfound| (|Boolean|))
          (|c| (|Integer|)) (#8=#:G171 NIL) (|ritspfx| (|List| (|Integer|)))
          (|i| (|Integer|)) (#9=#:G172 NIL) (|ritscyc| (|List| (|Integer|)))
          (|rits| (|List| #1#)))
         (SEQ (LETT |qr| (|divide_INT| (* |bas| |num|) |den|)) (LETT |i| 0)
              (LETT |qr1i| (LETT |qr2i| |qr|)) (LETT |rits| (LIST |qr|))
              (SEQ (LETT #2# NIL) G190 (COND (#2# (GO G191)))
                   (SEQ
                    (LETT |qr1i| (|divide_INT| (* |bas| (QCDR |qr1i|)) |den|))
                    (LETT |qrt| (|divide_INT| (* |bas| (QCDR |qr2i|)) |den|))
                    (LETT |qr2i| (|divide_INT| (* |bas| (QCDR |qrt|)) |den|))
                    (LETT |rits| (CONS |qr2i| (CONS |qrt| |rits|)))
                    (EXIT (LETT |i| (+ |i| 1))))
                   (LETT #2# (SPADCALL |qr1i| |qr2i| (QREFELT % 81))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |rits| (NREVERSE |rits|)) (LETT |n| |i|)
              (LETT |ritsi| |rits|) (LETT |ritsn| |rits|)
              (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |i| 0)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (|SPADfirst| |ritsi|) (|SPADfirst| |ritsn|)
                                (QREFELT % 82)))
                     (GO G191)))
                   (SEQ (LETT |ritsi| (CDR |ritsi|))
                        (LETT |ritsn| (CDR |ritsn|))
                        (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |p| |i|) (LETT |ritsn| |rits|)
              (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |rn| (|SPADfirst| |ritsn|)) (LETT |cfound| NIL)
              (LETT |c| 0)
              (SEQ (LETT |i| 1) (LETT #7# |p|) G190
                   (COND
                    ((OR (|greater_SI| |i| #7#) (NULL (NULL |cfound|)))
                     (GO G191)))
                   (SEQ (LETT |ritsn| (CDR |ritsn|))
                        (EXIT
                         (COND
                          ((SPADCALL |rn| (|SPADfirst| |ritsn|) (QREFELT % 81))
                           (SEQ (LETT |c| |i|) (EXIT (LETT |cfound| 'T)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (COND ((NULL |cfound|) (LETT |c| |n|))) (LETT |ritspfx| NIL)
              (LETT |ritscyc| NIL)
              (SEQ (LETT |i| 1) (LETT #8# |p|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (LETT |ritspfx|
                          (CONS (QCAR (|SPADfirst| |rits|)) |ritspfx|))
                    (EXIT (LETT |rits| (CDR |rits|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #9# |c|) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (LETT |ritscyc|
                          (CONS (QCAR (|SPADfirst| |rits|)) |ritscyc|))
                    (EXIT (LETT |rits| (CDR |rits|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |ritspfx|) (NREVERSE |ritscyc|)))))) 

(DECLAIM (NOTINLINE |RadixExpansion;|)) 

(DEFUN |RadixExpansion;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G199 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|RadixExpansion| DV$1))
          (LETT % (GETREFV 117))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|RealConstant|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|StepThrough|))
                                              (|HasCategory| (|Integer|)
                                                             '(|InnerEvalable|
                                                               (|Symbol|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Evalable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Eltable|
                                                               (|Integer|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|DifferentialRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Float|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|EuclideanDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|ComparableRepresentation|)))
                                              (OR #1#
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedRing|)))))))
          (|haddProp| |$ConstructorCache| '|RadixExpansion| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 8388608))
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 16777216))
          (AND (|HasCategory| % '(|SetWithZero|))
               (|HasCategory| (|Integer|) '(|OrderedRing|))
               (|augmentPredVector| % 33554432))
          (AND (|HasCategory| % '(|AbelianGroup|))
               (|HasCategory| (|Integer|) '(|OrderedRing|))
               (|augmentPredVector| % 67108864))
          (AND
           (OR (|HasCategory| % '(|CharacteristicZero|))
               (|HasCategory| (|Integer|) '(|RetractableTo| (|Integer|))))
           (|augmentPredVector| % 134217728))
          (SETF |pv$| (QREFELT % 3))
          (COND ((< |#1| 2) (|error| "Radix base must be at least 2")))
          (QSETREFV % 7
                    (|Record| (|:| |sgn| (|Integer|))
                              (|:| |int| (|List| (|Integer|)))
                              (|:| |pfx| (|List| (|Integer|)))
                              (|:| |cyc| (|List| (|Integer|)))))
          (QSETREFV % 64 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
          %))) 

(DEFUN |RadixExpansion| (#1=#:G200)
  (SPROG NIL
         (PROG (#2=#:G201)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RadixExpansion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RadixExpansion;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadixExpansion|)))))))))) 

(MAKEPROP '|RadixExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |RADIX;characteristic;Nni;1|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;0;%;3|) %))
              |RADIX;differentiate;2%;2|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;1;%;4|) %))
              (|Boolean|) |RADIX;=;2%B;13| |RADIX;-;2%;5| (|Fraction| 23)
              |RADIX;coerce;%F;16| (0 . +) |RADIX;coerce;F%;18| |RADIX;+;3%;6|
              (6 . -) |RADIX;-;3%;7| (|Integer|) (12 . *) |RADIX;*;I2%;8|
              (18 . *) |RADIX;*;3%;9| (24 . /) |RADIX;/;3%;10| (30 . /)
              |RADIX;/;2I%;11| (36 . <) |RADIX;<;2%B;12| (|List| 23) (42 . =)
              (48 . |numer|) |RADIX;numer;%I;14| (53 . |denom|)
              |RADIX;denom;%I;15| |RADIX;wholePart;%I;23| (58 . |coerce|)
              |RADIX;fractionPart;%F;24| |RADIX;coerce;I%;17| (63 . |0|)
              (67 . -) (|Union| 16 '"failed") |RADIX;retractIfCan;%U;19|
              (|Union| 23 '"failed") |RADIX;retractIfCan;%U;20|
              (72 . |ceiling|) |RADIX;ceiling;%I;21| (77 . |floor|)
              |RADIX;floor;%I;22| |RADIX;wholeRagits;%L;25| (|Stream| 23)
              (82 . |construct|) (87 . |repeating|) (92 . |concat|)
              |RADIX;fractRagits;%S;26| |RADIX;prefixRagits;%L;27|
              |RADIX;cycleRagits;%L;28| |RADIX;wholeRadix;L%;29|
              |RADIX;fractRadix;2L%;30| 'ALPHAS (|OutputForm|) (98 . |coerce|)
              (|String|) (103 . |minIndex|) (|Character|) (108 . |elt|)
              (114 . |coerce|) (|List| %) (119 . |hconcat|)
              (124 . |blankSeparate|) (129 . |overbar|) (134 . |message|)
              (139 . -) |RADIX;coerce;%Of;35| (144 . ~=)
              (|Record| (|:| |quotient| 23) (|:| |remainder| 23)) (150 . =)
              (156 . ~=) (|PositiveInteger|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|Union| 72 '"failed")
              (|Record| (|:| |coef| 72) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 91 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Mapping| 23 23) (|Matrix| 23) (|Matrix| %)
              (|Record| (|:| |mat| 96) (|:| |vec| (|Vector| 23))) (|Vector| %)
              (|Union| 99 '#1="failed") (|InputForm|) (|Pattern| 114)
              (|Pattern| 23) (|List| 105) (|Equation| 23) (|Symbol|)
              (|List| 106) (|List| 8) (|PatternMatchResult| 114 %)
              (|PatternMatchResult| 23 %) (|Union| 112 '#1#) (|List| 87)
              (|Factored| 87) (|Float|) (|DoubleFloat|)
              (|Union| 106 '"failed"))
           '#(~= 162 |zero?| 168 |wholeRagits| 173 |wholeRadix| 178 |wholePart|
              183 |unitNormal| 188 |unitCanonical| 193 |unit?| 198
              |subtractIfCan| 203 |squareFreePolynomial| 209 |squareFreePart|
              214 |squareFree| 219 |solveLinearPolynomialEquation| 224
              |smaller?| 230 |sizeLess?| 236 |sign| 242 |sample| 247
              |rightRecip| 251 |rightPower| 256 |retractIfCan| 268 |retract|
              288 |rem| 308 |reducedSystem| 314 |recip| 336 |quo| 341
              |principalIdeal| 347 |prime?| 352 |prefixRagits| 357 |positive?|
              362 |plenaryPower| 367 |patternMatch| 373 |opposite?| 387 |one?|
              393 |numerator| 398 |numer| 403 |nextItem| 408 |negative?| 413
              |multiEuclidean| 418 |min| 424 |max| 430 |map| 436 |leftRecip|
              442 |leftPower| 447 |lcmCoef| 459 |lcm| 465 |latex| 476 |inv| 481
              |init| 486 |gcdPolynomial| 490 |gcd| 496 |fractionPart| 507
              |fractRagits| 517 |fractRadix| 522 |floor| 528
              |factorSquareFreePolynomial| 533 |factorPolynomial| 538 |factor|
              543 |extendedEuclidean| 548 |exquo| 561 |expressIdealMember| 567
              |eval| 573 |euclideanSize| 613 |elt| 618 |divide| 624
              |differentiate| 630 |denominator| 680 |denom| 685 |cycleRagits|
              690 |convert| 695 |conditionP| 720 |commutator| 725 |coerce| 731
              |charthRoot| 761 |characteristic| 766 |ceiling| 770 |associator|
              775 |associates?| 782 |antiCommutator| 788 |annihilate?| 794
              |abs| 800 ^ 805 D 823 >= 873 > 879 = 885 <= 891 < 897 |1| 903 |0|
              907 / 911 - 923 + 934 * 940)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 2 0 0 0 0 0 0 0 0 0 14 13 7 1 0 0 0 0 1 0
                                  0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 7 7 0
                                  7 0 0 0 7 7 0 0 0 0 0 18 17 9 23 0 0 0 0 11 8
                                  6 3 0 0 0 0 16 15 12 11 10 8 7 6 6 5 1 4 3 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL NIL
                |DivisionRing&| |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |OrderedAbelianSemiGroup&|
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&| NIL NIL
                NIL NIL |InnerEvalable&| |InnerEvalable&| NIL |PartialOrder&|
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 23) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|)
                 (|DifferentialExtension| 23) (|DifferentialRing|)
                 (|PartialDifferentialRing| 106) (|OrderedRing|) (|Algebra| 16)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 23) (|Ring|)
                 (|NonAssociativeAlgebra| 16) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 23)
                 (|Module| 16) (|SemiRng|) (|Module| $$) (|Module| 23)
                 (|FullyLinearlyExplicitOver| 23) (|BiModule| 16 16)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 23 23)
                 (|LinearlyExplicitOver| 23) (|RightModule| 16)
                 (|LeftModule| 16) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| 23) (|RightModule| 23)
                 (|OrderedMagmaWithZero|) (|OrderedAbelianSemiGroup|)
                 (|AbelianGroup|) (|OrderedSet|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|MagmaWithZero|)
                 (|Comparable|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|FullyPatternMatchable| 23)
                 (|PatternMatchable| 23) (|PatternMatchable| 114)
                 (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|FullyEvalableOver| 23) (|Evalable| 23) (|RetractableTo| 16)
                 (|RealConstant|) (|RetractableTo| 106) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 23) (|Patternable| 23)
                 (|ConvertibleTo| 103) (|ConvertibleTo| 102) (|Eltable| 23 $$)
                 (|InnerEvalable| 23 23) (|InnerEvalable| 106 23)
                 (|CoercibleFrom| 16) (|PartialOrder|) (|ConvertibleTo| 114)
                 (|ConvertibleTo| 115) (|ConvertibleTo| 101)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleFrom| 106) (|CoercibleTo| 65) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 23) (|Type|))
              (|makeByteWordVec2| 116
                                  '(2 16 0 0 0 18 2 16 0 0 0 21 2 16 0 23 0 24
                                    2 16 0 0 16 26 2 16 0 0 0 28 2 16 0 23 23
                                    30 2 16 13 0 0 32 2 34 13 0 0 35 1 16 23 0
                                    36 1 16 23 0 38 1 16 0 23 41 0 16 0 44 1 16
                                    0 0 45 1 16 23 0 50 1 16 23 0 52 1 55 0 34
                                    56 1 55 0 34 57 2 55 0 0 0 58 1 23 65 0 66
                                    1 67 23 0 68 2 67 69 0 23 70 1 69 65 0 71 1
                                    65 0 72 73 1 65 0 72 74 1 65 0 0 75 1 65 0
                                    67 76 1 65 0 0 77 2 23 13 0 0 79 2 80 13 0
                                    0 81 2 80 13 0 0 82 2 0 13 0 0 1 1 0 13 0 1
                                    1 0 34 0 54 1 0 0 34 62 1 20 23 0 40 1 0 85
                                    0 1 1 0 0 0 1 1 0 13 0 1 2 0 84 0 0 1 1 2
                                    113 87 1 1 0 0 0 1 1 0 94 0 1 2 2 111 112
                                    87 1 2 22 13 0 0 1 2 0 13 0 0 1 1 26 23 0 1
                                    0 0 0 1 1 0 84 0 1 2 0 0 0 83 1 2 0 0 0 8 1
                                    1 0 48 0 49 1 8 46 0 47 1 8 48 0 49 1 3 116
                                    0 1 1 0 23 0 1 1 8 16 0 1 1 8 23 0 1 1 3
                                    106 0 1 2 0 0 0 0 1 1 0 96 97 1 2 0 98 97
                                    99 1 1 19 96 97 1 2 19 98 97 99 1 1 0 84 0
                                    1 2 0 0 0 0 1 1 0 89 72 1 1 0 13 0 1 1 0 34
                                    0 60 1 26 13 0 1 2 0 0 0 83 1 3 17 109 0
                                    102 109 1 3 18 110 0 103 110 1 2 0 13 0 0 1
                                    1 0 13 0 1 1 0 0 0 1 1 0 23 0 37 1 9 84 0 1
                                    1 26 13 0 1 2 0 88 72 0 1 2 7 0 0 0 1 2 7 0
                                    0 0 1 2 0 0 95 0 1 1 0 84 0 1 2 0 0 0 83 1
                                    2 0 0 0 8 1 2 0 86 0 0 1 1 0 0 72 1 2 0 0 0
                                    0 1 1 0 67 0 1 1 0 0 0 1 0 9 0 1 2 0 87 87
                                    87 1 1 0 0 72 1 2 0 0 0 0 1 1 0 16 0 42 1
                                    20 0 0 1 1 0 55 0 59 2 0 0 34 34 63 1 21 23
                                    0 53 1 2 113 87 1 1 2 113 87 1 1 0 94 0 1 3
                                    0 92 0 0 0 1 2 0 93 0 0 1 2 0 84 0 0 1 2 0
                                    88 72 0 1 3 11 0 0 23 23 1 3 11 0 0 34 34 1
                                    2 11 0 0 104 1 2 11 0 0 105 1 3 10 0 0 106
                                    23 1 3 10 0 0 107 34 1 1 0 8 0 1 2 12 0 0
                                    23 1 2 0 90 0 0 1 2 0 0 0 95 1 3 0 0 0 95 8
                                    1 1 14 0 0 11 2 14 0 0 8 1 2 13 0 0 106 1 3
                                    13 0 0 106 8 1 2 13 0 0 107 1 3 13 0 0 107
                                    108 1 1 0 0 0 1 1 0 23 0 39 1 0 34 0 61 1 5
                                    101 0 1 1 15 102 0 1 1 16 103 0 1 1 6 114 0
                                    1 1 6 115 0 1 1 25 100 97 1 2 0 0 0 0 1 1 0
                                    65 0 78 1 0 0 23 43 1 0 0 0 1 1 0 16 0 17 1
                                    28 0 16 19 1 3 0 106 1 1 25 84 0 1 0 0 8 9
                                    1 21 23 0 51 3 0 0 0 0 0 1 2 0 13 0 0 1 2 0
                                    0 0 0 1 2 0 13 0 0 1 1 27 0 0 1 2 0 0 0 83
                                    1 2 0 0 0 8 1 2 0 0 0 23 1 2 0 0 0 95 1 3 0
                                    0 0 95 8 1 1 14 0 0 1 2 14 0 0 8 1 2 13 0 0
                                    106 1 2 13 0 0 107 1 3 13 0 0 107 108 1 3
                                    13 0 0 106 8 1 2 7 13 0 0 1 2 7 13 0 0 1 2
                                    0 13 0 0 14 2 7 13 0 0 1 2 7 13 0 0 33 0 0
                                    0 12 0 0 0 10 2 0 0 0 0 29 2 0 0 23 23 31 2
                                    0 0 0 0 22 1 0 0 0 15 2 0 0 0 0 20 2 0 0 83
                                    0 1 2 0 0 0 0 27 2 0 0 23 0 25 2 0 0 8 0 1
                                    2 0 0 0 23 1 2 24 0 0 16 1 2 24 0 16 0 1 2
                                    19 0 0 23 1)))))
           '|lookupComplete|)) 
