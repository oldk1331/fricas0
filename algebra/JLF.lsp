
(SDEFUN |JLF;statistics;V;1| ((% (|Void|)))
        (SEQ
         (SPADCALL
          (SPADCALL (SPADCALL "Number of lazy differentiations" (QREFELT % 12))
                    (SPADCALL (QREFELT % 8) (QREFELT % 14)) (QREFELT % 15))
          (QREFELT % 17))
         (SPADCALL
          (SPADCALL
           (SPADCALL "Number of subsequent evaluations" (QREFELT % 12))
           (SPADCALL (QREFELT % 9) (QREFELT % 14)) (QREFELT % 15))
          (QREFELT % 17))
         (EXIT (SPADCALL (QREFELT % 18))))) 

(SDEFUN |JLF;emptyDer?| ((|der| (|LazyDer|)) (% (|Boolean|)))
        (SPROG ((#1=#:G87 NIL))
               (COND
                ((OR (SPADCALL (QVELT |der| 1) (CONS 1 '|0|) (QREFELT % 35))
                     (QEQCAR (QVELT |der| 2) 1))
                 NIL)
                ('T
                 (SPADCALL
                  (PROG2 (LETT #1# (QVELT |der| 2))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                    (|Union| (QREFELT % 7) %) #1#))
                  (QREFELT % 36)))))) 

(SDEFUN |JLF;groundFlag?| ((|exp| (%)) (% (|Boolean|)))
        (QVELT (SPADCALL |exp| (QREFELT % 37)) 2)) 

(SDEFUN |JLF;extract| ((|exp| (%)) (% (D)))
        (SPROG ((#1=#:G87 NIL))
               (PROG2
                   (LETT #1#
                         (QVELT
                          (SPADCALL
                           (|SPADfirst|
                            (QVELT (SPADCALL |exp| (QREFELT % 37)) 5))
                           (QREFELT % 38))
                          3))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                 (|Union| (QREFELT % 7) %) #1#)))) 

(SDEFUN |JLF;jetVars| ((|f| (|Union| D %)) (% (|List| JB)))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT % 40)))
              ('T (SPADCALL (QCDR |f|) (QREFELT % 41))))) 

(SDEFUN |JLF;greater|
        ((|lt1| (|Reference| |LazyTerm|)) (|lt2| (|Reference| |LazyTerm|))
         (% (|Boolean|)))
        (SPADCALL (QVELT (SPADCALL |lt1| (QREFELT % 38)) 0)
                  (QVELT (SPADCALL |lt2| (QREFELT % 38)) 0) (QREFELT % 42))) 

(SDEFUN |JLF;lazyTerm| ((|d| (D)) (% (|LazyTerm|)))
        (VECTOR (SPADCALL |d| (QREFELT % 43)) 'T 'T (CONS 0 |d|)
                (SPADCALL (QREFELT % 25) (QREFELT % 29)))) 

(SDEFUN |JLF;convert| ((|lt| (|LazyTerm|)) (% (%)))
        (SPROG ((JV (|List| JB)))
               (SEQ
                (LETT JV
                      (SPADCALL
                       (SPADCALL (ELT % 42) (|JLF;jetVars| (QVELT |lt| 3) %)
                                 (|JLF;jetVars|
                                  (QVELT
                                   (SPADCALL (QVELT |lt| 4) (QREFELT % 44)) 2)
                                  %)
                                 (QREFELT % 46))
                       (QREFELT % 47)))
                (EXIT
                 (SPADCALL
                  (VECTOR (QVELT |lt| 0) (QVELT |lt| 1) (QVELT |lt| 2) NIL JV
                          (LIST (SPADCALL |lt| (QREFELT % 31))))
                  (QREFELT % 48)))))) 

(SDEFUN |JLF;adapt|
        ((|rec| (|RepRec|)) (|newLazy| (|List| (|Reference| |LazyTerm|)))
         (% (|RepRec|)))
        (SPROG
         ((|lt| (|LazyTerm|)) (|newLD| (JB)) (|newSharp?| (|Boolean|))
          (|newJV1| (|List| JB)) (|newJV2| (|List| JB)))
         (SEQ
          (COND ((NULL |newLazy|) (QREFELT % 32))
                (#1='T
                 (SEQ
                  (LETT |lt| (SPADCALL (|SPADfirst| |newLazy|) (QREFELT % 38)))
                  (LETT |newLD| (QVELT |lt| 0))
                  (LETT |newSharp?|
                        (COND
                         ((QVELT |lt| 1)
                          (COND ((NULL (CDR |newLazy|)) 'T)
                                (#1#
                                 (SPADCALL |newLD|
                                           (QVELT
                                            (SPADCALL
                                             (SPADCALL |newLazy|
                                                       (QREFELT % 50))
                                             (QREFELT % 38))
                                            0)
                                           (QREFELT % 42)))))
                         (#1# NIL)))
                  (LETT |newJV1| (QVELT |rec| 3))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |newJV1|) NIL)
                                ('T
                                 (SPADCALL (|SPADfirst| |newJV1|) |newLD|
                                           (QREFELT % 42)))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |newJV1| (CDR |newJV1|)))) NIL
                       (GO G190) G191 (EXIT NIL))
                  (LETT |newJV2| (QVELT |rec| 4))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |newJV2|) NIL)
                                ('T
                                 (SPADCALL (|SPADfirst| |newJV2|) |newLD|
                                           (QREFELT % 42)))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |newJV2| (CDR |newJV2|)))) NIL
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR |newLD| |newSharp?| (QVELT |rec| 2) |newJV1|
                           |newJV2| |newLazy|)))))))) 

(SDEFUN |JLF;zeroU?| ((|f| (|Union| D %)) (% (|Boolean|)))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT % 51)))
              ('T (SPADCALL (QCDR |f|) (QREFELT % 52))))) 

(SDEFUN |JLF;oneU?| ((|f| (|Union| D %)) (% (|Boolean|)))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT % 36)))
              ('T (SPADCALL (QCDR |f|) (QREFELT % 53))))) 

(SDEFUN |JLF;minus| ((|f| (|Union| D %)) (% (|Union| D %)))
        (SPROG ((|fs| (%)))
               (SEQ
                (COND
                 ((QEQCAR |f| 0) (CONS 0 (SPADCALL (QCDR |f|) (QREFELT % 54))))
                 (#1='T
                  (SEQ (LETT |fs| (QCDR |f|))
                       (EXIT
                        (COND
                         ((|JLF;groundFlag?| (QCDR |f|) %)
                          (CONS 0
                                (SPADCALL (|JLF;extract| |fs| %)
                                          (QREFELT % 54))))
                         (#1# (CONS 1 (SPADCALL |fs| (QREFELT % 55)))))))))))) 

(SDEFUN |JLF;mult| ((|f| (|Union| D %)) (|g| (|Union| D %)) (% (|Union| D %)))
        (SPROG ((|fd| (D)) (|fs| (%)) (|gs| (%)))
               (SEQ
                (COND
                 ((QEQCAR |f| 0)
                  (SEQ (LETT |fd| (QCDR |f|))
                       (EXIT
                        (COND
                         ((QEQCAR |g| 0)
                          (CONS 0 (SPADCALL |fd| (QCDR |g|) (QREFELT % 56))))
                         (#1='T
                          (SEQ (LETT |gs| (QCDR |g|))
                               (EXIT
                                (COND
                                 ((|JLF;groundFlag?| |gs| %)
                                  (CONS 0
                                        (SPADCALL |fd| (|JLF;extract| |gs| %)
                                                  (QREFELT % 56))))
                                 (#1#
                                  (CONS 1
                                        (SPADCALL |fd| |gs|
                                                  (QREFELT % 57))))))))))))
                 (#1#
                  (SEQ (LETT |fs| (QCDR |f|))
                       (EXIT
                        (COND
                         ((QEQCAR |g| 0)
                          (CONS 1 (SPADCALL (QCDR |g|) |fs| (QREFELT % 57))))
                         (#1#
                          (SEQ (LETT |gs| (QCDR |g|))
                               (EXIT
                                (COND
                                 ((|JLF;groundFlag?| |gs| %)
                                  (CONS 1
                                        (SPADCALL (|JLF;extract| |gs| %) |fs|
                                                  (QREFELT % 57))))
                                 (#1#
                                  (CONS 1
                                        (SPADCALL |fs| |gs|
                                                  (QREFELT % 58)))))))))))))))) 

(SDEFUN |JLF;multLazy|
        ((|rlt1| (|Reference| |LazyTerm|)) (|rlt2| (|Reference| |LazyTerm|))
         (% (|Reference| |LazyTerm|)))
        (SPROG
         ((|lt1| (|LazyTerm|)) (|lt2| (|LazyTerm|)) (|resLD| (JB))
          (|resSharp?| (|Boolean|)) (|resEval?| (|Boolean|))
          (|resCoeff| (|Union| D %)) (|resDer| (|Reference| |LazyDer|)))
         (SEQ (LETT |lt1| (SPADCALL |rlt1| (QREFELT % 38)))
              (LETT |lt2| (SPADCALL |rlt2| (QREFELT % 38)))
              (COND
               ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT % 42))
                (SEQ (LETT |resLD| (QVELT |lt1| 0))
                     (EXIT (LETT |resSharp?| (QVELT |lt1| 1)))))
               ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT % 59))
                (SEQ (LETT |resLD| (QVELT |lt2| 0))
                     (EXIT (LETT |resSharp?| (QVELT |lt2| 1)))))
               (#1='T
                (SEQ (LETT |resLD| (QVELT |lt1| 0))
                     (EXIT
                      (LETT |resSharp?|
                            (COND ((QVELT |lt1| 1) 'T)
                                  (#1# (QVELT |lt2| 1))))))))
              (LETT |resEval?| NIL)
              (COND
               ((QVELT |lt1| 2)
                (SEQ
                 (LETT |resCoeff|
                       (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) %))
                 (EXIT
                  (COND
                   ((QVELT |lt2| 2)
                    (SEQ
                     (LETT |resDer| (SPADCALL (QREFELT % 25) (QREFELT % 29)))
                     (EXIT (LETT |resEval?| 'T))))
                   (#1# (LETT |resDer| (QVELT |lt2| 4)))))))
               ((QVELT |lt2| 2)
                (SEQ
                 (LETT |resCoeff|
                       (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) %))
                 (EXIT (LETT |resDer| (QVELT |lt1| 4)))))
               (#1#
                (SEQ
                 (LETT |resCoeff|
                       (|JLF;mult| (CONS 1 (|JLF;convert| |lt1| %))
                        (QVELT |lt2| 3) %))
                 (EXIT (LETT |resDer| (QVELT |lt2| 4))))))
              (EXIT
               (SPADCALL
                (VECTOR |resLD| |resSharp?| |resEval?| |resCoeff| |resDer|)
                (QREFELT % 31)))))) 

(SDEFUN |JLF;coerce;JB%;15| ((|jv| (JB)) (% (%)))
        (SPADCALL
         (VECTOR |jv| 'T 'T (LIST |jv|) NIL
                 (LIST
                  (SPADCALL
                   (VECTOR |jv| 'T 'T (CONS 0 (SPADCALL |jv| (QREFELT % 60)))
                           (SPADCALL (QREFELT % 25) (QREFELT % 29)))
                   (QREFELT % 31))))
         (QREFELT % 48))) 

(SDEFUN |JLF;coerce;D%;16| ((|d| (D)) (% (%)))
        (SPROG ((|ld| (JB)) (JV (|List| JB)))
               (SEQ (LETT |ld| (SPADCALL |d| (QREFELT % 43)))
                    (LETT JV (SPADCALL |d| (QREFELT % 40)))
                    (EXIT
                     (SPADCALL
                      (VECTOR |ld| 'T 'T JV NIL
                              (LIST
                               (SPADCALL
                                (VECTOR |ld| 'T 'T (CONS 0 |d|)
                                        (SPADCALL (QREFELT % 25)
                                                  (QREFELT % 29)))
                                (QREFELT % 31))))
                      (QREFELT % 48)))))) 

(SDEFUN |JLF;coerce;%D;17| ((|exp| (%)) (% (D)))
        (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT % 63)))
             (EXIT (|JLF;extract| |exp| %)))) 

(SDEFUN |JLF;printFun| ((|fun| (|Union| D %)) (% (|OutputForm|)))
        (COND ((QEQCAR |fun| 0) (SPADCALL (QCDR |fun|) (QREFELT % 65)))
              ('T (SPADCALL (QCDR |fun|) (QREFELT % 66))))) 

(SDEFUN |JLF;printDiff| ((|der| (|LazyDer|)) (% (|OutputForm|)))
        (COND ((QVELT |der| 0) (|JLF;printFun| (QVELT |der| 2) %))
              ('T
               (SPADCALL (SPADCALL "diff" (QREFELT % 12))
                         (LIST (|JLF;printFun| (QVELT |der| 2) %)
                               (SPADCALL (QVELT |der| 1) (QREFELT % 67)))
                         (QREFELT % 69))))) 

(SDEFUN |JLF;printLazyTerm| ((|lt| (|LazyTerm|)) (% (|OutputForm|)))
        (SPROG ((|co| (|Union| D %)))
               (SEQ
                (COND ((QVELT |lt| 2) (|JLF;printFun| (QVELT |lt| 3) %))
                      ('T
                       (SEQ (LETT |co| (QVELT |lt| 3))
                            (EXIT
                             (SPADCALL (|JLF;printFun| |co| %)
                                       (|JLF;printDiff|
                                        (SPADCALL (QVELT |lt| 4)
                                                  (QREFELT % 44))
                                        %)
                                       (QREFELT % 70))))))))) 

(SDEFUN |JLF;printLazy|
        ((|llt| (|List| (|Reference| |LazyTerm|))) (% (|OutputForm|)))
        (COND
         ((EQL (LENGTH |llt|) 1)
          (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT % 38))
           %))
         ('T
          (SPADCALL
           (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT % 38))
            %)
           (|JLF;printLazy| (CDR |llt|) %) (QREFELT % 71))))) 

(SDEFUN |JLF;coerce;%Of;22| ((|exp| (%)) (% (|OutputForm|)))
        (COND
         ((|JLF;groundFlag?| |exp| %)
          (SPADCALL (|JLF;extract| |exp| %) (QREFELT % 65)))
         ('T (|JLF;printLazy| (QVELT (SPADCALL |exp| (QREFELT % 37)) 5) %)))) 

(SDEFUN |JLF;collect;2%;23| ((|exp| (%)) (% (%)))
        (SPROG
         ((|rlt| NIL) (#1=#:G181 NIL) (|lt| (|LazyTerm|)) (|der| (|LazyDer|))
          (|prod| #2=(|Union| D %)) (#3=#:G87 NIL) (|d| (D))
          (|newEval?| #4=(|Boolean|)) (|newCoeff| #2#) (|newLD| (JB))
          (|newSharp?| #4#) (#5=#:G88 NIL) (|co| (D)) (|res| #4#)
          (|newLazy| (|List| (|Reference| |LazyTerm|))) (|rec| (|RepRec|)))
         (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
              (EXIT
               (COND
                ((NULL (QVELT |rec| 5))
                 (SEQ (SPADCALL |exp| (QREFELT % 32) (QREFELT % 72))
                      (EXIT |exp|)))
                ('T
                 (SEQ (LETT |d| (|spadConstant| % 27)) (LETT |res| 'T)
                      (LETT |newLazy| NIL)
                      (SEQ (LETT |rlt| NIL) (LETT #1# (QVELT |rec| 5)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |rlt| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT % 38)))
                                (EXIT
                                 (COND
                                  ((QVELT |lt| 2)
                                   (LETT |d|
                                         (SPADCALL |d|
                                                   (PROG2
                                                       (LETT #3#
                                                             (QVELT |lt| 3))
                                                       (QCDR #3#)
                                                     (|check_union2|
                                                      (QEQCAR #3# 0)
                                                      (QREFELT % 7)
                                                      (|Union| (QREFELT % 7) %)
                                                      #3#))
                                                   (QREFELT % 73))))
                                  ('T
                                   (SEQ
                                    (LETT |der|
                                          (SPADCALL (QVELT |lt| 4)
                                                    (QREFELT % 44)))
                                    (EXIT
                                     (COND
                                      ((QVELT |der| 0)
                                       (SEQ
                                        (COND
                                         ((|JLF;emptyDer?| |der| %)
                                          (LETT |prod| (QVELT |lt| 3)))
                                         ('T
                                          (LETT |prod|
                                                (|JLF;mult| (QVELT |der| 2)
                                                 (QVELT |lt| 3) %))))
                                        (COND
                                         ((OR (QEQCAR |prod| 0)
                                              (SPADCALL (QCDR |prod|)
                                                        (QREFELT % 74)))
                                          (SEQ
                                           (COND
                                            ((QEQCAR |prod| 0)
                                             (LETT |newCoeff| |prod|))
                                            ('T
                                             (LETT |newCoeff|
                                                   (CONS 0
                                                         (|JLF;extract|
                                                          (QCDR |prod|) %)))))
                                           (LETT |newEval?| 'T)
                                           (LETT |newLD|
                                                 (SPADCALL
                                                  (PROG2 (LETT #3# |newCoeff|)
                                                      (QCDR #3#)
                                                    (|check_union2|
                                                     (QEQCAR #3# 0)
                                                     (QREFELT % 7)
                                                     (|Union| (QREFELT % 7) %)
                                                     #3#))
                                                  (QREFELT % 43)))
                                           (LETT |newSharp?| 'T)
                                           (EXIT
                                            (LETT |d|
                                                  (SPADCALL |d|
                                                            (PROG2
                                                                (LETT #3#
                                                                      |newCoeff|)
                                                                (QCDR #3#)
                                                              (|check_union2|
                                                               (QEQCAR #3# 0)
                                                               (QREFELT % 7)
                                                               (|Union|
                                                                (QREFELT % 7)
                                                                %)
                                                               #3#))
                                                            (QREFELT % 73))))))
                                         ('T
                                          (SEQ (LETT |newEval?| NIL)
                                               (LETT |newCoeff| |prod|)
                                               (LETT |newLD| (QVELT |lt| 0))
                                               (LETT |newSharp?|
                                                     (QVELT |lt| 1))
                                               (EXIT (LETT |res| NIL)))))
                                        (SPADCALL |rlt|
                                                  (VECTOR |newLD| |newSharp?|
                                                          |newEval?| |newCoeff|
                                                          (SPADCALL
                                                           (QREFELT % 25)
                                                           (QREFELT % 29)))
                                                  (QREFELT % 75))
                                        (EXIT
                                         (COND
                                          ((NULL |newEval?|)
                                           (LETT |newLazy|
                                                 (SPADCALL |newLazy|
                                                           (LIST |rlt|)
                                                           (QREFELT %
                                                                    76))))))))
                                      ((QEQCAR (QVELT |lt| 3) 1)
                                       (COND
                                        ((SPADCALL
                                          (PROG2 (LETT #5# (QVELT |lt| 3))
                                              (QCDR #5#)
                                            (|check_union2| (QEQCAR #5# 1) %
                                                            (|Union|
                                                             (QREFELT % 7) %)
                                                            #5#))
                                          (QREFELT % 74))
                                         (SEQ
                                          (LETT |co|
                                                (|JLF;extract|
                                                 (PROG2
                                                     (LETT #5# (QVELT |lt| 3))
                                                     (QCDR #5#)
                                                   (|check_union2|
                                                    (QEQCAR #5# 1) %
                                                    (|Union| (QREFELT % 7) %)
                                                    #5#))
                                                 %))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |co| (QREFELT % 51))
                                             (SPADCALL |rlt|
                                                       (|JLF;lazyTerm|
                                                        (|spadConstant| % 27)
                                                        %)
                                                       (QREFELT % 75)))
                                            ('T
                                             (SEQ
                                              (QSETVELT |lt| 3 (CONS 0 |co|))
                                              (SPADCALL |rlt| |lt|
                                                        (QREFELT % 75))
                                              (LETT |res| NIL)
                                              (EXIT
                                               (LETT |newLazy|
                                                     (SPADCALL |newLazy|
                                                               (LIST |rlt|)
                                                               (QREFELT %
                                                                        76))))))))))
                                        ('T
                                         (SEQ (LETT |res| NIL)
                                              (EXIT
                                               (LETT |newLazy|
                                                     (SPADCALL |newLazy|
                                                               (LIST |rlt|)
                                                               (QREFELT %
                                                                        76))))))))
                                      ('T
                                       (SEQ (LETT |res| NIL)
                                            (EXIT
                                             (LETT |newLazy|
                                                   (SPADCALL |newLazy|
                                                             (LIST |rlt|)
                                                             (QREFELT %
                                                                      76)))))))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((NULL (SPADCALL |d| (QREFELT % 51)))
                        (LETT |newLazy|
                              (SPADCALL (CONS (|function| |JLF;greater|) %)
                                        |newLazy|
                                        (LIST
                                         (SPADCALL (|JLF;lazyTerm| |d| %)
                                                   (QREFELT % 31)))
                                        (QREFELT % 78)))))
                      (LETT |rec| (|JLF;adapt| |rec| |newLazy| %))
                      (QSETVELT |rec| 2 |res|)
                      (SPADCALL |exp| |rec| (QREFELT % 72)) (EXIT |exp|)))))))) 

(SDEFUN |JLF;ground?;%B;24| ((|exp| (%)) (% (|Boolean|)))
        (|JLF;groundFlag?| (SPADCALL |exp| (QREFELT % 79)) %)) 

(SDEFUN |JLF;evalDeriv|
        ((|rder| (|Reference| |LazyDer|)) (% (|Reference| |LazyDer|)))
        (SPROG
         ((|der| (|LazyDer|)) (#1=#:G87 NIL) (#2=#:G88 NIL) (|fun| (D))
          (#3=#:G84 NIL) (#4=#:G85 NIL) (|dfun| (D)))
         (SEQ (LETT |der| (SPADCALL |rder| (QREFELT % 44)))
              (EXIT
               (COND ((QVELT |der| 0) |rder|)
                     (#5='T
                      (SEQ
                       (COND
                        ((|JLF;zeroU?| (QVELT |der| 2) %)
                         (LETT |dfun| (|spadConstant| % 27)))
                        (#5#
                         (SEQ
                          (LETT |fun|
                                (COND
                                 ((QEQCAR (QVELT |der| 2) 0)
                                  (PROG2 (LETT #1# (QVELT |der| 2))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT % 7)
                                                    (|Union| (QREFELT % 7) %)
                                                    #1#)))
                                 (#5#
                                  (SPADCALL
                                   (PROG2 (LETT #2# (QVELT |der| 2))
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 1) %
                                                     (|Union| (QREFELT % 7) %)
                                                     #2#))
                                   (QREFELT % 64)))))
                          (SETELT % 9 (+ (QREFELT % 9) 1))
                          (EXIT
                           (LETT |dfun|
                                 (COND
                                  ((QEQCAR (QVELT |der| 1) 0)
                                   (SPADCALL |fun|
                                             (PROG2 (LETT #3# (QVELT |der| 1))
                                                 (QCDR #3#)
                                               (|check_union2| (QEQCAR #3# 0)
                                                               (QREFELT % 6)
                                                               (|Union|
                                                                (QREFELT % 6)
                                                                (|Symbol|))
                                                               #3#))
                                             (QREFELT % 81)))
                                  (#5#
                                   (SPADCALL |fun|
                                             (PROG2 (LETT #4# (QVELT |der| 1))
                                                 (QCDR #4#)
                                               (|check_union2| (QEQCAR #4# 1)
                                                               (|Symbol|)
                                                               (|Union|
                                                                (QREFELT % 6)
                                                                (|Symbol|))
                                                               #4#))
                                             (QREFELT % 83)))))))))
                       (SPADCALL |rder|
                                 (VECTOR 'T (CONS 1 '|0|) (CONS 0 |dfun|))
                                 (QREFELT % 84))
                       (EXIT |rder|)))))))) 

(SDEFUN |JLF;evalTerm|
        ((|rlt| (|Reference| |LazyTerm|)) (% (|Reference| |LazyTerm|)))
        (SPROG
         ((|lt| (|LazyTerm|)) (#1=#:G88 NIL) (|co| (D)) (#2=#:G87 NIL)
          (|res| (D)))
         (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT % 38)))
              (EXIT
               (COND ((QVELT |lt| 2) |rlt|)
                     (#3='T
                      (SEQ
                       (LETT |co|
                             (COND
                              ((QEQCAR (QVELT |lt| 3) 0)
                               (PROG2 (LETT #2# (QVELT |lt| 3))
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0) (QREFELT % 7)
                                                 (|Union| (QREFELT % 7) %)
                                                 #2#)))
                              (#3#
                               (SPADCALL
                                (PROG2 (LETT #1# (QVELT |lt| 3))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 1) %
                                                  (|Union| (QREFELT % 7) %)
                                                  #1#))
                                (QREFELT % 64)))))
                       (EXIT
                        (COND
                         ((SPADCALL |co| (QREFELT % 51))
                          (SEQ
                           (SPADCALL |rlt|
                                     (|JLF;lazyTerm| (|spadConstant| % 27) %)
                                     (QREFELT % 75))
                           (EXIT |rlt|)))
                         (#3#
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |co|
                                           (PROG2
                                               (LETT #2#
                                                     (QVELT
                                                      (SPADCALL
                                                       (|JLF;evalDeriv|
                                                        (QVELT |lt| 4) %)
                                                       (QREFELT % 44))
                                                      2))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (QREFELT % 7)
                                                             (|Union|
                                                              (QREFELT % 7) %)
                                                             #2#))
                                           (QREFELT % 56)))
                           (SPADCALL |rlt| (|JLF;lazyTerm| |res| %)
                                     (QREFELT % 75))
                           (EXIT |rlt|)))))))))))) 

(SDEFUN |JLF;eval1;2%;27| ((|exp| (%)) (% (%)))
        (SPROG
         ((|rec| (|RepRec|)) (#1=#:G213 NIL) (#2=#:G212 NIL)
          (|rco| (|LazyTerm|)) (#3=#:G87 NIL) (|co| (D)) (|d| (D))
          (|rlt| (|Reference| |LazyTerm|)) (|ld| (JB))
          (|lazy| (|List| (|Reference| |LazyTerm|))))
         (SEQ
          (EXIT
           (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                (EXIT
                 (COND ((QVELT |rec| 2) |exp|)
                       (#4='T
                        (SEQ (LETT |lazy| (QVELT |rec| 5))
                             (EXIT
                              (COND
                               ((NULL |lazy|)
                                (SEQ
                                 (SPADCALL |exp| (QREFELT % 32) (QREFELT % 72))
                                 (EXIT |exp|)))
                               (#4#
                                (SEQ (LETT |rlt| (|SPADfirst| |lazy|))
                                     (LETT |rco|
                                           (SPADCALL |rlt| (QREFELT % 38)))
                                     (LETT |d| (|spadConstant| % 27))
                                     (LETT |ld| (QVELT |rco| 0))
                                     (SEQ (LETT #1# NIL) G190
                                          (COND (#1# (GO G191)))
                                          (SEQ
                                           (SEQ G190
                                                (COND
                                                 ((NULL (QVELT |rco| 2))
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |d|
                                                       (SPADCALL |d|
                                                                 (PROG2
                                                                     (LETT #3#
                                                                           (QVELT
                                                                            |rco|
                                                                            3))
                                                                     (QCDR #3#)
                                                                   (|check_union2|
                                                                    (QEQCAR #3#
                                                                            0)
                                                                    (QREFELT %
                                                                             7)
                                                                    (|Union|
                                                                     (QREFELT %
                                                                              7)
                                                                     %)
                                                                    #3#))
                                                                 (QREFELT %
                                                                          73)))
                                                 (LETT |lazy| (CDR |lazy|))
                                                 (EXIT
                                                  (COND
                                                   ((NULL |lazy|)
                                                    (PROGN
                                                     (LETT #2#
                                                           (SPADCALL |d|
                                                                     (QREFELT %
                                                                              62)))
                                                     (GO #5=#:G211)))
                                                   ('T
                                                    (SEQ
                                                     (LETT |rlt|
                                                           (|SPADfirst|
                                                            |lazy|))
                                                     (EXIT
                                                      (LETT |rco|
                                                            (SPADCALL |rlt|
                                                                      (QREFELT
                                                                       %
                                                                       38)))))))))
                                                NIL (GO G190) G191 (EXIT NIL))
                                           (LETT |lazy| (CDR |lazy|))
                                           (LETT |co|
                                                 (PROG2
                                                     (LETT #3#
                                                           (QVELT
                                                            (SPADCALL
                                                             (|JLF;evalTerm|
                                                              |rlt| %)
                                                             (QREFELT % 38))
                                                            3))
                                                     (QCDR #3#)
                                                   (|check_union2|
                                                    (QEQCAR #3# 0)
                                                    (QREFELT % 7)
                                                    (|Union| (QREFELT % 7) %)
                                                    #3#)))
                                           (LETT |d|
                                                 (SPADCALL |d| |co|
                                                           (QREFELT % 73)))
                                           (LETT |rlt|
                                                 (SPADCALL
                                                  (|JLF;lazyTerm| |d| %)
                                                  (QREFELT % 31)))
                                           (EXIT
                                            (LETT |ld|
                                                  (QVELT
                                                   (SPADCALL |rlt|
                                                             (QREFELT % 38))
                                                   0))))
                                          (LETT #1#
                                                (COND ((NULL |lazy|) 'T)
                                                      (#4#
                                                       (SPADCALL
                                                        (QVELT
                                                         (SPADCALL
                                                          (|SPADfirst| |lazy|)
                                                          (QREFELT % 38))
                                                         0)
                                                        |ld| (QREFELT % 59)))))
                                          (GO G190) G191 (EXIT NIL))
                                     (COND
                                      ((NULL (SPADCALL |d| (QREFELT % 51)))
                                       (LETT |lazy|
                                             (SPADCALL
                                              (CONS (|function| |JLF;greater|)
                                                    %)
                                              |lazy| (LIST |rlt|)
                                              (QREFELT % 78)))))
                                     (SPADCALL |exp|
                                               (|JLF;adapt| |rec| |lazy| %)
                                               (QREFELT % 72))
                                     (EXIT |exp|)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |JLF;eval;2%;28| ((|exp| (%)) (% (%)))
        (SEQ
         (SEQ G190
              (COND ((NULL (NULL (SPADCALL |exp| (QREFELT % 74)))) (GO G191)))
              (SEQ (EXIT (LETT |exp| (SPADCALL |exp| (QREFELT % 85))))) NIL
              (GO G190) G191 (EXIT NIL))
         (EXIT |exp|))) 

(SDEFUN |JLF;0;%;29| ((% (%))) (SPADCALL (QREFELT % 32) (QREFELT % 48))) 

(SDEFUN |JLF;1;%;30| ((% (%)))
        (SPADCALL
         (VECTOR (|spadConstant| % 26) 'T 'T NIL NIL
                 (LIST
                  (SPADCALL
                   (VECTOR (|spadConstant| % 26) 'T 'T
                           (CONS 0 (|spadConstant| % 24))
                           (SPADCALL (QREFELT % 25) (QREFELT % 29)))
                   (QREFELT % 31))))
         (QREFELT % 48))) 

(SDEFUN |JLF;zero?;%B;31| ((|exp| (%)) (% (|Boolean|)))
        (SPROG ((|ld| (JB)))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT % 74))
                  (SPADCALL (|JLF;extract| |exp| %) (QREFELT % 51)))
                 (#1='T
                  (SEQ (LETT |ld| (SPADCALL |exp| (QREFELT % 87)))
                       (EXIT
                        (COND
                         ((EQUAL (SPADCALL |ld| (QREFELT % 88)) '|Const|)
                          (SPADCALL
                           (|JLF;extract| (SPADCALL |exp| (QREFELT % 63)) %)
                           (QREFELT % 51)))
                         (#1# NIL))))))))) 

(SDEFUN |JLF;eqRep?;2%B;32| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 37)) (SPADCALL |y| (QREFELT % 37))
                  (QREFELT % 89))) 

(SDEFUN |JLF;=;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |x| |y| (QREFELT % 90)) 'T)
              ('T (SPADCALL (SPADCALL |x| |y| (QREFELT % 91)) (QREFELT % 52))))) 

(SDEFUN |JLF;one?;%B;34| ((|exp| (%)) (% (|Boolean|)))
        (SPROG ((|ld| (JB)))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT % 74))
                  (SPADCALL (|JLF;extract| |exp| %) (QREFELT % 36)))
                 (#1='T
                  (SEQ (LETT |ld| (SPADCALL |exp| (QREFELT % 87)))
                       (EXIT
                        (COND
                         ((EQUAL (SPADCALL |ld| (QREFELT % 88)) '|Const|)
                          (SPADCALL
                           (|JLF;extract| (SPADCALL |exp| (QREFELT % 63)) %)
                           (QREFELT % 36)))
                         (#1# NIL))))))))) 

(MAKEPROP '|JLF;numerator;2%;35| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(SDEFUN |JLF;numerator;2%;35| ((|exp| (%)) (% (%))) |exp|) 

(SDEFUN |JLF;denominator;2%;36| ((|exp| (%)) (% (%))) (|spadConstant| % 80)) 

(SDEFUN |JLF;-;2%;37| ((|x| (%)) (% (%)))
        (SPROG
         ((|rec| (|RepRec|)) (#1=#:G246 NIL) (|rlt| NIL) (#2=#:G247 NIL)
          (|lt| (|LazyTerm|)) (|resLazy| (|List| (|Reference| |LazyTerm|))))
         (SEQ (LETT |rec| (SPADCALL |x| (QREFELT % 37)))
              (LETT |resLazy|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |rlt| NIL) (LETT #2# (QVELT |rec| 5)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |rlt| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SEQ
                                    (LETT |lt| (SPADCALL |rlt| (QREFELT % 38)))
                                    (EXIT
                                     (SPADCALL
                                      (VECTOR (QVELT |lt| 0) (QVELT |lt| 1)
                                              (QVELT |lt| 2)
                                              (|JLF;minus| (QVELT |lt| 3) %)
                                              (QVELT |lt| 4))
                                      (QREFELT % 31))))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT
               (SPADCALL
                (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                        (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
                (QREFELT % 48)))))) 

(SDEFUN |JLF;+;3%;38| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|xrec| (|RepRec|)) (|yrec| (|RepRec|))
          (|resLazy| (|List| (|Reference| |LazyTerm|))) (|resLD| (JB))
          (|resSharp?| (|Boolean|)) (|xJV| #1=(|List| JB)) (|yJV| #1#)
          (|resJV1| #2=(|List| JB)) (|resJV2| #2#))
         (SEQ (LETT |xrec| (SPADCALL |x| (QREFELT % 37)))
              (LETT |yrec| (SPADCALL |y| (QREFELT % 37)))
              (LETT |resLazy|
                    (SPADCALL (CONS (|function| |JLF;greater|) %)
                              (QVELT |xrec| 5) (QVELT |yrec| 5)
                              (QREFELT % 78)))
              (COND
               ((SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT % 42))
                (SEQ (LETT |resLD| (QVELT |xrec| 0))
                     (EXIT (LETT |resSharp?| (QVELT |xrec| 1)))))
               ((SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0) (QREFELT % 42))
                (SEQ (LETT |resLD| (QVELT |yrec| 0))
                     (EXIT (LETT |resSharp?| (QVELT |yrec| 1)))))
               ('T
                (SEQ (LETT |resLD| (QVELT |xrec| 0))
                     (EXIT (LETT |resSharp?| NIL)))))
              (LETT |xJV|
                    (SPADCALL
                     (SPADCALL (QVELT |xrec| 3) (QVELT |xrec| 4)
                               (QREFELT % 95))
                     (QREFELT % 47)))
              (LETT |yJV|
                    (SPADCALL
                     (SPADCALL (QVELT |yrec| 3) (QVELT |yrec| 4)
                               (QREFELT % 95))
                     (QREFELT % 47)))
              (LETT |resJV1|
                    (SPADCALL (ELT % 42)
                              (SPADCALL
                               (SPADCALL (QVELT |xrec| 3) |yJV| (QREFELT % 96))
                               (SPADCALL (QVELT |yrec| 3) |xJV| (QREFELT % 96))
                               (QREFELT % 97))
                              (QREFELT % 98)))
              (LETT |resJV2|
                    (SPADCALL (ELT % 42)
                              (SPADCALL (SPADCALL |xJV| |yJV| (QREFELT % 97))
                                        |resJV1| (QREFELT % 96))
                              (QREFELT % 98)))
              (EXIT
               (SPADCALL
                (VECTOR |resLD| |resSharp?| NIL |resJV1| |resJV2| |resLazy|)
                (QREFELT % 48)))))) 

(SDEFUN |JLF;*;I2%;39| ((|i| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG
         ((|rec| (|RepRec|)) (|rlt| NIL) (#1=#:G267 NIL) (|lt| (|LazyTerm|))
          (|resLazy| (|List| (|Reference| |LazyTerm|))))
         (SEQ (LETT |rec| (SPADCALL |x| (QREFELT % 37))) (LETT |resLazy| NIL)
              (SEQ (LETT |rlt| NIL) (LETT #1# (QVELT |rec| 5)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rlt| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT % 38)))
                        (EXIT
                         (LETT |resLazy|
                               (SPADCALL |resLazy|
                                         (LIST
                                          (SPADCALL
                                           (VECTOR (QVELT |lt| 0)
                                                   (QVELT |lt| 1)
                                                   (QVELT |lt| 2)
                                                   (|JLF;mult|
                                                    (CONS 0
                                                          (SPADCALL |i|
                                                                    (QREFELT %
                                                                             101)))
                                                    (QVELT |lt| 3) %)
                                                   (QVELT |lt| 4))
                                           (QREFELT % 31)))
                                         (QREFELT % 102)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                        (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
                (QREFELT % 48)))))) 

(SDEFUN |JLF;*;D2%;40| ((|d| (D)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |d| (QREFELT % 62)) |x| (QREFELT % 58))) 

(SDEFUN |JLF;*;3%;41| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|xrec| (|RepRec|)) (|yrec| (|RepRec|)) (|xlt| NIL) (#1=#:G285 NIL)
          (|ylt| NIL) (#2=#:G286 NIL)
          (|resLazy| (|List| (|Reference| |LazyTerm|)))
          (|resJV1| #3=(|List| JB)) (|resJV2| #3#) (|resLD| (JB))
          (|resSharp?| (|Boolean|)))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (|spadConstant| % 86) (QREFELT % 90))
                (SPADCALL |y| (|spadConstant| % 86) (QREFELT % 90)))
            (|spadConstant| % 86))
           ('T
            (SEQ
             (COND
              ((SPADCALL |x| (QREFELT % 74))
               (COND
                ((SPADCALL |y| (QREFELT % 74))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (|JLF;extract| |x| %) (|JLF;extract| |y| %)
                             (QREFELT % 56))
                   (QREFELT % 62)))))))
             (LETT |xrec| (SPADCALL |x| (QREFELT % 37)))
             (LETT |yrec| (SPADCALL |y| (QREFELT % 37))) (LETT |resLazy| NIL)
             (SEQ (LETT |xlt| NIL) (LETT #1# (QVELT |xrec| 5)) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |xlt| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (SEQ (LETT |ylt| NIL) (LETT #2# (QVELT |yrec| 5)) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |ylt| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |resLazy|
                                (SPADCALL (CONS (|function| |JLF;greater|) %)
                                          |resLazy|
                                          (LIST (|JLF;multLazy| |xlt| |ylt| %))
                                          (QREFELT % 78)))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                   (LETT |resJV1|
                         (SPADCALL
                          (SPADCALL (QVELT |xrec| 3) (QVELT |yrec| 3)
                                    (QREFELT % 95))
                          (QREFELT % 47)))
                   (EXIT
                    (LETT |resJV2|
                          (SPADCALL
                           (SPADCALL (QVELT |xrec| 4) (QVELT |yrec| 4)
                                     (QREFELT % 95))
                           (QREFELT % 47)))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND
              ((OR (SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT % 42))
                   (NULL
                    (SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0)
                              (QREFELT % 42))))
               (LETT |resLD| (QVELT |xrec| 0)))
              ('T (LETT |resLD| (QVELT |yrec| 0))))
             (LETT |resSharp?|
                   (COND ((QVELT |xrec| 1) (QVELT |yrec| 1)) ('T NIL)))
             (EXIT
              (SPADCALL
               (VECTOR |resLD| |resSharp?| NIL |resJV1| |resJV2| |resLazy|)
               (QREFELT % 48))))))))) 

(SDEFUN |JLF;recip;%U;42| ((|exp| (%)) (% (|Union| % "failed")))
        (SPROG ((|rd| (|Union| D "failed")))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT % 74))
                  (SEQ
                   (LETT |rd|
                         (SPADCALL (|JLF;extract| |exp| %) (QREFELT % 105)))
                   (EXIT
                    (COND ((QEQCAR |rd| 1) (CONS 1 "failed"))
                          (#1='T
                           (CONS 0 (SPADCALL (QCDR |rd|) (QREFELT % 62))))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JLF;const?;%B;43| ((|exp| (%)) (% (|Boolean|)))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                    (EXIT
                     (COND
                      ((NULL (QVELT |rec| 3))
                       (SPADCALL (SPADCALL |exp| (QREFELT % 64))
                                 (QREFELT % 107)))
                      ('T NIL)))))) 

(SDEFUN |JLF;order;%Nni;44| ((|exp| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |exp| (QREFELT % 87)) (QREFELT % 109))) 

(SDEFUN |JLF;class;%Nni;45| ((|exp| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |exp| (QREFELT % 87)) (QREFELT % 111))) 

(SDEFUN |JLF;jetVariables;%L;46| ((|exp| (%)) (% (|List| JB)))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                    (EXIT
                     (SPADCALL (ELT % 42) (QVELT |rec| 3) (QVELT |rec| 4)
                               (QREFELT % 46)))))) 

(SDEFUN |JLF;differentiate;%JB%;47| ((|exp| (%)) (|jv| (JB)) (% (%)))
        (SPROG ((|rec| (|RepRec|)) (|ld| (JB)) (|newJV| (|List| JB)))
               (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                    (LETT |ld| (QVELT |rec| 0))
                    (EXIT
                     (COND
                      ((SPADCALL |jv| |ld| (QREFELT % 42))
                       (|spadConstant| % 86))
                      ('T
                       (SEQ
                        (LETT |newJV|
                              (SPADCALL
                               (SPADCALL (ELT % 42) (QVELT |rec| 3)
                                         (QVELT |rec| 4) (QREFELT % 46))
                               (QREFELT % 47)))
                        (COND
                         ((NULL (SPADCALL |jv| |newJV| (QREFELT % 113)))
                          (EXIT (|spadConstant| % 86))))
                        (SETELT % 8 (+ (QREFELT % 8) 1))
                        (EXIT
                         (SPADCALL
                          (VECTOR |ld| NIL NIL NIL |newJV|
                                  (LIST
                                   (SPADCALL
                                    (VECTOR |ld| NIL NIL
                                            (CONS 0 (|spadConstant| % 24))
                                            (SPADCALL
                                             (VECTOR NIL (CONS 0 |jv|)
                                                     (CONS 1 |exp|))
                                             (QREFELT % 29)))
                                    (QREFELT % 31))))
                          (QREFELT % 48)))))))))) 

(SDEFUN |JLF;differentiate;%S%;48| ((|exp| (%)) (|x| (|Symbol|)) (% (%)))
        (SPROG ((|rec| (|RepRec|)) (|ld| (JB)) (|newJV| (|List| JB)))
               (SEQ (SETELT % 8 (+ (QREFELT % 8) 1))
                    (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                    (LETT |ld| (QVELT |rec| 0))
                    (LETT |newJV|
                          (SPADCALL
                           (SPADCALL (ELT % 42) (QVELT |rec| 3) (QVELT |rec| 4)
                                     (QREFELT % 46))
                           (QREFELT % 47)))
                    (EXIT
                     (SPADCALL
                      (VECTOR |ld| NIL NIL NIL |newJV|
                              (LIST
                               (SPADCALL
                                (VECTOR |ld| NIL NIL
                                        (CONS 0 (|spadConstant| % 24))
                                        (SPADCALL
                                         (VECTOR NIL (CONS 1 |x|)
                                                 (CONS 1 |exp|))
                                         (QREFELT % 29)))
                                (QREFELT % 31))))
                      (QREFELT % 48)))))) 

(SDEFUN |JLF;formalDiff2;LPiSemR;49|
        ((|Sys| (|List| %)) (|i| (|PositiveInteger|))
         (JM (|SparseEchelonMatrix| JB %))
         (%
          (|Record| (|:| |DSys| (|List| %))
                    (|:| |JVars| (|List| (|List| JB))))))
        (SPROG
         ((|inds| (|List| JB)) (#1=#:G347 NIL) (#2=#:G348 NIL) (#3=#:G349 NIL)
          (|eq| NIL) (#4=#:G350 NIL) (|f| NIL) (#5=#:G352 NIL) (|l| NIL)
          (#6=#:G351 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| %))))
          (|jv| NIL) (#7=#:G354 NIL) (|df| NIL) (#8=#:G353 NIL)
          (|djv| (|Union| JB "0")) (|res| (%)) (|LRes| (|List| %))
          (JV (|List| JB)) (LJV (|List| (|List| JB))))
         (SEQ (LETT |inds| (SPADCALL JM (QREFELT % 117)))
              (EXIT
               (COND
                ((NULL |inds|)
                 (CONS
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |eq| NIL) (LETT #2# |Sys|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #1# (CONS (|spadConstant| % 86) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |eq| NIL) (LETT #4# |Sys|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #3# (CONS NIL #3#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #3#))))))
                ('T
                 (SEQ (LETT |LRes| NIL) (LETT LJV NIL)
                      (SEQ (LETT |f| NIL) (LETT #5# |Sys|) (LETT |l| 1)
                           (LETT #6# (SPADCALL JM (QREFELT % 118))) G190
                           (COND
                            ((OR (|greater_SI| |l| #6#) (ATOM #5#)
                                 (PROGN (LETT |f| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT % 120)))
                                (LETT |res| (|spadConstant| % 86))
                                (LETT JV NIL)
                                (SEQ (LETT |jv| NIL)
                                     (LETT #7# (REVERSE (QCAR |r|)))
                                     (LETT |df| NIL)
                                     (LETT #8#
                                           (SPADCALL (QCDR |r|)
                                                     (QREFELT % 122)))
                                     G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN (LETT |df| (CAR #8#)) NIL)
                                           (ATOM #7#)
                                           (PROGN (LETT |jv| (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |df| (|spadConstant| % 86)
                                                    (QREFELT % 90)))
                                         (SEQ
                                          (LETT |djv|
                                                (SPADCALL |jv| |i|
                                                          (QREFELT % 125)))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |djv| 1)
                                             (LETT JV (CONS |jv| JV)))
                                            ((SPADCALL (QCDR |djv|)
                                                       (QREFELT % 126))
                                             (SEQ
                                              (LETT |res|
                                                    (SPADCALL |res| |df|
                                                              (QREFELT % 99)))
                                              (EXIT (LETT JV (CONS |jv| JV)))))
                                            ('T
                                             (SEQ
                                              (LETT |res|
                                                    (SPADCALL |res|
                                                              (SPADCALL |df|
                                                                        (SPADCALL
                                                                         (QCDR
                                                                          |djv|)
                                                                         (QREFELT
                                                                          %
                                                                          61))
                                                                        (QREFELT
                                                                         % 58))
                                                              (QREFELT % 99)))
                                              (EXIT
                                               (LETT JV
                                                     (SPADCALL
                                                      (LIST |jv| (QCDR |djv|))
                                                      JV
                                                      (QREFELT %
                                                               95)))))))))))))
                                     (LETT #8#
                                           (PROG1 (CDR #8#)
                                             (LETT #7# (CDR #7#))))
                                     (GO G190) G191 (EXIT NIL))
                                (COND
                                 ((QVELT (SPADCALL |f| (QREFELT % 37)) 1)
                                  (QSETVELT (SPADCALL |res| (QREFELT % 37)) 1
                                            'T)))
                                (LETT |LRes|
                                      (SPADCALL |res| |LRes| (QREFELT % 127)))
                                (LETT JV
                                      (SPADCALL (ELT % 42)
                                                (SPADCALL JV (QREFELT % 47))
                                                (QREFELT % 98)))
                                (EXIT (LETT LJV (CONS JV LJV))))
                           (LETT |l|
                                 (PROG1 (|inc_SI| |l|) (LETT #5# (CDR #5#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS (SPADCALL |LRes| (QREFELT % 128))
                             (NREVERSE LJV)))))))))) 

(SDEFUN |JLF;leadingDer;%JB;50| ((|exp| (%)) (% (JB)))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((QVELT |rec| 1) NIL)
                                  ('T (NULL (SPADCALL |exp| (QREFELT % 74))))))
                           (GO G191)))
                         (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT % 85)))
                              (EXIT
                               (LETT |rec| (SPADCALL |exp| (QREFELT % 37)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((QVELT |rec| 1) (QVELT |rec| 0))
                           ('T
                            (SPADCALL (SPADCALL |exp| (QREFELT % 64))
                                      (QREFELT % 43)))))))) 

(SDEFUN |JLF;freeOf?;%JBB;51| ((|exp| (%)) (|jv| (JB)) (% (|Boolean|)))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT % 37)) 3)
                             (QREFELT % 113))
                   NIL)
                  ('T (NULL (SPADCALL |exp| (QREFELT % 74))))))
                (GO G191)))
              (SEQ (EXIT (LETT |exp| (SPADCALL |exp| (QREFELT % 85))))) NIL
              (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND
           ((SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT % 37)) 3)
                      (QREFELT % 113))
            NIL)
           ('T
            (SPADCALL (SPADCALL |exp| (QREFELT % 64)) |jv| (QREFELT % 132))))))) 

(SDEFUN |JLF;solveFor;%JBU;52|
        ((|exp| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG ((|sf| (|Union| D "failed")))
               (SEQ
                (LETT |sf|
                      (SPADCALL (SPADCALL |exp| (QREFELT % 64)) |jv|
                                (QREFELT % 134)))
                (EXIT
                 (COND ((QEQCAR |sf| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |sf|) (QREFELT % 62))))))))) 

(SDEFUN |JLF;subst;%JB2%;53| ((|exp| (%)) (|jv| (JB)) (|sub| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |exp| (QREFELT % 64)) |jv|
                   (SPADCALL |sub| (QREFELT % 64)) (QREFELT % 136))
         (QREFELT % 62))) 

(SDEFUN |JLF;ld|
        ((|r|
          (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| %)))
         (% (JB)))
        (QVELT (SPADCALL (QCDR |r|) (QREFELT % 37)) 0)) 

(SDEFUN |JLF;greaterLD|
        ((|r1|
          (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| %)))
         (|r2|
          (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| %)))
         (% (|Boolean|)))
        (SPADCALL (|JLF;ld| |r1| %) (|JLF;ld| |r2| %) (QREFELT % 42))) 

(SDEFUN |JLF;simpLD|
        ((|l|
          (|List|
           (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| %))))
         (%
          (|List|
           (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| %)))))
        (SPROG
         ((|cur|
           #1=(|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                        (|:| |Fun| %)))
          (|cld| (JB)) (|fl| #1#) (|eqLD| (|List| #1#)) (#2=#:G445 NIL)
          (#3=#:G444 NIL) (|s| (|Union| % #4="failed"))
          (|solvable?| (|Boolean|))
          (|seq|
           (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| %)))
          (#5=#:G446 NIL) (#6=#:G391 NIL) (|neweq| (%)) (#7=#:G447 NIL)
          (#8=#:G448 NIL) (|sys| (|List| D)) (#9=#:G449 NIL) (#10=#:G450 NIL)
          (|oldDep| (|List| (|List| (|NonNegativeInteger|))))
          (|tmp|
           (|Record| (|:| |Sys| (|List| D))
                     (|:| JM (|SparseEchelonMatrix| JB D))
                     (|:| |Depend|
                          (|Union| #4#
                                   (|List| (|List| (|NonNegativeInteger|)))))))
          (|dep| (|List| (|NonNegativeInteger|))) (#11=#:G451 NIL) (|eq| NIL)
          (#12=#:G452 NIL) (#13=#:G416 NIL) (#14=#:G453 NIL) (|d| NIL)
          (#15=#:G454 NIL) (|ndep| (|List| (|NonNegativeInteger|)))
          (|newDep| (|List| (|List| (|NonNegativeInteger|)))) (#16=#:G455 NIL)
          (#17=#:G457 NIL) (|deq| NIL) (#18=#:G456 NIL)
          (|newL|
           (|List|
            (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| %)))))
         (SEQ
          (COND ((< (LENGTH |l|) 2) |l|)
                (#19='T
                 (SEQ (LETT |cur| (SPADCALL |l| (QREFELT % 140)))
                      (LETT |cld| (|JLF;ld| |cur| %)) (LETT |l| (CDR |l|))
                      (EXIT
                       (COND
                        ((SPADCALL |cld|
                                   (|JLF;ld| (SPADCALL |l| (QREFELT % 140)) %)
                                   (QREFELT % 141))
                         (SPADCALL |cur| (|JLF;simpLD| |l| %) (QREFELT % 142)))
                        (#19#
                         (SEQ (LETT |eqLD| (LIST |cur|))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |l|) NIL)
                                            ('T
                                             (SPADCALL |cld|
                                                       (|JLF;ld|
                                                        (LETT |fl|
                                                              (SPADCALL |l|
                                                                        (QREFELT
                                                                         %
                                                                         140)))
                                                        %)
                                                       (QREFELT % 143)))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |eqLD|
                                          (SPADCALL |fl| |eqLD|
                                                    (QREFELT % 142)))
                                    (EXIT (LETT |l| (CDR |l|))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |solvable?| NIL)
                              (SEQ (LETT #2# NIL) (LETT |eq| NIL)
                                   (LETT #3# |eqLD|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |eq| (CAR #3#)) NIL) #2#)
                                     (GO G191)))
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL (QCDR |eq|) |cld|
                                                    (QREFELT % 135)))
                                    (LETT |solvable?| (QEQCAR |s| 0))
                                    (EXIT (LETT |seq| |eq|)))
                                   (LETT #3#
                                         (PROG1 (CDR #3#)
                                           (LETT #2# |solvable?|)))
                                   (GO G190) G191 (EXIT NIL))
                              (LETT |newL| NIL)
                              (COND
                               (|solvable?|
                                (SEQ (LETT |eq| NIL) (LETT #5# |eqLD|) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN (LETT |eq| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |eq| |seq| (QREFELT % 144))
                                         (SEQ
                                          (LETT |neweq|
                                                (SPADCALL
                                                 (SPADCALL (QCDR |eq|) |cld|
                                                           (PROG2
                                                               (LETT #6# |s|)
                                                               (QCDR #6#)
                                                             (|check_union2|
                                                              (QEQCAR #6# 0) %
                                                              (|Union| % #4#)
                                                              #6#))
                                                           (QREFELT % 137))
                                                 (QREFELT % 93)))
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |neweq|
                                                        (QREFELT % 52)))
                                             (LETT |newL|
                                                   (SPADCALL
                                                    (CONS
                                                     (|function|
                                                      |JLF;greaterLD|)
                                                     %)
                                                    |newL|
                                                    (LIST
                                                     (CONS
                                                      (SPADCALL (QCAR |eq|)
                                                                (QCAR |seq|)
                                                                (QREFELT %
                                                                         146))
                                                      |neweq|))
                                                    (QREFELT % 148)))))))))))
                                     (LETT #5# (CDR #5#)) (GO G190) G191
                                     (EXIT NIL)))
                               (#19#
                                (SEQ
                                 (LETT |sys|
                                       (PROGN
                                        (LETT #7# NIL)
                                        (SEQ (LETT |eq| NIL) (LETT #8# |eqLD|)
                                             G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |eq| (CAR #8#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #7#
                                                     (CONS
                                                      (SPADCALL (QCDR |eq|)
                                                                (QREFELT % 64))
                                                      #7#))))
                                             (LETT #8# (CDR #8#)) (GO G190)
                                             G191 (EXIT (NREVERSE #7#)))))
                                 (LETT |oldDep|
                                       (PROGN
                                        (LETT #9# NIL)
                                        (SEQ (LETT |eq| NIL) (LETT #10# |eqLD|)
                                             G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |eq| (CAR #10#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #9#
                                                     (CONS (QCAR |eq|) #9#))))
                                             (LETT #10# (CDR #10#)) (GO G190)
                                             G191 (EXIT (NREVERSE #9#)))))
                                 (LETT |tmp|
                                       (SPADCALL |sys|
                                                 (SPADCALL |sys|
                                                           (QREFELT % 149))
                                                 (QREFELT % 152)))
                                 (COND
                                  ((SPADCALL (QVELT |tmp| 2) (CONS 0 "failed")
                                             (QREFELT % 153))
                                   (SEQ
                                    (LETT |dep|
                                          (SPADCALL
                                           (SPADCALL (ELT % 146) |oldDep| NIL
                                                     (QREFELT % 156))
                                           (QREFELT % 157)))
                                    (EXIT
                                     (LETT |newDep|
                                           (PROGN
                                            (LETT #11# NIL)
                                            (SEQ (LETT |eq| NIL)
                                                 (LETT #12# (QVELT |tmp| 0))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #12#)
                                                       (PROGN
                                                        (LETT |eq| (CAR #12#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #11#
                                                         (CONS |dep| #11#))))
                                                 (LETT #12# (CDR #12#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #11#))))))))
                                  (#19#
                                   (SEQ (LETT |newDep| NIL)
                                        (SEQ
                                         (LETT #14#
                                               (PROG2
                                                   (LETT #13# (QVELT |tmp| 2))
                                                   (QCDR #13#)
                                                 (|check_union2|
                                                  (QEQCAR #13# 1)
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|)))
                                                  (|Union| #4#
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                  #13#)))
                                         G190
                                         (COND
                                          ((OR (ATOM #14#)
                                               (PROGN
                                                (LETT |dep| (CAR #14#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ (LETT |ndep| NIL)
                                              (SEQ (LETT |d| NIL)
                                                   (LETT #15# |dep|) G190
                                                   (COND
                                                    ((OR (ATOM #15#)
                                                         (PROGN
                                                          (LETT |d| (CAR #15#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |ndep|
                                                           (SPADCALL
                                                            (SPADCALL |ndep|
                                                                      (SPADCALL
                                                                       |oldDep|
                                                                       |d|
                                                                       (QREFELT
                                                                        % 158))
                                                                      (QREFELT
                                                                       % 159))
                                                            (QREFELT % 157)))))
                                                   (LETT #15# (CDR #15#))
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |newDep|
                                                     (CONS |ndep| |newDep|))))
                                         (LETT #14# (CDR #14#)) (GO G190) G191
                                         (EXIT NIL))
                                        (EXIT
                                         (LETT |newDep|
                                               (NREVERSE |newDep|))))))
                                 (LETT |newL|
                                       (PROGN
                                        (LETT #16# NIL)
                                        (SEQ (LETT #17# |newDep|)
                                             (LETT |deq| NIL)
                                             (LETT #18# (QVELT |tmp| 0)) G190
                                             (COND
                                              ((OR (ATOM #18#)
                                                   (PROGN
                                                    (LETT |deq| (CAR #18#))
                                                    NIL)
                                                   (ATOM #17#)
                                                   (PROGN
                                                    (LETT |dep| (CAR #17#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #16#
                                                     (CONS
                                                      (CONS |dep|
                                                            (SPADCALL |deq|
                                                                      (QREFELT
                                                                       % 62)))
                                                      #16#))))
                                             (LETT #18#
                                                   (PROG1 (CDR #18#)
                                                     (LETT #17# (CDR #17#))))
                                             (GO G190) G191
                                             (EXIT (NREVERSE #16#)))))
                                 (EXIT
                                  (LETT |newL|
                                        (SPADCALL
                                         (CONS (|function| |JLF;greaterLD|) %)
                                         |newL| (QREFELT % 160)))))))
                              (EXIT
                               (SPADCALL |seq|
                                         (|JLF;simpLD|
                                          (SPADCALL
                                           (CONS (|function| |JLF;greaterLD|)
                                                 %)
                                           |l| |newL| (QREFELT % 148))
                                          %)
                                         (QREFELT % 142))))))))))))) 

(SDEFUN |JLF;simplify;LSemR;57|
        ((|sys| (|List| %)) (|jm| (|SparseEchelonMatrix| JB %))
         (%
          (|Record| (|:| |Sys| (|List| %))
                    (|:| JM (|SparseEchelonMatrix| JB %))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((#1=#:G481 NIL) (|f| NIL) (#2=#:G482 NIL)
          (|sl|
           (|List|
            (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| %))))
          (#3=#:G483 NIL) (#4=#:G484 NIL) (|resSys| (|List| %)) (#5=#:G485 NIL)
          (|l| NIL) (#6=#:G486 NIL)
          (|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|inds| (|List| JB)) (|resJM| (|SparseEchelonMatrix| JB %)) (|i| NIL)
          (|dep| NIL) (#7=#:G488 NIL) (|eq| NIL) (#8=#:G487 NIL)
          (|tmp| (|SparseEchelonMatrix| JB %))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| %)))))
         (SEQ
          (LETT |sl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT |f| NIL) (LETT #2# |sys|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (CONS (LIST |i|) |f|) #1#))))
                      (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT (NREVERSE #1#)))))
          (LETT |sl|
                (|JLF;simpLD|
                 (SPADCALL (CONS (|function| |JLF;greaterLD|) %) |sl|
                           (QREFELT % 160))
                 %))
          (LETT |resSys|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |l| NIL) (LETT #4# |sl|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS (SPADCALL (QCDR |l|) (QREFELT % 79))
                                    #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |resDep|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |l| NIL) (LETT #6# |sl|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |l| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS (QCAR |l|) #5#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |inds| (SPADCALL |jm| (QREFELT % 117)))
          (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT % 161)))
          (SEQ (LETT |i| 1) (LETT |dep| NIL) (LETT #7# |resDep|)
               (LETT |eq| NIL) (LETT #8# |resSys|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |eq| (CAR #8#)) NIL) (ATOM #7#)
                     (PROGN (LETT |dep| (CAR #7#)) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |dep| (QREFELT % 162)) 1)
                  (LETT |r|
                        (SPADCALL |jm| (|SPADfirst| |dep|) (QREFELT % 120))))
                 ('T
                  (SEQ
                   (LETT |tmp|
                         (SPADCALL (LIST |eq|) (LIST |inds|) (QREFELT % 164)))
                   (EXIT (LETT |r| (SPADCALL |tmp| 1 (QREFELT % 120)))))))
                (EXIT (SPADCALL |resJM| |i| |r| (QREFELT % 165))))
               (LETT #8#
                     (PROG1 (CDR #8#)
                       (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|))))))
               (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|)))))) 

(SDEFUN |JLF;reduceMod;3L;58|
        ((|sys1| #1=(|List| %)) (|sys2| #1#) (% (|List| %)))
        (SPROG
         ((#2=#:G497 NIL) (#3=#:G498 NIL) (|sys1D| (|List| D)) (#4=#:G499 NIL)
          (|exp| NIL) (#5=#:G500 NIL) (|sys2D| (|List| D)) (#6=#:G501 NIL)
          (|d| NIL) (#7=#:G502 NIL))
         (SEQ
          (LETT |sys1D|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |exp| NIL) (LETT #3# |sys1|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |exp| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT % 63))
                                %)
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |sys2D|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |exp| NIL) (LETT #5# |sys2|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |exp| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT % 63))
                                %)
                               #4#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT
           (PROGN
            (LETT #6# NIL)
            (SEQ (LETT |d| NIL)
                 (LETT #7# (SPADCALL |sys1D| |sys2D| (QREFELT % 167))) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |d| (CAR #7#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT (LETT #6# (CONS (SPADCALL |d| (QREFELT % 62)) #6#))))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT (NREVERSE #6#)))))))) 

(SDEFUN |JLF;autoReduce;2L;59| ((|sys| (|List| %)) (% (|List| %)))
        (SPROG
         ((#1=#:G509 NIL) (|exp| NIL) (#2=#:G510 NIL) (|sysD| (|List| D))
          (#3=#:G511 NIL) (|d| NIL) (#4=#:G512 NIL))
         (SEQ
          (LETT |sysD|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |exp| NIL) (LETT #2# |sys|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |exp| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT % 63))
                                %)
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |d| NIL) (LETT #4# (SPADCALL |sysD| (QREFELT % 169)))
                 G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT (LETT #3# (CONS (SPADCALL |d| (QREFELT % 62)) #3#))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DECLAIM (NOTINLINE |JetLazyFunction;|)) 

(DEFUN |JetLazyFunction;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetLazyFunction| DV$1 DV$2))
          (LETT % (GETREFV 177))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|JetLazyFunction| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 0)
          (QSETREFV % 9 0)
          (QSETREFV % 20
                    (|Record| (|:| |DEval?| (|Boolean|))
                              (|:| DX (|Union| |#1| (|Symbol|)))
                              (|:| |DFun| (|Union| |#2| %))))
          (QSETREFV % 21
                    (|Record| (|:| LLD |#1|) (|:| |LSharp?| (|Boolean|))
                              (|:| |LEval?| (|Boolean|))
                              (|:| |LCoeff| (|Union| |#2| %))
                              (|:| |LDer| (|Reference| (QREFELT % 20)))))
          (QSETREFV % 22
                    (|Record| (|:| LD |#1|) (|:| |Sharp?| (|Boolean|))
                              (|:| |Ground?| (|Boolean|))
                              (|:| JV1 (|List| |#1|)) (|:| JV2 (|List| |#1|))
                              (|:| |Lazy|
                                   (|List| (|Reference| (QREFELT % 21))))))
          (QSETREFV % 23 (|Reference| (QREFELT % 22)))
          (QSETREFV % 25
                    (VECTOR 'T (CONS 1 '|0|) (CONS 0 (|spadConstant| % 24))))
          (QSETREFV % 32
                    (VECTOR (|spadConstant| % 26) 'T 'T NIL NIL
                            (LIST
                             (SPADCALL
                              (VECTOR (|spadConstant| % 26) 'T 'T
                                      (CONS 0 (|spadConstant| % 27))
                                      (SPADCALL (QREFELT % 25) (QREFELT % 29)))
                              (QREFELT % 31)))))
          %))) 

(DEFUN |JetLazyFunction| (&REST #1=#:G519)
  (SPROG NIL
         (PROG (#2=#:G520)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetLazyFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetLazyFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetLazyFunction|)))))))))) 

(MAKEPROP '|JetLazyFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|LazyDiff|
              '|LazyEval| (|String|) (|OutputForm|) (0 . |message|)
              (|NonNegativeInteger|) (5 . |coerce|) (10 . |assign|) (|Void|)
              (16 . |print|) (21 . |void|) |JLF;statistics;V;1| '|LazyDer|
              '|LazyTerm| '|RepRec| '|Rep| (25 . |1|) '|emptyDer| (29 . |1|)
              (33 . |0|) (|Reference| 20) (37 . |ref|) (|Reference| 21)
              (42 . |ref|) '|zeroRec| (|Boolean|) (|Union| 6 82) (47 . ~=)
              (53 . |one?|) (58 . |deref|) (63 . |deref|) (|List| 6)
              (68 . |jetVariables|) |JLF;jetVariables;%L;46| (73 . >)
              (79 . |leadingDer|) (84 . |deref|) (|Mapping| 33 6 6)
              (89 . |merge|) (96 . |removeDuplicates!|) (101 . |ref|)
              (|List| 30) (106 . |second|) (111 . |zero?|) |JLF;zero?;%B;31|
              |JLF;one?;%B;34| (116 . -) |JLF;-;2%;37| (121 . *) |JLF;*;D2%;40|
              |JLF;*;3%;41| (127 . <) (133 . |coerce|) |JLF;coerce;JB%;15|
              |JLF;coerce;D%;16| |JLF;eval;2%;28| |JLF;coerce;%D;17|
              (138 . |coerce|) |JLF;coerce;%Of;22| (143 . |coerce|) (|List| %)
              (148 . |prefix|) (154 . *) (160 . +) (166 . |setref|) (172 . +)
              |JLF;ground?;%B;24| (178 . |setref|) (184 . |append|)
              (|Mapping| 33 30 30) (190 . |merge|) |JLF;collect;2%;23|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;1;%;30|) %))
              (197 . |differentiate|) (|Symbol|) (203 . |differentiate|)
              (209 . |setref|) |JLF;eval1;2%;27|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;0;%;29|) %))
              |JLF;leadingDer;%JB;50| (215 . |type|) (220 . =)
              |JLF;eqRep?;2%B;32| (226 . -) |JLF;=;2%B;33|
              |JLF;numerator;2%;35| |JLF;denominator;2%;36| (232 . |append|)
              (238 . |setDifference|) (244 . |concat!|) (250 . |sort!|)
              |JLF;+;3%;38| (|Integer|) (256 . |coerce|) (261 . |concat!|)
              |JLF;*;I2%;39| (|Union| % '"failed") (267 . |recip|)
              |JLF;recip;%U;42| (272 . |const?|) |JLF;const?;%B;43|
              (277 . |order|) |JLF;order;%Nni;44| (282 . |class|)
              |JLF;class;%Nni;45| (287 . |member?|) |JLF;differentiate;%JB%;47|
              |JLF;differentiate;%S%;48| (|SparseEchelonMatrix| 6 $$)
              (293 . |allIndices|) (298 . |nrows|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 121)) (303 . |row|)
              (|List| $$) (309 . |reverse|) (|Union| % '"0")
              (|PositiveInteger|) (314 . |differentiate|) (320 . |one?|)
              (325 . |cons|) (331 . |reverse!|)
              (|Record| (|:| |DSys| 68) (|:| |JVars| 163))
              (|SparseEchelonMatrix| 6 %) |JLF;formalDiff2;LPiSemR;49|
              (336 . |freeOf?|) |JLF;freeOf?;%JBB;51| (342 . |solveFor|)
              |JLF;solveFor;%JBU;52| (348 . |subst|) |JLF;subst;%JB2%;53|
              (|Record| (|:| |Dep| 145) (|:| |Fun| $$)) (|List| 138)
              (355 . |first|) (360 . ~=) (366 . |cons|) (372 . =) (378 . ~=)
              (|List| 13) (384 . |append|) (|Mapping| 33 138 138)
              (390 . |merge|) (397 . |jacobiMatrix|) (|Union| '"failed" 155)
              (|Record| (|:| |Sys| 68) (|:| JM 130) (|:| |Depend| 150))
              (402 . |simplify|) (408 . =) (|Mapping| 145 145 145) (|List| 145)
              (414 . |reduce|) (421 . |removeDuplicates!|) (426 . |qelt|)
              (432 . |concat!|) (438 . |sort!|) (444 . |new|) (450 . |#|)
              (|List| 39) (455 . |jacobiMatrix|) (461 . |setRow!|)
              |JLF;simplify;LSemR;57| (468 . |reduceMod|) |JLF;reduceMod;3L;58|
              (474 . |autoReduce|) |JLF;autoReduce;2L;59| (|List| 82)
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '"failed") (|Record| (|:| |DPhi| %) (|:| |JVars| 39)))
           '#(~= 479 |zero?| 485 |unitNormal| 490 |unitCanonical| 495 |unit?|
              500 |symbol| 505 |subtractIfCan| 510 |subst| 516 |statistics| 523
              |sortLD| 527 |solveFor| 532 |simplify| 538 |simpOne| 544
              |simpMod| 549 |setNotation| 562 |sample| 567 |rightRecip| 571
              |rightPower| 576 |retractIfCan| 588 |retract| 593 |reduceMod| 598
              |recip| 604 |plenaryPower| 609 |orderDim| 615 |order| 622
              |opposite?| 627 |one?| 633 |numerator| 638 |numIndVar| 643
              |numDepVar| 647 |leftRecip| 651 |leftPower| 656 |leadingDer| 668
              |lcmCoef| 673 |lcm| 679 |latex| 690 |jetVariables| 695
              |jacobiMatrix| 700 |ground?| 711 |getNotation| 716
              |gcdPolynomial| 720 |gcd| 726 |freeOf?| 737 |formalDiff2| 743
              |formalDiff| 757 |extractSymbol| 775 |exquo| 780 |eval1| 786
              |eval| 791 |eqRep?| 796 |dimension| 802 |differentiate| 809
              |denominator| 841 |dSubst| 846 |const?| 853 |commutator| 858
              |collect| 864 |coerce| 869 |class| 899 |characteristic| 904
              |autoReduce| 908 |associator| 913 |associates?| 920
              |antiCommutator| 926 |annihilate?| 932 ^ 938 X 950 U 959 P 968 =
              990 |1| 996 |0| 1000 - 1004 + 1015 * 1021 |#2| 1051)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL NIL
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| NIL NIL
                |Rng&| |NonAssociativeAlgebra&| NIL |Module&|
                |NonAssociativeRing&| NIL NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |SetCategory&| NIL
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 82)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRng|) (|Module| $$) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|CoercibleTo| 11) (|BasicType|)
                 (|unitsKnown|) (|JetBundleOperationsCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleTo| 7) (|CoercibleFrom| 7) (|lazyRepresentation|))
              (|makeByteWordVec2| 176
                                  '(1 11 0 10 12 1 13 11 0 14 2 11 0 0 0 15 1
                                    11 16 0 17 0 16 0 18 0 7 0 24 0 6 0 26 0 7
                                    0 27 1 28 0 20 29 1 30 0 21 31 2 34 33 0 0
                                    35 1 7 33 0 36 1 23 22 0 37 1 30 21 0 38 1
                                    7 39 0 40 2 6 33 0 0 42 1 7 6 0 43 1 28 20
                                    0 44 3 39 0 45 0 0 46 1 39 0 0 47 1 23 0 22
                                    48 1 49 30 0 50 1 7 33 0 51 1 7 0 0 54 2 7
                                    0 0 0 56 2 6 33 0 0 59 1 7 0 6 60 1 7 11 0
                                    65 1 34 11 0 67 2 11 0 0 68 69 2 11 0 0 0
                                    70 2 11 0 0 0 71 2 23 22 0 22 72 2 7 0 0 0
                                    73 2 30 21 0 21 75 2 49 0 0 0 76 3 49 0 77
                                    0 0 78 2 7 0 0 6 81 2 7 0 0 82 83 2 28 20 0
                                    20 84 1 6 82 0 88 2 22 33 0 0 89 2 0 0 0 0
                                    91 2 39 0 0 0 95 2 39 0 0 0 96 2 39 0 0 0
                                    97 2 39 0 45 0 98 1 7 0 100 101 2 49 0 0 0
                                    102 1 7 104 0 105 1 7 33 0 107 1 6 13 0 109
                                    1 6 13 0 111 2 39 33 6 0 113 1 116 39 0 117
                                    1 116 13 0 118 2 116 119 0 100 120 1 121 0
                                    0 122 2 6 123 0 124 125 1 6 33 0 126 2 121
                                    0 2 0 127 1 121 0 0 128 2 7 33 0 6 132 2 7
                                    104 0 6 134 3 7 0 0 6 0 136 1 139 138 0 140
                                    2 6 33 0 0 141 2 139 0 138 0 142 2 6 33 0 0
                                    143 2 138 33 0 0 144 2 145 0 0 0 146 3 139
                                    0 147 0 0 148 1 7 130 68 149 2 7 151 68 130
                                    152 2 150 33 0 0 153 3 155 145 154 0 145
                                    156 1 145 0 0 157 2 155 145 0 100 158 2 145
                                    0 0 0 159 2 139 0 147 0 160 2 116 0 39 100
                                    161 1 145 13 0 162 2 0 130 68 163 164 3 116
                                    16 0 100 119 165 2 7 68 68 68 167 1 7 68 68
                                    169 2 0 33 0 0 1 1 0 33 0 52 1 0 174 0 1 1
                                    0 0 0 1 1 0 33 0 1 1 0 130 68 1 2 0 104 0 0
                                    1 3 0 0 0 6 0 137 0 0 16 19 1 0 68 68 1 2 0
                                    104 0 6 135 2 0 151 68 130 166 1 0 0 0 1 3
                                    0 151 68 130 68 1 2 0 68 68 68 1 1 0 82 82
                                    1 0 0 0 1 1 0 104 0 1 2 0 0 0 124 1 2 0 0 0
                                    13 1 1 0 175 0 1 1 0 6 0 1 2 0 68 68 68 168
                                    1 0 104 0 106 2 0 0 0 124 1 3 0 13 68 130
                                    13 1 1 0 13 0 110 2 0 33 0 0 1 1 0 33 0 53
                                    1 0 0 0 93 0 0 124 1 0 0 124 1 1 0 104 0 1
                                    2 0 0 0 124 1 2 0 0 0 13 1 1 0 6 0 87 2 0
                                    173 0 0 1 2 0 0 0 0 1 1 0 0 68 1 1 0 10 0 1
                                    1 0 39 0 41 2 0 130 68 163 164 1 0 130 68 1
                                    1 0 33 0 74 0 0 82 1 2 0 172 172 172 1 2 0
                                    0 0 0 1 1 0 0 68 1 2 0 33 0 6 133 3 0 129
                                    68 124 130 131 3 0 176 0 124 130 1 2 0 0 0
                                    124 1 2 0 68 68 124 1 2 0 0 0 145 1 1 0 130
                                    130 1 2 0 104 0 0 1 1 0 0 0 85 1 0 0 0 63 2
                                    0 33 0 0 90 3 0 13 68 130 13 1 2 0 0 0 82
                                    115 3 0 0 0 82 13 1 2 0 0 0 171 1 3 0 0 0
                                    171 145 1 2 0 0 0 6 114 1 0 0 0 94 3 0 0 0
                                    6 0 1 1 0 33 0 108 2 0 0 0 0 1 1 0 0 0 79 1
                                    0 11 0 66 1 0 0 100 1 1 0 0 0 1 1 0 0 6 61
                                    1 0 0 7 62 1 0 7 0 64 1 0 13 0 112 0 0 13 1
                                    1 0 68 68 170 3 0 0 0 0 0 1 2 0 33 0 0 1 2
                                    0 0 0 0 1 2 0 33 0 0 1 2 0 0 0 124 1 2 0 0
                                    0 13 1 1 0 0 124 1 0 0 0 1 1 0 0 124 1 0 0
                                    0 1 2 0 0 124 145 1 1 0 0 145 1 1 0 0 13 1
                                    2 0 0 124 13 1 2 0 33 0 0 92 0 0 0 80 0 0 0
                                    86 2 0 0 0 0 91 1 0 0 0 55 2 0 0 0 0 99 2 0
                                    0 124 0 1 2 0 0 0 0 58 2 0 0 100 0 103 2 0
                                    0 13 0 1 2 0 0 7 0 57 2 0 0 0 82 1 3 0 0 0
                                    82 13 1 2 0 0 0 171 1 3 0 0 0 171 145
                                    1)))))
           '|lookupComplete|)) 
