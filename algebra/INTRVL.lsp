
(SDEFUN |INTRVL;roundDown| ((|u| (R)) (% (R)))
        (SPROG
         ((|dig| (|Integer|)) (|eu| (|Integer|)) (|l| (|Integer|))
          (|m| (|Integer|)) (|prec| (|PositiveInteger|)))
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
         ((|dig| (|Integer|)) (|eu| (|Integer|)) (|l| (|Integer|))
          (|m| (|Integer|)) (|prec| (|PositiveInteger|)))
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
         ((BASE (|Integer|)) (|l| (|Integer|)) (|b| (|Integer|))
          (|m| (|Integer|)))
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

(PUT '|INTRVL;exactInterval| '|SPADreplace| 'CONS) 

(SDEFUN |INTRVL;exactInterval| ((|i| (R)) (|s| (R)) (% (%))) (CONS |i| |s|)) 

(SDEFUN |INTRVL;exactSupInterval| ((|i| (R)) (|s| (R)) (% (%)))
        (CONS (|INTRVL;roundDown| |i| %) |s|)) 

(SDEFUN |INTRVL;exactInfInterval| ((|i| (R)) (|s| (R)) (% (%)))
        (CONS |i| (|INTRVL;roundUp| |s| %))) 

(PUT '|INTRVL;inf;%R;9| '|SPADreplace| 'QCAR) 

(SDEFUN |INTRVL;inf;%R;9| ((|u| (%)) (% (R))) (QCAR |u|)) 

(PUT '|INTRVL;sup;%R;10| '|SPADreplace| 'QCDR) 

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

(SDEFUN |INTRVL;One;%;15| ((% (%)))
        (SPROG ((|one| (R)))
               (SEQ
                (LETT |one| (|INTRVL;normaliseFloat| (|spadConstant| % 16) %))
                (EXIT (CONS |one| |one|))))) 

(SDEFUN |INTRVL;Zero;%;16| ((% (%)))
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
        (SPROG ((|flt| (R)) (|bin| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |flt| (SPADCALL |u| (QREFELT % 51)))
                    (LETT |bin|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |u| (QREFELT % 52))
                                      (QREFELT % 54))
                            (QREFELT % 56))
                           (QREFELT % 57)))
                    (COND
                     ((QEQCAR |bin| 0)
                      (COND
                       ((< (INTEGER-LENGTH (SPADCALL |u| (QREFELT % 58)))
                           (SPADCALL (QREFELT % 11)))
                        (EXIT
                         (SEQ (LETT |flt| (|INTRVL;normaliseFloat| |flt| %))
                              (EXIT
                               (|INTRVL;exactInterval| |flt| |flt| %))))))))
                    (EXIT (SPADCALL |flt| |flt| (QREFELT % 24)))))) 

(SDEFUN |INTRVL;retractIfCan;%U;22|
        ((|u| (%)) (% (|Union| (|Integer|) "failed")))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT % 60)) (QREFELT % 9)))
          (CONS 1 "failed"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 22))))) 

(SDEFUN |INTRVL;retract;%I;23| ((|u| (%)) (% (|Integer|)))
        (COND
         ((NULL (SPADCALL (SPADCALL |u| (QREFELT % 60)) (QREFELT % 9)))
          (|error| "attempt to retract a non-Integer interval to an Integer"))
         ('T (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 62))))) 

(SDEFUN |INTRVL;coerce;%Of;24| ((|u| (%)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 65))
               (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 65)))
         (QREFELT % 67))) 

(PUT '|INTRVL;characteristic;Nni;25| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTRVL;characteristic;Nni;25| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |INTRVL;pi;%;26| ((% (%)))
        (SPADCALL (SPADCALL (QREFELT % 71)) (SPADCALL (QREFELT % 71))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;log;2%;27| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (QREFELT % 73))
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 74))
                    (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 74))
                    (QREFELT % 24)))
         ('T (|error| "negative logs in interval")))) 

(SDEFUN |INTRVL;exp;2%;28| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 76))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 76))
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
                                     (QREFELT % 78))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (SPADCALL |v| (QREFELT % 26))
                                     (QREFELT % 78))
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (SPADCALL |v| (QREFELT % 26))
                                     (QREFELT % 78))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (SPADCALL |v| (QREFELT % 25))
                                     (QREFELT % 78)))
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
                                   (QREFELT % 80))
                         (SPADCALL 2 |ipi| (QREFELT % 81)) (QREFELT % 38))
                        (QREFELT % 82))
                       (QREFELT % 62)))
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL (* 2 |next|) |ipi|
                                               (QREFELT % 83))
                                     (QREFELT % 84))
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
                                   (QREFELT % 80))
                         |ipi| (QREFELT % 38))
                        (QREFELT % 82))
                       (QREFELT % 62)))
                (EXIT
                 (SPADCALL |i|
                           (SPADCALL |offset|
                                     (SPADCALL |next| |ipi| (QREFELT % 83))
                                     (QREFELT % 84))
                           (QREFELT % 37)))))) 

(SDEFUN |INTRVL;sin;2%;32| ((|u| (%)) (% (%)))
        (SPROG
         ((|vals| (|List| R)) (|hasMinusOne?| #1=(|Boolean|)) (|hasOne?| #1#)
          (|ipi| (R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
              (LETT |hasOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL |ipi| (SPADCALL 2 (QREFELT % 48))
                               (QREFELT % 38))
                     |ipi| |u| %))
              (LETT |hasMinusOne?|
                    (|INTRVL;hasTwoPiMultiple|
                     (SPADCALL (SPADCALL 3 |ipi| (QREFELT % 81))
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
                                      (QREFELT % 85))
                            (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                      (QREFELT % 85)))
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
                                    (QREFELT % 85))
                          (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                    (QREFELT % 85)))
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
         ((|vals| (|List| R)) (|hasMinusOne?| #1=(|Boolean|)) (|hasOne?| #1#)
          (|ipi| (R)))
         (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
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
                                      (QREFELT % 87))
                            (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                      (QREFELT % 87)))
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
                                    (QREFELT % 87))
                          (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                    (QREFELT % 87)))
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
        (SPROG ((|hi| (R)) (|lo| (R)) (|ipi| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 60)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (LETT |lo|
                              (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                        (QREFELT % 89)))
                        (LETT |hi|
                              (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                        (QREFELT % 89)))
                        (EXIT
                         (COND
                          ((SPADCALL |lo| |hi| (QREFELT % 28))
                           (|error| "Interval contains a singularity"))
                          (#1# (SPADCALL |lo| |hi| (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;csc;2%;35| ((|u| (%)) (% (%)))
        (SPROG ((|vals| (|List| R)) (|ipi| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 60)) |ipi|
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
                                          (QREFELT % 91))
                                (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                          (QREFELT % 91)))
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
                            (SPADCALL (SPADCALL 3 |ipi| (QREFELT % 81))
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
        (SPROG ((|vals| (|List| R)) (|ipi| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 60)) |ipi|
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
                                          (QREFELT % 93))
                                (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                          (QREFELT % 93)))
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
        (SPROG ((|lo| (R)) (|hi| (R)) (|ipi| (R)))
               (SEQ (LETT |ipi| (SPADCALL (QREFELT % 71)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |u| (QREFELT % 60)) |ipi|
                                 (QREFELT % 28))
                       (|error| "Interval contains a singularity"))
                      (#1='T
                       (SEQ
                        (LETT |hi|
                              (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                        (QREFELT % 95)))
                        (LETT |lo|
                              (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                        (QREFELT % 95)))
                        (EXIT
                         (COND
                          ((SPADCALL |lo| |hi| (QREFELT % 28))
                           (|error| "Interval contains a singularity"))
                          (#1# (SPADCALL |lo| |hi| (QREFELT % 24)))))))))))) 

(SDEFUN |INTRVL;asin;2%;38| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
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
                     (SPADCALL (SPADCALL |lo| (QREFELT % 97))
                               (SPADCALL |hi| (QREFELT % 97))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;acos;2%;39| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
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
                     (SPADCALL (SPADCALL |hi| (QREFELT % 99))
                               (SPADCALL |lo| (QREFELT % 99))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;atan;2%;40| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 101))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 101))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;acot;2%;41| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 103))
                  (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 103))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;acsc;2%;42| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((SPADCALL |lo|
                                (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                                (QREFELT % 105))
                      (COND
                       ((SPADCALL |hi|
                                  (SPADCALL (|spadConstant| % 16)
                                            (QREFELT % 30))
                                  (QREFELT % 106))
                        (|error| #1="acsc not defined on the region -1..1"))
                       ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 105))
                        (COND
                         ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 106))
                          (|error| #1#))))))
                     ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 105))
                      (COND
                       ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 106))
                        (|error| #1#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 107))
                               (SPADCALL |lo| (QREFELT % 107))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;asec;2%;43| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
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
                     (SPADCALL (SPADCALL |lo| (QREFELT % 109))
                               (SPADCALL |hi| (QREFELT % 109))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;tanh;2%;44| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 111))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 111))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;sinh;2%;45| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 113))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 113))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;sech;2%;46| ((|u| (%)) (% (%)))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT % 115))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 116))
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 116))
                   (QREFELT % 24)))
                 ((SPADCALL |u| (QREFELT % 73))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 116))
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 116))
                   (QREFELT % 24)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (QREFELT % 116))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (QREFELT % 116)))
                          (QREFELT % 40)))
                   (EXIT
                    (|INTRVL;exactSupInterval| (|SPADfirst| |vals|)
                     (|spadConstant| % 16) %)))))))) 

(SDEFUN |INTRVL;cosh;2%;47| ((|u| (%)) (% (%)))
        (SPROG ((|vals| (|List| R)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT % 115))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 118))
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 118))
                   (QREFELT % 24)))
                 ((SPADCALL |u| (QREFELT % 73))
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 118))
                   (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 118))
                   (QREFELT % 24)))
                 ('T
                  (SEQ
                   (LETT |vals|
                         (SPADCALL
                          (LIST
                           (SPADCALL (SPADCALL |u| (QREFELT % 25))
                                     (QREFELT % 118))
                           (SPADCALL (SPADCALL |u| (QREFELT % 26))
                                     (QREFELT % 118)))
                          (QREFELT % 40)))
                   (EXIT
                    (|INTRVL;exactInfInterval| (|spadConstant| % 16)
                     (SPADCALL |vals| (QREFELT % 41)) %)))))))) 

(SDEFUN |INTRVL;csch;2%;48| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "csch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 120))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 120))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;coth;2%;49| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "coth: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 122))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 122))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;acosh;2%;50| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |u| (QREFELT % 25)) (|spadConstant| % 16)
                    (QREFELT % 27))
          (|error| "invalid argument: acosh only defined on the region 1.."))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 124))
                    (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 124))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;acoth;2%;51| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((SPADCALL |lo|
                                (SPADCALL (|spadConstant| % 16) (QREFELT % 30))
                                (QREFELT % 105))
                      (COND
                       ((SPADCALL |hi|
                                  (SPADCALL (|spadConstant| % 16)
                                            (QREFELT % 30))
                                  (QREFELT % 106))
                        (|error| #1="acoth not defined on the region -1..1"))
                       ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 105))
                        (COND
                         ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 106))
                          (|error| #1#))))))
                     ((SPADCALL |lo| (|spadConstant| % 16) (QREFELT % 105))
                      (COND
                       ((SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 106))
                        (|error| #1#)))))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 126))
                               (SPADCALL |lo| (QREFELT % 126))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;acsch;2%;52| ((|u| (%)) (% (%)))
        (COND
         ((SPADCALL |u| (|spadConstant| % 36) (QREFELT % 37))
          (|error| "acsch: singularity at zero"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 128))
                    (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 128))
                    (QREFELT % 24))))) 

(SDEFUN |INTRVL;asech;2%;53| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR (SPADCALL |lo| (|spadConstant| % 36) (QREFELT % 105))
                          (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 28)))
                      (|error| "asech only defined on the region 0 < x <= 1")))
                    (EXIT
                     (SPADCALL (SPADCALL |hi| (QREFELT % 130))
                               (SPADCALL |lo| (QREFELT % 130))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;asinh;2%;54| ((|u| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 132))
                  (SPADCALL (SPADCALL |u| (QREFELT % 26)) (QREFELT % 132))
                  (QREFELT % 24))) 

(SDEFUN |INTRVL;atanh;2%;55| ((|u| (%)) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (COND
                     ((OR
                       (SPADCALL |lo|
                                 (SPADCALL (|spadConstant| % 16)
                                           (QREFELT % 30))
                                 (QREFELT % 105))
                       (SPADCALL |hi| (|spadConstant| % 16) (QREFELT % 106)))
                      (|error| "atanh only defined on the region -1 < x < 1")))
                    (EXIT
                     (SPADCALL (SPADCALL |lo| (QREFELT % 134))
                               (SPADCALL |hi| (QREFELT % 134))
                               (QREFELT % 24)))))) 

(SDEFUN |INTRVL;^;%F%;56| ((|u| (%)) (|n| (|Fraction| (|Integer|))) (% (%)))
        (SPROG ((|hi| (R)) (|lo| (R)))
               (SEQ (LETT |lo| (SPADCALL |u| (QREFELT % 25)))
                    (LETT |hi| (SPADCALL |u| (QREFELT % 26)))
                    (EXIT
                     (COND
                      ((SPADCALL |lo| (|spadConstant| % 36) (QREFELT % 105))
                       (COND
                        ((EVENP (SPADCALL |n| (QREFELT % 52)))
                         (|error| "fractional power only defined for x > 0"))
                        ((EVENP (SPADCALL |n| (QREFELT % 58)))
                         (COND
                          ((SPADCALL |hi| (|spadConstant| % 36) (QREFELT % 27))
                           (SPADCALL (|spadConstant| % 36)
                                     (SPADCALL |lo| |n| (QREFELT % 136))
                                     (QREFELT % 137)))
                          (#1='T
                           (SPADCALL (|spadConstant| % 36)
                                     (SPADCALL
                                      (SPADCALL |lo| |n| (QREFELT % 136))
                                      (SPADCALL |hi| |n| (QREFELT % 136))
                                      (QREFELT % 138))
                                     (QREFELT % 137)))))
                        (#1#
                         (SPADCALL (SPADCALL |lo| |n| (QREFELT % 136))
                                   (SPADCALL |hi| |n| (QREFELT % 136))
                                   (QREFELT % 137)))))
                      (#1#
                       (SPADCALL (SPADCALL |lo| |n| (QREFELT % 136))
                                 (SPADCALL |hi| |n| (QREFELT % 136))
                                 (QREFELT % 137)))))))) 

(DECLAIM (NOTINLINE |Interval;|)) 

(DEFUN |Interval;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Interval| DV$1))
          (LETT % (GETREFV 144))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianGroup|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|OrderedSemiGroup|))
                                               (|HasCategory| |#1|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#1|
                                                              '(|OrderedRing|)))))))
          (|haddProp| |$ConstructorCache| '|Interval| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|Record| (|:| |Inf| |#1|) (|:| |Sup| |#1|)))
          %))) 

(DEFUN |Interval| (#1=#:G231)
  (SPROG NIL
         (PROG (#2=#:G232)
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
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTRVL;One;%;15|) %))
              (19 . |One|) (23 . |float|) (29 . |base|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTRVL;Zero;%;16|) %))
              (33 . |one?|) (|Union| 12 '"failed") (38 . |retractIfCan|)
              |INTRVL;interval;R%;4| |INTRVL;qinterval;2R%;5| |INTRVL;inf;%R;9|
              |INTRVL;sup;%R;10| (43 . <) (49 . >) |INTRVL;<;2%B;11| (55 . -)
              |INTRVL;-;2%;12| (60 . =) |INTRVL;=;2%B;13| (66 . ~=)
              |INTRVL;~=;2%B;14| (72 . |Zero|) (76 . |contains?|) (82 . /)
              (|List| 6) (88 . |sort|) (93 . |last|) (|Union| % '"failed")
              |INTRVL;recip;%U;17| (98 . |one?|) (103 . |zero?|)
              |INTRVL;exquo;2%U;18| |INTRVL;gcd;3%;19| (108 . |coerce|)
              |INTRVL;coerce;I%;20| (|Fraction| 12) (113 . |coerce|)
              (118 . |denom|) (|Float|) (123 . |coerce|) (128 . |log2|)
              (132 . |log2|) (137 . |retractIfCan|) (142 . |numer|)
              |INTRVL;interval;F%;21| (147 . |width|)
              |INTRVL;retractIfCan;%U;22| (152 . |retract|)
              |INTRVL;retract;%I;23| (|OutputForm|) (157 . |coerce|) (|List| %)
              (162 . |bracket|) |INTRVL;coerce;%Of;24| (|NonNegativeInteger|)
              |INTRVL;characteristic;Nni;25| (167 . |pi|) |INTRVL;pi;%;26|
              (171 . |positive?|) (176 . |log|) |INTRVL;log;2%;27|
              (181 . |exp|) |INTRVL;exp;2%;28| (186 . ^) |INTRVL;^;3%;29|
              (192 . -) (198 . *) (204 . |ceiling|) (209 . *) (215 . +)
              (221 . |sin|) |INTRVL;sin;2%;32| (226 . |cos|) |INTRVL;cos;2%;33|
              (231 . |tan|) |INTRVL;tan;2%;34| (236 . |csc|) |INTRVL;csc;2%;35|
              (241 . |sec|) |INTRVL;sec;2%;36| (246 . |cot|) |INTRVL;cot;2%;37|
              (251 . |asin|) |INTRVL;asin;2%;38| (256 . |acos|)
              |INTRVL;acos;2%;39| (261 . |atan|) |INTRVL;atan;2%;40|
              (266 . |acot|) |INTRVL;acot;2%;41| (271 . <=) (277 . >=)
              (283 . |acsc|) |INTRVL;acsc;2%;42| (288 . |asec|)
              |INTRVL;asec;2%;43| (293 . |tanh|) |INTRVL;tanh;2%;44|
              (298 . |sinh|) |INTRVL;sinh;2%;45| (303 . |negative?|)
              (308 . |sech|) |INTRVL;sech;2%;46| (313 . |cosh|)
              |INTRVL;cosh;2%;47| (318 . |csch|) |INTRVL;csch;2%;48|
              (323 . |coth|) |INTRVL;coth;2%;49| (328 . |acosh|)
              |INTRVL;acosh;2%;50| (333 . |acoth|) |INTRVL;acoth;2%;51|
              (338 . |acsch|) |INTRVL;acsch;2%;52| (343 . |asech|)
              |INTRVL;asech;2%;53| (348 . |asinh|) |INTRVL;asinh;2%;54|
              (353 . |atanh|) |INTRVL;atanh;2%;55| (358 . ^) (364 . |interval|)
              (370 . |max|) |INTRVL;^;%F%;56| (|String|)
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %)
                        (|:| |associate| %)))
           '#(~= 376 |zero?| 382 |width| 387 |unitNormal| 392 |unitCanonical|
              397 |unit?| 402 |tanh| 407 |tan| 412 |sup| 417 |subtractIfCan|
              422 |sqrt| 428 |smaller?| 433 |sinh| 439 |sin| 444 |sech| 449
              |sec| 454 |sample| 459 |rightRecip| 463 |rightPower| 468
              |retractIfCan| 480 |retract| 485 |recip| 490 |qinterval| 495
              |positive?| 501 |plenaryPower| 506 |pi| 512 |opposite?| 516
              |one?| 522 |nthRoot| 527 |negative?| 533 |min| 538 |max| 544
              |log| 550 |leftRecip| 555 |leftPower| 560 |lcmCoef| 572 |lcm| 578
              |latex| 589 |inv| 594 |interval| 599 |inf| 615 |gcdPolynomial|
              620 |gcd| 626 |exquo| 637 |exp| 643 |error?| 648 |csch| 653 |csc|
              658 |coth| 663 |cot| 668 |cosh| 673 |cos| 678 |contains?| 683
              |commutator| 695 |coerce| 701 |characteristic| 721 |atanh| 725
              |atan| 730 |associator| 735 |associates?| 742 |asinh| 748 |asin|
              753 |asech| 758 |asec| 763 |antiCommutator| 768 |annihilate?| 774
              |acsch| 780 |acsc| 785 |acoth| 790 |acot| 795 |acosh| 800 |acos|
              805 |abs| 810 ^ 815 |Zero| 839 |One| 843 >= 847 > 853 = 859 <=
              865 < 871 / 877 - 883 + 894 * 906)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(NIL |GcdDomain&| NIL NIL NIL |Algebra&| |EntireRing&| NIL
                |AIntervalCategory&| |Rng&| NIL |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |NonAssociativeSemiRng&|
                |AbelianMonoid&| |MagmaWithUnit&| NIL |OrderedSet&|
                |AbelianSemiGroup&| |Magma&| NIL |SetCategory&| NIL
                |TranscendentalFunctionCategory&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL |PartialOrder&|
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
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 12)
                 (|CoercibleTo| 64) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 12) (|Approximate|))
              (|makeByteWordVec2| 143
                                  '(1 6 8 0 9 0 6 10 11 1 6 12 0 13 1 6 12 0 14
                                    0 6 0 16 2 6 0 12 12 17 0 6 10 18 1 6 8 0
                                    20 1 6 21 0 22 2 6 8 0 0 27 2 6 8 0 0 28 1
                                    6 0 0 30 2 6 8 0 0 32 2 6 8 0 0 34 0 6 0 36
                                    2 0 8 0 6 37 2 6 0 0 0 38 1 39 0 0 40 1 39
                                    6 0 41 1 0 8 0 44 1 0 8 0 45 1 6 0 12 48 1
                                    6 0 50 51 1 50 12 0 52 1 53 0 12 54 0 53 0
                                    55 1 53 0 0 56 1 53 21 0 57 1 50 12 0 58 1
                                    0 6 0 60 1 6 12 0 62 1 6 64 0 65 1 64 0 66
                                    67 0 6 0 71 1 0 8 0 73 1 6 0 0 74 1 6 0 0
                                    76 2 6 0 0 0 78 2 6 0 0 0 80 2 6 0 10 0 81
                                    1 6 0 0 82 2 6 0 12 0 83 2 6 0 0 0 84 1 6 0
                                    0 85 1 6 0 0 87 1 6 0 0 89 1 6 0 0 91 1 6 0
                                    0 93 1 6 0 0 95 1 6 0 0 97 1 6 0 0 99 1 6 0
                                    0 101 1 6 0 0 103 2 6 8 0 0 105 2 6 8 0 0
                                    106 1 6 0 0 107 1 6 0 0 109 1 6 0 0 111 1 6
                                    0 0 113 1 0 8 0 115 1 6 0 0 116 1 6 0 0 118
                                    1 6 0 0 120 1 6 0 0 122 1 6 0 0 124 1 6 0 0
                                    126 1 6 0 0 128 1 6 0 0 130 1 6 0 0 132 1 6
                                    0 0 134 2 6 0 0 50 136 2 0 0 6 6 137 2 6 0
                                    0 0 138 2 0 8 0 0 35 1 0 8 0 45 1 2 6 0 60
                                    1 0 143 0 1 1 0 0 0 1 1 0 8 0 1 1 0 0 0 112
                                    1 0 0 0 90 1 0 6 0 26 2 0 42 0 0 1 1 0 0 0
                                    1 2 0 8 0 0 1 1 0 0 0 114 1 0 0 0 86 1 0 0
                                    0 117 1 0 0 0 94 0 0 0 1 1 0 42 0 1 2 0 0 0
                                    69 1 2 0 0 0 10 1 1 0 21 0 61 1 0 12 0 63 1
                                    0 42 0 43 2 0 0 6 6 24 1 1 8 0 73 2 0 0 0
                                    10 1 0 0 0 72 2 0 8 0 0 1 1 0 8 0 44 2 0 0
                                    0 12 1 1 1 8 0 115 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 0 0 75 1 0 42 0 1 2 0 0 0 69 1 2 0 0 0
                                    10 1 2 0 142 0 0 1 1 0 0 66 1 2 0 0 0 0 1 1
                                    0 140 0 1 1 4 0 0 1 2 0 0 6 6 137 1 0 0 6
                                    23 1 0 0 50 59 1 0 6 0 25 2 0 141 141 141 1
                                    1 0 0 66 1 2 0 0 0 0 47 2 0 42 0 0 46 1 0 0
                                    0 77 1 0 8 0 1 1 0 0 0 121 1 0 0 0 92 1 0 0
                                    0 123 1 0 0 0 96 1 0 0 0 119 1 0 0 0 88 2 0
                                    8 0 6 37 2 0 8 0 0 1 2 0 0 0 0 1 1 0 64 0
                                    68 1 0 39 0 1 1 0 0 0 1 1 0 0 12 49 0 0 69
                                    70 1 0 0 0 135 1 0 0 0 102 3 0 0 0 0 0 1 2
                                    0 8 0 0 1 1 0 0 0 133 1 0 0 0 98 1 0 0 0
                                    131 1 0 0 0 110 2 0 0 0 0 1 2 0 8 0 0 1 1 0
                                    0 0 129 1 0 0 0 108 1 0 0 0 127 1 0 0 0 104
                                    1 0 0 0 125 1 0 0 0 100 1 2 0 0 1 2 0 0 0
                                    69 1 2 0 0 0 10 1 2 0 0 0 0 79 2 0 0 0 50
                                    139 0 0 0 19 0 0 0 15 2 0 8 0 0 1 2 0 8 0 0
                                    1 2 0 8 0 0 33 2 0 8 0 0 1 2 0 8 0 0 29 2 4
                                    0 0 0 1 1 0 0 0 31 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 6 1 2 0 0 10 0 1 2 0 0 69 0 1 2 0 0
                                    12 0 1 2 0 0 0 0 1 2 3 0 6 0 1)))))
           '|lookupComplete|)) 
