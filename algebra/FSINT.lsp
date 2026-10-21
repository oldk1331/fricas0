
(SDEFUN |FSINT;K2KG|
        ((|k| (|Kernel| F)) (% (|Kernel| (|Expression| (|Complex| R)))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT % 19))) (QREFELT % 22))
          (QREFELT % 23))
         (QREFELT % 25))) 

(SDEFUN |FSINT;tan2temp| ((|k| (|Kernel| F)) (% (|Kernel| F)))
        (SPADCALL (QREFELT % 16) (SPADCALL |k| (QREFELT % 19))
                  (SPADCALL |k| (QREFELT % 26)) (QREFELT % 27))) 

(SDEFUN |FSINT;trans?| ((|f| (F)) (% (|Boolean|)))
        (SPADCALL (CONS #'|FSINT;trans?!0| %) (SPADCALL |f| (QREFELT % 31))
                  (QREFELT % 33))) 

(SDEFUN |FSINT;trans?!0| ((|x1| NIL) (% NIL))
        (COND
         ((OR (SPADCALL |x1| '|log| (QREFELT % 29))
              (SPADCALL |x1| '|exp| (QREFELT % 29)))
          'T)
         ('T (SPADCALL |x1| '|atan| (QREFELT % 29))))) 

(SDEFUN |FSINT;mkPrimh| ((|f| (F)) (|x| (|Symbol|)) (|h| (|Boolean|)) (% (F)))
        (SPROG ((|g| (F)))
               (SEQ (LETT |g| (SPADCALL |f| |x| (QREFELT % 35)))
                    (COND
                     (|h|
                      (COND
                       ((|FSINT;trans?| |g| %)
                        (EXIT (SPADCALL |g| (QREFELT % 37)))))))
                    (EXIT |g|)))) 

(SDEFUN |FSINT;rinteg|
        ((|i| (|IntegrationResult| F)) (|f| (F)) (|x| (|Symbol|))
         (|h| (|Boolean|)) (% (|List| F)))
        (SPROG ((#1=#:G48 NIL) (#2=#:G49 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |i| (QREFELT % 39)))
                  (LIST (SPADCALL |f| |x| (QREFELT % 40))))
                 ('T
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT #2# (SPADCALL |i| |x| (QREFELT % 42))) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS (|FSINT;mkPrimh| |f| |x| |h| %) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |FSINT;halfangle| ((|a| (F)) (% (F)))
        (SEQ (LETT |a| (SPADCALL 2 |a| (QREFELT % 44)))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| % 46) (SPADCALL |a| (QREFELT % 47))
                         (QREFELT % 48))
               (SPADCALL (|spadConstant| % 46) (SPADCALL |a| (QREFELT % 47))
                         (QREFELT % 49))
               (QREFELT % 50))))) 

(SDEFUN |FSINT;Khalf| ((|k| (|Kernel| F)) (% (F)))
        (SPROG ((|a| (F)))
               (SEQ
                (LETT |a|
                      (SPADCALL 2 (|SPADfirst| (SPADCALL |k| (QREFELT % 19)))
                                (QREFELT % 44)))
                (EXIT
                 (SPADCALL (SPADCALL |a| (QREFELT % 51))
                           (SPADCALL (|spadConstant| % 46)
                                     (SPADCALL |a| (QREFELT % 47))
                                     (QREFELT % 49))
                           (QREFELT % 50)))))) 

(SDEFUN |FSINT;find_int|
        ((|i| (|Kernel| F)) (|t| (|List| (|Kernel| F))) (% (|Kernel| F)))
        (SPROG
         ((|ail| #1=(|List| F)) (|k0| (|NonNegativeInteger|)) (|ii| (F))
          (|k| NIL) (#2=#:G63 NIL) (|akl| #1#) (#3=#:G61 NIL) (#4=#:G62 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ail| (SPADCALL |i| (QREFELT % 19)))
                (LETT |k0| (LENGTH |ail|))
                (LETT |ii| (SPADCALL |i| (QREFELT % 52)))
                (SEQ (LETT |k| NIL) (LETT #2# |t|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |k| (QREFELT % 53)) '|%iint|
                                   (QREFELT % 29))
                         (SEQ (LETT |akl| (SPADCALL |k| (QREFELT % 19)))
                              (EXIT
                               (COND
                                ((SPADCALL (LENGTH |akl|) |k0| (QREFELT % 54))
                                 (PROGN (LETT #3# |$NoValue|) (GO #5=#:G54)))
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |ii| (SPADCALL |k| (QREFELT % 52))
                                             (QREFELT % 48))
                                   (QREFELT % 56))
                                  (|spadConstant| % 57) (QREFELT % 58))
                                 (PROGN (LETT #4# |k|) (GO #6=#:G60)))))))))
                      #5# (EXIT #3#))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |i|)))
          #6# (EXIT #4#)))) 

(SDEFUN |FSINT;extend_tower|
        ((|lk| (|List| #1=(|Kernel| F))) (% (|List| (|Kernel| F))))
        (SPROG
         ((|k| NIL) (#2=#:G86 NIL) (|op| (|BasicOperator|)) (|args| (|List| F))
          (|iu| (|Union| (|Integer|) "failed")) (|i| (|Integer|)) (|ke| (F))
          (|l1| (|List| #1#)) (|k1| NIL) (#3=#:G87 NIL) (#4=#:G85 NIL)
          (|res| (|List| (|Kernel| F))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #2# |lk|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (LIST |k|))
                        (LETT |op| (SPADCALL |k| (QREFELT % 53)))
                        (COND
                         ((EQUAL (SPADCALL |op| (QREFELT % 59)) '|polylog|)
                          (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 19)))
                               (LETT |iu|
                                     (SPADCALL (|SPADfirst| |args|)
                                               (QREFELT % 61)))
                               (EXIT
                                (COND
                                 ((QEQCAR |iu| 0)
                                  (SEQ (LETT |i| (QCDR |iu|))
                                       (EXIT
                                        (COND
                                         ((> |i| 0)
                                          (COND
                                           ((< |i| 10)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL (> |i| 2)) (GO G191)))
                                                 (SEQ (LETT |i| (- |i| 1))
                                                      (LETT |ke|
                                                            (SPADCALL |op|
                                                                      (CONS
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                                        (QREFELT
                                                                         % 65))
                                                                       (CDR
                                                                        |args|))
                                                                      (QREFELT
                                                                       % 67)))
                                                      (EXIT
                                                       (LETT |l1|
                                                             (CONS
                                                              (SPADCALL |ke|
                                                                        (QREFELT
                                                                         % 68))
                                                              |l1|))))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))))))))))))
                        (EXIT
                         (SEQ (LETT |k1| NIL) (LETT #3# |l1|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |k1| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| |res| (QREFELT % 70))
                                  (PROGN (LETT #4# |$NoValue|) (GO #5=#:G78)))
                                 ('T (LETT |res| (CONS |k1| |res|)))))
                               #5# (EXIT #4#))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |FSINT;postSubst|
        ((|f| (F)) (|otf| (|List| (|Kernel| F))) (|lv| (|List| F))
         (|lk| (|List| (|Kernel| F))) (|ltan| (|List| (|Kernel| F)))
         (|ekers| (|List| (|Kernel| F))) (|evals| (|List| F)) (|x| (|Symbol|))
         (% (F)))
        (SPROG
         ((#1=#:G124 NIL) (#2=#:G123 NIL) (|u| (|Union| (|Kernel| F) "failed"))
          (|uk| (|Kernel| F)) (#3=#:G125 NIL) (|kk| NIL) (#4=#:G126 NIL)
          (|vkl| (|List| (|Kernel| F))) (|vk| (|Kernel| F)) (|vkf| (F))
          (|vc| (F)) (|vkv| (F)) (|v| NIL) (#5=#:G128 NIL) (#6=#:G127 NIL)
          (|tf| (|List| (|Kernel| F))) (|k| (|Kernel| F)) (#7=#:G129 NIL)
          (#8=#:G130 NIL) (|ltemp| (|List| (|Kernel| F))) (#9=#:G131 NIL)
          (#10=#:G132 NIL) (#11=#:G133 NIL) (#12=#:G134 NIL))
         (SEQ
          (SEQ (LETT #1# |lk|) (LETT |v| NIL) (LETT #2# |lv|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL) (ATOM #1#)
                     (PROGN (LETT |k| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |v| (QREFELT % 72)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ (LETT |uk| (QCDR |u|))
                            (COND
                             ((SPADCALL (SPADCALL |uk| (QREFELT % 53))
                                        (QREFELT % 11) (QREFELT % 73))
                              (LETT |f|
                                    (SPADCALL
                                     (SPADCALL |f| |uk|
                                               (SPADCALL |uk| (QREFELT % 75))
                                               (QREFELT % 78))
                                     (SPADCALL |uk| (QREFELT % 52))
                                     (QREFELT % 79)))))
                            (EXIT
                             (LETT |f|
                                   (SPADCALL |f| (LIST |uk|)
                                             (LIST
                                              (SPADCALL |k| (QREFELT % 52)))
                                             (QREFELT % 81))))))
                      ((SPADCALL |k| '|nthRoot| (QREFELT % 82))
                       (SEQ
                        (LETT |vkl|
                              (PROGN
                               (LETT #3# NIL)
                               (SEQ (LETT |kk| NIL)
                                    (LETT #4# (SPADCALL |v| (QREFELT % 83)))
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN (LETT |kk| (CAR #4#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| '|nthRoot|
                                                  (QREFELT % 82))
                                        (LETT #3# (CONS |kk| #3#))))))
                                    (LETT #4# (CDR #4#)) (GO G190) G191
                                    (EXIT (NREVERSE #3#)))))
                        (EXIT
                         (COND
                          ((EQL (LENGTH |vkl|) 1)
                           (SEQ (LETT |vk| (SPADCALL |vkl| 1 (QREFELT % 84)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |vk| |otf| (QREFELT % 70)) "skip")
                                  ('T
                                   (SEQ
                                    (LETT |vkf| (SPADCALL |vk| (QREFELT % 52)))
                                    (LETT |vc|
                                          (SPADCALL |v| |vkf| (QREFELT % 50)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |vk|
                                                 (SPADCALL |vc| (QREFELT % 83))
                                                 (QREFELT % 70))
                                       "skip")
                                      ('T
                                       (SEQ
                                        (LETT |vkv|
                                              (SPADCALL
                                               (SPADCALL |k| (QREFELT % 52))
                                               |vc| (QREFELT % 50)))
                                        (LETT |f|
                                              (SPADCALL
                                               (SPADCALL |f| |vk|
                                                         (SPADCALL |vk|
                                                                   (QREFELT %
                                                                            75))
                                                         (QREFELT % 78))
                                               |vkf| (QREFELT % 79)))
                                        (EXIT
                                         (LETT |f|
                                               (SPADCALL |f| (LIST |vk|)
                                                         (LIST |vkv|)
                                                         (QREFELT %
                                                                  81)))))))))))))))))))))
               (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |v| NIL) (LETT #5# |evals|) (LETT #6# |ekers|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#)) NIL) (ATOM #5#)
                     (PROGN (LETT |v| (CAR #5#)) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |k| (QREFELT % 53)) '|%iint|
                            (QREFELT % 29))
                  (COND
                   ((NULL
                     (SPADCALL |k| (LETT |tf| (SPADCALL |f| (QREFELT % 85)))
                               (QREFELT % 70)))
                    (LETT |k| (|FSINT;find_int| |k| |tf| %))))))
                (EXIT
                 (LETT |f|
                       (SPADCALL |f| (LIST |k|) (LIST |v|) (QREFELT % 81)))))
               (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#)))) (GO G190) G191
               (EXIT NIL))
          (COND
           ((NULL (NULL |ltan|))
            (SEQ
             (LETT |ltemp|
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT #8# |ltan|) G190
                         (COND
                          ((OR (ATOM #8#) (PROGN (LETT |k| (CAR #8#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #7# (CONS (|FSINT;tan2temp| |k| %) #7#))))
                         (LETT #8# (CDR #8#)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (LETT |f|
                   (SPADCALL |f| |ltan|
                             (PROGN
                              (LETT #9# NIL)
                              (SEQ (LETT #10# |ltemp|) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN (LETT |k| (CAR #10#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #9#
                                           (CONS (SPADCALL |k| (QREFELT % 52))
                                                 #9#))))
                                   (LETT #10# (CDR #10#)) (GO G190) G191
                                   (EXIT (NREVERSE #9#))))
                             (QREFELT % 81)))
             (LETT |f|
                   (SPADCALL |f| '|%temptan| 2
                             (CONS (|function| |FSINT;halfangle|) %)
                             (QREFELT % 87)))
             (EXIT
              (LETT |f|
                    (SPADCALL |f| |ltemp|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT #12# |ltemp|) G190
                                    (COND
                                     ((OR (ATOM #12#)
                                          (PROGN (LETT |k| (CAR #12#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #11#
                                            (CONS (|FSINT;Khalf| |k| %)
                                                  #11#))))
                                    (LETT #12# (CDR #12#)) (GO G190) G191
                                    (EXIT (NREVERSE #11#))))
                              (QREFELT % 81)))))))
          (LETT |f| (SPADCALL |f| |x| (QREFELT % 89)))
          (LETT |f| (SPADCALL |f| (QREFELT % 90)))
          (EXIT (SPADCALL |f| |x| (QREFELT % 91)))))) 

(SDEFUN |FSINT;inv_lst|
        ((|lt| (|List| (|Kernel| (|Expression| (|Complex| R)))))
         (|le| (|List| (|Expression| (|Complex| R))))
         (%
          (|Record|
           (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
           (|:| |val| (|List| (|Expression| (|Complex| R)))))))
        (SPROG
         ((|im| (|Complex| R)) (|e| NIL) (#1=#:G152 NIL) (|k| NIL)
          (#2=#:G151 NIL) (|e1| #3=(|Expression| (|Complex| R))) (|k1| #3#)
          (|iku| (|Union| (|Kernel| (|Expression| (|Complex| R))) "failed"))
          (#4=#:G150 NIL) (|ik| (|Kernel| (|Expression| (|Complex| R))))
          (|ie| (|Expression| (|Complex| R)))
          (|resk| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|rese| (|List| (|Expression| (|Complex| R)))))
         (SEQ (LETT |resk| NIL) (LETT |rese| NIL)
              (LETT |im|
                    (SPADCALL (|spadConstant| % 62) (|spadConstant| % 45)
                              (QREFELT % 93)))
              (SEQ (LETT |e| NIL) (LETT #1# |le|) (LETT |k| NIL)
                   (LETT #2# |lt|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (COND
                       ((NULL (SPADCALL |k| '|atan| (QREFELT % 95)))
                        (COND
                         ((NULL (SPADCALL |k| '|tan| (QREFELT % 95)))
                          (EXIT
                           (PROGN (LETT #4# |$NoValue|) (GO #5=#:G136)))))))
                      (COND
                       ((SPADCALL |k| '|atan| (QREFELT % 95))
                        (SEQ
                         (LETT |ik|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |im| (QREFELT % 96)) |e|
                                           (QREFELT % 97))
                                 (QREFELT % 98))
                                (QREFELT % 25)))
                         (LETT |ie|
                               (SPADCALL
                                (SPADCALL (SPADCALL 2 |im| (QREFELT % 96))
                                          (SPADCALL |k| (QREFELT % 99))
                                          (QREFELT % 97))
                                (QREFELT % 98)))
                         (LETT |resk| (CONS |ik| |resk|))
                         (EXIT (LETT |rese| (CONS |ie| |rese|))))))
                      (EXIT
                       (COND
                        ((SPADCALL |k| '|tan| (QREFELT % 95))
                         (SEQ (LETT |e1| (SPADCALL |im| |e| (QREFELT % 97)))
                              (LETT |k1|
                                    (SPADCALL |im|
                                              (SPADCALL |k| (QREFELT % 99))
                                              (QREFELT % 97)))
                              (LETT |iku|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |e1| (|spadConstant| % 100)
                                                 (QREFELT % 101))
                                       (SPADCALL |e1| (|spadConstant| % 100)
                                                 (QREFELT % 102))
                                       (QREFELT % 103))
                                      (QREFELT % 98))
                                     (QREFELT % 104)))
                              (EXIT
                               (COND
                                ((QEQCAR |iku| 1)
                                 (PROGN (LETT #4# |$NoValue|) (GO #5#)))
                                ('T
                                 (SEQ (LETT |ik| (QCDR |iku|))
                                      (LETT |ie|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |k1|
                                                        (|spadConstant| % 100)
                                                        (QREFELT % 101))
                                              (SPADCALL |k1|
                                                        (|spadConstant| % 100)
                                                        (QREFELT % 102))
                                              (QREFELT % 103))
                                             (QREFELT % 98)))
                                      (LETT |resk| (CONS |ik| |resk|))
                                      (EXIT
                                       (LETT |rese|
                                             (CONS |ie| |rese|)))))))))))))
                    #5# (EXIT #4#))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS (REVERSE |resk|) (REVERSE |rese|)))))) 

(SDEFUN |FSINT;inv_alg_lst|
        ((|lt| (|List| (|Kernel| F)))
         (%
          (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F)))))
        (SPROG
         ((|k| NIL) (#1=#:G167 NIL) (|e1| (|Expression| (|Complex| R)))
          (|ckl| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|ck| (|Kernel| (|Expression| (|Complex| R))))
          (|ckf| (|Expression| (|Complex| R))) (|e2| (F))
          (|ru1| (|Union| (|Kernel| F) "failed")) (#2=#:G166 NIL)
          (|resk| (|List| (|Kernel| F))) (|rese| (|List| F)))
         (SEQ (LETT |resk| NIL) (LETT |rese| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |lt|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 82)))
                       (PROGN (LETT #2# |$NoValue|) (GO #3=#:G154)))
                      ('T
                       (SEQ
                        (LETT |e1|
                              (SPADCALL (SPADCALL |k| (QREFELT % 52))
                                        (QREFELT % 22)))
                        (LETT |ckl| (SPADCALL |e1| (QREFELT % 105)))
                        (EXIT
                         (COND
                          ((SPADCALL (LENGTH |ckl|) 1 (QREFELT % 54))
                           (PROGN (LETT #2# |$NoValue|) (GO #3#)))
                          ('T
                           (SEQ (LETT |ck| (SPADCALL |ckl| 1 (QREFELT % 107)))
                                (LETT |ckf| (SPADCALL |ck| (QREFELT % 99)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |e1| |ckf| (QREFELT % 108))
                                   (PROGN (LETT #2# |$NoValue|) (GO #3#)))
                                  ('T
                                   (SEQ
                                    (LETT |e2|
                                          (SPADCALL |ckf| (QREFELT % 109)))
                                    (LETT |ru1| (SPADCALL |e2| (QREFELT % 72)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ru1| 1)
                                       (PROGN (LETT #2# |$NoValue|) (GO #3#)))
                                      ('T
                                       (SEQ
                                        (LETT |resk|
                                              (CONS (QCDR |ru1|) |resk|))
                                        (EXIT
                                         (LETT |rese|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |k| (QREFELT % 52))
                                                 (SPADCALL
                                                  (SPADCALL |e1| |ckf|
                                                            (QREFELT % 103))
                                                  (QREFELT % 109))
                                                 (QREFELT % 50))
                                                |rese|)))))))))))))))))))
                    #3# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resk|) (NREVERSE |rese|)))))) 

(SDEFUN |FSINT;to_real|
        ((|fg| (|Expression| (|Complex| R)))
         (|rtg|
          (|Record|
           (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
           (|:| |val| (|List| (|Expression| (|Complex| R))))))
         (|ralg|
          (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
         (% (F)))
        (SPROG ((|f| (F)))
               (SEQ
                (LETT |f|
                      (SPADCALL
                       (SPADCALL |fg| (QCAR |rtg|) (QCDR |rtg|)
                                 (QREFELT % 110))
                       (QREFELT % 109)))
                (EXIT
                 (SPADCALL |f| (QCAR |ralg|) (QCDR |ralg|) (QREFELT % 111)))))) 

(SDEFUN |FSINT;goComplex?|
        ((|rt| (|Boolean|)) (|l| (|List| (|Kernel| F)))
         (|ltan| (|List| (|Kernel| F))) (% (|Boolean|)))
        (COND ((NULL |ltan|) |rt|) ('T 'T))) 

(SDEFUN |FSINT;integrate;FSU;15|
        ((|f| (F)) (|x| (|Symbol|)) (% (|Union| F (|List| F))))
        (SPROG
         ((|ir| (|IntegrationResult| F)) (|tf| (|List| (|Kernel| F)))
          (|ltf| #1=(|List| (|Kernel| F))) (|ht| #2=(|Boolean|))
          (#3=#:G238 NIL) (#4=#:G239 NIL) (|etf| (|List| F)) (|v| NIL)
          (#5=#:G241 NIL) (#6=#:G240 NIL)
          (|vu| (|Union| (|Kernel| F) "failed")) (|vk| (|Kernel| F)) (|s| (F))
          (|kn| (|Symbol|)) (|ekers| (|List| (|Kernel| F)))
          (|evals| (|List| F)) (|f1| (F)) (|tf1| #7=(|List| (|Kernel| F)))
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|tf2| #7#) (#8=#:G242 NIL) (|akl| (|List| F)) (|ak1| (F))
          (#9=#:G201 NIL) (|ak2| (|NonNegativeInteger|))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|nak| (F)) (|rnumu| (|Union| R "failed")) (#10=#:G237 NIL)
          (|r_lst| (|List| (|Kernel| F))) (|ec| (F)) (|nk| (F))
          (|rv_lst| (|List| F)) (|ir_lst| (|List| F))
          (|nr_lst| (|List| (|Kernel| F))) (|g| (F)) (|tg0| #7#)
          (#11=#:G243 NIL) (#12=#:G244 NIL) (|tg| (|List| (|Kernel| F)))
          (|ltg| #1#) (|rtg| #2#) (|el| #2#)
          (|ralg|
           (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
          (|gg0| (|Expression| (|Complex| R)))
          (|tgg0| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (#13=#:G245 NIL) (|k| NIL) (#14=#:G246 NIL)
          (|tgg1| (|List| (|Expression| (|Complex| R))))
          (|rtg1|
           (|Record|
            (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
            (|:| |val| (|List| (|Expression| (|Complex| R))))))
          (|gg| (|Expression| (|Complex| R))) (|i| (|IntegrationResult| F))
          (|ltg0| #1#) (#15=#:G247 NIL) (|h| NIL) (#16=#:G248 NIL)
          (|rl| (|List| F)))
         (SEQ
          (COND
           ((OR (|HasSignature| (QREFELT % 6) (LIST '|imaginary| (LIST '%)))
                (|domainEqual| (QREFELT % 6) (|AlgebraicNumber|)))
            (SEQ (LETT |ir| (SPADCALL |f| |x| (QREFELT % 113)))
                 (EXIT (CONS 0 (SPADCALL |ir| (QREFELT % 114))))))
           ((NULL (SPADCALL |f| (QREFELT % 116)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT % 118))))
           ('T
            (SEQ
             (LETT |f|
                   (SPADCALL |f| (SPADCALL |x| (QREFELT % 119))
                             (QREFELT % 120)))
             (LETT |tf| (|FSINT;extend_tower| (SPADCALL |f| (QREFELT % 85)) %))
             (LETT |ltf|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!0| %) |tf|
                             (QREFELT % 122)))
             (LETT |ht|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!1|
                          (VECTOR (QREFELT % 9) %))
                    |tf| (QREFELT % 123)))
             (LETT |etf|
                   (PROGN
                    (LETT #3# NIL)
                    (SEQ (LETT |k| NIL) (LETT #4# |tf|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS
                                  (SPADCALL (SPADCALL |k| (QREFELT % 52)) |x|
                                            (QREFELT % 124))
                                  #3#))))
                         (LETT #4# (CDR #4#)) (GO G190) G191
                         (EXIT (NREVERSE #3#)))))
             (LETT |ekers| NIL) (LETT |evals| NIL)
             (SEQ (LETT |v| NIL) (LETT #5# |etf|) (LETT |k| NIL)
                  (LETT #6# |tf|) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#)) NIL) (ATOM #5#)
                        (PROGN (LETT |v| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ (LETT |s| (|spadConstant| % 57))
                       (SEQ (LETT |vu| (SPADCALL |v| (QREFELT % 72)))
                            (EXIT
                             (COND
                              ((QEQCAR |vu| 0)
                               (SEQ (LETT |vk| (QCDR |vu|))
                                    (EXIT (LETT |s| (|spadConstant| % 46)))))
                              ('T
                               (SEQ
                                (LETT |vu|
                                      (SPADCALL (SPADCALL |v| (QREFELT % 125))
                                                (QREFELT % 72)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |vu| 0)
                                   (SEQ (LETT |vk| (QCDR |vu|))
                                        (EXIT
                                         (LETT |s|
                                               (SPADCALL (|spadConstant| % 46)
                                                         (QREFELT %
                                                                  125)))))))))))))
                       (EXIT
                        (COND
                         ((SPADCALL |s| (|spadConstant| % 57) (QREFELT % 126))
                          (SEQ
                           (LETT |kn|
                                 (SPADCALL (SPADCALL |vk| (QREFELT % 53))
                                           (QREFELT % 59)))
                           (EXIT
                            (COND
                             ((OR (EQUAL |kn| '|%iint|) (EQUAL |kn| '|atan|))
                              (SEQ (LETT |ekers| (CONS |vk| |ekers|))
                                   (EXIT
                                    (LETT |evals|
                                          (CONS
                                           (SPADCALL |s|
                                                     (SPADCALL |k|
                                                               (QREFELT % 52))
                                                     (QREFELT % 127))
                                           |evals|))))))))))))
                  (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#)))) (GO G190)
                  G191 (EXIT NIL))
             (LETT |f1| (SPADCALL |f| |tf| |etf| (QREFELT % 81)))
             (LETT |tf1| (SPADCALL |f1| (QREFELT % 85)))
             (LETT |rec| (SPADCALL |f1| |x| (QREFELT % 129)))
             (LETT |tf2| (SPADCALL (QVELT |rec| 0) (QREFELT % 85)))
             (LETT |r_lst| NIL) (LETT |rv_lst| NIL) (LETT |nr_lst| NIL)
             (LETT |ir_lst| NIL)
             (SEQ (LETT |k| NIL) (LETT #8# |tf2|) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |k| (CAR #8#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 82)))
                      (PROGN (LETT #10# |$NoValue|) (GO #17=#:G199)))
                     ('T
                      (SEQ (LETT |akl| (SPADCALL |k| (QREFELT % 19)))
                           (LETT |ak1|
                                 (SPADCALL (|SPADfirst| |akl|) |r_lst| |rv_lst|
                                           (QREFELT % 81)))
                           (LETT |ak2|
                                 (PROG1
                                     (LETT #9#
                                           (SPADCALL
                                            (SPADCALL |akl| 2 (QREFELT % 130))
                                            (QREFELT % 131)))
                                   (|check_subtype2| (>= #9# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #9#)))
                           (LETT |pr| (SPADCALL |ak1| |ak2| (QREFELT % 134)))
                           (LETT |nak| (QVELT |pr| 2))
                           (LETT |rnumu|
                                 (SPADCALL (SPADCALL |nak| (QREFELT % 136))
                                           (QREFELT % 139)))
                           (COND
                            ((EQL (QVELT |pr| 0) |ak2|)
                             (COND
                              ((SPADCALL (QVELT |pr| 1) (|spadConstant| % 46)
                                         (QREFELT % 58))
                               (COND
                                ((QEQCAR |rnumu| 1)
                                 (EXIT
                                  (PROGN
                                   (LETT #10# |$NoValue|)
                                   (GO #17#)))))))))
                           (LETT |r_lst| (CONS |k| |r_lst|))
                           (LETT |ec|
                                 (SPADCALL (QVELT |pr| 1) |nr_lst| |ir_lst|
                                           (QREFELT % 81)))
                           (COND
                            ((QEQCAR |rnumu| 0)
                             (SEQ
                              (LETT |nk|
                                    (SPADCALL (SPADCALL |k| (QREFELT % 53))
                                              (LIST
                                               (SPADCALL (|spadConstant| % 46)
                                                         |nak| (QREFELT % 50))
                                               (SPADCALL (QVELT |pr| 0)
                                                         (QREFELT % 140)))
                                              (QREFELT % 67)))
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT % 50))
                                     |rv_lst|))
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL |ec|
                                                (SPADCALL |k| (QREFELT % 52))
                                                (QREFELT % 50))
                                      |ir_lst|)))))
                            ('T
                             (SEQ
                              (LETT |nk|
                                    (SPADCALL (SPADCALL |k| (QREFELT % 53))
                                              (LIST |nak|
                                                    (SPADCALL (QVELT |pr| 0)
                                                              (QREFELT % 140)))
                                              (QREFELT % 67)))
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT % 127))
                                     |rv_lst|))
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL (SPADCALL |k| (QREFELT % 52))
                                                (SPADCALL (QVELT |pr| 1)
                                                          |nr_lst| |ir_lst|
                                                          (QREFELT % 81))
                                                (QREFELT % 50))
                                      |ir_lst|))))))
                           (EXIT
                            (LETT |nr_lst|
                                  (CONS (SPADCALL |nk| (QREFELT % 68))
                                        |nr_lst|)))))))
                   #17# (EXIT #10#))
                  (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
             (LETT |g|
                   (SPADCALL (QVELT |rec| 0) |r_lst| |rv_lst| (QREFELT % 111)))
             (LETT |tg0| (SPADCALL |g| (QREFELT % 85)))
             (LETT |tg|
                   (PROGN
                    (LETT #11# NIL)
                    (SEQ (LETT |k| NIL) (LETT #12# |tg0|) G190
                         (COND
                          ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT % 52))
                                                 (QREFELT % 142))
                                       (QREFELT % 143))
                             (LETT #11# (CONS |k| #11#))))))
                         (LETT #12# (CDR #12#)) (GO G190) G191
                         (EXIT (NREVERSE #11#)))))
             (LETT |ltg0|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!2| %) |tg0|
                             (QREFELT % 122)))
             (LETT |ltg|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!3| %) |tg|
                             (QREFELT % 122)))
             (LETT |rtg|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!4|
                          (VECTOR (QREFELT % 8) %))
                    |tg| (QREFELT % 123)))
             (LETT |el|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!5|
                          (VECTOR (QREFELT % 10) %))
                    |tg| (QREFELT % 123)))
             (COND
              ((|FSINT;goComplex?| |rtg| |tg| |ltg| %)
               (SEQ (LETT |ralg| (|FSINT;inv_alg_lst| |tg0| %))
                    (LETT |gg0| (SPADCALL |g| (QREFELT % 22)))
                    (LETT |tgg0| (SPADCALL |gg0| (QREFELT % 144)))
                    (LETT |tgg1|
                          (PROGN
                           (LETT #13# NIL)
                           (SEQ (LETT |k| NIL) (LETT #14# |tgg0|) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |k| (CAR #14#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT % 99)) NIL
                                          (QREFELT % 145))
                                         #13#))))
                                (LETT #14# (CDR #14#)) (GO G190) G191
                                (EXIT (NREVERSE #13#)))))
                    (LETT |rtg1| (|FSINT;inv_lst| |tgg0| |tgg1| %))
                    (LETT |gg| (SPADCALL |gg0| |tgg0| |tgg1| (QREFELT % 146)))
                    (LETT |i|
                          (SPADCALL
                           (CONS #'|FSINT;integrate;FSU;15!6|
                                 (VECTOR % |ralg| |rtg1|))
                           (SPADCALL |gg| |x| (QREFELT % 149))
                           (QREFELT % 152)))
                    (EXIT
                     (LETT |i|
                           (SPADCALL |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 46)
                                                 (QREFELT % 125))
                                       (QREFELT % 153))
                                      (QREFELT % 68))
                                     (QREFELT % 155))))))
              (#18='T (LETT |i| (SPADCALL |g| |x| (QREFELT % 157)))))
             (LETT |i|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!7|
                          (VECTOR % |ir_lst| |nr_lst|))
                    |i| (QREFELT % 160)))
             (LETT |ltg0| (SPADCALL |ltg0| |ltf| (QREFELT % 161)))
             (LETT |rl|
                   (PROGN
                    (LETT #15# NIL)
                    (SEQ (LETT |h| NIL)
                         (LETT #16#
                               (|FSINT;rinteg| |i| |f| |x|
                                (COND (|el| |ht|) (#18# NIL)) %))
                         G190
                         (COND
                          ((OR (ATOM #16#) (PROGN (LETT |h| (CAR #16#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS
                                  (|FSINT;postSubst| |h| |tf1| (QVELT |rec| 2)
                                   (QVELT |rec| 1) |ltg0| |ekers| |evals| |x|
                                   %)
                                  #15#))))
                         (LETT #16# (CDR #16#)) (GO G190) G191
                         (EXIT (NREVERSE #15#)))))
             (EXIT
              (COND ((NULL (CDR |rl|)) (CONS 0 (|SPADfirst| |rl|)))
                    (#18# (CONS 1 |rl|)))))))))) 

(SDEFUN |FSINT;integrate;FSU;15!7| ((|ii| NIL) ($$ NIL))
        (PROG (|nr_lst| |ir_lst| %)
          (LETT |nr_lst| (QREFELT $$ 2))
          (LETT |ir_lst| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |ii| |nr_lst| |ir_lst| (QREFELT % 81)))))) 

(SDEFUN |FSINT;integrate;FSU;15!6| ((|fg| NIL) ($$ NIL))
        (PROG (|rtg1| |ralg| %)
          (LETT |rtg1| (QREFELT $$ 2))
          (LETT |ralg| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FSINT;to_real| |fg| |rtg1| |ralg| %))))) 

(SDEFUN |FSINT;integrate;FSU;15!5| ((|x1| NIL) ($$ NIL))
        (PROG (% ELEM)
          (LETT % (QREFELT $$ 1))
          (LETT ELEM (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT % 53)) ELEM (QREFELT % 73)))))) 

(SDEFUN |FSINT;integrate;FSU;15!4| ((|x1| NIL) ($$ NIL))
        (PROG (% RTRIG)
          (LETT % (QREFELT $$ 1))
          (LETT RTRIG (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT % 53)) RTRIG (QREFELT % 73)))))) 

(SDEFUN |FSINT;integrate;FSU;15!3| ((|x1| NIL) (% NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT % 53)) '|tan| (QREFELT % 29))) 

(SDEFUN |FSINT;integrate;FSU;15!2| ((|x1| NIL) (% NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT % 53)) '|tan| (QREFELT % 29))) 

(SDEFUN |FSINT;integrate;FSU;15!1| ((|x1| NIL) ($$ NIL))
        (PROG (% HTRIG)
          (LETT % (QREFELT $$ 1))
          (LETT HTRIG (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT % 53)) HTRIG (QREFELT % 73)))))) 

(SDEFUN |FSINT;integrate;FSU;15!0| ((|x1| NIL) (% NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT % 53)) '|tan| (QREFELT % 29))) 

(DECLAIM (NOTINLINE |FunctionSpaceIntegration;|)) 

(DEFUN |FunctionSpaceIntegration;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FunctionSpaceIntegration| DV$1 DV$2))
          (LETT % (GETREFV 164))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceIntegration|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|rtrig|)
          (QSETREFV % 9 '|htrig|)
          (QSETREFV % 10 '|elem|)
          (QSETREFV % 11 '|%alg|)
          (QSETREFV % 16 (SPADCALL '|%temptan| 1 (QREFELT % 15)))
          %))) 

(DEFUN |FunctionSpaceIntegration| (&REST #1=#:G249)
  (SPROG NIL
         (PROG (#2=#:G250)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceIntegration|)))))))))) 

(MAKEPROP '|FunctionSpaceIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              'HTRIG 'ELEM 'ALGOP (|Symbol|) (|NonNegativeInteger|)
              (|BasicOperator|) (0 . |operator|) '|optemp| (|List| 7)
              (|Kernel| 7) (6 . |argument|) (|Expression| 92)
              (|InnerTrigonometricManipulations| 6 7 20) (11 . F2FG)
              (16 . |tan|) (|Kernel| %) (21 . |retract|) (26 . |height|)
              (31 . |kernel|) (|Boolean|) (38 . |is?|) (|List| 14)
              (44 . |operators|) (|Mapping| 28 14) (49 . |any?|)
              (|IntegrationTools| 6 7) (55 . |mkPrim|)
              (|TranscendentalManipulations| 6 7) (61 . |htrigs|)
              (|IntegrationResult| 7) (66 . |elem?|) (71 . |integral|)
              (|IntegrationResultToFunction| 6 7) (77 . |expand|)
              (|PositiveInteger|) (83 . *) (89 . |1|) (93 . |1|) (97 . |cos|)
              (102 . -) (108 . +) (114 . /) (120 . |sin|) (125 . |coerce|)
              (130 . |operator|) (135 . ~=)
              (|ElementaryFunctionStructurePackage| 6 7) (141 . |normalize|)
              (146 . |0|) (150 . =) (156 . |name|) (|Union| 63 '#1="failed")
              (161 . |retractIfCan|) (166 . |0|) (|Integer|) (170 . |coerce|)
              (175 . |coerce|) (|List| %) (180 . |kernel|) (186 . |retract|)
              (|List| 18) (191 . |member?|) (|Union| 24 '#1#)
              (197 . |retractIfCan|) (202 . |has?|)
              (|SparseUnivariatePolynomial| %) (208 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 138 7)
              (213 . |univariate|) (220 . |elt|) (|List| 24) (226 . |eval|)
              (233 . |is?|) (239 . |kernels|) (244 . |elt|) (250 . |tower|)
              (|Mapping| % %) (255 . |eval|) (|RealNormalizationUtilities| 6 7)
              (263 . |try_real|) (269 . |removeSinSq|)
              (274 . |removeConstantTerm|) (|Complex| 6) (280 . |complex|)
              (|Kernel| 20) (286 . |is?|) (292 . *) (298 . *) (304 . -)
              (309 . |coerce|) (314 . |1|) (318 . +) (324 . -) (330 . /)
              (336 . |retractIfCan|) (341 . |kernels|) (|List| 94)
              (346 . |elt|) (352 . =) (358 . FG2F) (363 . |subst|)
              (370 . |subst|) (|FunctionSpaceComplexIntegrationAux| 6 7)
              (377 . |internalIntegrate|) (383 . |complexExpand|)
              (|TrigonometricManipulations| 6 7) (388 . |real?|)
              (|FunctionSpaceComplexIntegration| 6 7)
              (393 . |complexIntegrate|) (399 . |coerce|) (404 . |distribute|)
              (|Mapping| 28 18) (410 . |select|) (416 . |any?|)
              (422 . |realLiouvillian|) (428 . -) (433 . ~=) (439 . *)
              (|Record| (|:| |func| 7) (|:| |kers| 69) (|:| |vals| 17))
              (445 . |rischNormalize|) (451 . |elt|) (457 . |retract|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 138 7)
              (462 . |froot|) (|SparseMultivariatePolynomial| 6 24)
              (468 . |numer|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 18) (473 . |retractIfCan|)
              (478 . |coerce|) (|List| 12) (483 . |variables|)
              (488 . |member?|) (494 . |tower|) (499 . |trigs2explogs|)
              (505 . |eval|) (|IntegrationResult| 20)
              (|ElementaryIntegration| 92 20) (512 . |lfintegrate|)
              (|Mapping| 7 20) (|IntegrationResultFunctions2| 20 7)
              (518 . |map|) (524 . |sqrt|) (|GenusZeroIntegration| 6 7 7)
              (529 . |rationalize_ir|) (|ElementaryIntegration| 6 7)
              (535 . |lfintegrate|) (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (541 . |map|)
              (547 . |setDifference|) (|Union| 7 17) |FSINT;integrate;FSU;15|)
           '#(|integrate| 553) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integrate|
                                 ((|Union| |#2| (|List| |#2|)) |#2|
                                  (|Symbol|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 163
                                            '(2 14 0 12 13 15 1 18 17 0 19 1 21
                                              20 7 22 1 20 0 0 23 1 20 24 0 25
                                              1 18 13 0 26 3 18 0 14 17 13 27 2
                                              14 28 0 12 29 1 7 30 0 31 2 30 28
                                              32 0 33 2 34 7 7 12 35 1 36 7 7
                                              37 1 38 28 0 39 2 7 0 0 12 40 2
                                              41 17 38 12 42 2 7 0 43 0 44 0 6
                                              0 45 0 7 0 46 1 7 0 0 47 2 7 0 0
                                              0 48 2 7 0 0 0 49 2 7 0 0 0 50 1
                                              7 0 0 51 1 7 0 24 52 1 18 14 0 53
                                              2 13 28 0 0 54 1 55 7 7 56 0 7 0
                                              57 2 7 28 0 0 58 1 14 12 0 59 1 7
                                              60 0 61 0 6 0 62 1 6 0 63 64 1 7
                                              0 6 65 2 7 0 14 66 67 1 7 24 0 68
                                              2 69 28 18 0 70 1 7 71 0 72 2 14
                                              28 0 12 73 1 7 74 24 75 3 77 76 7
                                              18 76 78 2 76 7 0 7 79 3 7 0 0 80
                                              66 81 2 18 28 0 12 82 1 7 80 0 83
                                              2 69 18 0 63 84 1 7 80 0 85 4 7 0
                                              0 12 13 86 87 2 88 7 7 12 89 1 36
                                              7 7 90 2 34 7 7 12 91 2 92 0 6 6
                                              93 2 94 28 0 12 95 2 92 0 43 0 96
                                              2 20 0 92 0 97 1 20 0 0 98 1 20 0
                                              24 99 0 20 0 100 2 20 0 0 0 101 2
                                              20 0 0 0 102 2 20 0 0 0 103 1 20
                                              71 0 104 1 20 80 0 105 2 106 94 0
                                              63 107 2 20 28 0 0 108 1 21 7 20
                                              109 3 20 0 0 80 66 110 3 7 0 0 80
                                              66 111 2 112 38 7 12 113 1 41 7
                                              38 114 1 115 28 7 116 2 117 7 7
                                              12 118 1 7 0 12 119 2 7 0 0 0 120
                                              2 69 0 121 0 122 2 69 28 121 0
                                              123 2 55 7 7 12 124 1 7 0 0 125 2
                                              7 28 0 0 126 2 7 0 0 0 127 2 55
                                              128 7 12 129 2 17 7 0 63 130 1 7
                                              63 0 131 2 133 132 7 13 134 1 7
                                              135 0 136 1 138 137 0 139 1 7 0
                                              63 140 1 7 141 0 142 2 141 28 12
                                              0 143 1 20 80 0 144 2 21 20 20
                                              106 145 3 20 0 0 80 66 146 2 148
                                              147 20 12 149 2 151 38 150 147
                                              152 1 7 0 0 153 2 154 38 38 18
                                              155 2 156 38 7 12 157 2 159 38
                                              158 38 160 2 69 0 0 0 161 2 0 162
                                              7 12 163)))))
           '|lookupComplete|)) 
