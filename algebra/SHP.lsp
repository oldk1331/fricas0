
(SDEFUN |SHP;delta| ((|int1| (|NonNegativeInteger|)) (% (R)))
        (SPROG ((#1=#:G17 NIL))
               (SPADCALL (SPADCALL (|spadConstant| % 8) (QREFELT % 10))
                         (PROG2
                             (LETT #1# (|exquo_INT| (* |int1| (+ |int1| 1)) 2))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT % 12)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| (UP)) (|p| (|NonNegativeInteger|)) (|p2| (UP))
         (|q| (|NonNegativeInteger|)) (|c1| (R)) (% (|List| UP)))
        (SPROG
         ((|sc1| (R)) (|Pr1| (UP)) (#1=#:G24 NIL) (|Pr2| (UP)) (|c2| (R))
          (|r| (|NonNegativeInteger|)) (#2=#:G39 NIL) (|Pr3| (UP))
          (#3=#:G53 NIL) (|Pr4| (UP)) (#4=#:G100 NIL) (#5=#:G102 NIL)
          (|Pr5| (UP)) (#6=#:G103 NIL) (|Listf| (|List| UP))
          (|List1| (|List| UP)) (|j| NIL) (#7=#:G118 NIL) (#8=#:G113 NIL)
          (|Pr6| (UP)) (|List2| (|List| UP)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT % 14)) (QREFELT % 15)))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT % 16)) |p2| (QREFELT % 17))
                 |p1| (QREFELT % 18)))
          (LETT |Pr2|
                (PROG2
                    (LETT #1#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT % 12))
                                    (QREFELT % 20)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                  (|Union| (QREFELT % 7) "failed") #1#)))
          (LETT |c2| (SPADCALL |Pr2| (QREFELT % 21)))
          (LETT |r| (SPADCALL |Pr2| (QREFELT % 22)))
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #2# (- (- |p| |r|) 1))
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT % 12))
                  0 (QREFELT % 24))
                 |p1| (QREFELT % 17)))
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #3# (- (- |p| |r|) 1))
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#))
                            (QREFELT % 12))
                  0 (QREFELT % 24))
                 |Pr2| (QREFELT % 17)))
          (LETT |Listf| (LIST |Pr3| |Pr4|))
          (COND
           ((< |r| (- |p| 1))
            (SEQ
             (LETT |Pr5|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SHP;delta|
                       (PROG1 (LETT #4# (- (- |p| |r|) 1))
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       %)
                      (SPADCALL |c2|
                                (PROG1 (LETT #5# (- (- |p| |r|) 1))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (QREFELT % 12))
                      (QREFELT % 25))
                     0 (QREFELT % 24))
                    |Pr2| (QREFELT % 17)))
             (LETT |Listf|
                   (SPADCALL |Listf|
                             (SPADCALL
                              (PROG1 (LETT #6# (- (- |p| |r|) 2))
                                (|check_subtype2| (>= #6# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #6#))
                              (|spadConstant| % 26) (QREFELT % 28))
                             (QREFELT % 29)))
             (EXIT
              (LETT |Listf| (SPADCALL |Listf| (LIST |Pr5|) (QREFELT % 29)))))))
          (LETT |List1|
                (COND
                 ((SPADCALL |Pr1| (|spadConstant| % 26) (QREFELT % 31))
                  |Listf|)
                 ('T
                  (SPADCALL (SPADCALL |p1| |Pr2| (QREFELT % 34))
                            (QREFELT % 35)))))
          (LETT |List2| NIL)
          (SEQ (LETT |j| 0) (LETT #7# (- |r| 1)) G190
               (COND ((|greater_SI| |j| #7#) (GO G191)))
               (SEQ
                (LETT |Pr6|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #8# (- (- |p| |j|) 1))
                           (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #8#))
                         %)
                        0 (QREFELT % 24))
                       (SPADCALL |List1| (+ |j| 1) (QREFELT % 36))
                       (QREFELT % 17)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr6|) |List2| (QREFELT % 29)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT % 29)))))) 

(SDEFUN |SHP;polsth2|
        ((|p1| (UP)) (|p| (|NonNegativeInteger|)) (|p2| (UP))
         (|q| (|NonNegativeInteger|)) (|c1| (R)) (% (|List| UP)))
        (SPROG
         ((|sc1| (R)) (|Pr1| (UP)) (|Pr2| (UP)) (|Pr3| (UP))
          (|Listf| (|List| UP)) (|sres| (|PrimitiveArray| UP)) (|j| NIL)
          (#1=#:G134 NIL) (#2=#:G126 NIL) (|Pr4| (UP)) (#3=#:G128 NIL)
          (|Pr5| (UP)) (|List2| (|List| UP)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT % 14)) (QREFELT % 15)))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT % 24)) |p1|
                          (QREFELT % 17)))
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT % 16)) |p2| (QREFELT % 17)))
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT % 24)) |Pr2|
                          (QREFELT % 17)))
          (LETT |Listf| (LIST |Pr1| |Pr3|))
          (LETT |sres| (SPADCALL |p1| |Pr2| (QREFELT % 34))) (LETT |List2| NIL)
          (SEQ (LETT |j| 0) (LETT #1# (- |p| 2)) G190
               (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |Pr4|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #2# (- (- |p| |j|) 1))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         %)
                        0 (QREFELT % 24))
                       (QAREF1 |sres| |j|) (QREFELT % 17)))
                (LETT |Pr5|
                      (PROG2 (LETT #3# (SPADCALL |Pr4| |c1| (QREFELT % 20)))
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                        (|Union| (QREFELT % 7) "failed") #3#)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr5|) |List2| (QREFELT % 29)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT % 29)))))) 

(SDEFUN |SHP;polsth3|
        ((|p1| (UP)) (|p| (|NonNegativeInteger|)) (|p2| (UP))
         (|q| (|NonNegativeInteger|)) (|c1| (R)) (% (|List| UP)))
        (SPROG
         ((|sc1| (R)) (#1=#:G135 NIL) (|q1| (|NonNegativeInteger|))
          (|v| (|NonNegativeInteger|)) (|Pr1| (UP)) (|Listf| (|List| UP))
          (|sres| (|PrimitiveArray| UP)) (|j| NIL) (#2=#:G138 NIL)
          (#3=#:G153 NIL) (#4=#:G145 NIL) (|Pr2| (UP)) (#5=#:G147 NIL)
          (|Pr3| (UP)) (|List2| (|List| UP)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT % 14)) (QREFELT % 15)))
          (LETT |q1|
                (PROG1 (LETT #1# (- |q| 1))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |v| (+ |p| |q1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|SHP;delta| |q1| %)
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT % 12))
                            (QREFELT % 25))
                  0 (QREFELT % 24))
                 |p1| (QREFELT % 17)))
          (LETT |Listf| (LIST |Pr1|))
          (LETT |sres|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT % 16)) |p2| (QREFELT % 17))
                 |p1| (QREFELT % 34)))
          (LETT |List2| NIL)
          (SEQ (LETT |j| 0)
               (LETT #3#
                     (PROG1 (LETT #2# (- |p| 1))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#)))
               G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (LETT |Pr2|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #4# (- |v| |j|))
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         %)
                        0 (QREFELT % 24))
                       (QAREF1 |sres| |j|) (QREFELT % 17)))
                (LETT |Pr3|
                      (PROG2 (LETT #5# (SPADCALL |Pr2| |c1| (QREFELT % 20)))
                          (QCDR #5#)
                        (|check_union2| (QEQCAR #5# 0) (QREFELT % 7)
                                        (|Union| (QREFELT % 7) "failed") #5#)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr3|) |List2| (QREFELT % 29)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT % 29)))))) 

(SDEFUN |SHP;SturmHabichtSequence;2UPL;5|
        ((|p1| (UP)) (|p2| (UP)) (% (|List| UP)))
        (SPROG ((|p| #1=(|NonNegativeInteger|)) (|q| #1#) (|c1| (R)))
               (SEQ (LETT |p| (SPADCALL |p1| (QREFELT % 22)))
                    (LETT |q| (SPADCALL |p2| (QREFELT % 22)))
                    (LETT |c1| (SPADCALL |p1| (QREFELT % 21)))
                    (COND
                     ((OR (SPADCALL |c1| (|spadConstant| % 8) (QREFELT % 37))
                          (EQL |q| 1))
                      (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| %))))
                    (EXIT
                     (COND
                      ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| %))
                      ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| %))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UPL;6|
        ((|p1| (UP)) (|p2| (UP)) (% (|List| R)))
        (SPROG
         ((|List1| (|List| UP)) (|qp| (|NonNegativeInteger|)) (#1=#:G161 NIL)
          (|j| NIL) (#2=#:G163 NIL) (|p| NIL) (#3=#:G162 NIL) (#4=#:G157 NIL))
         (SEQ (LETT |List1| (SPADCALL |p1| |p2| (QREFELT % 38)))
              (LETT |qp| (LENGTH |List1|))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |j| 1) (LETT #2# |qp|) (LETT |p| NIL)
                     (LETT #3# |List1|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL)
                           (|greater_SI| |j| #2#))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #1#
                             (CONS
                              (SPADCALL |p|
                                        (PROG1 (LETT #4# (- |qp| |j|))
                                          (|check_subtype2| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                        (QREFELT % 39))
                              #1#))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT |j| (|inc_SI| |j|))))
                     (GO G190) G191 (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| (|List| R)) (% (|Integer|)))
        (SPROG ((|elt1| (R)) (|elt2| (R)) (|sig1| (R)) (|List1| (|List| R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT % 42)) 0)
                      (#1='T
                       (SEQ (LETT |elt1| (|SPADfirst| |Lsig|))
                            (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT % 43)))
                            (LETT |sig1|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |elt1| |elt2| (QREFELT % 25))
                                    (QREFELT % 14))
                                   (QREFELT % 15)))
                            (LETT |List1| (CDR |Lsig|))
                            (EXIT
                             (COND
                              ((SPADCALL |sig1| (|spadConstant| % 8)
                                         (QREFELT % 37))
                               (|SHP;variation| |List1| %))
                              (#1# (+ 1 (|SHP;variation| |List1| %))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| (|List| R)) (% (|Integer|)))
        (SPROG ((|elt1| (R)) (|elt2| (R)) (|sig1| (R)) (|List1| (|List| R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT % 42)) 0)
                      (#1='T
                       (SEQ (LETT |elt1| (|SPADfirst| |Lsig|))
                            (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT % 43)))
                            (LETT |sig1|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |elt1| |elt2| (QREFELT % 25))
                                    (QREFELT % 14))
                                   (QREFELT % 15)))
                            (LETT |List1| (CDR |Lsig|))
                            (EXIT
                             (COND
                              ((SPADCALL |sig1|
                                         (SPADCALL (|spadConstant| % 8)
                                                   (QREFELT % 10))
                                         (QREFELT % 37))
                               (|SHP;permanence| |List1| %))
                              (#1# (+ 1 (|SHP;permanence| |List1| %))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| (|List| R)) (% (|List| R)))
        (SEQ (LETT |Lsig| (REVERSE |Lsig|))
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| % 23)
                               (QREFELT % 37)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |Lsig| (CDR |Lsig|)))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT (NREVERSE |Lsig|)))) 

(SDEFUN |SHP;epsil|
        ((|int1| (|NonNegativeInteger|)) (|elt1| (R)) (|elt2| (R))
         (% (|Integer|)))
        (SPROG
         ((|ct1| #1=(|Integer|)) (|ct2| #1#) (#2=#:G175 NIL)
          (|ct3| (|NonNegativeInteger|)) (|ct4| (|Integer|)))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| % 23)
                                    (QREFELT % 44))
                          1)
                         (#3='T -1)))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| % 23)
                                    (QREFELT % 44))
                          1)
                         (#3# -1)))
                  (LETT |ct3|
                        (PROG2 (LETT #2# (|exquo_INT| |int1| 2))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #2#)))
                  (LETT |ct4| (* |ct1| |ct2|))
                  (EXIT (* (EXPT -1 |ct3|) |ct4|)))))))) 

(SDEFUN |SHP;numbnce| ((|Lsig| (|List| R)) (% (|NonNegativeInteger|)))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| % 23)
                        (QREFELT % 37)))
          0)
         ('T (+ 1 (|SHP;numbnce| (CDR |Lsig|) %))))) 

(SDEFUN |SHP;numbce| ((|Lsig| (|List| R)) (% (|NonNegativeInteger|)))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| % 23)
                        (QREFELT % 45)))
          0)
         ('T (+ 1 (|SHP;numbce| (CDR |Lsig|) %))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| #1=(|List| R)) (% (|Integer|)))
        (SPROG
         ((|cont1| (|NonNegativeInteger|)) (#2=#:G194 NIL) (|List2| (|List| R))
          (|cont2| (|NonNegativeInteger|)) (|j| NIL) (#3=#:G195 NIL)
          (|List1| #1#) (|ind2| (|Integer|)) (|ind3| (|Integer|))
          (|ind4| (|Integer|)))
         (SEQ
          (COND ((NULL |Lsig|) 0)
                ('T
                 (SEQ (LETT |List2| NIL) (LETT |List1| |Lsig|)
                      (LETT |cont1| (|SHP;numbnce| |List1| %))
                      (SEQ (LETT |j| 1) (LETT #2# |cont1|) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (LETT |List2|
                                  (SPADCALL |List2|
                                            (LIST (|SPADfirst| |List1|))
                                            (QREFELT % 46)))
                            (EXIT (LETT |List1| (CDR |List1|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (LETT |ind2| 0) (LETT |cont2| (|SHP;numbce| |List1| %))
                      (SEQ (LETT |j| 1) (LETT #3# |cont2|) G190
                           (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ (EXIT (LETT |List1| (CDR |List1|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((> |cont2| 0)
                        (LETT |ind2|
                              (|SHP;epsil| |cont2|
                               (SPADCALL |List2| (QREFELT % 47))
                               (|SPADfirst| |List1|) %))))
                      (LETT |ind3|
                            (- (|SHP;permanence| |List2| %)
                               (|SHP;variation| |List2| %)))
                      (LETT |ind4| (+ |ind2| |ind3|))
                      (EXIT (+ |ind4| (|SHP;wfunctaux| |List1| %))))))))) 

(SDEFUN |SHP;wfunct| ((|Lsig| (|List| R)) (% (|Integer|)))
        (SPROG ((|List1| (|List| R)))
               (SEQ (LETT |List1| (|SHP;qzeros| |Lsig| %))
                    (EXIT (|SHP;wfunctaux| |List1| %))))) 

(SDEFUN |SHP;SturmHabicht;2UPI;15| ((|p1| (UP)) (|p2| (UP)) (% (|Integer|)))
        (SPROG
         ((|List1| (|List| UP)) (#1=#:G203 NIL) (|p| NIL) (#2=#:G204 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| % 26) (QREFELT % 31))
                (EQL (SPADCALL |p1| (QREFELT % 22)) 0))
            0)
           ('T
            (SEQ (LETT |List1| (SPADCALL |p1| |p2| (QREFELT % 38)))
                 (EXIT
                  (|SHP;wfunct|
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |p| NIL) (LETT #2# |List1|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS (SPADCALL |p| (QREFELT % 21)) #1#))))
                         (LETT #2# (CDR #2#)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))
                   %)))))))) 

(SDEFUN |SHP;countRealRoots;UPI;16| ((|p1| (UP)) (% (|Integer|)))
        (SPADCALL |p1| (|spadConstant| % 9) (QREFELT % 48))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UPI;17|
        ((|p1| (UP)) (|p2| (UP)) (% (|Integer|)))
        (SPROG
         ((|qp| (|NonNegativeInteger|)) (#1=#:G237 NIL) (|j| NIL)
          (#2=#:G239 NIL) (|p| NIL) (#3=#:G238 NIL) (#4=#:G207 NIL)
          (|ans| (|Integer|)) (SH (|List| UP))
          (|sqfr|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G240 NIL) (|f| NIL) (#6=#:G241 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| % 26) (QREFELT % 31))
                (EQL (SPADCALL |p1| (QREFELT % 22)) 0))
            0)
           ('T
            (SEQ (LETT SH (SPADCALL |p1| |p2| (QREFELT % 38)))
                 (LETT |qp| (LENGTH SH))
                 (LETT |ans|
                       (|SHP;wfunct|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |j| 1) (LETT #2# |qp|) (LETT |p| NIL)
                              (LETT #3# SH) G190
                              (COND
                               ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL)
                                    (|greater_SI| |j| #2#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (SPADCALL |p|
                                                 (PROG1 (LETT #4# (- |qp| |j|))
                                                   (|check_subtype2| (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#))
                                                 (QREFELT % 39))
                                       #1#))))
                              (LETT #3#
                                    (PROG1 (CDR #3#)
                                      (LETT |j| (|inc_SI| |j|))))
                              (GO G190) G191 (EXIT (NREVERSE #1#))))
                        %))
                 (LETT SH (REVERSE SH))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (|SPADfirst| SH) (|spadConstant| % 26)
                                   (QREFELT % 31)))
                        (GO G191)))
                      (SEQ (EXIT (LETT SH (CDR SH)))) NIL (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT % 22)) 0) |ans|)
                   ((QEQCAR
                     (SPADCALL (SPADCALL |p1| (QREFELT % 16)) (|SPADfirst| SH)
                               (QREFELT % 50))
                     0)
                    (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT % 51))))
                   ('T
                    (SEQ
                     (LETT |sqfr|
                           (SPADCALL (SPADCALL |p1| (QREFELT % 53))
                                     (QREFELT % 58)))
                     (COND
                      ((EQL (LENGTH |sqfr|) 1)
                       (COND
                        ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                         (EXIT |ans|)))))
                     (EXIT
                      (SPADCALL (ELT % 59)
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #6# |sqfr|) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN (LETT |f| (CAR #6#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (* (QVELT |f| 2)
                                                  (SPADCALL (QVELT |f| 1) |p2|
                                                            (QREFELT % 48)))
                                               #5#))))
                                      (LETT #6# (CDR #6#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#))))
                                (QREFELT % 62))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UPI;18| ((|p1| (UP)) (% (|Integer|)))
        (SPADCALL |p1| (|spadConstant| % 9) (QREFELT % 51))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SturmHabichtPackage| DV$1 DV$2))
          (LETT % (GETREFV 64))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))))
          (|haddProp| |$ConstructorCache| '|SturmHabichtPackage|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 51
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UPI;17|)
                        %))
             (QSETREFV % 63
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UPI;18|)
                        %)))))
          %))) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G243)
  (SPROG NIL
         (PROG (#2=#:G244)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SturmHabichtPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SturmHabichtPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SturmHabichtPackage|)))))))))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |1|)
              (4 . |1|) (8 . -) (|NonNegativeInteger|) (13 . ^) (|Integer|)
              (19 . |sign|) (24 . |coerce|) (29 . |differentiate|) (34 . *)
              (40 . |pseudoRemainder|) (|Union| % '"failed") (46 . |exquo|)
              (52 . |leadingCoefficient|) (57 . |degree|) (62 . |0|)
              (66 . |monomial|) (72 . *) (78 . |0|) (|List| 7) (82 . |new|)
              (88 . |append|) (|Boolean|) (94 . =) (|PrimitiveArray| 7)
              (|SubResultantPackage| 6 7) (100 . |subresultantVector|)
              (106 . |parts|) (111 . |elt|) (117 . =)
              |SHP;SturmHabichtSequence;2UPL;5| (123 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UPL;6| (129 . |size?|)
              (135 . |elt|) (141 . >) (147 . ~=) (153 . |append|)
              (159 . |last|) |SHP;SturmHabicht;2UPI;15|
              |SHP;countRealRoots;UPI;16| (164 . |exquo|)
              (170 . |SturmHabichtMultiple|) (|Factored| %)
              (176 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 54) (|:| |factor| 7) (|:| |exponent| 11))
              (|List| 55) (|Factored| 7) (181 . |factorList|) (186 . +)
              (|Mapping| 13 13 13) (|List| 13) (192 . |reduce|)
              (198 . |countRealRootsMultiple|))
           '#(|countRealRootsMultiple| 203 |countRealRoots| 208
              |SturmHabichtSequence| 213 |SturmHabichtMultiple| 219
              |SturmHabichtCoefficients| 225 |SturmHabicht| 231)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|SturmHabichtSequence|
                                 ((|List| |#2|) |#2| |#2|))
                                T)
                              '((|SturmHabichtCoefficients|
                                 ((|List| |#1|) |#2| |#2|))
                                T)
                              '((|SturmHabicht| ((|Integer|) |#2| |#2|)) T)
                              '((|countRealRoots| ((|Integer|) |#2|)) T)
                              '((|SturmHabichtMultiple|
                                 ((|Integer|) |#2| |#2|))
                                (|has| 6 (|GcdDomain|)))
                              '((|countRealRootsMultiple| ((|Integer|) |#2|))
                                (|has| 6 (|GcdDomain|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 63
                                            '(0 6 0 8 0 7 0 9 1 6 0 0 10 2 6 0
                                              0 11 12 1 6 13 0 14 1 6 0 13 15 1
                                              7 0 0 16 2 7 0 0 0 17 2 7 0 0 0
                                              18 2 7 19 0 6 20 1 7 6 0 21 1 7
                                              11 0 22 0 6 0 23 2 7 0 6 11 24 2
                                              6 0 0 0 25 0 7 0 26 2 27 0 11 7
                                              28 2 27 0 0 0 29 2 7 30 0 0 31 2
                                              33 32 7 7 34 1 32 27 0 35 2 27 7
                                              0 13 36 2 6 30 0 0 37 2 7 6 0 11
                                              39 2 40 30 0 11 42 2 40 6 0 13 43
                                              2 6 30 0 0 44 2 6 30 0 0 45 2 40
                                              0 0 0 46 1 40 6 0 47 2 7 19 0 0
                                              50 2 0 13 7 7 51 1 7 52 0 53 1 57
                                              56 0 58 2 13 0 0 0 59 2 61 13 60
                                              0 62 1 0 13 7 63 1 1 13 7 63 1 0
                                              13 7 49 2 0 27 7 7 38 2 1 13 7 7
                                              51 2 0 40 7 7 41 2 0 13 7 7
                                              48)))))
           '|lookupComplete|)) 
