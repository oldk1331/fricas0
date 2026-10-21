
(SDEFUN |LODOF2;convertUPtoUTS|
        ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (% (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPADCALL |np| (QREFELT % 10))) 

(SDEFUN |LODOF2;convertUTStoUP|
        ((|ns|
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|n| (|Integer|))
         (% (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPADCALL |ns| (- |n| 1) (QREFELT % 16))) 

(SDEFUN |LODOF2;convertL3toLL|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariatePolynomial|
                                                     |var|
                                                     (|Expression|
                                                      (|Integer|)))
                                                    (|Fraction|
                                                     (|UnivariatePolynomial|
                                                      |var|
                                                      (|Expression|
                                                       (|Integer|))))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|den|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#2=#:G81 NIL)
          (|apf|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp| #1#))
         (SEQ (LETT |apf| (|spadConstant| % 18)) (LETT |ftmp| |f|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| % 22) (QREFELT % 24)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 26)))
                        (LETT |den|
                              (SPADCALL
                               (|LODOF2;convertUPtoUTS|
                                (SPADCALL |lc| (QREFELT % 27)) %)
                               (QREFELT % 28)))
                        (LETT |apf|
                              (SPADCALL |apf|
                                        (SPADCALL
                                         (SPADCALL
                                          (|LODOF2;convertUPtoUTS|
                                           (SPADCALL |lc| (QREFELT % 29)) %)
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |den|
                                                              (QREFELT % 31)))
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))
                                                            (|Union|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))
                                                             "failed")
                                                            #2#))
                                          (QREFELT % 32))
                                         (SPADCALL |ftmp| (QREFELT % 33))
                                         (QREFELT % 34))
                                        (QREFELT % 35)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 36)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |apf|)))) 

(SDEFUN |LODOF2;newtonpolygonPoints|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)))
         (% (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))))
        (SPROG
         ((|xv| (|NonNegativeInteger|)) (|yv| (|Integer|))
          (|yzero| (|Integer|)) (|ftmp| #1#)
          (|points|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|points3|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|i| NIL) (#2=#:G106 NIL)
          (|p1| #3=(|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
          (|p2| #3#) (|sb1| #4=(|Integer|)) (|sb2| #4#) (|ccw| (|Boolean|))
          (|npg| (|List| #3#)))
         (SEQ (LETT |ftmp| |f|) (LETT |points| NIL)
              (LETT |yzero|
                    (SPADCALL (SPADCALL |ftmp| (QREFELT % 37)) (QREFELT % 39)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| % 18) (QREFELT % 40)))
                     (GO G191)))
                   (SEQ (LETT |xv| (SPADCALL |ftmp| (QREFELT % 41)))
                        (LETT |yv|
                              (SPADCALL (SPADCALL |ftmp| (QREFELT % 37))
                                        (SPADCALL (SPADCALL |f| (QREFELT % 37))
                                                  (QREFELT % 39))
                                        (QREFELT % 42)))
                        (COND
                         ((SPADCALL |xv| 0 (QREFELT % 43))
                          (LETT |points| (CONS (CONS |xv| |yv|) |points|))))
                        (LETT |yzero| (MIN |yzero| |yv|))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |points| (CONS (CONS 0 |yzero|) |points|))
              (LETT |npg|
                    (LIST (SPADCALL |points| 2 (QREFELT % 47))
                          (SPADCALL |points| 1 (QREFELT % 47))))
              (LETT |points3| (CDR (CDR |points|)))
              (SEQ (LETT |i| NIL) (LETT #2# |points3|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ccw| 'T)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((> (LENGTH |npg|) 1) |ccw|) ('T NIL)))
                               (GO G191)))
                             (SEQ (LETT |p1| (SPADCALL |npg| 2 (QREFELT % 47)))
                                  (LETT |p2| (SPADCALL |npg| 1 (QREFELT % 47)))
                                  (LETT |sb1|
                                        (* (- (QCAR |p2|) (QCAR |p1|))
                                           (- (QCDR |i|) (QCDR |p1|))))
                                  (LETT |sb2|
                                        (* (- (QCDR |p2|) (QCDR |p1|))
                                           (- (QCAR |i|) (QCAR |p1|))))
                                  (LETT |ccw| (<= (- |sb1| |sb2|) 0))
                                  (EXIT
                                   (COND (|ccw| (LETT |npg| (CDR |npg|))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |npg| (CONS |i| |npg|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |npg|))))) 

(SDEFUN |LODOF2;newtonpolygon|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (%
          (|List|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|npg|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|restl|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|nxt| NIL) (#1=#:G119 NIL) (|i| NIL) (#2=#:G118 NIL)
          (|slop| (|Fraction| (|Integer|))) (|j| NIL) (#3=#:G120 NIL)
          (|ind| (|NonNegativeInteger|))
          (|opc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|lsc| (|Expression| (|Integer|)))
          (|npol| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|res|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|))))))))
         (SEQ (LETT |npg| (|LODOF2;newtonpolygonPoints| |f| %))
              (LETT |res| NIL) (LETT |restl| (CDR |npg|))
              (SEQ (LETT |nxt| NIL) (LETT #1# |restl|) (LETT |i| NIL)
                   (LETT #2# |npg|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |nxt| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |slop|
                          (SPADCALL (- (QCDR |nxt|) (QCDR |i|))
                                    (- (QCAR |nxt|) (QCAR |i|))
                                    (QREFELT % 49)))
                    (LETT |npol| (|spadConstant| % 50))
                    (SEQ (LETT |j| 0)
                         (LETT #3#
                               (|quotient_INT| (- (QCAR |nxt|) (QCAR |i|))
                                               (SPADCALL |slop|
                                                         (QREFELT % 51))))
                         G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (LETT |ind|
                                (+ (* (SPADCALL |slop| (QREFELT % 51)) |j|)
                                   (QCAR |i|)))
                          (LETT |opc| (SPADCALL |f| |ind| (QREFELT % 52)))
                          (LETT |lsc|
                                (SPADCALL |opc|
                                          (+
                                           (* |j|
                                              (SPADCALL |slop| (QREFELT % 53)))
                                           (QCDR |i|))
                                          (QREFELT % 54)))
                          (EXIT
                           (LETT |npol|
                                 (SPADCALL |npol|
                                           (SPADCALL |lsc| |j| (QREFELT % 55))
                                           (QREFELT % 56)))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST (VECTOR |i| |slop| |npol|))
                                     (QREFELT % 59)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testnp;LodoL;6|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (%
          (|List|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| %) %)) 

(SDEFUN |LODOF2;factor_newton|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))))
        (SPROG
         ((|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| #1=(|Fraction| (|Integer|)))
             (|:| |npoly|
                  #2=(|UnivariatePolynomial| |var|
                                             (|Expression| (|Integer|)))))))
          (|k| NIL) (#3=#:G168 NIL) (|npol| #2#) (#4=#:G169 NIL) (|il| NIL)
          (#5=#:G170 NIL)
          (|semi|
           (|OneDimensionalArray|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#6=#:G172 NIL) (#7=#:G171 NIL) (|restl| NIL) (#8=#:G175 NIL)
          (|ii| NIL) (#9=#:G174 NIL) (#10=#:G173 NIL)
          (|vif| #11=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dvif| (|NonNegativeInteger|)) (|jj| NIL) (#12=#:G177 NIL) (|j| NIL)
          (#13=#:G176 NIL) (|vjf| #11#) (|d| (|NonNegativeInteger|))
          (|e| (|Expression| (|Integer|))) (|ie| (|Integer|))
          (|newx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|sbt| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|unsafe|
           (|List|
            (|Record| (|:| |factor| #11#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|v_old|
           #14=(|List|
                (|Record|
                 (|:| |factor|
                      (|UnivariatePolynomial| |var|
                                              (|Expression| (|Integer|))))
                 (|:| |exponent| (|NonNegativeInteger|)))))
          (#15=#:G178 NIL) (#16=#:G179 NIL) (|v| #14#) (|slo| #1#) (|i| NIL)
          (#17=#:G180 NIL)
          (|jl|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#18=#:G167 NIL)
          (|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((<= (SPADCALL |f| (QREFELT % 41)) 1)
              (PROGN (LETT #18# (LIST |f|)) (GO #19=#:G166))))
            (LETT |np| (|LODOF2;newtonpolygon| |f| %)) (LETT |res| NIL)
            (SEQ (LETT |k| NIL) (LETT #3# |np|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ (LETT |npol| (QVELT |k| 2))
                      (LETT |v|
                            (SPADCALL (|LODOF2;factorUP| |npol| |factorizer| %)
                                      (QREFELT % 64)))
                      (COND
                       ((SPADCALL (QVELT |k| 1) (|spadConstant| % 65)
                                  (QREFELT % 66))
                        (LETT |v|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |il| NIL) (LETT #5# |v|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |il| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |il|) (QCDR |il|)
                                                        (QREFELT % 67))
                                              0)
                                             #4#))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))))
                       ('T
                        (SEQ (LETT |unsafe| NIL)
                             (LETT |semi|
                                   (MAKEARR1 (LENGTH |v|)
                                             (|spadConstant| % 50)))
                             (SEQ (LETT |ii| 1) (LETT #6# (LENGTH |v|))
                                  (LETT |i| NIL) (LETT #7# |v|) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |i| (CAR #7#)) NIL)
                                        (|greater_SI| |ii| #6#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |semi| |ii|
                                              (SPADCALL (QCAR |i|) (QCDR |i|)
                                                        (QREFELT % 67))
                                              (QREFELT % 69))))
                                  (LETT #7#
                                        (PROG1 (CDR #7#)
                                          (LETT |ii| (|inc_SI| |ii|))))
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |restl| NIL)
                                  (LETT #8#
                                        (SPADCALL (CDR |v|) (QREFELT % 71)))
                                  (LETT |ii| 1) (LETT #9# (LENGTH |v|))
                                  (LETT |i| NIL) (LETT #10# |v|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT |i| (CAR #10#)) NIL)
                                        (|greater_SI| |ii| #9#) (ATOM #8#)
                                        (PROGN (LETT |restl| (CAR #8#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |vif| (QCAR |i|))
                                       (LETT |dvif|
                                             (SPADCALL |vif| (QREFELT % 72)))
                                       (EXIT
                                        (SEQ (LETT |jj| (+ |ii| 1))
                                             (LETT #12# (LENGTH |v|))
                                             (LETT |j| NIL) (LETT #13# |restl|)
                                             G190
                                             (COND
                                              ((OR (ATOM #13#)
                                                   (PROGN
                                                    (LETT |j| (CAR #13#))
                                                    NIL)
                                                   (> |jj| #12#))
                                               (GO G191)))
                                             (SEQ (LETT |vjf| (QCAR |j|))
                                                  (EXIT
                                                   (COND
                                                    ((EQL |dvif|
                                                          (SPADCALL |vjf|
                                                                    (QREFELT %
                                                                             72)))
                                                     (SEQ
                                                      (LETT |d| (- |dvif| 1))
                                                      (LETT |e|
                                                            (SPADCALL
                                                             (SPADCALL |vif|
                                                                       |d|
                                                                       (QREFELT
                                                                        % 73))
                                                             (SPADCALL |vjf|
                                                                       |d|
                                                                       (QREFELT
                                                                        % 73))
                                                             (QREFELT % 74)))
                                                      (LETT |e|
                                                            (SPADCALL |e|
                                                                      (SPADCALL
                                                                       |dvif|
                                                                       (QREFELT
                                                                        % 75))
                                                                      (QREFELT
                                                                       % 76)))
                                                      (EXIT
                                                       (COND
                                                        ((SPADCALL |e|
                                                                   (QREFELT %
                                                                            78))
                                                         (COND
                                                          ((SPADCALL |e|
                                                                     (|spadConstant|
                                                                      % 19)
                                                                     (QREFELT %
                                                                              79))
                                                           (SEQ
                                                            (LETT |ie|
                                                                  (SPADCALL |e|
                                                                            (QREFELT
                                                                             %
                                                                             80)))
                                                            (LETT |newx|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     % 12)
                                                                    1
                                                                    (QREFELT %
                                                                             55))
                                                                   (SPADCALL
                                                                    |ie|
                                                                    (QREFELT %
                                                                             81))
                                                                   (QREFELT %
                                                                            56)))
                                                            (LETT |sbt|
                                                                  (SPADCALL
                                                                   |vjf|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     % 12)
                                                                    1
                                                                    (QREFELT %
                                                                             55))
                                                                   |newx|
                                                                   (QREFELT %
                                                                            82)))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL
                                                                (SPADCALL |vif|
                                                                          |sbt|
                                                                          (QREFELT
                                                                           %
                                                                           83))
                                                                (|spadConstant|
                                                                 % 50)
                                                                (QREFELT % 84))
                                                               (COND
                                                                ((> |ie| 0)
                                                                 (SEQ
                                                                  (LETT
                                                                   |unsafe|
                                                                   (CONS |i|
                                                                         |unsafe|))
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    |semi| |jj|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |semi|
                                                                      |jj|
                                                                      (QREFELT
                                                                       % 85))
                                                                     (SPADCALL
                                                                      |vif|
                                                                      (QCDR
                                                                       |i|)
                                                                      (QREFELT
                                                                       % 67))
                                                                     (QREFELT %
                                                                              86))
                                                                    (QREFELT %
                                                                             69)))))
                                                                ('T
                                                                 (SEQ
                                                                  (LETT
                                                                   |unsafe|
                                                                   (CONS |j|
                                                                         |unsafe|))
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    |semi| |ii|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |semi|
                                                                      |ii|
                                                                      (QREFELT
                                                                       % 85))
                                                                     (SPADCALL
                                                                      |vjf|
                                                                      (QCDR
                                                                       |j|)
                                                                      (QREFELT
                                                                       % 67))
                                                                     (QREFELT %
                                                                              86))
                                                                    (QREFELT %
                                                                             69))))))))))))))))))))
                                             (LETT #13#
                                                   (PROG1 (CDR #13#)
                                                     (LETT |jj| (+ |jj| 1))))
                                             (GO G190) G191 (EXIT NIL))))
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT |ii|
                                                (PROG1 (|inc_SI| |ii|)
                                                  (LETT #8# (CDR #8#))))))
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |v_old| |v|)
                             (LETT |v| (SPADCALL |v| |unsafe| (QREFELT % 87)))
                             (EXIT
                              (COND
                               ((EQUAL |option| "semireg")
                                (LETT |v|
                                      (PROGN
                                       (LETT #15# NIL)
                                       (SEQ (LETT |i| NIL) (LETT #16# |v|) G190
                                            (COND
                                             ((OR (ATOM #16#)
                                                  (PROGN
                                                   (LETT |i| (CAR #16#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #15#
                                                    (CONS
                                                     (CONS
                                                      (SPADCALL |semi|
                                                                (SPADCALL |i|
                                                                          |v_old|
                                                                          (QREFELT
                                                                           %
                                                                           88))
                                                                (QREFELT % 85))
                                                      1)
                                                     #15#))))
                                            (LETT #16# (CDR #16#)) (GO G190)
                                            G191
                                            (EXIT (NREVERSE #15#)))))))))))
                      (LETT |slo| (QVELT |k| 1))
                      (COND
                       ((EQL
                         (*
                          (SPADCALL (QCAR (SPADCALL |v| 1 (QREFELT % 89)))
                                    (QREFELT % 72))
                          (SPADCALL |slo| (QREFELT % 51)))
                         (SPADCALL |f| (QREFELT % 41)))
                        (PROGN (LETT #18# (LIST |f|)) (GO #19#))))
                      (EXIT
                       (SEQ (LETT |i| NIL) (LETT #17# |v|) G190
                            (COND
                             ((OR (ATOM #17#)
                                  (PROGN (LETT |i| (CAR #17#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |jl|
                                   (|LODOF2;factor_newton2| |f| (QCAR |i|) |k|
                                    %))
                             (COND
                              ((EQUAL |option| "alg factor")
                               (PROGN
                                (LETT #18# (LIST (QCDR |jl|)))
                                (GO #19#)))
                              ((EQUAL |option| "split over k((x))")
                               (PROGN
                                (LETT #18#
                                      (SPADCALL
                                       (|LODOF2;factor_newton| (QCAR |jl|)
                                        |factorizer| |option| %)
                                       (LIST (QCDR |jl|)) (QREFELT % 91)))
                                (GO #19#))))
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res| (LIST (QCDR |jl|))
                                              (QREFELT % 91)))))
                            (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #18#)))) 

(SDEFUN |LODOF2;testfn;LodoMSL;8|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))))
        (|LODOF2;factor_newton| (|LODOF2;convertL3toLL| |f| %) |factorizer|
         |option| %)) 

(SDEFUN |LODOF2;factorUP|
        ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|factorSUP|
          (|Mapping|
           #1=(|Factored|
               (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (%
          (|Factored|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
        (SPROG
         ((|snp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|fsnp| #1#))
         (SEQ (LETT |snp| (SPADCALL |np| (QREFELT % 96)))
              (LETT |fsnp| (SPADCALL |snp| |factorSUP|))
              (EXIT (SPADCALL (ELT % 97) |fsnp| (QREFELT % 101)))))) 

(SDEFUN |LODOF2;factor_newton2|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|l|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| #1=(|Fraction| (|Integer|)))
           (|:| |npoly|
                #2=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (%
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|slop| #1#) (|ycd| (|Integer|)) (|xcd| (|Integer|)) (|npol| #2#)
          (|shift| (|Fraction| (|Integer|)))
          (|mlr| #3=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npo| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npor| #3#) (|ordr| (|Integer|)) (|ordl| (|Integer|))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|llr|
           (|Record|
            (|:| |laurl|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |laurr|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|left|
           #4=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|right| #4#))
         (SEQ (LETT |slop| (QVELT |l| 1)) (LETT |ycd| (QCDR (QVELT |l| 0)))
              (LETT |xcd| (QCAR (QVELT |l| 0))) (LETT |npol| (QVELT |l| 2))
              (LETT |shift|
                    (SPADCALL (|spadConstant| % 65)
                              (SPADCALL (SPADCALL |ycd| (QREFELT % 102))
                                        (SPADCALL
                                         (- (SPADCALL |f| (QREFELT % 41))
                                            |xcd|)
                                         |slop| (QREFELT % 103))
                                        (QREFELT % 104))
                              (QREFELT % 105)))
              (LETT |npo|
                    (SPADCALL (|spadConstant| % 12) |xcd| (QREFELT % 55)))
              (LETT |mlr|
                    (SPADCALL (SPADCALL |npol| |r| (QREFELT % 106))
                              (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 55))
                              (SPADCALL (|spadConstant| % 12)
                                        (SPADCALL |slop| (QREFELT % 51))
                                        (QREFELT % 55))
                              (QREFELT % 82)))
              (LETT |npo| (SPADCALL |npo| |mlr| (QREFELT % 86)))
              (LETT |npor|
                    (SPADCALL |r|
                              (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 55))
                              (SPADCALL (|spadConstant| % 12)
                                        (SPADCALL |slop| (QREFELT % 51))
                                        (QREFELT % 55))
                              (QREFELT % 82)))
              (LETT |ordr|
                    (* (SPADCALL |r| (QREFELT % 72))
                       (SPADCALL |slop| (QREFELT % 51))))
              (LETT |ordl| (- (SPADCALL |f| (QREFELT % 41)) |ordr|))
              (LETT |lwr|
                    (|LODOF2;ln_wrapper| |slop| |f| |npo| |npor| |shift| |ordr|
                     %))
              (LETT |lcr|
                    (|LODOF2;listream_coefs| |lwr| |ordl| |ordr| |shift| |slop|
                     %))
              (LETT |llr| (|LODOF2;list_laurent| |lcr| |ordl| |ordr| %))
              (LETT |left| (|LODOF2;laurent_op| (QCAR |llr|) |ordl| %))
              (LETT |right| (|LODOF2;laurent_op| (QCDR |llr|) |ordr| %))
              (EXIT (CONS |left| |right|))))) 

(SDEFUN |LODOF2;testf2;LodoUpFR;11|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|slop| (|Fraction| (|Integer|)))
         (%
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|np|
           (|List|
            #1=(|Record|
                (|:| |point|
                     (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
                (|:| |slope| (|Fraction| (|Integer|)))
                (|:| |npoly|
                     (|UnivariatePolynomial| |var|
                                             (|Expression| (|Integer|)))))))
          (|i| NIL) (#2=#:G201 NIL) (|l| #1#))
         (SEQ
          (LETT |np| (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| %) %))
          (SEQ (LETT |i| NIL) (LETT #2# |np|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 1) |slop| (QREFELT % 107))
                   (LETT |l| |i|)))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|LODOF2;factor_newton2| (|LODOF2;convertL3toLL| |f| %) |r| |l|
            %))))) 

(SDEFUN |LODOF2;laurent_op|
        ((|llaur|
          (|List|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (|dgf| (|Integer|))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|i| NIL) (#1=#:G206 NIL)
          (|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ (LETT |f| (|spadConstant| % 18))
              (SEQ (LETT |i| 0) (LETT #1# |dgf|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |f|
                           (SPADCALL |f|
                                     (SPADCALL
                                      (SPADCALL |llaur| (+ |i| 1)
                                                (QREFELT % 111))
                                      |i| (QREFELT % 34))
                                     (QREFELT % 35)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;list_laurent|
        ((|lsc|
          (|Record|
           (|:| |llc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|)))))))
           (|:| |rlc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|)))))))))
         (|dgl| (|Integer|)) (|dgr| (|Integer|))
         (%
          (|Record|
           (|:| |laurl|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |laurr|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|laurel|
           #1=(|List|
               (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)))
          (|laurer| #1#))
         (SEQ (LETT |laurel| (|LODOF2;list_laurentop| (QCAR |lsc|) |dgl| %))
              (LETT |laurer| (|LODOF2;list_laurentop| (QCDR |lsc|) |dgr| %))
              (EXIT (CONS |laurel| |laurer|))))) 

(SDEFUN |LODOF2;testll;FLodo2UpFIR;14|
        ((|slop| (|Fraction| (|Integer|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (%
          (|Record|
           (|:| |laurl|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |laurr|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|))))))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| %)
                 |l_low| |r_low| |shift| |dgr| %))
          (LETT |lcr|
                (|LODOF2;listream_coefs| |lwr|
                 (- (SPADCALL |f| (QREFELT % 33)) |dgr|) |dgr| |shift| |slop|
                 %))
          (EXIT
           (|LODOF2;list_laurent| |lcr| (- (SPADCALL |f| (QREFELT % 33)) |dgr|)
            |dgr| %))))) 

(SDEFUN |LODOF2;list_laurentop|
        ((|lsc|
          (|List|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|)))))))
         (|dgf| (|Integer|))
         (%
          (|List|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                      |cen|))))
        (SPROG
         ((|i| NIL) (#1=#:G223 NIL)
          (|res|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #1# |dgf|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST
                                      (SPADCALL
                                       (SPADCALL |lsc| (+ |i| 1)
                                                 (QREFELT % 117))
                                       (QREFELT % 118)))
                                     (QREFELT % 119)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;listream_coefs|
        ((|slr|
          (|Stream|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))))
         (|dgl| (|Integer|)) (|dgr| (|Integer|))
         (|shift| (|Fraction| (|Integer|))) (|slop| (|Fraction| (|Integer|)))
         (%
          (|Record|
           (|:| |llc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|)))))))
           (|:| |rlc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|))))))))))
        (SPROG
         ((|sle|
           #1=(|Stream|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|))))
          (|le| (|Integer|))
          (|lsc|
           #2=(|List|
               (|Stream|
                (|Record| (|:| |k| (|Integer|))
                          (|:| |c| (|Expression| (|Integer|)))))))
          (|sre| #1#) (|re| (|Integer|)) (|rsc| #2#))
         (SEQ
          (LETT |sle|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!0|) |slr|
                          (QREFELT % 124)))
          (LETT |le|
                (SPADCALL
                 (SPADCALL (SPADCALL |slop| (QREFELT % 51)) |shift|
                           (QREFELT % 103))
                 (QREFELT % 125)))
          (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT % 53)) |dgl|)))
          (LETT |lsc| (|LODOF2;listream_coefsop| |sle| |dgl| |le| |slop| %))
          (LETT |sre|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!1|) |slr|
                          (QREFELT % 124)))
          (LETT |re| (- (* (SPADCALL |slop| (QREFELT % 53)) |dgr|)))
          (LETT |rsc| (|LODOF2;listream_coefsop| |sre| |dgr| |re| |slop| %))
          (EXIT (CONS |lsc| |rsc|))))) 

(SDEFUN |LODOF2;listream_coefs!1| ((|landr| NIL) ($$ NIL)) (QCDR |landr|)) 

(SDEFUN |LODOF2;listream_coefs!0| ((|landr| NIL) ($$ NIL)) (QCAR |landr|)) 

(SDEFUN |LODOF2;testlc;FLodo2UpFIR;17|
        ((|slop| (|Fraction| (|Integer|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (%
          (|Record|
           (|:| |llc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|)))))))
           (|:| |rlc|
                (|List|
                 (|Stream|
                  (|Record| (|:| |k| (|Integer|))
                            (|:| |c| (|Expression| (|Integer|))))))))))
        (SPROG
         ((|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| %)
                 |l_low| |r_low| |shift| |dgr| %))
          (EXIT
           (|LODOF2;listream_coefs| |lwr|
            (- (SPADCALL |f| (QREFELT % 33)) |dgr|) |dgr| |shift| |slop| %))))) 

(SDEFUN |LODOF2;listream_coefsop|
        ((|sfe|
          (|Stream|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (|dgf| (|Integer|)) (|fe| (|Integer|))
         (|slop| (|Fraction| (|Integer|)))
         (%
          (|List|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))))
        (SPROG
         ((|i| NIL) (#1=#:G270 NIL) (|nl_st| (|Stream| (|Integer|)))
          (|new_term|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (|res|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|dgc|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|))))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #1# (- |dgf| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |nl_st|
                          (SPADCALL (CONS #'|LODOF2;listream_coefsop!0| %) 1
                                    (QREFELT % 133)))
                    (LETT |new_term|
                          (SPADCALL
                           (CONS #'|LODOF2;listream_coefsop!1|
                                 (VECTOR |i| |fe| |slop| %))
                           |sfe| |nl_st| (QREFELT % 142)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST |new_term|)
                                     (QREFELT % 143)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |dgc|
                    (LIST
                     (SPADCALL (LIST (CONS 0 (|spadConstant| % 12)))
                               (QREFELT % 145))))
              (EXIT (SPADCALL |res| |dgc| (QREFELT % 143)))))) 

(SDEFUN |LODOF2;listream_coefsop!1| ((|x| NIL) (|n_l| NIL) ($$ NIL))
        (PROG (% |slop| |fe| |i|)
          (LETT % (QREFELT $$ 3))
          (LETT |slop| (QREFELT $$ 2))
          (LETT |fe| (QREFELT $$ 1))
          (LETT |i| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|degn| NIL) (|deg| NIL) (|cx| NIL) (|coefd| NIL)
              (#1=#:G251 NIL))
             (SEQ
              (LETT |degn|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |n_l| (|spadConstant| % 129) (QREFELT % 134))
                       (SPADCALL |slop| (QREFELT % 51)) (QREFELT % 135))
                      |fe| (QREFELT % 130))
                     (SPADCALL |i| (SPADCALL |slop| (QREFELT % 53))
                               (QREFELT % 136))
                     (QREFELT % 130)))
              (LETT |deg|
                    (SPADCALL
                     (SPADCALL |degn| (SPADCALL |slop| (QREFELT % 51))
                               (QREFELT % 49))
                     (QREFELT % 138)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |deg| (CONS 1 "failed") (QREFELT % 139)))
                     (GO G191)))
                   (SEQ
                    (LETT |degn|
                          (SPADCALL |degn| (|spadConstant| % 129)
                                    (QREFELT % 130)))
                    (EXIT
                     (LETT |deg|
                           (SPADCALL
                            (SPADCALL |degn| (SPADCALL |slop| (QREFELT % 51))
                                      (QREFELT % 49))
                            (QREFELT % 138)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |cx| (SPADCALL |x| |i| (QREFELT % 52)))
              (LETT |coefd|
                    (SPADCALL |cx|
                              (PROG2 (LETT #1# |deg|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                                (|Union| (|Integer|)
                                                         #2="failed")
                                                #1#))
                              (QREFELT % 54)))
              (EXIT
               (CONS
                (PROG2 (LETT #1# |deg|)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                  (|Union| (|Integer|) #2#) #1#))
                |coefd|)))))))) 

(SDEFUN |LODOF2;listream_coefsop!0| ((|x| NIL) (% NIL))
        (SPADCALL |x| (|spadConstant| % 129) (QREFELT % 130))) 

(SDEFUN |LODOF2;lift_newton|
        ((|slop| (|Fraction| (|Integer|)))
         (|ff|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (|v|
          (|Record|
           (|:| |Qt|
                #1=(|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
           (|:| |Rt|
                #2=(|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))))
         (|ei|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|n_l| (|PositiveInteger|))
         (%
          (|Record|
           (|:| |main|
                (|Record|
                 (|:| |Qt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |Rt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |nf|
                (|Record|
                 (|:| |Qt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |Rt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |error|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|dgl| #3=(|Integer|))
          (|sl_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#4=#:G285 NIL)
          (|s|
           (|Record|
            (|:| |coef1|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |coef2|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|c2| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|le| #5=(|Integer|)) (|re| (|Integer|)) (|fe| #5#) (|i| #3#)
          (#6=#:G295 NIL)
          (|pi| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pr_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pl_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|l_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|r_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|li| #1#) (|ri| #2#))
         (SEQ (LETT |dgl| (- (SPADCALL |ff| (QREFELT % 41)) |dgr|))
              (LETT |li| (QCAR |v|)) (LETT |ri| (QCDR |v|))
              (COND
               ((SPADCALL |slop| (|spadConstant| % 65) (QREFELT % 107))
                (SEQ (LETT |i| (- |n_l| 1))
                     (COND
                      ((EQL |i| 0)
                       (SEQ (LETT |r_extra| (|LODOF2;plug_delta| |r_low| %))
                            (EXIT
                             (LETT |l_extra|
                                   (SPADCALL (|LODOF2;plug_delta| |l_low| %)
                                             (SPADCALL (|spadConstant| % 12)
                                                       (SPADCALL |shift|
                                                                 (QREFELT %
                                                                          125))
                                                       (QREFELT % 146))
                                             (QREFELT % 147))))))
                      (#7='T
                       (SEQ
                        (LETT |sl_low|
                              (SPADCALL |l_low|
                                        (SPADCALL (|spadConstant| % 12) 1
                                                  (QREFELT % 55))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 12) 1
                                                   (QREFELT % 55))
                                         (SPADCALL |i| (QREFELT % 81))
                                         (QREFELT % 56))
                                        (QREFELT % 82)))
                        (LETT |s| (SPADCALL |r_low| |sl_low| (QREFELT % 149)))
                        (COND
                         ((SPADCALL (QVELT |s| 2) (|spadConstant| % 150)
                                    (QREFELT % 151))
                          (|error| "unsafe factor")))
                        (LETT |c2| (QVELT |s| 1))
                        (LETT |pi|
                              (|LODOF2;coeffx| |ei|
                               (SPADCALL (SPADCALL |i| (QREFELT % 102)) |shift|
                                         (QREFELT % 104))
                               %))
                        (LETT |pr_extra|
                              (SPADCALL
                               (SPADCALL (SPADCALL |c2| |pi| (QREFELT % 86))
                                         |r_low| (QREFELT % 152))
                               (QREFELT % 153)))
                        (LETT |r_extra| (|LODOF2;plug_delta| |pr_extra| %))
                        (LETT |pl_extra|
                              (SPADCALL
                               (SPADCALL |pi|
                                         (SPADCALL |pr_extra| |sl_low|
                                                   (QREFELT % 86))
                                         (QREFELT % 56))
                               |r_low| (QREFELT % 106)))
                        (LETT |l_extra| (|LODOF2;plug_delta| |pl_extra| %))
                        (LETT |l_extra|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 12)
                                          (+ |i|
                                             (SPADCALL |shift|
                                                       (QREFELT % 125)))
                                          (QREFELT % 146))
                                |l_extra| (QREFELT % 156))
                               (QREFELT % 157)))
                        (EXIT
                         (LETT |r_extra|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 12) |i|
                                          (QREFELT % 146))
                                |r_extra| (QREFELT % 156)))))))
                     (LETT |li| (SPADCALL |li| |l_extra| (QREFELT % 35)))
                     (LETT |ei|
                           (SPADCALL
                            (SPADCALL |ei|
                                      (SPADCALL |l_extra| |ri| (QREFELT % 158))
                                      (QREFELT % 35))
                            (SPADCALL |li| |r_extra| (QREFELT % 158))
                            (QREFELT % 35)))
                     (EXIT
                      (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT % 35))))))
               (#7#
                (SEQ
                 (LETT |s|
                       (PROG2
                           (LETT #4#
                                 (SPADCALL |r_low| |l_low|
                                           (|spadConstant| % 150)
                                           (QREFELT % 161)))
                           (QCDR #4#)
                         (|check_union2| (QEQCAR #4# 0)
                                         (|Record|
                                          (|:| |coef1|
                                               (|UnivariatePolynomial|
                                                (QREFELT % 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |coef2|
                                               (|UnivariatePolynomial|
                                                (QREFELT % 6)
                                                (|Expression| (|Integer|)))))
                                         (|Union|
                                          (|Record|
                                           (|:| |coef1|
                                                (|UnivariatePolynomial|
                                                 (QREFELT % 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |coef2|
                                                (|UnivariatePolynomial|
                                                 (QREFELT % 6)
                                                 (|Expression| (|Integer|)))))
                                          "failed")
                                         #4#)))
                 (LETT |c2| (QCDR |s|))
                 (LETT |le|
                       (SPADCALL
                        (SPADCALL (SPADCALL |slop| (QREFELT % 51)) |shift|
                                  (QREFELT % 103))
                        (QREFELT % 125)))
                 (LETT |le|
                       (- |le| (* (SPADCALL |slop| (QREFELT % 53)) |dgl|)))
                 (LETT |re| (- (* (SPADCALL |slop| (QREFELT % 53)) |dgr|)))
                 (LETT |fe|
                       (SPADCALL
                        (SPADCALL (SPADCALL |slop| (QREFELT % 51)) |shift|
                                  (QREFELT % 103))
                        (QREFELT % 125)))
                 (LETT |fe|
                       (- |fe|
                          (* (SPADCALL |slop| (QREFELT % 53))
                             (SPADCALL |ff| (QREFELT % 41)))))
                 (EXIT
                  (SEQ
                   (LETT |i| (* (- |n_l| 1) (SPADCALL |slop| (QREFELT % 51))))
                   (LETT #6# (- (* |n_l| (SPADCALL |slop| (QREFELT % 51))) 1))
                   G190 (COND ((> |i| #6#) (GO G191)))
                   (SEQ
                    (COND
                     ((EQL |i| 0)
                      (SEQ
                       (LETT |r_extra|
                             (|LODOF2;coefs_operator| |r_low| |slop| |re| %))
                       (EXIT
                        (LETT |l_extra|
                              (|LODOF2;coefs_operator| |l_low| |slop| |le|
                               %)))))
                     ('T
                      (SEQ
                       (LETT |pi|
                             (|LODOF2;coefs_poly| |ei| |slop| (+ |i| |fe|) %))
                       (LETT |pr_extra|
                             (SPADCALL (SPADCALL |c2| |pi| (QREFELT % 86))
                                       |r_low| (QREFELT % 152)))
                       (LETT |pl_extra|
                             (SPADCALL |pi|
                                       (SPADCALL |pr_extra| |l_low|
                                                 (QREFELT % 86))
                                       (QREFELT % 83)))
                       (LETT |pl_extra|
                             (SPADCALL
                              (SPADCALL |pl_extra| |r_low| (QREFELT % 106))
                              (QREFELT % 153)))
                       (LETT |l_extra|
                             (|LODOF2;coefs_operator| |pl_extra| |slop|
                              (+ |i| |le|) %))
                       (EXIT
                        (LETT |r_extra|
                              (|LODOF2;coefs_operator|
                               (SPADCALL |pr_extra| (QREFELT % 153)) |slop|
                               (+ |i| |re|) %))))))
                    (LETT |li| (SPADCALL |li| |l_extra| (QREFELT % 35)))
                    (LETT |ei|
                          (SPADCALL
                           (SPADCALL |ei|
                                     (SPADCALL |l_extra| |ri| (QREFELT % 158))
                                     (QREFELT % 35))
                           (SPADCALL |li| |r_extra| (QREFELT % 158))
                           (QREFELT % 35)))
                    (EXIT
                     (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT % 35)))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
              (EXIT
               (VECTOR
                (CONS (SPADCALL |li| (QCAR |v|) (QREFELT % 162))
                      (SPADCALL |ri| (QCDR |v|) (QREFELT % 162)))
                (CONS |li| |ri|) |ei|))))) 

(SDEFUN |LODOF2;testln;FLodo2UpFIR;20|
        ((|slop| (|Fraction| (|Integer|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (%
          (|Record|
           (|:| |main|
                (|Record|
                 (|:| |Qt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |Rt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |nf|
                (|Record|
                 (|:| |Qt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |Rt|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |error|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|i| NIL)
          (|lnr|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|v|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|ei|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ (LETT |v| (CONS (|spadConstant| % 18) (|spadConstant| % 18)))
              (LETT |ei|
                    (SPADCALL (|LODOF2;convertL3toLL| |f| %) (QREFELT % 157)))
              (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 5) (GO G191)))
                   (SEQ
                    (LETT |lnr|
                          (|LODOF2;lift_newton| |slop|
                           (|LODOF2;convertL3toLL| |f| %) |l_low| |r_low|
                           |shift| |dgr| |v| |ei| |i| %))
                    (SPADCALL (SPADCALL (QCAR (QVELT |lnr| 0)) (QREFELT % 164))
                              (QREFELT % 166))
                    (SPADCALL (SPADCALL (QCDR (QVELT |lnr| 0)) (QREFELT % 164))
                              (QREFELT % 166))
                    (LETT |v| (QVELT |lnr| 1))
                    (EXIT (LETT |ei| (QVELT |lnr| 2))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lnr|)))) 

(SDEFUN |LODOF2;ln_wrapper|
        ((|slop| (|Fraction| (|Integer|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (%
          (|Stream|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))))
        (SPROG
         ((|n_li| (|PositiveInteger|))
          (|lni|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|all|
           (|Stream|
            (|Record|
             (|:| |lr|
                  (|Record|
                   (|:| |main|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |nf|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |error|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |n_lifts| (|PositiveInteger|)))))
          (|res|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lni|
                (VECTOR (CONS (|spadConstant| % 18) (|spadConstant| % 18))
                        (CONS (|spadConstant| % 18) (|spadConstant| % 18))
                        (SPADCALL |f| (QREFELT % 157))))
          (LETT |n_li| 1)
          (LETT |lni|
                (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low| |shift| |dgr|
                 (QVELT |lni| 1) (QVELT |lni| 2) |n_li| %))
          (LETT |all|
                (SPADCALL
                 (CONS #'|LODOF2;ln_wrapper!0|
                       (VECTOR |dgr| |shift| |r_low| |l_low| |f| |slop| %))
                 (CONS |lni| |n_li|) (QREFELT % 175)))
          (LETT |res|
                (SPADCALL (LIST #'|LODOF2;ln_wrapper!1|) |all|
                          (QREFELT % 178)))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;ln_wrapper!1| ((|rec| NIL) ($$ NIL)) (QVELT (QCAR |rec|) 0)) 

(SDEFUN |LODOF2;ln_wrapper!0| ((|rec| NIL) ($$ NIL))
        (PROG (% |slop| |f| |l_low| |r_low| |shift| |dgr|)
          (LETT % (QREFELT $$ 6))
          (LETT |slop| (QREFELT $$ 5))
          (LETT |f| (QREFELT $$ 4))
          (LETT |l_low| (QREFELT $$ 3))
          (LETT |r_low| (QREFELT $$ 2))
          (LETT |shift| (QREFELT $$ 1))
          (LETT |dgr| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|n_l| NIL) (|lnr| NIL))
                   (SEQ (LETT |lnr| (QCAR |rec|))
                        (LETT |n_l|
                              (SPADCALL (QCDR |rec|) (|spadConstant| % 170)
                                        (QREFELT % 171)))
                        (LETT |lnr|
                              (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low|
                               |shift| |dgr| (QVELT |lnr| 1) (QVELT |lnr| 2)
                               |n_l| %))
                        (EXIT (CONS |lnr| |n_l|)))))))) 

(SDEFUN |LODOF2;testlw;FLodo2UpFIS;22|
        ((|slop| (|Fraction| (|Integer|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|l_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|r_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|shift| (|Fraction| (|Integer|))) (|dgr| (|Integer|))
         (%
          (|Stream|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))))
        (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| %) |l_low|
         |r_low| |shift| |dgr| %)) 

(SDEFUN |LODOF2;coefs_poly|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|slop| (|Fraction| (|Integer|))) (|i| (|Integer|))
         (% (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|nsi| (|Integer|)) (|start_D| (|Integer|))
          (|start_x| (|Fraction| (|Integer|))) (|j| NIL) (#1=#:G327 NIL)
          (|fc| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npc| (|Expression| (|Integer|)))
          (|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT % 53))
                           (SPADCALL |slop| (QREFELT % 51)) (QREFELT % 180))
                 0))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT % 51))
                          (QREFELT % 181)))
          (LETT |start_x|
                (SPADCALL (SPADCALL |start_D| |slop| (QREFELT % 103))
                          (SPADCALL |i| (SPADCALL |slop| (QREFELT % 51))
                                    (QREFELT % 49))
                          (QREFELT % 104)))
          (LETT |res| (|spadConstant| % 50))
          (SEQ (LETT |j| 0)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT % 41))
                                (SPADCALL |slop| (QREFELT % 51))
                                (QREFELT % 49))
                      (QREFELT % 182)))
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |fc|
                      (|LODOF2;coeffx| |f|
                       (SPADCALL |start_x|
                                 (SPADCALL (SPADCALL |slop| (QREFELT % 53))
                                           (SPADCALL |j| (QREFELT % 102))
                                           (QREFELT % 103))
                                 (QREFELT % 104))
                       %))
                (LETT |npc|
                      (SPADCALL |fc|
                                (+ |start_D|
                                   (* |j| (SPADCALL |slop| (QREFELT % 51))))
                                (QREFELT % 73)))
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |npc|
                                           (+ |start_D|
                                              (* |j|
                                                 (SPADCALL |slop|
                                                           (QREFELT % 51))))
                                           (QREFELT % 55))
                                 (QREFELT % 56)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testcp;LodoFILodo;24|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|slop| (|Fraction| (|Integer|))) (|i| (|Integer|))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;coefs_operator|
         (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| %) |slop| |i| %)
         |slop| |i| %)) 

(SDEFUN |LODOF2;coefs_operator|
        ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|slop| (|Fraction| (|Integer|))) (|i| (|Integer|))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|nsi| (|Integer|)) (|start_D| (|Integer|)) (|start_x| (|Integer|))
          (|j| NIL) (#1=#:G335 NIL) (|npc| (|Expression| (|Integer|)))
          (|sc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT % 53))
                           (SPADCALL |slop| (QREFELT % 51)) (QREFELT % 180))
                 0))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT % 51))
                          (QREFELT % 181)))
          (LETT |start_x|
                (SPADCALL
                 (SPADCALL (SPADCALL |start_D| |slop| (QREFELT % 103))
                           (SPADCALL |i| (SPADCALL |slop| (QREFELT % 51))
                                     (QREFELT % 49))
                           (QREFELT % 104))
                 (QREFELT % 125)))
          (LETT |res| (|spadConstant| % 18))
          (SEQ (LETT |j| 0)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |np| (QREFELT % 72))
                                (SPADCALL |slop| (QREFELT % 51))
                                (QREFELT % 49))
                      (QREFELT % 184)))
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |npc|
                      (SPADCALL |np|
                                (+ |start_D|
                                   (* |j| (SPADCALL |slop| (QREFELT % 51))))
                                (QREFELT % 73)))
                (LETT |sc|
                      (SPADCALL |npc|
                                (+ |start_x|
                                   (* (SPADCALL |slop| (QREFELT % 53)) |j|))
                                (QREFELT % 146)))
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |sc|
                                           (+ |start_D|
                                              (* |j|
                                                 (SPADCALL |slop|
                                                           (QREFELT % 51))))
                                           (QREFELT % 34))
                                 (QREFELT % 35)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testco;LodoFIB;26|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|slop| (|Fraction| (|Integer|))) (|i| (|Integer|)) (% (|Boolean|)))
        (SPROG
         ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |np|
                (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| %) |slop| |i|
                 %))
          (EXIT
           (SPADCALL
            (|LODOF2;coefs_poly| (|LODOF2;coefs_operator| |np| |slop| |i| %)
             |slop| |i| %)
            |np| (QREFELT % 84)))))) 

(SDEFUN |LODOF2;coeffx|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)))
         (|e| (|Fraction| (|Integer|)))
         (% (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|ex| (|Integer|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|ftmp| #1#))
         (SEQ (LETT |ftmp| |f|) (LETT |ex| (SPADCALL |e| (QREFELT % 125)))
              (LETT |res| (|spadConstant| % 50))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| % 18) (QREFELT % 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 37)))
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT % 41)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| |ex| (QREFELT % 54))
                                         |dg| (QREFELT % 55))
                                        (QREFELT % 56)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testcx;LodoFUp;28|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|e| (|Fraction| (|Integer|)))
         (% (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (|LODOF2;coeffx| (|LODOF2;convertL3toLL| |f| %) |e| %)) 

(SDEFUN |LODOF2;plug_delta|
        ((|np| #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|lc| (|Expression| (|Integer|))) (|dg| (|NonNegativeInteger|))
          (|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|nptmp| #1#))
         (SEQ (LETT |f| (|spadConstant| % 18)) (LETT |nptmp| |np|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| % 50) (QREFELT % 151)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT % 187)))
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT % 72)))
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT % 188)) |dg|
                                         (QREFELT % 34))
                                        (QREFELT % 35)))
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT % 189)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;testpd;UpLodo;30|
        ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;plug_delta| |np| %)) 

(SDEFUN |LODOF2;factor_riccati|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|Union|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))))
        (SPROG
         ((|np1|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slop| #1=(|Fraction| (|Integer|)))
          (|va|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|vr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|xx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vr_ope|
           #2=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|i| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npf1|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #3="nil" #4="sqfr" #5="irred" #6="prime"))
             (|:| |factor|
                  #7=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|l| NIL) (#8=#:G456 NIL) (|diff| (|Union| (|Integer|) "failed"))
          (|fact| #7#) (#9=#:G377 NIL) (|sols| (|List| (|Integer|)))
          (|subs|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ip| NIL) (#10=#:G457 NIL)
          (|npf|
           (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#))
                     (|:| |factor|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression| (|Integer|))))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|irred_f| (|Boolean|))
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|cxs|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#11=#:G72 NIL) (#12=#:G352 NIL) (|vi| NIL) (#13=#:G458 NIL)
          (|xsubsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|fullxr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|retv|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#14=#:G459 NIL) (#15=#:G460 NIL)
          (|r1|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|lk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#16=#:G353 NIL)
          (|ric|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#17=#:G461 NIL) (#18=#:G73 NIL)
          (|rk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|gr| (|Expression| (|Integer|)))
          (|npgr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#19=#:G462 NIL) (|n| (|Integer|))
          (|coefr| (|Expression| (|Integer|)))
          (|ror|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|exp| (|Integer|)) (|tosub| (|Expression| (|Integer|)))
          (|np|
           (|List|
            #20=(|Record|
                 (|:| |point|
                      (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
                 (|:| |slope| #1#)
                 (|:| |npoly|
                      (|UnivariatePolynomial| |var|
                                              (|Expression| (|Integer|)))))))
          (#21=#:G463 NIL) (|lns| #20#)
          (|f2r|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|v|
           (|Union|
            (|List|
             (|Record|
              (|:| |op|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |ram|
                   (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
              (|:| |expart|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
            (|List|
             (|Union|
              (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|))
              (|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|)))))))))
          (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vsp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#22=#:G464 NIL) (#23=#:G465 NIL)
          (|res_sp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#24=#:G466 NIL)
          (|ir|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|nt|
           (|Record| (|:| |ope| #2#) (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|))))))
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#25=#:G455 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (|LODOF2;newtonpolygon| |f| %))
                (LETT |np1| (SPADCALL |np| 1 (QREFELT % 191)))
                (LETT |slop| (QVELT |np1| 1))
                (COND
                 ((EQUAL |option| "semireg")
                  (COND
                   ((SPADCALL |slop| (|spadConstant| % 65) (QREFELT % 107))
                    (EXIT
                     (SEQ
                      (LETT |va|
                            (SPADCALL
                             (PROG2
                                 (LETT #16#
                                       (|LODOF2;factor_op| |f| |factorizer|
                                        "alg factor" %))
                                 (QCDR #16#)
                               (|check_union2| (QEQCAR #16# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #16#))
                             (QREFELT % 195)))
                      (LETT |vr|
                            (COND
                             ((QEQCAR |va| 0)
                              (VECTOR (QCDR |va|) 1 (|spadConstant| % 19)
                                      (SPADCALL (|spadConstant| % 12) 1
                                                (QREFELT % 55))))
                             (#26='T (QCDR |va|))))
                      (LETT |xx|
                            (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 55)))
                      (LETT |vr_ope| (QVELT |vr| 0))
                      (LETT |i|
                            (SPADCALL |xx|
                                      (|LODOF2;coeffx| |vr_ope|
                                       (|spadConstant| % 65) %)
                                      (QREFELT % 83)))
                      (LETT |n|
                            (|quotient_INT| (SPADCALL |f| (QREFELT % 41))
                                            (QVELT |vr| 1)))
                      (COND
                       ((EQL |n| 1)
                        (SEQ
                         (LETT |il|
                               (SPADCALL (|LODOF2;convertUPtoUTS| |i| %)
                                         (QREFELT % 28)))
                         (EXIT
                          (PROGN
                           (LETT #25#
                                 (CONS 0
                                       (LIST
                                        (VECTOR
                                         (SPADCALL (QVELT |vr| 0)
                                                   (SPADCALL |il|
                                                             (QREFELT % 196))
                                                   (QREFELT % 35))
                                         (QVELT |vr| 3) |il|))))
                           (GO #27=#:G454))))))
                      (LETT |npf1|
                            (SPADCALL
                             (|LODOF2;factorUP|
                              (SPADCALL (QVELT |np1| 2)
                                        (SPADCALL (|spadConstant| % 12) 1
                                                  (QREFELT % 55))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 12) 1
                                                   (QREFELT % 55))
                                         |i| (QREFELT % 56))
                                        (QREFELT % 82))
                              |factorizer| %)
                             (QREFELT % 200)))
                      (LETT |r| (|spadConstant| % 150)) (LETT |sols| NIL)
                      (SEQ (LETT |l| NIL) (LETT #8# |npf1|) G190
                           (COND
                            ((OR (ATOM #8#) (PROGN (LETT |l| (CAR #8#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |diff|
                                  (SPADCALL
                                   (SPADCALL |xx| (QVELT |l| 1) (QREFELT % 83))
                                   (QREFELT % 201)))
                            (EXIT
                             (COND
                              ((SPADCALL |diff| (CONS 1 "failed")
                                         (QREFELT % 202))
                               (SEQ (LETT |fact| (QVELT |l| 1))
                                    (LETT |r|
                                          (SPADCALL |r|
                                                    (SPADCALL |fact|
                                                              (QVELT |l| 2)
                                                              (QREFELT % 67))
                                                    (QREFELT % 86)))
                                    (EXIT
                                     (LETT |sols|
                                           (CONS
                                            (PROG2 (LETT #9# |diff|)
                                                (QCDR #9#)
                                              (|check_union2| (QEQCAR #9# 0)
                                                              (|Integer|)
                                                              (|Union|
                                                               (|Integer|)
                                                               "failed")
                                                              #9#))
                                            |sols|))))))))
                           (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((SPADCALL (SPADCALL |r| (QREFELT % 72)) |n|
                                  (QREFELT % 203))
                        (|error| "bug")))
                      (LETT |n| (SPADCALL (ELT % 204) |sols| (QREFELT % 207)))
                      (LETT |r|
                            (SPADCALL |r|
                                      (SPADCALL (|spadConstant| % 12) 1
                                                (QREFELT % 55))
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 12) 1
                                                 (QREFELT % 55))
                                       (SPADCALL |n| (QREFELT % 81))
                                       (QREFELT % 56))
                                      (QREFELT % 82)))
                      (LETT |subs|
                            (PROG2
                                (LETT #11#
                                      (|LODOF2;substitute|
                                       (CONS 0
                                             (SPADCALL |i|
                                                       (SPADCALL |n|
                                                                 (QREFELT %
                                                                          81))
                                                       (QREFELT % 56)))
                                       (CONS 0 |f|) %))
                                (QCDR #11#)
                              (|check_union2| (QEQCAR #11# 0)
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT % 6) (QREFELT % 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT % 6) (QREFELT % 7)))
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT % 6)
                                                      (|Expression|
                                                       (|Integer|))))))
                                              #11#)))
                      (LETT |np| (|LODOF2;newtonpolygon| |subs| %))
                      (SEQ (LETT |ip| NIL) (LETT #10# |np|) G190
                           (COND
                            ((OR (ATOM #10#)
                                 (PROGN (LETT |ip| (CAR #10#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |ip| 1) (|spadConstant| % 65)
                                         (QREFELT % 107))
                               (LETT |lns| |ip|)))))
                           (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                      (LETT |f2r|
                            (QCDR
                             (|LODOF2;factor_newton2| |subs| |r| |lns| %)))
                      (EXIT
                       (PROGN
                        (LETT #25#
                              (CONS 0
                                    (LIST
                                     (VECTOR |f2r| (QVELT |vr| 3)
                                             (SPADCALL
                                              (|LODOF2;convertUPtoUTS|
                                               (SPADCALL |i|
                                                         (SPADCALL |n|
                                                                   (QREFELT %
                                                                            81))
                                                         (QREFELT % 56))
                                               %)
                                              (QREFELT % 28))))))
                        (GO #27#)))))))))
                (LETT |npf|
                      (SPADCALL
                       (SPADCALL
                        (|LODOF2;factorUP| (QVELT |np1| 2) |factorizer| %)
                        (QREFELT % 200))
                       1 (QREFELT % 208)))
                (LETT |irred_f|
                      (COND ((<= (SPADCALL |f| (QREFELT % 41)) 1) 'T)
                            ((EQL (QVELT |npf| 2) 1)
                             (COND ((EQUAL |option| "split over k((x))") 'T)
                                   (#26#
                                    (EQUAL |option| "all right factors"))))
                            (#26# NIL)))
                (EXIT
                 (COND
                  (|irred_f|
                   (COND
                    ((EQUAL |option| "semireg")
                     (SEQ
                      (LETT |il|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f| 0 (QREFELT % 52)) 0
                                       (QREFELT % 209))
                             (QREFELT % 210)))
                      (EXIT
                       (PROGN
                        (LETT #25#
                              (CONS 0
                                    (LIST
                                     (VECTOR
                                      (SPADCALL |f|
                                                (SPADCALL |il| (QREFELT % 196))
                                                (QREFELT % 35))
                                      (SPADCALL (|spadConstant| % 12) 1
                                                (QREFELT % 55))
                                      |il|))))
                        (GO #27#)))))
                    (#26# (CONS 1 (LIST (CONS 0 |f|))))))
                  (#26#
                   (SEQ
                    (COND
                     ((EQL (SPADCALL (QVELT |npf| 1) (QREFELT % 72)) 1)
                      (COND
                       ((EQL (SPADCALL |slop| (QREFELT % 51)) 1)
                        (EXIT
                         (SEQ
                          (LETT |cxs|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QVELT |npf| 1) 0 (QREFELT % 73))
                                  (SPADCALL (|spadConstant| % 12)
                                            (-
                                             (SPADCALL |slop| (QREFELT % 53)))
                                            (QREFELT % 146))
                                  (QREFELT % 211))
                                 (QREFELT % 210)))
                          (LETT |v|
                                (|LODOF2;factor_op|
                                 (PROG2
                                     (LETT #11#
                                           (|LODOF2;substitute| (CONS 1 |cxs|)
                                            (CONS 0 |f|) %))
                                     (QCDR #11#)
                                   (|check_union2| (QEQCAR #11# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #11#))
                                 |factorizer| |option| %))
                          (COND
                           ((EQUAL |option| "semireg")
                            (SEQ
                             (LETT |vsp|
                                   (PROG2 (LETT #12# |v|)
                                       (QCDR #12#)
                                     (|check_union2| (QEQCAR #12# 0)
                                                     (|List|
                                                      (|Record|
                                                       (|:| |op|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))))
                                                       (|:| |ram|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT % 6)
                                                             (|Expression|
                                                              (|Integer|))))
                                                       (|:| |expart|
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7)))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT % 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT % 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT %
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT % 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #12#)))
                             (LETT |retv| NIL)
                             (SEQ (LETT |vi| NIL) (LETT #13# |vsp|) G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN (LETT |vi| (CAR #13#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |xsubsr|
                                         (SPADCALL
                                          (SPADCALL
                                           (|LODOF2;convertUPtoUTS|
                                            (QVELT |vi| 1) %)
                                           (QREFELT % 28))
                                          (- (SPADCALL |slop| (QREFELT % 53)))
                                          (QREFELT % 212)))
                                   (LETT |fullxr|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QVELT |vi| 1)
                                                     (QREFELT % 72))
                                           (SPADCALL
                                            (SPADCALL (QVELT |npf| 1) 0
                                                      (QREFELT % 73))
                                            (QREFELT % 213))
                                           (QREFELT % 214))
                                          |xsubsr| (QREFELT % 211)))
                                   (EXIT
                                    (LETT |retv|
                                          (SPADCALL |retv|
                                                    (LIST
                                                     (VECTOR (QVELT |vi| 0)
                                                             (QVELT |vi| 1)
                                                             (SPADCALL
                                                              (QVELT |vi| 2)
                                                              |fullxr|
                                                              (QREFELT %
                                                                       215))))
                                                    (QREFELT % 218)))))
                                  (LETT #13# (CDR #13#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (PROGN (LETT #25# (CONS 0 |retv|)) (GO #27#))))))
                          (LETT |vrs|
                                (PROG2 (LETT #16# |v|)
                                    (QCDR #16#)
                                  (|check_union2| (QEQCAR #16# 1)
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|)))))))
                                                  (|Union|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |op|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |ram|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|))))
                                                     (|:| |expart|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7)))))
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT % 6)
                                                            (|Expression|
                                                             (|Integer|))))))))
                                                  #16#)))
                          (EXIT
                           (PROGN
                            (LETT #25#
                                  (CONS 1
                                        (PROGN
                                         (LETT #14# NIL)
                                         (SEQ (LETT #15# |vrs|) G190
                                              (COND
                                               ((OR (ATOM #15#)
                                                    (PROGN
                                                     (LETT |i| (CAR #15#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #14#
                                                      (CONS
                                                       (|LODOF2;substitute|
                                                        (CONS 1
                                                              (SPADCALL |cxs|
                                                                        (QREFELT
                                                                         %
                                                                         210)))
                                                        |i| %)
                                                       #14#))))
                                              (LETT #15# (CDR #15#)) (GO G190)
                                              G191 (EXIT (NREVERSE #14#))))))
                            (GO #27#)))))))))
                    (EXIT
                     (COND
                      ((EQUAL |option| "split over k((x))")
                       (SEQ
                        (LETT |ric|
                              (PROG2
                                  (LETT #16#
                                        (|LODOF2;factor_riccati| |f|
                                         |factorizer| "alg factor" %))
                                  (QCDR #16#)
                                (|check_union2| (QEQCAR #16# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #16#)))
                        (LETT |r1|
                              (PROG2
                                  (LETT #18# (SPADCALL |ric| (QREFELT % 195)))
                                  (QCDR #18#)
                                (|check_union2| (QEQCAR #18# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT % 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #18#)))
                        (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| %))
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT % 219))
                           (PROGN
                            (LETT #25# (CONS 1 (LIST (CONS 0 |f|))))
                            (GO #27#)))
                          (#26#
                           (SEQ (LETT |lk| (SPADCALL |f| |rk| (QREFELT % 220)))
                                (EXIT
                                 (PROGN
                                  (LETT #25#
                                        (CONS 1
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #16#
                                                         (|LODOF2;factor_riccati|
                                                          |lk| |factorizer|
                                                          |option| %))
                                                   (QCDR #16#)
                                                 (|check_union2|
                                                  (QEQCAR #16# 1)
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|)))))))
                                                  (|Union|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |op|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |ram|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|))))
                                                     (|:| |expart|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7)))))
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT % 6)
                                                            (|Expression|
                                                             (|Integer|))))))))
                                                  #16#))
                                               (LIST (CONS 0 |rk|))
                                               (QREFELT % 221))))
                                  (GO #27#)))))))))
                      ((EQUAL |option| "all right factors")
                       (SEQ
                        (LETT |ric|
                              (PROG2
                                  (LETT #16#
                                        (|LODOF2;factor_riccati| |f|
                                         |factorizer| "all alg factors" %))
                                  (QCDR #16#)
                                (|check_union2| (QEQCAR #16# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #16#)))
                        (LETT |res| NIL)
                        (SEQ (LETT #17# |ric|) G190
                             (COND
                              ((OR (ATOM #17#)
                                   (PROGN (LETT |i| (CAR #17#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |rk|
                                    (|LODOF2;make_rightfactor| |f|
                                     (PROG2 (LETT #18# |i|)
                                         (QCDR #18#)
                                       (|check_union2| (QEQCAR #18# 1)
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT % 6)
                                                              (|Expression|
                                                               (|Integer|)))))
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT % 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT %
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT % 6)
                                                               (|Expression|
                                                                (|Integer|))))))
                                                       #18#))
                                     %))
                              (EXIT
                               (COND
                                ((SPADCALL |rk| |f| (QREFELT % 219))
                                 (LETT |res| (LIST (CONS 0 |f|))))
                                ('T
                                 (LETT |res|
                                       (SPADCALL |res| (LIST (CONS 0 |rk|))
                                                 (QREFELT % 221)))))))
                             (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (PROGN (LETT #25# (CONS 1 |res|)) (GO #27#)))))
                      (#26#
                       (COND
                        ((> (SPADCALL (QVELT |npf| 1) (QREFELT % 72)) 1)
                         (SEQ
                          (LETT |gr|
                                (SPADCALL
                                 (SPADCALL (QVELT |npf| 1) (QREFELT % 96))
                                 (QREFELT % 223)))
                          (LETT |npgr|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 12) 1
                                            (QREFELT % 55))
                                  (SPADCALL |gr| (QREFELT % 224))
                                  (QREFELT % 83))
                                 (QVELT |npf| 2) (QREFELT % 67)))
                          (LETT |f2r|
                                (QCDR
                                 (|LODOF2;factor_newton2| |f| |npgr| |np1| %)))
                          (LETT |v|
                                (|LODOF2;factor_riccati| |f2r| |factorizer|
                                 |option| %))
                          (EXIT
                           (COND
                            ((QEQCAR |v| 0) (PROGN (LETT #25# |v|) (GO #27#)))
                            (#26#
                             (SEQ (LETT |vrs| (QCDR |v|)) (LETT |res| NIL)
                                  (SEQ (LETT #19# |vrs|) G190
                                       (COND
                                        ((OR (ATOM #19#)
                                             (PROGN (LETT |i| (CAR #19#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((QEQCAR |i| 0)
                                           (SEQ
                                            (LETT |nt|
                                                  (VECTOR (QCDR |i|)
                                                          (SPADCALL
                                                           (QVELT |npf| 1)
                                                           (QREFELT % 72))
                                                          |gr|
                                                          (SPADCALL
                                                           (|spadConstant| %
                                                                           12)
                                                           1 (QREFELT % 55))))
                                            (EXIT
                                             (LETT |res|
                                                   (SPADCALL |res|
                                                             (LIST
                                                              (CONS 1 |nt|))
                                                             (QREFELT %
                                                                      221))))))
                                          ('T
                                           (LETT |res|
                                                 (SPADCALL |res| (LIST |i|)
                                                           (QREFELT %
                                                                    221)))))))
                                       (LETT #19# (CDR #19#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (PROGN
                                    (LETT #25# (CONS 1 |res|))
                                    (GO #27#)))))))))
                        (#26#
                         (SEQ
                          (LETT |n|
                                (QVELT
                                 (SPADCALL (SPADCALL |slop| (QREFELT % 53))
                                           (SPADCALL |slop| (QREFELT % 51))
                                           (QREFELT % 180))
                                 0))
                          (LETT |coefr|
                                (SPADCALL
                                 (SPADCALL (QVELT |npf| 1) 0 (QREFELT % 73))
                                 (QREFELT % 213)))
                          (LETT |ror|
                                (|LODOF2;ramification_of| |f|
                                 (SPADCALL |coefr| |n| (QREFELT % 225))
                                 (SPADCALL |slop| (QREFELT % 51)) %))
                          (LETT |exp|
                                (SPADCALL
                                 (SPADCALL
                                  (- 1
                                     (* |n| (SPADCALL |slop| (QREFELT % 53))))
                                  (SPADCALL |slop| (QREFELT % 51))
                                  (QREFELT % 49))
                                 (QREFELT % 125)))
                          (LETT |tosub|
                                (SPADCALL (SPADCALL |slop| (QREFELT % 51))
                                          (SPADCALL |coefr| |exp|
                                                    (QREFELT % 225))
                                          (QREFELT % 226)))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 12) 1
                                            (QREFELT % 55))
                                  (SPADCALL |tosub| (QREFELT % 224))
                                  (QREFELT % 83))
                                 (QVELT |npf| 2) (QREFELT % 67)))
                          (LETT |np| (|LODOF2;newtonpolygon| |ror| %))
                          (SEQ (LETT #21# |np|) G190
                               (COND
                                ((OR (ATOM #21#)
                                     (PROGN (LETT |i| (CAR #21#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (QVELT |i| 1)
                                             (SPADCALL
                                              (SPADCALL |slop| (QREFELT % 53))
                                              (QREFELT % 102))
                                             (QREFELT % 107))
                                   (LETT |lns| |i|)))))
                               (LETT #21# (CDR #21#)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |f2r|
                                (QCDR
                                 (|LODOF2;factor_newton2| |ror| |r| |lns| %)))
                          (LETT |v|
                                (|LODOF2;factor_riccati| |f2r| |factorizer|
                                 |option| %))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL |coefr| |n| (QREFELT % 225))
                                 (SPADCALL |slop| (QREFELT % 51))
                                 (QREFELT % 55)))
                          (EXIT
                           (COND
                            ((QEQCAR |v| 0)
                             (SEQ (LETT |vsp| (QCDR |v|))
                                  (LETT |res_sp|
                                        (PROGN
                                         (LETT #22# NIL)
                                         (SEQ (LETT #23# |vsp|) G190
                                              (COND
                                               ((OR (ATOM #23#)
                                                    (PROGN
                                                     (LETT |i| (CAR #23#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #22#
                                                      (CONS
                                                       (VECTOR (QVELT |i| 0)
                                                               (SPADCALL |r|
                                                                         (SPADCALL
                                                                          (|spadConstant|
                                                                           %
                                                                           12)
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           55))
                                                                         (QVELT
                                                                          |i|
                                                                          1)
                                                                         (QREFELT
                                                                          %
                                                                          82))
                                                               (QVELT |i| 2))
                                                       #22#))))
                                              (LETT #23# (CDR #23#)) (GO G190)
                                              G191 (EXIT (NREVERSE #22#)))))
                                  (EXIT
                                   (PROGN
                                    (LETT #25# (CONS 0 |res_sp|))
                                    (GO #27#)))))
                            (#26#
                             (SEQ (LETT |vrs| (QCDR |v|)) (LETT |res| NIL)
                                  (SEQ (LETT #24# |vrs|) G190
                                       (COND
                                        ((OR (ATOM #24#)
                                             (PROGN (LETT |i| (CAR #24#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (COND
                                         ((QEQCAR |i| 0)
                                          (LETT |nt|
                                                (VECTOR (QCDR |i|) 1
                                                        (|spadConstant| % 19)
                                                        |r|)))
                                         ('T
                                          (SEQ (LETT |ir| (QCDR |i|))
                                               (EXIT
                                                (LETT |nt|
                                                      (VECTOR (QVELT |ir| 0)
                                                              (QVELT |ir| 1)
                                                              (QVELT |ir| 2)
                                                              (SPADCALL |r|
                                                                        (SPADCALL
                                                                         (|spadConstant|
                                                                          % 12)
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          55))
                                                                        (QVELT
                                                                         |ir|
                                                                         3)
                                                                        (QREFELT
                                                                         %
                                                                         82))))))))
                                        (EXIT
                                         (LETT |res|
                                               (SPADCALL |res|
                                                         (LIST (CONS 1 |nt|))
                                                         (QREFELT % 221)))))
                                       (LETT #24# (CDR #24#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (PROGN
                                    (LETT #25# (CONS 1 |res|))
                                    (GO #27#)))))))))))))))))))
          #27# (EXIT #25#)))) 

(SDEFUN |LODOF2;testfr;LodoMSU;32|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|Union|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))))
        (|LODOF2;factor_riccati| (|LODOF2;convertL3toLL| |f| %) |factorizer|
         |option| %)) 

(SDEFUN |LODOF2;substitute|
        ((|a|
          (|Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
         (|f|
          (|Union|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
         (%
          (|Union|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|new_mon|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|fr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#1=#:G486 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |new_mon| (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 34)))
            (COND
             ((QEQCAR |a| 0)
              (LETT |new_mon|
                    (SPADCALL |new_mon|
                              (|LODOF2;convertL3toLL|
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT % 229))
                                         (QREFELT % 230))
                               %)
                              (QREFELT % 35))))
             (#2='T
              (LETT |new_mon|
                    (SPADCALL |new_mon| (SPADCALL (QCDR |a|) (QREFELT % 196))
                              (QREFELT % 35)))))
            (COND ((QEQCAR |f| 0) (LETT |ftmp| (QCDR |f|)))
                  (#2#
                   (SEQ (LETT |fr| (QCDR |f|)) (LETT |ftmp| (QVELT |fr| 0))
                        (EXIT
                         (LETT |new_mon|
                               (|LODOF2;ramification_of| |new_mon|
                                (SPADCALL (QVELT |fr| 3) (QREFELT % 187))
                                (SPADCALL (QVELT |fr| 3) (QREFELT % 72))
                                %))))))
            (LETT |res| (|spadConstant| % 18))
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| % 18) (QREFELT % 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 37)))
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT % 41)))
                      (LETT |res|
                            (SPADCALL |res|
                                      (SPADCALL |lc|
                                                (SPADCALL |new_mon| |dg|
                                                          (QREFELT % 231))
                                                (QREFELT % 156))
                                      (QREFELT % 35)))
                      (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 44)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((QEQCAR |f| 0) (PROGN (LETT #1# (CONS 0 |res|)) (GO #3=#:G485)))
              (#2#
               (SEQ (LETT |fr| (QCDR |f|))
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (VECTOR |res| (QVELT |fr| 1) (QVELT |fr| 2)
                                          (QVELT |fr| 3))))
                      (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsb;ULodoLodo;34|
        ((|a|
          (|Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
         (|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG ((#1=#:G72 NIL))
               (PROG2
                   (LETT #1#
                         (|LODOF2;substitute| |a|
                          (CONS 0 (|LODOF2;convertL3toLL| |f| %)) %))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LinearOrdinaryDifferentialOperator3|
                                  (|Expression| (|Integer|))
                                  (|UnivariateTaylorSeries|
                                   (|Expression| (|Integer|)) (QREFELT % 6)
                                   (QREFELT % 7))
                                  (|UnivariateLaurentSeries|
                                   (|Expression| (|Integer|)) (QREFELT % 6)
                                   (QREFELT % 7)))
                                 (|Union|
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) (QREFELT % 6)
                                    (QREFELT % 7))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) (QREFELT % 6)
                                    (QREFELT % 7)))
                                  (|Record|
                                   (|:| |ope|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT % 6) (QREFELT % 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT % 6) (QREFELT % 7))))
                                   (|:| |dext| (|PositiveInteger|))
                                   (|:| |alpha| (|Expression| (|Integer|)))
                                   (|:| |rami|
                                        (|UnivariatePolynomial| (QREFELT % 6)
                                                                (|Expression|
                                                                 (|Integer|))))))
                                 #1#)))) 

(SDEFUN |LODOF2;ramification_of|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)))
         (|coefr| (|Expression| (|Integer|))) (|n| (|PositiveInteger|))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((#2=#:G501 NIL)
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|mlc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp| #1#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |coefr| (|spadConstant| % 12) (QREFELT % 234))
              (COND ((EQL |n| 1) (PROGN (LETT #2# |f|) (GO #3=#:G500))))))
            (LETT |res| (|spadConstant| % 18)) (LETT |ftmp| |f|)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| % 18) (QREFELT % 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 37)))
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT % 41)))
                      (LETT |mlc|
                            (SPADCALL
                             (CONS #'|LODOF2;ramification_of!0|
                                   (VECTOR % |coefr|))
                             |lc| (QREFELT % 236)))
                      (LETT |mlc| (SPADCALL |mlc| |n| (QREFELT % 237)))
                      (LETT |extra|
                            (SPADCALL (SPADCALL |mlc| |dg| (QREFELT % 34))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 1 |n| (QREFELT % 49)) |dg|
                                         (QREFELT % 238))
                                        (QREFELT % 239))
                                       (QREFELT % 188))
                                      (QREFELT % 147)))
                      (LETT |res| (SPADCALL |res| |extra| (QREFELT % 35)))
                      (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 44)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL (EXPT |n| (SPADCALL |f| (QREFELT % 41))) |res|
                       (QREFELT % 240)))))
          #3# (EXIT #2#)))) 

(SDEFUN |LODOF2;ramification_of!0| ((|x| NIL) ($$ NIL))
        (PROG (|coefr| %)
          (LETT |coefr| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |coefr| |x| (QREFELT % 225)))))) 

(SDEFUN |LODOF2;testro;LodoEPiLodo;36|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|coefr| (|Expression| (|Integer|))) (|n| (|PositiveInteger|))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;ramification_of| (|LODOF2;convertL3toLL| |f| %) |coefr| |n| %)) 

(SDEFUN |LODOF2;factor_op|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|Union|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))))
        (SPROG
         ((|fnr|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))))
          (#1=#:G523 NIL) (#2=#:G505 NIL) (|i| NIL) (#3=#:G524 NIL)
          (#4=#:G506 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#5=#:G522 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fnr| (|LODOF2;factor_newton| |f| |factorizer| |option| %))
            (EXIT
             (COND
              ((EQUAL |option| "semireg")
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |i| NIL) (LETT #1# |fnr|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #2#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      %))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (|List|
                                                              (|Record|
                                                               (|:| |op|
                                                                    (|LinearOrdinaryDifferentialOperator3|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (|UnivariateTaylorSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       % 6)
                                                                      (QREFELT
                                                                       % 7))
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       % 6)
                                                                      (QREFELT
                                                                       % 7))))
                                                               (|:| |ram|
                                                                    (|UnivariatePolynomial|
                                                                     (QREFELT %
                                                                              6)
                                                                     (|Expression|
                                                                      (|Integer|))))
                                                               (|:| |expart|
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT %
                                                                              6)
                                                                     (QREFELT %
                                                                              7)))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       % 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       % 6)
                                                                      (QREFELT
                                                                       % 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         % 6)
                                                                        (QREFELT
                                                                         % 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         % 6)
                                                                        (QREFELT
                                                                         %
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        % 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #2#))
                                           (QREFELT % 218)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (PROGN (LETT #5# (CONS 0 |res|)) (GO #6=#:G521)))))
              ('T
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |i| NIL) (LETT #3# |fnr|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #4#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      %))
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 1)
                                                             (|List|
                                                              (|Union|
                                                               (|LinearOrdinaryDifferentialOperator3|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (|UnivariateTaylorSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT % 6)
                                                                 (QREFELT % 7))
                                                                (|UnivariateLaurentSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT % 6)
                                                                 (QREFELT %
                                                                          7)))
                                                               (|Record|
                                                                (|:| |ope|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))))
                                                                (|:| |dext|
                                                                     (|PositiveInteger|))
                                                                (|:| |alpha|
                                                                     (|Expression|
                                                                      (|Integer|)))
                                                                (|:| |rami|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       % 6)
                                                                      (|Expression|
                                                                       (|Integer|)))))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        % 6)
                                                                       (QREFELT
                                                                        % 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       % 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       % 6)
                                                                      (QREFELT
                                                                       % 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         % 6)
                                                                        (QREFELT
                                                                         % 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         % 6)
                                                                        (QREFELT
                                                                         %
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        % 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #4#))
                                           (QREFELT % 221)))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (PROGN (LETT #5# (CONS 1 |res|)) (GO #6#)))))))))
          #6# (EXIT #5#)))) 

(SDEFUN |LODOF2;testfo;LodoMSU;38|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|Union|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))))
        (|LODOF2;factor_op| (|LODOF2;convertL3toLL| |f| %) |factorizer|
         |option| %)) 

(SDEFUN |LODOF2;make_rightfactor|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|ric|
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG ((|d| (|PositiveInteger|)) (#1=#:G534 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |d| (SPADCALL (QVELT |ric| 3) (QREFELT % 72)))
                      (LETT |d| (* |d| (QVELT |ric| 1)))
                      (COND
                       ((EQL |d| (SPADCALL |f| (QREFELT % 41)))
                        (PROGN (LETT #1# |f|) (GO #2=#:G533))))
                      (EXIT (|LODOF2;lift_rightfactor| |d| |ric| %))))
                #2# (EXIT #1#)))) 

(SDEFUN |LODOF2;lift_rightfactor|
        ((|order| (|PositiveInteger|))
         (|ric|
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|cric| (|Expression| (|Integer|))) (|ram| (|NonNegativeInteger|))
          (|r|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|s|
           (|Vector|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#1=#:G621 NIL)
          (|rp|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|mindg| (|Integer|)) (#2=#:G622 NIL) (#3=#:G623 NIL)
          (|sysram|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (|nn| (|Stream| (|NonNegativeInteger|))) (#4=#:G624 NIL)
          (#5=#:G625 NIL)
          (|cst|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (#6=#:G626 NIL) (#7=#:G627 NIL)
          (|system|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#8=#:G628 NIL) (#9=#:G629 NIL)
          (|pa| (|Vector| (|Expression| (|Integer|)))) (#10=#:G630 NIL)
          (#11=#:G631 NIL)
          (|ser|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#12=#:G632 NIL)
          (|nsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#13=#:G633 NIL) (#14=#:G634 NIL) (#15=#:G635 NIL) (#16=#:G636 NIL)
          (|ll|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#17=#:G637 NIL) (#18=#:G638 NIL)
          (|denm|
           (|SquareMatrix| |order|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
          (#19=#:G639 NIL) (#20=#:G640 NIL)
          (|nums|
           (|List|
            (|SquareMatrix| |order|
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|))))
          (#21=#:G641 NIL) (|j| NIL) (#22=#:G642 NIL) (|k| NIL)
          (#23=#:G643 NIL)
          (|den|
           #24=(|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                          |cen|))
          (#25=#:G644 NIL) (#26=#:G645 NIL)
          (|coefs|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#27=#:G646 NIL) (|num| #24#) (|i| NIL) (#28=#:G647 NIL)
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ (LETT |cric| (SPADCALL (QVELT |ric| 3) (QREFELT % 187)))
              (LETT |ram| (SPADCALL (QVELT |ric| 3) (QREFELT % 72)))
              (LETT |r|
                    (SPADCALL (SPADCALL (QVELT |ric| 0) 0 (QREFELT % 52))
                              (QREFELT % 210)))
              (LETT |rp| (|spadConstant| % 14))
              (LETT |s| (MAKEARR1 (+ |order| 1) (|spadConstant| % 20)))
              (SPADCALL |s| 1 (|spadConstant| % 14) (QREFELT % 244))
              (LETT |mindg| 0)
              (SEQ (LETT |i| 1) (LETT #1# |order|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |rp|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT % 245))
                                      (|spadConstant| % 20) |rp|
                                      (QREFELT % 246))
                            (SPADCALL |r| |rp| (QREFELT % 247))
                            (QREFELT % 215))
                           (SPADCALL |ram| (QREFELT % 75)) (QREFELT % 248)))
                    (SPADCALL |s| (+ |i| 1) |rp| (QREFELT % 244))
                    (EXIT
                     (LETT |mindg|
                           (MIN |mindg| (SPADCALL |rp| 0 (QREFELT % 42))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (CONS #'|LODOF2;lift_rightfactor!0| (VECTOR |mindg| %))
                        |s| (QREFELT % 251))
              (LETT |sysram|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 1) (LETT #3# |ram|) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (MAKEARR1 (+ |order| 1)
                                             (|spadConstant| % 20))
                                   #2#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |nn|
                    (SPADCALL (CONS #'|LODOF2;lift_rightfactor!1| %) 0
                              (QREFELT % 255)))
              (SEQ (LETT |i| 1) (LETT #4# |ram|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #5# (+ |order| 1)) G190
                          (COND ((|greater_SI| |j| #5#) (GO G191)))
                          (SEQ (LETT |ser| (SPADCALL |s| |j| (QREFELT % 256)))
                               (LETT |cst|
                                     (SPADCALL
                                      (CONS #'|LODOF2;lift_rightfactor!2|
                                            (VECTOR |cric| |ser| |ram| % |i|))
                                      |nn| (QREFELT % 261)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |sysram| |i| (QREFELT % 263)) |j|
                                 (SPADCALL |cst| (QREFELT % 118))
                                 (QREFELT % 244))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |system|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |i| 1) (LETT #7# |order|) G190
                          (COND ((|greater_SI| |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (MAKEARR1 (+ |order| 1)
                                             (|spadConstant| % 20))
                                   #6#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |pa|
                    (PROGN
                     (LETT #8# (GETREFV #29=(QVELT |ric| 1)))
                     (SEQ (LETT |i| 0) (LETT #9# (- #29# 1)) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #8# |i|
                                    (SPADCALL (QVELT |ric| 2) |i|
                                              (QREFELT % 225)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #8#))
              (SEQ (LETT |i| 1) (LETT #10# |ram|) G190
                   (COND ((|greater_SI| |i| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #11# (+ |order| 1)) G190
                          (COND ((|greater_SI| |j| #11#) (GO G191)))
                          (SEQ
                           (LETT |ser|
                                 (SPADCALL
                                  (SPADCALL |sysram| |i| (QREFELT % 263)) |j|
                                  (QREFELT % 256)))
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #12# (QVELT |ric| 1)) G190
                                 (COND ((|greater_SI| |k| #12#) (GO G191)))
                                 (SEQ
                                  (LETT |nsr|
                                        (SPADCALL
                                         (CONS #'|LODOF2;lift_rightfactor!3|
                                               (VECTOR |k| % |pa|))
                                         |ser| (QREFELT % 272)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL |system|
                                              (+ (* (- |i| 1) (QVELT |ric| 1))
                                                 |k|)
                                              (QREFELT % 263))
                                    |j| |nsr| (QREFELT % 244))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ll|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |j| 1) (LETT #14# |order|) G190
                          (COND ((|greater_SI| |j| #14#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS
                                   (PROGN
                                    (LETT #15# NIL)
                                    (SEQ (LETT |i| 1) (LETT #16# |order|) G190
                                         (COND
                                          ((|greater_SI| |i| #16#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #15#
                                                 (CONS (|spadConstant| % 20)
                                                       #15#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #15#))))
                                   #13#))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (SEQ (LETT |i| 1) (LETT #17# |order|) G190
                   (COND ((|greater_SI| |i| #17#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #18# |order|) G190
                          (COND ((|greater_SI| |j| #18#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL (SPADCALL |ll| |i| (QREFELT % 274)) |j|
                                      (SPADCALL
                                       (SPADCALL |system| |i| (QREFELT % 263))
                                       |j| (QREFELT % 256))
                                      (QREFELT % 275))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |denm|
                    (SPADCALL (SPADCALL |ll| (QREFELT % 277))
                              (|compiledLookupCheck| '|squareMatrix|
                                                     (LIST '%
                                                           (LIST '|Matrix|
                                                                 (LIST
                                                                  '|UnivariateLaurentSeries|
                                                                  (LIST
                                                                   '|Expression|
                                                                   (LIST
                                                                    '|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7))))
                                                     (|SquareMatrix| |order|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (ELT % 6)
                                                                      (ELT %
                                                                           7))))))
              (LETT |nums|
                    (PROGN
                     (LETT #19# NIL)
                     (SEQ (LETT |i| 1) (LETT #20# |order|) G190
                          (COND ((|greater_SI| |i| #20#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|empty| (LIST '%)
                                                           (|SquareMatrix|
                                                            |order|
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (ELT % 6)
                                                             (ELT % 7)))))
                                   #19#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #19#)))))
              (SEQ (LETT |i| 1) (LETT #21# |order|) G190
                   (COND ((|greater_SI| |i| #21#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #22# |order|) G190
                         (COND ((|greater_SI| |j| #22#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |k| 1) (LETT #23# |order|) G190
                                (COND ((|greater_SI| |k| #23#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL |k| |i|)
                                    (SPADCALL
                                     (SPADCALL |ll| |j| (QREFELT % 274)) |k|
                                     (SPADCALL
                                      (SPADCALL |system| |j| (QREFELT % 263))
                                      (+ |order| 1) (QREFELT % 256))
                                     (QREFELT % 275)))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL |ll| |j| (QREFELT % 274)) |k|
                                     (SPADCALL
                                      (SPADCALL |system| |j| (QREFELT % 263))
                                      |k| (QREFELT % 256))
                                     (QREFELT % 275))))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nums| |i|
                               (SPADCALL (SPADCALL |ll| (QREFELT % 277))
                                         (|compiledLookupCheck| '|squareMatrix|
                                                                (LIST '%
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|UnivariateLaurentSeries|
                                                                        (LIST
                                                                         '|Expression|
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (QREFELT
                                                                         % 6)
                                                                        (QREFELT
                                                                         %
                                                                         7))))
                                                                (|SquareMatrix|
                                                                 |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT % 6)
                                                                  (ELT % 7)))))
                               (|compiledLookupCheck| '|setelt!|
                                                      (LIST
                                                       (LIST '|SquareMatrix|
                                                             |order|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7)))
                                                       '% (LIST '|Integer|)
                                                       (LIST '|SquareMatrix|
                                                             |order|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))))
                                                      (|List|
                                                       (|SquareMatrix| |order|
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (ELT %
                                                                             6)
                                                                        (ELT %
                                                                             7))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |den|
                    (SPADCALL |denm|
                              (|compiledLookupCheck| '|minordet|
                                                     (LIST
                                                      (LIST
                                                       '|UnivariateLaurentSeries|
                                                       (LIST '|Expression|
                                                             (LIST '|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))
                                                      '%)
                                                     (|SquareMatrix| |order|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (ELT % 6)
                                                                      (ELT %
                                                                           7))))))
              (LETT |coefs|
                    (PROGN
                     (LETT #25# NIL)
                     (SEQ (LETT |i| 1) (LETT #26# |order|) G190
                          (COND ((|greater_SI| |i| #26#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #25# (CONS (|spadConstant| % 20) #25#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #25#)))))
              (SEQ (LETT |i| 1) (LETT #27# |order|) G190
                   (COND ((|greater_SI| |i| #27#) (GO G191)))
                   (SEQ
                    (LETT |num|
                          (SPADCALL
                           (SPADCALL |nums| |i|
                                     (|compiledLookupCheck| '|elt|
                                                            (LIST
                                                             (LIST
                                                              '|SquareMatrix|
                                                              |order|
                                                              (LIST
                                                               '|UnivariateLaurentSeries|
                                                               (LIST
                                                                '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7)))
                                                             '%
                                                             (LIST '|Integer|))
                                                            (|List|
                                                             (|SquareMatrix|
                                                              |order|
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (ELT % 6)
                                                               (ELT % 7))))))
                           (|compiledLookupCheck| '|minordet|
                                                  (LIST
                                                   (LIST
                                                    '|UnivariateLaurentSeries|
                                                    (LIST '|Expression|
                                                          (LIST '|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   '%)
                                                  (|SquareMatrix| |order|
                                                                  (|UnivariateLaurentSeries|
                                                                   (|Expression|
                                                                    (|Integer|))
                                                                   (ELT % 6)
                                                                   (ELT %
                                                                        7))))))
                    (EXIT
                     (SPADCALL |coefs| |i|
                               (SPADCALL (SPADCALL |num| |den| (QREFELT % 249))
                                         (QREFELT % 210))
                               (QREFELT % 275))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (|spadConstant| % 14) |order| (QREFELT % 34)))
              (SEQ (LETT |i| 0) (LETT #28# (- |order| 1)) G190
                   (COND ((|greater_SI| |i| #28#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |coefs| (+ |i| 1)
                                                (QREFELT % 111))
                                      |i| (QREFELT % 34))
                                     (QREFELT % 35)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;lift_rightfactor!3| ((|x| NIL) ($$ NIL))
        (PROG (|pa| % |k|)
          (LETT |pa| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|psq| NIL) (#1=#:G569 NIL))
                   (SEQ (LETT |psq| (SPADCALL |pa| |x| (QREFELT % 267)))
                        (EXIT
                         (COND
                          ((SPADCALL |psq| (CONS 1 "failed") (QREFELT % 268))
                           |x|)
                          ('T
                           (SPADCALL
                            (SPADCALL
                             (PROG2 (LETT #1# |psq|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|Vector|
                                                (|Fraction| (|Integer|)))
                                               (|Union|
                                                (|Vector|
                                                 (|Fraction| (|Integer|)))
                                                "failed")
                                               #1#))
                             |k| (QREFELT % 270))
                            (QREFELT % 239))))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!2| ((|x| NIL) ($$ NIL))
        (PROG (|i| % |ram| |ser| |cric|)
          (LETT |i| (QREFELT $$ 4))
          (LETT % (QREFELT $$ 3))
          (LETT |ram| (QREFELT $$ 2))
          (LETT |ser| (QREFELT $$ 1))
          (LETT |cric| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|dg| NIL))
                   (SEQ
                    (LETT |dg|
                          (SPADCALL
                           (SPADCALL |i| (|spadConstant| % 170)
                                     (QREFELT % 134))
                           (SPADCALL |x| |ram| (QREFELT % 257))
                           (QREFELT % 130)))
                    (EXIT
                     (CONS |x|
                           (SPADCALL (SPADCALL |ser| |dg| (QREFELT % 54))
                                     (SPADCALL |cric| |x| (QREFELT % 258))
                                     (QREFELT % 76)))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!1| ((|x| NIL) (% NIL))
        (SPADCALL |x| (|spadConstant| % 170) (QREFELT % 252))) 

(SDEFUN |LODOF2;lift_rightfactor!0| ((|x| NIL) ($$ NIL))
        (PROG (% |mindg|)
          (LETT % (QREFELT $$ 1))
          (LETT |mindg| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (|spadConstant| % 12) |mindg| (QREFELT % 146))
                      (QREFELT % 249)))))) 

(SDEFUN |LODOF2;same_charclass?|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|g|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (% (|Boolean|)))
        (SPROG
         ((|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|r11|
           #1=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|r21| #1#)
          (|c| #2=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c2| #2#) (|d| (|NonNegativeInteger|))
          (|dm1| (|NonNegativeInteger|)) (|fd| (|Expression| (|Integer|)))
          (|cx| (|Expression| (|Integer|))) (#3=#:G688 NIL) (|j| NIL)
          (#4=#:G689 NIL)
          (|r|
           (|List|
            (|List|
             (|Record|
              (|:| |point|
                   (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
              (|:| |slope| (|Fraction| (|Integer|)))
              (|:| |npoly|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#5=#:G674 NIL) (#6=#:G73 NIL)
          (|gg|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|rr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|gr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#7=#:G72 NIL)
          (|ff|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ffnp|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|fff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|i| NIL) (#8=#:G690 NIL) (#9=#:G687 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT % 41))
                        (SPADCALL |g| (QREFELT % 41)) (QREFELT % 203))
              (PROGN (LETT #9# NIL) (GO #10=#:G686))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT % 37)) (|spadConstant| % 14)
                        (QREFELT % 278))
              (LETT |f|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 14)
                               (SPADCALL |f| (QREFELT % 37)) (QREFELT % 249))
                     |f| (QREFELT % 156)))))
            (COND
             ((SPADCALL (SPADCALL |g| (QREFELT % 37)) (|spadConstant| % 14)
                        (QREFELT % 278))
              (LETT |g|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 14)
                               (SPADCALL |g| (QREFELT % 37)) (QREFELT % 249))
                     |g| (QREFELT % 156)))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT % 41)) 1)
              (SEQ
               (LETT |il|
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| |g| (QREFELT % 162)) 0
                                (QREFELT % 52))
                      0 (QREFELT % 209)))
               (EXIT
                (PROGN
                 (LETT #9#
                       (COND
                        ((EQL (SPADCALL |il| 0 (QREFELT % 42)) 0)
                         (SPADCALL (SPADCALL |il| 0 (QREFELT % 54))
                                   (QREFELT % 78)))
                        ('T NIL)))
                 (GO #10#))))))
            (LETT |r|
                  (SPADCALL (CONS (|function| |LODOF2;newtonpolygon|) %)
                            (LIST |f| |g|) (QREFELT % 286)))
            (LETT |r11|
                  (SPADCALL (SPADCALL |r| 1 (QREFELT % 287)) 1
                            (QREFELT % 191)))
            (LETT |r21|
                  (SPADCALL (SPADCALL |r| 2 (QREFELT % 287)) 1
                            (QREFELT % 191)))
            (COND
             ((SPADCALL (QVELT |r11| 1) (|spadConstant| % 65) (QREFELT % 107))
              (SEQ (LETT |c| (QVELT |r11| 2)) (LETT |c2| (QVELT |r21| 2))
                   (LETT |d| (SPADCALL |c| (QREFELT % 72)))
                   (LETT |dm1| (- |d| 1))
                   (LETT |fd| (SPADCALL |d| (QREFELT % 75)))
                   (LETT |cx|
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| |dm1| (QREFELT % 73))
                                    (SPADCALL |c2| |dm1| (QREFELT % 73))
                                    (QREFELT % 74))
                          |fd| (QREFELT % 76)))
                   (COND
                    ((NULL (SPADCALL |cx| (QREFELT % 78)))
                     (PROGN (LETT #9# NIL) (GO #10#))))
                   (EXIT
                    (LETT |r|
                          (LIST
                           (CONS
                            (VECTOR (QVELT |r11| 0) (QVELT |r11| 1)
                                    (SPADCALL (QVELT |r11| 2)
                                              (SPADCALL (|spadConstant| % 12) 1
                                                        (QREFELT % 55))
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| % 12)
                                                         1 (QREFELT % 55))
                                               (SPADCALL |cx| (QREFELT % 224))
                                               (QREFELT % 83))
                                              (QREFELT % 82)))
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |j| 2)
                                  (LETT #4#
                                        (LENGTH
                                         (SPADCALL |r| 1 (QREFELT % 287))))
                                  G190
                                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |r| 1 (QREFELT % 287))
                                            |j| (QREFELT % 191))
                                           #3#))))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                           (SPADCALL |r| 2 (QREFELT % 287))))))))
            (COND
             ((SPADCALL (SPADCALL |r| 1 (QREFELT % 287))
                        (SPADCALL |r| 2 (QREFELT % 287)) (QREFELT % 288))
              (PROGN (LETT #9# NIL) (GO #10#))))
            (LETT |gg|
                  (PROG2
                      (LETT #6#
                            (SPADCALL
                             (PROG2
                                 (LETT #5#
                                       (|LODOF2;factor_op| |g| |factorizer|
                                        "alg factor" %))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #5#))
                             (QREFELT % 195)))
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 1)
                                    (|Record|
                                     (|:| |ope|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT % 6) (QREFELT % 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT % 6) (QREFELT % 7))))
                                     (|:| |dext| (|PositiveInteger|))
                                     (|:| |alpha| (|Expression| (|Integer|)))
                                     (|:| |rami|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|)))))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                    #6#)))
            (LETT |rr|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |gg| 0) 0 (QREFELT % 52)) 0
                             (QREFELT % 209))
                   (QREFELT % 210)))
            (LETT |gr| (QVELT |gg| 3))
            (LETT |ff|
                  (PROG2
                      (LETT #7#
                            (|LODOF2;substitute| (CONS 1 |rr|)
                             (CONS 0
                                   (|LODOF2;ramification_of| |f|
                                    (SPADCALL |gr| (QREFELT % 187))
                                    (SPADCALL |gr| (QREFELT % 72)) %))
                             %))
                      (QCDR #7#)
                    (|check_union2| (QEQCAR #7# 0)
                                    (|LinearOrdinaryDifferentialOperator3|
                                     (|Expression| (|Integer|))
                                     (|UnivariateTaylorSeries|
                                      (|Expression| (|Integer|)) (QREFELT % 6)
                                      (QREFELT % 7))
                                     (|UnivariateLaurentSeries|
                                      (|Expression| (|Integer|)) (QREFELT % 6)
                                      (QREFELT % 7)))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                    #7#)))
            (LETT |ffnp| (|LODOF2;newtonpolygon| |ff| %))
            (COND
             ((SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT % 191)) 1)
                        (|spadConstant| % 65) (QREFELT % 66))
              (PROGN (LETT #9# NIL) (GO #10#))))
            (LETT |fff|
                  (SPADCALL
                   (|LODOF2;factorUP|
                    (SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT % 191)) 2)
                              (SPADCALL
                               (QVELT (SPADCALL |ffnp| 1 (QREFELT % 191)) 2)
                               (QREFELT % 187))
                              (QREFELT % 289))
                    |factorizer| %)
                   (QREFELT % 200)))
            (SEQ (LETT |i| NIL) (LETT #8# |fff|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (SPADCALL (QVELT |i| 1) (QREFELT % 72)) 1)
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL (QVELT |i| 1) 0 (QREFELT % 73))
                                  (SPADCALL (QVELT |i| 1) 1 (QREFELT % 73))
                                  (QREFELT % 76))
                        (QREFELT % 78))
                       (PROGN (LETT #9# 'T) (GO #10#))))))))
                 (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #10# (EXIT #9#)))) 

(SDEFUN |LODOF2;testsc;2LodoMB;42|
        ((|f|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|g|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariatePolynomial| |var|
                                                                         (|Expression|
                                                                          (|Integer|)))
                                                 (|Fraction|
                                                  (|UnivariatePolynomial| |var|
                                                                          (|Expression|
                                                                           (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (% (|Boolean|)))
        (|LODOF2;same_charclass?| (|LODOF2;convertL3toLL| |f| %)
         (|LODOF2;convertL3toLL| |g| %) |factorizer| %)) 

(SDEFUN |LODOF2;try_factorization|
        ((|r|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|max_order| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
         (|sng|
          (|Record|
           (|:| |point| (|Union| (|Expression| (|Integer|)) #1="infinity"))
           (|:| |lpf|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dxt| (|PositiveInteger|))))
         (|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|eb| (|Integer|)) (|min_order| (|Integer|)) (|option| (|String|))
         (%
          (|Union|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
           "failed")))
        (SPROG
         ((|i| NIL) (#2=#:G741 NIL) (#3=#:G742 NIL) (#4=#:G743 NIL)
          (#5=#:G744 NIL) (#6=#:G745 NIL) (#7=#:G746 NIL) (#8=#:G747 NIL)
          (|fls|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#9=#:G748 NIL) (|ff| NIL) (#10=#:G749 NIL) (#11=#:G750 NIL)
          (|fc| NIL) (#12=#:G751 NIL)
          (|flst|
           (|List|
            (|List|
             (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                       |cen|))))
          (|n| (|Integer|))
          (|tf2|
           (|Union|
            (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            #13="failed"))
          (#14=#:G711 NIL)
          (|flm|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|j| NIL) (#15=#:G752 NIL)
          (#16=#:G718
           #17=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#18=#:G716 #17#) (#19=#:G717 NIL) (|sr| #17#)
          (|zero_sing| (|Boolean|))
          (|old_x| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|))
          (|lcn|
           #20=(|Fraction|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd| #20#)
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|ftmp|
           #21=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#22=#:G720 NIL) (|srl| #21#)
          (|re|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#23=#:G740 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (MAX (SPADCALL |r| (QREFELT % 41)) |min_order|))
                 (LETT #2# |max_order|) G190 (COND ((> |i| #2#) (GO G191)))
                 (SEQ (LETT |fls| (|LODOF2;flist| |r| |i| %)) (LETT |n| 0)
                      (SEQ (LETT |ff| NIL) (LETT #3# |fls|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |ff| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |fc| NIL) (LETT #4# |ff|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |fc| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |n|
                                          (MIN |n|
                                               (SPADCALL |fc| 0
                                                         (QREFELT % 42))))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((< |n| 0)
                        (LETT |fls|
                              (PROGN
                               (LETT #5# NIL)
                               (SEQ (LETT |ff| NIL) (LETT #6# |fls|) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN (LETT |ff| (CAR #6#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #5#
                                            (CONS
                                             (PROGN
                                              (LETT #7# NIL)
                                              (SEQ (LETT |fc| NIL)
                                                   (LETT #8# |ff|) G190
                                                   (COND
                                                    ((OR (ATOM #8#)
                                                         (PROGN
                                                          (LETT |fc| (CAR #8#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #7#
                                                           (CONS
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (|spadConstant| %
                                                                              12)
                                                              (- |n|)
                                                              (QREFELT % 146))
                                                             |fc|
                                                             (QREFELT % 247))
                                                            #7#))))
                                                   (LETT #8# (CDR #8#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #7#))))
                                             #5#))))
                                    (LETT #6# (CDR #6#)) (GO G190) G191
                                    (EXIT (NREVERSE #5#)))))))
                      (LETT |flst|
                            (PROGN
                             (LETT #9# NIL)
                             (SEQ (LETT |ff| NIL) (LETT #10# |fls|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT |ff| (CAR #10#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #9#
                                          (CONS
                                           (PROGN
                                            (LETT #11# NIL)
                                            (SEQ (LETT |fc| NIL)
                                                 (LETT #12# |ff|) G190
                                                 (COND
                                                  ((OR (ATOM #12#)
                                                       (PROGN
                                                        (LETT |fc| (CAR #12#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #11#
                                                         (CONS
                                                          (SPADCALL |fc|
                                                                    (QREFELT %
                                                                             291))
                                                          #11#))))
                                                 (LETT #12# (CDR #12#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #11#))))
                                           #9#))))
                                  (LETT #10# (CDR #10#)) (GO G190) G191
                                  (EXIT (NREVERSE #9#)))))
                      (LETT |n| (LENGTH |flst|))
                      (LETT |tf2|
                            (|LODOF2;try_factorization2| |flst| |n| |bound|
                             |eb| %))
                      (EXIT
                       (COND
                        ((SPADCALL |tf2| (CONS 1 "failed") (QREFELT % 293))
                         (SEQ
                          (LETT |flm|
                                (PROG2 (LETT #14# |tf2|)
                                    (QCDR #14#)
                                  (|check_union2| (QEQCAR #14# 0)
                                                  (|List|
                                                   (|SparseUnivariatePolynomial|
                                                    (|Expression|
                                                     (|Integer|))))
                                                  (|Union|
                                                   (|List|
                                                    (|SparseUnivariatePolynomial|
                                                     (|Expression|
                                                      (|Integer|))))
                                                   #13#)
                                                  #14#)))
                          (LETT |sr|
                                (PROGN
                                 (LETT #19# NIL)
                                 (SEQ (LETT |j| 0)
                                      (LETT #15# (- (LENGTH |flm|) 1)) G190
                                      (COND
                                       ((|greater_SI| |j| #15#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #16#
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |flm| (+ |j| 1)
                                                            (QREFELT % 295))
                                                  (QREFELT % 97))
                                                 (QREFELT % 229))
                                                (SPADCALL
                                                 (|spadConstant| % 296) |j|
                                                 (QREFELT % 297))
                                                (QREFELT % 298)))
                                         (COND
                                          (#19#
                                           (LETT #18#
                                                 (SPADCALL #18# #16#
                                                           (QREFELT % 299))))
                                          ('T
                                           (PROGN
                                            (LETT #18# #16#)
                                            (LETT #19# 'T)))))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#19# #18#)
                                       ('T (|spadConstant| % 22)))))
                          (LETT |sr|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 296)
                                           (SPADCALL |sr| (QREFELT % 26))
                                           (QREFELT % 302))
                                 |sr| (QREFELT % 298)))
                          (COND
                           ((EQUAL |option| "use adjoint")
                            (LETT |sr| (SPADCALL |sr| (QREFELT % 303)))))
                          (LETT |srl| (SPADCALL |sr| (QREFELT % 306)))
                          (LETT |zero_sing|
                                (COND
                                 ((QEQCAR (QVELT |sng| 0) 0)
                                  (SPADCALL
                                   (PROG2 (LETT #22# (QVELT |sng| 0))
                                       (QCDR #22#)
                                     (|check_union2| (QEQCAR #22# 0)
                                                     (|Expression| (|Integer|))
                                                     (|Union|
                                                      (|Expression|
                                                       (|Integer|))
                                                      #1#)
                                                     #22#))
                                   (|spadConstant| % 19) (QREFELT % 234)))
                                 ('T NIL)))
                          (COND
                           ((NULL |zero_sing|)
                            (SEQ (LETT |ftmp| |srl|)
                                 (LETT |srl| (|spadConstant| % 307))
                                 (LETT |old_x|
                                       (SPADCALL (|spadConstant| % 12) 1
                                                 (QREFELT % 55)))
                                 (LETT |newx|
                                       (COND
                                        ((SPADCALL (QVELT |sng| 0)
                                                   (CONS 1 "infinity")
                                                   (QREFELT % 309))
                                         (SPADCALL (|spadConstant| % 150)
                                                   |old_x| (QREFELT % 310)))
                                        ('T
                                         (SPADCALL
                                          (SPADCALL |old_x|
                                                    (SPADCALL
                                                     (PROG2
                                                         (LETT #22#
                                                               (QVELT |sng| 0))
                                                         (QCDR #22#)
                                                       (|check_union2|
                                                        (QEQCAR #22# 0)
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|Union|
                                                         (|Expression|
                                                          (|Integer|))
                                                         #1#)
                                                        #22#))
                                                     (QREFELT % 224))
                                                    (QREFELT % 83))
                                          (QREFELT % 229)))))
                                 (LETT |newd|
                                       (COND
                                        ((SPADCALL (QVELT |sng| 0)
                                                   (CONS 1 "infinity")
                                                   (QREFELT % 309))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |old_x| 2
                                                      (QREFELT % 311))
                                            (QREFELT % 229))
                                           (SPADCALL (QREFELT % 312))
                                           (QREFELT % 313))
                                          (QREFELT % 314)))
                                        ('T (SPADCALL (QREFELT % 312)))))
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL |ftmp|
                                                    (|spadConstant| % 307)
                                                    (QREFELT % 315)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |lc|
                                              (SPADCALL |ftmp|
                                                        (QREFELT % 316)))
                                        (LETT |dg|
                                              (SPADCALL |ftmp|
                                                        (QREFELT % 317)))
                                        (LETT |lcn|
                                              (|LODOF2;subsup|
                                               (SPADCALL |lc| (QREFELT % 29))
                                               |newx| %))
                                        (LETT |lcd|
                                              (|LODOF2;subsup|
                                               (SPADCALL |lc| (QREFELT % 27))
                                               |newx| %))
                                        (LETT |slc|
                                              (SPADCALL |lcn| |lcd|
                                                        (QREFELT % 302)))
                                        (LETT |srl|
                                              (SPADCALL |srl|
                                                        (SPADCALL |slc|
                                                                  (SPADCALL
                                                                   |newd| |dg|
                                                                   (QREFELT %
                                                                            318))
                                                                  (QREFELT %
                                                                           313))
                                                        (QREFELT % 319)))
                                        (EXIT
                                         (LETT |ftmp|
                                               (SPADCALL |ftmp|
                                                         (QREFELT % 320)))))
                                       NIL (GO G190) G191 (EXIT NIL))))))
                          (EXIT
                           (COND
                            ((SPADCALL |option| "use adjoint" (QREFELT % 321))
                             (SEQ
                              (LETT |re| (SPADCALL |f| |srl| (QREFELT % 322)))
                              (EXIT
                               (COND
                                ((> (SPADCALL |re| (QREFELT % 317)) 0)
                                 (PROGN
                                  (LETT #23#
                                        (CONS 0
                                              (LIST
                                               (SPADCALL |f| |re|
                                                         (QREFELT % 323))
                                               |re|)))
                                  (GO #24=#:G739)))))))
                            ('T
                             (SEQ
                              (COND
                               ((SPADCALL (QVELT |sng| 0) (CONS 1 "infinity")
                                          (QREFELT % 309))
                                (LETT |re|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 150)
                                                 (SPADCALL
                                                  (|spadConstant| % 12)
                                                  (SPADCALL |f|
                                                            (QREFELT % 317))
                                                  (QREFELT % 55))
                                                 (QREFELT % 310))
                                       (QREFELT % 324))))
                               ('T
                                (LETT |re|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 150)
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| % 12) 1
                                                    (QREFELT % 55))
                                                   (SPADCALL
                                                    (PROG2
                                                        (LETT #22#
                                                              (QVELT |sng| 0))
                                                        (QCDR #22#)
                                                      (|check_union2|
                                                       (QEQCAR #22# 0)
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|Union|
                                                        (|Expression|
                                                         (|Integer|))
                                                        #1#)
                                                       #22#))
                                                    (QREFELT % 224))
                                                   (QREFELT % 83))
                                                  (SPADCALL |f|
                                                            (QREFELT % 317))
                                                  (QREFELT % 67))
                                                 (QREFELT % 310))
                                       (QREFELT % 324)))))
                              (LETT |srl|
                                    (SPADCALL
                                     (SPADCALL |re|
                                               (SPADCALL |f| (QREFELT % 316))
                                               (QREFELT % 325))
                                     |srl| (QREFELT % 326)))
                              (LETT |srl|
                                    (SPADCALL |srl|
                                              (SPADCALL (|spadConstant| % 296)
                                                        (SPADCALL |srl|
                                                                  (QREFELT %
                                                                           316))
                                                        (QREFELT % 302))
                                              (QREFELT % 325)))
                              (LETT |re| (SPADCALL |f| |srl| (QREFELT % 327)))
                              (EXIT
                               (COND
                                ((> (SPADCALL |re| (QREFELT % 317)) 0)
                                 (PROGN
                                  (LETT #23#
                                        (CONS 0
                                              (LIST |re|
                                                    (SPADCALL |f| |re|
                                                              (QREFELT %
                                                                       328)))))
                                  (GO #24#))))))))))))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #24# (EXIT #23#)))) 

(SDEFUN |LODOF2;try_factorization2|
        ((|fl|
          (|List|
           (|List|
            (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                      |cen|))))
         (|n| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
         (|eb| (|Integer|))
         (%
          (|Union|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           "failed")))
        (SPROG
         ((|cb| (|Integer|)) (#1=#:G770 NIL) (|i| NIL) (#2=#:G771 NIL)
          (|eta| (|List| (|NonNegativeInteger|))) (|cnt| (|Integer|))
          (|vdim| (|NonNegativeInteger|)) (#3=#:G772 NIL) (|f| NIL)
          (#4=#:G773 NIL) (#5=#:G774 NIL) (|g| NIL) (#6=#:G775 NIL)
          (|lv|
           (|List|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
          (|hps|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#7=#:G769 NIL) (|acc| (|Integer|)) (|nstep| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cb|
                  (+
                   (SPADCALL
                    (SPADCALL |bound| (- (LENGTH |fl|) 1) (QREFELT % 330))
                    (QREFELT % 184))
                   |eb|))
            (LETT |eta|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                        (COND ((|greater_SI| |i| #2#) (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS |cb| #1#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (LETT |cnt| (* (LENGTH |fl|) (+ |cb| 1)))
            (LETT |vdim| (LENGTH (|SPADfirst| |fl|)))
            (LETT |acc| (|quotient_INT| (+ (+ |cnt| |vdim|) 3) |vdim|))
            (LETT |nstep|
                  (SPADCALL
                   (SPADCALL (SPADCALL |acc| 2 (QREFELT % 331)) 3
                             (QREFELT % 49))
                   (QREFELT % 184)))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |lv|
                         (PROGN
                          (LETT #3# NIL)
                          (SEQ (LETT |f| NIL) (LETT #4# |fl|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |f| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SPADCALL
                                         (PROGN
                                          (LETT #5# NIL)
                                          (SEQ (LETT |g| NIL) (LETT #6# |f|)
                                               G190
                                               (COND
                                                ((OR (ATOM #6#)
                                                     (PROGN
                                                      (LETT |g| (CAR #6#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #5#
                                                       (CONS
                                                        (SPADCALL
                                                         (|LODOF2;convertUTStoUP|
                                                          |g| |acc| %)
                                                         (QREFELT % 96))
                                                        #5#))))
                                               (LETT #6# (CDR #6#)) (GO G190)
                                               G191 (EXIT (NREVERSE #5#))))
                                         (QREFELT % 333))
                                        #3#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #3#)))))
                   (LETT |hps| (SPADCALL |lv| |eta| |acc| (QREFELT % 338)))
                   (EXIT
                    (COND
                     ((EQL (ANCOLS |hps|) 1)
                      (PROGN
                       (LETT #7#
                             (CONS 0
                                   (SPADCALL (SPADCALL |hps| 1 (QREFELT % 339))
                                             (QREFELT % 340))))
                       (GO #8=#:G768)))
                     ((EQL (ANCOLS |hps|) 0)
                      (PROGN (LETT #7# (CONS 1 "failed")) (GO #8#)))
                     ('T
                      (SEQ (LETT |acc| (+ |acc| |nstep|))
                           (EXIT
                            (LETT |nstep|
                                  (+
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 2 (QREFELT % 49))
                                              |nstep| (QREFELT % 341))
                                    (QREFELT % 182))
                                   2))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #7#)))) 

(SDEFUN |LODOF2;flist|
        ((|r|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|order| (|Integer|))
         (%
          (|List|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))))
        (SPROG
         ((|i| NIL) (#1=#:G783 NIL)
          (|p|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#2=#:G784 NIL) (|j| NIL) (#3=#:G785 NIL)
          (|res|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|)))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #1# |order|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |p| (|LODOF2;xDn_modr| |i| |r| %))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (LIST
                                          (PROGN
                                           (LETT #2# NIL)
                                           (SEQ (LETT |j| 0)
                                                (LETT #3#
                                                      (-
                                                       (SPADCALL |r|
                                                                 (QREFELT %
                                                                          41))
                                                       1))
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #3#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |p| |j|
                                                                   (QREFELT %
                                                                            52))
                                                         #2#))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#)))))
                                         (QREFELT % 342)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;xDn_modr|
        ((|n| (|Integer|))
         (|r|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((#1=#:G789 NIL)
          (|a|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|coefa|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| (SPADCALL |r| (QREFELT % 41)))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| % 14) |n| (QREFELT % 34)))
               (GO #2=#:G788))))
            (LETT |a| (|LODOF2;xDn_modr| (- |n| 1) |r| %))
            (LETT |coefa|
                  (SPADCALL |a| (- (SPADCALL |r| (QREFELT % 41)) 1)
                            (QREFELT % 52)))
            (EXIT
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 34)) |a|
                         (QREFELT % 158))
               (SPADCALL |a| (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 34))
                         (QREFELT % 158))
               (QREFELT % 35))
              (SPADCALL |coefa| |r| (QREFELT % 156)) (QREFELT % 162)))))
          #2# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
           (|List| (|Expression| (|Integer|)))))
         (|y| (|List| (|Expression| (|Integer|))))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|b|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|i| NIL) (#1=#:G808 NIL) (#2=#:G807 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((<= (SPADCALL |f| (QREFELT % 317)) 1)
              (PROGN (LETT #2# (LIST |f|)) (GO #3=#:G806))))
            (LETT |factorizer2|
                  (CONS #'|LODOF2;factor;LodoMLL;47!0|
                        (VECTOR |factorizer| |y|)))
            (LETT |b| (|LODOF2;factor_global| |f| |factorizer2| %))
            (EXIT
             (COND ((EQL (LENGTH |b|) 1) (PROGN (LETT #2# |b|) (GO #3#)))
                   ('T
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| 1 (QREFELT % 344))
                                      |factorizer| |y| (QREFELT % 347))
                            (SPADCALL (SPADCALL |b| 2 (QREFELT % 344))
                                      |factorizer| |y| (QREFELT % 347))
                            (QREFELT % 348)))
                     (SEQ (LETT |i| 3) (LETT #1# (LENGTH |b|)) G190
                          (COND ((> |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL |b| |i| (QREFELT % 344))
                                       |factorizer| |y| (QREFELT % 347))
                                      (QREFELT % 349))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #2# |res|) (GO #3#)))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1))
          (LETT |factorizer| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;inf_singularity?|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (% (|Boolean|)))
        (SPROG
         ((|ux|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|i| NIL) (#1=#:G818 NIL)
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn|
           #2=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd| #2#)
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|yu|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|fi|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#3=#:G819 NIL) (|e| NIL) (#4=#:G820 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#5=#:G817 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |fi| (|spadConstant| % 307))
                (LETT |ux|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 12) 2 (QREFELT % 55))
                        (QREFELT % 229))
                       (QREFELT % 350)))
                (LETT |yu| (|spadConstant| % 351))
                (SEQ (LETT |i| 0) (LETT #1# (SPADCALL |f| (QREFELT % 317)))
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |lc| (SPADCALL |f| |i| (QREFELT % 352)))
                          (LETT |lcn|
                                (|LODOF2;subsup| (SPADCALL |lc| (QREFELT % 29))
                                 (SPADCALL (|spadConstant| % 150)
                                           (SPADCALL (|spadConstant| % 12) 1
                                                     (QREFELT % 55))
                                           (QREFELT % 310))
                                 %))
                          (LETT |lcd|
                                (|LODOF2;subsup| (SPADCALL |lc| (QREFELT % 27))
                                 (SPADCALL (|spadConstant| % 150)
                                           (SPADCALL (|spadConstant| % 12) 1
                                                     (QREFELT % 55))
                                           (QREFELT % 310))
                                 %))
                          (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT % 302)))
                          (LETT |fi|
                                (SPADCALL |fi|
                                          (SPADCALL |slc| |yu| (QREFELT % 313))
                                          (QREFELT % 319)))
                          (EXIT
                           (LETT |yu|
                                 (SPADCALL
                                  (SPADCALL |ux| (SPADCALL (QREFELT % 312))
                                            (QREFELT % 313))
                                  |yu| (QREFELT % 326)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |fi|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 296)
                                 (SPADCALL |fi| (QREFELT % 316))
                                 (QREFELT % 302))
                       |fi| (QREFELT % 313)))
                (LETT |dlc|
                      (PROGN
                       (LETT #3# NIL)
                       (SEQ (LETT |e| (SPADCALL |fi| (QREFELT % 354)))
                            (LETT #4# (SPADCALL |fi| (QREFELT % 317))) G190
                            (COND ((> |e| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |fi| |e| (QREFELT % 352))
                                      (QREFELT % 27))
                                     #3#))))
                            (LETT |e| (+ |e| 1)) (GO G190) G191
                            (EXIT (NREVERSE #3#)))))
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL |dlc| (QREFELT % 355))
                             (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 55))
                             (|spadConstant| % 50) (QREFELT % 82))
                   (|spadConstant| % 50) (QREFELT % 84))
                  (PROGN (LETT #5# 'T) (GO #6=#:G816))))
                (EXIT NIL)))
          #6# (EXIT #5#)))) 

(SDEFUN |LODOF2;testis;LodoB;49|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (% (|Boolean|)))
        (|LODOF2;inf_singularity?| |f| %)) 

(SDEFUN |LODOF2;factor_global|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|a|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#1=#:G951 NIL) (#2=#:G952 NIL) (#3=#:G953 NIL) (#4=#:G954 NIL)
          (#5=#:G955 NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#6=#:G956 NIL) (|jiy| #7=(|Integer|)) (|ji1y| #7#)
          (|jix| #8=(|Integer|)) (|ji1x| #8#) (#9=#:G957 NIL)
          (|v| (|List| (|Fraction| (|Integer|)))) (|i| NIL) (#10=#:G958 NIL)
          (#11=#:G959 NIL) (|j| NIL) (#12=#:G960 NIL)
          (|bound| (|List| (|Fraction| (|Integer|)))) (|eb| (|Integer|))
          (|gema|
           #13=(|List|
                (|Record|
                 (|:| |singularity|
                      (|Record|
                       (|:| |point|
                            (|Union| (|Expression| (|Integer|))
                                     #14="infinity"))
                       (|:| |lpf|
                            (|LinearOrdinaryDifferentialOperator3|
                             (|Expression| (|Integer|))
                             (|UnivariateTaylorSeries|
                              (|Expression| (|Integer|)) |var| |cen|)
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))
                       (|:| |dxt| (|PositiveInteger|))))
                 (|:| |fos|
                      (|List|
                       (|Record|
                        (|:| |op|
                             (|LinearOrdinaryDifferentialOperator3|
                              (|Expression| (|Integer|))
                              (|UnivariateTaylorSeries|
                               (|Expression| (|Integer|)) |var| |cen|)
                              (|UnivariateLaurentSeries|
                               (|Expression| (|Integer|)) |var| |cen|)))
                        (|:| |ram|
                             (|UnivariatePolynomial| |var|
                                                     (|Expression|
                                                      (|Integer|))))
                        (|:| |expart|
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))))
                 (|:| |mge|
                      (|List|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|))))))
          (|eba| (|Integer|)) (#15=#:G961 NIL) (#16=#:G962 NIL)
          (|dl| (|List| (|PositiveInteger|))) (|min_deg| (|PositiveInteger|))
          (|ge| NIL) (#17=#:G963 NIL) (|gem| #13#)
          (|done_s|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (#18=#:G965 NIL) (|ssp| NIL) (#19=#:G964 NIL) (#20=#:G966 NIL)
          (|all_one| (|Boolean|)) (#21=#:G967 NIL)
          (|done_sa|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (#22=#:G968 NIL) (|sa| NIL) (#23=#:G970 NIL) (#24=#:G969 NIL)
          (#25=#:G971 NIL) (|sop| NIL) (#26=#:G972 NIL) (|s| NIL)
          (#27=#:G973 NIL)
          (|iarf1|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|j1|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#28=#:G73 NIL)
          (|jj|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|kk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#29=#:G886 NIL)
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|l| NIL) (#30=#:G974 NIL) (#31=#:G72 NIL)
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #32="failed"))
          (#33=#:G909 NIL) (#34=#:G950 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((<= (SPADCALL |f| (QREFELT % 317)) 1)
              (PROGN (LETT #34# (LIST |f|)) (GO #35=#:G949))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT % 316)) (|spadConstant| % 296)
                        (QREFELT % 357))
              (SEQ
               (LETT |a|
                     (|LODOF2;factor_global|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 296)
                                 (SPADCALL |f| (QREFELT % 316))
                                 (QREFELT % 302))
                       |f| (QREFELT % 313))
                      |factorizer| %))
               (EXIT
                (PROGN
                 (LETT #34#
                       (CONS
                        (SPADCALL (SPADCALL |f| (QREFELT % 316))
                                  (SPADCALL |a| 1 (QREFELT % 344))
                                  (QREFELT % 313))
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |i| 2) (LETT #2# (LENGTH |a|)) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |a| |i| (QREFELT % 344))
                                            #1#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))))
                 (GO #35#))))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT % 317)) 2)
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT % 358))
               (QREFELT % 166))))
            (LETT |gem| (SPADCALL |f| |factorizer| "" (QREFELT % 362)))
            (LETT |bound|
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |i| 1)
                        (LETT #4# (- (SPADCALL |f| (QREFELT % 317)) 1)) G190
                        (COND ((|greater_SI| |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT (LETT #3# (CONS (|spadConstant| % 65) #3#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #3#)))))
            (LETT |eb| -1)
            (SEQ (LETT |s| NIL) (LETT #5# |gem|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |s| (CAR #5#)) NIL)) (GO G191)))
                 (SEQ
                  (LETT |np|
                        (|LODOF2;newtonpolygon| (QVELT (QVELT |s| 0) 1) %))
                  (LETT |np|
                        (SPADCALL |np|
                                  (LIST
                                   (VECTOR
                                    (CONS
                                     (SPADCALL (QVELT (QVELT |s| 0) 1)
                                               (QREFELT % 41))
                                     0)
                                    (|spadConstant| % 65)
                                    (|spadConstant| % 50)))
                                  (QREFELT % 59)))
                  (LETT |v| NIL)
                  (SEQ (LETT |i| 1) (LETT #6# (- (LENGTH |np|) 1)) G190
                       (COND ((|greater_SI| |i| #6#) (GO G191)))
                       (SEQ
                        (LETT |jiy|
                              (QCDR
                               (QVELT (SPADCALL |np| |i| (QREFELT % 191)) 0)))
                        (LETT |ji1y|
                              (QCDR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT % 191))
                                      0)))
                        (LETT |jix|
                              (QCAR
                               (QVELT (SPADCALL |np| |i| (QREFELT % 191)) 0)))
                        (LETT |ji1x|
                              (QCAR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT % 191))
                                      0)))
                        (EXIT
                         (SEQ (LETT |l| |jix|) (LETT #9# (- |ji1x| 1)) G190
                              (COND ((> |l| #9#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |v|
                                      (SPADCALL |v|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL |jiy|
                                                            (QREFELT % 102))
                                                  (SPADCALL
                                                   (* (- |l| |jix|)
                                                      (- |ji1y| |jiy|))
                                                   (- |ji1x| |jix|)
                                                   (QREFELT % 49))
                                                  (QREFELT % 104)))
                                                (QREFELT % 363)))))
                              (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| 1)
                       (LETT #10# (- (SPADCALL |f| (QREFELT % 317)) 1)) G190
                       (COND ((|greater_SI| |i| #10#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |bound| |i|
                                   (SPADCALL
                                    (SPADCALL |bound| |i| (QREFELT % 330))
                                    (SPADCALL (QVELT (QVELT |s| 0) 2)
                                              (SPADCALL |v| (+ |i| 1)
                                                        (QREFELT % 330))
                                              (QREFELT % 364))
                                    (QREFELT % 104))
                                   (QREFELT % 365))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |eb| (+ |eb| (QVELT (QVELT |s| 0) 2)))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
            (LETT |bound|
                  (PROGN
                   (LETT #11# NIL)
                   (SEQ (LETT |j| 1)
                        (LETT #12# (- (SPADCALL |f| (QREFELT % 317)) 1)) G190
                        (COND ((|greater_SI| |j| #12#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #11#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bound|
                                             (- (SPADCALL |f| (QREFELT % 317))
                                                |j|)
                                             (QREFELT % 330))
                                   (QREFELT % 366))
                                  (SPADCALL |j| (SPADCALL |eb| (QREFELT % 102))
                                            (QREFELT % 364))
                                  (QREFELT % 104))
                                 #11#))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                        (EXIT (NREVERSE #11#)))))
            (LETT |eb| (|LODOF2;compute_bound| |gem| (|spadConstant| % 19) %))
            (LETT |gema|
                  (SPADCALL |f| |factorizer| "use adjoint" (QREFELT % 362)))
            (LETT |eba|
                  (|LODOF2;compute_bound| |gema| (|spadConstant| % 19) %))
            (LETT |all_one| 'T) (LETT |done_s| NIL)
            (SEQ G190 (COND ((NULL (NULL (NULL |gem|))) (GO G191)))
                 (SEQ
                  (LETT |dl|
                        (PROGN
                         (LETT #15# NIL)
                         (SEQ (LETT |s| NIL) (LETT #16# |gem|) G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |s| (CAR #16#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS (QVELT (QVELT |s| 0) 2) #15#))))
                              (LETT #16# (CDR #16#)) (GO G190) G191
                              (EXIT (NREVERSE #15#)))))
                  (LETT |min_deg| (SPADCALL (ELT % 369) |dl| (QREFELT % 372)))
                  (EXIT
                   (SEQ (LETT |ge| NIL) (LETT #17# |gem|) G190
                        (COND
                         ((OR (ATOM #17#) (PROGN (LETT |ge| (CAR #17#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QVELT (QVELT |ge| 0) 2) |min_deg|)
                            (SEQ
                             (LETT |gem| (SPADCALL |ge| |gem| (QREFELT % 373)))
                             (LETT |vrs|
                                   (PROG2
                                       (LETT #29#
                                             (|LODOF2;factor_op|
                                              (QVELT (QVELT |ge| 0) 1)
                                              |factorizer| "all right factors"
                                              %))
                                       (QCDR #29#)
                                     (|check_union2| (QEQCAR #29# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT % 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT % 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT % 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT % 6)
                                                                (QREFELT %
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT % 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #29#)))
                             (LETT |done_s|
                                   (SPADCALL |done_s|
                                             (LIST (CONS (QVELT |ge| 0) |vrs|))
                                             (QREFELT % 376)))
                             (SEQ (LETT |sop| NIL) (LETT #18# |vrs|)
                                  (LETT |ssp| NIL) (LETT #19# (QVELT |ge| 1))
                                  G190
                                  (COND
                                   ((OR (ATOM #19#)
                                        (PROGN (LETT |ssp| (CAR #19#)) NIL)
                                        (ATOM #18#)
                                        (PROGN (LETT |sop| (CAR #18#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT |ssp| 0)
                                                 (QREFELT % 41))
                                       1)
                                      (COND
                                       ((EQL
                                         (SPADCALL
                                          (PROG2 (LETT #31# |sop|)
                                              (QCDR #31#)
                                            (|check_union2| (QEQCAR #31# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT %
                                                                              6)
                                                                     (QREFELT %
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT %
                                                                              6)
                                                                     (QREFELT %
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT %
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #31#))
                                          (QREFELT % 41))
                                         1)
                                        (PROGN
                                         (LETT #34#
                                               (|LODOF2;factor_minmult1|
                                                |bound| (QVELT |ge| 0) |f| |eb|
                                                |eba|
                                                (PROG2 (LETT #31# |sop|)
                                                    (QCDR #31#)
                                                  (|check_union2|
                                                   (QEQCAR #31# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT % 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #31#))
                                                |factorizer| %))
                                         (GO #35#))))))))
                                  (LETT #19#
                                        (PROG1 (CDR #19#)
                                          (LETT #18# (CDR #18#))))
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (LETT |all_one|
                                    (COND
                                     (|all_one|
                                      (COND
                                       ((EQL (LENGTH |vrs|) 1)
                                        (EQL
                                         (SPADCALL
                                          (PROG2
                                              (LETT #31#
                                                    (SPADCALL |vrs| 1
                                                              (QREFELT % 377)))
                                              (QCDR #31#)
                                            (|check_union2| (QEQCAR #31# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT % 6)
                                                              (QREFELT % 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT % 6)
                                                               (QREFELT % 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT %
                                                                              6)
                                                                     (QREFELT %
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT %
                                                                              6)
                                                                     (QREFELT %
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT %
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #31#))
                                          (QREFELT % 41))
                                         1))
                                       ('T NIL)))
                                     ('T NIL)))))))))
                        (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT % 358))
               (QREFELT % 166))))
            (LETT |all_one| 'T) (LETT |done_sa| NIL)
            (SEQ (LETT |s| NIL) (LETT #20# |done_s|) G190
                 (COND
                  ((OR (ATOM #20#) (PROGN (LETT |s| (CAR #20#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |all_one|
                        (COND (|all_one| (EQL (LENGTH (QCDR |s|)) 1))
                              ('T NIL)))
                  (SEQ (LETT |sop| NIL) (LETT #21# (QCDR |s|)) G190
                       (COND
                        ((OR (ATOM #21#) (PROGN (LETT |sop| (CAR #21#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #31# |sop|)
                                   (QCDR #31#)
                                 (|check_union2| (QEQCAR #31# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #31#))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f| (QREFELT % 317)) 2
                                          (QREFELT % 49))
                                (QREFELT % 182))
                               |bound| (QCAR |s|) |f| |eb| 0 "" %))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                           (PROGN
                            (LETT #34#
                                  (PROG2 (LETT #33# |t|)
                                      (QCDR #33#)
                                    (|check_union2| (QEQCAR #33# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #32#)
                                                    #33#)))
                            (GO #35#))))))
                       (LETT #21# (CDR #21#)) (GO G190) G191 (EXIT NIL))
                  (LETT |vrs|
                        (PROG2
                            (LETT #29#
                                  (|LODOF2;factor_op|
                                   (SPADCALL (QVELT (QCAR |s|) 1)
                                             (QREFELT % 380))
                                   |factorizer| "all right factors" %))
                            (QCDR #29#)
                          (|check_union2| (QEQCAR #29# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT % 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT % 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT % 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #29#)))
                  (LETT |done_sa|
                        (SPADCALL |done_sa| (LIST (CONS (QCAR |s|) |vrs|))
                                  (QREFELT % 376)))
                  (EXIT
                   (SEQ (LETT |sop| NIL) (LETT #22# |vrs|) G190
                        (COND
                         ((OR (ATOM #22#) (PROGN (LETT |sop| (CAR #22#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #31# |sop|)
                                    (QCDR #31#)
                                  (|check_union2| (QEQCAR #31# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #31#))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT % 317)) 2
                                           (QREFELT % 49))
                                 (QREFELT % 182))
                                |bound| (QCAR |s|) |f| |eba| 0 "use adjoint"
                                %))
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                            (PROGN
                             (LETT #34#
                                   (PROG2 (LETT #33# |t|)
                                       (QCDR #33#)
                                     (|check_union2| (QEQCAR #33# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #32#)
                                                     #33#)))
                             (GO #35#))))))
                        (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #20# (CDR #20#)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |sa| NIL) (LETT #23# |done_sa|) (LETT |s| NIL)
                 (LETT #24# |done_s|) G190
                 (COND
                  ((OR (ATOM #24#) (PROGN (LETT |s| (CAR #24#)) NIL)
                       (ATOM #23#) (PROGN (LETT |sa| (CAR #23#)) NIL))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |sop| NIL) (LETT #25# (QCDR |s|)) G190
                       (COND
                        ((OR (ATOM #25#) (PROGN (LETT |sop| (CAR #25#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #31# |sop|)
                                   (QCDR #31#)
                                 (|check_union2| (QEQCAR #31# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #31#))
                               (- (SPADCALL |f| (QREFELT % 317)) 1) |bound|
                               (QCAR |s|) |f| |eb|
                               (+
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT % 317)) 2
                                           (QREFELT % 49))
                                 (QREFELT % 182))
                                1)
                               "" %))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                           (PROGN
                            (LETT #34#
                                  (PROG2 (LETT #33# |t|)
                                      (QCDR #33#)
                                    (|check_union2| (QEQCAR #33# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #32#)
                                                    #33#)))
                            (GO #35#))))))
                       (LETT #25# (CDR #25#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |sop| NIL) (LETT #26# (QCDR |sa|)) G190
                        (COND
                         ((OR (ATOM #26#) (PROGN (LETT |sop| (CAR #26#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #31# |sop|)
                                    (QCDR #31#)
                                  (|check_union2| (QEQCAR #31# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #31#))
                                (- (SPADCALL |f| (QREFELT % 317)) 1) |bound|
                                (QCAR |s|) |f| |eba|
                                (+
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT % 317)) 2
                                            (QREFELT % 49))
                                  (QREFELT % 182))
                                 1)
                                "use adjoint" %))
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                            (PROGN
                             (LETT #34#
                                   (PROG2 (LETT #33# |t|)
                                       (QCDR #33#)
                                     (|check_union2| (QEQCAR #33# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #32#)
                                                     #33#)))
                             (GO #35#))))))
                        (LETT #26# (CDR #26#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #24# (PROG1 (CDR #24#) (LETT #23# (CDR #23#))))
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SEQ (LETT |s| NIL) (LETT #27# |done_s|) G190
                   (COND
                    ((OR (ATOM #27#) (PROGN (LETT |s| (CAR #27#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |iarf1|
                          (PROG2 (LETT #31# (|SPADfirst| (QCDR |s|)))
                              (QCDR #31#)
                            (|check_union2| (QEQCAR #31# 0)
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7)))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT % 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #31#)))
                    (EXIT
                     (COND
                      ((> (SPADCALL |iarf1| (QREFELT % 41)) 1)
                       (SEQ
                        (LETT |j1|
                              (PROG2
                                  (LETT #29#
                                        (|LODOF2;factor_op| |iarf1|
                                         |factorizer| "alg factor" %))
                                  (QCDR #29#)
                                (|check_union2| (QEQCAR #29# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #29#)))
                        (LETT |jj|
                              (PROG2
                                  (LETT #28# (SPADCALL |j1| (QREFELT % 195)))
                                  (QCDR #28#)
                                (|check_union2| (QEQCAR #28# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT % 6)
                                                        (QREFELT % 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT % 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #28#)))
                        (LETT |kk| (|LODOF2;make_rightfactor| |iarf1| |jj| %))
                        (LETT |t|
                              (|LODOF2;try_factorization| |kk|
                               (- (SPADCALL |f| (QREFELT % 317)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "" %))
                        (COND
                         ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                          (PROGN
                           (LETT #34#
                                 (PROG2 (LETT #33# |t|)
                                     (QCDR #33#)
                                   (|check_union2| (QEQCAR #33# 0)
                                                   (|List|
                                                    (|LinearOrdinaryDifferentialOperator1|
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT % 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                                   (|Union|
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    #32#)
                                                   #33#)))
                           (GO #35#))))
                        (LETT |vrs|
                              (PROG2
                                  (LETT #29#
                                        (|LODOF2;factor_op|
                                         (SPADCALL (QVELT (QCAR |s|) 1)
                                                   (QREFELT % 380))
                                         |factorizer| "all right factors" %))
                                  (QCDR #29#)
                                (|check_union2| (QEQCAR #29# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT % 6)
                                                    (QREFELT % 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT % 6)
                                                          (QREFELT % 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT % 6)
                                                         (QREFELT % 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT % 6)
                                                     (QREFELT % 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT % 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #29#)))
                        (LETT |r_left| (|spadConstant| % 18))
                        (SEQ (LETT |l| NIL) (LETT #30# |vrs|) G190
                             (COND
                              ((OR (ATOM #30#)
                                   (PROGN (LETT |l| (CAR #30#)) NIL)
                                   (NULL
                                    (SPADCALL |r_left| (|spadConstant| % 18)
                                              (QREFELT % 219))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|LODOF2;same_charclass?|
                                  (PROG2 (LETT #31# |l|)
                                      (QCDR #31#)
                                    (|check_union2| (QEQCAR #31# 0)
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7)))
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT % 6)
                                                       (QREFELT % 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT % 6)
                                                             (QREFELT % 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT % 6)
                                                            (|Expression|
                                                             (|Integer|))))))
                                                    #31#))
                                  (SPADCALL |kk| (QREFELT % 380)) |factorizer|
                                  %)
                                 (LETT |r_left|
                                       (PROG2 (LETT #31# |l|)
                                           (QCDR #31#)
                                         (|check_union2| (QEQCAR #31# 0)
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT % 6)
                                                           (QREFELT % 7)))
                                                         (|Union|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT % 6)
                                                            (QREFELT % 7)))
                                                          (|Record|
                                                           (|:| |ope|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT % 6)
                                                                  (QREFELT %
                                                                           7))))
                                                           (|:| |dext|
                                                                (|PositiveInteger|))
                                                           (|:| |alpha|
                                                                (|Expression|
                                                                 (|Integer|)))
                                                           (|:| |rami|
                                                                (|UnivariatePolynomial|
                                                                 (QREFELT % 6)
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                                         #31#)))))))
                             (LETT #30# (CDR #30#)) (GO G190) G191 (EXIT NIL))
                        (LETT |t|
                              (|LODOF2;try_factorization| |r_left|
                               (- (SPADCALL |f| (QREFELT % 317)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "use adjoint" %))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
                           (PROGN
                            (LETT #34#
                                  (PROG2 (LETT #33# |t|)
                                      (QCDR #33#)
                                    (|check_union2| (QEQCAR #33# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT % 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #32#)
                                                    #33#)))
                            (GO #35#))))))))))
                   (LETT #27# (CDR #27#)) (GO G190) G191 (EXIT NIL))))
            (SPADCALL (SPADCALL "Try the old factorizer" (QREFELT % 358))
                      (QREFELT % 166))
            (EXIT (LIST |f|))))
          #35# (EXIT #34#)))) 

(SDEFUN |LODOF2;testfg;LodoML;51|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (|LODOF2;factor_global| |f| |factorizer| %)) 

(SDEFUN |LODOF2;factor_minmult1|
        ((|bound| (|List| (|Fraction| (|Integer|))))
         (|sng|
          (|Record|
           (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
           (|:| |lpf|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dxt| (|PositiveInteger|))))
         (|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|eb| (|Integer|)) (|eba| (|Integer|))
         (|r|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (%
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|fl| (|Integer|)) (#1=#:G988 NIL)
          (|w|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|i| NIL) (#2=#:G999 NIL) (#3=#:G72 NIL)
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #4="failed"))
          (#5=#:G979 NIL) (#6=#:G998 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fl|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT % 317)) 2 (QREFELT % 49))
                   (QREFELT % 182)))
            (LETT |t|
                  (|LODOF2;try_factorization| |r| |fl| |bound| |sng| |f| |eb| 0
                   "" %))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
              (PROGN
               (LETT #6#
                     (PROG2 (LETT #5# |t|)
                         (QCDR #5#)
                       (|check_union2| (QEQCAR #5# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                        #4#)
                                       #5#)))
               (GO #7=#:G997))))
            (LETT |w|
                  (PROG2
                      (LETT #1#
                            (|LODOF2;factor_op|
                             (SPADCALL (QVELT |sng| 1) (QREFELT % 380))
                             |factorizer| "all right factors" %))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 1)
                                    (|List|
                                     (|Union|
                                      (|LinearOrdinaryDifferentialOperator3|
                                       (|Expression| (|Integer|))
                                       (|UnivariateTaylorSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT % 6) (QREFELT % 7))
                                       (|UnivariateLaurentSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT % 6) (QREFELT % 7)))
                                      (|Record|
                                       (|:| |ope|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))))
                                       (|:| |dext| (|PositiveInteger|))
                                       (|:| |alpha| (|Expression| (|Integer|)))
                                       (|:| |rami|
                                            (|UnivariatePolynomial|
                                             (QREFELT % 6)
                                             (|Expression| (|Integer|)))))))
                                    (|Union|
                                     (|List|
                                      (|Record|
                                       (|:| |op|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT % 6) (QREFELT % 7))))
                                       (|:| |ram|
                                            (|UnivariatePolynomial|
                                             (QREFELT % 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |expart|
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7)))))
                                     (|List|
                                      (|Union|
                                       (|LinearOrdinaryDifferentialOperator3|
                                        (|Expression| (|Integer|))
                                        (|UnivariateTaylorSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT % 6) (QREFELT % 7))
                                        (|UnivariateLaurentSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT % 6) (QREFELT % 7)))
                                       (|Record|
                                        (|:| |ope|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7))))
                                        (|:| |dext| (|PositiveInteger|))
                                        (|:| |alpha|
                                             (|Expression| (|Integer|)))
                                        (|:| |rami|
                                             (|UnivariatePolynomial|
                                              (QREFELT % 6)
                                              (|Expression| (|Integer|))))))))
                                    #1#)))
            (LETT |r_left| (|spadConstant| % 18))
            (SEQ (LETT |i| NIL) (LETT #2# |w|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL)
                       (NULL
                        (SPADCALL |r_left| (|spadConstant| % 18)
                                  (QREFELT % 219))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|LODOF2;same_charclass?|
                      (PROG2 (LETT #3# |i|)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0)
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT % 6) (QREFELT % 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT % 6) (QREFELT % 7)))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT % 6) (QREFELT % 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT % 6) (QREFELT % 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT % 6)
                                                (|Expression| (|Integer|))))))
                                        #3#))
                      (SPADCALL |r| (QREFELT % 380)) |factorizer| %)
                     (LETT |r_left|
                           (PROG2 (LETT #3# |i|)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT % 6) (QREFELT % 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT % 6) (QREFELT % 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT % 6) (QREFELT % 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT % 6)
                                                      (QREFELT % 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT % 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #3#)))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |r_left| (|spadConstant| % 18) (QREFELT % 219))
              (|error| "bug")))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left| |fl| |bound| |sng| |f|
                   |eba| 0 "use adjoint" %))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
              (PROGN
               (LETT #6#
                     (PROG2 (LETT #5# |t|)
                         (QCDR #5#)
                       (|check_union2| (QEQCAR #5# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                        #4#)
                                       #5#)))
               (GO #7#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r|
                   (- (SPADCALL |f| (QREFELT % 317)) 1) |bound| |sng| |f| |eb|
                   (+ |fl| 1) "" %))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
              (PROGN
               (LETT #6#
                     (PROG2 (LETT #5# |t|)
                         (QCDR #5#)
                       (|check_union2| (QEQCAR #5# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                        #4#)
                                       #5#)))
               (GO #7#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left|
                   (- (SPADCALL |f| (QREFELT % 317)) 1) |bound| |sng| |f| |eba|
                   (+ |fl| 1) "use adjoint" %))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT % 379))
              (PROGN
               (LETT #6#
                     (PROG2 (LETT #5# |t|)
                         (QCDR #5#)
                       (|check_union2| (QEQCAR #5# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))
                                        #4#)
                                       #5#)))
               (GO #7#))))
            (EXIT (LIST |f|))))
          #7# (EXIT #6#)))) 

(SDEFUN |LODOF2;l_p|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| (|Union| (|Expression| (|Integer|)) #2="infinity"))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|)) (#3=#:G1001 NIL)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn|
           #4=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd| #4#)
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|lpf|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|ftmp| #1#)
          (|llr|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ (LETT |lpf| (|spadConstant| % 307))
              (COND
               ((SPADCALL |p| (CONS 0 (|spadConstant| % 19)) (QREFELT % 309))
                (LETT |lpf| |f|))
               ('T
                (SEQ (LETT |ftmp| |f|)
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |ftmp| (|spadConstant| % 307)
                                        (QREFELT % 315)))
                             (GO G191)))
                           (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 316)))
                                (LETT |dg| (SPADCALL |ftmp| (QREFELT % 317)))
                                (COND
                                 ((SPADCALL |p| (CONS 1 "infinity")
                                            (QREFELT % 309))
                                  (LETT |newx|
                                        (SPADCALL (|spadConstant| % 150)
                                                  (SPADCALL
                                                   (|spadConstant| % 12) 1
                                                   (QREFELT % 55))
                                                  (QREFELT % 310))))
                                 ('T
                                  (LETT |newx|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 12) 1
                                                    (QREFELT % 55))
                                          (SPADCALL
                                           (PROG2 (LETT #3# |p|)
                                               (QCDR #3#)
                                             (|check_union2| (QEQCAR #3# 0)
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|Union|
                                                              (|Expression|
                                                               (|Integer|))
                                                              #2#)
                                                             #3#))
                                           (QREFELT % 224))
                                          (QREFELT % 56))
                                         (QREFELT % 229)))))
                                (LETT |lcn|
                                      (|LODOF2;subsup|
                                       (SPADCALL |lc| (QREFELT % 29)) |newx|
                                       %))
                                (LETT |lcd|
                                      (|LODOF2;subsup|
                                       (SPADCALL |lc| (QREFELT % 27)) |newx|
                                       %))
                                (LETT |slc|
                                      (SPADCALL |lcn| |lcd| (QREFELT % 302)))
                                (COND
                                 ((SPADCALL |p| (CONS 1 "infinity")
                                            (QREFELT % 309))
                                  (LETT |newd|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 12) 1
                                                      (QREFELT % 55))
                                            2 (QREFELT % 67))
                                           (QREFELT % 229))
                                          (SPADCALL (QREFELT % 312))
                                          (QREFELT % 313))
                                         (QREFELT % 314))))
                                 ('T (LETT |newd| (SPADCALL (QREFELT % 312)))))
                                (LETT |lpf|
                                      (SPADCALL |lpf|
                                                (SPADCALL |slc|
                                                          (SPADCALL |newd| |dg|
                                                                    (QREFELT %
                                                                             318))
                                                          (QREFELT % 313))
                                                (QREFELT % 319)))
                                (EXIT
                                 (LETT |ftmp|
                                       (SPADCALL |ftmp| (QREFELT % 320)))))
                           NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |llr|
                    (|LODOF2;convertL3toLL| (SPADCALL |lpf| (QREFELT % 382))
                     %))
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| % 14) (SPADCALL |llr| (QREFELT % 37))
                          (QREFELT % 249))
                |llr| (QREFELT % 156)))))) 

(SDEFUN |LODOF2;testlp;LodoULodo;54|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| (|Union| (|Expression| (|Integer|)) "infinity"))
         (%
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;l_p| |f| |p| %)) 

(SDEFUN |LODOF2;subsup|
        ((|np| #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|newx|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (%
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
        (SPROG
         ((|lc| (|Expression| (|Integer|))) (|dg| (|NonNegativeInteger|))
          (|res|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|nptmp| #1#))
         (SEQ (LETT |res| (|spadConstant| % 384)) (LETT |nptmp| |np|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| % 50) (QREFELT % 151)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT % 187)))
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT % 72)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT % 224))
                                         (SPADCALL |newx| |dg| (QREFELT % 385))
                                         (QREFELT % 386))
                                        (QREFELT % 387)))
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT % 189)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;get_trace|
        ((|f| (|Expression| (|Integer|)))
         (|k| (|Kernel| (|Expression| (|Integer|))))
         (% (|Expression| (|Integer|))))
        (SPROG
         ((|min_pol| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|Sae|
           (|Join|
            (|MonogenicAlgebra| #1=(|Expression| (|Integer|))
                                #2=(|UnivariatePolynomial| |var|
                                                           (|Expression|
                                                            (|Integer|))))
            (CATEGORY |package|
             (IF (|has| #1# (|Field|))
                 (IF (|has| #1# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|)
             (IF (|has| #2# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (|fa| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ (LETT |min_pol| (SPADCALL |k| (QREFELT % 389)))
              (LETT |Sae|
                    (|SimpleAlgebraicExtension| (|Expression| (|Integer|))
                                                (|UnivariatePolynomial|
                                                 (QREFELT % 6)
                                                 (|Expression| (|Integer|)))
                                                (SPADCALL |min_pol|
                                                          (QREFELT % 97))))
              (LETT |fa| (SPADCALL |f| |k| |min_pol| (QREFELT % 392)))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |fa| (QREFELT % 97))
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '%
                                                       (LIST
                                                        '|UnivariatePolynomial|
                                                        (QREFELT % 6)
                                                        (LIST '|Expression|
                                                              (LIST
                                                               '|Integer|))))
                                                 |Sae|))
                (|compiledLookupCheck| '|trace|
                                       (LIST
                                        (LIST '|Expression| (LIST '|Integer|))
                                        '%)
                                       |Sae|)))))) 

(SDEFUN |LODOF2;testgt;EKE;57|
        ((|f| (|Expression| (|Integer|)))
         (|k| (|Kernel| (|Expression| (|Integer|))))
         (% (|Expression| (|Integer|))))
        (|LODOF2;get_trace| |f| |k| %)) 

(SDEFUN |LODOF2;make_poly|
        ((|f|
          #1=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)))
         (% (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
        (SPROG
         ((|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|res| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|ftmp| #1#))
         (SEQ (LETT |res| (|spadConstant| % 394)) (LETT |ftmp| |f|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| % 18) (QREFELT % 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT % 37)))
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT % 41)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| 0 (QREFELT % 54)) |dg|
                                         (QREFELT % 395))
                                        (QREFELT % 396)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT % 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;compute_bound|
        ((|gem|
          (|List|
           (|Record|
            (|:| |singularity|
                 (|Record|
                  (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
                  (|:| |lpf|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |dxt| (|PositiveInteger|))))
            (|:| |fos|
                 (|List|
                  (|Record|
                   (|:| |op|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |ram|
                        (|UnivariatePolynomial| |var|
                                                (|Expression| (|Integer|))))
                   (|:| |expart|
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |mge|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|))))))
         (|rlc| (|Expression| (|Integer|))) (% (|Integer|)))
        (SPROG
         ((|ge| NIL) (#1=#:G1058 NIL) (|ji| NIL) (#2=#:G1061 NIL) (|fps| NIL)
          (#3=#:G1060 NIL) (|f| NIL) (#4=#:G1059 NIL)
          (|r| #5=(|NonNegativeInteger|)) (|fpsjj| NIL) (#6=#:G1063 NIL)
          (|jj| NIL) (#7=#:G1062 NIL) (|rjj| #5#)
          (|vpei| #8=(|Fraction| (|Integer|))) (|vpej| #8#)
          (|ks| (|List| (|Kernel| (|Expression| (|Integer|))))) (|ke| NIL)
          (#9=#:G1064 NIL) (|c| (|Expression| (|Integer|)))
          (|cq| (|Fraction| (|Integer|)))
          (|ma| (|Union| (|Fraction| (|Integer|)) #10="-infinity"))
          (#11=#:G1057 NIL) (#12=#:G1029 NIL) (|res| (|Fraction| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (|spadConstant| % 65))
                (SEQ (LETT |ge| NIL) (LETT #1# |gem|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ge| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |ma| (CONS 1 "-infinity"))
                          (SEQ (LETT |ji| 1) (LETT #2# (LENGTH (QVELT |ge| 2)))
                               (LETT |fps| NIL) (LETT #3# (QVELT |ge| 1))
                               (LETT |f| NIL) (LETT #4# (QVELT |ge| 2)) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |f| (CAR #4#)) NIL)
                                     (ATOM #3#)
                                     (PROGN (LETT |fps| (CAR #3#)) NIL)
                                     (|greater_SI| |ji| #2#))
                                 (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL (QVELT |fps| 1)
                                                (QREFELT % 72)))
                                (LETT |c| (SPADCALL |f| 0 (QREFELT % 54)))
                                (SEQ (LETT |fpsjj| NIL)
                                     (LETT #6#
                                           (SPADCALL (QVELT |ge| 1) |ji|
                                                     (QREFELT % 398)))
                                     (LETT |jj| NIL)
                                     (LETT #7#
                                           (SPADCALL (QVELT |ge| 2) |ji|
                                                     (QREFELT % 397)))
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |jj| (CAR #7#)) NIL)
                                           (ATOM #6#)
                                           (PROGN
                                            (LETT |fpsjj| (CAR #6#))
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |rjj|
                                            (SPADCALL (QVELT |fpsjj| 1)
                                                      (QREFELT % 72)))
                                      (LETT |vpei|
                                            (SPADCALL
                                             (SPADCALL |f| 0 (QREFELT % 42))
                                             |r| (QREFELT % 49)))
                                      (LETT |vpej|
                                            (SPADCALL
                                             (SPADCALL |jj| 0 (QREFELT % 42))
                                             |rjj| (QREFELT % 49)))
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL |c|
                                                       (SPADCALL
                                                        (SPADCALL |vpei| |vpej|
                                                                  (QREFELT %
                                                                           105))
                                                        (QREFELT % 239))
                                                       (QREFELT % 399)))))
                                     (LETT #7#
                                           (PROG1 (CDR #7#)
                                             (LETT #6# (CDR #6#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |ks| (SPADCALL |c| (QREFELT % 401)))
                                (SEQ (LETT |ke| NIL) (LETT #9# |ks|) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |ke| (CAR #9#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((QEQCAR
                                          (SPADCALL
                                           (SPADCALL |ke| (QREFELT % 402))
                                           (QREFELT % 404))
                                          1)
                                         (SEQ
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |c| (QREFELT % 405))
                                              |ke| |rlc| (QREFELT % 406))
                                             (|spadConstant| % 19)
                                             (QREFELT % 234))
                                            (PROGN
                                             (LETT #11#
                                                   (|LODOF2;compute_bound|
                                                    |gem|
                                                    (SPADCALL |rlc|
                                                              (|spadConstant| %
                                                                              12)
                                                              (QREFELT % 399))
                                                    %))
                                             (GO #13=#:G1056))))
                                          (EXIT
                                           (LETT |c|
                                                 (SPADCALL |c| |ke| |rlc|
                                                           (QREFELT % 406))))))
                                        ('T
                                         (LETT |c|
                                               (SPADCALL
                                                (|LODOF2;get_trace| |c| |ke| %)
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |ke|
                                                            (QREFELT % 389))
                                                  (QREFELT % 407))
                                                 (QREFELT % 75))
                                                (QREFELT % 76)))))))
                                     (LETT #9# (CDR #9#)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |cq| (SPADCALL |c| (QREFELT % 408)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |ma| (CONS 1 "-infinity")
                                             (QREFELT % 410))
                                   (LETT |ma|
                                         (CONS 0
                                               (SPADCALL |cq|
                                                         (QREFELT % 366)))))
                                  ('T
                                   (LETT |ma|
                                         (CONS 0
                                               (SPADCALL
                                                (SPADCALL |cq| (QREFELT % 366))
                                                (PROG2 (LETT #12# |ma|)
                                                    (QCDR #12#)
                                                  (|check_union2|
                                                   (QEQCAR #12# 0)
                                                   (|Fraction| (|Integer|))
                                                   (|Union|
                                                    (|Fraction| (|Integer|))
                                                    #10#)
                                                   #12#))
                                                (QREFELT % 411))))))))
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #3#
                                             (PROG1 (CDR #3#)
                                               (LETT |ji| (|inc_SI| |ji|))))))
                               (GO G190) G191 (EXIT NIL))
                          (COND
                           ((SPADCALL |ma| (CONS 1 "-infinity")
                                      (QREFELT % 410))
                            (PROGN (LETT #11# 0) (GO #13#))))
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL (QVELT (QVELT |ge| 0) 2)
                                                     (PROG2 (LETT #12# |ma|)
                                                         (QCDR #12#)
                                                       (|check_union2|
                                                        (QEQCAR #12# 0)
                                                        (|Fraction|
                                                         (|Integer|))
                                                        (|Union|
                                                         (|Fraction|
                                                          (|Integer|))
                                                         #10#)
                                                        #12#))
                                                     (QREFELT % 364))
                                           (QREFELT % 104)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (MAX 0 (SPADCALL |res| (QREFELT % 182))))))
          #13# (EXIT #11#)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| (|Union| (|Expression| (|Integer|)) #1="infinity"))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
           (|List| (|Expression| (|Integer|)))))
         (|y| (|List| (|Expression| (|Integer|))))
         (%
          (|List|
           (|Record|
            (|:| |ecs|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ecr|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |ect|
                 (|Fraction|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#2=#:G1075 NIL)
          (|v|
           (|List|
            (|Record|
             (|:| |op|
                  #3=(|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|e| NIL) (#4=#:G1091 NIL) (|r| (|NonNegativeInteger|)) (|s| #3#)
          (#5=#:G1092 NIL) (|g| NIL) (#6=#:G1093 NIL)
          (|es| (|List| (|Expression| (|Integer|)))) (#7=#:G1094 NIL)
          (|root| NIL) (#8=#:G1095 NIL)
          (|ss|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#9=#:G1067 NIL)
          (|tr|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|res|
           (|List|
            (|Record|
             (|:| |ecs|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ecr|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |ect|
                  (|Fraction|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|)))))))))
         (SEQ
          (LETT |factorizer2|
                (CONS #'|LODOF2;gen_exp;LodoUMLL;60!0|
                      (VECTOR |factorizer| |y|)))
          (LETT |v|
                (PROG2
                    (LETT #2#
                          (|LODOF2;factor_op| (|LODOF2;l_p| |f| |p| %)
                           |factorizer2| "semireg" %))
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0)
                                  (|List|
                                   (|Record|
                                    (|:| |op|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT % 6) (QREFELT % 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT % 6) (QREFELT % 7))))
                                    (|:| |ram|
                                         (|UnivariatePolynomial| (QREFELT % 6)
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |expart|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT % 6) (QREFELT % 7)))))
                                  (|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT % 6) (QREFELT % 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT % 6) (QREFELT % 7))))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| (QREFELT % 6)
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT % 6) (QREFELT % 7)))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT % 6)
                                       (QREFELT % 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT % 6)
                                            (|Expression| (|Integer|))))))))
                                  #2#)))
          (LETT |res| NIL)
          (SEQ (LETT |e| NIL) (LETT #4# |v|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |e| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT % 72)))
                    (LETT |s| (QVELT |e| 0))
                    (LETT |es|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |g| NIL)
                                (LETT #6#
                                      (SPADCALL
                                       (SPADCALL (|LODOF2;make_poly| |s| %)
                                                 |factorizer2|)
                                       (QREFELT % 414)))
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |g| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL (QVELT |g| 1)
                                                   (QREFELT % 415))
                                         #5#))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |ss|
                          (PROGN
                           (LETT #7# NIL)
                           (SEQ (LETT |root| NIL) (LETT #8# |es|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |root| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |root| (QREFELT % 188))
                                           (QVELT |e| 2) (QREFELT % 215))
                                          (SPADCALL |r| (QREFELT % 75))
                                          (QREFELT % 248))
                                         #7#))))
                                (LETT #8# (CDR #8#)) (GO G190) G191
                                (EXIT (NREVERSE #7#)))))
                    (COND
                     ((SPADCALL |p| (CONS 1 "infinity") (QREFELT % 309))
                      (LETT |tr|
                            (SPADCALL (|spadConstant| % 150)
                                      (SPADCALL (|spadConstant| % 12) 1
                                                (QREFELT % 55))
                                      (QREFELT % 310))))
                     ('T
                      (LETT |tr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 12) 1 (QREFELT % 55))
                              (SPADCALL
                               (PROG2 (LETT #9# |p|)
                                   (QCDR #9#)
                                 (|check_union2| (QEQCAR #9# 0)
                                                 (|Expression| (|Integer|))
                                                 (|Union|
                                                  (|Expression| (|Integer|))
                                                  #1#)
                                                 #9#))
                               (QREFELT % 224))
                              (QREFELT % 83))
                             (QREFELT % 229)))))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST (VECTOR |ss| (QVELT |e| 1) |tr|))
                                     (QREFELT % 418)))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1))
          (LETT |factorizer| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;ge_minimal;LodoMSL;61|
        ((|f|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|factorizer|
          (|Mapping|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|option| (|String|))
         (%
          (|List|
           (|Record|
            (|:| |singularity|
                 (|Record|
                  (|:| |point|
                       (|Union| (|Expression| (|Integer|)) #1="infinity"))
                  (|:| |lpf|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |dxt| (|PositiveInteger|))))
            (|:| |fos|
                 (|List|
                  (|Record|
                   (|:| |op|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |ram|
                        (|UnivariatePolynomial| |var|
                                                (|Expression| (|Integer|))))
                   (|:| |expart|
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |mge|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))))
        (SPROG
         ((#2=#:G1154 NIL) (#3=#:G1155 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|p| NIL) (#4=#:G1156 NIL)
          (|dnf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G1157 NIL) (|root| (|Expression| (|Integer|))) (#6=#:G1158 NIL)
          (#7=#:G1159 NIL)
          (|singularities|
           (|List|
            (|Record| (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                      (|:| |lpf|
                           (|LinearOrdinaryDifferentialOperator3|
                            (|Expression| (|Integer|))
                            (|UnivariateTaylorSeries|
                             (|Expression| (|Integer|)) |var| |cen|)
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|)))
                      (|:| |dxt| (|PositiveInteger|)))))
          (|sg| NIL) (#8=#:G1160 NIL) (#9=#:G1119 NIL)
          (|v|
           (|List|
            (|Record|
             (|:| |op|
                  #10=(|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|e| NIL) (#11=#:G1161 NIL) (|r| (|NonNegativeInteger|)) (|s| #10#)
          (#12=#:G1162 NIL) (|g| NIL) (#13=#:G1163 NIL)
          (|es| (|List| (|Fraction| (|Integer|))))
          (|ms| (|Expression| (|Integer|)))
          (|ss|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|mg|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|res|
           (|List|
            (|Record|
             (|:| |singularity|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |fos|
                  (|List|
                   (|Record|
                    (|:| |op|
                         (|LinearOrdinaryDifferentialOperator3|
                          (|Expression| (|Integer|))
                          (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)
                          (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)))
                    (|:| |ram|
                         (|UnivariatePolynomial| |var|
                                                 (|Expression| (|Integer|))))
                    (|:| |expart|
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |mge|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |dlc|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |e| (SPADCALL |f| (QREFELT % 354)))
                      (LETT #3# (SPADCALL |f| (QREFELT % 317))) G190
                      (COND ((> |e| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |f| |e| (QREFELT % 352))
                                         (QREFELT % 27))
                               #2#))))
                      (LETT |e| (+ |e| 1)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |dlc| (SPADCALL |dlc| (QREFELT % 422))) (LETT |dnf| NIL)
          (SEQ (LETT |p| NIL) (LETT #4# |dlc|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |dnf|
                       (SPADCALL |dnf|
                                 (SPADCALL
                                  (|LODOF2;factorUP| |p| |factorizer| %)
                                  (QREFELT % 64))
                                 (QREFELT % 423)))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((|LODOF2;inf_singularity?| |f| %)
            (LETT |singularities|
                  (LIST
                   (VECTOR (CONS 1 "infinity")
                           (|LODOF2;l_p| |f| (CONS 1 "infinity") %) 1))))
           ('T (LETT |singularities| NIL)))
          (SEQ (LETT |g| NIL) (LETT #5# |dnf|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL)) (GO G191)))
               (SEQ
                (LETT |root|
                      (SPADCALL (SPADCALL (QCAR |g|) (QREFELT % 96))
                                (QREFELT % 415)))
                (EXIT
                 (LETT |singularities|
                       (CONS
                        (VECTOR (CONS 0 |root|)
                                (|LODOF2;l_p| |f| (CONS 0 |root|) %)
                                (SPADCALL (QCAR |g|) (QREFELT % 72)))
                        |singularities|))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((EQUAL |option| "use adjoint")
            (LETT |singularities|
                  (PROGN
                   (LETT #6# NIL)
                   (SEQ (LETT |sg| NIL) (LETT #7# |singularities|) G190
                        (COND
                         ((OR (ATOM #7#) (PROGN (LETT |sg| (CAR #7#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #6#
                                (CONS
                                 (VECTOR (QVELT |sg| 0)
                                         (SPADCALL (QVELT |sg| 1)
                                                   (QREFELT % 380))
                                         (QVELT |sg| 2))
                                 #6#))))
                        (LETT #7# (CDR #7#)) (GO G190) G191
                        (EXIT (NREVERSE #6#)))))))
          (LETT |res| NIL)
          (SEQ (LETT |sg| NIL) (LETT #8# |singularities|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |sg| (CAR #8#)) NIL)) (GO G191)))
               (SEQ
                (LETT |v|
                      (PROG2
                          (LETT #9#
                                (|LODOF2;factor_op| (QVELT |sg| 1) |factorizer|
                                 "semireg" %))
                          (QCDR #9#)
                        (|check_union2| (QEQCAR #9# 0)
                                        (|List|
                                         (|Record|
                                          (|:| |op|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6) (QREFELT % 7))))
                                          (|:| |ram|
                                               (|UnivariatePolynomial|
                                                (QREFELT % 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |expart|
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT % 6) (QREFELT % 7)))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT % 6) (QREFELT % 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT % 6)
                                                  (QREFELT % 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT % 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT % 6)
                                                 (QREFELT % 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT % 6) (QREFELT % 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT % 6)
                                                   (QREFELT % 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT % 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #9#)))
                (LETT |mg| NIL)
                (SEQ (LETT |e| NIL) (LETT #11# |v|) G190
                     (COND
                      ((OR (ATOM #11#) (PROGN (LETT |e| (CAR #11#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT % 72)))
                          (LETT |s| (QVELT |e| 0))
                          (LETT |es|
                                (PROGN
                                 (LETT #12# NIL)
                                 (SEQ (LETT |g| NIL)
                                      (LETT #13#
                                            (SPADCALL
                                             (SPADCALL
                                              (|LODOF2;make_poly| |s| %)
                                              |factorizer|)
                                             (QREFELT % 414)))
                                      G190
                                      (COND
                                       ((OR (ATOM #13#)
                                            (PROGN (LETT |g| (CAR #13#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #12#
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL (QVELT |g| 1)
                                                          (QREFELT % 415))
                                                (QREFELT % 408))
                                               #12#))))
                                      (LETT #13# (CDR #13#)) (GO G190) G191
                                      (EXIT (NREVERSE #12#)))))
                          (LETT |ms|
                                (SPADCALL
                                 (SPADCALL (ELT % 105) |es| (QREFELT % 425))
                                 (QREFELT % 239)))
                          (LETT |ss|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |ms| (QREFELT % 188))
                                           (QVELT |e| 2) (QREFELT % 215))
                                 (SPADCALL |r| (QREFELT % 75))
                                 (QREFELT % 248)))
                          (EXIT
                           (LETT |mg|
                                 (SPADCALL |mg| (LIST |ss|) (QREFELT % 119)))))
                     (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS (VECTOR |sg| |v| |mg|) |res|))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorFactorizer2| DV$1
                      DV$2))
          (LETT % (GETREFV 426))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorFactorizer2|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2| (&REST #1=#:G1164)
  (SPROG NIL
         (PROG (#2=#:G1165)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorFactorizer2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |LinearOrdinaryDifferentialOperatorFactorizer2;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorFactorizer2|)))))))))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT % 6)) 11)
              (|UnivariateTaylorSeries| 11 (NRTEVAL (QREFELT % 6))
                                        (NRTEVAL (QREFELT % 7)))
              (0 . |coerce|) (|Expression| 38) (5 . |1|)
              (|UnivariateLaurentSeries| 11 (NRTEVAL (QREFELT % 6))
                                         (NRTEVAL (QREFELT % 7)))
              (9 . |1|) (|NonNegativeInteger|) (13 . |univariatePolynomial|)
              (|LinearOrdinaryDifferentialOperator3| 11 9 13) (19 . |0|)
              (23 . |0|) (27 . |0|)
              (|LinearOrdinaryDifferentialOperator3| 11 8 25) (31 . |0|)
              (|Boolean|) (35 . ~=) (|Fraction| 8) (41 . |leadingCoefficient|)
              (46 . |denom|) (51 . |coerce|) (56 . |numer|)
              (|Union| % '"failed") (61 . |recip|) (66 . *) (72 . |degree|)
              (77 . |monomial|) (83 . +) (89 . |reductum|)
              (94 . |leadingCoefficient|) (|Integer|) (99 . |order|) (104 . ~=)
              (110 . |degree|) (115 . |order|) (121 . ~=) (127 . |reductum|)
              (|Record| (|:| |x| 38) (|:| |y| 38)) (|List| 45) (132 . |elt|)
              (|Fraction| 38) (138 . /) (144 . |0|) (148 . |denom|)
              (153 . |coefficient|) (159 . |numer|) (164 . |coefficient|)
              (170 . |monomial|) (176 . +)
              (|Record| (|:| |point| 45) (|:| |slope| 48) (|:| |npoly| 8))
              (|List| 57) (182 . |append|) |LODOF2;testnp;LodoL;6|
              (|Record| (|:| |factor| 8) (|:| |exponent| 15)) (|List| 61)
              (|Factored| 8) (188 . |factors|) (193 . |0|) (197 . ~=) (203 . ^)
              (|OneDimensionalArray| 8) (209 . |setelt!|) (|List| %)
              (216 . |tails|) (221 . |degree|) (226 . |coefficient|) (232 . -)
              (238 . |coerce|) (243 . /) (|IntegerRetractions| 11)
              (249 . |integer?|) (254 . ~=) (260 . |integer|) (265 . |coerce|)
              (270 . |eval|) (277 . -) (283 . =) (289 . |elt|) (295 . *)
              (301 . |setDifference|) (307 . |position|) (313 . |elt|)
              (|List| 17) (319 . |append|) (|Mapping| 99 95) (|String|)
              |LODOF2;testfn;LodoMSL;8| (|SparseUnivariatePolynomial| 11)
              (325 . |makeSUP|) (330 . |unmakeSUP|) (|Mapping| 8 95)
              (|Factored| 95) (|FactoredFunctions2| 95 8) (335 . |map|)
              (341 . |coerce|) (346 . *) (352 . +) (358 . |min|) (364 . |quo|)
              (370 . =) (|Record| (|:| |Qt| 17) (|:| |Rt| 17))
              |LODOF2;testf2;LodoUpFR;11| (|List| 13) (376 . |elt|)
              (|Record| (|:| |laurl| 110) (|:| |laurr| 110))
              |LODOF2;testll;FLodo2UpFIR;14|
              (|Record| (|:| |k| 38) (|:| |c| 11)) (|Stream| 114) (|List| 115)
              (382 . |elt|) (388 . |series|) (393 . |append|) (|Stream| 17)
              (|Mapping| 17 108) (|Stream| 108) (|StreamFunctions2| 108 17)
              (399 . |map|) (405 . |retract|)
              (|Record| (|:| |llc| 116) (|:| |rlc| 116))
              |LODOF2;testlc;FLodo2UpFIR;17| (|SingleInteger|) (410 . |1|)
              (414 . +) (|Mapping| 38 38) (|Stream| 38) (420 . |stream|)
              (426 . -) (432 . *) (438 . *) (|Union| 38 '"failed")
              (444 . |retractIfCan|) (449 . =) (|Mapping| 114 17 38)
              (|StreamFunctions3| 17 38 114) (455 . |map|) (462 . |append|)
              (|List| 114) (468 . |coerce|) (473 . |monomial|) (479 . *)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (485 . |extendedEuclidean|) (491 . |1|) (495 . ~=) (501 . |rem|)
              (507 . -) (512 . |pi|) (516 . |pi|) (520 . *) (526 . -) (531 . *)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 159 '"failed") (537 . |extendedEuclidean|) (544 . -)
              (|OutputForm|) (550 . |coerce|) (|Void|) (555 . |print|)
              (|Record| (|:| |main| 108) (|:| |nf| 108) (|:| |error| 17))
              |LODOF2;testln;FLodo2UpFIR;20| (|PositiveInteger|) (560 . |1|)
              (564 . +) (|Record| (|:| |lr| 167) (|:| |n_lifts| 169))
              (|Mapping| 172 172) (|Stream| 172) (570 . |stream|)
              (|Mapping| 108 172) (|StreamFunctions2| 172 108) (576 . |map|)
              |LODOF2;testlw;FLodo2UpFIS;22| (582 . |extendedEuclidean|)
              (588 . |positiveRemainder|) (594 . |floor|)
              |LODOF2;testcp;LodoFILodo;24| (599 . |ceiling|)
              |LODOF2;testco;LodoFIB;26| |LODOF2;testcx;LodoFUp;28|
              (604 . |leadingCoefficient|) (609 . |coerce|) (614 . |reductum|)
              |LODOF2;testpd;UpLodo;30| (619 . |elt|)
              (|Record| (|:| |ope| 17) (|:| |dext| 169) (|:| |alpha| 11)
                        (|:| |rami| 8))
              (|Union| 17 192) (|List| 193) (625 . |value|) (630 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 197) (|:| |factor| 8) (|:| |exponent| 15))
              (|List| 198) (635 . |factorList|) (640 . |retractIfCan|)
              (645 . ~=) (651 . ~=) (657 . |min|) (|Mapping| 38 38 38)
              (|List| 38) (663 . |reduce|) (669 . |elt|) (675 . |truncate|)
              (681 . -) (686 . *) (692 . ^) (698 . -) (703 . *) (709 . +)
              (|Record| (|:| |op| 17) (|:| |ram| 8) (|:| |expart| 13))
              (|List| 216) (715 . |append|) (721 . =) (727 . |rightQuotient|)
              (733 . |append|) (|SparseUnivariatePolynomial| %)
              (739 . |zeroOf|) (744 . |coerce|) (749 . ^) (755 . *)
              (|Union| 217 194) |LODOF2;testfr;LodoMSU;32| (761 . |coerce|)
              (766 . |coerce|) (771 . ^) (|Union| 8 13)
              |LODOF2;testsb;ULodoLodo;34| (777 . =) (|Mapping| 11 38)
              (783 . |multiplyCoefficients|) (789 . |multiplyExponents|)
              (795 . ^) (801 . |coerce|) (806 . *)
              |LODOF2;testro;LodoEPiLodo;36| |LODOF2;testfo;LodoMSU;38|
              (|Vector| 13) (812 . |setelt!|) (819 . D) (823 . |apply|)
              (830 . *) (836 . /) (842 . /) (|Mapping| 13 13) (848 . |map!|)
              (854 . +) (|Mapping| 15 15) (|Stream| 15) (860 . |stream|)
              (866 . |elt|) (872 . *) (878 . ^) (|Mapping| 114 15)
              (|StreamFunctions2| 15 114) (884 . |map|) (|List| 243)
              (890 . |elt|) (|Union| 269 '"failed") (|Vector| 11)
              (|IntegerLinearDependence| 11) (896 . |particularSolutionOverQ|)
              (902 . =) (|Vector| 48) (908 . |elt|) (|Mapping| 11 11)
              (914 . |map|) (|List| 110) (920 . |elt|) (926 . |setelt!|)
              (|Matrix| 13) (933 . |matrix|) (938 . ~=) (944 . |1|) (948 . /)
              (954 . |1|) (958 . |1|) (|List| 58) (|Mapping| 58 17)
              (|ListFunctions2| 17 58) (962 . |map|) (968 . |elt|) (974 . ~=)
              (980 . /) |LODOF2;testsc;2LodoMB;42| (986 . |retract|)
              (|Union| 294 '"failed") (991 . ~=) (|List| 95) (997 . |elt|)
              (1003 . |1|) (1007 . |monomial|) (1013 . *) (1019 . +)
              (1025 . |1|) (1029 . /) (1035 . /) (1041 . |adjoint|)
              (|LinearOrdinaryDifferentialOperator1| 25)
              (|LODOConvertions| 11 8 25) (1046 . |convert|) (1051 . |0|)
              (|Union| 11 '#1="infinity") (1055 . =) (1061 . /) (1067 . ^)
              (1073 . D) (1077 . *) (1083 . -) (1088 . ~=)
              (1094 . |leadingCoefficient|) (1099 . |degree|) (1104 . ^)
              (1110 . +) (1116 . |reductum|) (1121 . ~=) (1127 . |rightGcd|)
              (1133 . |rightQuotient|) (1139 . |coerce|) (1144 . *) (1150 . *)
              (1156 . |leftGcd|) (1162 . |leftQuotient|) (|List| 48)
              (1168 . |elt|) (1174 . *) (|Vector| 95) (1180 . |vector|)
              (|Matrix| 95) (|List| 332) (|List| 15)
              (|VectorHermitePadeSolver|) (1185 . |hp_solve|) (1192 . |column|)
              (1198 . |members|) (1203 . *) (1209 . |append|) (|List| 304)
              (1215 . |elt|) (|Mapping| 99 95 346) (|List| 11)
              |LODOF2;factor;LodoMLL;47| (1221 . |concat|) (1227 . |concat!|)
              (1233 . -) (1238 . |1|) (1242 . |coefficient|) (1248 . /)
              (1254 . |minimumDegree|) (1259 . |lcm|) |LODOF2;testis;LodoB;49|
              (1264 . ~=) (1270 . |message|)
              (|Record| (|:| |point| 308) (|:| |lpf| 17) (|:| |dxt| 169))
              (|Record| (|:| |singularity| 359) (|:| |fos| 217)
                        (|:| |mge| 110))
              (|List| 360) |LODOF2;ge_minimal;LodoMSL;61| (1275 . |append|)
              (1281 . *) (1287 . |setelt!|) (1294 . -) (|Character|)
              (1299 . |min|) (1305 . |min|) (|Mapping| 169 169 169)
              (|List| 169) (1311 . |reduce|) (1317 . |remove|)
              (|Record| (|:| |sing| 359) (|:| |arf| 194)) (|List| 374)
              (1323 . |append|) (1329 . |elt|) (|Union| 343 '"failed")
              (1335 . ~=) (1341 . |adjoint|) |LODOF2;testfg;LodoML;51|
              (1346 . |convert|) |LODOF2;testlp;LodoULodo;54| (1351 . |0|)
              (1355 . ^) (1361 . *) (1367 . +) (|Kernel| %) (1373 . |minPoly|)
              (|Kernel| 11)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 390)
                                                     390 38
                                                     (|SparseMultivariatePolynomial|
                                                      38 390)
                                                     11)
              (1378 . |univariate|) |LODOF2;testgt;EKE;57| (1385 . |0|)
              (1389 . |monomial|) (1395 . +) (1401 . |rest|) (1407 . |rest|)
              (1413 . +) (|List| 388) (1419 . |kernels|) (1424 . |coerce|)
              (|Union| (|AlgebraicNumber|) '"failed") (1429 . |retractIfCan|)
              (1434 . |denominator|) (1439 . |eval|) (1446 . |degree|)
              (1451 . |retract|) (|Union| 48 '"-infinity") (1456 . =)
              (1462 . |max|)
              (|Record| (|:| |flag| 197) (|:| |factor| 95) (|:| |exponent| 15))
              (|List| 412) (1468 . |factorList|) (1473 . |rootOf|)
              (|Record| (|:| |ecs| 110) (|:| |ecr| 8) (|:| |ect| 25))
              (|List| 416) (1478 . |append|) |LODOF2;gen_exp;LodoUMLL;60|
              (|List| 8) (|CylindricalAlgebraicDecompositionUtilities| 11 8)
              (1484 . |squareFreeBasis|) (1489 . |append|) (|Mapping| 48 48 48)
              (1495 . |reduce|))
           '#(|testsc| 1501 |testsb| 1508 |testro| 1514 |testpd| 1521 |testnp|
              1526 |testlw| 1531 |testlp| 1541 |testln| 1547 |testll| 1557
              |testlc| 1567 |testis| 1577 |testgt| 1582 |testfr| 1588 |testfo|
              1595 |testfn| 1602 |testfg| 1609 |testf2| 1615 |testcx| 1622
              |testcp| 1628 |testco| 1635 |gen_exp| 1642 |ge_minimal| 1650
              |factor| 1657)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|testnp|
                                 ((|List|
                                   (|Record|
                                    (|:| |point|
                                         (|Record| (|:| |x| (|Integer|))
                                                   (|:| |y| (|Integer|))))
                                    (|:| |slope| (|Fraction| (|Integer|)))
                                    (|:| |npoly|
                                         (|UnivariatePolynomial| |#1|
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testfn|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator3|
                                    (|Expression| (|Integer|))
                                    (|UnivariateTaylorSeries|
                                     (|Expression| (|Integer|)) |#1| |#2|)
                                    (|UnivariateLaurentSeries|
                                     (|Expression| (|Integer|)) |#1| |#2|)))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testf2|
                                 ((|Record|
                                   (|:| |Qt|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|)))
                                   (|:| |Rt|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|testll|
                                 ((|Record|
                                   (|:| |laurl|
                                        (|List|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|)))
                                   (|:| |laurr|
                                        (|List|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testlc|
                                 ((|Record|
                                   (|:| |llc|
                                        (|List|
                                         (|Stream|
                                          (|Record| (|:| |k| (|Integer|))
                                                    (|:| |c|
                                                         (|Expression|
                                                          (|Integer|)))))))
                                   (|:| |rlc|
                                        (|List|
                                         (|Stream|
                                          (|Record| (|:| |k| (|Integer|))
                                                    (|:| |c|
                                                         (|Expression|
                                                          (|Integer|))))))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testln|
                                 ((|Record|
                                   (|:| |main|
                                        (|Record|
                                         (|:| |Qt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))
                                         (|:| |Rt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))))
                                   (|:| |nf|
                                        (|Record|
                                         (|:| |Qt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))
                                         (|:| |Rt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))))
                                   (|:| |error|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testlw|
                                 ((|Stream|
                                   (|Record|
                                    (|:| |Qt|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))
                                    (|:| |Rt|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testcp|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testco|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testcx|
                                 ((|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|testpd|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))))
                                T)
                              '((|testfr|
                                 ((|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|)
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial| |#1|
                                                                   (|Expression|
                                                                    (|Integer|))))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testsb|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|Union|
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testro|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Expression| (|Integer|))
                                  (|PositiveInteger|)))
                                T)
                              '((|testfo|
                                 ((|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|)
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial| |#1|
                                                                   (|Expression|
                                                                    (|Integer|))))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testsc|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))))
                                T)
                              '((|testfg|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator1|
                                    (|Fraction|
                                     (|UnivariatePolynomial| |#1|
                                                             (|Expression|
                                                              (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))))
                                T)
                              '((|testlp|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Union| (|Expression| (|Integer|))
                                           "infinity")))
                                T)
                              '((|factor|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator1|
                                    (|Fraction|
                                     (|UnivariatePolynomial| |#1|
                                                             (|Expression|
                                                              (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|)))
                                   (|List| (|Expression| (|Integer|))))
                                  (|List| (|Expression| (|Integer|)))))
                                T)
                              '((|testis|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testgt|
                                 ((|Expression| (|Integer|))
                                  (|Expression| (|Integer|))
                                  (|Kernel| (|Expression| (|Integer|)))))
                                T)
                              '((|gen_exp|
                                 ((|List|
                                   (|Record|
                                    (|:| |ecs|
                                         (|List|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))
                                    (|:| |ecr|
                                         (|UnivariatePolynomial| |#1|
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |ect|
                                         (|Fraction|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|)))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Union| (|Expression| (|Integer|))
                                           "infinity")
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|)))
                                   (|List| (|Expression| (|Integer|))))
                                  (|List| (|Expression| (|Integer|)))))
                                T)
                              '((|ge_minimal|
                                 ((|List|
                                   (|Record|
                                    (|:| |singularity|
                                         (|Record|
                                          (|:| |point|
                                               (|Union|
                                                (|Expression| (|Integer|))
                                                #1#))
                                          (|:| |lpf|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)))
                                          (|:| |dxt| (|PositiveInteger|))))
                                    (|:| |fos|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |#1| |#2|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |#1| |#2|)))
                                           (|:| |ram|
                                                (|UnivariatePolynomial| |#1|
                                                                        (|Expression|
                                                                         (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)))))
                                    (|:| |mge|
                                         (|List|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 425
                                            '(1 9 0 8 10 0 11 0 12 0 13 0 14 2
                                              9 8 0 15 16 0 17 0 18 0 11 0 19 0
                                              13 0 20 0 21 0 22 2 21 23 0 0 24
                                              1 21 25 0 26 1 25 8 0 27 1 13 0 9
                                              28 1 25 8 0 29 1 13 30 0 31 2 13
                                              0 9 0 32 1 21 15 0 33 2 17 0 13
                                              15 34 2 17 0 0 0 35 1 21 0 0 36 1
                                              17 13 0 37 1 13 38 0 39 2 17 23 0
                                              0 40 1 17 15 0 41 2 13 38 0 38 42
                                              2 15 23 0 0 43 1 17 0 0 44 2 46
                                              45 0 38 47 2 48 0 38 38 49 0 8 0
                                              50 1 48 38 0 51 2 17 13 0 15 52 1
                                              48 38 0 53 2 13 11 0 38 54 2 8 0
                                              11 15 55 2 8 0 0 0 56 2 58 0 0 0
                                              59 1 63 62 0 64 0 48 0 65 2 48 23
                                              0 0 66 2 8 0 0 15 67 3 68 8 0 38
                                              8 69 1 62 70 0 71 1 8 15 0 72 2 8
                                              11 0 15 73 2 11 0 0 0 74 1 11 0
                                              38 75 2 11 0 0 0 76 1 77 23 11 78
                                              2 11 23 0 0 79 1 77 38 11 80 1 8
                                              0 38 81 3 8 0 0 0 0 82 2 8 0 0 0
                                              83 2 8 23 0 0 84 2 68 8 0 38 85 2
                                              8 0 0 0 86 2 62 0 0 0 87 2 62 38
                                              61 0 88 2 62 61 0 38 89 2 90 0 0
                                              0 91 1 8 95 0 96 1 8 0 95 97 2
                                              100 63 98 99 101 1 48 0 38 102 2
                                              48 0 38 0 103 2 48 0 0 0 104 2 48
                                              0 0 0 105 2 8 0 0 0 106 2 48 23 0
                                              0 107 2 110 13 0 38 111 2 116 115
                                              0 38 117 1 13 0 115 118 2 110 0 0
                                              0 119 2 123 120 121 122 124 1 48
                                              38 0 125 0 128 0 129 2 38 0 0 0
                                              130 2 132 0 131 38 133 2 38 0 0 0
                                              134 2 38 0 0 38 135 2 38 0 15 0
                                              136 1 48 137 0 138 2 137 23 0 0
                                              139 3 141 115 140 120 132 142 2
                                              116 0 0 0 143 1 115 0 144 145 2
                                              13 0 11 38 146 2 17 0 0 13 147 2
                                              8 148 0 0 149 0 8 0 150 2 8 23 0
                                              0 151 2 8 0 0 0 152 1 8 0 0 153 0
                                              11 0 154 0 13 0 155 2 17 0 13 0
                                              156 1 17 0 0 157 2 17 0 0 0 158 3
                                              8 160 0 0 0 161 2 17 0 0 0 162 1
                                              17 163 0 164 1 163 165 0 166 0
                                              169 0 170 2 169 0 0 0 171 2 174 0
                                              173 172 175 2 177 122 176 174 178
                                              2 38 148 0 0 180 2 38 0 0 0 181 1
                                              48 38 0 182 1 48 38 0 184 1 8 11
                                              0 187 1 13 0 11 188 1 8 0 0 189 2
                                              58 57 0 38 191 1 194 193 0 195 1
                                              17 0 13 196 1 63 199 0 200 1 8
                                              137 0 201 2 137 23 0 0 202 2 38
                                              23 0 0 203 2 38 0 0 0 204 2 206
                                              38 205 0 207 2 199 198 0 38 208 2
                                              13 0 0 38 209 1 13 0 0 210 2 13 0
                                              11 0 211 2 13 0 0 38 212 1 11 0 0
                                              213 2 11 0 15 0 214 2 13 0 0 0
                                              215 2 217 0 0 0 218 2 17 23 0 0
                                              219 2 17 0 0 0 220 2 194 0 0 0
                                              221 1 11 0 222 223 1 8 0 11 224 2
                                              11 0 0 38 225 2 11 0 38 0 226 1
                                              25 0 8 229 1 21 0 25 230 2 17 0 0
                                              15 231 2 11 23 0 0 234 2 13 0 235
                                              0 236 2 13 0 0 169 237 2 48 0 0
                                              38 238 1 11 0 48 239 2 17 0 38 0
                                              240 3 243 13 0 38 13 244 0 17 0
                                              245 3 17 13 0 13 13 246 2 13 0 0
                                              0 247 2 13 0 0 11 248 2 13 0 0 0
                                              249 2 243 0 250 0 251 2 15 0 0 0
                                              252 2 254 0 253 15 255 2 243 13 0
                                              38 256 2 15 0 15 0 257 2 11 0 0
                                              15 258 2 260 115 259 254 261 2
                                              262 243 0 38 263 2 266 264 265 11
                                              267 2 264 23 0 0 268 2 269 48 0
                                              38 270 2 13 0 271 0 272 2 273 110
                                              0 38 274 3 110 13 0 38 13 275 1
                                              276 0 273 277 2 13 23 0 0 278 0
                                              17 0 279 2 17 0 0 13 280 0 48 0
                                              281 0 9 0 282 2 285 283 284 90
                                              286 2 283 58 0 38 287 2 58 23 0 0
                                              288 2 8 0 0 11 289 1 13 9 0 291 2
                                              292 23 0 0 293 2 294 95 0 38 295
                                              0 25 0 296 2 21 0 25 15 297 2 21
                                              0 25 0 298 2 21 0 0 0 299 0 21 0
                                              300 2 21 0 0 25 301 2 25 0 0 0
                                              302 1 21 0 0 303 1 305 304 21 306
                                              0 304 0 307 2 308 23 0 0 309 2 25
                                              0 8 8 310 2 8 0 0 169 311 0 304 0
                                              312 2 304 0 25 0 313 1 304 0 0
                                              314 2 304 23 0 0 315 1 304 25 0
                                              316 1 304 15 0 317 2 304 0 0 15
                                              318 2 304 0 0 0 319 1 304 0 0 320
                                              2 93 23 0 0 321 2 304 0 0 0 322 2
                                              304 0 0 0 323 1 304 0 25 324 2
                                              304 0 0 25 325 2 304 0 0 0 326 2
                                              304 0 0 0 327 2 304 0 0 0 328 2
                                              329 48 0 38 330 2 128 0 38 0 331
                                              1 332 0 294 333 3 337 334 335 336
                                              15 338 2 334 332 0 38 339 1 332
                                              294 0 340 2 48 0 0 38 341 2 273 0
                                              0 0 342 2 343 304 0 38 344 2 343
                                              0 0 0 348 2 343 0 0 0 349 1 25 0
                                              0 350 0 304 0 351 2 304 25 0 15
                                              352 2 304 0 0 25 353 1 304 15 0
                                              354 1 8 0 70 355 2 25 23 0 0 357
                                              1 163 0 93 358 2 329 0 0 0 363 2
                                              48 0 15 0 364 3 329 48 0 38 48
                                              365 1 48 0 0 366 2 367 0 0 0 368
                                              2 169 0 0 0 369 2 371 169 370 0
                                              372 2 361 0 360 0 373 2 375 0 0 0
                                              376 2 194 193 0 38 377 2 378 23 0
                                              0 379 1 17 0 0 380 1 305 21 304
                                              382 0 25 0 384 2 25 0 0 15 385 2
                                              25 0 8 0 386 2 25 0 0 0 387 1 11
                                              222 388 389 3 391 95 11 390 95
                                              392 0 95 0 394 2 95 0 11 15 395 2
                                              95 0 0 0 396 2 110 0 0 15 397 2
                                              217 0 0 15 398 2 11 0 0 0 399 1
                                              11 400 0 401 1 11 0 388 402 1 11
                                              403 0 404 1 11 0 0 405 3 11 0 0
                                              388 0 406 1 95 15 0 407 1 11 48 0
                                              408 2 409 23 0 0 410 2 48 0 0 0
                                              411 1 99 413 0 414 1 11 0 222 415
                                              2 417 0 0 0 418 1 421 420 420 422
                                              2 62 0 0 0 423 2 329 48 424 0 425
                                              3 0 23 21 21 92 290 2 0 17 232 21
                                              233 3 0 17 21 11 169 241 1 0 17 8
                                              190 1 0 58 21 60 6 0 122 48 21 8
                                              8 48 38 179 2 0 17 304 308 383 6
                                              0 167 48 21 8 8 48 38 168 6 0 112
                                              48 21 8 8 48 38 113 6 0 126 48 21
                                              8 8 48 38 127 1 0 23 304 356 2 0
                                              11 11 390 393 3 0 227 21 92 93
                                              228 3 0 227 21 92 93 242 3 0 90
                                              21 92 93 94 2 0 343 304 92 381 3
                                              0 108 21 8 48 109 2 0 8 21 48 186
                                              3 0 17 21 48 38 183 3 0 23 21 48
                                              38 185 4 0 417 304 308 345 346
                                              419 3 0 361 304 92 93 362 3 0 343
                                              304 345 346 347)))))
           '|lookupComplete|)) 
