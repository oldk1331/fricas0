
(SDEFUN |IDPO;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G80 NIL) (|t| NIL) (#2=#:G81 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t| NIL) (LETT #2# |x|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (SPADCALL (SPADCALL (QCAR |t|) (QREFELT % 10))
                                          (SPADCALL (QCDR |t|) (QREFELT % 11))
                                          (QREFELT % 12))
                                #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 14))))) 

(MAKEPROP '|IDPO;listOfTerms;%L;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IDPO;listOfTerms;%L;2|
        ((|x| (%)) (% (|List| (|Record| (|:| |k| S) (|:| |c| A))))) |x|) 

(SDEFUN |IDPO;monomial?;%B;3| ((|x| (%)) (% (|Boolean|)))
        (COND ((NULL |x|) NIL) ('T (NULL (CDR |x|))))) 

(MAKEPROP '|IDPO;numberOfMonomials;%Nni;4| '|SPADreplace| 'LENGTH) 

(SDEFUN |IDPO;numberOfMonomials;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (LENGTH |x|)) 

(SDEFUN |IDPO;monomial;AS%;5| ((|r| (A)) (|s| (S)) (% (%)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 24) (QREFELT % 25))
          (|spadConstant| % 23))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |IDPO;map;M2%;6| ((|f| (|Mapping| A A)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G97 NIL) (|tm| NIL) (#2=#:G98 NIL) (|a| (A)))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |tm| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |tm| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (LETT |a| (SPADCALL (QCDR |tm|) |f|))
                                     (|spadConstant| % 24) (QREFELT % 25)))
                          (LETT #1# (CONS (CONS (QCAR |tm|) |a|) #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |IDPO;monomial;AS%;7| ((|r| (A)) (|s| (S)) (% (%)))
        (LIST (CONS |s| |r|))) 

(SDEFUN |IDPO;map;M2%;8| ((|f| (|Mapping| A A)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G105 NIL) (|tm| NIL) (#2=#:G106 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |tm| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |tm| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (CONS (QCAR |tm|) (SPADCALL (QCDR |tm|) |f|))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |IDPO;smaller?;2%B;9| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G118 NIL))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL |y|)
                          (COND
                           ((NULL |x|) (PROGN (LETT #1# NIL) (GO #2=#:G117)))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR (|SPADfirst| |x|))
                                             (|spadConstant| % 24)
                                             (QREFELT % 29)))
                             (GO #2#)))))
                         ((NULL |x|)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (|spadConstant| % 24)
                                           (QCDR (|SPADfirst| |y|))
                                           (QREFELT % 29)))
                           (GO #2#)))
                         ((SPADCALL (QCAR (|SPADfirst| |x|))
                                    (QCAR (|SPADfirst| |y|)) (QREFELT % 30))
                          (COND
                           ((SPADCALL (QCDR (|SPADfirst| |x|))
                                      (QCDR (|SPADfirst| |y|)) (QREFELT % 25))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT (LETT |y| (CDR |y|)))))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR (|SPADfirst| |x|))
                                             (QCDR (|SPADfirst| |y|))
                                             (QREFELT % 29)))
                             (GO #2#)))))
                         ((SPADCALL (QCAR (|SPADfirst| |x|))
                                    (QCAR (|SPADfirst| |y|)) (QREFELT % 31))
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (|spadConstant| % 24)
                                           (QCDR (|SPADfirst| |y|))
                                           (QREFELT % 29)))
                           (GO #2#)))
                         ('T
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (QCDR (|SPADfirst| |x|))
                                           (|spadConstant| % 24)
                                           (QREFELT % 29)))
                           (GO #2#))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |IDPO;smaller?;2%B;10| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G130 NIL))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL |y|)
                          (COND
                           ((OR (NULL |x|) 'T)
                            (PROGN (LETT #1# NIL) (GO #2=#:G129)))))
                         ((NULL |x|) (PROGN (LETT #1# 'T) (GO #2#)))
                         ((SPADCALL (QCAR (|SPADfirst| |x|))
                                    (QCAR (|SPADfirst| |y|)) (QREFELT % 30))
                          (COND
                           ((SPADCALL (QCDR (|SPADfirst| |x|))
                                      (QCDR (|SPADfirst| |y|)) (QREFELT % 25))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT (LETT |y| (CDR |y|)))))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR (|SPADfirst| |x|))
                                             (QCDR (|SPADfirst| |y|))
                                             (QREFELT % 29)))
                             (GO #2#)))))
                         ((SPADCALL (QCAR (|SPADfirst| |x|))
                                    (QCAR (|SPADfirst| |y|)) (QREFELT % 31))
                          (PROGN (LETT #1# 'T) (GO #2#)))
                         ('T (PROGN (LETT #1# NIL) (GO #2#))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |IDPO;=;2%B;11| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G141 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((OR
                            (SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT % 33))
                            (SPADCALL (QCDR (|SPADfirst| |x|))
                                      (QCDR (|SPADfirst| |y|)) (QREFELT % 34)))
                           (PROGN (LETT #1# NIL) (GO #2=#:G140)))
                          ('T
                           (SEQ (LETT |x| (CDR |x|))
                                (EXIT (LETT |y| (CDR |y|))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (COND ((NULL |x|) (NULL |y|)) ('T NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |IDPO;reductum;2%;12| ((|x| (%)) (% (%)))
        (COND ((NULL |x|) (|spadConstant| % 23)) ('T (CDR |x|)))) 

(SDEFUN |IDPO;leadingCoefficient;%A;13| ((|x| (%)) (% (A)))
        (COND ((NULL |x|) (|spadConstant| % 24)) ('T (QCDR (|SPADfirst| |x|))))) 

(MAKEPROP '|IDPO;reductum;2%;14| '|SPADreplace| 'CDR) 

(SDEFUN |IDPO;reductum;2%;14| ((|x| (%)) (% (%))) (CDR |x|)) 

(SDEFUN |IDPO;leadingCoefficient;%A;15| ((|x| (%)) (% (A)))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (QCDR (|SPADfirst| |x|))))) 

(SDEFUN |IDPO;leadingSupport;%S;16| ((|x| (%)) (% (S)))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (QCAR (|SPADfirst| |x|))))) 

(SDEFUN |IDPO;leadingMonomial;2%;17| ((|x| (%)) (% (%)))
        (SPADCALL (QCDR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |x|))
                  (QREFELT % 26))) 

(SDEFUN |IDPO;compareterm|
        ((|a| (|Record| (|:| |k| S) (|:| |c| A)))
         (|b| (|Record| (|:| |k| S) (|:| |c| A))) (% (|Boolean|)))
        (SPADCALL (QCAR |b|) (QCAR |a|) (QREFELT % 31))) 

(SDEFUN |IDPO;construct;L%;19|
        ((|lx| (|List| (|Record| (|:| |k| S) (|:| |c| A)))) (% (%)))
        (SPADCALL (CONS (|function| |IDPO;compareterm|) %) |lx| (QREFELT % 41))) 

(MAKEPROP '|IDPO;constructOrdered;L%;20| '|SPADreplace| '(XLAM (|lx|) |lx|)) 

(SDEFUN |IDPO;constructOrdered;L%;20|
        ((|lx| (|List| (|Record| (|:| |k| S) (|:| |c| A)))) (% (%))) |lx|) 

(SDEFUN |IDPO;leadingTerm;%R;21|
        ((|x| (%)) (% (|Record| (|:| |k| S) (|:| |c| A))))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (|SPADfirst| |x|)))) 

(SDEFUN |IDPO;hashUpdate!;Hs%Hs;22|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG ((|xl| (|Rep|)) (|t| NIL) (#1=#:G165 NIL))
               (SEQ (LETT |xl| |x|)
                    (SEQ (LETT |t| NIL) (LETT #1# |xl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |s| (SPADCALL |s| (QCAR |t|) (QREFELT % 46)))
                          (EXIT
                           (LETT |s|
                                 (SPADCALL |s| (QCDR |t|) (QREFELT % 47)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(MAKEPROP '|IDPO;0;%;23| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |IDPO;0;%;23| ((% (%))) NIL) 

(MAKEPROP '|IDPO;zero?;%B;24| '|SPADreplace| 'NULL) 

(SDEFUN |IDPO;zero?;%B;24| ((|x| (%)) (% (|Boolean|))) (NULL |x|)) 

(SDEFUN |IDPO;add_gen| ((|x| (|Rep|)) (|y| (|Rep|)) (% (|Rep|)))
        (SPROG
         ((|tx| #1=(|Record| (|:| |k| S) (|:| |c| A))) (|ty| #1#)
          (|newcoef| (A)) (|newcell| (|Rep|)) (|endcell| (|Rep|))
          (|end| (|Rep|)) (|res| (|Rep|)))
         (SEQ (LETT |endcell| NIL) (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                     (GO G191)))
                   (SEQ (LETT |tx| (|SPADfirst| |x|))
                        (LETT |ty| (|SPADfirst| |y|)) (LETT |newcell| NIL)
                        (COND
                         ((SPADCALL (QCAR |tx|) (QCAR |ty|) (QREFELT % 30))
                          (SEQ
                           (LETT |newcoef|
                                 (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                           (QREFELT % 50)))
                           (COND
                            ((NULL (SPADCALL |newcoef| (QREFELT % 51)))
                             (LETT |newcell|
                                   (CONS (CONS (QCAR |tx|) |newcoef|) NIL))))
                           (LETT |x| (CDR |x|)) (EXIT (LETT |y| (CDR |y|)))))
                         ((SPADCALL (QCAR |ty|) (QCAR |tx|) (QREFELT % 31))
                          (SEQ (LETT |newcell| (CONS |tx| NIL))
                               (EXIT (LETT |x| (CDR |x|)))))
                         ('T
                          (SEQ (LETT |newcell| (CONS |ty| NIL))
                               (EXIT (LETT |y| (CDR |y|))))))
                        (EXIT
                         (COND
                          ((NULL (NULL |newcell|))
                           (COND
                            ((NULL |endcell|)
                             (SEQ (LETT |res| |newcell|)
                                  (EXIT (LETT |endcell| |res|))))
                            ('T
                             (SEQ (RPLACD |endcell| |newcell|)
                                  (EXIT (LETT |endcell| |newcell|)))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((NULL |x|) (LETT |end| |y|)) (#2='T (LETT |end| |x|)))
              (COND ((NULL |res|) (LETT |res| |end|))
                    (#2# (RPLACD |endcell| |end|)))
              (EXIT |res|)))) 

(SDEFUN |IDPO;add_si|
        ((|x| (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
         (|y| #1=(|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
         (% (|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A)))))
        (SPROG
         ((|tx| #2=(|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A)))
          (|ty| #2#) (|newcoef| (A))
          (|newcell|
           #3=(|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
          (|endcell| #3#) (|end| #1#) (|res| #3#))
         (SEQ (LETT |endcell| NIL) (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                     (GO G191)))
                   (SEQ (LETT |tx| (|SPADfirst| |x|))
                        (LETT |ty| (|SPADfirst| |y|)) (LETT |newcell| NIL)
                        (COND
                         ((|eql_SI| (QCAR |tx|) (QCAR |ty|))
                          (SEQ
                           (LETT |newcoef|
                                 (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                           (QREFELT % 50)))
                           (COND
                            ((NULL (SPADCALL |newcoef| (QREFELT % 51)))
                             (LETT |newcell|
                                   (CONS (CONS (QCAR |tx|) |newcoef|) NIL))))
                           (LETT |x| (CDR |x|)) (EXIT (LETT |y| (CDR |y|)))))
                         ((SPADCALL (QCAR |ty|) (QCAR |tx|) (QREFELT % 53))
                          (SEQ (LETT |newcell| (CONS |tx| NIL))
                               (EXIT (LETT |x| (CDR |x|)))))
                         ('T
                          (SEQ (LETT |newcell| (CONS |ty| NIL))
                               (EXIT (LETT |y| (CDR |y|))))))
                        (EXIT
                         (COND
                          ((NULL (NULL |newcell|))
                           (COND
                            ((NULL |endcell|)
                             (SEQ (LETT |res| |newcell|)
                                  (EXIT (LETT |endcell| |res|))))
                            ('T
                             (SEQ (RPLACD |endcell| |newcell|)
                                  (EXIT (LETT |endcell| |newcell|)))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((NULL |x|) (LETT |end| |y|)) (#4='T (LETT |end| |x|)))
              (COND ((NULL |res|) (LETT |res| |end|))
                    (#4# (RPLACD |endcell| |end|)))
              (EXIT |res|)))) 

(SDEFUN |IDPO;+;3%;27| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|degx| (|Integer|)) (|degy| (|Integer|)) (|msi| (|SingleInteger|)))
         (SEQ
          (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
                ('T
                 (SEQ (LETT |degx| (QCAR (|SPADfirst| |x|)))
                      (LETT |degy| (QCAR (|SPADfirst| |y|)))
                      (LETT |msi| MOST-POSITIVE-FIXNUM)
                      (COND
                       ((< |degx| |msi|)
                        (COND
                         ((< |degy| |msi|) (EXIT (|IDPO;add_si| |x| |y| %))))))
                      (EXIT (|IDPO;add_gen| |x| |y| %)))))))) 

(SDEFUN |IDPO;+;3%;28| ((|x| (%)) (|y| (%)) (% (%)))
        (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
              ('T (|IDPO;add_gen| |x| |y| %)))) 

(SDEFUN |IDPO;*;Nni2%;29| ((|n| (|NonNegativeInteger|)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G217 NIL) (|u| NIL) (#2=#:G218 NIL) (|a| (A)))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| % 23)) ((EQL |n| 1) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |n| (QCDR |u|)
                                                  (QREFELT % 55)))
                                  (|spadConstant| % 24) (QREFELT % 34))
                                 (LETT #1#
                                       (CONS (CONS (QCAR |u|) |a|) #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |IDPO;-;2%;30| ((|x| (%)) (% (%)))
        (SPROG ((#1=#:G222 NIL) (|u| NIL) (#2=#:G223 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (CONS (QCAR |u|)
                                     (SPADCALL (QCDR |u|) (QREFELT % 57)))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |IDPO;*;I2%;31| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G227 NIL) (|u| NIL) (#2=#:G228 NIL) (|a| (A)))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| % 23)) ((EQL |n| 1) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |n| (QCDR |u|)
                                                  (QREFELT % 60)))
                                  (|spadConstant| % 24) (QREFELT % 34))
                                 (LETT #1#
                                       (CONS (CONS (QCAR |u|) |a|) #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |IDPO;-;3%;32| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|r| (A)) (|newcell| (%)) (|endcell| (|Rep|)) (|end| (%))
          (|res| (|Rep|)))
         (SEQ
          (COND ((NULL |x|) (SPADCALL |y| (QREFELT % 58))) ((NULL |y|) |x|)
                (#1='T
                 (SEQ (LETT |endcell| NIL) (LETT |res| NIL)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                             (GO G191)))
                           (SEQ (LETT |newcell| NIL)
                                (COND
                                 ((SPADCALL (QCAR (|SPADfirst| |x|))
                                            (QCAR (|SPADfirst| |y|))
                                            (QREFELT % 30))
                                  (SEQ
                                   (LETT |r|
                                         (SPADCALL (QCDR (|SPADfirst| |x|))
                                                   (QCDR (|SPADfirst| |y|))
                                                   (QREFELT % 62)))
                                   (COND
                                    ((NULL (SPADCALL |r| (QREFELT % 51)))
                                     (LETT |newcell|
                                           (CONS
                                            (CONS (QCAR (|SPADfirst| |x|)) |r|)
                                            NIL))))
                                   (LETT |x| (CDR |x|))
                                   (EXIT (LETT |y| (CDR |y|)))))
                                 ((SPADCALL (QCAR (|SPADfirst| |y|))
                                            (QCAR (|SPADfirst| |x|))
                                            (QREFELT % 31))
                                  (SEQ
                                   (LETT |newcell|
                                         (CONS (|SPADfirst| |x|) NIL))
                                   (EXIT (LETT |x| (CDR |x|)))))
                                 ('T
                                  (SEQ
                                   (LETT |newcell|
                                         (CONS
                                          (CONS (QCAR (|SPADfirst| |y|))
                                                (SPADCALL
                                                 (QCDR (|SPADfirst| |y|))
                                                 (QREFELT % 57)))
                                          NIL))
                                   (EXIT (LETT |y| (CDR |y|))))))
                                (EXIT
                                 (COND
                                  ((NULL (NULL |newcell|))
                                   (COND
                                    ((NULL |endcell|)
                                     (SEQ (LETT |res| |newcell|)
                                          (EXIT (LETT |endcell| |res|))))
                                    ('T
                                     (SEQ (RPLACD |endcell| |newcell|)
                                          (EXIT
                                           (LETT |endcell| |newcell|)))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (COND
                       ((NULL |x|) (LETT |end| (SPADCALL |y| (QREFELT % 58))))
                       (#1# (LETT |end| |x|)))
                      (COND ((NULL |res|) (LETT |res| |end|))
                            (#1# (RPLACD |endcell| |end|)))
                      (EXIT |res|))))))) 

(SDEFUN |IDPO;subtractIfCan;2%U;33|
        ((|x| (%)) (|y| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|ru| (|Union| A #1#)) (#2=#:G287 NIL) (|r| (A)) (|newcell| (%))
          (|endcell| (|Rep|)) (|res| (|Rep|)))
         (SEQ
          (EXIT
           (COND ((NULL |y|) (CONS 0 |x|))
                 (#3='T
                  (SEQ (LETT |endcell| NIL) (LETT |res| NIL)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                              (GO G191)))
                            (SEQ (LETT |newcell| NIL)
                                 (COND
                                  ((SPADCALL (QCAR (|SPADfirst| |x|))
                                             (QCAR (|SPADfirst| |y|))
                                             (QREFELT % 30))
                                   (SEQ
                                    (LETT |ru|
                                          (SPADCALL (QCDR (|SPADfirst| |x|))
                                                    (QCDR (|SPADfirst| |y|))
                                                    (QREFELT % 65)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ru| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed"))
                                        (GO #4=#:G286)))
                                      ('T
                                       (SEQ (LETT |r| (QCDR |ru|))
                                            (COND
                                             ((NULL
                                               (SPADCALL |r| (QREFELT % 51)))
                                              (LETT |newcell|
                                                    (CONS
                                                     (CONS
                                                      (QCAR (|SPADfirst| |x|))
                                                      |r|)
                                                     NIL))))
                                            (LETT |x| (CDR |x|))
                                            (EXIT (LETT |y| (CDR |y|)))))))))
                                  ((SPADCALL (QCAR (|SPADfirst| |y|))
                                             (QCAR (|SPADfirst| |x|))
                                             (QREFELT % 31))
                                   (SEQ
                                    (LETT |newcell|
                                          (CONS (|SPADfirst| |x|) NIL))
                                    (EXIT (LETT |x| (CDR |x|)))))
                                  ('T
                                   (SEQ
                                    (LETT |ru|
                                          (SPADCALL (|spadConstant| % 24)
                                                    (QCDR (|SPADfirst| |y|))
                                                    (QREFELT % 65)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ru| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed"))
                                        (GO #4#)))
                                      ('T
                                       (SEQ (LETT |r| (QCDR |ru|))
                                            (LETT |newcell|
                                                  (CONS
                                                   (CONS
                                                    (QCAR (|SPADfirst| |y|))
                                                    |r|)
                                                   NIL))
                                            (EXIT (LETT |y| (CDR |y|))))))))))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |newcell|))
                                    (COND
                                     ((NULL |endcell|)
                                      (SEQ (LETT |res| |newcell|)
                                           (EXIT (LETT |endcell| |res|))))
                                     ('T
                                      (SEQ (RPLACD |endcell| |newcell|)
                                           (EXIT
                                            (LETT |endcell| |newcell|)))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((NULL |x|)
                          (SEQ
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |y|))) (GO G191)))
                                (SEQ
                                 (LETT |ru|
                                       (SPADCALL (|spadConstant| % 24)
                                                 (QCDR (|SPADfirst| |y|))
                                                 (QREFELT % 65)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ru| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed"))
                                     (GO #4#)))
                                   ('T
                                    (SEQ (LETT |r| (QCDR |ru|))
                                         (LETT |newcell|
                                               (CONS
                                                (CONS (QCAR (|SPADfirst| |y|))
                                                      |r|)
                                                NIL))
                                         (LETT |y| (CDR |y|))
                                         (EXIT
                                          (COND
                                           ((NULL |endcell|)
                                            (SEQ (LETT |res| |newcell|)
                                                 (EXIT
                                                  (LETT |endcell| |res|))))
                                           ('T
                                            (SEQ (RPLACD |endcell| |newcell|)
                                                 (EXIT
                                                  (LETT |endcell|
                                                        |newcell|)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS 0 |res|))))
                         (#3#
                          (SEQ
                           (COND ((NULL |res|) (LETT |res| |x|))
                                 (#3# (RPLACD |endcell| |x|)))
                           (EXIT (CONS 0 |res|))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |IDPO;<;2%B;34| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 32))) 

(SDEFUN |IDPO;sup;3%;35| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|u| (A)))
               (SEQ
                (COND ((NULL |y|) |x|) ((NULL |x|) |y|)
                      ((SPADCALL (QCAR (|SPADfirst| |x|))
                                 (QCAR (|SPADfirst| |y|)) (QREFELT % 68))
                       (CONS (|SPADfirst| |y|)
                             (SPADCALL |x| (CDR |y|) (QREFELT % 69))))
                      ((SPADCALL (QCAR (|SPADfirst| |x|))
                                 (QCAR (|SPADfirst| |y|)) (QREFELT % 70))
                       (CONS (|SPADfirst| |x|)
                             (SPADCALL (CDR |x|) |y| (QREFELT % 69))))
                      ('T
                       (SEQ
                        (LETT |u|
                              (SPADCALL (QCDR (|SPADfirst| |x|))
                                        (QCDR (|SPADfirst| |y|))
                                        (QREFELT % 71)))
                        (EXIT
                         (CONS (CONS (QCAR (|SPADfirst| |x|)) |u|)
                               (SPADCALL (CDR |x|) (CDR |y|)
                                         (QREFELT % 69)))))))))) 

(SDEFUN |IDPO;inf;3%;36| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|x1| #1=(|Record| (|:| |k| S) (|:| |c| A))) (|y1| #1#)
          (|res| (|Rep|)) (|xr| (|Rep|)) (|yr| (|Rep|)))
         (SEQ (LETT |xr| |x|) (LETT |yr| |y|) (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |xr|) NIL) ('T (NULL (NULL |yr|)))))
                     (GO G191)))
                   (SEQ (LETT |x1| (|SPADfirst| |xr|))
                        (LETT |y1| (|SPADfirst| |yr|))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |x1|) (QCAR |y1|) (QREFELT % 68))
                           (LETT |xr| (CDR |xr|)))
                          ((SPADCALL (QCAR |x1|) (QCAR |y1|) (QREFELT % 70))
                           (LETT |yr| (CDR |yr|)))
                          ('T
                           (SEQ
                            (LETT |res|
                                  (CONS
                                   (CONS (QCAR |x1|)
                                         (SPADCALL (QCDR |x1|) (QCDR |y1|)
                                                   (QREFELT % 72)))
                                   |res|))
                            (LETT |xr| (CDR |xr|))
                            (EXIT (LETT |yr| (CDR |yr|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(MAKEPROP '|IDPO;construct;L%;37| '|SPADreplace| '(XLAM (|lx|) |lx|)) 

(SDEFUN |IDPO;construct;L%;37|
        ((|lx| (|List| (|Record| (|:| |k| S) (|:| |c| A)))) (% (%))) |lx|) 

(MAKEPROP '|IDPO;0;%;38| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |IDPO;0;%;38| ((% (%))) NIL) 

(SDEFUN |IDPO;do_copy| ((|xr| (|Rep|)) (% (|Rep|)))
        (SPROG ((|t| NIL) (#1=#:G312 NIL) (|res| (%)))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |t| NIL) (LETT #1# |xr|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (CONS (CONS (QCAR |t|) (QCDR |t|)) |res|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |IDPO;+;3%;40| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|xxr| (|Rep|)) (|yr| (|Rep|)) (|s| NIL) (#1=#:G328 NIL) (|sk| (S))
          (|sc| (A)) (|t| (|Record| (|:| |k| S) (|:| |c| A))) (|tc| (A))
          (|nxr| (|Rep|)) (|done| #2=(|Boolean|)) (|first_time| #2#)
          (|pxr| (|Rep|)) (|cxr| (|Rep|)) (|xr| (|Rep|)))
         (SEQ (LETT |xxr| |x|) (LETT |yr| |y|)
              (EXIT
               (COND ((NULL |xxr|) |y|) ((NULL |yr|) |x|)
                     ((> (LENGTH |yr|) (LENGTH |xxr|))
                      (SPADCALL |y| |x| (QREFELT % 54)))
                     ('T
                      (SEQ (LETT |xr| (|IDPO;do_copy| |xxr| %))
                           (SEQ (LETT |s| NIL) (LETT #1# |yr|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |sk| (QCAR |s|))
                                     (LETT |sc| (QCDR |s|)) (LETT |done| NIL)
                                     (LETT |first_time| 'T) (LETT |nxr| |xr|)
                                     (LETT |cxr| |xr|)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (NULL (OR (NULL |cxr|) |done|)))
                                            (GO G191)))
                                          (SEQ (LETT |t| (|SPADfirst| |cxr|))
                                               (COND
                                                ((SPADCALL (QCAR |t|) |sk|
                                                           (QREFELT % 30))
                                                 (SEQ
                                                  (LETT |tc|
                                                        (SPADCALL (QCDR |t|)
                                                                  |sc|
                                                                  (QREFELT %
                                                                           50)))
                                                  (COND
                                                   ((SPADCALL |tc|
                                                              (|spadConstant| %
                                                                              24)
                                                              (QREFELT % 25))
                                                    (COND
                                                     (|first_time|
                                                      (LETT |nxr| (CDR |cxr|)))
                                                     ('T
                                                      (|qset_rest| |pxr|
                                                                   (CDR
                                                                    |cxr|)))))
                                                   ('T
                                                    (PROGN
                                                     (RPLACD |t| |tc|)
                                                     (QCDR |t|))))
                                                  (EXIT (LETT |done| 'T)))))
                                               (LETT |first_time| NIL)
                                               (LETT |pxr| |cxr|)
                                               (EXIT (LETT |cxr| (CDR |cxr|))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (LETT |xr| |nxr|)
                                     (EXIT
                                      (COND
                                       ((NULL |done|)
                                        (LETT |xr|
                                              (CONS (CONS |sk| |sc|) |xr|))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |xr|)))))))) 

(SDEFUN |IDPO;=;2%B;41| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((|xr| (|Rep|)) (|yr| (|Rep|)) (|s| NIL) (#1=#:G341 NIL) (|sk| (S))
          (|sc| (A)) (|t| NIL) (#2=#:G342 NIL) (|done| (|Boolean|))
          (#3=#:G340 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |x|) (LETT |yr| |y|)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |xr|) (LENGTH |yr|) (QREFELT % 74)) NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |s| NIL) (LETT #1# |yr|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |sk| (QCAR |s|)) (LETT |sc| (QCDR |s|))
                              (LETT |done| NIL)
                              (SEQ (LETT |t| NIL) (LETT #2# |xr|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |t| (CAR #2#)) NIL)
                                         (NULL (NULL |done|)))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL (QCAR |t|) |sk|
                                                 (QREFELT % 30))
                                       (COND
                                        ((SPADCALL (QCDR |t|) |sc|
                                                   (QREFELT % 25))
                                         (LETT |done| 'T))
                                        ('T
                                         (PROGN
                                          (LETT #3# NIL)
                                          (GO #4=#:G339))))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL |done|)
                                 (PROGN (LETT #3# NIL) (GO #4#))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))))
          #4# (EXIT #3#)))) 

(SDEFUN |IDPO;subtractIfCan;2%U;42|
        ((|x| (%)) (|y| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|yr| (|Rep|)) (|s| NIL) (#2=#:G365 NIL) (|sk| (S)) (|sc| (A))
          (|t| (|Record| (|:| |k| S) (|:| |c| A))) (|tc| (A)) (|nxr| (|Rep|))
          (|done| #3=(|Boolean|)) (|first_time| #3#) (|pxr| (|Rep|))
          (|cxr| (|Rep|)) (|tcu| (|Union| A #1#)) (#4=#:G364 NIL)
          (|xr| (|Rep|)))
         (SEQ
          (EXIT
           (SEQ (LETT |yr| |y|)
                (EXIT
                 (COND ((NULL |yr|) (CONS 0 |x|))
                       ('T
                        (SEQ (LETT |xr| (|IDPO;do_copy| |x| %))
                             (SEQ (LETT |s| NIL) (LETT #2# |yr|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |s| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |sk| (QCAR |s|))
                                       (LETT |sc| (QCDR |s|)) (LETT |done| NIL)
                                       (LETT |first_time| 'T) (LETT |nxr| |xr|)
                                       (LETT |cxr| |xr|)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (NULL (OR (NULL |cxr|) |done|)))
                                              (GO G191)))
                                            (SEQ (LETT |t| (|SPADfirst| |cxr|))
                                                 (COND
                                                  ((SPADCALL (QCAR |t|) |sk|
                                                             (QREFELT % 30))
                                                   (SEQ
                                                    (LETT |tcu|
                                                          (SPADCALL (QCDR |t|)
                                                                    |sc|
                                                                    (QREFELT %
                                                                             65)))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |tcu| 1)
                                                       (PROGN
                                                        (LETT #4#
                                                              (CONS 1
                                                                    "failed"))
                                                        (GO #5=#:G363)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |tc|
                                                              (QCDR |tcu|))
                                                        (COND
                                                         ((SPADCALL |tc|
                                                                    (|spadConstant|
                                                                     % 24)
                                                                    (QREFELT %
                                                                             25))
                                                          (COND
                                                           (|first_time|
                                                            (LETT |nxr|
                                                                  (CDR |cxr|)))
                                                           ('T
                                                            (|qset_rest| |pxr|
                                                                         (CDR
                                                                          |cxr|)))))
                                                         ('T
                                                          (PROGN
                                                           (RPLACD |t| |tc|)
                                                           (QCDR |t|))))
                                                        (EXIT
                                                         (LETT |done|
                                                               'T)))))))))
                                                 (LETT |first_time| NIL)
                                                 (LETT |pxr| |cxr|)
                                                 (EXIT
                                                  (LETT |cxr| (CDR |cxr|))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (LETT |xr| |nxr|)
                                       (EXIT
                                        (COND
                                         ((NULL |done|)
                                          (SEQ
                                           (LETT |tcu|
                                                 (SPADCALL
                                                  (|spadConstant| % 24) |sc|
                                                  (QREFELT % 65)))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |tcu| 1)
                                              (PROGN
                                               (LETT #4# (CONS 1 "failed"))
                                               (GO #5#)))
                                             ('T
                                              (LETT |xr|
                                                    (CONS
                                                     (CONS |sk| (QCDR |tcu|))
                                                     |xr|))))))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |xr|))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |IDPO;-;2%;43| ((|x| (%)) (% (%)))
        (SPADCALL (ELT % 57) |x| (QREFELT % 28))) 

(DECLAIM (NOTINLINE |IndexedDirectProductObject;|)) 

(DEFUN |IndexedDirectProductObject;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G370 NIL) (#2=#:G369 NIL)
    (#3=#:G368 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|IndexedDirectProductObject| DV$1 DV$2))
    (LETT % (GETREFV 77))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             #2#
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|Comparable|))
                                             #2#))
                                        (|HasCategory| |#1|
                                                       '(|OrderedAbelianSemiGroup|))
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                        (AND #3#
                                             (|HasCategory| |#2|
                                                            '(|OrderedSet|)))
                                        (OR
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianSemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianSemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1| '(|Hashable|))
                                          #2#
                                          (|HasCategory| |#2| '(|Hashable|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|Comparable|))
                                             #2#)
                                            (AND
                                             (|HasCategory| |#1| '(|Hashable|))
                                             #2#
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                            (AND #3#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedSet|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|Comparable|))
                                             #2#)
                                            (AND #3#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedSet|))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianSemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #2#)
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                                        (OR #1#
                                            (AND #3#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedSet|))))))))
    (|haddProp| |$ConstructorCache| '|IndexedDirectProductObject|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR
      (AND #1# (|HasCategory| |#1| '(|OrderedAbelianSemiGroup|))
           (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #3# (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 1048576))
    (AND
     (OR
      (AND #1# (|HasCategory| |#1| '(|OrderedAbelianSemiGroup|))
           (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #3# (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 2097152))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |IDPO;monomial;AS%;5|) %))
       (QSETREFV % 28 (CONS (|dispatchFunction| |IDPO;map;M2%;6|) %))))
     ('T
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |IDPO;monomial;AS%;7|) %))
       (QSETREFV % 28 (CONS (|dispatchFunction| |IDPO;map;M2%;8|) %)))))
    (COND
     ((|HasCategory| |#1| '(|Comparable|))
      (COND
       ((|testBitVector| |pv$| 5)
        (COND
         ((|testBitVector| |pv$| 3)
          (PROGN
           (QSETREFV % 32
                     (CONS (|dispatchFunction| |IDPO;smaller?;2%B;9|) %))))
         ('T
          (PROGN
           (QSETREFV % 32
                     (CONS (|dispatchFunction| |IDPO;smaller?;2%B;10|)
                           %)))))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (QSETREFV % 35 (CONS (|dispatchFunction| |IDPO;=;2%B;11|) %))
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (QSETREFV % 36 (CONS (|dispatchFunction| |IDPO;reductum;2%;12|) %))
          (QSETREFV % 37
                    (CONS (|dispatchFunction| |IDPO;leadingCoefficient;%A;13|)
                          %))))
        ('T
         (PROGN
          (QSETREFV % 36 (CONS (|dispatchFunction| |IDPO;reductum;2%;14|) %))
          (QSETREFV % 37
                    (CONS (|dispatchFunction| |IDPO;leadingCoefficient;%A;15|)
                          %)))))
       (QSETREFV % 38
                 (CONS (|dispatchFunction| |IDPO;leadingSupport;%S;16|) %))
       (QSETREFV % 39
                 (CONS (|dispatchFunction| |IDPO;leadingMonomial;2%;17|) %))
       NIL
       (QSETREFV % 42 (CONS (|dispatchFunction| |IDPO;construct;L%;19|) %))
       (QSETREFV % 43
                 (CONS (|dispatchFunction| |IDPO;constructOrdered;L%;20|) %))
       (QSETREFV % 44 (CONS (|dispatchFunction| |IDPO;leadingTerm;%R;21|) %))
       (COND
        ((|HasCategory| |#2| '(|Hashable|))
         (COND
          ((|HasCategory| |#1| '(|Hashable|))
           (QSETREFV % 48
                     (CONS (|dispatchFunction| |IDPO;hashUpdate!;Hs%Hs;22|)
                           %))))))
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (QSETREFV % 23
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |IDPO;0;%;23|) % 23)))
          (QSETREFV % 49 (CONS (|dispatchFunction| |IDPO;zero?;%B;24|) %))
          (COND
           ((|domainEqual| |#2| (|NonNegativeInteger|))
            (PROGN
             (QSETREFV % 54 (CONS (|dispatchFunction| |IDPO;+;3%;27|) %))))
           ('T (QSETREFV % 54 (CONS (|dispatchFunction| |IDPO;+;3%;28|) %))))
          (QSETREFV % 56 (CONS (|dispatchFunction| |IDPO;*;Nni2%;29|) %)))))
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV % 58 (CONS (|dispatchFunction| |IDPO;-;2%;30|) %))
          (QSETREFV % 61 (CONS (|dispatchFunction| |IDPO;*;I2%;31|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |IDPO;-;3%;32|) %)))))
       (COND
        ((|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (QSETREFV % 66
                   (CONS (|dispatchFunction| |IDPO;subtractIfCan;2%U;33|) %))))
       (COND
        ((|testBitVector| |pv$| 8)
         (QSETREFV % 67 (CONS (|dispatchFunction| |IDPO;<;2%B;34|) %))))
       (COND
        ((|testBitVector| |pv$| 9)
         (COND
          ((|testBitVector| |pv$| 10)
           (PROGN
            (QSETREFV % 69 (CONS (|dispatchFunction| |IDPO;sup;3%;35|) %))
            (QSETREFV % 73
                      (CONS (|dispatchFunction| |IDPO;inf;3%;36|) %)))))))))
     ('T
      (PROGN
       (QSETREFV % 42 (CONS (|dispatchFunction| |IDPO;construct;L%;37|) %))
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (QSETREFV % 23
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |IDPO;0;%;38|) % 23)))
          (QSETREFV % 54 (CONS (|dispatchFunction| |IDPO;+;3%;40|) %))
          (QSETREFV % 35 (CONS (|dispatchFunction| |IDPO;=;2%B;41|) %))
          (COND
           ((|HasCategory| |#1| '(|CancellationAbelianMonoid|))
            (QSETREFV % 66
                      (CONS (|dispatchFunction| |IDPO;subtractIfCan;2%U;42|)
                            %))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 58
                      (CONS (|dispatchFunction| |IDPO;-;2%;43|) %))))))))))
    %))) 

(DEFUN |IndexedDirectProductObject| (&REST #1=#:G371)
  (SPROG NIL
         (PROG (#2=#:G372)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedDirectProductObject|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedDirectProductObject;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IndexedDirectProductObject|)))))))))) 

(MAKEPROP '|IndexedDirectProductObject| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|OutputForm|) (0 . |coerce|) (5 . |coerce|) (10 . |rarrow|)
              (|List| %) (16 . |bracket|) |IDPO;coerce;%Of;1|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 16)
              |IDPO;listOfTerms;%L;2| (|Boolean|) |IDPO;monomial?;%B;3|
              (|NonNegativeInteger|) |IDPO;numberOfMonomials;%Nni;4| (21 . |0|)
              (25 . |0|) (29 . =) (35 . |monomial|) (|Mapping| 6 6)
              (41 . |map|) (47 . |smaller?|) (53 . =) (59 . |smaller?|)
              (65 . |smaller?|) (71 . ~=) (77 . ~=) (83 . =) (89 . |reductum|)
              (94 . |leadingCoefficient|) (99 . |leadingSupport|)
              (104 . |leadingMonomial|) (|Mapping| 19 16 16) (109 . |sort|)
              (115 . |construct|) (120 . |constructOrdered|)
              (125 . |leadingTerm|) (|HashState|) (130 . |hashUpdate!|)
              (136 . |hashUpdate!|) (142 . |hashUpdate!|) (148 . |zero?|)
              (153 . +) (159 . |zero?|) (|SingleInteger|) (164 . |smaller?|)
              (170 . +) (176 . *) (182 . *) (188 . -) (193 . -) (|Integer|)
              (198 . *) (204 . *) (210 . -) (216 . -) (|Union| % '"failed")
              (222 . |subtractIfCan|) (228 . |subtractIfCan|) (234 . <)
              (240 . <) (246 . |sup|) (252 . >) (258 . |sup|) (264 . |inf|)
              (270 . |inf|) (276 . ~=) (|String|) (|PositiveInteger|))
           '#(~= 282 |zero?| 288 |sup| 293 |subtractIfCan| 299 |smaller?| 305
              |sign| 311 |sample| 316 |reductum| 320 |positive?| 325
              |opposite?| 330 |numberOfMonomials| 336 |negative?| 341
              |monomial?| 346 |monomial| 351 |min| 357 |max| 363 |map| 369
              |listOfTerms| 375 |leadingTerm| 380 |leadingSupport| 385
              |leadingMonomial| 390 |leadingCoefficient| 395 |latex| 400 |inf|
              405 |hashUpdate!| 411 |hash| 417 |constructOrdered| 422
              |construct| 427 |coerce| 432 |abs| 437 >= 442 > 448 = 454 <= 460
              < 466 |0| 472 - 476 + 487 * 493)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 0 11 0 13 1 2 13 4 12 3 4 12 15 6 14 13 7))
            (CONS
             '#(NIL NIL NIL NIL |OrderedAbelianSemiGroup&| |AbelianGroup&| NIL
                |OrderedSet&| |AbelianMonoid&| NIL |SetWithZero&|
                |AbelianSemiGroup&| NIL |SetCategory&| |Hashable&| |BasicType&|
                |PartialOrder&| NIL)
             (CONS
              '#((|IndexedDirectProductCategory| 6 7)
                 (|IndexedProductCategory| 6 7) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 6) (|OrderedAbelianSemiGroup|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|Comparable|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|ComparableRepresentation|)
                 (|SetCategory|) (|Hashable|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 9))
              (|makeByteWordVec2| 76
                                  '(1 7 9 0 10 1 6 9 0 11 2 9 0 0 0 12 1 9 0 13
                                    14 0 0 0 23 0 6 0 24 2 6 19 0 0 25 2 0 0 6
                                    7 26 2 0 0 27 0 28 2 6 19 0 0 29 2 7 19 0 0
                                    30 2 7 19 0 0 31 2 0 19 0 0 32 2 7 19 0 0
                                    33 2 6 19 0 0 34 2 0 19 0 0 35 1 0 0 0 36 1
                                    0 6 0 37 1 0 7 0 38 1 0 0 0 39 2 8 0 40 0
                                    41 1 0 0 17 42 1 0 0 17 43 1 0 16 0 44 2 7
                                    45 45 0 46 2 6 45 45 0 47 2 0 45 45 0 48 1
                                    0 19 0 49 2 6 0 0 0 50 1 6 19 0 51 2 52 19
                                    0 0 53 2 0 0 0 0 54 2 6 0 21 0 55 2 0 0 21
                                    0 56 1 6 0 0 57 1 0 0 0 58 2 6 0 59 0 60 2
                                    0 0 59 0 61 2 6 0 0 0 62 2 0 0 0 0 63 2 6
                                    64 0 0 65 2 0 64 0 0 66 2 0 19 0 0 67 2 7
                                    19 0 0 68 2 0 0 0 0 69 2 7 19 0 0 70 2 6 0
                                    0 0 71 2 6 0 0 0 72 2 0 0 0 0 73 2 21 19 0
                                    0 74 2 16 19 0 0 1 1 20 19 0 49 2 11 0 0 0
                                    69 2 19 64 0 0 66 2 18 19 0 0 32 1 21 59 0
                                    1 0 20 0 1 1 5 0 0 36 1 21 19 0 1 2 20 19 0
                                    0 1 1 0 21 0 22 1 21 19 0 1 1 0 19 0 20 2 0
                                    0 6 7 26 2 13 0 0 0 1 2 13 0 0 0 1 2 0 0 27
                                    0 28 1 0 17 0 18 1 5 16 0 44 1 5 7 0 38 1 5
                                    0 0 39 1 5 6 0 37 1 17 75 0 1 2 11 0 0 0 73
                                    2 6 45 45 0 48 1 6 52 0 1 1 5 0 17 43 1 0 0
                                    17 42 1 17 9 0 15 1 22 0 0 1 2 13 19 0 0 1
                                    2 13 19 0 0 1 2 16 19 0 0 35 2 13 19 0 0 1
                                    2 13 19 0 0 67 0 20 0 23 2 1 0 0 0 63 1 1 0
                                    0 58 2 20 0 0 0 54 2 20 0 76 0 1 2 20 0 21
                                    0 56 2 1 0 59 0 61)))))
           '|lookupComplete|)) 
