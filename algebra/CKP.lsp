
(SDEFUN |CKP;setSimpMode;2Nni;1|
        ((|i| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPADCALL |i| (QREFELT % 19))) 

(SDEFUN |CKP;setRedMode;2Nni;2|
        ((|i| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT % 14)) (SETELT % 14 |i|) (EXIT |j|)))) 

(SDEFUN |CKP;setOutMode;2Nni;3|
        ((|i| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT % 16))
                    (COND ((QREFELT % 15) (LETT |j| (+ |j| 10))))
                    (SETELT % 15 (> |i| 10))
                    (COND ((QREFELT % 15) (SETELT % 16 (REM |i| 10)))
                          ('T (SETELT % 16 |i|)))
                    (EXIT |j|)))) 

(SDEFUN |CKP;write| ((|str| (|OutputForm|)) (% (|Void|)))
        (SEQ
         (COND
          ((QREFELT % 15)
           (SPADCALL (SPADCALL |str| (QREFELT % 25)) (QREFELT % 27)))
          ('T (SPADCALL |str| (QREFELT % 28))))
         (EXIT (SPADCALL (QREFELT % 29))))) 

(SDEFUN |CKP;outR|
        ((|q| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
         (% (|OutputForm|)))
        (COND
         ((ZEROP |s|)
          (SPADCALL (SPADCALL "R" (QREFELT % 31)) (SPADCALL |q| (QREFELT % 32))
                    (QREFELT % 33)))
         ('T
          (SPADCALL (SPADCALL "R" (QREFELT % 31))
                    (LIST (SPADCALL |q| (QREFELT % 32))
                          (SPADCALL (SPADCALL |s| (QREFELT % 32))
                                    (QREFELT % 34)))
                    (QREFELT % 36))))) 

(SDEFUN |CKP;outM|
        ((|q| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
         (% (|OutputForm|)))
        (COND
         ((ZEROP |s|)
          (SPADCALL (SPADCALL "M" (QREFELT % 31)) (SPADCALL |q| (QREFELT % 32))
                    (QREFELT % 33)))
         ('T
          (SPADCALL (SPADCALL "M" (QREFELT % 31))
                    (LIST (SPADCALL |q| (QREFELT % 32))
                          (SPADCALL (SPADCALL |s| (QREFELT % 32))
                                    (QREFELT % 34)))
                    (QREFELT % 36))))) 

(SDEFUN |CKP;info|
        ((|flag| (|NonNegativeInteger|)) (|q| (|NonNegativeInteger|))
         (|s| (|NonNegativeInteger|)) (|dim| (|NonNegativeInteger|))
         (% (|Void|)))
        (SEQ
         (COND ((< (QREFELT % 16) 4) (SPADCALL (QREFELT % 29)))
               (#1='T
                (SEQ (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                     (COND
                      ((EQL |flag| 1)
                       (|CKP;write|
                        (SPADCALL
                         (LIST (SPADCALL "Symbol " (QREFELT % 31))
                               (|CKP;outM| |q| |s| %)
                               (SPADCALL " involutive! " (QREFELT % 31))
                               (SPADCALL "Dimension: " (QREFELT % 31))
                               (SPADCALL |dim| (QREFELT % 32)))
                         (QREFELT % 39))
                        %))
                      ((EQL |flag| 2)
                       (|CKP;write|
                        (SPADCALL
                         (LIST (SPADCALL "Symbol " (QREFELT % 31))
                               (|CKP;outM| |q| |s| %)
                               (SPADCALL " not involutive! " (QREFELT % 31))
                               (SPADCALL "Dimension: " (QREFELT % 31))
                               (SPADCALL |dim| (QREFELT % 32)))
                         (QREFELT % 39))
                        %))
                      (#1#
                       (|CKP;write|
                        (SPADCALL
                         (LIST (SPADCALL "Equation " (QREFELT % 31))
                               (|CKP;outR| |q| |s| %)
                               (SPADCALL " not involutive! " (QREFELT % 31))
                               (SPADCALL "Dimension: " (QREFELT % 31))
                               (SPADCALL |dim| (QREFELT % 32)))
                         (QREFELT % 39))
                        %)))
                     (EXIT (SPADCALL (QREFELT % 29)))))))) 

(SDEFUN |CKP;display|
        ((|q| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
         (|Sys| (|List| D)) (|Symb| (|SparseEchelonMatrix| JB D))
         (|DimRq| (|NonNegativeInteger|)) (|DimMq| (|NonNegativeInteger|))
         (% (|Void|)))
        (SEQ
         (COND ((< (QREFELT % 16) 5) (SPADCALL (QREFELT % 29)))
               ('T
                (SEQ (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                     (|CKP;write|
                      (SPADCALL "****************************************"
                                (QREFELT % 31))
                      %)
                     (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                     (|CKP;write|
                      (SPADCALL (SPADCALL "Order: " (QREFELT % 31))
                                (SPADCALL |q| (QREFELT % 32)) (QREFELT % 40))
                      %)
                     (|CKP;write|
                      (SPADCALL (SPADCALL "Projections: " (QREFELT % 31))
                                (SPADCALL |s| (QREFELT % 32)) (QREFELT % 40))
                      %)
                     (|CKP;write|
                      (SPADCALL
                       (SPADCALL
                        "System without prolonged equations. Dimension: "
                        (QREFELT % 31))
                       (SPADCALL |DimRq| (QREFELT % 32)) (QREFELT % 40))
                      %)
                     (|CKP;write| (SPADCALL |Sys| (QREFELT % 42)) %)
                     (COND
                      ((> (QREFELT % 16) 5)
                       (SEQ (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                            (|CKP;write|
                             (SPADCALL
                              (SPADCALL "Symbol. Dimension: " (QREFELT % 31))
                              (SPADCALL |DimMq| (QREFELT % 32)) (QREFELT % 40))
                             %)
                            (EXIT
                             (|CKP;write| (SPADCALL |Symb| (QREFELT % 44))
                              %)))))
                     (EXIT (SPADCALL (QREFELT % 29)))))))) 

(SDEFUN |CKP;displayIntCond|
        ((|s| (|NonNegativeInteger|)) (|Cond| (|List| D)) (% (|Void|)))
        (SEQ
         (COND ((< (QREFELT % 16) 3) (SPADCALL (QREFELT % 29)))
               ('T
                (SEQ (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                     (|CKP;write|
                      (SPADCALL
                       (LIST (SPADCALL "======= " (QREFELT % 31))
                             (SPADCALL |s| (QREFELT % 32))
                             (SPADCALL ". Projection =======" (QREFELT % 31)))
                       (QREFELT % 39))
                      %)
                     (|CKP;write|
                      (SPADCALL "Integrability condition(s)" (QREFELT % 31)) %)
                     (|CKP;write| (SPADCALL |Cond| (QREFELT % 42)) %)
                     (|CKP;write|
                      (SPADCALL "=============================" (QREFELT % 31))
                      %)
                     (EXIT (SPADCALL (QREFELT % 29)))))))) 

(SDEFUN |CKP;displayCartan|
        ((|Sys| (|List| D)) (|dim| (|NonNegativeInteger|))
         (|q| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
         (|CarChar| (|List| (|NonNegativeInteger|))) (% (|Void|)))
        (SPROG ((#1=#:G50 NIL) (|cc| NIL) (#2=#:G51 NIL))
               (SEQ
                (COND ((EQL (QREFELT % 16) 0) (SPADCALL (QREFELT % 29)))
                      (#3='T
                       (SEQ (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                            (|CKP;write|
                             (SPADCALL
                              "*************** Final Result ***************"
                              (QREFELT % 31))
                             %)
                            (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                            (|CKP;write|
                             (SPADCALL
                              (LIST (SPADCALL "Equation " (QREFELT % 31))
                                    (|CKP;outR| |q| |s| %)
                                    (SPADCALL " involutive!" (QREFELT % 31)))
                              (QREFELT % 39))
                             %)
                            (|CKP;write|
                             (SPADCALL
                              (SPADCALL
                               "System without prolonged equations. Dimension: "
                               (QREFELT % 31))
                              (SPADCALL |dim| (QREFELT % 32)) (QREFELT % 40))
                             %)
                            (|CKP;write| (SPADCALL |Sys| (QREFELT % 42)) %)
                            (COND
                             ((> (QREFELT % 16) 1)
                              (SEQ
                               (|CKP;write| (SPADCALL " " (QREFELT % 31)) %)
                               (EXIT
                                (COND
                                 ((ZEROP
                                   (SPADCALL (ELT % 47) |CarChar| 0
                                             (QREFELT % 50)))
                                  (|CKP;write|
                                   (SPADCALL "System of finite type."
                                             (QREFELT % 31))
                                   %))
                                 (#3#
                                  (|CKP;write|
                                   (SPADCALL
                                    (SPADCALL "Cartan characters: "
                                              (QREFELT % 31))
                                    (SPADCALL
                                     (PROGN
                                      (LETT #1# NIL)
                                      (SEQ (LETT |cc| NIL) (LETT #2# |CarChar|)
                                           G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |cc| (CAR #2#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #1#
                                                   (CONS
                                                    (SPADCALL |cc|
                                                              (QREFELT % 32))
                                                    #1#))))
                                           (LETT #2# (CDR #2#)) (GO G190) G191
                                           (EXIT (NREVERSE #1#))))
                                     (QREFELT % 51))
                                    (QREFELT % 40))
                                   %)))))))
                            (EXIT (SPADCALL (QREFELT % 29))))))))) 

(SDEFUN |CKP;stirling;4Nni;11|
        ((|i| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
         (|q| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|ans| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G88 NIL)
          (#2=#:G89 NIL) (#3=#:G90 NIL) (|j| NIL) (#4=#:G91 NIL) (#5=#:G77 NIL)
          (#6=#:G80 NIL) (#7=#:G81 NIL) (|res| (|NonNegativeInteger|)))
         (SEQ
          (COND ((> |k| |i|) (|error| "Symmetric polynomial not defined"))
                ((OR (ZEROP |i|) (ZEROP |k|)) 1)
                ('T
                 (SEQ
                  (LETT |ans|
                        (SPADCALL (VECTOR |i| |k| |q|) (QREFELT % 55)
                                  (QREFELT % 57)))
                  (EXIT
                   (COND ((QEQCAR |ans| 0) (QCDR |ans|))
                         (#8='T
                          (SEQ
                           (COND
                            ((EQL |k| 1)
                             (LETT |res|
                                   (SPADCALL (ELT % 47)
                                             (PROGN
                                              (LETT #1# NIL)
                                              (SEQ (LETT |j| 1) (LETT #2# |i|)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |j| #2#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #1#
                                                           (CONS (+ |q| |j|)
                                                                 #1#))))
                                                   (LETT |j| (|inc_SI| |j|))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #1#))))
                                             (QREFELT % 58))))
                            ((EQL |k| |i|)
                             (LETT |res|
                                   (SPADCALL (ELT % 59)
                                             (PROGN
                                              (LETT #3# NIL)
                                              (SEQ (LETT |j| 1) (LETT #4# |i|)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |j| #4#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #3#
                                                           (CONS (+ |q| |j|)
                                                                 #3#))))
                                                   (LETT |j| (|inc_SI| |j|))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #3#))))
                                             (QREFELT % 58))))
                            (#8#
                             (LETT |res|
                                   (+
                                    (SPADCALL
                                     (PROG1 (LETT #5# (- |i| 1))
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     |k| |q| (QREFELT % 60))
                                    (* (+ |q| |i|)
                                       (SPADCALL
                                        (PROG1 (LETT #6# (- |i| 1))
                                          (|check_subtype2| (>= #6# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #6#))
                                        (PROG1 (LETT #7# (- |k| 1))
                                          (|check_subtype2| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #7#))
                                        |q| (QREFELT % 60)))))))
                           (EXIT
                            (SPADCALL (QREFELT % 55) (VECTOR |i| |k| |q|) |res|
                                      (QREFELT % 61))))))))))))) 

(SDEFUN |CKP;alpha;Nni2L;12|
        ((|q| (|NonNegativeInteger|)) (|beta| (|List| (|NonNegativeInteger|)))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G96 NIL) (|i| NIL) (#2=#:G98 NIL) (|bi| NIL) (#3=#:G97 NIL)
          (#4=#:G93 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 10)) (LETT |bi| NIL)
                (LETT #3# |beta|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |bi| (CAR #3#)) NIL)
                      (|greater_SI| |i| #2#))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #1#
                        (CONS
                         (PROG1
                             (LETT #4#
                                   (-
                                    (* (QREFELT % 12)
                                       (SPADCALL
                                        (- (- (+ |q| (QREFELT % 10)) |i|) 1)
                                        (- |q| 1) (QREFELT % 63)))
                                    |bi|))
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         #1#))))
                (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT (NREVERSE #1#))))))) 

(SDEFUN |CKP;hilbert;LSup;13|
        ((|CarChar| (|List| (|NonNegativeInteger|)))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|i| NIL) (#1=#:G109 NIL) (|k| NIL) (#2=#:G110 NIL)
          (|kfac| #3=(|Integer|)) (#4=#:G102 NIL)
          (|coeff| (|Fraction| (|Integer|)))
          (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|ifac| #3#))
         (SEQ (LETT |res| (|spadConstant| % 66)) (LETT |ifac| 1)
              (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 10) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |coeff| (|spadConstant| % 68))
                        (LETT |kfac| |ifac|)
                        (SEQ (LETT |k| |i|) (LETT #2# (- (QREFELT % 10) 1))
                             G190 (COND ((> |k| #2#) (GO G191)))
                             (SEQ
                              (COND ((> |k| 0) (LETT |kfac| (* |k| |kfac|))))
                              (EXIT
                               (LETT |coeff|
                                     (SPADCALL |coeff|
                                               (SPADCALL
                                                (*
                                                 (SPADCALL |CarChar| (+ |k| 1)
                                                           (QREFELT % 69))
                                                 (SPADCALL |k|
                                                           (PROG1
                                                               (LETT #4#
                                                                     (- |k|
                                                                        |i|))
                                                             (|check_subtype2|
                                                              (>= #4# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #4#))
                                                           0 (QREFELT % 60)))
                                                |kfac| (QREFELT % 70))
                                               (QREFELT % 71)))))
                             (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |coeff| (QREFELT % 72)) |i|
                                         (QREFELT % 73))
                                        (QREFELT % 74)))
                        (EXIT (COND ((> |i| 0) (LETT |ifac| (* |i| |ifac|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CKP;alphaHilbert;SupL;14|
        ((|hilp| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|i| NIL) (|ifac| #1=(|Integer|)) (|k| NIL) (#2=#:G256 NIL)
          (#3=#:G117 NIL) (#4=#:G118 NIL) (|sum| (|Fraction| (|Integer|)))
          (|kfac| #1#) (#5=#:G249 NIL) (|ai| (|Integer|)) (#6=#:G251 NIL)
          (|res| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |res| NIL)
              (LETT |ifac| (SPADCALL (QREFELT % 10) (QREFELT % 76)))
              (SEQ (LETT |i| (QREFELT % 10)) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ (LETT |sum| (|spadConstant| % 68)) (LETT |kfac| |ifac|)
                        (LETT |ifac| (|quotient_INT| |ifac| |i|))
                        (SEQ (LETT |k| (+ |i| 1)) (LETT #2# (QREFELT % 10))
                             G190 (COND ((> |k| #2#) (GO G191)))
                             (SEQ
                              (LETT |sum|
                                    (SPADCALL |sum|
                                              (SPADCALL
                                               (*
                                                (SPADCALL
                                                 (PROG1 (LETT #3# (- |k| 1))
                                                   (|check_subtype2| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #3#))
                                                 (PROG1 (LETT #4# (- |k| |i|))
                                                   (|check_subtype2| (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#))
                                                 0 (QREFELT % 60))
                                                (SPADCALL |res| (- |k| |i|)
                                                          (QREFELT % 69)))
                                               |kfac| (QREFELT % 70))
                                              (QREFELT % 71)))
                              (EXIT (LETT |kfac| (* |k| |kfac|))))
                             (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                        (LETT |ai|
                              (SPADCALL
                               (SPADCALL |ifac|
                                         (SPADCALL
                                          (SPADCALL |hilp|
                                                    (PROG1 (LETT #5# (- |i| 1))
                                                      (|check_subtype2|
                                                       (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                                    (QREFELT % 77))
                                          |sum| (QREFELT % 78))
                                         (QREFELT % 79))
                               (QREFELT % 80)))
                        (EXIT
                         (LETT |res|
                               (CONS
                                (PROG1 (LETT #6# |ai|)
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#))
                                |res|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CKP;arbFunctions;NniILL;15|
        ((|q| (|NonNegativeInteger|)) (|j| (|Integer|))
         (|CarChar| (|List| (|NonNegativeInteger|))) (% (|List| (|Integer|))))
        (SPROG
         ((|i| NIL) (|ifac| (|Integer|)) (|k| NIL) (#1=#:G307 NIL)
          (#2=#:G259 NIL) (|ki| (|NonNegativeInteger|)) (|kfac| (|Integer|))
          (#3=#:G290 NIL) (#4=#:G299 NIL) (#5=#:G300 NIL)
          (|t| (|Fraction| (|Integer|))) (|res| (|List| (|Integer|))))
         (SEQ
          (LETT |res|
                (LIST (SPADCALL |CarChar| (QREFELT % 10) (QREFELT % 82))))
          (LETT |ifac| (SPADCALL (- (QREFELT % 10) 1) (QREFELT % 76)))
          (SEQ (LETT |i| (- (QREFELT % 10) 1)) G190
               (COND ((< |i| 1) (GO G191)))
               (SEQ (LETT |t| (|spadConstant| % 68))
                    (LETT |ifac| (|quotient_INT| |ifac| |i|))
                    (LETT |kfac| |ifac|)
                    (SEQ (LETT |k| |i|) (LETT #1# (- (QREFELT % 10) 1)) G190
                         (COND ((> |k| #1#) (GO G191)))
                         (SEQ
                          (LETT |ki|
                                (PROG1 (LETT #2# (+ (- |k| |i|) 1))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#)))
                          (LETT |kfac| (* |k| |kfac|))
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL
                                            (-
                                             (*
                                              (SPADCALL |CarChar| (+ |k| 1)
                                                        (QREFELT % 69))
                                              (SPADCALL
                                               (PROG1 (LETT #3# |k|)
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#))
                                               |ki| 0 (QREFELT % 60)))
                                             (*
                                              (SPADCALL |res| |ki|
                                                        (QREFELT % 84))
                                              (SPADCALL
                                               (PROG1 (LETT #4# |k|)
                                                 (|check_subtype2| (>= #4# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #4#))
                                               |ki|
                                               (PROG1 (LETT #5# (+ |q| |j|))
                                                 (|check_subtype2| (>= #5# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #5#))
                                               (QREFELT % 60))))
                                            |kfac| (QREFELT % 70))
                                           (QREFELT % 71)))))
                         (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                    (LETT |t|
                          (SPADCALL
                           (SPADCALL (SPADCALL |CarChar| |i| (QREFELT % 69))
                                     (QREFELT % 85))
                           (SPADCALL |t| |ifac| (QREFELT % 86))
                           (QREFELT % 71)))
                    (EXIT
                     (LETT |res| (CONS (SPADCALL |t| (QREFELT % 80)) |res|))))
               (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |CKP;gauge;NniILL;16|
        ((|q| (|NonNegativeInteger|)) (|j| (|Integer|))
         (|gamma| (|List| (|NonNegativeInteger|))) (% (|List| (|Integer|))))
        (SPROG
         ((|gp| (|NonNegativeInteger|)) (|n1| (|Integer|))
          (|rnf| (|Fraction| (|Integer|))) (|i| NIL) (|g| NIL) (#1=#:G339 NIL)
          (|l| NIL) (#2=#:G338 NIL) (#3=#:G316 NIL) (#4=#:G317 NIL)
          (|ifac| (|Integer|)) (|k| NIL) (#5=#:G340 NIL) (#6=#:G320 NIL)
          (|ki| (|NonNegativeInteger|)) (|kfac| (|Integer|)) (#7=#:G329 NIL)
          (#8=#:G330 NIL) (|t| (|Fraction| (|Integer|)))
          (|res| (|List| (|Integer|))))
         (SEQ (LETT |gp| (SPADCALL |gamma| (QREFELT % 88)))
              (EXIT
               (COND ((ZEROP |gp|) (SPADCALL (QREFELT % 10) 0 (QREFELT % 89)))
                     ('T
                      (SEQ
                       (LETT |res|
                             (LIST
                              (SPADCALL (ELT % 47) |gamma| (QREFELT % 58))))
                       (LETT |n1| (- (QREFELT % 10) 1))
                       (LETT |ifac| (SPADCALL |n1| (QREFELT % 76)))
                       (LETT |rnf| (SPADCALL 1 |ifac| (QREFELT % 70)))
                       (SEQ (LETT |i| |n1|) G190 (COND ((< |i| 1) (GO G191)))
                            (SEQ (LETT |t| (|spadConstant| % 68))
                                 (SEQ (LETT |g| NIL) (LETT #1# |gamma|)
                                      (LETT |l| 0) (LETT #2# (- |gp| 1)) G190
                                      (COND
                                       ((OR (|greater_SI| |l| #2#) (ATOM #1#)
                                            (PROGN (LETT |g| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |t|
                                              (SPADCALL |t|
                                                        (SPADCALL
                                                         (* |g|
                                                            (SPADCALL
                                                             (PROG1
                                                                 (LETT #3#
                                                                       |n1|)
                                                               (|check_subtype2|
                                                                (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                                             (PROG1
                                                                 (LETT #4#
                                                                       (-
                                                                        (QREFELT
                                                                         % 10)
                                                                        |i|))
                                                               (|check_subtype2|
                                                                (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                                             (+ |q| |l|)
                                                             (QREFELT % 60)))
                                                         (QREFELT % 85))
                                                        (QREFELT % 71)))))
                                      (LETT |l|
                                            (PROG1 (|inc_SI| |l|)
                                              (LETT #1# (CDR #1#))))
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |t| (SPADCALL |t| |rnf| (QREFELT % 90)))
                                 (LETT |ifac| (|quotient_INT| |ifac| |i|))
                                 (LETT |kfac| |ifac|)
                                 (SEQ (LETT |k| |i|) (LETT #5# |n1|) G190
                                      (COND ((> |k| #5#) (GO G191)))
                                      (SEQ
                                       (LETT |ki|
                                             (PROG1
                                                 (LETT #6# (+ (- |k| |i|) 1))
                                               (|check_subtype2| (>= #6# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #6#)))
                                       (LETT |kfac| (* |k| |kfac|))
                                       (EXIT
                                        (LETT |t|
                                              (SPADCALL |t|
                                                        (SPADCALL
                                                         (*
                                                          (SPADCALL |res| |ki|
                                                                    (QREFELT %
                                                                             84))
                                                          (SPADCALL
                                                           (PROG1
                                                               (LETT #7# |k|)
                                                             (|check_subtype2|
                                                              (>= #7# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                                           |ki|
                                                           (PROG1
                                                               (LETT #8#
                                                                     (+ |q|
                                                                        |j|))
                                                             (|check_subtype2|
                                                              (>= #8# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                                           (QREFELT % 60)))
                                                         |kfac| (QREFELT % 70))
                                                        (QREFELT % 78)))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |t|
                                       (SPADCALL |t| |ifac| (QREFELT % 86)))
                                 (EXIT
                                  (LETT |res|
                                        (CONS (SPADCALL |t| (QREFELT % 80))
                                              |res|))))
                            (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                       (EXIT |res|)))))))) 

(SDEFUN |CKP;gaugeHilbert;NniLSup;17|
        ((|q| (|NonNegativeInteger|)) (|gamma| (|List| (|NonNegativeInteger|)))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|gp| (|NonNegativeInteger|)) (|rnf| (|Fraction| (|Integer|)))
          (|k| NIL) (#1=#:G351 NIL) (|g| NIL) (#2=#:G353 NIL) (|l| NIL)
          (#3=#:G352 NIL) (#4=#:G343 NIL) (#5=#:G344 NIL)
          (|t| (|NonNegativeInteger|))
          (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (SEQ (LETT |gp| (SPADCALL |gamma| (QREFELT % 88)))
              (EXIT
               (COND ((ZEROP |gp|) (|spadConstant| % 66))
                     ('T
                      (SEQ (LETT |res| (|spadConstant| % 66))
                           (LETT |rnf|
                                 (SPADCALL 1
                                           (SPADCALL (- (QREFELT % 10) 1)
                                                     (QREFELT % 76))
                                           (QREFELT % 70)))
                           (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT % 10) 1))
                                G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                (SEQ (LETT |t| 0)
                                     (SEQ (LETT |g| NIL) (LETT #2# |gamma|)
                                          (LETT |l| 0) (LETT #3# (- |gp| 1))
                                          G190
                                          (COND
                                           ((OR (|greater_SI| |l| #3#)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |g| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |t|
                                                  (+ |t|
                                                     (* |g|
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #4#
                                                                   (-
                                                                    (QREFELT %
                                                                             10)
                                                                    1))
                                                           (|check_subtype2|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                                         (PROG1
                                                             (LETT #5#
                                                                   (-
                                                                    (-
                                                                     (QREFELT %
                                                                              10)
                                                                     |k|)
                                                                    1))
                                                           (|check_subtype2|
                                                            (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                                         (+ |q| |l|)
                                                         (QREFELT % 60)))))))
                                          (LETT |l|
                                                (PROG1 (|inc_SI| |l|)
                                                  (LETT #2# (CDR #2#))))
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |res|
                                            (SPADCALL |res|
                                                      (SPADCALL
                                                       (SPADCALL |t| |rnf|
                                                                 (QREFELT %
                                                                          92))
                                                       |k| (QREFELT % 73))
                                                      (QREFELT % 74)))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |CKP;bound;4Nni;18|
        ((|nn| (|NonNegativeInteger|)) (|mm| (|NonNegativeInteger|))
         (|qq| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G354 NIL) (|tmp| (|NonNegativeInteger|)) (#2=#:G355 NIL)
          (#3=#:G358 NIL))
         (SEQ
          (COND
           ((EQL |qq| 1)
            (COND ((ZEROP |nn|) 0)
                  (#4='T
                   (SEQ
                    (LETT |tmp|
                          (SPADCALL
                           (PROG1 (LETT #1# (- |nn| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           |mm| 1 (QREFELT % 94)))
                    (EXIT
                     (PROG1
                         (LETT #2#
                               (+ (+ 1 |tmp|)
                                  (* |mm|
                                     (SPADCALL (+ |nn| |tmp|) (- |nn| 1)
                                               (QREFELT % 63)))))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#)))))))
           (#4#
            (SPADCALL |nn|
                      (PROG1
                          (LETT #3#
                                (* |mm|
                                   (SPADCALL (- (+ |qq| |nn|) 1) |nn|
                                             (QREFELT % 63))))
                        (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #3#))
                      1 (QREFELT % 94))))))) 

(SDEFUN |CKP;complete;JdeV;19|
        ((|De| (|JetDifferentialEquation| JB D)) (% (|Void|)))
        (SPADCALL |De| (QREFELT % 96))) 

(SDEFUN |CKP;complete2;JdeR;20|
        ((|De| (|JetDifferentialEquation| JB D))
         (%
          (|Record| (|:| |IDe| (|JetDifferentialEquation| JB D))
                    (|:| |ISys| (|List| D))
                    (|:| |Order| (|NonNegativeInteger|))
                    (|:| |NumProj| (|NonNegativeInteger|))
                    (|:| |Dim| (|NonNegativeInteger|))
                    (|:| |CarChar| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|solved?| (|Boolean|)) (#1=#:G396 NIL) (#2=#:G370 NIL)
          (#3=#:G372 NIL) (|q| (|NonNegativeInteger|))
          (|q1| (|NonNegativeInteger|)) (|dimSq| #4=(|NonNegativeInteger|))
          (|dimSq1| #4#)
          (|PrevMV|
           (|Record| (|:| |Rank| (|NonNegativeInteger|))
                     (|:| |NumMultVar| (|NonNegativeInteger|))
                     (|:| |Betas| (|List| (|NonNegativeInteger|)))))
          (|PrevDeDim| #5=(|NonNegativeInteger|))
          (|PrevSymbDim| (|NonNegativeInteger|))
          (|CurSymb| (|SparseEchelonMatrix| JB D))
          (|CurMV|
           (|Record| (|:| |Rank| (|NonNegativeInteger|))
                     (|:| |NumMultVar| (|NonNegativeInteger|))
                     (|:| |Betas| (|List| (|NonNegativeInteger|)))))
          (#6=#:G378 NIL) (|CurSymbDim| #7=(|NonNegativeInteger|))
          (|CurDeDim| #5#) (|InvSymb| (|Boolean|))
          (|ProjDe| (|JetDifferentialEquation| JB D)) (#8=#:G386 NIL)
          (|ProjDeDim| #5#) (|InvDe| (|Boolean|)) (|s| #7#)
          (|CompSys| (|List| D)) (|PrevDe| #9=(|JetDifferentialEquation| JB D))
          (PD
           (|Record| (|:| |SDe| (|JetDifferentialEquation| JB D))
                     (|:| IC (|List| D))))
          (|CurDe| #9#) (|ICs| (|List| D))
          (|PrevSymb| (|SparseEchelonMatrix| JB D))
          (|Cartan| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |PrevDe| (QCAR (SPADCALL |De| (QREFELT % 99))))
              (LETT |CompSys| (SPADCALL |PrevDe| (QREFELT % 100)))
              (COND
               ((> (QREFELT % 14) 0)
                (LETT |CompSys| (SPADCALL |CompSys| (QREFELT % 101)))))
              (LETT PD (SPADCALL |PrevDe| (QREFELT % 102)))
              (LETT |CurDe| (QCAR PD)) (LETT |ICs| (QCDR PD))
              (COND
               ((> (QREFELT % 14) 0)
                (COND
                 ((NULL (NULL |ICs|))
                  (LETT |ICs|
                        (SPADCALL (SPADCALL |ICs| |CompSys| (QREFELT % 103))
                                  (QREFELT % 101)))))))
              (LETT |q| (SPADCALL |De| (QREFELT % 104))) (LETT |s| 0)
              (LETT |q1| (+ |q| 1))
              (LETT |dimSq| (SPADCALL |q| (QREFELT % 105)))
              (LETT |dimSq1| (SPADCALL |q1| (QREFELT % 105)))
              (LETT |InvDe| NIL) (LETT |InvSymb| (QREFELT % 13))
              (LETT |solved?| (> (QREFELT % 16) 5))
              (SEQ (LETT #1# NIL) G190 (COND (#1# (GO G191)))
                   (SEQ
                    (LETT |PrevDeDim| (SPADCALL |PrevDe| |q| (QREFELT % 106)))
                    (LETT |CurDeDim| (SPADCALL |CurDe| |q1| (QREFELT % 106)))
                    (COND
                     ((NULL (QREFELT % 13))
                      (SEQ
                       (LETT |PrevSymb|
                             (SPADCALL |PrevDe| |solved?| (QREFELT % 108)))
                       (LETT |PrevMV| (SPADCALL |PrevSymb| (QREFELT % 110)))
                       (LETT |PrevSymbDim|
                             (PROG1 (LETT #2# (- |dimSq| (QVELT |PrevMV| 0)))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#)))
                       (COND
                        ((ZEROP |PrevSymbDim|)
                         (SEQ
                          (LETT |CurSymb|
                                (SPADCALL |PrevSymb| (QREFELT % 111)))
                          (LETT |CurMV| (SPADCALL |PrevMV| (QREFELT % 112)))
                          (EXIT (LETT |CurSymbDim| 0))))
                        ('T
                         (SEQ
                          (LETT |CurSymb|
                                (SPADCALL |CurDe| |solved?| (QREFELT % 108)))
                          (LETT |CurMV| (SPADCALL |CurSymb| (QREFELT % 110)))
                          (EXIT
                           (LETT |CurSymbDim|
                                 (PROG1
                                     (LETT #3# (- |dimSq1| (QVELT |CurMV| 0)))
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#)))))))
                       (EXIT
                        (LETT |InvSymb|
                              (EQL (QVELT |PrevMV| 1) (QVELT |CurMV| 0)))))))
                    (|CKP;display| |q| |s| |CompSys| |PrevSymb| |PrevDeDim|
                     |PrevSymbDim| %)
                    (SEQ G190 (COND ((NULL (NULL |InvSymb|)) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((< (QVELT |CurMV| 0) (QVELT |PrevMV| 1))
                             (|error|
                              "independent equations lost during prolongation!!!"))
                            ('T
                             (SEQ (|CKP;info| 2 |q| |s| |PrevSymbDim| %)
                                  (LETT |q| |q1|) (LETT |q1| (+ |q1| 1))
                                  (LETT |dimSq| |dimSq1|)
                                  (LETT |dimSq1|
                                        (SPADCALL |q1| (QREFELT % 105)))
                                  (LETT |PrevDe| |CurDe|)
                                  (LETT |PrevSymb| |CurSymb|)
                                  (LETT |PrevMV| |CurMV|)
                                  (LETT |PrevDeDim| |CurDeDim|)
                                  (LETT |PrevSymbDim| |CurSymbDim|)
                                  (LETT PD (SPADCALL |PrevDe| (QREFELT % 102)))
                                  (LETT |CurDe| (QCAR PD))
                                  (COND
                                   ((ZEROP |PrevSymbDim|)
                                    (SEQ
                                     (LETT |CurSymb|
                                           (SPADCALL |PrevSymb|
                                                     (QREFELT % 111)))
                                     (LETT |CurMV|
                                           (SPADCALL |PrevMV| (QREFELT % 112)))
                                     (EXIT (LETT |CurSymbDim| 0))))
                                   ('T
                                    (SEQ
                                     (LETT |CurSymb|
                                           (SPADCALL |CurDe| |solved?|
                                                     (QREFELT % 108)))
                                     (LETT |CurMV|
                                           (SPADCALL |CurSymb|
                                                     (QREFELT % 110)))
                                     (EXIT
                                      (LETT |CurSymbDim|
                                            (PROG1
                                                (LETT #6#
                                                      (- |dimSq1|
                                                         (QVELT |CurMV| 0)))
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#)))))))
                                  (LETT |CurDeDim|
                                        (SPADCALL |CurDe| |q1|
                                                  (QREFELT % 106)))
                                  (COND
                                   ((NULL (NULL (QCDR PD)))
                                    (COND
                                     ((> (QREFELT % 14) 0)
                                      (LETT |ICs|
                                            (SPADCALL
                                             (SPADCALL |ICs|
                                                       (SPADCALL (QCDR PD)
                                                                 |CompSys|
                                                                 (QREFELT %
                                                                          103))
                                                       (QREFELT % 113))
                                             (QREFELT % 101))))
                                     ('T
                                      (LETT |ICs|
                                            (SPADCALL |ICs| (QCDR PD)
                                                      (QREFELT % 113)))))))
                                  (EXIT
                                   (LETT |InvSymb|
                                         (EQL (QVELT |PrevMV| 1)
                                              (QVELT |CurMV| 0)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((QREFELT % 13)
                      (SEQ
                       (LETT |ProjDe| (SPADCALL |CurDe| |q| (QREFELT % 114)))
                       (EXIT
                        (LETT |ProjDeDim|
                              (SPADCALL |ProjDe| |q| (QREFELT % 106))))))
                     ('T
                      (SEQ (|CKP;info| 1 |q| |s| |PrevSymbDim| %)
                           (EXIT
                            (LETT |ProjDeDim|
                                  (PROG1 (LETT #8# (- |CurDeDim| |CurSymbDim|))
                                    (|check_subtype2| (>= #8# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #8#)))))))
                    (LETT |InvDe| (EQL |ProjDeDim| |PrevDeDim|))
                    (EXIT
                     (COND
                      ((NULL |InvDe|)
                       (SEQ (|CKP;info| 3 |q| |s| |PrevDeDim| %)
                            (LETT |s| (+ |s| 1))
                            (|CKP;displayIntCond| |s| |ICs| %)
                            (COND
                             ((> (QREFELT % 14) 0)
                              (LETT |CompSys|
                                    (SPADCALL
                                     (SPADCALL |CompSys| |ICs| (QREFELT % 113))
                                     (QREFELT % 101))))
                             ('T
                              (LETT |CompSys|
                                    (SPADCALL |CompSys| |ICs|
                                              (QREFELT % 113)))))
                            (COND ((QREFELT % 13) (LETT |PrevDe| |ProjDe|))
                                  ('T
                                   (LETT |PrevDe|
                                         (SPADCALL |CurDe| |q|
                                                   (QREFELT % 114)))))
                            (LETT PD (SPADCALL |CurDe| |q1| (QREFELT % 115)))
                            (LETT |CurDe| (QCAR PD))
                            (EXIT
                             (COND ((NULL (QCDR PD)) (LETT |ICs| NIL))
                                   ((> (QREFELT % 14) 0)
                                    (LETT |ICs|
                                          (SPADCALL
                                           (SPADCALL (QCDR PD) |CompSys|
                                                     (QREFELT % 103))
                                           (QREFELT % 101))))
                                   ('T (LETT |ICs| (QCDR PD))))))))))
                   (LETT #1# |InvDe|) (GO G190) G191 (EXIT NIL))
              (COND
               ((QREFELT % 13)
                (SEQ (LETT |PrevSymb| (SPADCALL |PrevDe| NIL (QREFELT % 108)))
                     (EXIT
                      (LETT |Cartan|
                            (LIST
                             (QVELT (SPADCALL |PrevSymb| (QREFELT % 117))
                                    3))))))
               ('T
                (LETT |Cartan|
                      (SPADCALL |q| (QVELT |PrevMV| 2) (QREFELT % 64)))))
              (|CKP;displayCartan| |CompSys| |PrevDeDim| |q| |s| |Cartan| %)
              (EXIT (VECTOR |PrevDe| |CompSys| |q| |s| |PrevDeDim| |Cartan|))))) 

(DECLAIM (NOTINLINE |CartanKuranishi;|)) 

(DEFUN |CartanKuranishi;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|CartanKuranishi| DV$1 DV$2))
          (LETT % (GETREFV 118))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CartanKuranishi| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 12 (SPADCALL (QREFELT % 11)))
          (QSETREFV % 13 (EQL (QREFELT % 10) 1))
          (QSETREFV % 14 0)
          (QSETREFV % 15 NIL)
          (QSETREFV % 16 0)
          (QSETREFV % 55 (SPADCALL (QREFELT % 54)))
          %))) 

(DEFUN |CartanKuranishi| (&REST #1=#:G397)
  (SPROG NIL
         (PROG (#2=#:G398)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CartanKuranishi|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartanKuranishi;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CartanKuranishi|)))))))))) 

(MAKEPROP '|CartanKuranishi| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|n| (4 . |numDepVar|) '|m|
              '|ode| '|redMode| '|TeX| '|Out| (|NonNegativeInteger|)
              (|JetDifferentialEquation| 6 7) (8 . |setSimpMode|)
              |CKP;setSimpMode;2Nni;1| |CKP;setRedMode;2Nni;2|
              |CKP;setOutMode;2Nni;3| (|OutputForm|) (|TexFormat|)
              (13 . |coerce|) (|Void|) (18 . |display|) (23 . |print|)
              (28 . |void|) (|String|) (32 . |message|) (37 . |coerce|)
              (42 . |sub|) (48 . |paren|) (|List| %) (53 . |supersub|)
              (59 . |1|) (63 . |1|) (67 . |hconcat|) (72 . |hconcat|)
              (|List| 7) (78 . |printSys|) (|SparseEchelonMatrix| 6 7)
              (83 . |coerce|) (88 . |0|) (92 . +) (98 . +) (|Mapping| 17 17 17)
              (|List| 17) (104 . |reduce|) (111 . |commaSeparate|)
              (|Record| (|:| II 17) (|:| K 17) (|:| Q 17)) (|Table| 52 17)
              (116 . |dictionary|) '|remember| (|Union| 17 '"failed")
              (120 . |search|) (126 . |reduce|) (132 . *)
              |CKP;stirling;4Nni;11| (138 . |setelt!|) (|Integer|)
              (145 . |binomial|) |CKP;alpha;Nni2L;12|
              (|SparseUnivariatePolynomial| 67) (151 . |0|) (|Fraction| 62)
              (155 . |0|) (159 . |qelt|) (165 . /) (171 . +) (177 . |retract|)
              (182 . |monomial|) (188 . +) |CKP;hilbert;LSup;13|
              (194 . |factorial|) (199 . |coefficient|) (205 . -) (211 . *)
              (217 . |retract|) |CKP;alphaHilbert;SupL;14| (222 . |elt|)
              (|List| 62) (228 . |qelt|) (234 . |coerce|) (239 . *)
              |CKP;arbFunctions;NniILL;15| (245 . |#|) (250 . |new|) (256 . *)
              |CKP;gauge;NniILL;16| (262 . *) |CKP;gaugeHilbert;NniLSup;17|
              |CKP;bound;4Nni;18|
              (|Record| (|:| |IDe| 18) (|:| |ISys| 41) (|:| |Order| 17)
                        (|:| |NumProj| 17) (|:| |Dim| 17) (|:| |CarChar| 49))
              |CKP;complete2;JdeR;20| |CKP;complete;JdeV;19|
              (|Record| (|:| |SDe| %) (|:| IC 41)) (268 . |simplify|)
              (273 . |retract|) (278 . |autoReduce|) (283 . |prolong|)
              (288 . |reduceMod|) (294 . |order|) (299 . |dimS|)
              (304 . |dimension|) (|Boolean|) (310 . |extractSymbol|)
              (|Record| (|:| |Rank| 17) (|:| |NumMultVar| 17) (|:| |Betas| 49))
              (316 . |analyseSymbol|) (321 . |prolongSymbol|)
              (326 . |prolongMV|) (331 . |concat!|) (337 . |project|)
              (343 . |prolong|)
              (|Record| (|:| |Ech| %) (|:| |Lt| (|Matrix| 7)) (|:| |Pivots| 41)
                        (|:| |Rank| 17))
              (349 . |rowEchelon|))
           '#(|stirling| 354 |setSimpMode| 361 |setRedMode| 366 |setOutMode|
              371 |hilbert| 376 |gaugeHilbert| 381 |gauge| 387 |complete2| 394
              |complete| 399 |bound| 404 |arbFunctions| 411 |alphaHilbert| 418
              |alpha| 423)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|setOutMode|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|setSimpMode|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|setRedMode|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|stirling|
                                 ((|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|alpha|
                                 ((|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|hilbert|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|alphaHilbert|
                                 ((|List| (|NonNegativeInteger|))
                                  (|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|arbFunctions|
                                 ((|List| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|) (|List| (|NonNegativeInteger|))))
                                T)
                              '((|gauge|
                                 ((|List| (|Integer|)) (|NonNegativeInteger|)
                                  (|Integer|) (|List| (|NonNegativeInteger|))))
                                T)
                              '((|gaugeHilbert|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|NonNegativeInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|bound|
                                 ((|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|complete|
                                 ((|Void|)
                                  (|JetDifferentialEquation| |#1| |#2|)))
                                T)
                              '((|complete2|
                                 ((|Record|
                                   (|:| |IDe|
                                        (|JetDifferentialEquation| |#1| |#2|))
                                   (|:| |ISys| (|List| |#2|))
                                   (|:| |Order| (|NonNegativeInteger|))
                                   (|:| |NumProj| (|NonNegativeInteger|))
                                   (|:| |Dim| (|NonNegativeInteger|))
                                   (|:| |CarChar|
                                        (|List| (|NonNegativeInteger|))))
                                  (|JetDifferentialEquation| |#1| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 117
                                            '(0 6 8 9 0 6 8 11 1 18 17 17 19 1
                                              24 0 23 25 1 24 26 0 27 1 23 26 0
                                              28 0 26 0 29 1 23 0 30 31 1 17 23
                                              0 32 2 23 0 0 0 33 1 23 0 0 34 2
                                              23 0 0 35 36 0 6 0 37 0 7 0 38 1
                                              23 0 35 39 2 23 0 0 0 40 1 18 23
                                              41 42 1 43 23 0 44 0 7 0 45 2 7 0
                                              0 0 46 2 17 0 0 0 47 3 49 17 48 0
                                              17 50 1 23 0 35 51 0 53 0 54 2 53
                                              56 52 0 57 2 49 17 48 0 58 2 17 0
                                              17 0 59 3 53 17 0 52 17 61 2 62 0
                                              0 0 63 0 65 0 66 0 67 0 68 2 49
                                              17 0 62 69 2 67 0 62 62 70 2 67 0
                                              0 0 71 1 67 67 0 72 2 65 0 67 17
                                              73 2 65 0 0 0 74 1 62 0 0 76 2 65
                                              67 0 17 77 2 67 0 0 0 78 2 67 0
                                              62 0 79 1 67 62 0 80 2 49 17 0 62
                                              82 2 83 62 0 62 84 1 67 0 62 85 2
                                              67 0 0 62 86 1 49 17 0 88 2 83 0
                                              17 62 89 2 67 0 0 67 90 2 67 0 17
                                              0 92 1 18 98 0 99 1 18 41 0 100 1
                                              7 35 35 101 1 18 98 0 102 2 7 35
                                              35 35 103 1 18 17 0 104 1 6 17 17
                                              105 2 18 17 0 17 106 2 18 43 0
                                              107 108 1 18 109 43 110 1 18 43
                                              43 111 1 18 109 109 112 2 41 0 0
                                              0 113 2 18 0 0 17 114 2 18 98 0
                                              17 115 1 43 116 0 117 3 0 17 17
                                              17 17 60 1 0 17 17 20 1 0 17 17
                                              21 1 0 17 17 22 1 0 65 49 75 2 0
                                              65 17 49 93 3 0 83 17 62 49 91 1
                                              0 95 18 96 1 0 26 18 97 3 0 17 17
                                              17 17 94 3 0 83 17 62 49 87 1 0
                                              49 65 81 2 0 49 17 49 64)))))
           '|lookupComplete|)) 
