
(SDEFUN |ANTISYM;1;%;1| ((% (%)))
        (LIST
         (CONS (SPADCALL (QREFELT % 9) (QREFELT % 12)) (|spadConstant| % 13)))) 

(SDEFUN |ANTISYM;coefficient;2%R;2| ((|a| (%)) (|u| (%)) (% (R)))
        (SPROG ((|x| (|ExtAlgBasis|)) (|t| NIL) (#1=#:G38 NIL) (#2=#:G37 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (NULL (CDR |u|)))
                   (|error| "2nd argument must be a basis element"))
                  ('T
                   (SEQ (LETT |x| (QCAR (|SPADfirst| |u|)))
                        (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((SPADCALL (QCAR |t|) |x| (QREFELT % 16))
                                (PROGN (LETT #2# (QCDR |t|)) (GO #3=#:G36))))
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |t|) |x| (QREFELT % 17))
                                 (PROGN
                                  (LETT #2# (|spadConstant| % 18))
                                  (GO #3#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (|spadConstant| % 18))))))
                #3# (EXIT #2#)))) 

(SDEFUN |ANTISYM;retractable?;%B;3| ((|a| (%)) (% (|Boolean|)))
        (COND ((NULL |a|) 'T)
              ('T
               (SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT % 9) (QREFELT % 12))
                         (QREFELT % 16))))) 

(SDEFUN |ANTISYM;retractIfCan;%U;4| ((|a| (%)) (% (|Union| R "failed")))
        (COND ((NULL |a|) (CONS 0 (|spadConstant| % 18)))
              ((SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT % 9) (QREFELT % 12))
                         (QREFELT % 16))
               (CONS 0 (SPADCALL |a| (QREFELT % 21))))
              ('T (CONS 1 "failed")))) 

(SDEFUN |ANTISYM;retract;%R;5| ((|a| (%)) (% (R)))
        (COND ((NULL |a|) (|spadConstant| % 18))
              ('T (SPADCALL |a| (QREFELT % 21))))) 

(SDEFUN |ANTISYM;homogeneous?;%B;6| ((|a| (%)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G0 NIL) (#2=#:G99 NIL) (#3=#:G57 #4=(|Integer|)) (#5=#:G55 #4#)
          (#6=#:G56 NIL) (|siz| #4#) (|ta| NIL) (#7=#:G100 NIL) (#8=#:G1 NIL)
          (#9=#:G101 NIL) (#10=#:G91 #4#) (#11=#:G89 #4#) (#12=#:G90 NIL)
          (#13=#:G98 NIL) (#14=#:G97 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |a|) 'T)
                 (#15='T
                  (SEQ
                   (LETT |siz|
                         (PROGN
                          (LETT #6# NIL)
                          (SEQ (LETT #1# NIL)
                               (LETT #2#
                                     (SPADCALL (QCAR (|SPADfirst| |a|))
                                               (QREFELT % 26)))
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT #1# (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #3# #1#)
                                  (COND (#6# (LETT #5# (+ #5# #3#)))
                                        ('T
                                         (PROGN
                                          (LETT #5# #3#)
                                          (LETT #6# 'T)))))))
                               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                          (COND (#6# #5#) (#15# 0))))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ta| NIL)
                          (LETT #7# (SPADCALL |a| (QREFELT % 27))) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |ta| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (PROGN
                                (LETT #12# NIL)
                                (SEQ (LETT #8# NIL)
                                     (LETT #9#
                                           (SPADCALL (QCAR |ta|)
                                                     (QREFELT % 26)))
                                     G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT #8# (CAR #9#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #10# #8#)
                                        (COND (#12# (LETT #11# (+ #11# #10#)))
                                              ('T
                                               (PROGN
                                                (LETT #11# #10#)
                                                (LETT #12# 'T)))))))
                                     (LETT #9# (CDR #9#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#12# #11#) ('T 0)))
                               |siz| (QREFELT % 29))
                              (PROGN
                               (LETT #14#
                                     (PROGN (LETT #13# NIL) (GO #16=#:G96)))
                               (GO #17=#:G93))))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL)))
                    #17# (EXIT #14#))
                   (EXIT 'T)))))
          #16# (EXIT #13#)))) 

(SDEFUN |ANTISYM;degree;%Nni;7| ((|a| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G2 NIL) (#2=#:G113 NIL) (#3=#:G108 #4=(|Integer|))
          (#5=#:G106 #4#) (#6=#:G107 NIL) (#7=#:G109 NIL))
         (SEQ
          (COND ((NULL |a|) 0)
                ((SPADCALL |a| (QREFELT % 30))
                 (PROG1
                     (LETT #7#
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT #1# NIL)
                                 (LETT #2#
                                       (SPADCALL (QCAR (|SPADfirst| |a|))
                                                 (QREFELT % 26)))
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT #1# (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3# #1#)
                                    (COND (#6# (LETT #5# (+ #5# #3#)))
                                          ('T
                                           (PROGN
                                            (LETT #5# #3#)
                                            (LETT #6# 'T)))))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#6# #5#) (#8='T 0))))
                   (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #7#)))
                (#8# (|error| "not a homogeneous element")))))) 

(SDEFUN |ANTISYM;zo|
        ((|p| (|Integer|)) (|q| (|Integer|)) (% (|List| (|Integer|))))
        (COND ((EQL |p| 0) (LIST 1 |q|)) ((EQL |q| 0) (LIST 1 1))
              ('T (LIST 0 0)))) 

(SDEFUN |ANTISYM;getsgn|
        ((|x| (|ExtAlgBasis|)) (|y| (|ExtAlgBasis|)) (% (|Integer|)))
        (SPROG
         ((|yy| #1=(|List| (|Integer|))) (|i| NIL) (#2=#:G145 NIL) (|xx| #1#)
          (#3=#:G3 NIL) (#4=#:G146 NIL) (#5=#:G139 #6=(|Integer|))
          (#7=#:G137 #6#) (#8=#:G138 NIL) (|sgn| (|Integer|)))
         (SEQ (LETT |sgn| 0) (LETT |xx| (SPADCALL |x| (QREFELT % 26)))
              (LETT |yy| (SPADCALL |y| (QREFELT % 26)))
              (SEQ (LETT |i| 1) (LETT #2# (- (QREFELT % 9) 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |xx| (CDR |xx|))
                        (EXIT
                         (LETT |sgn|
                               (+ |sgn|
                                  (*
                                   (PROGN
                                    (LETT #8# NIL)
                                    (SEQ (LETT #3# NIL) (LETT #4# |xx|) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT #3# (CAR #4#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #5# #3#)
                                            (COND (#8# (LETT #7# (+ #7# #5#)))
                                                  ('T
                                                   (PROGN
                                                    (LETT #7# #5#)
                                                    (LETT #8# 'T)))))))
                                         (LETT #4# (CDR #4#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#8# #7#) ('T 0)))
                                   (SPADCALL |yy| |i| (QREFELT % 33)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((EQL (REM |sgn| 2) 0) 1) ('T -1)))))) 

(SDEFUN |ANTISYM;Nalpha|
        ((|x| (|ExtAlgBasis|)) (|y| (|ExtAlgBasis|)) (% (|List| (|Integer|))))
        (SPROG
         ((#1=#:G156 NIL) (#2=#:G157 NIL) (|dum2| (|List| (|Integer|)))
          (|j| NIL) (#3=#:G158 NIL) (|dum| (|List| (|Integer|)))
          (|i| (|Integer|)) (#4=#:G155 NIL))
         (SEQ (LETT |i| 1)
              (LETT |dum2|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 9)) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS 0 #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ
               (EXIT
                (SEQ (LETT |j| 1) (LETT #3# (QREFELT % 9)) G190
                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                     (SEQ
                      (LETT |dum|
                            (|ANTISYM;zo|
                             (SPADCALL (SPADCALL |x| (QREFELT % 26)) |j|
                                       (QREFELT % 33))
                             (SPADCALL (SPADCALL |y| (QREFELT % 26)) |j|
                                       (QREFELT % 33))
                             %))
                      (LETT |i| (* |i| (SPADCALL |dum| 1 (QREFELT % 33))))
                      (EXIT
                       (COND ((EQL |i| 0) (PROGN (LETT #4# 1) (GO #5=#:G152)))
                             ('T
                              (SPADCALL |dum2| |j|
                                        (SPADCALL |dum| 2 (QREFELT % 33))
                                        (QREFELT % 34))))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #4#))
              (EXIT
               (COND ((EQL |i| 0) (CONS |i| |dum2|))
                     ('T (CONS (|ANTISYM;getsgn| |x| |y| %) |dum2|))))))) 

(SDEFUN |ANTISYM;*;3%;11| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|tb| NIL) (#1=#:G173 NIL) (|ta| NIL) (#2=#:G174 NIL)
          (|stuff| (|List| (|Integer|))) (|r| (R)) (|z| (%)))
         (SEQ
          (COND ((OR (NULL |a|) (NULL |b|)) (|spadConstant| % 32))
                ('T
                 (SEQ
                  (COND
                   ((NULL (CDR |a|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |a|))
                                (SPADCALL (QREFELT % 9) (QREFELT % 12))
                                (QREFELT % 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |a|)) |b|
                                 (QREFELT % 35)))))))
                  (COND
                   ((NULL (CDR |b|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |b|))
                                (SPADCALL (QREFELT % 9) (QREFELT % 12))
                                (QREFELT % 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |b|)) |a|
                                 (QREFELT % 35)))))))
                  (LETT |z| (|spadConstant| % 32))
                  (SEQ (LETT |tb| NIL) (LETT #1# |b|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |tb| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |ta| NIL) (LETT #2# |a|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |ta| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |stuff|
                                     (|ANTISYM;Nalpha| (QCAR |ta|) (QCAR |tb|)
                                      %))
                               (LETT |r|
                                     (SPADCALL
                                      (SPADCALL (|SPADfirst| |stuff|)
                                                (QCDR |ta|) (QREFELT % 36))
                                      (QCDR |tb|) (QREFELT % 37)))
                               (EXIT
                                (COND
                                 ((SPADCALL |r| (|spadConstant| % 18)
                                            (QREFELT % 38))
                                  (LETT |z|
                                        (SPADCALL |z|
                                                  (LIST
                                                   (CONS
                                                    (SPADCALL (CDR |stuff|)
                                                              (QREFELT % 39))
                                                    |r|))
                                                  (QREFELT % 40)))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |z|))))))) 

(SDEFUN |ANTISYM;coerce;R%;12| ((|r| (R)) (% (%)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 18) (QREFELT % 42))
          (|spadConstant| % 32))
         ('T (LIST (CONS (SPADCALL (QREFELT % 9) (QREFELT % 12)) |r|))))) 

(SDEFUN |ANTISYM;coerce;I%;13| ((|m| (|Integer|)) (% (%)))
        (COND ((EQL |m| 0) (|spadConstant| % 32))
              ('T
               (LIST
                (CONS (SPADCALL (QREFELT % 9) (QREFELT % 12))
                      (SPADCALL |m| (QREFELT % 44))))))) 

(SDEFUN |ANTISYM;characteristic;Nni;14| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 46))) 

(SDEFUN |ANTISYM;generator;Nni%;15| ((|j| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G185 NIL) (|i| NIL) (#2=#:G186 NIL)
          (|dum| (|List| (|Integer|))))
         (SEQ
          (LETT |dum|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 9)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS 0 #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (SPADCALL |dum| |j| 1 (QREFELT % 34))
          (EXIT
           (LIST
            (CONS (SPADCALL |dum| (QREFELT % 39)) (|spadConstant| % 13))))))) 

(SDEFUN |ANTISYM;exp;L%;16| ((|li| (|List| (|Integer|))) (% (%)))
        (LIST (CONS (SPADCALL |li| (QREFELT % 39)) (|spadConstant| % 13)))) 

(SDEFUN |ANTISYM;leadingBasisTerm;2%;17| ((|a| (%)) (% (%)))
        (LIST (CONS (QCAR (|SPADfirst| |a|)) (|spadConstant| % 13)))) 

(SDEFUN |ANTISYM;displayList| ((|x| (|ExtAlgBasis|)) (% (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|Integer|))) (#1=#:G200 NIL) (|i| NIL)
          (#2=#:G201 NIL))
         (SEQ (LETT |le| (SPADCALL |x| (QREFELT % 26)))
              (EXIT
               (SPADCALL (ELT % 52)
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 9)) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL |le| |i| (QREFELT % 33)) 1)
                                   (LETT #1#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL (QREFELT % 7) |i|
                                                     (QREFELT % 55))
                                           (QREFELT % 56))
                                          #1#))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 59)))))) 

(SDEFUN |ANTISYM;makeTerm| ((|r| (R)) (|x| (|ExtAlgBasis|)) (% (|OutputForm|)))
        (COND
         ((SPADCALL |x| (SPADCALL (QREFELT % 9) (QREFELT % 12)) (QREFELT % 16))
          (SPADCALL |r| (QREFELT % 60)))
         ((SPADCALL |r| (|spadConstant| % 13) (QREFELT % 42))
          (|ANTISYM;displayList| |x| %))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT % 60)) (|ANTISYM;displayList| |x| %)
                    (QREFELT % 52))))) 

(SDEFUN |ANTISYM;coerce;%Of;20| ((|a| (%)) (% (|OutputForm|)))
        (SPROG
         ((|t| (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| R)))
          (#1=#:G213 NIL) (#2=#:G214 NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT % 61)) (SPADCALL 0 (QREFELT % 62)))
                ((NULL (CDR |a|))
                 (SEQ (LETT |t| (|SPADfirst| |a|))
                      (EXIT (|ANTISYM;makeTerm| (QCDR |t|) (QCAR |t|) %))))
                ('T
                 (SPADCALL (ELT % 63)
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #2# |a|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |t| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS
                                          (|ANTISYM;makeTerm| (QCDR |t|)
                                           (QCAR |t|) %)
                                          #1#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #1#))))
                           (QREFELT % 59))))))) 

(DECLAIM (NOTINLINE |AntiSymm;|)) 

(DEFUN |AntiSymm;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|AntiSymm| DV$1 DV$2))
          (LETT % (GETREFV 69))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|AntiSymm| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|List|
                     (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| |#1|))))
          (QSETREFV % 9 (LENGTH |#2|))
          %))) 

(DEFUN |AntiSymm| (&REST #1=#:G219)
  (SPROG NIL
         (PROG (#2=#:G220)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|AntiSymm|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AntiSymm;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|AntiSymm|)))))))))) 

(MAKEPROP '|AntiSymm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 11) (|local| |#1|)
              (|local| |#2|) '|Rep| '|dim| (|NonNegativeInteger|)
              (|ExtAlgBasis|) (0 . |Nul|) (5 . |1|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |ANTISYM;1;%;1|) %))
              (|Boolean|) (9 . =) (15 . <) (21 . |0|)
              |ANTISYM;coefficient;2%R;2| |ANTISYM;retractable?;%B;3|
              (25 . |leadingCoefficient|) (|Union| 6 '"failed")
              |ANTISYM;retractIfCan;%U;4| |ANTISYM;retract;%R;5| (|List| 28)
              (30 . |exponents|) (35 . |reductum|) (|Integer|) (40 . ~=)
              |ANTISYM;homogeneous?;%B;6| |ANTISYM;degree;%Nni;7| (46 . |0|)
              (50 . |elt|) (56 . |setelt!|) (63 . *) (69 . *) (75 . *)
              (81 . ~=) (87 . |coerce|) (92 . +) |ANTISYM;*;3%;11| (98 . =)
              |ANTISYM;coerce;R%;12| (104 . |coerce|) |ANTISYM;coerce;I%;13|
              (109 . |characteristic|) |ANTISYM;characteristic;Nni;14|
              |ANTISYM;generator;Nni%;15| |ANTISYM;exp;L%;16|
              |ANTISYM;leadingBasisTerm;2%;17| (|OutputForm|) (113 . *)
              (|Symbol|) (|List| 53) (119 . |elt|) (125 . |coerce|)
              (|Mapping| 51 51 51) (|List| 51) (130 . |reduce|)
              (136 . |coerce|) (141 . |zero?|) (146 . |coerce|) (151 . +)
              |ANTISYM;coerce;%Of;20| (|String|) (|PositiveInteger|)
              (|Union| % '"failed") (|Mapping| 6 6))
           '#(~= 157 |zero?| 163 |subtractIfCan| 168 |sample| 174 |rightRecip|
              178 |rightPower| 183 |retractable?| 195 |retractIfCan| 200
              |retract| 205 |reductum| 210 |recip| 215 |opposite?| 220 |one?|
              226 |map| 231 |leftRecip| 237 |leftPower| 242
              |leadingCoefficient| 254 |leadingBasisTerm| 259 |latex| 264
              |homogeneous?| 269 |generator| 274 |exp| 279 |degree| 284
              |commutator| 289 |coerce| 295 |coefficient| 310 |characteristic|
              316 |associator| 320 |antiCommutator| 327 |annihilate?| 333 ^ 339
              = 351 |1| 357 |0| 361 - 365 + 376 * 382)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|LeftAlgebra&| NIL NIL |Rng&| NIL NIL |NonAssociativeRing&| NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |SetCategory&|
                |RetractableTo&| NIL |BasicType&| NIL NIL)
             (CONS
              '#((|LeftAlgebra| 6) (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| 6)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|SetCategory|)
                 (|RetractableTo| 6) (|CoercibleTo| 51) (|BasicType|)
                 (|unitsKnown|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 68
                                  '(1 11 0 10 12 0 6 0 13 2 11 15 0 0 16 2 11
                                    15 0 0 17 0 6 0 18 1 0 6 0 21 1 11 25 0 26
                                    1 0 0 0 27 2 28 15 0 0 29 0 0 0 32 2 25 28
                                    0 28 33 3 25 28 0 28 28 34 2 0 0 6 0 35 2 6
                                    0 28 0 36 2 6 0 0 0 37 2 6 15 0 0 38 1 11 0
                                    25 39 2 0 0 0 0 40 2 6 15 0 0 42 1 6 0 28
                                    44 0 6 10 46 2 51 0 0 0 52 2 54 53 0 28 55
                                    1 53 51 0 56 2 58 51 57 0 59 1 6 51 0 60 1
                                    0 15 0 61 1 28 51 0 62 2 51 0 0 0 63 2 0 15
                                    0 0 1 1 0 15 0 61 2 0 67 0 0 1 0 0 0 1 1 0
                                    67 0 1 2 0 0 0 66 1 2 0 0 0 10 1 1 0 15 0
                                    20 1 0 22 0 23 1 0 6 0 24 1 0 0 0 27 1 0 67
                                    0 1 2 0 15 0 0 1 1 0 15 0 1 2 0 0 68 0 1 1
                                    0 67 0 1 2 0 0 0 66 1 2 0 0 0 10 1 1 0 6 0
                                    21 1 0 0 0 50 1 0 65 0 1 1 0 15 0 30 1 0 0
                                    10 48 1 0 0 25 49 1 0 10 0 31 2 0 0 0 0 1 1
                                    0 51 0 64 1 0 0 28 45 1 0 0 6 43 2 0 6 0 0
                                    19 0 0 10 47 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    15 0 0 1 2 0 0 0 66 1 2 0 0 0 10 1 2 0 15 0
                                    0 1 0 0 0 14 0 0 0 32 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 40 2 0 0 66 0 1 2 0 0 0 0 41 2 0
                                    0 28 0 1 2 0 0 10 0 1 2 0 0 6 0 35)))))
           '|lookupComplete|)) 
