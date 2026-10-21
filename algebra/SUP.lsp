
(MAKEPROP '|SUP;makeSUP;2%;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;makeSUP;2%;1| ((|p| (%)) (% (|SparseUnivariatePolynomial| R))) |p|) 

(MAKEPROP '|SUP;unmakeSUP;2%;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(SDEFUN |SUP;unmakeSUP;2%;2| ((|sp| (|SparseUnivariatePolynomial| R)) (% (%)))
        |sp|) 

(SDEFUN |SUP;^;%Pi%;3| ((|p| (%)) (|np| (|PositiveInteger|)) (% (%)))
        (SPADCALL |p| |np| (QREFELT % 12))) 

(SDEFUN |SUP;^;%Nni%;4| ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|cc| (R)) (|y| (%)) (#1=#:G55 NIL) (#2=#:G56 NIL) (|t| NIL)
          (#3=#:G57 NIL)
          (|rec|
           (|Record| (|:| |quotient| #4=(|NonNegativeInteger|))
                     (|:| |remainder| #5=(|NonNegativeInteger|))))
          (|qn| #4#) (|rn| #5#))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|spadConstant| % 15))
                 ((NULL |p|) (|spadConstant| % 16)) ((EQL |n| 1) |p|)
                 (#6='T
                  (COND
                   ((NULL (CDR |p|))
                    (COND
                     ((SPADCALL
                       (LETT |cc|
                             (SPADCALL (QCDR (|SPADfirst| |p|)) |n|
                                       (QREFELT % 17)))
                       (QREFELT % 19))
                      (|spadConstant| % 16))
                     (#6#
                      (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
                   ((< (SPADCALL (QREFELT % 20)) 3)
                    (SPADCALL |p| |n| (QREFELT % 22)))
                   (#6#
                    (SEQ (LETT |y| (|spadConstant| % 15))
                         (LETT |rec|
                               (|divide_INT| |n| (SPADCALL (QREFELT % 20))))
                         (LETT |qn| (QCAR |rec|)) (LETT |rn| (QCDR |rec|))
                         (SEQ G190 NIL
                              (SEQ
                               (COND
                                ((EQL |rn| 1)
                                 (LETT |y| (SPADCALL |y| |p| (QREFELT % 23)))))
                               (COND
                                ((> |rn| 1)
                                 (LETT |y|
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (LIST (|SPADfirst| |p|))
                                                  (CDR |p|) |rn|
                                                  (QREFELT % 24))
                                                 (QREFELT % 23)))))
                               (EXIT
                                (COND
                                 ((ZEROP |qn|)
                                  (PROGN (LETT #1# |y|) (GO #7=#:G54)))
                                 ('T
                                  (SEQ
                                   (LETT |p|
                                         (PROGN
                                          (LETT #2# NIL)
                                          (SEQ (LETT |t| NIL) (LETT #3# |p|)
                                               G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |t| (CAR #3#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (* (QCAR |t|)
                                                            (SPADCALL
                                                             (QREFELT % 20)))
                                                         (SPADCALL (QCDR |t|)
                                                                   (QREFELT %
                                                                            25)))
                                                        #2#))))
                                               (LETT #3# (CDR #3#)) (GO G190)
                                               G191 (EXIT (NREVERSE #2#)))))
                                   (LETT |rec|
                                         (|divide_INT| |qn|
                                                       (SPADCALL
                                                        (QREFELT % 20))))
                                   (LETT |qn| (QCAR |rec|))
                                   (EXIT (LETT |rn| (QCDR |rec|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT |y|)))))))
          #7# (EXIT #1#)))) 

(MAKEPROP '|SUP;zero?;%B;5| '|SPADreplace| 'NULL) 

(SDEFUN |SUP;zero?;%B;5| ((|p| (%)) (% (|Boolean|))) (NULL |p|)) 

(SDEFUN |SUP;one?;%B;6| ((|p| (%)) (% (|Boolean|)))
        (COND
         ((OR (OR (NULL |p|) (NULL (NULL (CDR |p|))))
              (NULL (ZEROP (QCAR (|SPADfirst| |p|)))))
          NIL)
         ('T
          (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| % 27)
                    (QREFELT % 28))))) 

(SDEFUN |SUP;ground?;%B;7| ((|p| (%)) (% (|Boolean|)))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|)))) ('T NIL))) 

(SDEFUN |SUP;multiplyExponents;%Nni%;8|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G72 NIL) (|u| NIL) (#2=#:G73 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |u| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (CONS (* (QCAR |u|) |n|) (QCDR |u|))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SUP;divideExponents;%NniU;9|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (|Union| % #1="failed")))
        (SPROG
         ((|m| (|Union| (|Integer|) "failed")) (|u| (|Union| % #1#))
          (#2=#:G84 NIL))
         (SEQ
          (COND ((NULL |p|) (CONS 0 |p|))
                (#3='T
                 (SEQ (LETT |m| (|exquo_INT| (QCAR (|SPADfirst| |p|)) |n|))
                      (EXIT
                       (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                             (#3#
                              (SEQ
                               (LETT |u|
                                     (SPADCALL (CDR |p|) |n| (QREFELT % 33)))
                               (EXIT
                                (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                      (#3#
                                       (CONS 0
                                             (CONS
                                              (CONS
                                               (PROG1 (LETT #2# (QCDR |m|))
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QCDR (|SPADfirst| |p|)))
                                              (QCDR |u|)))))))))))))))) 

(SDEFUN |SUP;karatsubaDivide;%NniR;10|
        ((|p| (%)) (|n| (|NonNegativeInteger|))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((|t| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))
          (#1=#:G103 NIL) (|lowp| (|Rep|)) (#2=#:G95 NIL) (|highp| (|Rep|)))
         (SEQ
          (COND ((ZEROP |n|) (CONS |p| (|spadConstant| % 16)))
                ('T
                 (SEQ (LETT |lowp| |p|) (LETT |highp| NIL)
                      (SEQ
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (COND
                               ((NULL |lowp|)
                                (PROGN (LETT #1# 1) (GO #3=#:G98))))
                              (LETT |t| (|SPADfirst| |lowp|))
                              (COND
                               ((< (QCAR |t|) |n|)
                                (PROGN (LETT #1# 1) (GO #3#))))
                              (LETT |lowp| (CDR |lowp|))
                              (EXIT
                               (LETT |highp|
                                     (CONS
                                      (CONS
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL (QCAR |t|) |n|
                                                           (QREFELT % 35)))
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|NonNegativeInteger|)
                                                         (|Union|
                                                          (|NonNegativeInteger|)
                                                          "failed")
                                                         #2#))
                                       (QCDR |t|))
                                      |highp|))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #3# (EXIT #1#))
                      (EXIT (CONS (REVERSE |highp|) |lowp|)))))))) 

(SDEFUN |SUP;shiftRight;%Nni%;11|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G111 NIL) (|t| NIL) (#2=#:G112 NIL) (#3=#:G107 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (CONS
                                (PROG2
                                    (LETT #3#
                                          (SPADCALL (QCAR |t|) |n|
                                                    (QREFELT % 35)))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0)
                                                  (|NonNegativeInteger|)
                                                  (|Union|
                                                   (|NonNegativeInteger|)
                                                   "failed")
                                                  #3#))
                                (QCDR |t|))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SUP;shiftLeft;%Nni%;12|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G117 NIL) (|t| NIL) (#2=#:G118 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (CONS (+ (QCAR |t|) |n|) (QCDR |t|))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(MAKEPROP '|SUP;univariate;2%;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;univariate;2%;13| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        |p|) 

(MAKEPROP '|SUP;multivariate;%Saos%;14| '|SPADreplace|
          '(XLAM (|sup| |v|) |sup|)) 

(SDEFUN |SUP;multivariate;%Saos%;14|
        ((|sup| (|SparseUnivariatePolynomial| R))
         (|v| (|SingletonAsOrderedSet|)) (% (%)))
        |sup|) 

(SDEFUN |SUP;univariate;%SaosSup;15|
        ((|p| (%)) (|v| (|SingletonAsOrderedSet|))
         (% (|SparseUnivariatePolynomial| %)))
        (COND ((SPADCALL |p| (QREFELT % 26)) (|spadConstant| % 44))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT % 45)) (QREFELT % 46))
                 (SPADCALL |p| (QREFELT % 47)) (QREFELT % 48))
                (SPADCALL (SPADCALL |p| (QREFELT % 49)) |v| (QREFELT % 51))
                (QREFELT % 52))))) 

(SDEFUN |SUP;multivariate;SupSaos%;16|
        ((|supp| (|SparseUnivariatePolynomial| %))
         (|v| (|SingletonAsOrderedSet|)) (% (%)))
        (SPROG ((|lc| (%)))
               (SEQ
                (COND ((SPADCALL |supp| (QREFELT % 53)) (|spadConstant| % 16))
                      (#1='T
                       (SEQ (LETT |lc| (SPADCALL |supp| (QREFELT % 54)))
                            (EXIT
                             (COND
                              ((> (SPADCALL |lc| (QREFELT % 47)) 0)
                               (|error| "bad form polynomial"))
                              (#1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |lc| (QREFELT % 45))
                                          (SPADCALL |supp| (QREFELT % 55))
                                          (QREFELT % 56))
                                (SPADCALL (SPADCALL |supp| (QREFELT % 57)) |v|
                                          (QREFELT % 58))
                                (QREFELT % 59))))))))))) 

(SDEFUN |SUP;squareFreePolynomial;SupF;17|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 62))) 

(SDEFUN |SUP;factorPolynomial;SupF;18|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 68))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;19|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 68))) 

(SDEFUN |SUP;factor;%F;20| ((|p| (%)) (% (|Factored| %)))
        (SPADCALL |p| (QREFELT % 73))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;21|
        ((|lpp| #1=(|List| #2=(|SparseUnivariatePolynomial| %))) (|pp| #2#)
         (% (|Union| #1# "failed")))
        (SPADCALL |lpp| |pp| (QREFELT % 79))) 

(SDEFUN |SUP;init_one| ((% (|Void|)))
        (SEQ
         (COND ((QREFELT % 85) "done")
               ('T
                (SEQ (QREFELT % 83)
                     (COND
                      ((|HasCategory| (QREFELT % 6) '(|Ring|))
                       (SETELT % 83
                               (SPADCALL (|spadConstant| % 27)
                                         (QREFELT % 86)))))
                     (QREFELT % 84)
                     (COND
                      ((|HasCategory| (QREFELT % 6) '(|MagmaWithUnit|))
                       (SETELT % 84 (|spadConstant| % 27))))
                     (EXIT (SETELT % 85 'T))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))
         (|v| #1=(|OutputForm|)) (% (|OutputForm|)))
        (SPROG ((|mon| #1#))
               (SEQ (COND ((NULL (QREFELT % 85)) (|SUP;init_one| %)))
                    (EXIT
                     (COND
                      ((EQL (QCAR |t1|) 0)
                       (SPADCALL (QCDR |t1|) (QREFELT % 88)))
                      (#2='T
                       (SEQ
                        (COND ((EQL (QCAR |t1|) 1) (LETT |mon| |v|))
                              (#2#
                               (LETT |mon|
                                     (SPADCALL |v|
                                               (SPADCALL (QCAR |t1|)
                                                         (QREFELT % 89))
                                               (QREFELT % 90)))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t1|) (|spadConstant| % 34)
                                     (QREFELT % 28))
                           (SPADCALL (QREFELT % 91)))
                          ((SPADCALL (QCDR |t1|) (QREFELT % 84) (QREFELT % 28))
                           |mon|)
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |t1|) (QREFELT % 83)
                                        (QREFELT % 28))
                              (COND
                               ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT % 88))
                                          (SPADCALL -1 (QREFELT % 93))
                                          (QREFELT % 94))
                                (EXIT (SPADCALL |mon| (QREFELT % 95)))))))
                            (EXIT
                             (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT % 88))
                                       |mon| (QREFELT % 96)))))))))))))) 

(SDEFUN |SUP;outputForm;%2Of;24|
        ((|p| (%)) (|v| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G164 NIL) (|t| NIL) (#2=#:G165 NIL)
          (|l| (|List| (|OutputForm|))))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #1# (CONS (|SUP;toutput| |t| |v| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT % 93)))
                 ('T (SPADCALL (ELT % 97) |l| (QREFELT % 100)))))))) 

(SDEFUN |SUP;coerce;%Of;25| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL "?" (QREFELT % 103)) (QREFELT % 101))) 

(SDEFUN |SUP;elt;%2R;26| ((|p| (%)) (|val| (R)) (% (R)))
        (SPROG
         ((|tm| NIL) (#1=#:G176 NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G169 NIL) (|co| (R)) (#3=#:G172 NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 34))
                (#4='T
                 (SEQ (LETT |co| (QCDR (|SPADfirst| |p|)))
                      (LETT |n| (QCAR (|SPADfirst| |p|)))
                      (SEQ (LETT |tm| NIL) (LETT #1# (CDR |p|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |co|
                                   (SPADCALL
                                    (SPADCALL |co|
                                              (SPADCALL |val|
                                                        (PROG1
                                                            (LETT #2#
                                                                  (- |n|
                                                                     (LETT |n|
                                                                           (QCAR
                                                                            |tm|))))
                                                          (|check_subtype2|
                                                           (> #2# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #2#))
                                                        (QREFELT % 105))
                                              (QREFELT % 106))
                                    (QCDR |tm|) (QREFELT % 107)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |n| 0) |co|)
                             (#4#
                              (SPADCALL |co|
                                        (SPADCALL |val|
                                                  (PROG1 (LETT #3# |n|)
                                                    (|check_subtype2| (> #3# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #3#))
                                                  (QREFELT % 105))
                                        (QREFELT % 106))))))))))) 

(SDEFUN |SUP;elt;3%;27| ((|p| (%)) (|val| (%)) (% (%)))
        (SPROG
         ((|tm| NIL) (#1=#:G186 NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G179 NIL) (|coef| (%)) (#3=#:G182 NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 16))
                (#4='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT % 46)))
                  (LETT |n| (QCAR (|SPADfirst| |p|)))
                  (SEQ (LETT |tm| NIL) (LETT #1# (CDR |p|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |coef|
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|))))
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT % 14))
                                          (QREFELT % 23))
                                (SPADCALL (QCDR |tm|) (QREFELT % 46))
                                (QREFELT % 59)))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |coef|)
                         (#4#
                          (SPADCALL |coef|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #3# |n|)
                                                (|check_subtype2| (> #3# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #3#))
                                              (QREFELT % 14))
                                    (QREFELT % 23))))))))))) 

(SDEFUN |SUP;monicDivide;2%R;28|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G203 NIL)
          (|rout| (|Rep|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT % 45)) (|spadConstant| % 27)
                           (QREFELT % 110))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| % 15) (QREFELT % 111))
                 (CONS |p1| (|spadConstant| % 16)))
                (#2='T
                 (COND
                  ((NULL |p1|)
                   (CONS (|spadConstant| % 16) (|spadConstant| % 16)))
                  ((< (SPADCALL |p1| (QREFELT % 47))
                      (LETT |n| (SPADCALL |p2| (QREFELT % 47))))
                   (CONS (|spadConstant| % 16) |p1|))
                  (#2#
                   (SEQ (LETT |rout| NIL) (LETT |p2| (CDR |p2|))
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND ((NULL (NULL (NULL |p1|))) (GO G191)))
                               (SEQ
                                (LETT |u|
                                      (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                                (QREFELT % 35)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |u| 1)
                                   (PROGN (LETT #1# 1) (GO #3=#:G196)))
                                  ('T
                                   (SEQ
                                    (LETT |rout|
                                          (CONS
                                           (CONS (QCDR |u|)
                                                 (QCDR (|SPADfirst| |p1|)))
                                           |rout|))
                                    (EXIT
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|)
                                                     (QCAR
                                                      (|SPADfirst| |rout|))
                                                     (QCDR
                                                      (|SPADfirst| |rout|))
                                                     |p2|
                                                     (QREFELT % 112)))))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #3# (EXIT #1#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;%R;29| ((|p| (%)) (% (R)))
        (SPADCALL |p| (QREFELT % 115))) 

(SDEFUN |SUP;subResultantGcd;3%;30| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 117))) 

(SDEFUN |SUP;resultant;2%R;31| ((|p1| (%)) (|p2| (%)) (% (R)))
        (SPADCALL |p1| |p2| (QREFELT % 119))) 

(SDEFUN |SUP;content;%R;32| ((|p| (%)) (% (R)))
        (SPROG
         ((|tm| NIL) (#1=#:G213 NIL) (#2=#:G210 (R)) (#3=#:G208 (R))
          (#4=#:G209 NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 34))
                (#5='T
                 (PROGN
                  (LETT #4# NIL)
                  (SEQ (LETT |tm| NIL) (LETT #1# |p|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2# (QCDR |tm|))
                          (COND
                           (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 121))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#4# #3#) (#5# (|spadConstant| % 34))))))))) 

(SDEFUN |SUP;primitivePart;2%;33| ((|p| (%)) (% (%)))
        (SPROG ((|ct| (R)) (#1=#:G216 NIL))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ (LETT |ct| (SPADCALL |p| (QREFELT % 122)))
                            (EXIT
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |p| |ct| (QREFELT % 123)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) %
                                                (|Union| % "failed") #1#))
                              (QREFELT % 124))))))))) 

(SDEFUN |SUP;gcd;3%;34| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 126))) 

(SDEFUN |SUP;divide;2%R;35|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((|ct| (R)) (|n| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G235 NIL)
          (|rout| (%)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT % 26)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| % 15) (QREFELT % 111))
                 (CONS |p1| (|spadConstant| % 16)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT % 128)))
                  (LETT |n| (QCAR (|SPADfirst| |p2|))) (LETT |p2| (CDR |p2|))
                  (LETT |rout| NIL)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| % 16)
                                      (QREFELT % 129)))
                           (GO G191)))
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                          (QREFELT % 35)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #1# 1) (GO #2=#:G231)))
                            ('T
                             (SEQ
                              (LETT |rout|
                                    (CONS
                                     (CONS (QCDR |u|)
                                           (SPADCALL |ct|
                                                     (QCDR (|SPADfirst| |p1|))
                                                     (QREFELT % 106)))
                                     |rout|))
                              (EXIT
                               (LETT |p1|
                                     (SPADCALL (CDR |p1|)
                                               (QCAR (|SPADfirst| |rout|))
                                               (QCDR (|SPADfirst| |rout|)) |p2|
                                               (QREFELT % 112)))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #2# (EXIT #1#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;%R%;36| ((|p| (%)) (|co| (R)) (% (%)))
        (SPADCALL (SPADCALL |co| (QREFELT % 128)) |p| (QREFELT % 131))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G290 NIL) (#2=#:G289 NIL)
    (#3=#:G288 NIL) (#4=#:G287 NIL) (#5=#:G286 NIL) (#6=#:G285 NIL)
    (#7=#:G284 NIL) (#8=#:G282 NIL) (#9=#:G283 NIL) (#10=#:G281 NIL)
    (#11=#:G280 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1))
    (LETT % (GETREFV 179))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
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
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #2#
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #3#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|Canonical|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #4#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #5#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #7#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #8#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #8# #2#) (AND #8# #3#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #9#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #10#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #10# #11#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #11#)))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 1125899906842624))
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #10#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #11#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 1152921504606846976))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7
              (|List|
               (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
      (PROGN
       (QSETREFV % 14 (CONS (|dispatchFunction| |SUP;^;%Pi%;3|) %))
       (QSETREFV % 12 (CONS (|dispatchFunction| |SUP;^;%Nni%;4|) %)))))
    (COND
     ((|testBitVector| |pv$| 14)
      (QSETREFV % 29 (CONS (|dispatchFunction| |SUP;one?;%B;6|) %))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (COND
       ((|testBitVector| |pv$| 11)
        (PROGN
         (QSETREFV % 64
                   (CONS
                    (|dispatchFunction| |SUP;squareFreePolynomial;SupF;17|) %))
         (QSETREFV % 69
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;18|)
                         %))
         (QSETREFV % 70
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;19|)
                    %))
         (QSETREFV % 75 (CONS (|dispatchFunction| |SUP;factor;%F;20|) %))
         (QSETREFV % 82
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;21|)
                    %)))))))
    (QSETREFV % 83 (|spadConstant| % 34))
    (QSETREFV % 84 (|spadConstant| % 34))
    (QSETREFV % 85 NIL)
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 113 (CONS (|dispatchFunction| |SUP;monicDivide;2%R;28|) %))))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (QSETREFV % 116 (CONS (|dispatchFunction| |SUP;discriminant;%R;29|) %))
       (QSETREFV % 118
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3%;30|) %))
       (QSETREFV % 120 (CONS (|dispatchFunction| |SUP;resultant;2%R;31|) %)))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV % 122 (CONS (|dispatchFunction| |SUP;content;%R;32|) %))
       (QSETREFV % 125 (CONS (|dispatchFunction| |SUP;primitivePart;2%;33|) %))
       (QSETREFV % 127 (CONS (|dispatchFunction| |SUP;gcd;3%;34|) %)))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV % 130 (CONS (|dispatchFunction| |SUP;divide;2%R;35|) %))
       (QSETREFV % 132 (CONS (|dispatchFunction| |SUP;/;%R%;36|) %)))))
    %))) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G291)
  (SPROG NIL
         (PROG (#2=#:G292)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseUnivariatePolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariatePolynomial|)))))))))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2%;1|
              |SUP;unmakeSUP;2%;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |1|) (16 . |0|) (20 . ^)
              (|Boolean|) (26 . |zero?|) (31 . |characteristic|)
              (|RepeatedSquaring| $$) (35 . |expt|) (41 . *)
              (47 . |binomThmExpt|) (54 . |primeFrobenius|) |SUP;zero?;%B;5|
              (59 . |1|) (63 . =) (69 . |one?|) |SUP;ground?;%B;7|
              |SUP;multiplyExponents;%Nni%;8| (|Union| % '#1="failed")
              |SUP;divideExponents;%NniU;9| (74 . |0|) (78 . |subtractIfCan|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |SUP;karatsubaDivide;%NniR;10| |SUP;shiftRight;%Nni%;11|
              |SUP;shiftLeft;%Nni%;12| |SUP;univariate;2%;13|
              (|SingletonAsOrderedSet|) |SUP;multivariate;%Saos%;14|
              (|SparseUnivariatePolynomial| $$) (84 . |0|)
              (88 . |leadingCoefficient|) (93 . |coerce|) (98 . |degree|)
              (103 . |monomial|) (109 . |reductum|)
              (|SparseUnivariatePolynomial| %) |SUP;univariate;%SaosSup;15|
              (114 . +) (120 . |zero?|) (125 . |leadingCoefficient|)
              (130 . |degree|) (135 . |monomial|) (141 . |reductum|)
              |SUP;multivariate;SupSaos%;16| (146 . +) (|Factored| 43)
              (|UnivariatePolynomialSquareFree| $$ 43) (152 . |squareFree|)
              (|Factored| 50) (157 . |squareFreePolynomial|) (|Factored| 66)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (162 . |generalTwoFactor|) (167 . |factorPolynomial|)
              (172 . |factorSquareFreePolynomial|) (|Factored| $$)
              (|UnivariateFiniteFieldFactorize| 6 $$) (177 . |factor|)
              (|Factored| %) (182 . |factor|) (|Union| 77 '"failed")
              (|List| 43) (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 43)
              (187 . |solveLinearPolynomialEquation|) (|Union| 81 '#2="failed")
              (|List| 50) (193 . |solveLinearPolynomialEquation|) '|mm_one|
              '|m_one| '|one_inited| (199 . -) (|OutputForm|) (204 . |coerce|)
              (209 . |coerce|) (214 . ^) (220 . |empty|) (|Integer|)
              (224 . |coerce|) (229 . =) (235 . -) (240 . *) (246 . +)
              (|Mapping| 87 87 87) (|List| 87) (252 . |reduce|)
              |SUP;outputForm;%2Of;24| (|String|) (258 . |message|)
              |SUP;coerce;%Of;25| (263 . ^) (269 . *) (275 . +)
              |SUP;elt;%2R;26| |SUP;elt;3%;27| (281 . ~=) (287 . =)
              (293 . |fmecg|) (301 . |monicDivide|)
              (|PseudoRemainderSequence| 6 $$) (307 . |discriminant|)
              (312 . |discriminant|) (317 . |subResultantGcd|)
              (323 . |subResultantGcd|) (329 . |resultant|) (335 . |resultant|)
              (341 . |gcd|) (347 . |content|) (352 . |exquo|)
              (358 . |unitCanonical|) (363 . |primitivePart|)
              (368 . |gcdPolynomial|) (374 . |gcd|) (380 . |inv|) (385 . ~=)
              (391 . |divide|) (397 . *) (403 . /)
              (|Record| (|:| |k| 11) (|:| |c| 6)) (|List| 133) (|Mapping| 6 6)
              (|List| 11) (|List| %) (|List| 6) (|Union| 6 '#3="failed")
              (|Mapping| 11 11) (|List| 41) (|Union| 41 '"failed")
              (|Union| 137 '#4="failed") (|Vector| 6) (|Union| 153 '#2#)
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 92)
              (|HashState|) (|SingleInteger|)
              (|Record| (|:| |mat| 154) (|:| |vec| (|Vector| 92))) (|Vector| %)
              (|Matrix| 92) (|List| 156) (|Symbol|)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 92 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 92) (|Mapping| 6 11) (|Fraction| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 164 '"failed")
              (|Record| (|:| |coef| 137) (|:| |generator| %))
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 162 '#1#)
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 160 '#3#) (|Union| 92 '#3#) (|Matrix| 6)
              (|Record| (|:| |mat| 173) (|:| |vec| 144))
              (|Record| (|:| |var| 41) (|:| |exponent| 11)) (|Union| 175 '#4#)
              (|List| 178) (|Equation| %))
           '#(~= 409 |zero?| 415 |vectorise| 420 |variables| 426 |unvectorise|
              437 |unmakeSUP| 442 |univariate| 447 |unitNormal| 458
              |unitCanonical| 463 |unit?| 468 |totalDegreeSorted| 473
              |totalDegree| 479 |support| 490 |subtractIfCan| 495
              |subResultantGcd| 501 |squareFreePolynomial| 507 |squareFreePart|
              512 |squareFree| 517 |solveLinearPolynomialEquation| 522
              |smaller?| 528 |sizeLess?| 534 |shiftRight| 540 |shiftLeft| 546
              |separate| 552 |sample| 558 |rightRecip| 562 |rightPower| 567
              |retractIfCan| 579 |retract| 599 |resultant| 619 |rem| 632
              |reductum| 638 |reducedSystem| 643 |recip| 665 |quo| 670
              |pseudoRemainder| 676 |pseudoQuotient| 682 |pseudoDivide| 688
              |principalIdeal| 694 |primitivePart| 699 |primitiveMonomials| 710
              |prime?| 715 |pomopo!| 720 |plenaryPower| 728 |patternMatch| 734
              |outputForm| 748 |order| 754 |opposite?| 760 |one?| 766
              |numberOfMonomials| 771 |nextItem| 776 |multivariate| 781
              |multiplyExponents| 793 |multiEuclidean| 799 |monomials| 805
              |monomial?| 810 |monomial| 815 |monicDivide| 835 |minimumDegree|
              848 |mapExponents| 865 |map| 871 |makeSUP| 877 |mainVariable| 882
              |listOfTerms| 887 |linearExtend| 892 |leftRecip| 898 |leftPower|
              903 |leadingTerm| 915 |leadingSupport| 920 |leadingMonomial| 925
              |leadingCoefficient| 930 |lcmCoef| 935 |lcm| 941 |latex| 952
              |karatsubaDivide| 957 |isTimes| 963 |isPlus| 968 |isExpt| 973
              |integrate| 978 |init| 983 |hashUpdate!| 987 |hash| 993 |ground?|
              998 |ground| 1003 |gcdPolynomial| 1008 |gcd| 1014 |fmecg| 1025
              |factorSquareFreePolynomial| 1033 |factorPolynomial| 1038
              |factor| 1043 |extendedEuclidean| 1048 |exquo| 1061
              |expressIdealMember| 1073 |eval| 1079 |euclideanSize| 1133 |elt|
              1138 |divideExponents| 1168 |divide| 1174 |discriminant| 1180
              |differentiate| 1191 |degree| 1274 |convert| 1291 |content| 1306
              |constructOrdered| 1317 |construct| 1322 |conditionP| 1327
              |composite| 1332 |commutator| 1344 |coerce| 1350 |coefficients|
              1380 |coefficient| 1385 |charthRoot| 1405 |characteristic| 1410
              |binomThmExpt| 1414 |associator| 1421 |associates?| 1428
              |antiCommutator| 1434 |annihilate?| 1440 ^ 1446 D 1458 = 1534 |1|
              1540 |0| 1544 / 1548 - 1554 + 1565 * 1571)
           'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 0 15 11 0 15 11 0 19 0 23 4 18 22 4 26 20
                                  24 4 22 1 27 27 24 14 22 1 0 24 4 5 1 0 0 43
                                  4 4 1 0 0 0 27 43 1 1 0 0 0 0 0 16 14 14 50
                                  14 49 9 0 0 25 46 35 33 10 0 0 0 24 14 14 13
                                  7 6 0 0 28 21 17 24 15 14 14 12 39 37 8 7 6 4
                                  3 2 0 0 0 0 0 0 0 0))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| NIL |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DifferentialExtension&| NIL NIL |DifferentialRing&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |PartialDifferentialRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL NIL
                |NonAssociativeSemiRng&| NIL |SetWithZero&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&| NIL
                |RetractableTo&| |Evalable&| |Hashable&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL NIL NIL
                NIL NIL NIL |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL NIL |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 41) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 11 41)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 11) (|IntegralDomain|)
                 (|DifferentialExtension| 6) (|LeftOreRing|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 156) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 41) (|Algebra| 6) (|Algebra| 160)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 160)
                 (|FreeModuleCategory| 6 11) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 160)
                 (|IndexedDirectProductCategory| 6 11) (|SemiRng|)
                 (|LinearlyExplicitOver| 92) (|LinearlyExplicitOver| 6)
                 (|NonAssociativeRing|) (|BiModule| 160 160) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 11)
                 (|NonAssociativeRng|) (|RightModule| 92) (|RightModule| 160)
                 (|LeftModule| 160) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|StepThrough|)
                 (|SetWithZero|) (|PatternMatchable| 92)
                 (|PatternMatchable| (|Float|)) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|CommutativeStar|) (|RetractableTo| 41) (|Evalable| $$)
                 (|Hashable|) (|RetractableTo| 92) (|RetractableTo| 160)
                 (|SetCategory|) (|RetractableTo| 6) (|Canonical|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|additiveValuation|) (|CoercibleFrom| 41)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 147)
                 (|ConvertibleTo| 149) (|ConvertibleTo| 148)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 92)
                 (|CoercibleFrom| 160) (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 87) (|BasicType|)
                 (|CoercibleFrom| 6) (|InnerEvalable| 41 6)
                 (|InnerEvalable| 41 $$) (|VariablesCommuteWithCoefficients|)
                 (|Eltable| 6 6) (|Eltable| $$ $$))
              (|makeByteWordVec2| 178
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 2 6 0 0 11 17 1 6 18 0 19 0 6 11 20 2 21
                                    2 2 13 22 2 0 0 0 0 23 3 0 0 0 0 11 24 1 6
                                    0 0 25 0 6 0 27 2 6 18 0 0 28 1 0 18 0 29 0
                                    6 0 34 2 11 32 0 0 35 0 43 0 44 1 0 6 0 45
                                    1 0 0 6 46 1 0 11 0 47 2 43 0 2 11 48 1 0 0
                                    0 49 2 43 0 0 0 52 1 43 18 0 53 1 43 2 0 54
                                    1 43 11 0 55 2 0 0 6 11 56 1 43 0 0 57 2 0
                                    0 0 0 59 1 61 60 43 62 1 0 63 50 64 1 67 65
                                    66 68 1 0 63 50 69 1 0 63 50 70 1 72 71 2
                                    73 1 0 74 0 75 2 78 76 77 43 79 2 0 80 81
                                    50 82 1 6 0 0 86 1 6 87 0 88 1 11 87 0 89 2
                                    87 0 0 0 90 0 87 0 91 1 92 87 0 93 2 87 18
                                    0 0 94 1 87 0 0 95 2 87 0 0 0 96 2 87 0 0 0
                                    97 2 99 87 98 0 100 1 87 0 102 103 2 6 0 0
                                    13 105 2 6 0 0 0 106 2 6 0 0 0 107 2 6 18 0
                                    0 110 2 0 18 0 0 111 4 0 0 0 11 6 0 112 2 0
                                    36 0 0 113 1 114 6 2 115 1 0 6 0 116 2 114
                                    2 2 2 117 2 0 0 0 0 118 2 114 6 2 2 119 2 0
                                    6 0 0 120 2 6 0 0 0 121 1 0 6 0 122 2 0 32
                                    0 6 123 1 0 0 0 124 1 0 0 0 125 2 6 50 50
                                    50 126 2 0 0 0 0 127 1 6 0 0 128 2 0 18 0 0
                                    129 2 0 36 0 0 130 2 0 0 6 0 131 2 0 0 0 6
                                    132 2 0 18 0 0 129 1 59 18 0 26 2 0 144 0
                                    11 1 2 0 141 0 0 1 1 0 141 0 1 1 0 0 144 1
                                    1 0 0 8 10 2 0 50 0 41 51 1 0 8 0 40 1 53
                                    159 0 1 1 53 0 0 124 1 53 18 0 1 2 0 11 0
                                    141 1 1 0 11 0 1 2 0 11 0 141 1 1 0 136 0 1
                                    2 60 32 0 0 1 2 21 0 0 0 118 1 11 63 50 64
                                    1 18 0 0 1 1 18 74 0 1 2 11 80 81 50 82 2
                                    31 18 0 0 1 2 15 18 0 0 1 2 4 0 0 11 38 2 0
                                    0 0 11 39 2 18 167 0 0 1 0 59 0 1 1 57 32 0
                                    1 2 0 0 0 13 1 2 57 0 0 11 1 1 0 139 0 1 1
                                    6 171 0 1 1 7 172 0 1 1 14 142 0 1 1 0 6 0
                                    1 1 6 160 0 1 1 7 92 0 1 1 14 41 0 1 3 5 0
                                    0 0 41 1 2 5 6 0 0 120 2 15 0 0 0 1 1 29 0
                                    0 49 2 42 152 146 153 1 1 42 154 146 1 1 4
                                    173 146 1 2 4 174 146 153 1 1 57 32 0 1 2
                                    15 0 0 0 1 2 4 0 0 0 1 2 21 0 0 0 1 2 21
                                    170 0 0 1 1 15 166 137 1 1 18 0 0 125 2 18
                                    0 0 41 1 1 14 137 0 1 1 11 18 0 1 4 0 0 0 6
                                    11 0 1 2 54 0 0 13 1 3 32 157 0 148 157 1 3
                                    34 158 0 149 158 1 2 0 87 0 87 101 2 21 11
                                    0 0 1 2 59 18 0 0 1 1 57 18 0 29 1 0 11 0 1
                                    1 25 32 0 1 2 0 0 50 41 58 2 0 0 8 41 42 2
                                    0 0 0 11 31 2 15 143 137 0 1 1 0 137 0 1 1
                                    0 18 0 1 2 0 0 6 11 56 3 0 0 0 141 136 1 3
                                    0 0 0 41 11 1 3 4 36 0 0 41 1 2 4 36 0 0
                                    113 1 0 11 0 1 2 0 136 0 141 1 2 0 11 0 41
                                    1 2 0 0 140 0 1 2 0 0 135 0 1 1 0 8 0 9 1 0
                                    142 0 1 1 0 134 0 1 2 5 6 161 0 1 1 57 32 0
                                    1 2 0 0 0 13 1 2 57 0 0 11 1 1 29 133 0 1 1
                                    29 11 0 1 1 29 0 0 1 1 29 6 0 45 2 18 168 0
                                    0 1 1 18 0 137 1 2 18 0 0 0 1 1 0 102 0 1 2
                                    4 36 0 11 37 1 14 143 0 1 1 0 143 0 1 1 14
                                    176 0 1 1 1 0 0 1 0 25 0 1 2 13 150 150 0 1
                                    1 13 151 0 1 1 0 18 0 30 1 0 6 0 1 2 18 50
                                    50 50 1 1 18 0 137 1 2 18 0 0 0 127 4 4 0 0
                                    11 6 0 112 1 11 63 50 70 1 11 63 50 69 1 11
                                    74 0 75 2 15 163 0 0 1 3 15 165 0 0 0 1 2
                                    53 32 0 0 1 2 17 32 0 6 123 2 15 143 137 0
                                    1 3 0 0 0 141 138 1 3 0 0 0 41 6 1 3 0 0 0
                                    41 0 1 3 0 0 0 141 137 1 2 14 0 0 177 1 3
                                    14 0 0 0 0 1 2 14 0 0 178 1 3 14 0 0 137
                                    137 1 1 15 11 0 1 2 0 6 0 6 108 2 0 0 0 0
                                    109 2 15 6 162 6 1 2 21 162 162 162 1 2 21
                                    162 0 162 1 2 0 32 0 11 33 2 15 36 0 0 130
                                    2 5 0 0 41 1 1 5 6 0 116 2 40 0 0 155 1 2
                                    40 0 0 156 1 3 40 0 0 155 136 1 3 40 0 0
                                    156 11 1 3 4 0 0 41 11 1 3 4 0 0 141 136 1
                                    2 4 0 0 141 1 2 4 0 0 41 1 3 4 0 0 135 0 1
                                    2 4 0 0 135 1 3 4 0 0 135 11 1 2 4 0 0 11 1
                                    1 4 0 0 1 1 0 11 0 47 2 0 11 0 41 1 2 0 136
                                    0 141 1 1 12 147 0 1 1 36 148 0 1 1 38 149
                                    0 1 1 18 6 0 122 2 18 0 0 41 1 1 29 0 134 1
                                    1 0 0 134 1 1 52 145 146 1 2 21 169 162 0 1
                                    2 21 32 0 0 1 2 58 0 0 0 1 1 0 87 0 104 1 0
                                    0 6 46 1 55 0 0 1 1 56 0 92 1 1 30 0 160 1
                                    1 14 0 41 1 1 0 138 0 1 2 0 6 0 11 1 3 0 0
                                    0 41 11 1 3 0 0 0 141 136 1 1 52 32 0 1 0
                                    58 11 1 3 51 0 0 0 11 24 3 58 0 0 0 0 1 2
                                    53 18 0 0 1 2 0 0 0 0 1 2 58 18 0 0 1 2 0 0
                                    0 13 14 2 57 0 0 11 12 2 40 0 0 155 1 2 40
                                    0 0 156 1 3 40 0 0 156 11 1 3 40 0 0 155
                                    136 1 3 4 0 0 41 11 1 3 4 0 0 141 136 1 2 4
                                    0 0 41 1 2 4 0 0 141 1 3 4 0 0 135 11 1 2 4
                                    0 0 135 1 2 4 0 0 11 1 1 4 0 0 1 2 0 18 0 0
                                    111 0 57 0 15 0 59 0 16 2 15 0 0 6 132 1 61
                                    0 0 1 2 61 0 0 0 1 2 0 0 0 0 59 2 0 0 13 0
                                    1 2 0 0 0 0 23 2 0 0 6 0 131 2 0 0 0 6 1 2
                                    42 0 0 92 1 2 61 0 92 0 1 2 59 0 11 0 1 2 1
                                    0 0 160 1 2 1 0 160 0 1)))))
           '|lookupComplete|)) 
