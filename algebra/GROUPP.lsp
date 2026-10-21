
(SDEFUN |GROUPP;groupPresentation;LL%;1|
        ((|gens1| (|List| (|NonNegativeInteger|)))
         (|rels1| (|List| (|List| (|Integer|)))) (% (%)))
        (SPROG
         ((|g| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G59 NIL)
          (|r| NIL) (#2=#:G60 NIL))
         (SEQ (LETT |g| (SPADCALL |gens1| (QREFELT % 9)))
              (EXIT
               (CONS |g|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |r| NIL) (LETT #2# |rels1|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (NULL |r|)) (LETT #1# (CONS |r| #1#))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |GROUPP;groupPresentation;L%;2|
        ((|gens1| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|g| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |g| (SPADCALL |gens1| (QREFELT % 9))) (LETT |rels2| NIL)
              (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;%;3| ((% (%)))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| NIL) (LETT |rels1| NIL)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT % 11)))))) 

(SDEFUN |GROUPP;mapGen|
        ((|a| (|Integer|))
         (|ms|
          (|List|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|)))))
         (% (|Integer|)))
        (SPROG ((|m| NIL) (#1=#:G75 NIL) (#2=#:G74 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |m| NIL) (LETT #1# |ms|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((EQL (ABS |a|) (QCAR |m|))
                          (PROGN (LETT #2# (QCDR |m|)) (GO #3=#:G73))))
                        (EXIT
                         (COND
                          ((EQL (ABS |a|) (- (QCAR |m|)))
                           (PROGN (LETT #2# (- (QCDR |m|))) (GO #3#))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (|error|
                   (SPADCALL
                    (LIST "cant map " (STRINGIMAGE |a|) " in refactor")
                    (QREFELT % 16)))
                  (EXIT |a|)))
                #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;refactor;2%;5| ((|a| (%)) (% (%)))
        (SPROG
         ((#1=#:G93 NIL) (|g| NIL) (#2=#:G92 NIL)
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|rel| NIL) (#3=#:G94 NIL) (|ele| NIL) (#4=#:G95 NIL)
          (|newEle| (|Integer|)) (|newRel| (|List| (|Integer|)))
          (|rels1| (|List| (|List| (|Integer|)))) (#5=#:G96 NIL) (|gn| NIL)
          (#6=#:G97 NIL) (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |gms| NIL)
              (SEQ (LETT |gn| 1)
                   (LETT #1# (SPADCALL (QCAR |a|) (QREFELT % 19)))
                   (LETT |g| NIL)
                   (LETT #2# (SPADCALL (QCAR |a|) (QREFELT % 17))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL)
                         (|greater_SI| |gn| #1#))
                     (GO G191)))
                   (SEQ (LETT |gm| (CONS |g| |gn|))
                        (EXIT
                         (LETT |gms| (SPADCALL |gms| |gm| (QREFELT % 22)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |gn| (|inc_SI| |gn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |rels1| NIL)
              (SEQ (LETT |rel| NIL) (LETT #3# (QCDR |a|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |newRel| NIL)
                        (SEQ (LETT |ele| NIL) (LETT #4# |rel|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |ele| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newEle| (|GROUPP;mapGen| |ele| |gms| %))
                              (EXIT
                               (LETT |newRel|
                                     (SPADCALL |newRel| |newEle|
                                               (QREFELT % 25)))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |newRel| (QREFELT % 26)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |gens1|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |gn| 1)
                          (LETT #6# (SPADCALL (QCAR |a|) (QREFELT % 19))) G190
                          (COND ((|greater_SI| |gn| #6#) (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS |gn| #5#))))
                          (LETT |gn| (|inc_SI| |gn|)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT % 11)))))) 

(SDEFUN |GROUPP;=;2%B;6| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG
         ((|ar| (%)) (|br| (%)) (|ags| #1=(|List| (|NonNegativeInteger|)))
          (|bgs| #1#) (#2=#:G102 NIL) (|ars| #3=(|List| (|List| (|Integer|))))
          (|brs| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |ar| (SPADCALL |a| (QREFELT % 27)))
                (LETT |br| (SPADCALL |b| (QREFELT % 27)))
                (LETT |ags| (SPADCALL (QCAR |ar|) (QREFELT % 17)))
                (LETT |bgs| (SPADCALL (QCAR |br|) (QREFELT % 17)))
                (COND
                 ((SPADCALL (SPADCALL |ags| (QREFELT % 29))
                            (SPADCALL |bgs| (QREFELT % 29)) (QREFELT % 31))
                  (PROGN (LETT #2# NIL) (GO #4=#:G101))))
                (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT % 32)))
                (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT % 32)))
                (EXIT
                 (SPADCALL (SPADCALL |ars| (QREFELT % 34))
                           (SPADCALL |brs| (QREFELT % 34)) (QREFELT % 35)))))
          #4# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGen| ((|i2| (|Integer|)) (% (|OutputForm|)))
        (SPROG
         ((|#G18|
           (|Record| (|:| |quotient| #1=(|Integer|))
                     (|:| |remainder| #2=(|Integer|))))
          (|suffix| #1#) (|i| #2#) (|letters| (|String|)) (|n| (|OutputForm|))
          (#3=#:G106 NIL))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G18| (|divide_INT| (ABS |i2|) 25))
             (LETT |suffix| (QCAR |#G18|))
             (LETT |i| (QCDR |#G18|))
             |#G18|)
            (LETT |letters| "eabcdfghijklmnopqrstuvwxyz")
            (LETT |n|
                  (SPADCALL (SPADCALL |letters| (+ |i| 1) (QREFELT % 38))
                            (QREFELT % 40)))
            (COND
             ((> |suffix| 0)
              (LETT |n|
                    (SPADCALL |n| (SPADCALL (+ |suffix| 1) (QREFELT % 41))
                              (QREFELT % 42)))))
            (COND
             ((< |i2| 0)
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL "-" (QREFELT % 43)) |n|
                               (QREFELT % 42)))
               (GO #4=#:G105))))
            (EXIT |n|)))
          #4# (EXIT #3#)))) 

(SDEFUN |GROUPP;outputRel| ((|r| (|List| (|Integer|))) (% (|OutputForm|)))
        (SPROG
         ((|ele| NIL) (#1=#:G112 NIL) (|newterm| (|OutputForm|))
          (|eleout| #2=(|OutputForm|)) (|separator| #2#))
         (SEQ (LETT |eleout| (SPADCALL "" (QREFELT % 43)))
              (LETT |separator| (SPADCALL " " (QREFELT % 43)))
              (SEQ (LETT |ele| NIL) (LETT #1# |r|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |newterm| (|GROUPP;outputGen| |ele| %))
                        (LETT |eleout|
                              (SPADCALL (LIST |eleout| |separator| |newterm|)
                                        (QREFELT % 44)))
                        (EXIT
                         (LETT |separator| (SPADCALL "*" (QREFELT % 43)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |eleout|)))) 

(SDEFUN |GROUPP;outputRelList|
        ((|i2| (|List| (|List| (|Integer|)))) (% (|OutputForm|)))
        (SPROG
         ((|r| NIL) (#1=#:G119 NIL) (|rels1| (|List| (|OutputForm|)))
          (#2=#:G118 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rels1| NIL)
                (SEQ (LETT |r| NIL) (LETT #1# |i2|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |rels1|
                             (SPADCALL |rels1| (|GROUPP;outputRel| |r| %)
                                       (QREFELT % 46)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((> (LENGTH |rels1|) 0)
                  (PROGN
                   (LETT #2# (SPADCALL |rels1| (QREFELT % 47)))
                   (GO #3=#:G117))))
                (EXIT (SPADCALL " " (QREFELT % 43)))))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGenList|
        ((|ps| (|List| (|NonNegativeInteger|))) (% (|OutputForm|)))
        (SPROG
         ((|p| NIL) (#1=#:G126 NIL) (|gens1| (|List| (|OutputForm|)))
          (#2=#:G125 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| NIL)
                (SEQ (LETT |p| NIL) (LETT #1# |ps|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |gens1|
                             (SPADCALL |gens1| (|GROUPP;outputGen| |p| %)
                                       (QREFELT % 46)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((> (LENGTH |gens1|) 0)
                  (PROGN
                   (LETT #2# (SPADCALL |gens1| (QREFELT % 48)))
                   (GO #3=#:G124))))
                (EXIT (SPADCALL " " (QREFELT % 43)))))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;indexesOfRelUsingGen|
        ((|s| (%)) (|gen| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|r| (|List| (|List| (|Integer|)))) (|reln| NIL) (#1=#:G135 NIL)
          (|rel| NIL) (#2=#:G134 NIL) (|res| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |res| NIL) (LETT |r| (QCDR |s|))
              (SEQ (LETT |reln| 1) (LETT #1# (LENGTH |r|)) (LETT |rel| NIL)
                   (LETT #2# |r|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL)
                         (|greater_SI| |reln| #1#))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |gen| |rel| (QREFELT % 49))
                      (LETT |res| (SPADCALL |res| |reln| (QREFELT % 50)))))
                    (EXIT
                     (COND
                      ((> |gen| 0)
                       (COND
                        ((SPADCALL (- |gen|) |rel| (QREFELT % 49))
                         (LETT |res|
                               (SPADCALL |res| |reln| (QREFELT % 50)))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |reln| (|inc_SI| |reln|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;removeGen|
        ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|val| (|NonNegativeInteger|))
         (% (|PrimitiveArray| (|NonNegativeInteger|))))
        (SPADCALL |val| |gens1| (QREFELT % 51))) 

(SDEFUN |GROUPP;removeGen2|
        ((|rels1| (|List| (|List| (|Integer|)))) (|val| (|NonNegativeInteger|))
         (% (|List| (|List| (|Integer|)))))
        (SPROG ((#1=#:G140 NIL) (|rel| NIL) (#2=#:G141 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |rel| NIL) (LETT #2# |rels1|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (- |val|)
                                         (SPADCALL |val| |rel| (QREFELT % 52))
                                         (QREFELT % 52))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GROUPP;replaceGen|
        ((|rels1| (|List| (|List| (|Integer|))))
         (|val1| (|NonNegativeInteger|)) (|val2| (|Integer|))
         (% (|List| (|List| (|Integer|)))))
        (SPROG
         ((|rel| NIL) (#1=#:G151 NIL) (|ele| NIL) (#2=#:G152 NIL)
          (|e| (|Integer|)) (|rel2| (|List| (|Integer|)))
          (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL)
                        (SEQ (LETT |ele| NIL) (LETT #2# |rel|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |e| (ABS |ele|))
                                  (COND ((EQL |e| |val1|) (LETT |e| |val2|)))
                                  (COND ((< |ele| 0) (LETT |e| (- |e|))))
                                  (EXIT
                                   (LETT |rel2|
                                         (SPADCALL |rel2| |e|
                                                   (QREFELT % 25)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |rels2|
                               (SPADCALL |rels2| |rel2| (QREFELT % 26)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |rels2|)))) 

(SDEFUN |GROUPP;TTRemoveGeneratorIfIdentity|
        ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|rel| NIL) (#1=#:G160 NIL) (|toBeRemoved| (|NonNegativeInteger|))
          (#2=#:G159 NIL) (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |toBeRemoved| 0)
                (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 1)
                         (COND
                          ((EQL |toBeRemoved| 0)
                           (LETT |toBeRemoved| (ABS (|SPADfirst| |rel|)))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |toBeRemoved| 0) (PROGN (LETT #2# |s|) (GO #3=#:G158))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST (SPADCALL "simplify: generator '" (QREFELT % 43))
                          (|GROUPP;outputGen| |toBeRemoved| %)
                          (SPADCALL "' is identity so remove it"
                                    (QREFELT % 43)))
                    (QREFELT % 44))
                   (QREFELT % 54))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| %))
                (LETT |rels1| (|GROUPP;removeGen2| |rels1| |toBeRemoved| %))
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| %)
                            (QREFELT % 54))))
                (EXIT (CONS |gens1| |rels1|))))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;TTRenameGenerator| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|rel| NIL) (#1=#:G170 NIL) (|replaceTo| (|Integer|))
          (|replaceFrom| (|NonNegativeInteger|)) (#2=#:G169 NIL)
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |replaceFrom| 0) (LETT |replaceTo| 0)
                (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 2)
                         (COND
                          ((EQL |replaceFrom| 0)
                           (SEQ
                            (LETT |replaceTo| (SPADCALL |rel| (QREFELT % 55)))
                            (LETT |replaceFrom| (ABS (|SPADfirst| |rel|)))
                            (COND
                             ((> (|SPADfirst| |rel|) 0)
                              (LETT |replaceTo| (- |replaceTo|))))
                            (EXIT
                             (COND
                              ((EQL |replaceFrom| (ABS |replaceTo|))
                               (LETT |replaceFrom| 0)))))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |replaceFrom| 0) (PROGN (LETT #2# |s|) (GO #3=#:G168))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST (SPADCALL "simplify: generator '" (QREFELT % 43))
                          (|GROUPP;outputGen| |replaceFrom| %)
                          (SPADCALL "' is replaced by '" (QREFELT % 43))
                          (|GROUPP;outputGen| |replaceTo| %)
                          (SPADCALL "'" (QREFELT % 43)))
                    (QREFELT % 44))
                   (QREFELT % 54))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |replaceFrom| %))
                (LETT |rels1|
                      (|GROUPP;replaceGen| |rels1| |replaceFrom| |replaceTo|
                       %))
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| %)
                            (QREFELT % 54))))
                (EXIT (CONS |gens1| |rels1|))))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;TTRemoveEmpty| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))) (|rel| NIL) (#1=#:G176 NIL)
          (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |rel|))
                       (LETT |rels2|
                             (SPADCALL |rels2| |rel| (QREFELT % 26)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTRemoveZero| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |gens1| (|GROUPP;removeGen| |gens1| 0 %))
              (LETT |rels1| (|GROUPP;removeGen2| |rels1| 0 %))
              (EXIT (CONS |gens1| |rels1|))))) 

(SDEFUN |GROUPP;TTRemoveEleTimesInverse|
        ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))) (|rel| NIL) (#1=#:G195 NIL)
          (|ele| NIL) (#2=#:G196 NIL) (|changed| (|Boolean|))
          (|lastele| (|Integer|)) (|rel2| (|List| (|Integer|)))
          (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL) (LETT |changed| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL) (LETT |lastele| 0)
                        (SEQ (LETT |ele| NIL) (LETT #2# |rel|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL (ABS |ele|) (ABS |lastele|))
                                 (COND
                                  ((SPADCALL (SPADCALL |ele| (QREFELT % 56))
                                             (SPADCALL |lastele|
                                                       (QREFELT % 56))
                                             (QREFELT % 57))
                                   (SEQ
                                    (COND
                                     (|trace|
                                      (SPADCALL
                                       (SPADCALL
                                        (LIST
                                         (SPADCALL "simplify: generator '"
                                                   (QREFELT % 43))
                                         (|GROUPP;outputGen| |ele| %)
                                         (SPADCALL
                                          "' is adjacent to its inverse"
                                          (QREFELT % 43)))
                                        (QREFELT % 44))
                                       (QREFELT % 54))))
                                    (LETT |changed| 'T)
                                    (EXIT (LETT |lastele| 0))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((SPADCALL |lastele| 0 (QREFELT % 57))
                                      (LETT |rel2|
                                            (SPADCALL |rel2| |lastele|
                                                      (QREFELT % 25)))))
                                    (EXIT (LETT |lastele| |ele|))))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((SPADCALL |lastele| 0 (QREFELT % 57))
                                    (LETT |rel2|
                                          (SPADCALL |rel2| |lastele|
                                                    (QREFELT % 25)))))
                                  (EXIT (LETT |lastele| |ele|)))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (COND
                         ((SPADCALL |lastele| 0 (QREFELT % 57))
                          (LETT |rel2|
                                (SPADCALL |rel2| |lastele| (QREFELT % 25)))))
                        (EXIT
                         (COND
                          ((NULL (NULL |rel2|))
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel2| (QREFELT % 26)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               (|trace|
                (COND
                 (|changed|
                  (SPADCALL (|GROUPP;outputRelList| |rels2| %)
                            (QREFELT % 54))))))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;invertRelation|
        ((|relationIn| (|List| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG
         ((|ele| NIL) (#1=#:G201 NIL) (|relationOut| (|List| (|Integer|))))
         (SEQ (LETT |relationOut| NIL)
              (SEQ (LETT |ele| NIL) (LETT #1# |relationIn|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |relationOut| (CONS (- |ele|) |relationOut|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;cycleRelation|
        ((|relationIn| (|List| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG ((|relationOut| (|List| (|Integer|))))
               (SEQ
                (LETT |relationOut|
                      (SPADCALL (CDR |relationIn|) (|SPADfirst| |relationIn|)
                                (QREFELT % 25)))
                (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;relationEquivalent|
        ((|relA| (|List| (|Integer|))) (|relB| (|List| (|Integer|)))
         (% (|Boolean|)))
        (SPROG
         ((|n| NIL) (#1=#:G213 NIL) (|relBCycle| (|List| (|Integer|)))
          (#2=#:G212 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |relA|) (LENGTH |relB|) (QREFELT % 58))
              (PROGN (LETT #2# NIL) (GO #3=#:G211))))
            (COND
             ((SPADCALL |relA| |relB| (QREFELT % 59))
              (PROGN (LETT #2# 'T) (GO #3#))))
            (COND
             ((SPADCALL |relA| (|GROUPP;invertRelation| |relB| %)
                        (QREFELT % 59))
              (PROGN (LETT #2# 'T) (GO #3#))))
            (LETT |relBCycle| (SPADCALL |relB| (QREFELT % 60)))
            (SEQ (LETT |n| 1) (LETT #1# (LENGTH |relA|)) G190
                 (COND ((|greater_SI| |n| #1#) (GO G191)))
                 (SEQ (LETT |relBCycle| (|GROUPP;cycleRelation| |relBCycle| %))
                      (COND
                       ((SPADCALL |relA| |relBCycle| (QREFELT % 59))
                        (PROGN (LETT #2# 'T) (GO #3#))))
                      (EXIT
                       (COND
                        ((SPADCALL |relA|
                                   (|GROUPP;invertRelation| |relBCycle| %)
                                   (QREFELT % 59))
                         (PROGN (LETT #2# 'T) (GO #3#))))))
                 (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;TTRemoveDuplicateRelation|
        ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))) (|nrela| NIL) (#1=#:G225 NIL)
          (|rela| NIL) (#2=#:G224 NIL) (|nrelb| NIL) (#3=#:G227 NIL)
          (|relb| NIL) (#4=#:G226 NIL) (|include| (|Boolean|))
          (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |nrela| 1) (LETT #1# (LENGTH |rels1|))
                   (LETT |rela| NIL) (LETT #2# |rels1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rela| (CAR #2#)) NIL)
                         (|greater_SI| |nrela| #1#))
                     (GO G191)))
                   (SEQ (LETT |include| 'T)
                        (SEQ (LETT |nrelb| 1) (LETT #3# (LENGTH |rels1|))
                             (LETT |relb| NIL) (LETT #4# |rels1|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |relb| (CAR #4#)) NIL)
                                   (|greater_SI| |nrelb| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((> |nrela| |nrelb|)
                                 (COND
                                  ((|GROUPP;relationEquivalent| |rela| |relb|
                                    %)
                                   (SEQ (LETT |include| NIL)
                                        (EXIT
                                         (COND
                                          (|trace|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                "TTRemoveDuplicateRelation duplicate found "
                                                (QREFELT % 43))
                                               (SPADCALL |rela| (QREFELT % 61))
                                               (QREFELT % 42))
                                              (SPADCALL "=" (QREFELT % 43))
                                              (QREFELT % 42))
                                             (SPADCALL |relb| (QREFELT % 61))
                                             (QREFELT % 42))
                                            (QREFELT % 54))))))))))))
                             (LETT #4#
                                   (PROG1 (CDR #4#)
                                     (LETT |nrelb| (|inc_SI| |nrelb|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          (|include|
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rela| (QREFELT % 26)))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |nrela| (|inc_SI| |nrela|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTMinimiseInverses| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))) (|rel| NIL) (#1=#:G235 NIL)
          (|ele| NIL) (#2=#:G236 NIL) (|numInverts| #3=(|NonNegativeInteger|))
          (|numNonInverts| #3#) (|rels2| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |numInverts| 0) (LETT |numNonInverts| 0)
                        (SEQ (LETT |ele| NIL) (LETT #2# |rel|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< |ele| 0)
                                 (LETT |numInverts| (+ |numInverts| 1)))
                                ('T
                                 (LETT |numNonInverts|
                                       (+ |numNonInverts| 1))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((> |numInverts| |numNonInverts|)
                           (LETT |rels2|
                                 (SPADCALL |rels2|
                                           (|GROUPP;invertRelation| |rel| %)
                                           (QREFELT % 26))))
                          ('T
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel| (QREFELT % 26)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;generatorOccurrences|
        ((|rel| (|List| (|Integer|))) (|gen| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        (SPROG ((|g| NIL) (#1=#:G244 NIL) (|res| (|NonNegativeInteger|)))
               (SEQ (LETT |res| 0)
                    (SEQ (LETT |g| NIL) (LETT #1# |rel|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (COND ((EQL |g| |gen|) (LETT |res| (+ |res| 1))))
                              (EXIT
                               (COND
                                ((> |gen| 0)
                                 (COND
                                  ((EQL |g| (- |gen|))
                                   (LETT |res| (+ |res| 1))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |GROUPP;removeRelations|
        ((|rels1| (|List| (|List| (|Integer|)))) (|val| (|NonNegativeInteger|))
         (% (|List| (|List| (|Integer|)))))
        (SPROG
         ((|rel| NIL) (#1=#:G251 NIL) (|res| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |val| |rel| (QREFELT % 49)))
                       (COND
                        ((NULL (SPADCALL (- |val|) |rel| (QREFELT % 49)))
                         (LETT |res|
                               (SPADCALL |res| |rel| (QREFELT % 26)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;TTSubstitute| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|gs| (|List| (|NonNegativeInteger|)))
          (|rs| #1=(|List| (|List| (|Integer|)))) (|g| NIL) (#2=#:G278 NIL)
          (|indexes| (|List| (|NonNegativeInteger|)))
          (|r3| (|List| (|Integer|))) (|n3| (|NonNegativeInteger|))
          (|r1| (|List| #3=(|Integer|))) (|n1| #4=(|NonNegativeInteger|))
          (|r2| (|List| (|Integer|))) (|n2| #4#) (|genToBeRemoved| #4#)
          (#5=#:G277 NIL) (|found| #6=(|Boolean|)) (|genInverted| #6#)
          (|prer| (|List| (|Integer|))) (|x| (|Integer|))
          (|restr| (|List| #3#)) (|postr| (|List| (|Integer|)))
          (|replacement| (|List| (|Integer|))) (#7=#:G279 NIL)
          (|newRel| (|List| (|Integer|)))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (|rels1| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |gs| (SPADCALL (QCAR |s|) (QREFELT % 17)))
                (LETT |rs| (QCDR |s|)) (LETT |r1| NIL) (LETT |r2| NIL)
                (LETT |n1| 0) (LETT |n2| 0) (LETT |genToBeRemoved| 0)
                (SEQ (LETT |g| NIL) (LETT #2# |gs|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |indexes|
                            (|GROUPP;indexesOfRelUsingGen| |s| |g| %))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |indexes| (QREFELT % 62)) 2)
                         (COND
                          ((EQL |genToBeRemoved| 0)
                           (SEQ (LETT |genToBeRemoved| |g|)
                                (LETT |r1|
                                      (SPADCALL |rs|
                                                (SPADCALL |indexes| 1
                                                          (QREFELT % 63))
                                                (QREFELT % 64)))
                                (LETT |r2|
                                      (SPADCALL |rs|
                                                (SPADCALL |indexes| 2
                                                          (QREFELT % 63))
                                                (QREFELT % 64)))
                                (LETT |n1|
                                      (|GROUPP;generatorOccurrences| |r1| |g|
                                       %))
                                (LETT |n2|
                                      (|GROUPP;generatorOccurrences| |r2| |g|
                                       %))
                                (COND
                                 ((SPADCALL |n1| 1 (QREFELT % 58))
                                  (SEQ (LETT |r3| |r1|) (LETT |n3| |n1|)
                                       (LETT |r1| |r2|) (LETT |n1| |n2|)
                                       (LETT |r2| |r3|)
                                       (EXIT (LETT |n2| |n3|)))))
                                (EXIT
                                 (COND
                                  ((SPADCALL |n1| 1 (QREFELT % 58))
                                   (LETT |genToBeRemoved| 0)))))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |n1| 1 (QREFELT % 58))
                  (PROGN (LETT #5# |s|) (GO #8=#:G276))))
                (COND
                 (|trace|
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL "simplify: TTSubstitute (" (QREFELT % 43))
                      (SPADCALL |s| (QREFELT % 65)) (QREFELT % 42))
                     (SPADCALL ")" (QREFELT % 43)) (QREFELT % 42))
                    (QREFELT % 54))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL "genToBeRemoved=" (QREFELT % 43))
                                  (|GROUPP;outputGen| |genToBeRemoved| %)
                                  (QREFELT % 42))
                        (SPADCALL " r1=" (QREFELT % 43)) (QREFELT % 42))
                       (|GROUPP;outputRel| |r1| %) (QREFELT % 42))
                      (SPADCALL " r2=" (QREFELT % 43)) (QREFELT % 42))
                     (|GROUPP;outputRel| |r2| %) (QREFELT % 42))
                    (QREFELT % 54))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL "n1=" (QREFELT % 43))
                                 (SPADCALL |n1| (QREFELT % 66)) (QREFELT % 42))
                       (SPADCALL " n2=" (QREFELT % 43)) (QREFELT % 42))
                      (SPADCALL |n2| (QREFELT % 66)) (QREFELT % 42))
                     (QREFELT % 54))))))
                (LETT |restr| |r1|) (LETT |prer| NIL) (LETT |found| NIL)
                (LETT |genInverted| NIL)
                (SEQ G190
                     (COND
                      ((NULL (NULL (OR (NULL |restr|) |found|))) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |restr|))
                          (LETT |restr| (CDR |restr|))
                          (EXIT
                           (COND
                            ((OR (EQL |x| |genToBeRemoved|)
                                 (EQL |x| (- |genToBeRemoved|)))
                             (SEQ (LETT |found| 'T)
                                  (EXIT
                                   (COND
                                    ((< |x| 0) (LETT |genInverted| 'T))))))
                            ('T
                             (LETT |prer|
                                   (SPADCALL |prer| |x| (QREFELT % 25)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |postr| NIL)
                (SEQ G190 (COND ((NULL (NULL (NULL |restr|))) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |restr|))
                          (LETT |restr| (CDR |restr|))
                          (EXIT
                           (LETT |postr|
                                 (SPADCALL |postr| |x| (QREFELT % 25)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |replacement|
                      (SPADCALL (|GROUPP;invertRelation| |prer| %)
                                (|GROUPP;invertRelation| |postr| %)
                                (QREFELT % 67)))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "we will substitute " (QREFELT % 43))
                        (|GROUPP;outputRel| |replacement| %) (QREFELT % 42))
                       (SPADCALL " for " (QREFELT % 43)) (QREFELT % 42))
                      (|GROUPP;outputGen| |genToBeRemoved| %) (QREFELT % 42))
                     (SPADCALL " in " (QREFELT % 43)) (QREFELT % 42))
                    (|GROUPP;outputRel| |r2| %) (QREFELT % 42))
                   (QREFELT % 54))))
                (LETT |newRel| NIL)
                (SEQ (LETT #7# |r2|) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (ABS |x|) (ABS |genToBeRemoved|))
                         (COND
                          (|genInverted|
                           (LETT |newRel|
                                 (SPADCALL |newRel|
                                           (|GROUPP;invertRelation|
                                            |replacement| %)
                                           (QREFELT % 67))))
                          ('T
                           (LETT |newRel|
                                 (SPADCALL |newRel| |replacement|
                                           (QREFELT % 67))))))
                        ('T
                         (LETT |newRel|
                               (SPADCALL |newRel| |x| (QREFELT % 25)))))))
                     (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL (SPADCALL "newRel=" (QREFELT % 43))
                             (|GROUPP;outputRel| |newRel| %) (QREFELT % 42))
                   (QREFELT % 54))))
                (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |genToBeRemoved| %))
                (LETT |rels1|
                      (|GROUPP;removeRelations| |rels1| |genToBeRemoved| %))
                (LETT |rels1| (SPADCALL |rels1| |newRel| (QREFELT % 26)))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL "gens=" (QREFELT % 43))
                               (|GROUPP;outputGenList|
                                (SPADCALL |gens1| (QREFELT % 17)) %)
                               (QREFELT % 42))
                     (SPADCALL " rels=" (QREFELT % 43)) (QREFELT % 42))
                    (|GROUPP;outputRelList| |rels1| %) (QREFELT % 42))
                   (QREFELT % 54))))
                (EXIT (CONS |gens1| |rels1|))))
          #8# (EXIT #5#)))) 

(SDEFUN |GROUPP;isSimpler?| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG
         ((|gensa| #1=(|PrimitiveArray| (|NonNegativeInteger|)))
          (|relsa| #2=(|List| (|List| (|Integer|)))) (|gensb| #1#)
          (|relsb| #2#) (#3=#:G289 NIL)
          (|relationComplexityA| #4=(|NonNegativeInteger|)) (|rel| NIL)
          (#5=#:G290 NIL) (|relationComplexityB| #4#) (#6=#:G288 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gensa| (QCAR |a|)) (LETT |relsa| (QCDR |a|))
                (LETT |gensb| (QCAR |b|)) (LETT |relsb| (QCDR |b|))
                (COND
                 ((< (SPADCALL |gensa| (QREFELT % 19))
                     (SPADCALL |gensb| (QREFELT % 19)))
                  (PROGN (LETT #6# 'T) (GO #7=#:G287))))
                (COND
                 ((< (LENGTH |relsa|) (LENGTH |relsb|))
                  (PROGN (LETT #6# 'T) (GO #7#))))
                (LETT |relationComplexityA| 0)
                (SEQ (LETT |rel| NIL) (LETT #3# |relsa|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationComplexityA|
                             (+ |relationComplexityA| (LENGTH |rel|)))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (LETT |relationComplexityB| 0)
                (SEQ (LETT |rel| NIL) (LETT #5# |relsb|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |rel| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationComplexityB|
                             (+ |relationComplexityB| (LENGTH |rel|)))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |relationComplexityA| |relationComplexityB|)
                  (PROGN (LETT #6# 'T) (GO #7#))))
                (EXIT NIL)))
          #7# (EXIT #6#)))) 

(SDEFUN |GROUPP;simplify;2%;29| ((|s| (%)) (% (%)))
        (SPADCALL |s| NIL (QREFELT % 68))) 

(SDEFUN |GROUPP;simplify;%B%;30| ((|s| (%)) (|trace| (|Boolean|)) (% (%)))
        (SPROG
         ((|loopBreaker| #1=(|NonNegativeInteger|)) (|res| (%)) (#2=#:G299 NIL)
          (|level| #1#) (|lastpass| (%)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "simplify(" (QREFELT % 43))
                          (SPADCALL |s| (QREFELT % 65)) (QREFELT % 42))
                (SPADCALL ")" (QREFELT % 43)) (QREFELT % 42))
               (QREFELT % 54))))
            (LETT |res| |s|) (LETT |lastpass| |s|) (LETT |level| 0)
            (LETT |loopBreaker| 0)
            (SEQ G190 (COND ((NULL (< |loopBreaker| 10000)) (GO G191)))
                 (SEQ (LETT |loopBreaker| (+ |loopBreaker| 1))
                      (COND
                       ((EQL |level| 0)
                        (LETT |res| (|GROUPP;TTRemoveEmpty| |res| |trace| %))))
                      (COND
                       ((EQL |level| 1)
                        (LETT |res| (|GROUPP;TTRemoveZero| |res| |trace| %))))
                      (COND
                       ((EQL |level| 2)
                        (LETT |res|
                              (|GROUPP;TTRemoveGeneratorIfIdentity| |res|
                               |trace| %))))
                      (COND
                       ((EQL |level| 3)
                        (LETT |res|
                              (|GROUPP;TTRenameGenerator| |res| |trace| %))))
                      (COND
                       ((EQL |level| 4)
                        (LETT |res|
                              (|GROUPP;TTRemoveEleTimesInverse| |res| |trace|
                               %))))
                      (COND
                       ((EQL |level| 5)
                        (LETT |res|
                              (|GROUPP;TTRemoveDuplicateRelation| |res| |trace|
                               %))))
                      (COND
                       ((EQL |level| 6)
                        (LETT |res| (|GROUPP;TTSubstitute| |res| |trace| %))))
                      (COND
                       ((EQL |level| 7)
                        (PROGN
                         (LETT #2#
                               (|GROUPP;TTMinimiseInverses| |res| |trace| %))
                         (GO #3=#:G298))))
                      (COND
                       ((|GROUPP;isSimpler?| |res| |lastpass| %)
                        (LETT |level| 0))
                       ('T (LETT |level| (+ |level| 1))))
                      (COND
                       (|trace|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL " level=" (QREFELT % 43))
                                       (SPADCALL |level| (QREFELT % 66))
                                       (QREFELT % 42))
                             (SPADCALL " loop=" (QREFELT % 43)) (QREFELT % 42))
                            (SPADCALL |loopBreaker| (QREFELT % 66))
                            (QREFELT % 42))
                           (SPADCALL " res=" (QREFELT % 43)) (QREFELT % 42))
                          (SPADCALL |res| (QREFELT % 65)) (QREFELT % 42))
                         (QREFELT % 54))))
                      (EXIT (LETT |lastpass| |res|)))
                 NIL (GO G190) G191 (EXIT NIL))
            (SPADCALL
             (SPADCALL
              (SPADCALL "simplify excessive time - loop suspected"
                        (QREFELT % 43))
              (SPADCALL |s| (QREFELT % 65)) (QREFELT % 42))
             (QREFELT % 54))
            (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;offsetIndexes|
        ((|a| (%)) (|offset| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|ga| (|List| (|NonNegativeInteger|)))
          (|ra| (|List| (|List| (|Integer|)))) (#1=#:G308 NIL) (|x| NIL)
          (#2=#:G309 NIL) (|gb| (|List| (|NonNegativeInteger|)))
          (#3=#:G310 NIL) (|z| NIL) (#4=#:G311 NIL) (#5=#:G312 NIL) (|y| NIL)
          (#6=#:G313 NIL) (|rb| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |ga| (SPADCALL (QCAR |a|) (QREFELT % 17)))
              (LETT |ra| (QCDR |a|))
              (LETT |gb|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |x| NIL) (LETT #2# |ga|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS (+ |x| |offset|) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |rb|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |z| NIL) (LETT #4# |ra|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |z| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (PROGN
                                    (LETT #5# NIL)
                                    (SEQ (LETT |y| NIL) (LETT #6# |z|) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT |y| (CAR #6#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (COND
                                                   ((> |y| 0) (+ |y| |offset|))
                                                   ('T (- |y| |offset|)))
                                                  #5#))))
                                         (LETT #6# (CDR #6#)) (GO G190) G191
                                         (EXIT (NREVERSE #5#))))
                                   #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT (SPADCALL |gb| |rb| (QREFELT % 11)))))) 

(SDEFUN |GROUPP;quotient;%L%;32|
        ((|a| (%)) (|remgen| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|toBeRemoved| NIL) (#1=#:G319 NIL)
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (QCAR |a|)) (LETT |rels1| (QCDR |a|))
              (SEQ (LETT |toBeRemoved| NIL) (LETT #1# |remgen|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |toBeRemoved| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| %))
                    (EXIT
                     (LETT |rels1|
                           (|GROUPP;removeGen2| |rels1| |toBeRemoved| %))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT % 17)) |rels1|
                          (QREFELT % 11))
                (QREFELT % 69)))))) 

(SDEFUN |GROUPP;quotient;%L%;33|
        ((|a| (%)) (|addrel| (|List| (|List| (|Integer|)))) (% (%)))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|)))
          (|rels1| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |gens1| (SPADCALL (QCAR |a|) (QREFELT % 17)))
              (LETT |rels1| (QCDR |a|))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT % 71))
                          (SPADCALL |rels1| |addrel| (QREFELT % 72))
                          (QREFELT % 11))
                (QREFELT % 69)))))) 

(SDEFUN |GROUPP;directProduct;3%;34| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|a2| (%)) (|ga| #1=(|List| (|NonNegativeInteger|)))
          (|ra| #2=(|List| (|List| (|Integer|)))) (|sa| (|NonNegativeInteger|))
          (|b2| (%)) (|gb| #1#) (|rb| #2#) (|gax| NIL) (#3=#:G329 NIL)
          (|gbx| NIL) (#4=#:G330 NIL) (|gcx| (|List| (|Integer|)))
          (|rc| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |a2| (SPADCALL |a| (QREFELT % 27)))
              (LETT |ga| (SPADCALL (QCAR |a2|) (QREFELT % 17)))
              (LETT |ra| (QCDR |a2|))
              (LETT |sa| (SPADCALL |ga| (QREFELT % 62)))
              (LETT |b2|
                    (|GROUPP;offsetIndexes| (SPADCALL |b| (QREFELT % 27)) |sa|
                     %))
              (LETT |gb| (SPADCALL (QCAR |b2|) (QREFELT % 17)))
              (LETT |rb| (QCDR |b2|)) (LETT |rc| NIL)
              (SEQ (LETT |gax| NIL) (LETT #3# |ga|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |gax| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |gbx| NIL) (LETT #4# |gb|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |gbx| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |gcx| (LIST |gax| |gbx| |gax| |gbx|))
                               (EXIT
                                (LETT |rc|
                                      (SPADCALL |rc| |gcx| (QREFELT % 26)))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ga| (QREFELT % 71)) |gb| (QREFELT % 74))
                (SPADCALL (LIST |ra| |rb| |rc|) (QREFELT % 75))
                (QREFELT % 11)))))) 

(SDEFUN |GROUPP;cyclicGroup;Pi%;35| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((|ga| (|List| (|NonNegativeInteger|))) (#1=#:G335 NIL) (|x| NIL)
          (#2=#:G336 NIL) (|ra| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |ga| (LIST 1))
              (LETT |ra|
                    (LIST
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |x| 1) (LETT #2# |n|) G190
                           (COND ((|greater_SI| |x| #2#) (GO G191)))
                           (SEQ (EXIT (LETT #1# (CONS 1 #1#))))
                           (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))))
              (EXIT (SPADCALL |ga| |ra| (QREFELT % 11)))))) 

(SDEFUN |GROUPP;dihedralGroup;Pi%;36| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG ((|c1| (%)) (|c2| (%)))
               (SEQ (LETT |c1| (SPADCALL |n| (QREFELT % 78)))
                    (LETT |c2| (SPADCALL 2 (QREFELT % 78)))
                    (EXIT (SPADCALL |c1| |c2| (QREFELT % 76)))))) 

(SDEFUN |GROUPP;symmetricGroup;Pi%;37| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((#1=#:G354 NIL) (#2=#:G339 NIL) (|m| (|PositiveInteger|))
          (#3=#:G355 NIL) (|x| NIL) (#4=#:G356 NIL)
          (|ga| (|List| (|NonNegativeInteger|))) (|a| NIL) (#5=#:G357 NIL)
          (|b| NIL) (#6=#:G358 NIL) (|y| (|List| (|Integer|)))
          (|r| (|List| (|List| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| 2)
              (PROGN (LETT #1# (SPADCALL NIL (QREFELT % 12))) (GO #7=#:G353))))
            (LETT |m|
                  (PROG1 (LETT #2# (- |n| 1))
                    (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                      '(|Integer|) #2#)))
            (LETT |ga|
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |x| 1) (LETT #4# |m|) G190
                        (COND ((|greater_SI| |x| #4#) (GO G191)))
                        (SEQ (EXIT (LETT #3# (CONS |x| #3#))))
                        (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                        (EXIT (NREVERSE #3#)))))
            (LETT |r| NIL)
            (SEQ (LETT |a| 1) (LETT #5# |m|) G190
                 (COND ((|greater_SI| |a| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |b| 1) (LETT #6# |m|) G190
                        (COND ((|greater_SI| |b| #6#) (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |a| |b|)
                           (SEQ (LETT |y| (LIST |a| |a|))
                                (EXIT (LETT |r| (CONS |y| |r|))))))
                         (COND
                          ((< (+ |a| 1) |b|)
                           (SEQ (LETT |y| (LIST |a| |b| (- |a|) (- |b|)))
                                (EXIT (LETT |r| (CONS |y| |r|))))))
                         (EXIT
                          (COND
                           ((EQL (+ |a| 1) |b|)
                            (SEQ (LETT |y| (LIST |a| |b| |a| |b| |a| |b|))
                                 (EXIT (LETT |r| (CONS |y| |r|))))))))
                        (LETT |b| (|inc_SI| |b|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |a| (|inc_SI| |a|)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |ga| (NREVERSE |r|) (QREFELT % 11)))))
          #7# (EXIT #1#)))) 

(SDEFUN |GROUPP;outCosetTable|
        ((|ct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|np| #1=(|NonNegativeInteger|)) (% (|OutputForm|)))
        (SPROG
         ((#2=#:G369 NIL) (|part1| #1#) (#3=#:G363 NIL)
          (|part2| (|NonNegativeInteger|))
          (|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |np| 1)
              (PROGN
               (LETT #2# (SPADCALL |ct| (QREFELT % 82)))
               (GO #4=#:G368))))
            (COND
             ((> (SPADCALL |ct| (QREFELT % 83)) |np|)
              (SEQ (LETT |part1| |np|)
                   (LETT |part2|
                         (PROG2
                             (LETT #3#
                                   (SPADCALL (SPADCALL |ct| (QREFELT % 83))
                                             |np| (QREFELT % 85)))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #3#)))
                   (LETT |cts|
                         (SPADCALL |ct| (LIST |part1| |part2|) (QREFELT % 86)))
                   (EXIT (LETT |ct| (SPADCALL |cts| 1 (QREFELT % 88)))))))
            (EXIT (SPADCALL |ct| (QREFELT % 82)))))
          #4# (EXIT #2#)))) 

(SDEFUN |GROUPP;outStatus|
        ((|state|
          (|Record|
           (|:| |coset_table|
                #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
           (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |closed_point| (|NonNegativeInteger|))
           (|:| |number_of_generators| (|NonNegativeInteger|))
           (|:| |number_of_indices| #2=(|NonNegativeInteger|))
           (|:| |number_of_points| (|NonNegativeInteger|))
           (|:| |max_number_of_indices| (|NonNegativeInteger|))))
         (% (|OutputForm|)))
        (SPROG ((|ct| #1#) (|np| #2#))
               (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |np| (QVELT |state| 5))
                    (EXIT (|GROUPP;outCosetTable| |ct| |np| %))))) 

(SDEFUN |GROUPP;find|
        ((|et| (|OneDimensionalArray| (|NonNegativeInteger|)))
         (|ind| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|pj| (|NonNegativeInteger|)) (|nj| (|NonNegativeInteger|))
          (|j| (|NonNegativeInteger|)))
         (SEQ
          (COND ((OR (EQL |ind| 0) (EQL (QAREF1O |et| |ind| 1) |ind|)) |ind|)
                ('T
                 (SEQ (LETT |j| |ind|) (LETT |pj| 0)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |pj| |j|)
                                (EXIT (LETT |j| (QAREF1O |et| |j| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |j| |ind|)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |nj| (QAREF1O |et| |j| 1))
                                (QSETAREF1O |et| |j| |pj| 1)
                                (EXIT (LETT |j| |nj|)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |pj|))))))) 

(SDEFUN |GROUPP;infer_coincidences|
        ((|ct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|et| (|OneDimensionalArray| (|NonNegativeInteger|)))
         (|pb| #1=(|NonNegativeInteger|)) (|pe| #2=(|NonNegativeInteger|))
         (|trace| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|#G134| #2#) (|#G135| #1#) (|nn| (|Integer|)) (#3=#:G393 NIL)
          (|i| NIL) (#4=#:G394 NIL) (|i1| #5=(|NonNegativeInteger|))
          (|i2| #5#))
         (SEQ
          (COND
           (|trace|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL "coincidence: begin=" (QREFELT % 43))
                         (SPADCALL |pb| (QREFELT % 66)) (QREFELT % 42))
               (SPADCALL " end=" (QREFELT % 43)) (QREFELT % 42))
              (SPADCALL |pe| (QREFELT % 66)) (QREFELT % 42))
             (QREFELT % 54))))
          (COND
           ((< |pe| |pb|)
            (PROGN
             (LETT |#G134| |pe|)
             (LETT |#G135| |pb|)
             (LETT |pb| |#G134|)
             (LETT |pe| |#G135|))))
          (QSETAREF1O |et| |pe| |pb| 1)
          (LETT |nn| (SPADCALL |ct| (QREFELT % 89)))
          (SEQ (LETT |i| 1) (LETT #3# |nn|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1))
                    (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1))
                    (EXIT
                     (COND ((EQL |i2| 0) "skip")
                           ((EQL |i1| 0)
                            (QSETAREF2O |ct| |pb| |i| |i2| 1 1)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| 1) (LETT #4# |nn|) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1))
                     (EXIT
                      (COND ((EQL |i1| 0) "skip")
                            ('T
                             (SEQ (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1))
                                  (EXIT
                                   (COND ((EQL |i2| 0) "skip")
                                         ('T
                                          (SEQ
                                           (LETT |i1|
                                                 (|GROUPP;find| |et| |i1| %))
                                           (LETT |i2|
                                                 (|GROUPP;find| |et| |i2| %))
                                           (EXIT
                                            (COND ((EQL |i1| |i2|) "skip")
                                                  ('T
                                                   (|GROUPP;infer_coincidences|
                                                    |ct| |et| |i1| |i2| |trace|
                                                    %)))))))))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |GROUPP;inferFromRelations|
        ((|state|
          (|Record|
           (|:| |coset_table|
                #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
           (|:| |equiv_table|
                #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |inverse_table|
                #3=(|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |closed_point| (|NonNegativeInteger|))
           (|:| |number_of_generators| (|NonNegativeInteger|))
           (|:| |number_of_indices| #4=(|NonNegativeInteger|))
           (|:| |number_of_points| (|NonNegativeInteger|))
           (|:| |max_number_of_indices| (|NonNegativeInteger|))))
         (|rels| (|List| #5=(|List| (|NonNegativeInteger|))))
         (|rrels| (|List| (|List| (|NonNegativeInteger|))))
         (|rel_lens| (|List| (|NonNegativeInteger|))) (|trace| (|Boolean|))
         (% (|Boolean|)))
        (SPROG
         ((|inv_tab| #3#) (|pn| #6=(|NonNegativeInteger|))
          (|closed| (|Boolean|)) (#7=#:G452 NIL) (|r_len| NIL) (#8=#:G456 NIL)
          (|rrel| NIL) (#9=#:G455 NIL) (|rel| NIL) (#10=#:G454 NIL)
          (#11=#:G457 NIL) (#12=#:G451 NIL) (|genIndex| NIL) (#13=#:G458 NIL)
          (|genInv| (|Integer|)) (#14=#:G450 NIL)
          (|ge| #15=(|NonNegativeInteger|)) (|pe| #6#) (#16=#:G459 NIL)
          (#17=#:G460 NIL) (#18=#:G461 NIL) (#19=#:G462 NIL) (|add_to| #15#)
          (|prel| #5#) (#20=#:G453 NIL) (|n_size| (|NonNegativeInteger|))
          (|n_ct_cols| (|Integer|))
          (|nct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (#21=#:G463 NIL) (|j| NIL) (#22=#:G464 NIL) (|i| #6#)
          (#23=#:G465 NIL) (|ct| #1#) (|et| #2#) (|o_size| (|Integer|))
          (|n_ind| #4#) (|add_gen| (|Integer|)) (|gap| (|Integer|)) (|gb| #15#)
          (|pb| #6#) (|genIn| (|Integer|)) (|npe| #24=(|NonNegativeInteger|))
          (|npb| #24#) (#25=#:G449 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |et| (QVELT |state| 1))
                (LETT |n_ind| (QVELT |state| 5))
                (LETT |inv_tab| (QVELT |state| 2))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL "inferFromRelations rels=" (QREFELT % 43))
                    (SPADCALL |rels| (QREFELT % 91)) (QREFELT % 42))
                   (QREFELT % 54))))
                (LETT |add_to| 0) (LETT |add_gen| 0)
                (LETT |pn| (+ (QVELT |state| 3) 1))
                (EXIT
                 (COND ((> |pn| |n_ind|) NIL)
                       ('T
                        (SEQ (QSETVELT |state| 3 |pn|)
                             (COND
                              ((NULL (EQL (QAREF1O |et| |pn| 1) |pn|))
                               (EXIT 'T)))
                             (LETT |o_size| (SPADCALL |ct| (QREFELT % 92)))
                             (LETT |closed| NIL)
                             (SEQ
                              (EXIT
                               (SEQ G190
                                    (COND ((NULL (NULL |closed|)) (GO G191)))
                                    (SEQ (LETT |closed| 'T)
                                         (COND
                                          ((NULL
                                            (EQL (QAREF1O |et| |pn| 1) |pn|))
                                           (EXIT
                                            (PROGN
                                             (LETT #7# |$NoValue|)
                                             (GO #26=#:G445)))))
                                         (SEQ (LETT |r_len| NIL)
                                              (LETT #8# |rel_lens|)
                                              (LETT |rrel| NIL)
                                              (LETT #9# |rrels|)
                                              (LETT |rel| NIL)
                                              (LETT #10# |rels|) G190
                                              (COND
                                               ((OR (ATOM #10#)
                                                    (PROGN
                                                     (LETT |rel| (CAR #10#))
                                                     NIL)
                                                    (ATOM #9#)
                                                    (PROGN
                                                     (LETT |rrel| (CAR #9#))
                                                     NIL)
                                                    (ATOM #8#)
                                                    (PROGN
                                                     (LETT |r_len| (CAR #8#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ (LETT |gb| 0)
                                                   (LETT |pb| |pn|)
                                                   (LETT |i| |pn|)
                                                   (LETT |genIn| 0)
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ (LETT |genIndex| NIL)
                                                          (LETT #11# |rel|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #11#)
                                                                (PROGN
                                                                 (LETT
                                                                  |genIndex|
                                                                  (CAR #11#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |genIn|
                                                                 |genIndex|)
                                                           (LETT |i|
                                                                 (QAREF2O |ct|
                                                                          |i|
                                                                          |genIndex|
                                                                          1 1))
                                                           (EXIT
                                                            (COND
                                                             ((EQL |i| 0)
                                                              (PROGN
                                                               (LETT #12#
                                                                     |$NoValue|)
                                                               (GO
                                                                #27=#:G404)))
                                                             ('T
                                                              (SEQ
                                                               (LETT |i|
                                                                     (|GROUPP;find|
                                                                      |et| |i|
                                                                      %))
                                                               (LETT |gb|
                                                                     (+ |gb|
                                                                        1))
                                                               (EXIT
                                                                (LETT |pb|
                                                                      |i|)))))))
                                                          (LETT #11#
                                                                (CDR #11#))
                                                          (GO G190) G191
                                                          (EXIT NIL)))
                                                    #27# (EXIT #12#))
                                                   (LETT |gap|
                                                         (- |r_len| |gb|))
                                                   (LETT |ge| 0)
                                                   (LETT |pe| |pn|)
                                                   (LETT |i| |pn|)
                                                   (LETT |genInv| 0)
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ (LETT |genIndex| NIL)
                                                          (LETT #13# |rrel|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #13#)
                                                                (PROGN
                                                                 (LETT
                                                                  |genIndex|
                                                                  (CAR #13#))
                                                                 NIL)
                                                                (NULL
                                                                 (< |ge|
                                                                    |gap|)))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |genInv|
                                                                 |genIndex|)
                                                           (LETT |i|
                                                                 (QAREF2O |ct|
                                                                          |i|
                                                                          |genIndex|
                                                                          1 1))
                                                           (EXIT
                                                            (COND
                                                             ((EQL |i| 0)
                                                              (PROGN
                                                               (LETT #14#
                                                                     |$NoValue|)
                                                               (GO
                                                                #28=#:G408)))
                                                             ('T
                                                              (SEQ
                                                               (LETT |i|
                                                                     (|GROUPP;find|
                                                                      |et| |i|
                                                                      %))
                                                               (LETT |ge|
                                                                     (+ |ge|
                                                                        1))
                                                               (EXIT
                                                                (LETT |pe|
                                                                      |i|)))))))
                                                          (LETT #13#
                                                                (CDR #13#))
                                                          (GO G190) G191
                                                          (EXIT NIL)))
                                                    #28# (EXIT #14#))
                                                   (LETT |gap| (- |gap| |ge|))
                                                   (COND
                                                    ((> |gap| 1)
                                                     (SEQ (LETT |add_to| |pb|)
                                                          (LETT |add_gen|
                                                                |genIn|)
                                                          (SEQ
                                                           (COND
                                                            ((>= |n_ind|
                                                                 |o_size|)
                                                             (COND
                                                              ((EQL |n_ind|
                                                                    (QVELT
                                                                     |state|
                                                                     7))
                                                               (PROGN
                                                                (LETT #20# 'T)
                                                                (GO
                                                                 #29=#:G448)))
                                                              ('T
                                                               (SEQ
                                                                (LETT |n_size|
                                                                      (MIN
                                                                       (* 2
                                                                          |o_size|)
                                                                       (QVELT
                                                                        |state|
                                                                        7)))
                                                                (LETT
                                                                 |n_ct_cols|
                                                                 (SPADCALL |ct|
                                                                           (QREFELT
                                                                            %
                                                                            89)))
                                                                (LETT |nct|
                                                                      (SPADCALL
                                                                       |n_size|
                                                                       |n_ct_cols|
                                                                       0
                                                                       (QREFELT
                                                                        % 93)))
                                                                (LETT |net|
                                                                      (SPADCALL
                                                                       |n_size|
                                                                       0
                                                                       (QREFELT
                                                                        % 95)))
                                                                (SEQ
                                                                 (LETT |i| 1)
                                                                 (LETT #16#
                                                                       |o_size|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |i| #16#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (QSETAREF1O
                                                                   |net| |i|
                                                                   (QAREF1O
                                                                    |et| |i| 1)
                                                                   1)
                                                                  (EXIT
                                                                   (SEQ
                                                                    (LETT |j|
                                                                          1)
                                                                    (LETT #17#
                                                                          |n_ct_cols|)
                                                                    G190
                                                                    (COND
                                                                     ((|greater_SI|
                                                                       |j|
                                                                       #17#)
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (QSETAREF2O
                                                                       |nct|
                                                                       |i| |j|
                                                                       (QAREF2O
                                                                        |ct|
                                                                        |i| |j|
                                                                        1 1)
                                                                       1 1)))
                                                                    (LETT |j|
                                                                          (|inc_SI|
                                                                           |j|))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     NIL))))
                                                                 (LETT |i|
                                                                       (|inc_SI|
                                                                        |i|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (SEQ
                                                                 (LETT |i|
                                                                       (+
                                                                        |o_size|
                                                                        1))
                                                                 (LETT #18#
                                                                       |n_size|)
                                                                 G190
                                                                 (COND
                                                                  ((> |i| #18#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (QSETAREF1O
                                                                    |net| |i|
                                                                    |i| 1)))
                                                                 (LETT |i|
                                                                       (+ |i|
                                                                          1))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (LETT |ct|
                                                                      |nct|)
                                                                (LETT |et|
                                                                      |net|)
                                                                (LETT |o_size|
                                                                      |n_size|)
                                                                (QSETVELT
                                                                 |state| 0
                                                                 |ct|)
                                                                (EXIT
                                                                 (QSETVELT
                                                                  |state| 1
                                                                  |et|)))))))
                                                           (LETT |n_ind|
                                                                 (+ |n_ind| 1))
                                                           (COND
                                                            (|trace|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    #30="adding action of "
                                                                    (QREFELT %
                                                                             43))
                                                                   (SPADCALL
                                                                    |add_gen|
                                                                    (QREFELT %
                                                                             96))
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL
                                                                   #31=" on "
                                                                   (QREFELT %
                                                                            43))
                                                                  (QREFELT %
                                                                           42))
                                                                 (SPADCALL
                                                                  |add_to|
                                                                  (QREFELT %
                                                                           66))
                                                                 (QREFELT %
                                                                          42))
                                                                (SPADCALL
                                                                 #32=" to be "
                                                                 (QREFELT %
                                                                          43))
                                                                (QREFELT % 42))
                                                               (SPADCALL
                                                                |n_ind|
                                                                (QREFELT % 66))
                                                               (QREFELT % 42))
                                                              (QREFELT % 54))))
                                                           (QSETAREF2O |ct|
                                                                       |add_to|
                                                                       |add_gen|
                                                                       |n_ind|
                                                                       1 1)
                                                           (LETT |add_gen|
                                                                 (SPADCALL
                                                                  |inv_tab|
                                                                  |add_gen|
                                                                  (QREFELT %
                                                                           97)))
                                                           (QSETAREF2O |ct|
                                                                       |n_ind|
                                                                       |add_gen|
                                                                       |add_to|
                                                                       1 1)
                                                           (COND
                                                            (|trace|
                                                             (SPADCALL
                                                              (|GROUPP;outStatus|
                                                               |state| %)
                                                              (QREFELT % 54))))
                                                           (EXIT
                                                            (QSETVELT |state| 5
                                                                      |n_ind|)))
                                                          (LETT |gap|
                                                                (- |gap| 1))
                                                          (LETT |prel| |rel|)
                                                          (SEQ (LETT |i| 0)
                                                               (LETT #19# |gb|)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |i| #19#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT |prel|
                                                                       (CDR
                                                                        |prel|))))
                                                               (LETT |i|
                                                                     (|inc_SI|
                                                                      |i|))
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                          (LETT |gb|
                                                                (+ |gb| 1))
                                                          (SEQ G190
                                                               (COND
                                                                ((NULL
                                                                  (> |gap| 1))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (LETT |add_to|
                                                                      |n_ind|)
                                                                (LETT |add_gen|
                                                                      (|SPADfirst|
                                                                       |prel|))
                                                                (LETT |prel|
                                                                      (CDR
                                                                       |prel|))
                                                                (SEQ
                                                                 (COND
                                                                  ((>= |n_ind|
                                                                       |o_size|)
                                                                   (COND
                                                                    ((EQL
                                                                      |n_ind|
                                                                      (QVELT
                                                                       |state|
                                                                       7))
                                                                     (PROGN
                                                                      (LETT
                                                                       #20# 'T)
                                                                      (GO
                                                                       #29#)))
                                                                    ('T
                                                                     (SEQ
                                                                      (LETT
                                                                       |n_size|
                                                                       (MIN
                                                                        (* 2
                                                                           |o_size|)
                                                                        (QVELT
                                                                         |state|
                                                                         7)))
                                                                      (LETT
                                                                       |n_ct_cols|
                                                                       (SPADCALL
                                                                        |ct|
                                                                        (QREFELT
                                                                         %
                                                                         89)))
                                                                      (LETT
                                                                       |nct|
                                                                       (SPADCALL
                                                                        |n_size|
                                                                        |n_ct_cols|
                                                                        0
                                                                        (QREFELT
                                                                         %
                                                                         93)))
                                                                      (LETT
                                                                       |net|
                                                                       (SPADCALL
                                                                        |n_size|
                                                                        0
                                                                        (QREFELT
                                                                         %
                                                                         95)))
                                                                      (SEQ
                                                                       (LETT
                                                                        |i| 1)
                                                                       (LETT
                                                                        #21#
                                                                        |o_size|)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |i|
                                                                          #21#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (QSETAREF1O
                                                                         |net|
                                                                         |i|
                                                                         (QAREF1O
                                                                          |et|
                                                                          |i|
                                                                          1)
                                                                         1)
                                                                        (EXIT
                                                                         (SEQ
                                                                          (LETT
                                                                           |j|
                                                                           1)
                                                                          (LETT
                                                                           #22#
                                                                           |n_ct_cols|)
                                                                          G190
                                                                          (COND
                                                                           ((|greater_SI|
                                                                             |j|
                                                                             #22#)
                                                                            (GO
                                                                             G191)))
                                                                          (SEQ
                                                                           (EXIT
                                                                            (QSETAREF2O
                                                                             |nct|
                                                                             |i|
                                                                             |j|
                                                                             (QAREF2O
                                                                              |ct|
                                                                              |i|
                                                                              |j|
                                                                              1
                                                                              1)
                                                                             1
                                                                             1)))
                                                                          (LETT
                                                                           |j|
                                                                           (|inc_SI|
                                                                            |j|))
                                                                          (GO
                                                                           G190)
                                                                          G191
                                                                          (EXIT
                                                                           NIL))))
                                                                       (LETT
                                                                        |i|
                                                                        (|inc_SI|
                                                                         |i|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (SEQ
                                                                       (LETT
                                                                        |i|
                                                                        (+
                                                                         |o_size|
                                                                         1))
                                                                       (LETT
                                                                        #23#
                                                                        |n_size|)
                                                                       G190
                                                                       (COND
                                                                        ((> |i|
                                                                            #23#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (QSETAREF1O
                                                                          |net|
                                                                          |i|
                                                                          |i|
                                                                          1)))
                                                                       (LETT
                                                                        |i|
                                                                        (+ |i|
                                                                           1))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (LETT
                                                                       |ct|
                                                                       |nct|)
                                                                      (LETT
                                                                       |et|
                                                                       |net|)
                                                                      (LETT
                                                                       |o_size|
                                                                       |n_size|)
                                                                      (QSETVELT
                                                                       |state|
                                                                       0 |ct|)
                                                                      (EXIT
                                                                       (QSETVELT
                                                                        |state|
                                                                        1
                                                                        |et|)))))))
                                                                 (LETT |n_ind|
                                                                       (+
                                                                        |n_ind|
                                                                        1))
                                                                 (COND
                                                                  (|trace|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          #30#
                                                                          (QREFELT
                                                                           %
                                                                           43))
                                                                         (SPADCALL
                                                                          |add_gen|
                                                                          (QREFELT
                                                                           %
                                                                           96))
                                                                         (QREFELT
                                                                          %
                                                                          42))
                                                                        (SPADCALL
                                                                         #31#
                                                                         (QREFELT
                                                                          %
                                                                          43))
                                                                        (QREFELT
                                                                         % 42))
                                                                       (SPADCALL
                                                                        |add_to|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (QREFELT
                                                                        % 42))
                                                                      (SPADCALL
                                                                       #32#
                                                                       (QREFELT
                                                                        % 43))
                                                                      (QREFELT
                                                                       % 42))
                                                                     (SPADCALL
                                                                      |n_ind|
                                                                      (QREFELT
                                                                       % 66))
                                                                     (QREFELT %
                                                                              42))
                                                                    (QREFELT %
                                                                             54))))
                                                                 (QSETAREF2O
                                                                  |ct| |add_to|
                                                                  |add_gen|
                                                                  |n_ind| 1 1)
                                                                 (LETT
                                                                  |add_gen|
                                                                  (SPADCALL
                                                                   |inv_tab|
                                                                   |add_gen|
                                                                   (QREFELT %
                                                                            97)))
                                                                 (QSETAREF2O
                                                                  |ct| |n_ind|
                                                                  |add_gen|
                                                                  |add_to| 1 1)
                                                                 (COND
                                                                  (|trace|
                                                                   (SPADCALL
                                                                    (|GROUPP;outStatus|
                                                                     |state| %)
                                                                    (QREFELT %
                                                                             54))))
                                                                 (EXIT
                                                                  (QSETVELT
                                                                   |state| 5
                                                                   |n_ind|)))
                                                                (LETT |gap|
                                                                      (- |gap|
                                                                         1))
                                                                (EXIT
                                                                 (LETT |gb|
                                                                       (+ |gb|
                                                                          1))))
                                                               NIL (GO G190)
                                                               G191 (EXIT NIL))
                                                          (LETT |pb| |n_ind|)
                                                          (EXIT
                                                           (LETT |genIn|
                                                                 (|SPADfirst|
                                                                  |prel|))))))
                                                   (EXIT
                                                    (COND
                                                     ((EQL |gap| 1)
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ
                                                         (SEQ
                                                          (LETT |npe|
                                                                (QAREF2O |ct|
                                                                         |pb|
                                                                         |genIn|
                                                                         1 1))
                                                          (EXIT
                                                           (COND
                                                            ((NULL
                                                              (EQL |npe| 0))
                                                             (PROGN
                                                              (LETT #25#
                                                                    (COND
                                                                     ((EQL
                                                                       |npe|
                                                                       |pe|)
                                                                      "skip")
                                                                     ('T
                                                                      (SEQ
                                                                       (COND
                                                                        (|trace|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (SPADCALL
                                                                                  "coincidence: "
                                                                                  (QREFELT
                                                                                   %
                                                                                   43))
                                                                                 (SPADCALL
                                                                                  |pe|
                                                                                  (QREFELT
                                                                                   %
                                                                                   66))
                                                                                 (QREFELT
                                                                                  %
                                                                                  42))
                                                                                (SPADCALL
                                                                                 " "
                                                                                 (QREFELT
                                                                                  %
                                                                                  43))
                                                                                (QREFELT
                                                                                 %
                                                                                 42))
                                                                               (SPADCALL
                                                                                |npe|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (QREFELT
                                                                                %
                                                                                42))
                                                                              (SPADCALL
                                                                               " rel = "
                                                                               (QREFELT
                                                                                %
                                                                                43))
                                                                              (QREFELT
                                                                               %
                                                                               42))
                                                                             (SPADCALL
                                                                              |rel|
                                                                              (QREFELT
                                                                               %
                                                                               98))
                                                                             (QREFELT
                                                                              %
                                                                              42))
                                                                            (SPADCALL
                                                                             " pn = "
                                                                             (QREFELT
                                                                              %
                                                                              43))
                                                                            (QREFELT
                                                                             %
                                                                             42))
                                                                           (SPADCALL
                                                                            |pn|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            42))
                                                                          (QREFELT
                                                                           %
                                                                           54))))
                                                                       (EXIT
                                                                        (|GROUPP;infer_coincidences|
                                                                         |ct|
                                                                         |et|
                                                                         |pe|
                                                                         |npe|
                                                                         |trace|
                                                                         %))))))
                                                              (GO
                                                               #33=#:G440))))))
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                "inferFromRelations genIn="
                                                                (QREFELT % 43))
                                                               (SPADCALL
                                                                |genIn|
                                                                (QREFELT % 96))
                                                               (QREFELT % 42))
                                                              (SPADCALL " gb="
                                                                        (QREFELT
                                                                         % 43))
                                                              (QREFELT % 42))
                                                             (SPADCALL |gb|
                                                                       (QREFELT
                                                                        % 66))
                                                             (QREFELT % 42))
                                                            (QREFELT % 54))))
                                                         (COND
                                                          ((NULL
                                                            (EQL
                                                             (QAREF1O |inv_tab|
                                                                      |genIn|
                                                                      1)
                                                             |genInv|))
                                                           (EXIT
                                                            (|error|
                                                             "impossible 3"))))
                                                         (QSETAREF2O |ct| |pb|
                                                                     |genIn|
                                                                     |pe| 1 1)
                                                         (SEQ
                                                          (LETT |npb|
                                                                (QAREF2O |ct|
                                                                         |pe|
                                                                         |genInv|
                                                                         1 1))
                                                          (EXIT
                                                           (COND
                                                            ((NULL
                                                              (EQL |npb| 0))
                                                             (PROGN
                                                              (LETT #25#
                                                                    (COND
                                                                     ((EQL
                                                                       |npb|
                                                                       |pb|)
                                                                      "skip")
                                                                     ('T
                                                                      (SEQ
                                                                       (COND
                                                                        (|trace|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (SPADCALL
                                                                                  "coincidence: "
                                                                                  (QREFELT
                                                                                   %
                                                                                   43))
                                                                                 (SPADCALL
                                                                                  |npb|
                                                                                  (QREFELT
                                                                                   %
                                                                                   66))
                                                                                 (QREFELT
                                                                                  %
                                                                                  42))
                                                                                (SPADCALL
                                                                                 " "
                                                                                 (QREFELT
                                                                                  %
                                                                                  43))
                                                                                (QREFELT
                                                                                 %
                                                                                 42))
                                                                               (SPADCALL
                                                                                |pb|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (QREFELT
                                                                                %
                                                                                42))
                                                                              (SPADCALL
                                                                               " rel = "
                                                                               (QREFELT
                                                                                %
                                                                                43))
                                                                              (QREFELT
                                                                               %
                                                                               42))
                                                                             (SPADCALL
                                                                              |rel|
                                                                              (QREFELT
                                                                               %
                                                                               98))
                                                                             (QREFELT
                                                                              %
                                                                              42))
                                                                            (SPADCALL
                                                                             " pn = "
                                                                             (QREFELT
                                                                              %
                                                                              43))
                                                                            (QREFELT
                                                                             %
                                                                             42))
                                                                           (SPADCALL
                                                                            |pn|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            42))
                                                                          (QREFELT
                                                                           %
                                                                           54))))
                                                                       (EXIT
                                                                        (|GROUPP;infer_coincidences|
                                                                         |ct|
                                                                         |et|
                                                                         |pb|
                                                                         |npb|
                                                                         |trace|
                                                                         %))))))
                                                              (GO #33#))))))
                                                         (EXIT
                                                          (QSETAREF2O |ct| |pe|
                                                                      |genInv|
                                                                      |pb| 1
                                                                      1))))
                                                       #33# (EXIT #25#)))
                                                     ((EQL |gap| 0)
                                                      (COND
                                                       ((EQL |pb| |pe|) "skip")
                                                       ('T
                                                        (SEQ
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    "coincidence: "
                                                                    (QREFELT %
                                                                             43))
                                                                   (SPADCALL
                                                                    |pb|
                                                                    (QREFELT %
                                                                             66))
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL " "
                                                                            (QREFELT
                                                                             %
                                                                             43))
                                                                  (QREFELT %
                                                                           42))
                                                                 (SPADCALL |pe|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                 (QREFELT %
                                                                          42))
                                                                (SPADCALL
                                                                 " rel = "
                                                                 (QREFELT %
                                                                          43))
                                                                (QREFELT % 42))
                                                               (SPADCALL |rel|
                                                                         (QREFELT
                                                                          %
                                                                          98))
                                                               (QREFELT % 42))
                                                              (SPADCALL
                                                               " pn = "
                                                               (QREFELT % 43))
                                                              (QREFELT % 42))
                                                             (SPADCALL |pn|
                                                                       (QREFELT
                                                                        % 66))
                                                             (QREFELT % 42))
                                                            (QREFELT % 54))))
                                                         (EXIT
                                                          (|GROUPP;infer_coincidences|
                                                           |ct| |et| |pb| |pe|
                                                           |trace| %))))))
                                                     ('T
                                                      (|error|
                                                       "impossible 4")))))
                                              (LETT #10#
                                                    (PROG1 (CDR #10#)
                                                      (LETT #9#
                                                            (PROG1 (CDR #9#)
                                                              (LETT #8#
                                                                    (CDR
                                                                     #8#))))))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (COND
                                           ((NULL |closed|)
                                            (|error| "impossible 5")))))
                                    NIL (GO G190) G191 (EXIT NIL)))
                              #26# (EXIT #7#))
                             (EXIT 'T)))))))
          #29# (EXIT #20#)))) 

(SDEFUN |GROUPP;invertMap|
        ((|a| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (% (|TwoDimensionalArray| (|NonNegativeInteger|))))
        (SPROG
         ((|invm| (|TwoDimensionalArray| (|NonNegativeInteger|))) (|x| NIL)
          (#1=#:G471 NIL) (|i| (|NonNegativeInteger|)))
         (SEQ
          (LETT |invm|
                (SPADCALL (SPADCALL |a| (QREFELT % 83))
                          (SPADCALL |a| (QREFELT % 99)) 0 (QREFELT % 93)))
          (SEQ (LETT |x| 1) (LETT #1# (SPADCALL |a| (QREFELT % 83))) G190
               (COND ((|greater_SI| |x| #1#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |a| |x| 1 (QREFELT % 100)))
                    (EXIT
                     (COND
                      ((SPADCALL |i| 0 (QREFELT % 58))
                       (SPADCALL |invm| |i| 1 |x| (QREFELT % 101))))))
               (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
          (EXIT |invm|)))) 

(SDEFUN |GROUPP;relatorTables|
        ((|state|
          (|Record|
           (|:| |coset_table|
                #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
           (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |closed_point| (|NonNegativeInteger|))
           (|:| |number_of_generators| (|NonNegativeInteger|))
           (|:| |number_of_indices| #2=(|NonNegativeInteger|))
           (|:| |number_of_points| (|NonNegativeInteger|))
           (|:| |max_number_of_indices| (|NonNegativeInteger|))))
         (|rels| (|List| (|List| (|Integer|))))
         (% (|List| (|TwoDimensionalArray| (|NonNegativeInteger|)))))
        (SPROG
         ((|ct| #1#) (|np| #2#) (#3=#:G474 NIL)
          (|genLists| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#4=#:G492 NIL) (|a| NIL) (#5=#:G493 NIL)
          (|invGenLists|
           (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|r| NIL) (#6=#:G494 NIL) (|g| NIL) (#7=#:G495 NIL) (#8=#:G479 NIL)
          (|gNum| (|NonNegativeInteger|))
          (|relatorn| #9=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|fst| (|Boolean|))
          (|relator| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|part1| #2#) (#10=#:G484 NIL) (|part2| (|NonNegativeInteger|))
          (|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|relatorTrim| #9#)
          (|relators| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|)))))
         (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |np| (QVELT |state| 5))
              (LETT |genLists|
                    (SPADCALL |ct|
                              (PROG1 (LETT #3# (SPADCALL |ct| (QREFELT % 99)))
                                (|check_subtype2| (> #3# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|) #3#))
                              (QREFELT % 102)))
              (LETT |invGenLists|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |a| NIL) (LETT #5# |genLists|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (|GROUPP;invertMap| |a| %) #4#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |relators| NIL)
              (SEQ (LETT |r| NIL) (LETT #6# |rels|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |r| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |relator| (SPADCALL 0 0 0 (QREFELT % 93)))
                        (LETT |fst| 'T)
                        (SEQ (LETT |g| NIL) (LETT #7# |r|) G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gNum|
                                    (PROG1 (LETT #8# (ABS |g|))
                                      (|check_subtype2| (>= #8# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #8#)))
                              (LETT |relatorn|
                                    (COND
                                     ((> |g| 0)
                                      (SPADCALL |genLists| |gNum|
                                                (QREFELT % 88)))
                                     ('T
                                      (SPADCALL |invGenLists| |gNum|
                                                (QREFELT % 88)))))
                              (EXIT
                               (COND
                                (|fst|
                                 (SEQ (LETT |relator| |relatorn|)
                                      (EXIT (LETT |fst| NIL))))
                                ('T
                                 (LETT |relator|
                                       (SPADCALL |relator| |relatorn|
                                                 (QREFELT % 103)))))))
                             (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                        (LETT |relatorTrim| |relator|)
                        (COND
                         ((> (SPADCALL |relatorTrim| (QREFELT % 83)) |np|)
                          (SEQ (LETT |part1| |np|)
                               (LETT |part2|
                                     (PROG2
                                         (LETT #10#
                                               (SPADCALL
                                                (SPADCALL |relatorTrim|
                                                          (QREFELT % 83))
                                                |np| (QREFELT % 85)))
                                         (QCDR #10#)
                                       (|check_union2| (QEQCAR #10# 0)
                                                       (|NonNegativeInteger|)
                                                       (|Union|
                                                        (|NonNegativeInteger|)
                                                        "failed")
                                                       #10#)))
                               (LETT |cts|
                                     (SPADCALL |relatorTrim|
                                               (LIST |part1| |part2|)
                                               (QREFELT % 86)))
                               (EXIT
                                (LETT |relatorTrim|
                                      (SPADCALL |cts| 1 (QREFELT % 88)))))))
                        (EXIT
                         (LETT |relators|
                               (SPADCALL |relators| |relatorTrim|
                                         (QREFELT % 104)))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |relators|)))) 

(SDEFUN |GROUPP;generators2Permutation|
        ((|state|
          (|Record|
           (|:| |coset_table|
                #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
           (|:| |equiv_table|
                #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
           (|:| |closed_point| (|NonNegativeInteger|))
           (|:| |number_of_generators| #3=(|NonNegativeInteger|))
           (|:| |number_of_indices| #4=(|NonNegativeInteger|))
           (|:| |number_of_points| (|NonNegativeInteger|))
           (|:| |max_number_of_indices| (|NonNegativeInteger|))))
         (|trace| (|Boolean|)) (% (|PermutationGroup| (|Integer|))))
        (SPROG
         ((|ct| #1#) (|n_gens| #3#) (|n_inds| #4#) (|et| #2#)
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (#5=#:G516 NIL) (|perm_lists| (|Vector| (|List| (|Integer|))))
          (|i| NIL) (#6=#:G517 NIL) (#7=#:G518 NIL)
          (|kk| (|NonNegativeInteger|)) (|j| (|SingleInteger|)) (#8=#:G519 NIL)
          (|gl| (|List| (|Integer|))) (|p| (|Permutation| (|Integer|)))
          (|pl| (|List| (|Permutation| (|Integer|)))))
         (SEQ (LETT |ct| (QVELT |state| 0))
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL "generators2Permutation generators=" (QREFELT % 43))
                 (QREFELT % 54))))
              (LETT |n_gens| (QVELT |state| 4))
              (LETT |n_inds| (QVELT |state| 5)) (LETT |et| (QVELT |state| 1))
              (LETT |net| (SPADCALL |n_inds| 0 (QREFELT % 95))) (LETT |j| 0)
              (SEQ (LETT |i| 1) (LETT #5# |n_inds|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                           ('T
                            (SEQ (LETT |j| (|add_SI| |j| 1))
                                 (EXIT (QSETAREF1O |net| |i| |j| 1)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |perm_lists| (MAKEARR1 |n_gens| NIL))
              (SEQ (LETT |i| 1) (LETT #6# |n_inds|) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                           ('T
                            (SEQ (LETT |j| 1) (LETT #7# |n_gens|) G190
                                 (COND ((|greater_SI| |j| #7#) (GO G191)))
                                 (SEQ (LETT |kk| (QAREF2O |ct| |i| |j| 1 1))
                                      (EXIT
                                       (COND
                                        ((EQL |kk| 0)
                                         (SEQ
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL "i = "
                                                          (QREFELT % 43))
                                                (SPADCALL |i| (QREFELT % 66))
                                                (QREFELT % 42))
                                               (SPADCALL " j = "
                                                         (QREFELT % 43))
                                               (QREFELT % 42))
                                              (SPADCALL |j| (QREFELT % 66))
                                              (QREFELT % 42))
                                             (SPADCALL " ct(i) = "
                                                       (QREFELT % 43))
                                             (QREFELT % 42))
                                            (SPADCALL
                                             (SPADCALL |ct| |i|
                                                       (QREFELT % 105))
                                             (QREFELT % 106))
                                            (QREFELT % 42))
                                           (QREFELT % 54))
                                          (EXIT
                                           (|error|
                                            "incomplete coset table"))))
                                        ('T
                                         (SEQ
                                          (LETT |kk|
                                                (QAREF1O |net|
                                                         (|GROUPP;find| |et|
                                                          |kk| %)
                                                         1))
                                          (EXIT
                                           (QSETAREF1O |perm_lists| |j|
                                                       (CONS |kk|
                                                             (QAREF1O
                                                              |perm_lists| |j|
                                                              1))
                                                       1)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |pl| NIL)
              (COND
               (|trace|
                (SPADCALL (SPADCALL |perm_lists| (QREFELT % 108))
                          (QREFELT % 54))))
              (SEQ (LETT |j| 1) (LETT #8# |n_gens|) G190
                   (COND ((|greater_SI| |j| #8#) (GO G191)))
                   (SEQ
                    (LETT |gl|
                          (NREVERSE
                           (SPADCALL |perm_lists| |j| (QREFELT % 109))))
                    (LETT |p| (SPADCALL |gl| (QREFELT % 111)))
                    (EXIT (LETT |pl| (CONS |p| |pl|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |pl| (NREVERSE |pl|))
              (EXIT (SPADCALL |pl| (QREFELT % 114)))))) 

(SDEFUN |GROUPP;toPermutationIfCan;%U;46|
        ((|a| (%)) (% (|Union| (|PermutationGroup| (|Integer|)) "failed")))
        (SPADCALL |a| NIL (QREFELT % 116))) 

(SDEFUN |GROUPP;toPermutationIfCan;%BU;47|
        ((|a| (%)) (|trace| (|Boolean|))
         (% (|Union| (|PermutationGroup| (|Integer|)) "failed")))
        (SPADCALL |a| NIL |trace| (QREFELT % 118))) 

(SDEFUN |GROUPP;convert_words|
        ((|words| (|List| (|List| #1=(|Integer|))))
         (|inv_tab| (|OneDimensionalArray| (|NonNegativeInteger|)))
         (% (|List| (|List| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|word| NIL) (#2=#:G541 NIL) (#3=#:G542 NIL) (|gen| #1#)
          (|nword| (|List| (|NonNegativeInteger|))) (#4=#:G543 NIL) (|i| NIL)
          (#5=#:G544 NIL) (|nwords| (|List| (|List| (|NonNegativeInteger|))))
          (|nrwords| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |nwords| NIL) (LETT |nrwords| NIL)
              (SEQ (LETT |word| NIL) (LETT #2# |words|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |word| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nword| NIL)
                        (SEQ (LETT |i| NIL) (LETT #3# |word|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gen|
                                    (COND ((> |i| 0) |i|)
                                          ('T
                                           (SPADCALL |inv_tab| (- |i|)
                                                     (QREFELT % 97)))))
                              (EXIT (LETT |nword| (CONS |gen| |nword|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |nwords| (CONS |nword| |nwords|))
                        (EXIT
                         (LETT |nrwords|
                               (CONS
                                (NREVERSE
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT |i| NIL) (LETT #5# |nword|) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN (LETT |i| (CAR #5#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (SPADCALL |inv_tab| |i|
                                                          (QREFELT % 97))
                                                #4#))))
                                       (LETT #5# (CDR #5#)) (GO G190) G191
                                       (EXIT (NREVERSE #4#)))))
                                |nrwords|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |nwords| (NREVERSE |nwords|))
              (LETT |nrwords| (NREVERSE |nrwords|))
              (EXIT (LIST |nwords| |nrwords|))))) 

(SDEFUN |GROUPP;toPermutationIfCan;%LBU;49|
        ((|a| (%)) (|sg| (|List| (|List| (|Integer|)))) (|trace| (|Boolean|))
         (% (|Union| (|PermutationGroup| (|Integer|)) "failed")))
        (SPROG
         ((|gs| (|List| (|NonNegativeInteger|)))
          (|rs| (|List| (|List| (|Integer|))))
          (|unit| (|Permutation| (|Integer|)))
          (|numGens| #1=(|NonNegativeInteger|))
          (|ct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|et| #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|inv_tab| #2#) (|i| NIL) (#3=#:G572 NIL)
          (|#G185| #4=(|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|nrels| NIL) (|#G186| #4#) (|nrrels| NIL) (#5=#:G573 NIL)
          (|rel| NIL) (#6=#:G574 NIL)
          (|rel_lens| (|List| (|NonNegativeInteger|)))
          (|loopLimit| (|NonNegativeInteger|))
          (|state|
           (|Record|
            (|:| |coset_table| (|TwoDimensionalArray| (|NonNegativeInteger|)))
            (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |inverse_table|
                 (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |closed_point| (|NonNegativeInteger|))
            (|:| |number_of_generators| (|NonNegativeInteger|))
            (|:| |number_of_indices| (|NonNegativeInteger|))
            (|:| |number_of_points| (|NonNegativeInteger|))
            (|:| |max_number_of_indices| (|NonNegativeInteger|))))
          (|#G190| #4#) (|nsgens| NIL) (|#G191| #4#) (|nrsgens| NIL)
          (#7=#:G575 NIL) (|word| NIL) (#8=#:G576 NIL)
          (|sgens_lens| (|List| #1#)) (|changedByDeduction| (|Boolean|))
          (#9=#:G571 NIL) (#10=#:G570 NIL) (#11=#:G569 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gs| (SPADCALL (QCAR |a|) (QREFELT % 17)))
                (LETT |rs| (QCDR |a|))
                (COND
                 ((EQL (SPADCALL |gs| (QREFELT % 62)) 0)
                  (COND
                   ((EQL (LENGTH |rs|) 0)
                    (SEQ (LETT |unit| (|spadConstant| % 119))
                         (EXIT
                          (PROGN
                           (LETT #9#
                                 (CONS 0
                                       (SPADCALL (LIST |unit|)
                                                 (QREFELT % 114))))
                           (GO #12=#:G568))))))))
                (COND
                 ((> (SPADCALL |gs| (QREFELT % 62)) (LENGTH |rs|))
                  (PROGN (LETT #9# (CONS 1 "failed")) (GO #12#))))
                (LETT |numGens| (SPADCALL |gs| (QREFELT % 62)))
                (LETT |ct| (SPADCALL 10 (* 2 |numGens|) 0 (QREFELT % 93)))
                (LETT |et| (SPADCALL 10 0 (QREFELT % 95)))
                (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 10) (GO G191)))
                     (SEQ (EXIT (QSETAREF1O |et| |i| |i| 1)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |inv_tab| (SPADCALL (* 2 |numGens|) 0 (QREFELT % 95)))
                (SEQ (LETT |i| 1) (LETT #3# |numGens|) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ (QSETAREF1O |inv_tab| |i| (+ |i| |numGens|) 1)
                          (EXIT
                           (QSETAREF1O |inv_tab| (+ |i| |numGens|) |i| 1)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (PROGN
                 (LETT |#G185| (|GROUPP;convert_words| |rs| |inv_tab| %))
                 (LETT |#G186| |#G185|)
                 (LETT |nrels| (|SPADfirst| |#G186|))
                 (LETT |#G186| (CDR |#G186|))
                 (LETT |nrrels| (|SPADfirst| |#G186|))
                 |#G185|)
                (LETT |rel_lens|
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |rel| NIL) (LETT #6# |nrels|) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |rel| (CAR #6#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #5#
                                    (CONS (SPADCALL |rel| (QREFELT % 62))
                                          #5#))))
                            (LETT #6# (CDR #6#)) (GO G190) G191
                            (EXIT (NREVERSE #5#)))))
                (LETT |loopLimit| (|quotient_INT| 5000000 |numGens|))
                (LETT |state|
                      (VECTOR |ct| |et| |inv_tab| 0 |numGens| 1 1 |loopLimit|))
                (PROGN
                 (LETT |#G190| (|GROUPP;convert_words| |sg| |inv_tab| %))
                 (LETT |#G191| |#G190|)
                 (LETT |nsgens| (|SPADfirst| |#G191|))
                 (LETT |#G191| (CDR |#G191|))
                 (LETT |nrsgens| (|SPADfirst| |#G191|))
                 |#G190|)
                (LETT |sgens_lens|
                      (PROGN
                       (LETT #7# NIL)
                       (SEQ (LETT |word| NIL) (LETT #8# |nsgens|) G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |word| (CAR #8#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS (SPADCALL |word| (QREFELT % 62))
                                          #7#))))
                            (LETT #8# (CDR #8#)) (GO G190) G191
                            (EXIT (NREVERSE #7#)))))
                (|GROUPP;inferFromRelations| |state|
                 (SPADCALL |nsgens| |nrels| (QREFELT % 120))
                 (SPADCALL |nrsgens| |nrrels| (QREFELT % 120))
                 (SPADCALL |sgens_lens| |rel_lens| (QREFELT % 74)) |trace| %)
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ
                          (LETT |changedByDeduction|
                                (|GROUPP;inferFromRelations| |state| |nrels|
                                 |nrrels| |rel_lens| |trace| %))
                          (COND
                           ((NULL |changedByDeduction|)
                            (SEQ
                             (COND
                              (|trace|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL "finished using " (QREFELT % 43))
                                 (SPADCALL (QVELT |state| 5) (QREFELT % 66))
                                 (QREFELT % 42))
                                (QREFELT % 54))))
                             (EXIT
                              (PROGN
                               (LETT #9#
                                     (CONS 0
                                           (|GROUPP;generators2Permutation|
                                            |state| |trace| %)))
                               (GO #12#))))))
                          (COND
                           (|trace|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL "relatorTables=" (QREFELT % 43))
                              (SPADCALL (|GROUPP;relatorTables| |state| |rs| %)
                                        (QREFELT % 121))
                              (QREFELT % 42))
                             (QREFELT % 54))))
                          (EXIT
                           (COND
                            ((>= (QVELT |state| 5) |loopLimit|)
                             (PROGN
                              (LETT #11# (PROGN (LETT #10# 1) (GO #13=#:G566)))
                              (GO #14=#:G565)))))))
                        #14# (EXIT #11#))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #13# (EXIT #10#))
                (EXIT (CONS 1 "failed"))))
          #12# (EXIT #9#)))) 

(SDEFUN |GROUPP;coerce;%Of;50| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|ps| (|List| (|NonNegativeInteger|))) (|g| (|OutputForm|))
          (|rs| (|List| (|List| (|Integer|)))) (|r| (|OutputForm|)))
         (SEQ (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT % 122)))
              (LETT |g| (|GROUPP;outputGenList| |ps| %)) (LETT |rs| (QCDR |s|))
              (LETT |r| (|GROUPP;outputRelList| |rs| %))
              (EXIT
               (SPADCALL
                (LIST (SPADCALL "<" (QREFELT % 43)) |g|
                      (SPADCALL " | " (QREFELT % 43)) |r|
                      (SPADCALL ">" (QREFELT % 43)))
                (QREFELT % 44)))))) 

(DECLAIM (NOTINLINE |GroupPresentation;|)) 

(DEFUN |GroupPresentation;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GroupPresentation|))
          (LETT % (GETREFV 123))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GroupPresentation| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record|
                     (|:| |gens| (|PrimitiveArray| (|NonNegativeInteger|)))
                     (|:| |rels| (|List| (|List| (|Integer|))))))
          %))) 

(DEFUN |GroupPresentation| ()
  (SPROG NIL
         (PROG (#1=#:G580)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GroupPresentation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GroupPresentation|
                             (LIST
                              (CONS NIL (CONS 1 (|GroupPresentation;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GroupPresentation|)))))))))) 

(MAKEPROP '|GroupPresentation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 18) (|PrimitiveArray| 18)
              (0 . |construct|) (|List| 24) |GROUPP;groupPresentation;LL%;1|
              |GROUPP;groupPresentation;L%;2| |GROUPP;groupPresentation;%;3|
              (|List| %) (|String|) (5 . |concat|) (10 . |entries|)
              (|NonNegativeInteger|) (15 . |#|)
              (|Record| (|:| |OldGen| 18) (|:| |NewGen| 18)) (|List| 20)
              (20 . |concat|) (|Integer|) (|List| 23) (26 . |concat|)
              (32 . |concat|) |GROUPP;refactor;2%;5| (|Set| 18) (38 . |set|)
              (|Boolean|) (43 . ~=) (49 . |entries|) (|Set| 24) (54 . |set|)
              (59 . =) |GROUPP;=;2%B;6| (|Character|) (65 . |elt|)
              (|OutputForm|) (71 . |coerce|) (76 . |outputForm|)
              (81 . |hconcat|) (87 . |message|) (92 . |hconcat|) (|List| 39)
              (97 . |concat|) (103 . |commaSeparate|) (108 . |blankSeparate|)
              (113 . |member?|) (119 . |concat|) (125 . |remove|)
              (131 . |remove|) (|Void|) (137 . |print|) (142 . |second|)
              (147 . |sign|) (152 . ~=) (158 . ~=) (164 . =) (170 . |copy|)
              (175 . |coerce|) (180 . |#|) (185 . |elt|) (191 . |elt|)
              |GROUPP;coerce;%Of;50| (197 . |coerce|) (202 . |concat|)
              |GROUPP;simplify;%B%;30| |GROUPP;simplify;2%;29|
              |GROUPP;quotient;%L%;32| (208 . |entries|) (213 . |concat|)
              |GROUPP;quotient;%L%;33| (219 . |concat|) (225 . |concat|)
              |GROUPP;directProduct;3%;34| (|PositiveInteger|)
              |GROUPP;cyclicGroup;Pi%;35| |GROUPP;dihedralGroup;Pi%;36|
              |GROUPP;symmetricGroup;Pi%;37| (|TwoDimensionalArray| 18)
              (230 . |coerce|) (235 . |nrows|) (|Union| % '"failed")
              (240 . |subtractIfCan|) (246 . |vertSplit|) (|List| 81)
              (252 . |elt|) (258 . |maxColIndex|) (|List| 7) (263 . |coerce|)
              (268 . |maxRowIndex|) (273 . |new|) (|OneDimensionalArray| 18)
              (280 . |new|) (286 . |coerce|) (291 . |elt|) (297 . |coerce|)
              (302 . |ncols|) (307 . |elt|) (314 . |setelt!|)
              (322 . |horizSplit|) (328 . |horizConcat|) (334 . |concat|)
              (340 . |row|) (346 . |coerce|) (|Vector| 24) (351 . |coerce|)
              (356 . |elt|) (|Permutation| 23) (362 . |coerceImages|)
              (|List| 110) (|PermutationGroup| 23) (367 . |permutationGroup|)
              (|Union| 113 '"failed") |GROUPP;toPermutationIfCan;%BU;47|
              |GROUPP;toPermutationIfCan;%U;46|
              |GROUPP;toPermutationIfCan;%LBU;49| (372 . |1|) (376 . |concat|)
              (382 . |coerce|) (387 . |parts|))
           '#(~= 392 |toPermutationIfCan| 398 |symmetricGroup| 416 |simplify|
              421 |refactor| 432 |quotient| 437 |latex| 449 |groupPresentation|
              454 |directProduct| 469 |dihedralGroup| 475 |cyclicGroup| 480
              |coerce| 485 = 490)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 39) (|BasicType|))
                        (|makeByteWordVec2| 122
                                            '(1 8 0 7 9 1 15 0 14 16 1 8 7 0 17
                                              1 8 18 0 19 2 21 0 0 20 22 2 24 0
                                              0 23 25 2 10 0 0 24 26 1 28 0 7
                                              29 2 28 30 0 0 31 1 10 10 0 32 1
                                              33 0 10 34 2 33 30 0 0 35 2 15 37
                                              0 23 38 1 37 39 0 40 1 39 0 23 41
                                              2 39 0 0 0 42 1 39 0 15 43 1 39 0
                                              14 44 2 45 0 0 39 46 1 39 0 14 47
                                              1 39 0 14 48 2 24 30 23 0 49 2 7
                                              0 0 18 50 2 8 0 18 0 51 2 24 0 23
                                              0 52 1 39 53 0 54 1 24 23 0 55 1
                                              23 23 0 56 2 23 30 0 0 57 2 18 30
                                              0 0 58 2 24 30 0 0 59 1 24 0 0 60
                                              1 24 39 0 61 1 7 18 0 62 2 7 18 0
                                              23 63 2 10 24 0 23 64 1 18 39 0
                                              66 2 24 0 0 0 67 1 7 7 0 71 2 10
                                              0 0 0 72 2 7 0 0 0 74 1 10 0 14
                                              75 1 81 39 0 82 1 81 18 0 83 2 18
                                              84 0 0 85 2 81 14 0 7 86 2 87 81
                                              0 23 88 1 81 23 0 89 1 90 39 0 91
                                              1 81 23 0 92 3 81 0 18 18 18 93 2
                                              94 0 18 18 95 1 23 39 0 96 2 94
                                              18 0 23 97 1 7 39 0 98 1 81 18 0
                                              99 3 81 18 0 23 23 100 4 81 18 0
                                              23 23 18 101 2 81 14 0 77 102 2
                                              81 0 0 0 103 2 87 0 0 81 104 2 81
                                              94 0 23 105 1 94 39 0 106 1 107
                                              39 0 108 2 107 24 0 23 109 1 110
                                              0 24 111 1 113 0 112 114 0 110 0
                                              119 2 90 0 0 0 120 1 87 39 0 121
                                              1 8 7 0 122 2 0 30 0 0 1 1 0 115
                                              0 117 3 0 115 0 10 30 118 2 0 115
                                              0 30 116 1 0 0 77 80 1 0 0 0 69 2
                                              0 0 0 30 68 1 0 0 0 27 2 0 0 0 10
                                              73 2 0 0 0 7 70 1 0 15 0 1 2 0 0
                                              7 10 11 0 0 0 13 1 0 0 7 12 2 0 0
                                              0 0 76 1 0 0 77 79 1 0 0 77 78 1
                                              0 39 0 65 2 0 30 0 0 36)))))
           '|lookupComplete|)) 
