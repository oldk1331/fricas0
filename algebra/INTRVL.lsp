
(SDEFUN |INTRVL;roundDown| ((|u| (R)) (% (R)))
        (SPROG
         ((|prec| (|PositiveInteger|)) (|m| (|Integer|)) (|l| (|Integer|))
          (|eu| (|Integer|)) (|dig| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT % 9)) |u|)
                (#1='T
                 (SEQ (LETT |prec| (SPADCALL (QREFELT % 11)))
                      (LETT |m| (SPADCALL |u| (QREFELT % 13)))
                      (LETT |l| (INTEGER-LENGTH |m|))
                      (LETT |eu| (SPADCALL |u| (QREFELT % 14)))
                      (EXIT
                       (COND
                        ((EQL |l| |prec|)
                         (SPADCALL (- |m| 1) |eu| (QREFELT % 17)))
                        (#1#
                         (SEQ (LETT |dig| (SPADCALL (QREFELT % 18)))
                              (EXIT
                               (COND
                                ((< |l| |prec|)
                                 (SPADCALL
                                  (- (* |m| (EXPT |dig| (- |prec| |l|))) 1)
                                  (+ (- |eu| |prec|) |l|) (QREFELT % 17)))
                                (#1#
                                 (SPADCALL (- |m| (EXPT |dig| (- |l| |prec|)))
                                           |eu| (QREFELT % 17))))))))))))))) 

(SDEFUN |INTRVL;roundUp| ((|u| (R)) (% (R)))
        (SPROG
         ((|prec| (|PositiveInteger|)) (|m| (|Integer|)) (|l| (|Integer|))
          (|eu| (|Integer|)) (|dig| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT % 9)) |u|)
                (#1='T
                 (SEQ (LETT |prec| (SPADCALL (QREFELT % 11)))
                      (LETT |m| (SPADCALL |u| (QREFELT % 13)))
                      (LETT |l| (INTEGER-LENGTH |m|))
                      (LETT |eu| (SPADCALL |u| (QREFELT % 14)))
                      (EXIT
                       (COND
                        ((EQL |l| |prec|)
                         (SPADCALL (+ |m| 1) |eu| (QREFELT % 17)))
                        (#1#
                         (SEQ (LETT |dig| (SPADCALL (QREFELT % 18)))
                              (EXIT
                               (COND
                                ((< |l| |prec|)
                                 (SPADCALL
                                  (+ (* |m| (EXPT |dig| (- |prec| |l|))) 1)
                                  (+ (- |eu| |prec|) |l|) (QREFELT % 17)))
                                (#1#
                                 (SPADCALL (+ |m| (EXPT |dig| (- |l| |prec|)))
                                           |eu| (QREFELT % 17))))))))))))))) 

(SDEFUN |INTRVL;normaliseFloat| ((|u| (R)) (% (R)))
        (SPROG
         ((|m| (|Integer|)) (|b| (|Integer|)) (|l| (|Integer|))
          (BASE (|Integer|)))
         (SEQ
          (COND ((SPADCALL |u| (QREFELT % 9)) |u|)
                (#1='T
                 (SEQ (LETT |m| (SPADCALL |u| (QREFELT % 13)))
                      (LETT |b| (SPADCALL (QREFELT % 11)))
                      (LETT |l| (INTEGER-LENGTH |m|))
                      (EXIT
                       (COND
                        ((< |l| |b|)
                         (SEQ (LETT BASE (SPADCALL (QREFELT % 18)))
                              (EXIT
                               (SPADCALL (* |m| (EXPT BASE (- |b| |l|)))
                                         (+
                                          (- (SPADCALL |u| (QREFELT % 14)) |b|)
                                          |l|)
                                         (QREFELT % 17)))))
                        (#1# |u|))))))))) 

(SDEFUN |INTRVL;interval;R%;4| ((|f| (R)) (% (%)))
        (COND ((SPADCALL |f| (QREFELT % 9)) (|spadConstant| % 19))
              ((SPADCALL |f| (QREFELT % 20)) (|spadConstant| % 15))
              ((QEQCAR (SPADCALL |f| (QREFELT % 22)) 1)
               (CONS (|INTRVL;roundDown| |f| %) (|INTRVL;roundUp| |f| %)))
              ('T (CONS |f| |f|)))) 

(SDEFUN |INTRVL;qinterval;2R%;5| ((|i| (R)) (|s| (R)) (% (%)))
        (CONS (|INTRVL;roundDown| |i| %) (|INTRVL;roundUp| |s| %))) 

(MAKEPROP '|INTRVL;exactInterval| '|SPADreplace| 'CONS) 

(SDEFUN |INTRVL;exactInterval| ((|i| (R)) (|s| (R)) (% (%))) (CONS |i| |s|)) 

(SDEFUN |INTRVL;exactSupInterval| ((|i| (R)) (|s| (R)) (% (%)))
        (CONS (|INTRVL;roundDown| |i| %) |s|)) 

(SDEFUN |INTRVL;exactInfInterval| ((|i| (R)) (|s| (R)) (% (%)))
        (CONS |i| (|INTRVL;roundUp| |s| %))) 

(MAKEPROP '|INTRVL;inf;%R;9| '|SPADreplace| 'QCAR) 

(SDEFUN |INTRVL;inf;%R;9| ((|u| (%)) (% (R))) (QCAR |u|)) 

(MAKEPROP '|INTRVL;sup;%R;10| '|SPADreplace| 'QCDR) 

(SDEFUN |INTRVL;sup;%R;10| ((|u| (%)) (% (R))) (QCDR |u|)) 

(SDEFUN |INTRVL;<;2%B;11| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT % 25)) (SPADCALL |b| (QREFELT % 25))
                    (QREFELT % 27))
          'T)
         ((SPADCALL (SPADCALL |a| (QREFELT % 25)) (SPADCALL |b| (QREFELT % 25))
                    (QREFELT % 28))
          NIL)
         ('T
          (SPADCALL (SPADCALL |a| (QREFELT % 26)) (SPADCALL |b| (QREFELT % 26))
                    (QREFELT % 27))))) 

(SDEFUN |INTRVL;-;2%;12| ((|a| (%)) (% (%)))
        (|INTRVL;exactInterval|
         (SPADCALL (SPADCALL |a| (QREFELT % 26)) (QREFELT % 30))
         (SPADCALL (SPADCALL |a| (QREFELT % 25)) (QREFELT % 30)) %)) 

(SDEFUN |INTRVL;=;2%B;13| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT % 25)) (SPADCALL |b| (QREFELT % 25))
                    (QREFELT % 32))
          (SPADCALL (SPADCALL |a| (QREFELT % 26)) (SPADCALL |b| (QREFELT % 26))
                    (QREFELT % 32)))
         ('T NIL))) 

(SDEFUN |INTRVL;~=;2%B;14| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |a| (QREFELT % 25)) (SPADCALL |b| (QREFELT % 25))
                    (QREFELT % 34))
          'T)
         ('T
          (SPADCALL (SPADCALL |a| (QREFELT % 26)) (SPADCALL |b| (QREFELT % 26))
                    (QREFELT % 34))))) 

(SDEFUN |INTRVL;1;%;15| ((% (%)))
        (SPROG ((|one| (R)))
               (SEQ
                (LETT |one| (|INTRVL;normaliseFloat| (|spadConstant| % 16) %))
                (EXIT (CONS |one| |one|))))) 

(SDEFUN |INTRVL;0;%;16| ((% (%)))
        (CONS (|spadConstant| % 36) (|spadConstant| % 36))) 

(SDEFUN |INTRVL;recip;%U;17| ((|u| (%)) (% (|Union| % "failed")))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (|spadConstant| % 16)
                                     (SPADCALL |u| (QREFELT % 25))
                                     (QREFELT % 38))
                           (SPADCALL (|spadConstant| % 16)
                                     (SPADCALL |u| (QREFELT % 26))
                                     (QREFELT % 38)))
                          (QREFELT % 40)))
                   (EXIT
                    (CONS 0
                          (SPADCALL (|SPADfirst| |vals|)
                                    (SPADCALL |vals| (QREFELT % 41))
                                    (QREFELT % 24)))))))))) 

(SDEFUN |INTRVL;exquo;2%U;18| ((|u| (%)) (|v| (%)) (% (|Union| % "failed")))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |v| (|spadConstant| % 36) (QREFELT % 37))
                  (CONS 1 "failed"))
                 ((OR (SPADCALL |v| (QREFELT % 44))
                      (SPADCALL |u| (QREFELT % 45)))
                  (CONS 0 |u|))
                 ((SPADCALL |u| |v| (QREFELT % 33))
                  (CONS 0 (|spadConstant| % 15)))
                 (#1='T
                  (COND
                   ((SPADCALL |u| (SPADCALL |v| (QREFELT % 31)) (QREFELT % 33))
                    (CONS 0 (SPADCALL (|spadConstant| % 15) (QREFELT % 31))))
                   (#1#
                    (SEQ
                     (LETT |vals|
                           (SPADCALL
                            (LIST
                             (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                       (SPADCALL |v| (QREFELT % 25))
                                       (QREFELT % 38))
                             (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                       (SPADCALL |v| (QREFELT % 26))
                                       (QREFELT % 38))
                             (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                       (SPADCALL |v| (QREFELT % 25))
                                       (QREFELT % 38))
                             (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                       (SPADCALL |v| (QREFELT % 26))
                                       (QREFELT % 38)))
                            (QREFELT % 40)))
                     (EXIT
                      (CONS 0
                            (SPADCALL (|SPADfirst| |vals|)
                                      (SPADCALL |vals| (QREFELT % 41))
                                      (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;gcd;3%;19| ((|u| (%)) (|v| (%)) (% (%))) (|spadConstant| % 15)) 

(SDEFUN |INTRVL;coerce;I%;20| ((|u| (|Integer|)) (% (%)))
        (SPROG ((|ur| (R)))
               (SEQ
                (LETT |ur|
                      (|INTRVL;normaliseFloat| (SPADCALL |u| (QREFELT % 48))
                       %))
                (EXIT (|INTRVL;exactInterval| |ur| |ur| %))))) 

(SDEFUN |INTRVL;interval;F%;21| ((|u| (|Fraction| (|Integer|))) (% (%)))
        (SPROG ((|bin| (|Union| (|Integer|) "failed")) (|flt| (R)))
               (SEQ (LETT |flt| (SPADCALL |u| (QREFELT % 51)))
                    (LETT |bin|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |u| (QREFELT % 52))
                                      (QREFELT % 54))
                            (QREFELT % 55))
                           (QREFELT % 56)))
                    (COND
                     ((QEQCAR |bin| 0)
                      (COND
                       ((< (INTEGER-LENGTH (SPADCALL |u| (QREFELT % 57)))
                           (SPADCALL (QREFELT % 11)))
                        (EXIT
                         (SEQ (LETT |flt| (|INTRVL;normaliseFloat| |flt| %))
                              (EXIT
                               (|INTRVL;exactInterval| |flt| |flt| %))))))))
                    (EXIT (SPADCALL |flt| |flt| (QREFELT % 24)))))) 

(SDEFUN |INTRVL;retractIfCan;%U;22|
        ((|u| (%)) (% (|Union| (|Integer|) "failed")))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT % 59)) (QREFELT % 9)))
          (CONS 1 "failed"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 22))))) 

(SDEFUN |INTRVL;retract;%I;23| ((|u| (%)) (% (|Integer|)))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT % 59)) (QREFELT % 9)))
          (|error| "attempt to retract a non-Integer interval to an Integer"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 61))))) 

(SDEFUN |INTRVL;coerce;%Of;24| ((|u| (%)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 64))
               (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 64)))
         (QREFELT % 66))) 

(MAKEPROP '|INTRVL;characteristic;Nni;25| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTRVL;characteristic;Nni;25| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |INTRVL;pi;%;26| ((% (%)))
        (SPADCALL (SPADCALL (QREFELT % 70)) (SPADCALL (QREFELT % 70))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;log;2%;27| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (QREFELT % 72))
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 73))
                    (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 73))
                    (QREFELT % 24)))
         ('T (|error| "negative logs in interval")))) 

(SDEFUN |INTRVL;exp;2%;28| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 75))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 75))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;^;3%;29| ((|u| (%)) (|v| (%)) (% (%)))
        (SPROG ((|expts| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT % 45))
                  (COND
                   ((SPADCALL |u| (QREFELT % 45)) (|error| "0^0 is undefined"))
                   (#1='T (|spadConstant| % 15))))
                 ((SPADCALL |u| (QREFELT % 44)) (|spadConstant| % 15))
                 (#1#
                  (SEQ
                   (LETT |expts|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (SPADCALL |v| (QREFELT % 25))
                                     (QREFELT % 77))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (SPADCALL |v| (QREFELT % 26))
                                     (QREFELT % 77))
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (SPADCALL |v| (QREFELT % 26))
                                     (QREFELT % 77))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (SPADCALL |v| (QREFELT % 25))
                                     (QREFELT % 77)))
                          (QREFELT % 40)))
                   (EXIT
                    (SPADCALL (|SPADfirst| |expts|)
                              (SPADCALL |expts| (QREFELT % 41))
                              (QREFELT % 24))))))))) 

(SDEFUN |INTRVL;hasTwoPiMultiple|
        ((|offset| (R)) (|ipi| (R)) (|i| (%)) (% (|Boolean|)))
        (SPROG ((|next| (|Integer|)))
               (SEQ
                (LETT |next|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |i| (QREFELT % 25)) |offset|
                                   (QREFELT % 79))
                         (SPADCALL 2 |ipi| (QREFELT % 80)) (QREFELT % 38))
                        (QREFELT % 81))
                       (QREFELT % 61)))
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL (* 2 |next|) |ipi|
                                               (QREFELT % 82))
                                     (QREFELT % 83))
                           (QREFELT % 37)))))) 

(SDEFUN |INTRVL;hasPiMultiple|
        ((|offset| (R)) (|ipi| (R)) (|i| (%)) (% (|Boolean|)))
        (SPROG ((|next| (|Integer|)))
               (SEQ
                (LETT |next|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |i| (QREFELT % 25)) |offset|
                                   (QREFELT % 79))
                         |ipi| (QREFELT % 38))
                        (QREFELT % 81))
                       (QREFELT % 61)))
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL |next| |ipi| (QREFELT % 82))
                                     (QREFELT % 83))
                           (QREFELT % 37)))))) 

(SDEFUN |INTRVL;sin;2%;32| ((|u| (%)) (% (%)))
        (SPROG
         ((|ipi| (R)) (|hasOne?| #1=(|Boolean|)) (|hasMinusOne?| #1#)
          (|vals| (|List| R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
              (LETT |hasOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL |ipi| (SPADCALL 2 (QREFELT % 48))
                               (QREFELT % 38))
                     |ipi| |u| %))
              (LETT |hasMinusOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL (SPADCALL 3 |ipi| (QREFELT % 80))
                               (SPADCALL 2 (QREFELT % 48)) (QREFELT % 38))
                     |ipi| |u| %))
              (EXIT
               (COND
                (|hasOne?|
                 (COND
                  (|hasMinusOne?|
                   (|INTRVL;exactInterval|
                    (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                    (|spadConstant| % 16) %))
                  (#2='T
                   (SEQ
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                      (QREFELT % 84))
                            (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                      (QREFELT % 84)))
                           (QREFELT % 40)))
                    (EXIT
                     (COND
                      (|hasOne?|
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (|spadConstant| % 16) %))
                      (|hasMinusOne?|
                       (|INTRVL;exactInfInterval|
                        (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                        (SPADCALL |vals| (QREFELT % 41)) %))
                      (#2#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT % 41))
                                 (QREFELT % 24)))))))))
                (#2#
                 (SEQ
                  (LETT |vals|
                        (SPADCALL
                         (LIST
                          (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                    (QREFELT % 84))
                          (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                    (QREFELT % 84)))
                         (QREFELT % 40)))
                  (EXIT
                   (COND
                    (|hasOne?|
                     (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                      (|spadConstant| % 16) %))
                    (|hasMinusOne?|
                     (|INTRVL;exactInfInterval|
                      (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                      (SPADCALL |vals| (QREFELT % 41)) %))
                    (#2#
                     (SPADCALL (|SPADfirst| |vals|)
                               (SPADCALL |vals| (QREFELT % 41))
                               (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;cos;2%;33| ((|u| (%)) (% (%)))
        (SPROG
         ((|ipi| (R)) (|hasOne?| #1=(|Boolean|)) (|hasMinusOne?| #1#)
          (|vals| (|List| R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
              (LETT |hasOne?|
                    (|INTRVL;hasTwoPiMultiple| (|spadConstant| % 36) |ipi| |u|
                     %))
              (LETT |hasMinusOne?|
                    (|INTRVL;hasTwoPiMultiple| |ipi| |ipi| |u| %))
              (EXIT
               (COND
                (|hasOne?|
                 (COND
                  (|hasMinusOne?|
                   (|INTRVL;exactInterval|
                    (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                    (|spadConstant| % 16) %))
                  (#2='T
                   (SEQ
                    (LETT |vals|
                          (SPADCALL
                           (LIST
                            (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                      (QREFELT % 86))
                            (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                      (QREFELT % 86)))
                           (QREFELT % 40)))
                    (EXIT
                     (COND
                      (|hasOne?|
                       (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                        (|spadConstant| % 16) %))
                      (|hasMinusOne?|
                       (|INTRVL;exactInfInterval|
                        (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                        (SPADCALL |vals| (QREFELT % 41)) %))
                      (#2#
                       (SPADCALL (|SPADfirst| |vals|)
                                 (SPADCALL |vals| (QREFELT % 41))
                                 (QREFELT % 24)))))))))
                (#2#
                 (SEQ
                  (LETT |vals|
                        (SPADCALL
                         (LIST
                          (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                    (QREFELT % 86))
                          (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                    (QREFELT % 86)))
                         (QREFELT % 40)))
                  (EXIT
                   (COND
                    (|hasOne?|
                     (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                      (|spadConstant| % 16) %))
                    (|hasMinusOne?|
                     (|INTRVL;exactInfInterval|
                      (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                      (SPADCALL |vals| (QREFELT % 41)) %))
                    (#2#
                     (SPADCALL (|SPADfirst| |vals|)
                               (SPADCALL |vals| (QREFELT % 41))
                               (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;tan;2%;34| ((|u| (%)) (% (%)))
        (SPROG ((|ipi| (R)) (|lo| (R)) (|hi| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 59)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (LETT |lo|
                              (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                        (QREFELT % 88)))
                        (LETT |hi|
                              (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                        (QREFELT % 88)))
                        (EXIT
                         (COND
                          ((SPADCALL |lo| |hi| (QREFELT % 28))
                           (|error| "Interval contains a singularity"))
                          (#1# (SPADCALL |lo| |hi| (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;csc;2%;35| ((|u| (%)) (% (%)))
        (SPROG ((|ipi| (R)) (|vals| (|List| R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 59)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (COND
                         ((|INTRVL;hasPiMultiple| (|spadConstant| % 36) |ipi|
                           |u| %)
                          (|error| "Interval contains a singularity")))
                        (LETT |vals|
                              (SPADCALL
                               (LIST
                                (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                          (QREFELT % 90))
                                (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                          (QREFELT % 90)))
                               (QREFELT % 40)))
                        (EXIT
                         (COND
                          ((|INTRVL;hasTwoPiMultiple|
                            (SPADCALL |ipi| (SPADCALL 2 (QREFELT % 48))
                                      (QREFELT % 38))
                            |ipi| |u| %)
                           (|INTRVL;exactInfInterval| (|spadConstant| % 16)
                            (SPADCALL |vals| (QREFELT % 41)) %))
                          ((|INTRVL;hasTwoPiMultiple|
                            (SPADCALL (SPADCALL 3 |ipi| (QREFELT % 80))
                                      (SPADCALL 2 (QREFELT % 48))
                                      (QREFELT % 38))
                            |ipi| |u| %)
                           (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                            (SPADCALL (|spadConstant| % 16) (QREFELT % 30)) %))
                          (#1#
                           (SPADCALL (|SPADfirst| |vals|)
                                     (SPADCALL |vals| (QREFELT % 41))
                                     (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;sec;2%;36| ((|u| (%)) (% (%)))
        (SPROG ((|ipi| (R)) (|vals| (|List| R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 59)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (COND
                         ((|INTRVL;hasPiMultiple|
                           (SPADCALL |ipi| (SPADCALL 2 (QREFELT % 48))
                                     (QREFELT % 38))
                           |ipi| |u| %)
                          (|error| "Interval contains a singularity")))
                        (LETT |vals|
                              (SPADCALL
                               (LIST
                                (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                          (QREFELT % 92))
                                (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                          (QREFELT % 92)))
                               (QREFELT % 40)))
                        (EXIT
                         (COND
                          ((|INTRVL;hasTwoPiMultiple| (|spadConstant| % 36)
                            |ipi| |u| %)
                           (|INTRVL;exactInfInterval| (|spadConstant| % 16)
                            (SPADCALL |vals| (QREFELT % 41)) %))
                          ((|INTRVL;hasTwoPiMultiple| |ipi| |ipi| |u| %)
                           (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                            (SPADCALL (|spadConstant| % 16) (QREFELT % 30)) %))
                          (#1#
                           (SPADCALL (|SPADfirst| |vals|)
                                     (SPADCALL |vals| (QREFELT % 41))
                                     (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;cot;2%;37| ((|u| (%)) (% (%)))
        (SPROG ((|ipi| (R)) (|hi| (R)) (|lo| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 70)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 59)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (LETT |hi|
                              (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                        (QREFELT % 94)))
                        (LETT |lo|
                              (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                        (QREFELT % 94)))
                        (EXIT
                         (COND
                          ((SPADCALL |lo| |hi| (QREFELT % 28))
                           (|error| "Interval contains a singularity"))
                          (#1# (SPADCALL |lo| |hi| (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;asin;2%;38| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR
                       (SPADCALL |lo|
                                 (SPADCALL (|spadConstant| % 16)
                                           (QREFELT % 30))
                                 (QREFELT % 27))
                       (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28)))
                      (|error| "asin only defined on the region -1..1")))
                    (EXIT
                     (SPADCALL (SPADCALL |lo| (QREFELT % 96))
                               (SPADCALL |hi| (QREFELT % 96))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;acos;2%;39| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR
                       (SPADCALL |lo|
                                 (SPADCALL (|spadConstant| % 16)
                                           (QREFELT % 30))
                                 (QREFELT % 27))
                       (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28)))
                      (|error| "acos only defined on the region -1..1")))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 98))
                               (SPADCALL |lo| (QREFELT % 98))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;atan;2%;40| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 100))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 100))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;acot;2%;41| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 102))
                  (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 102))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;acsc;2%;42| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((SPADCALL |lo|
                                (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                                (QREFELT % 104))
                      (COND
                       ((SPADCALL |hi|
                                  (SPADCALL (|spadConstant| % 16)
                                            (QREFELT % 30))
                                  (QREFELT % 105))
                        (|error| #1="acsc not defined on the region -1..1"))
                       ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 104))
                        (COND
                         ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 105))
                          (|error| #1#))))))
                     ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 104))
                      (COND
                       ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 105))
                        (|error| #1#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 106))
                               (SPADCALL |lo| (QREFELT % 106))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;asec;2%;43| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((SPADCALL |lo|
                                (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                                (QREFELT % 27))
                      (COND
                       ((SPADCALL |hi|
                                  (SPADCALL (|spadConstant| % 16)
                                            (QREFELT % 30))
                                  (QREFELT % 28))
                        (|error| #1="asec not defined on the region -1..1"))
                       ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 27))
                        (COND
                         ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28))
                          (|error| #1#))))))
                     ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 27))
                      (COND
                       ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28))
                        (|error| #1#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |lo| (QREFELT % 108))
                               (SPADCALL |hi| (QREFELT % 108))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;tanh;2%;44| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 110))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 110))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;sinh;2%;45| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 112))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 112))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;sech;2%;46| ((|u| (%)) (% (%)))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT % 114))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 115))
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 115))
                   (QREFELT % 24)))
                 ((SPADCALL |u| (QREFELT % 72))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 115))
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 115))
                   (QREFELT % 24)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (QREFELT % 115))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (QREFELT % 115)))
                          (QREFELT % 40)))
                   (EXIT
                    (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                     (|spadConstant| % 16) %)))))))) 

(SDEFUN |INTRVL;cosh;2%;47| ((|u| (%)) (% (%)))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT % 114))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 117))
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 117))
                   (QREFELT % 24)))
                 ((SPADCALL |u| (QREFELT % 72))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 117))
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 117))
                   (QREFELT % 24)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (QREFELT % 117))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (QREFELT % 117)))
                          (QREFELT % 40)))
                   (EXIT
                    (|INTRVL;exactInfInterval| (|spadConstant| % 16)
                     (SPADCALL |vals| (QREFELT % 41)) %)))))))) 

(SDEFUN |INTRVL;csch;2%;48| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "csch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 119))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 119))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;coth;2%;49| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "coth: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 121))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 121))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;acosh;2%;50| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |u| (QREFELT % 25)) (|spadConstant| % 16)
                    (QREFELT % 27))
          (|error| "invalid argument: acosh only defined on the region 1.."))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 123))
                    (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 123))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;acoth;2%;51| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((SPADCALL |lo|
                                (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                                (QREFELT % 104))
                      (COND
                       ((SPADCALL |hi|
                                  (SPADCALL (|spadConstant| % 16)
                                            (QREFELT % 30))
                                  (QREFELT % 105))
                        (|error| #1="acoth not defined on the region -1..1"))
                       ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 104))
                        (COND
                         ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 105))
                          (|error| #1#))))))
                     ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 104))
                      (COND
                       ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 105))
                        (|error| #1#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 125))
                               (SPADCALL |lo| (QREFELT % 125))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;acsch;2%;52| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "acsch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 127))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 127))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;asech;2%;53| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR (SPADCALL |lo| (|spadConstant| % 36) (QREFELT % 104))
                          (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28)))
                      (|error| "asech only defined on the region 0 < x <= 1")))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 129))
                               (SPADCALL |lo| (QREFELT % 129))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;asinh;2%;54| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 131))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 131))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;atanh;2%;55| ((|u| (%)) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR
                       (SPADCALL |lo|
                                 (SPADCALL (|spadConstant| % 16)
                                           (QREFELT % 30))
                                 (QREFELT % 104))
                       (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 105)))
                      (|error| "atanh only defined on the region -1 < x < 1")))
                    (EXIT
                     (SPADCALL (SPADCALL |lo| (QREFELT % 133))
                               (SPADCALL |hi| (QREFELT % 133))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;^;%F%;56| ((|u| (%)) (|n| (|Fraction| (|Integer|))) (% (%)))
        (SPROG ((|lo| (R)) (|hi| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (EXIT
                     (COND
                      ((SPADCALL |lo| (|spadConstant| % 36) (QREFELT % 104))
                       (COND
                        ((EVENP (SPADCALL |n| (QREFELT % 52)))
                         (|error| "fractional power only defined for x > 0"))
                        ((EVENP (SPADCALL |n| (QREFELT % 57)))
                         (COND
                          ((SPADCALL |hi| (|spadConstant| % 36) (QREFELT % 27))
                           (SPADCALL (SPADCALL |hi| |n| (QREFELT % 135))
                                     (SPADCALL |lo| |n| (QREFELT % 135))
                                     (QREFELT % 136)))
                          (#1='T
                           (SPADCALL (|spadConstant| % 36)
                                     (SPADCALL
                                      (SPADCALL |lo| |n| (QREFELT % 135))
                                      (SPADCALL |hi| |n| (QREFELT % 135))
                                      (QREFELT % 137))
                                     (QREFELT % 136)))))
                        (#1#
                         (SPADCALL (SPADCALL |lo| |n| (QREFELT % 135))
                                   (SPADCALL |hi| |n| (QREFELT % 135))
                                   (QREFELT % 136)))))
                      (#1#
                       (SPADCALL (SPADCALL |lo| |n| (QREFELT % 135))
                                 (SPADCALL |hi| |n| (QREFELT % 135))
                                 (QREFELT % 136)))))))) 

(DECLAIM (NOTINLINE |Interval;|)) 

(DEFUN |Interval;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Interval| DV$1))
          (LETT % (GETREFV 143))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|MagmaWithZero|))
                                                (|HasCategory| |#1|
                                                               '(|OrderedMagma|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|MagmaWithZero|))
                                                (|HasCategory| |#1|
                                                               '(|OrderedMagmaWithZero|))
                                                (|not|
                                                 (|HasCategory| |#1|
                                                                '(|OrderedMagma|)))))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagmaWithZero|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#1|
                                                              '(|OrderedRing|)))
                                              (|HasCategory| |#1|
                                                             '(|SetWithZero|))))))
          (|haddProp| |$ConstructorCache| '|Interval| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 32))
          (AND
           (OR (|HasCategory| |#1| '(|SetWithZero|))
               (|HasCategory| % '(|SetWithZero|)))
           (|augmentPredVector| % 64))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|Record| (|:| |Inf| |#1|) (|:| |Sup| |#1|)))
          %))) 

(DEFUN |Interval| (#1=#:G234)
  (SPROG NIL
         (PROG (#2=#:G235)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Interval|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Interval;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Interval|)))))))))) 

(MAKEPROP '|Interval| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (0 . |zero?|) (|PositiveInteger|) (5 . |bits|) (|Integer|)
              (9 . |mantissa|) (14 . |exponent|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INTRVL;1;%;15|) %))
              (19 . |1|) (23 . |float|) (29 . |base|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INTRVL;0;%;16|) %))
              (33 . |one?|) (|Union| 12 '"failed") (38 . |retractIfCan|)
              |INTRVL;interval;R%;4| |INTRVL;qinterval;2R%;5| |INTRVL;inf;%R;9|
              |INTRVL;sup;%R;10| (43 . <) (49 . >) |INTRVL;<;2%B;11| (55 . -)
              |INTRVL;-;2%;12| (60 . =) |INTRVL;=;2%B;13| (66 . ~=)
              |INTRVL;~=;2%B;14| (72 . |0|) (76 . |contains?|) (82 . /)
              (|List| 6) (88 . |sort|) (93 . |last|) (|Union| % '"failed")
              |INTRVL;recip;%U;17| (98 . |one?|) (103 . |zero?|)
              |INTRVL;exquo;2%U;18| |INTRVL;gcd;3%;19| (108 . |coerce|)
              |INTRVL;coerce;I%;20| (|Fraction| 12) (113 . |coerce|)
              (118 . |denom|) (|Float|) (123 . |coerce|) (128 . |log2|)
              (133 . |retractIfCan|) (138 . |numer|) |INTRVL;interval;F%;21|
              (143 . |width|) |INTRVL;retractIfCan;%U;22| (148 . |retract|)
              |INTRVL;retract;%I;23| (|OutputForm|) (153 . |coerce|) (|List| %)
              (158 . |bracket|) |INTRVL;coerce;%Of;24| (|NonNegativeInteger|)
              |INTRVL;characteristic;Nni;25| (163 . |pi|) |INTRVL;pi;%;26|
              (167 . |positive?|) (172 . |log|) |INTRVL;log;2%;27|
              (177 . |exp|) |INTRVL;exp;2%;28| (182 . ^) |INTRVL;^;3%;29|
              (188 . -) (194 . *) (200 . |ceiling|) (205 . *) (211 . +)
              (217 . |sin|) |INTRVL;sin;2%;32| (222 . |cos|) |INTRVL;cos;2%;33|
              (227 . |tan|) |INTRVL;tan;2%;34| (232 . |csc|) |INTRVL;csc;2%;35|
              (237 . |sec|) |INTRVL;sec;2%;36| (242 . |cot|) |INTRVL;cot;2%;37|
              (247 . |asin|) |INTRVL;asin;2%;38| (252 . |acos|)
              |INTRVL;acos;2%;39| (257 . |atan|) |INTRVL;atan;2%;40|
              (262 . |acot|) |INTRVL;acot;2%;41| (267 . <=) (273 . >=)
              (279 . |acsc|) |INTRVL;acsc;2%;42| (284 . |asec|)
              |INTRVL;asec;2%;43| (289 . |tanh|) |INTRVL;tanh;2%;44|
              (294 . |sinh|) |INTRVL;sinh;2%;45| (299 . |negative?|)
              (304 . |sech|) |INTRVL;sech;2%;46| (309 . |cosh|)
              |INTRVL;cosh;2%;47| (314 . |csch|) |INTRVL;csch;2%;48|
              (319 . |coth|) |INTRVL;coth;2%;49| (324 . |acosh|)
              |INTRVL;acosh;2%;50| (329 . |acoth|) |INTRVL;acoth;2%;51|
              (334 . |acsch|) |INTRVL;acsch;2%;52| (339 . |asech|)
              |INTRVL;asech;2%;53| (344 . |asinh|) |INTRVL;asinh;2%;54|
              (349 . |atanh|) |INTRVL;atanh;2%;55| (354 . ^) (360 . |interval|)
              (366 . |max|) |INTRVL;^;%F%;56| (|String|)
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %)
                        (|:| |associate| %)))
           '#(~= 372 |zero?| 378 |width| 383 |unitNormal| 388 |unitCanonical|
              393 |unit?| 398 |tanh| 403 |tan| 408 |sup| 413 |subtractIfCan|
              418 |sqrt| 424 |smaller?| 429 |sinh| 435 |sin| 440 |sign| 445
              |sech| 450 |sec| 455 |sample| 460 |rightRecip| 464 |rightPower|
              469 |retractIfCan| 481 |retract| 486 |recip| 491 |qinterval| 496
              |positive?| 502 |plenaryPower| 507 |pi| 513 |opposite?| 517
              |one?| 523 |nthRoot| 528 |negative?| 534 |min| 539 |max| 545
              |log| 551 |leftRecip| 556 |leftPower| 561 |lcmCoef| 573 |lcm| 579
              |latex| 590 |inv| 595 |interval| 600 |inf| 616 |gcdPolynomial|
              621 |gcd| 627 |exquo| 638 |exp| 644 |error?| 649 |csch| 654 |csc|
              659 |coth| 664 |cot| 669 |cosh| 674 |cos| 679 |contains?| 684
              |commutator| 696 |coerce| 702 |characteristic| 722 |atanh| 726
              |atan| 731 |associator| 736 |associates?| 743 |asinh| 749 |asin|
              754 |asech| 759 |asec| 764 |antiCommutator| 769 |annihilate?| 775
              |acsch| 781 |acsc| 786 |acoth| 791 |acot| 796 |acosh| 801 |acos|
              806 |abs| 811 ^ 816 >= 840 > 846 = 852 <= 858 < 864 |1| 870 |0|
              874 / 878 - 884 + 895 * 907)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(NIL |GcdDomain&| NIL NIL NIL |Algebra&| |EntireRing&| NIL
                |AIntervalCategory&| |Rng&| NIL |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&| NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&| |MagmaWithUnit&| NIL
                NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| NIL
                |SetCategory&| NIL |TranscendentalFunctionCategory&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL |PartialOrder&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|IntervalCategory| 6) (|GcdDomain|) (|IntegralDomain|)
                 (|CommutativeRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|EntireRing|) (|Ring|) (|AIntervalCategory| 6) (|Rng|)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|Module| $$) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|MagmaWithZero|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|ComparableRepresentation|) (|SetCategory|)
                 (|CommutativeStar|) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| 12) (|CoercibleTo| 63) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|PartialOrder|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 12) (|Approximate|))
              (|makeByteWordVec2| 142
                                  '(1 6 8 0 9 0 6 10 11 1 6 12 0 13 1 6 12 0 14
                                    0 6 0 16 2 6 0 12 12 17 0 6 10 18 1 6 8 0
                                    20 1 6 21 0 22 2 6 8 0 0 27 2 6 8 0 0 28 1
                                    6 0 0 30 2 6 8 0 0 32 2 6 8 0 0 34 0 6 0 36
                                    2 0 8 0 6 37 2 6 0 0 0 38 1 39 0 0 40 1 39
                                    6 0 41 1 0 8 0 44 1 0 8 0 45 1 6 0 12 48 1
                                    6 0 50 51 1 50 12 0 52 1 53 0 12 54 1 53 0
                                    0 55 1 53 21 0 56 1 50 12 0 57 1 0 6 0 59 1
                                    6 12 0 61 1 6 63 0 64 1 63 0 65 66 0 6 0 70
                                    1 0 8 0 72 1 6 0 0 73 1 6 0 0 75 2 6 0 0 0
                                    77 2 6 0 0 0 79 2 6 0 10 0 80 1 6 0 0 81 2
                                    6 0 12 0 82 2 6 0 0 0 83 1 6 0 0 84 1 6 0 0
                                    86 1 6 0 0 88 1 6 0 0 90 1 6 0 0 92 1 6 0 0
                                    94 1 6 0 0 96 1 6 0 0 98 1 6 0 0 100 1 6 0
                                    0 102 2 6 8 0 0 104 2 6 8 0 0 105 1 6 0 0
                                    106 1 6 0 0 108 1 6 0 0 110 1 6 0 0 112 1 0
                                    8 0 114 1 6 0 0 115 1 6 0 0 117 1 6 0 0 119
                                    1 6 0 0 121 1 6 0 0 123 1 6 0 0 125 1 6 0 0
                                    127 1 6 0 0 129 1 6 0 0 131 1 6 0 0 133 2 6
                                    0 0 50 135 2 0 0 6 6 136 2 6 0 0 0 137 2 0
                                    8 0 0 35 1 0 8 0 45 1 2 6 0 59 1 0 142 0 1
                                    1 0 0 0 1 1 0 8 0 1 1 0 0 0 111 1 0 0 0 89
                                    1 0 6 0 26 2 0 42 0 0 1 1 0 0 0 1 2 0 8 0 0
                                    1 1 0 0 0 113 1 0 0 0 85 1 6 12 0 1 1 0 0 0
                                    116 1 0 0 0 93 0 0 0 1 1 0 42 0 1 2 0 0 0
                                    68 1 2 0 0 0 10 1 1 0 21 0 60 1 0 12 0 62 1
                                    0 42 0 43 2 0 0 6 6 24 1 7 8 0 72 2 0 0 0
                                    10 1 0 0 0 71 2 0 8 0 0 1 1 0 8 0 44 2 0 0
                                    0 12 1 1 7 8 0 114 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 0 0 74 1 0 42 0 1 2 0 0 0 68 1 2 0 0 0
                                    10 1 2 0 141 0 0 1 2 0 0 0 0 1 1 0 0 65 1 1
                                    0 139 0 1 1 4 0 0 1 2 0 0 6 6 136 1 0 0 6
                                    23 1 0 0 50 58 1 0 6 0 25 2 0 140 140 140 1
                                    1 0 0 65 1 2 0 0 0 0 47 2 0 42 0 0 46 1 0 0
                                    0 76 1 0 8 0 1 1 0 0 0 120 1 0 0 0 91 1 0 0
                                    0 122 1 0 0 0 95 1 0 0 0 118 1 0 0 0 87 2 0
                                    8 0 6 37 2 0 8 0 0 1 2 0 0 0 0 1 1 0 63 0
                                    67 1 0 39 0 1 1 0 0 0 1 1 0 0 12 49 0 0 68
                                    69 1 0 0 0 134 1 0 0 0 101 3 0 0 0 0 0 1 2
                                    0 8 0 0 1 1 0 0 0 132 1 0 0 0 97 1 0 0 0
                                    130 1 0 0 0 109 2 0 0 0 0 1 2 0 8 0 0 1 1 0
                                    0 0 128 1 0 0 0 107 1 0 0 0 126 1 0 0 0 103
                                    1 0 0 0 124 1 0 0 0 99 1 2 0 0 1 2 0 0 0 68
                                    1 2 0 0 0 10 1 2 0 0 0 0 78 2 0 0 0 50 138
                                    2 0 8 0 0 1 2 0 8 0 0 1 2 0 8 0 0 33 2 0 8
                                    0 0 1 2 0 8 0 0 29 0 0 0 15 0 0 0 19 2 4 0
                                    0 0 1 1 0 0 0 31 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 6 1 2 0 0 10 0 1 2 0 0 68 0 1 2 0 0
                                    12 0 1 2 0 0 0 0 1 2 3 0 6 0 1)))))
           '|lookupComplete|)) 
