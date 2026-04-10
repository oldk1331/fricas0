
(SDEFUN |PADECF;pade_stream1|
        ((|st0| (|Stream| F)) (|st1| (|Stream| F))
         (|x| (|UnivariatePolynomial| |xs| F))
         (% (|Stream| (|UnivariatePolynomial| |xs| F))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|PADECF;pade_stream1!0| (VECTOR |x| |st0| |st1| %))
                 (QREFELT % 36))))) 

(SDEFUN |PADECF;pade_stream1!0| (($$ NIL))
        (PROG (% |st1| |st0| |x|)
          (LETT % (QREFELT $$ 3))
          (LETT |st1| (QREFELT $$ 2))
          (LETT |st0| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|a1| NIL) (|nn| NIL) (|st2| NIL) (#1=#:G26 NIL) (|st3| NIL)
              (|st4| NIL) (#2=#:G27 NIL))
             (SEQ
              (EXIT
               (SEQ (LETT |nn| (|spadConstant| % 28))
                    (LETT |st2| (SPADCALL |st1| |st0| (QREFELT % 12)))
                    (EXIT
                     (COND
                      ((SPADCALL |st2| (QREFELT % 14)) (|error| "impossible"))
                      ('T
                       (SEQ (LETT |st2| (SPADCALL |st2| (QREFELT % 15)))
                            (EXIT
                             (SEQ G190 NIL
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |st2| (QREFELT % 14))
                                      (SPADCALL (QREFELT % 17)))
                                     ('T
                                      (SEQ
                                       (LETT |a1|
                                             (SPADCALL |st2| (QREFELT % 18)))
                                       (COND
                                        ((SPADCALL |a1| (|spadConstant| % 19)
                                                   (QREFELT % 22))
                                         (SEQ
                                          (LETT |nn|
                                                (SPADCALL |nn|
                                                          (|spadConstant| % 28)
                                                          (QREFELT % 25)))
                                          (LETT |st2|
                                                (SPADCALL |st2|
                                                          (QREFELT % 15)))
                                          (EXIT
                                           (PROGN
                                            (LETT #1# |$NoValue|)
                                            (GO #3=#:G18))))))
                                       (LETT |st3|
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 23)
                                                        |a1| (QREFELT % 26))
                                              |st2| (QREFELT % 31)))
                                       (LETT |st4|
                                             (|PADECF;pade_stream1| |st1| |st3|
                                              |x| %))
                                       (EXIT
                                        (PROGN
                                         (LETT #2#
                                               (SPADCALL
                                                (SPADCALL |a1|
                                                          (SPADCALL |x| |nn|
                                                                    (QREFELT %
                                                                             32))
                                                          (QREFELT % 33))
                                                |st4| (QREFELT % 34)))
                                         (GO #4=#:G25)))))))
                                   #3# (EXIT #1#))
                                  NIL (GO G190) G191 (EXIT NIL)))))))))
              #4# (EXIT #2#))))))) 

(SDEFUN |PADECF;pade_stream0|
        ((|st0| (|Stream| F)) (|st| (|Stream| F))
         (|x| (|UnivariatePolynomial| |xs| F))
         (% (|Stream| (|UnivariatePolynomial| |xs| F))))
        (SPROG
         ((#1=#:G33 NIL) (|st2| (|Stream| (|UnivariatePolynomial| |xs| F)))
          (|st1| (|Stream| F)) (|b0| (F)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |st| (QREFELT % 14))
             (|error| "pade_stream: First term is 0"))
            (#2='T
             (SEQ (LETT |b0| (SPADCALL |st| (QREFELT % 18)))
                  (EXIT
                   (COND
                    ((SPADCALL |b0| (|spadConstant| % 19) (QREFELT % 22))
                     (|error| "pade_stream: First term is 0"))
                    (#2#
                     (SEQ
                      (LETT |st1|
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 23) |b0|
                                       (QREFELT % 26))
                             |st| (QREFELT % 31)))
                      (LETT |st2|
                            (SPADCALL (|PADECF;pade_stream1| |st0| |st1| |x| %)
                                      (QREFELT % 38)))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (SPADCALL (SPADCALL |b0| (QREFELT % 39)) |st2|
                                        (QREFELT % 34)))
                        (GO #3=#:G32)))))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |PADECF;pade_stream;SUpS;3|
        ((|st| (|Stream| F)) (|x| (|UnivariatePolynomial| |xs| F))
         (% (|Stream| (|UnivariatePolynomial| |xs| F))))
        (SPROG ((|st0| (|Stream| F)))
               (SEQ
                (LETT |st0|
                      (SPADCALL (LIST (|spadConstant| % 23)) (QREFELT % 41)))
                (EXIT (|PADECF;pade_stream0| |st0| |st| |x| %))))) 

(SDEFUN |PADECF;pade_stream2;2SUpS;4|
        ((|stn| (|Stream| F)) (|std| (|Stream| F))
         (|x| (|UnivariatePolynomial| |xs| F))
         (% (|Stream| (|UnivariatePolynomial| |xs| F))))
        (SPROG ((|b0| (F)))
               (SEQ
                (COND
                 ((SPADCALL |std| (QREFELT % 14))
                  (|error| "pade_stream2: division by zero"))
                 (#1='T
                  (SEQ (LETT |b0| (SPADCALL |std| (QREFELT % 18)))
                       (EXIT
                        (COND
                         ((SPADCALL |b0| (|spadConstant| % 19) (QREFELT % 22))
                          (|error| "pade_stream2: division by zero"))
                         (#1#
                          (|PADECF;pade_stream0|
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 23) |b0|
                                      (QREFELT % 26))
                            |std| (QREFELT % 31))
                           (SPADCALL |b0| |stn| (QREFELT % 31)) |x| %)))))))))) 

(SDEFUN |PADECF;pade_cf;SUpCf;5|
        ((|st| (|Stream| F)) (|x| (|UnivariatePolynomial| |xs| F))
         (% (|ContinuedFraction| (|UnivariatePolynomial| |xs| F))))
        (SPROG ((|st1| (|Stream| (|UnivariatePolynomial| |xs| F))))
               (SEQ (LETT |st1| (SPADCALL |st| |x| (QREFELT % 42)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 21) |st1|
                               (SPADCALL (LIST (|spadConstant| % 24))
                                         (QREFELT % 45))
                               (QREFELT % 47)))))) 

(SDEFUN |PADECF;pade_cf2;2SUpCf;6|
        ((|stn| (|Stream| F)) (|std| (|Stream| F))
         (|x| (|UnivariatePolynomial| |xs| F))
         (% (|ContinuedFraction| (|UnivariatePolynomial| |xs| F))))
        (SPROG ((|st1| (|Stream| (|UnivariatePolynomial| |xs| F))))
               (SEQ (LETT |st1| (SPADCALL |stn| |std| |x| (QREFELT % 43)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 21) |st1|
                               (SPADCALL (LIST (|spadConstant| % 24))
                                         (QREFELT % 45))
                               (QREFELT % 47)))))) 

(DECLAIM (NOTINLINE |PadeContinuousFraction;|)) 

(DEFUN |PadeContinuousFraction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|PadeContinuousFraction| DV$1 DV$2))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PadeContinuousFraction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |PadeContinuousFraction| (&REST #1=#:G43)
  (SPROG NIL
         (PROG (#2=#:G44)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|PadeContinuousFraction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PadeContinuousFraction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PadeContinuousFraction|)))))))))) 

(MAKEPROP '|PadeContinuousFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |One|) (|Stream| 6)
              (|StreamTaylorSeriesOperations| 6) (4 . -) (|Boolean|)
              (10 . |empty?|) (15 . |rst|) (|Stream| 20) (20 . |empty|)
              (24 . |frst|) (29 . |Zero|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT % 7)) 6) (33 . |Zero|)
              (37 . =) (43 . |One|) (47 . |One|) (51 . +) (57 . /)
              (|PositiveInteger|) (63 . |One|) (|Fraction| (|Integer|))
              (67 . |One|) (71 . *) (77 . ^) (83 . *) (89 . |concat|)
              (|Mapping| %) (95 . |delay|) (|StreamTaylorSeriesOperations| 20)
              (100 . -) (105 . |coerce|) (|List| 6) (110 . |construct|)
              |PADECF;pade_stream;SUpS;3| |PADECF;pade_stream2;2SUpS;4|
              (|List| 20) (115 . |repeating|) (|ContinuedFraction| 20)
              (120 . |continuedFraction|) |PADECF;pade_cf;SUpCf;5|
              |PADECF;pade_cf2;2SUpCf;6|)
           '#(|pade_stream2| 127 |pade_stream| 134 |pade_cf2| 140 |pade_cf|
              147)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|pade_stream|
                                 ((|Stream| (|UnivariatePolynomial| |#2| |#1|))
                                  (|Stream| |#1|)
                                  (|UnivariatePolynomial| |#2| |#1|)))
                                T)
                              '((|pade_stream2|
                                 ((|Stream| (|UnivariatePolynomial| |#2| |#1|))
                                  (|Stream| |#1|) (|Stream| |#1|)
                                  (|UnivariatePolynomial| |#2| |#1|)))
                                T)
                              '((|pade_cf|
                                 ((|ContinuedFraction|
                                   (|UnivariatePolynomial| |#2| |#1|))
                                  (|Stream| |#1|)
                                  (|UnivariatePolynomial| |#2| |#1|)))
                                T)
                              '((|pade_cf2|
                                 ((|ContinuedFraction|
                                   (|UnivariatePolynomial| |#2| |#1|))
                                  (|Stream| |#1|) (|Stream| |#1|)
                                  (|UnivariatePolynomial| |#2| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 49
                                            '(0 8 0 9 2 11 10 10 10 12 1 10 13
                                              0 14 1 10 0 0 15 0 16 0 17 1 10 6
                                              0 18 0 6 0 19 0 20 0 21 2 6 13 0
                                              0 22 0 6 0 23 0 20 0 24 2 8 0 0 0
                                              25 2 6 0 0 0 26 0 27 0 28 0 29 0
                                              30 2 11 10 6 10 31 2 20 0 0 8 32
                                              2 20 0 6 0 33 2 16 0 20 0 34 1 16
                                              0 35 36 1 37 16 16 38 1 20 0 6 39
                                              1 10 0 40 41 1 16 0 44 45 3 46 0
                                              20 16 16 47 3 0 16 10 10 20 43 2
                                              0 16 10 20 42 3 0 46 10 10 20 49
                                              2 0 46 10 20 48)))))
           '|lookupComplete|)) 
