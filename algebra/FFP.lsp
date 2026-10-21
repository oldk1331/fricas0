
(SDEFUN |FFP;generator;%;1| ((% (%)))
        (SPADCALL (SPADCALL (|spadConstant| % 30) 1 (QREFELT % 31))
                  (QREFELT % 32))) 

(SDEFUN |FFP;norm;%GF;2| ((|x| (%)) (% (GF)))
        (SPADCALL (QREFELT % 7) (SPADCALL |x| (QREFELT % 34)) (QREFELT % 35))) 

(SDEFUN |FFP;basis;PiV;3| ((|n| (|PositiveInteger|)) (% (|Vector| %)))
        (SPROG ((|a| (%)) (#1=#:G15 NIL) (|i| NIL) (#2=#:G16 NIL))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT % 12) |n|) 0 (QREFELT % 38))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL (SPADCALL (QREFELT % 39)) |n|
                                   (QREFELT % 41)))
                   (EXIT
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS (SPADCALL |a| |i| (QREFELT % 42))
                                         #1#))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 45))))))))) 

(SDEFUN |FFP;degree;%Pi;4| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((|m| (|Matrix| GF)) (|i| NIL) (#1=#:G23 NIL) (|y| (%))
          (#2=#:G20 NIL))
         (SEQ (LETT |y| (|spadConstant| % 29))
              (LETT |m|
                    (SPADCALL (QREFELT % 12) (+ (QREFELT % 12) 1)
                              (QREFELT % 49)))
              (SEQ (LETT |i| 1) (LETT #1# (+ (QREFELT % 12) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT % 51))
                              (QREFELT % 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT % 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #2# (SPADCALL |m| (QREFELT % 55)))
                 (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #2#)))))) 

(SDEFUN |FFP;minimalPolynomial;%Sup;5|
        ((|x| (%)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|m| (|Matrix| GF)) (#1=#:G32 NIL) (|y| (%)) (|v| (|Vector| GF))
          (|i| NIL) (#2=#:G33 NIL)
          (#3=#:G29 #4=(|SparseUnivariatePolynomial| GF)) (#5=#:G27 #4#)
          (#6=#:G28 NIL))
         (SEQ (LETT |y| (|spadConstant| % 29))
              (LETT |m|
                    (SPADCALL (QREFELT % 12) (+ (QREFELT % 12) 1)
                              (QREFELT % 49)))
              (SEQ (LETT |i| 1) (LETT #1# (+ (QREFELT % 12) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (SPADCALL |m| |i| (SPADCALL |y| (QREFELT % 51))
                              (QREFELT % 53))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT % 54)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT % 58))))
              (EXIT
               (PROGN
                (LETT #6# NIL)
                (SEQ (LETT |i| 0) (LETT #2# (QREFELT % 12)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT % 59))
                                        |i| (QREFELT % 31)))
                        (COND
                         (#6# (LETT #5# (SPADCALL #5# #3# (QREFELT % 60))))
                         ('T (PROGN (LETT #5# #3#) (LETT #6# 'T)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (COND (#6# #5#) ('T (|spadConstant| % 61)))))))) 

(SDEFUN |FFP;normal?;%B;6| ((|x| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G39 NIL) (|a| (%)) (|l| (|List| (|List| GF))))
               (SEQ
                (LETT |l|
                      (LIST
                       (SPADCALL (SPADCALL |x| (QREFELT % 51))
                                 (QREFELT % 64))))
                (LETT |a| |x|)
                (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 12)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |a| (QREFELT % 65)))
                          (EXIT
                           (LETT |l|
                                 (SPADCALL |l|
                                           (SPADCALL
                                            (SPADCALL |a| (QREFELT % 51))
                                            (QREFELT % 64))
                                           (QREFELT % 67)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL (SPADCALL (SPADCALL |l| (QREFELT % 68)) (QREFELT % 55))
                        (QREFELT % 12))
                   'T)
                  ('T NIL)))))) 

(SDEFUN |FFP;*;GF2%;7| ((|a| (GF)) (|x| (%)) (% (%)))
        (SPADCALL |a| |x| (QREFELT % 70))) 

(SDEFUN |FFP;*;I2%;8| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 72))) 

(SDEFUN |FFP;-;2%;9| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 74))) 

(SDEFUN |FFP;random;%;10| ((% (%))) (SPADCALL (QREFELT % 76))) 

(SDEFUN |FFP;coordinates;%V;11| ((|x| (%)) (% (|Vector| GF)))
        (SPADCALL |x| (QREFELT % 78))) 

(SDEFUN |FFP;represents;V%;12| ((|v| (|Vector| GF)) (% (%)))
        (SPADCALL |v| (QREFELT % 79))) 

(SDEFUN |FFP;coerce;GF%;13| ((|x| (GF)) (% (%))) (SPADCALL |x| (QREFELT % 81))) 

(SDEFUN |FFP;definingPolynomial;Sup;14| ((% (|SparseUnivariatePolynomial| GF)))
        (QREFELT % 7)) 

(SDEFUN |FFP;retract;%GF;15| ((|x| (%)) (% (GF))) (SPADCALL |x| (QREFELT % 84))) 

(SDEFUN |FFP;retractIfCan;%U;16| ((|x| (%)) (% (|Union| GF "failed")))
        (SPADCALL |x| (QREFELT % 87))) 

(SDEFUN |FFP;index;Pi%;17| ((|x| (|PositiveInteger|)) (% (%)))
        (SPADCALL |x| (QREFELT % 89))) 

(SDEFUN |FFP;lookup;%Pi;18| ((|x| (%)) (% (|PositiveInteger|)))
        (SPADCALL |x| (QREFELT % 91))) 

(SDEFUN |FFP;/;3%;19| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 93))) 

(SDEFUN |FFP;/;%GF%;20| ((|x| (%)) (|a| (GF)) (% (%)))
        (SPADCALL |x| (SPADCALL |a| (QREFELT % 82)) (QREFELT % 94))) 

(SDEFUN |FFP;*;3%;21| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 96))) 

(SDEFUN |FFP;+;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 97))) 

(SDEFUN |FFP;-;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 99))) 

(SDEFUN |FFP;=;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 101))) 

(SDEFUN |FFP;basis;V;25| ((% (|Vector| %))) (SPADCALL (QREFELT % 103))) 

(SDEFUN |FFP;0;%;26| ((% (%))) (|spadConstant| % 105)) 

(SDEFUN |FFP;1;%;27| ((% (%))) (|spadConstant| % 107)) 

(SDEFUN |FFP;factorsOfCyclicGroupSize;L;28|
        ((%
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SEQ (COND ((NULL (QREFELT % 20)) (|FFP;initializeElt| %)))
             (EXIT (QREFELT % 20)))) 

(MAKEPROP '|FFP;representationType;U;29| '|SPADreplace|
          '(XLAM NIL (CONS 1 "polynomial"))) 

(SDEFUN |FFP;representationType;U;29|
        ((% (|Union| "prime" "polynomial" "normal" "cyclic")))
        (CONS 1 "polynomial")) 

(SDEFUN |FFP;tableForDiscreteLogarithm;IT;30|
        ((|fac| (|Integer|))
         (% (|Table| (|PositiveInteger|) (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G84 NIL)
          (|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed")))
         (SEQ (COND ((QREFELT % 23) (|FFP;initializeLog| %)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1 (LETT #1# |fac|)
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT % 27) (QREFELT % 114)))
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFP;primitiveElement;%;31| ((% (%)))
        (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %)))
             (EXIT (SPADCALL (QREFELT % 22) (QREFELT % 90))))) 

(SDEFUN |FFP;normalElement;%;32| ((% (%)))
        (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %)))
             (EXIT (SPADCALL (QREFELT % 21) (QREFELT % 90))))) 

(SDEFUN |FFP;initializeElt| ((% (|Void|)))
        (SPROG ((|pE| (%)) (|nElt| (%)))
               (SEQ
                (SETELT % 20
                        (SPADCALL (SPADCALL (QREFELT % 19) (QREFELT % 119))
                                  (QREFELT % 121)))
                (LETT |pE| (SPADCALL (QREFELT % 122)))
                (SETELT % 22 (SPADCALL |pE| (QREFELT % 92)))
                (LETT |nElt| (SPADCALL (QREFELT % 33)))
                (SEQ G190
                     (COND
                      ((NULL (NULL (SPADCALL |nElt| (QREFELT % 69))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |nElt| (SPADCALL |nElt| |pE| (QREFELT % 54)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SETELT % 21 (SPADCALL |nElt| (QREFELT % 92)))
                (SETELT % 24 NIL) (EXIT (SPADCALL (QREFELT % 124)))))) 

(SDEFUN |FFP;initializeLog| ((% (|Void|)))
        (SPROG
         ((|limit| (|Integer|)) (|f| NIL) (#1=#:G119 NIL) (|fac| (|Integer|))
          (|base| (%)) (|l| (|Integer|)) (|d| (|Integer|)) (|n| (|Integer|))
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|i| NIL) (#2=#:G106 NIL) (#3=#:G120 NIL) (|a| (%)) (#4=#:G113 NIL))
         (SEQ (COND ((QREFELT % 24) (|FFP;initializeElt| %))) (LETT |limit| 30)
              (SEQ (LETT |f| NIL) (LETT #1# (QREFELT % 20)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|))
                        (LETT |base|
                              (SPADCALL (SPADCALL (QREFELT % 39))
                                        (|quotient_INT| (QREFELT % 19) |fac|)
                                        (QREFELT % 125)))
                        (LETT |l| (INTEGER-LENGTH |fac|)) (LETT |n| 0)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (|quotient_INT| |l| 2)))))
                         ('T (LETT |n| (ASH 1 (|quotient_INT| |l| 2)))))
                        (COND
                         ((< |n| |limit|)
                          (SEQ
                           (LETT |d|
                                 (+ (|quotient_INT| (- |fac| 1) |limit|) 1))
                           (EXIT
                            (LETT |n|
                                  (+ (|quotient_INT| (- |fac| 1) |d|) 1))))))
                        (LETT |tbl| (SPADCALL (QREFELT % 126)))
                        (LETT |a| (|spadConstant| % 29))
                        (SEQ (LETT |i| 0)
                             (LETT #3#
                                   (PROG1 (LETT #2# (- |n| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                             G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT % 92)) |i|) |tbl|
                               (QREFELT % 128))
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a| |base| (QREFELT % 54)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #4# |fac|)
                             (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                               '(|Integer|) #4#))
                           (SPADCALL |tbl| (QREFELT % 129)))
                          (QREFELT % 27) (QREFELT % 131))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SETELT % 23 NIL) (EXIT (SPADCALL (QREFELT % 124)))))) 

(SDEFUN |FFP;coerce;%Of;35| ((|e| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |e| (QREFELT % 34)) (QREFELT % 17) (QREFELT % 132))) 

(SDEFUN |FFP;extensionDegree;Pi;36| ((% (|PositiveInteger|))) (QREFELT % 12)) 

(SDEFUN |FFP;size;Nni;37| ((% (|NonNegativeInteger|))) (+ (QREFELT % 19) 1)) 

(SDEFUN |FFP;inGroundField?;%B;38| ((|x| (%)) (% (|Boolean|)))
        (NULL
         (SPADCALL (SPADCALL |x| (QREFELT % 88)) (CONS 1 "failed")
                   (QREFELT % 136)))) 

(SDEFUN |FFP;characteristic;Nni;39| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 138))) 

(DECLAIM (NOTINLINE |FiniteFieldExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G157 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|FiniteFieldExtensionByPolynomial| DV$1 DV$2))
    (LETT % (GETREFV 164))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|FiniteFieldExtensionByPolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND #1# (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 32))
    (AND (|HasCategory| % '(|CharacteristicZero|)) (|augmentPredVector| % 64))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|SimpleAlgebraicExtension| |#1|
                                          (|SparseUnivariatePolynomial| |#1|)
                                          |#2|))
    (QSETREFV % 12 (SPADCALL |#2| (QREFELT % 11)))
    (QSETREFV % 17 (SPADCALL (SPADCALL (QREFELT % 14)) (QREFELT % 16)))
    (QSETREFV % 19 (- (EXPT (SPADCALL (QREFELT % 18)) (QREFELT % 12)) 1))
    (QSETREFV % 20 NIL)
    (QSETREFV % 21 1)
    (QSETREFV % 22 1)
    (QSETREFV % 23 'T)
    (QSETREFV % 24 'T)
    (QSETREFV % 27 (SPADCALL (QREFELT % 26)))
    %))) 

(DEFUN |FiniteFieldExtensionByPolynomial| (&REST #1=#:G158)
  (SPROG NIL
         (PROG (#2=#:G159)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldExtensionByPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldExtensionByPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldExtensionByPolynomial|)))))))))) 

(MAKEPROP '|FiniteFieldExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (|Symbol|) (5 . |new|) (|OutputForm|)
              (9 . |coerce|) '|alpha| (14 . |size|) '|sizeCG| '|facOfGroupSize|
              '|normalElt| '|primitiveElt| '|initlog?| '|initelt?|
              (|Table| 40 115) (18 . |table|) '|discLogTable| (22 . |1|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;1;%;27|) %))
              (26 . |1|) (30 . |monomial|) (36 . |reduce|) |FFP;generator;%;1|
              (41 . |lift|) (46 . |resultant|) |FFP;norm;%GF;2| (|Boolean|)
              (52 . ~=) |FFP;primitiveElement;%;31| (|PositiveInteger|)
              (58 . |norm|) (64 . ^) (|List| $$) (|Vector| $$) (70 . |vector|)
              (|Vector| %) |FFP;basis;PiV;3| (|Matrix| 6) (75 . |zero|)
              (|Vector| 6) |FFP;coordinates;%V;11| (|Integer|)
              (81 . |setColumn!|) |FFP;*;3%;21| (88 . |rank|)
              |FFP;degree;%Pi;4| (|List| 50) (93 . |nullSpace|) (98 . |elt|)
              (104 . +) (110 . |0|) |FFP;minimalPolynomial;%Sup;5| (|List| 6)
              (114 . |entries|) (119 . |Frobenius|) (|List| 63)
              (124 . |concat|) (130 . |matrix|) |FFP;normal?;%B;6| (135 . *)
              |FFP;*;GF2%;7| (141 . *) |FFP;*;I2%;8| (147 . -) |FFP;-;2%;9|
              (152 . |random|) |FFP;random;%;10| (156 . |coordinates|)
              (161 . |represents|) |FFP;represents;V%;12| (166 . |coerce|)
              |FFP;coerce;GF%;13| |FFP;definingPolynomial;Sup;14|
              (171 . |retract|) |FFP;retract;%GF;15| (|Union| 6 '"failed")
              (176 . |retractIfCan|) |FFP;retractIfCan;%U;16| (181 . |index|)
              |FFP;index;Pi%;17| (186 . |lookup|) |FFP;lookup;%Pi;18| (191 . /)
              |FFP;/;3%;19| |FFP;/;%GF%;20| (197 . *) (203 . +) |FFP;+;3%;22|
              (209 . -) |FFP;-;3%;23| (215 . =) |FFP;=;2%B;24| (221 . |basis|)
              |FFP;basis;V;25| (225 . |0|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFP;0;%;26|) %))
              (229 . |1|) (|Record| (|:| |factor| 52) (|:| |exponent| 9))
              (|List| 108) |FFP;factorsOfCyclicGroupSize;L;28|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFP;representationType;U;29| (|Union| 115 '"failed")
              (233 . |search|) (|Table| 40 9)
              |FFP;tableForDiscreteLogarithm;IT;30| |FFP;normalElement;%;32|
              (|Factored| %) (239 . |factor|) (|Factored| 52) (244 . |factors|)
              (249 . |createPrimitiveElement|) (|Void|) (253 . |void|)
              (257 . ^) (263 . |table|)
              (|Record| (|:| |key| 40) (|:| |entry| 9)) (267 . |insert!|)
              (273 . |copy|) (|Record| (|:| |key| 40) (|:| |entry| 115))
              (278 . |insert!|) (284 . |outputForm|) |FFP;coerce;%Of;35|
              |FFP;extensionDegree;Pi;36| |FFP;size;Nni;37| (290 . =)
              |FFP;inGroundField?;%B;38| (296 . |characteristic|)
              |FFP;characteristic;Nni;39| (|String|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 144 '"failed")
              (|Record| (|:| |coef| 144) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 149 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|OnePointCompletion| 40) (|Union| 46 '#1="failed") (|Matrix| %)
              (|Union| 9 '"failed") (|Fraction| 52) (|InputForm|)
              (|Union| 10 '"failed") (|Factored| 145) (|Union| 161 '#1#)
              (|List| 145) (|SingleInteger|) (|HashState|))
           '#(~= 300 |zero?| 306 |unitNormal| 311 |unitCanonical| 316 |unit?|
              321 |transcendent?| 326 |transcendenceDegree| 331 |traceMatrix|
              335 |trace| 344 |tableForDiscreteLogarithm| 355 |subtractIfCan|
              360 |squareFreePolynomial| 366 |squareFreePart| 371 |squareFree|
              376 |solveLinearPolynomialEquation| 381 |smaller?| 387
              |sizeLess?| 393 |size| 399 |sample| 403 |rightRecip| 407
              |rightPower| 412 |retractIfCan| 424 |retract| 429 |represents|
              434 |representationType| 445 |rem| 449 |regularRepresentation|
              455 |recip| 466 |rank| 471 |random| 475 |quo| 479
              |principalIdeal| 485 |primitiveElement| 490 |primitive?| 494
              |primeFrobenius| 499 |prime?| 510 |plenaryPower| 515 |order| 521
              |opposite?| 531 |one?| 537 |normalElement| 542 |normal?| 546
              |norm| 551 |nextItem| 562 |multiEuclidean| 567
              |minimalPolynomial| 573 |lookup| 584 |linearAssociatedOrder| 589
              |linearAssociatedLog| 594 |linearAssociatedExp| 605 |leftRecip|
              611 |leftPower| 616 |lcmCoef| 628 |lcm| 634 |latex| 645 |inv| 650
              |init| 655 |index| 659 |inGroundField?| 664 |hashUpdate!| 669
              |hash| 675 |generator| 680 |gcdPolynomial| 684 |gcd| 690
              |factorsOfCyclicGroupSize| 701 |factorSquareFreePolynomial| 705
              |factorPolynomial| 710 |factor| 715 |extensionDegree| 720
              |extendedEuclidean| 728 |exquo| 741 |expressIdealMember| 747
              |euclideanSize| 753 |enumerate| 758 |divide| 762 |discriminant|
              768 |discreteLog| 777 |differentiate| 788 |degree| 799
              |definingPolynomial| 809 |createPrimitiveElement| 813
              |createNormalElement| 817 |coordinates| 821 |convert| 843
              |conditionP| 858 |commutator| 863 |coerce| 869 |charthRoot| 894
              |characteristicPolynomial| 904 |characteristic| 909 |basis| 913
              |associator| 922 |associates?| 929 |antiCommutator| 935
              |annihilate?| 941 |algebraic?| 947 ^ 952 |Frobenius| 970 D 981 =
              992 |1| 998 |0| 1002 / 1006 - 1018 + 1029 * 1035)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 2 0 3 0 2 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 1
                                  0 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 2 0
                                  0 0 2 0 0 0 0 2 2 0 0 0 4 0 0 0 2 1 3 0 0 0 0
                                  0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialRing&| |Algebra&| |Algebra&| |EntireRing&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Module&| NIL
                |Module&| |Module&| NIL |NonAssociativeRing&| NIL NIL
                |FramedModule&| NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| |Finite&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |Hashable&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|FiniteFieldCategory|)
                 (|ExtensionField| 6) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DifferentialRing|) (|Algebra| 156) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 6) (|Ring|)
                 (|NonAssociativeAlgebra| 156) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|Module| 156) (|SemiRng|) (|Module| $$) (|Module| 6)
                 (|BiModule| 156 156) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|FramedModule| 6) (|RightModule| 156)
                 (|LeftModule| 156) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianGroup|) (|Finite|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Comparable|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|Hashable|)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 6)
                 (|ConvertibleTo| 157) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|CoercibleTo| 15) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 163
                                  '(1 10 9 0 11 0 13 0 14 1 13 15 0 16 0 6 9 18
                                    0 25 0 26 0 10 0 28 0 6 0 30 2 10 0 6 9 31
                                    1 8 0 10 32 1 8 10 0 34 2 10 6 0 0 35 2 9
                                    37 0 0 38 2 0 0 0 40 41 2 0 0 0 9 42 1 44 0
                                    43 45 2 48 0 9 9 49 3 48 0 0 52 50 53 1 48
                                    9 0 55 1 48 57 0 58 2 50 6 0 52 59 2 10 0 0
                                    0 60 0 10 0 61 1 50 63 0 64 1 0 0 0 65 2 66
                                    0 0 63 67 1 48 0 66 68 2 8 0 6 0 70 2 8 0
                                    52 0 72 1 8 0 0 74 0 8 0 76 1 8 50 0 78 1 8
                                    0 50 79 1 8 0 6 81 1 8 6 0 84 1 8 86 0 87 1
                                    8 0 40 89 1 8 40 0 91 2 8 0 0 0 93 2 8 0 0
                                    0 96 2 8 0 0 0 97 2 8 0 0 0 99 2 8 37 0 0
                                    101 0 8 46 103 0 8 0 105 0 8 0 107 2 25 113
                                    40 0 114 1 52 118 0 119 1 120 109 0 121 0 0
                                    0 122 0 123 0 124 2 0 0 0 52 125 0 115 0
                                    126 2 115 0 127 0 128 1 115 0 0 129 2 25 0
                                    130 0 131 2 10 15 0 15 132 2 86 37 0 0 136
                                    0 6 9 138 2 0 37 0 0 1 1 0 37 0 1 1 0 142 0
                                    1 1 0 0 0 1 1 0 37 0 1 1 0 37 0 1 0 0 9 1 0
                                    0 48 1 1 0 48 46 1 1 0 6 0 1 2 2 0 0 40 1 1
                                    2 115 52 116 2 0 141 0 0 1 1 2 159 145 1 1
                                    0 0 0 1 1 0 118 0 1 2 2 160 161 145 1 2 2
                                    37 0 0 1 2 0 37 0 0 1 0 2 9 135 0 0 0 1 1 0
                                    141 0 1 2 0 0 0 40 1 2 0 0 0 9 1 1 0 86 0
                                    88 1 0 6 0 85 1 0 0 50 80 2 0 0 50 46 1 0 2
                                    111 112 2 0 0 0 0 1 1 0 48 0 1 2 0 48 0 46
                                    1 1 0 141 0 1 0 0 40 1 0 2 0 77 2 0 0 0 0 1
                                    1 0 147 144 1 0 2 0 39 1 2 37 0 1 2 3 0 0 9
                                    1 1 3 0 0 1 1 0 37 0 1 2 0 0 0 40 1 1 3 152
                                    0 1 1 2 40 0 1 2 0 37 0 0 1 1 0 37 0 1 0 2
                                    0 117 1 2 37 0 69 1 0 6 0 36 2 2 0 0 40 41
                                    1 2 141 0 1 2 0 146 144 0 1 1 5 10 0 62 2 2
                                    145 0 40 1 1 2 40 0 92 1 2 10 0 1 2 2 158 0
                                    0 1 1 2 10 0 1 2 2 0 0 10 1 1 0 141 0 1 2 0
                                    0 0 40 1 2 0 0 0 9 1 2 0 143 0 0 1 1 0 0
                                    144 1 2 0 0 0 0 1 1 0 140 0 1 1 0 0 0 1 0 2
                                    0 1 1 2 0 40 90 1 0 37 0 137 2 4 163 163 0
                                    1 1 4 162 0 1 0 2 0 33 2 0 145 145 145 1 1
                                    0 0 144 1 2 0 0 0 0 1 0 2 109 110 1 2 159
                                    145 1 1 2 159 145 1 1 0 118 0 1 0 0 152 1 0
                                    0 40 134 3 0 150 0 0 0 1 2 0 151 0 0 1 2 0
                                    141 0 0 1 2 0 146 144 0 1 1 0 9 0 1 0 2 144
                                    1 2 0 148 0 0 1 0 0 6 1 1 0 6 46 1 2 3 155
                                    0 0 1 1 2 9 0 1 1 2 0 0 1 2 2 0 0 9 1 1 0
                                    152 0 1 1 0 40 0 56 0 0 10 83 0 2 0 122 0 2
                                    0 1 1 0 50 0 51 1 0 48 46 1 2 0 48 46 46 1
                                    2 0 50 0 46 1 1 0 50 0 1 1 0 0 50 1 1 2 157
                                    0 1 1 6 153 154 1 2 0 0 0 0 1 1 0 15 0 133
                                    1 0 0 52 1 1 0 0 0 1 1 0 0 6 82 1 7 0 156 1
                                    1 6 141 0 1 1 2 0 0 1 1 0 10 0 1 0 0 9 139
                                    0 0 46 104 1 2 46 40 47 3 0 0 0 0 0 1 2 0
                                    37 0 0 1 2 0 0 0 0 1 2 0 37 0 0 1 1 0 37 0
                                    1 2 0 0 0 40 1 2 0 0 0 9 42 2 0 0 0 52 125
                                    2 2 0 0 9 1 1 2 0 0 65 1 2 0 0 1 2 2 0 0 9
                                    1 2 0 37 0 0 102 0 0 0 29 0 0 0 106 2 0 0 0
                                    0 94 2 0 0 0 6 95 2 0 0 0 0 100 1 0 0 0 75
                                    2 0 0 0 0 98 2 0 0 40 0 1 2 0 0 0 0 54 2 0
                                    0 52 0 73 2 0 0 9 0 1 2 0 0 6 0 71 2 0 0 0
                                    6 1 2 7 0 156 0 1 2 7 0 0 156 1)))))
           '|lookupComplete|)) 
